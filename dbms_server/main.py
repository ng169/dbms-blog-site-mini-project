from flask import Flask,jsonify,request,render_template
from flask_cors import CORS, cross_origin
from flask_mysqldb import MySQL

app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

# Configuration settings
app.config['MYSQL_USER'] = 'ng169'
app.config['MYSQL_PASSWORD'] = 'test123'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'blogsite'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL()
# Initialize the extension
mysql.init_app(app)

@app.route('/api')
@cross_origin()
def home():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM blog")
    result = cur.fetchall()
    return jsonify(blog = result)

@app.route('/api/user',methods = ["GET","POST"])
def user():
    cur = mysql.connection.cursor()
    if(request.method == "POST"):
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
    return render_template("test.html")

@app.route('/api/blog',methods = ["GET","POST"])
def blog():
    cur = mysql.connection.cursor()
    if(request.method == "POST"):
        title = request.form.get("title")
        subtitle = request.form.get("subtitle")
        content = request.form.get("content")
        cur.execute("INSERT INTO blog (title,subtitle,content,author_id) VALUES (%s, %s,%s,%s)",(title,subtitle,content,1))
        mysql.connection.commit()
    return render_template("test.html")

@app.route('/api/category',methods = ["GET","POST"])
def category():
    cur = mysql.connection.cursor()
    if(request.method == "POST"):
        name = request.form.get("name")
        cur.execute("INSERT INTO category (name) VALUES (%s)",(name))
        mysql.connection.commit()
    return render_template("test.html")

@app.route('/api/blogCategory/<int:blog_id>',methods = ["GET","POST"])
def blog_category(blog_id):
    cur = mysql.connection.cursor()
    if(request.method == "POST"):
        category_id = int(request.form.get("category"))
        cur.execute("INSERT INTO blog_category VALUES (%s,%s)",(blog_id,category_id))
        mysql.connection.commit()
    return render_template("test.html")

if __name__ == "__main__":
    app.run(debug=True)
    
    







