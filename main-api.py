from flask import Flask,jsonify,request,render_template
from flask_mysqldb import MySQL

app = Flask(__name__)

# Configuration settings
app.config['MYSQL_USER'] = 'ng169'
app.config['MYSQL_PASSWORD'] = 'test123'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'blogsite'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL()
# Initialize the extension
mysql.init_app(app)

@app.route('/')
def home():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM blog")
    result = cur.fetchall()
    return jsonify(blog = result)

# create,read,update and delete user and user login
@app.route("/user",methods=["GET","POST","PUT","DELETE"])
def user():
    cur = mysql.connection.cursor()
    if request.method == "POST":
        name = request.form.get("name")
        email = request.form.get("email")
        phnum = request.form.get("phnum")
        password = request.form.get("password")
        prof_pic = request.form.get("prof_pic")
        cur.execute("INSERT INTO user (name, ph_num) VALUES (%s, %s)",(name,phnum))
        if prof_pic != "":
            cur.execute("INSERT INTO user (prof_pic) VALUES (%s)",(prof_pic))
        cur.execute("INSERT INTO userlogin (email_id, password) VALUES (%s, %s)",(email,password))
        mysql.connection.commit()
    elif request.method == "PUT":
        name = request.form.get("name")
        email = request.form.get("email")
        phnum = request.form.get("phnum")
        password = request.form.get("password")
        prof_pic = request.form.get("prof_pic")
        user_id = request.args.get("user_id")
        cur.execute("UPDATE user SET name =%s, ph_num=%s, prof_pic = %s WHERE uid = %s",(name,phnum,prof_pic,user_id))
        cur.execute("UPDATE userlogin SET email_id = %s, password = %s WHERE uid = %s",(email,password,user_id))
        mysql.connection.commit()
    elif request.method == "DELETE":
        user_id = request.args.get("user_id")
        cur.execute("DELETE FROM user WHERE uid = %s",(user_id))
        mysql.connection.commit()
    cur.execute("SELECT * FROM user")
    user_data = cur.fetchall()
    cur.execute("SELECT * FROM userlogin")
    login_data = cur.fetchall()
    return jsonify(user = user_data,login = login_data)

#create,read,update and delete blog
@app.route("/blog/",methods=["GET","POST","PUT","DELETE"])
def blog():
    cur = mysql.connection.cursor()
    if request.method == "POST":
        title = request.form.get("title")
        subtitle = request.form.get("subtitle")
        content = request.form.get("content")
        user_id = request.args.get("user_id")
        cur.execute("INSERT INTO blog (title,subtitle,content,author_id) VALUES (%s, %s,%s,%s)",(title,subtitle,content,user_id))
        mysql.connection.commit()
    elif request.method == "PUT":
        title = request.form.get("title")
        subtitle = request.form.get("subtitle")
        content = request.form.get("content")
        blog_id = request.args.get("blog_id")
        cur.execute("UPDATE blog SET title = %s ,subtitle = %s ,content = %s WHERE blog_id = %s ",(title,subtitle,content,blog_id))
        mysql.connection.commit()
    elif request.method == "DELETE":
        blog_id = request.args.get("blog_id")
        cur.execute("DELETE FROM blog WHERE blog_id = %s",(blog_id))
        mysql.connection.commit()
    cur.execute("SELECT * FROM blog")
    blog_data = cur.fetchall()
    return jsonify(blog = blog_data)

#create ,read and update blog categories for a blog
@app.route("/blog/category/",methods=["GET","POST","PUT"])
def blog_category():
    cur = mysql.connection.cursor()
    blog_id = request.args.get("blog_id")
    if request.method == "POST":
        category_list = request.form.getlist("category")
        for category_id in category_list:
            cur.execute("INSERT INTO blog_category VALUES (%s,%s)",(blog_id,int(category_id)))
        mysql.connection.commit()
    elif request.method == "PUT":
        cur.execute("DELETE FROM blog_category WHERE blog_id_cb = %s",(blog_id))
        category_list = request.form.getlist("category")
        for category_id in category_list:
            cur.execute("INSERT INTO blog_category VALUES (%s,%s)",(blog_id,int(category_id)))
        mysql.connection.commit()
    cur.execute("SELECT * FROM blog_category WHERE blog_id_cb = %s",(blog_id))
    blog_cat_data = cur.fetchall()
    return jsonify(blog_cat = blog_cat_data)

#create,read and delete categories
@app.route("/category/",methods=["GET","POST","DELETE"])
def category():
    cur = mysql.connection.cursor()
    if request.method == "POST":
        name = request.form.get("name")
        cur.execute("INSERT INTO category (name) VALUES (%s)",(name))
        mysql.connection.commit()
    elif request.method == "DELETE":
        category_id = request.args.get("cid")
        cur.execute("DELETE FROM category WHERE category_id = %s",(category_id))
        mysql.connection.commit()    
    cur.execute("SELECT * FROM category")
    category_data = cur.fetchall()
    return jsonify(category = category_data)  

#create,read and delete bookmarks
@app.route("/blog/bookmark",methods=["GET","POST","DELETE"])
def bookmark():
    cur = mysql.connection.cursor()
    user_id = request.args.get("user_id")
    if(request.method == "POST"):
        blog_id = request.args.get("blog_id")
        cur.execute("INSERT INTO bookmark VALUES (%s, %s)",(user_id,blog_id))
    elif request.method == "DELETE":
        blog_id = request.args.get("blog_id")
        cur.execute("DELETE FROM bookmark WHERE uid_bk = %s AND blog_id_bk = %s",(user_id,blog_id))
    mysql.connection.commit()
    cur.execute("SELECT * FROM bookmark WHERE uid_bk = %s",(user_id))
    bookmark_data = cur.fetchall()
    return jsonify(bookmark = bookmark_data)

#create,read,update and delete comment
@app.route("/comment",methods=["GET","POST","PUT","DELETE"])
def comment():
    cur = mysql.connection.cursor()
    user_id = request.args.get("user_id")
    blog_id = request.args.get("blog_id")
    if request.method == "POST":
        content = request.form.get("content")
        cur.execute("INSERT INTO comment(content,blog_id_comment,uid_comment) VALUES (%s,%s, %s)",(content,blog_id,user_id))
    elif request.method == "PUT":
        content = request.form.get("content")
        cur.execute("UPDATE comment SET content = %s WHERE blog_id_comment = %s AND uid_comment = %s",(content,blog_id,user_id))
    elif request.method == "DELETE":
        comment_id = request.args.get("comment_id")
        cur.execute("DELETE FROM comment WHERE id = %s",(comment_id))
    mysql.connection.commit()
    cur.execute("SELECT * FROM comment WHERE blog_id_comment = %s AND uid_comment = %s",(blog_id,user_id))
    comment_data = cur.fetchall()
    return jsonify(comment = comment_data)

#create,read, delete notifications
@app.route("/notification",methods=["GET","POST","DELETE"])
def notification():
    cur = mysql.connection.cursor()
    user_id = request.args.get("user_id")
    title = request.body.get("title")
    if request.method == "POST":
        desc = request.body.get("desc")
        cur.execute("INSERT INTO notification VALUES (%s,%s,%s)",(title,desc,user_id))
    elif request.method == "DELETE":
        cur.execute("DELETE FROM notification WHERE title = %s AND uid_notif = %s",(title,user_id))
    mysql.connection.commit()
    cur.execute("SELECT * FROM notification WHERE uid_notif= %s",(user_id))
    notification_data = cur.fetchall()
    return jsonify(notifications = notification_data) 

#create,read,update and delete draft
@app.route("/draft/")
def draft():
    cur = mysql.connection.cursor()
    user_id = request.args.get("user_id")
    if request.method == "POST":
        title = request.form.get("title")
        content = request.form.get("content")
        cur.execute("INSERT INTO draft (title,content,uid_draft) VALUES (%s,%s,%s)",(title,content,user_id))
    elif request.method == "PUT":
        title = request.form.get("title")
        subtitle = request.form.get("subtitle")
        content = request.form.get("content")
        blog_id = request.args.get("blog_id")
        cur.execute("UPDATE draft SET title = %s ,content = %s WHERE blog_id = %s ",(title,content,blog_id))
    elif request.method == "DELETE":
        draft_id = request.args.get("draft_id")
        cur.execute("DELETE FROM draft WHERE draft_id = %s",(draft_id))
    mysql.connection.commit()
    cur.execute("SELECT * FROM draft WHERE uid_draft =%s",(user_id))
    draft_data = cur.fetchall()
    return jsonify(drafts = draft_data)

#create,read,delete subscribers
@app.route("/subscribe")
def subscribe():
    cur = mysql.connection.cursor()
    author_id = request.args.get("author_id")
    if request.method == "POST":
        subscriber_id = request.args.get("subscriber_id")
        cur.execute("INSERT INTO subscriber (author_id, subscriber_id) VALUES (%s, %s)",(author_id,subscriber_id))
    elif request.method == "DELETE":
        subscriber_id = request.args.get("subscriber_id")
        cur.execute("DELETE FROM subscriber where author_id = %s AND subscriber_id = %s",(author_id,subscriber_id))
    mysql.connection.commit()
    cur.execute("SELECT * FROM subscriber WHERE author_id =%s",(author_id))
    subs_data =  cur.fetchall()
    return jsonify(subscribers = subs_data)


if __name__ == "__main__":
    app.run(debug=True)
    
    







