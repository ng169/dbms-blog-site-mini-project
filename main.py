import os

from dateutil import parser
from flask import Flask, request, render_template, redirect, url_for, flash
from flask_ckeditor import CKEditor
from flask_login import LoginManager, UserMixin, login_user, logout_user, current_user, login_required
from flask_mysqldb import MySQL

from forms import LoginForm, RegisterForm, CreateBlogForm, CreateCommentForm, CreateCategoryForm
from helper import add_blog_category, send_notification

app = Flask(__name__)

# Configuration settings
app.config['MYSQL_USER'] = 'ng169'
app.config['MYSQL_PASSWORD'] = 'test123'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'blogsite'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL()
mysql.init_app(app)

app.config['SECRET_KEY'] = 'thisisasecret'

# configure login manager
login_manager = LoginManager()
login_manager.init_app(app)

ckeditor = CKEditor(app)

ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}


# create a user model
class User(UserMixin):
    def __init__(self, user_id):
        self.id = user_id


@login_manager.user_loader
def load_user(user_id):
    # fetch user from MySQL database
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM user WHERE uid=%s', (user_id,))
    user = cur.fetchone()
    if user:
        return User(user['uid'])
    return None


@app.template_filter('strftime')
def _jinja2_filter_datetime(date, fmt=None):
    date = parser.parse(date)
    native = date.replace(tzinfo=None)
    format = '%b %d, %Y'
    return native.strftime(format)

@app.template_filter('notification_count')
def _jinja2_filter_notification_count(user, fmt=None):
    user_id = user.id
    cur = mysql.connection.cursor()
    cur.execute(f"SELECT count(*) as c from notification where uid_notif = {user_id}")
    count = cur.fetchone()
    return count["c"]


@app.route('/')
def home():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM blog,user WHERE blog.author_id = user.uid")
    blogs = cur.fetchall()
    user = None
    if current_user.is_authenticated:
        cur.execute(f"select * from user where uid = {current_user.id}")
        user = cur.fetchone()
    return render_template("index.html", all_blogs=blogs, user=user, current_user=current_user)


# ---------------------------AUTHENTICATION ---------------------------
@app.route('/login', methods=["GET", "POST"])
def login():
    login_form = LoginForm()
    cur = mysql.connection.cursor()
    if login_form.validate_on_submit():
        email = request.form.get("email")
        password = request.form.get("password")
        cur.execute(f"select * from userlogin where email_id = '{email}'")
        user = cur.fetchone()
        if user and user["password"] == password:
            user_obj = User(user['uid'])
            login_user(user_obj)
            return redirect(url_for("home"))
        else:
            flash("Wrong password")
    return render_template("auth/login.html", form=login_form)


@app.route('/register', methods=["GET", "POST"])
def register():
    register_form = RegisterForm()
    cur = mysql.connection.cursor()
    if register_form.validate_on_submit():
        name = request.form.get("name")
        email = request.form.get("email")
        phnum = request.form.get("phnum")
        password = request.form.get("password")
        file = request.files["photo"]
        prof_pic_name = "default_user.jpg"
        if file:
            prof_pic_name = file.filename
            file.save(os.path.join(app.root_path, 'static', 'images', file.filename))
        cur.execute("INSERT INTO user (name, ph_num, prof_pic) VALUES (%s, %s, %s)", (name, phnum, prof_pic_name))
        cur.execute("INSERT INTO userlogin (email_id, password) VALUES (%s, %s)", (email, password))
        mysql.connection.commit()
        return redirect(url_for("login"))
    return render_template("auth/register.html", form=register_form)


@app.route('/logout', methods=["GET", "POST"])
@login_required
def logout():
    logout_user()
    return redirect(url_for("home"))


# ---------------------------BLOG CRUD ---------------------------
@app.route('/blog/<int:blog_id>', methods=["GET"])
def blog(blog_id):
    cur = mysql.connection.cursor()
    cur.execute(f"SELECT * FROM blog,user where blog_id = {blog_id} and blog.author_id=user.uid")
    blog_post = cur.fetchone()
    cur.execute(f"SELECT * from comment,user WHERE blog_id_comment = {blog_id} and comment.uid_comment =user.uid ")
    comment_with_user = cur.fetchall()
    cur.execute(
        f"SELECT * FROM blog_category,category WHERE blog_id_cb = {blog_id} "
        f"and blog_category.cat_id_cb = category.category_id")
    categories = cur.fetchall()
    bkm_status = 0
    if current_user.is_authenticated:
        cur.execute(f"SELECT * FROM bookmark where uid_bk={current_user.id} and blog_id_bk={blog_id}")
        bkms = cur.fetchone()
        if bkms is not None:
            bkm_status = 1
        else:
            bkm_status = 2
    create_comment_form = CreateCommentForm()
    return render_template("blog/display.html", current_user=current_user, blog=blog_post, comments=comment_with_user,
                           categories=categories, bkm_status=bkm_status, form = create_comment_form)


@app.route('/blog/add', methods=["GET", "POST"])
@login_required
def add_blog():
    create_blog_form = CreateBlogForm()
    cur = mysql.connection.cursor()
    cur.execute(
        "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'blogsite' AND TABLE_NAME = 'blog'")
    blog_id = cur.fetchone()['AUTO_INCREMENT']
    if request.method == "POST":
        title = request.form.get("title")
        subtitle = request.form.get("subtitle")
        content = request.form.get("ckeditor")
        user_id = current_user.id
        cur.execute("INSERT INTO blog (title,subtitle,content,author_id) VALUES (%s, %s,%s,%s)",
                    (title, subtitle, content, user_id))
        mysql.connection.commit()
        add_blog_category(blog_id, cur)
        mysql.connection.commit()
        send_notification(user_id, title, cur)
        mysql.connection.commit()
        return redirect(url_for("home"))

    cur.execute("SELECT * FROM category")
    category_data = cur.fetchall()
    return render_template("blog/add.html", form=create_blog_form, blog_id=blog_id,
                           categories=category_data)


@app.route('/blog/edit/<int:blog_id>', methods=["GET", "POST"])
@login_required
def edit_blog(blog_id):
    create_blog_form = CreateBlogForm()
    cur = mysql.connection.cursor()
    if request.method == "POST":
        title = request.form.get("title")
        subtitle = request.form.get("subtitle")
        content = request.form.get("ckeditor")
        cur.execute("UPDATE blog SET title = %s ,subtitle = %s ,content = %s WHERE blog_id = %s ",
                    (title, subtitle, content, blog_id))
        mysql.connection.commit()
        add_blog_category(blog_id, cur)
        mysql.connection.commit()
        return redirect(url_for("blog", blog_id=blog_id))
    cur.execute(f"SELECT * FROM blog where blog_id = {blog_id}")
    blog_post = cur.fetchone()
    cur.execute(
        f"SELECT category.* "
        f"FROM category,blog_category "
        f"WHERE category.category_id = blog_category.cat_id_cb AND blog_id_cb = {blog_id}")
    present_categories = cur.fetchall()
    cur.execute(f"select * from category")
    all_categories = cur.fetchall()

    return render_template("blog/edit.html", blog=blog_post, form=create_blog_form, categories=present_categories,
                           all_cat=all_categories)


@app.route('/blog/delete/<int:blog_id>', methods=["GET"])
@login_required
def delete_blog(blog_id):
    cur = mysql.connection.cursor()
    cur.execute(f"DELETE FROM blog WHERE blog_id = {blog_id}")
    mysql.connection.commit()
    return redirect(url_for("home"))


# ---------------------------COMMENTS CRD ---------------------------
@app.route('/blog/<int:blog_id>/comment/add', methods=["POST"])
def add_comment(blog_id):
    cur = mysql.connection.cursor()
    create_comment_form = CreateCommentForm()
    if create_comment_form.validate_on_submit():
        content = request.form.get("content")
        cur.execute(
            "INSERT INTO `blogsite`.`comment` (`content`, `blog_id_comment`, `uid_comment`) VALUES (%s, %s, %s)",
            (content, blog_id, current_user.id))
        mysql.connection.commit()
        return redirect(url_for("blog", blog_id=blog_id))


@app.route('/blog/<int:blog_id>/comment/<int:comment_id>/delete', methods=["GET", "POST"])
def delete_comment(blog_id, comment_id):
    cur = mysql.connection.cursor()
    cur.execute(f"DELETE FROM comment WHERE id= {comment_id}")
    mysql.connection.commit()
    return redirect(url_for("blog", blog_id=blog_id))


# ---------------------------CATEGORIES CRD ---------------------------
@app.route('/categories', methods=["GET", "POST"])
def add_category():
    cur = mysql.connection.cursor()
    form = CreateCategoryForm()
    if current_user.is_authenticated and form.validate_on_submit():
        name = request.form.get("name")
        cur.execute(f"INSERT INTO category (name) VALUES ('{name}')", )
        mysql.connection.commit()
    cur.execute("SELECT * FROM category")
    category_data = cur.fetchall()
    return render_template("category/add.html", form=form, categories=category_data)


@app.route('/categories/delete/<int:cat_id>', methods=["GET"])
def delete_category(cat_id):
    cur = mysql.connection.cursor()
    cur.execute(f"DELETE FROM category WHERE category_id = {cat_id}")
    mysql.connection.commit()
    return redirect(url_for("add_category"))


@app.route('/blog/edit/<int:blog_id>/category/delete/<int:cat_id>')
def delete_blog_category(blog_id, cat_id):
    cur = mysql.connection.cursor()
    cur.execute(f"DELETE FROM blog_category WHERE cat_id_cb = {cat_id} and blog_id_cb = {blog_id}")
    mysql.connection.commit()
    return redirect(url_for("edit_blog", blog_id=blog_id))


# -------------------------PROFILE,SUBSCRIBE-----------------------
@app.route('/user/<int:user_id>')
def profile(user_id):
    cur = mysql.connection.cursor()
    cur.execute(f"SELECT * FROM user,userlogin where user.uid = {user_id} and userlogin.uid = user.uid")
    user = cur.fetchone()
    cur.execute(f"SELECT subscriber_id FROM subscriber where author_id = {user_id}")
    subs = cur.fetchall()
    subs_id = [sub['subscriber_id'] for sub in subs]
    sub_status = -1
    if not current_user.is_authenticated or current_user.id == user_id:
        sub_status = 0  # No button
    else:
        if current_user.id in subs_id:
            sub_status = 2  # already subbed
        else:
            sub_status = 1
    cur.execute(f"SELECT * from blog where author_id = {user_id}")
    all_blogs = cur.fetchall()

    cur.execute(f"SELECT * from subscriber,user where subscriber_id = {user_id} and user.uid = subscriber.author_id")
    subscribed = cur.fetchall()
    return render_template("user/profile.html", user=user, current_user=current_user, sub_status=sub_status,
                           all_blogs=all_blogs, subscribed=subscribed)


@app.route('/user/<int:author_id>/subscribe/<int:subscriber_id>', methods=["GET"])
def subscribe(author_id, subscriber_id):
    cur = mysql.connection.cursor()
    cur.execute(f"INSERT into subscriber values({author_id},{subscriber_id})")
    mysql.connection.commit()
    return redirect(url_for("profile", user_id=author_id))


@app.route('/user/<int:author_id>/unsubscribe/<int:subscriber_id>', methods=['GET'])
def unsubscribe(author_id, subscriber_id):
    cur = mysql.connection.cursor()
    cur.execute(f"DELETE from subscriber where author_id = {author_id} and subscriber_id = {subscriber_id}")
    mysql.connection.commit()
    return redirect(url_for("profile", user_id=author_id))


# -------------------------NOTIFICATIONS-------------------------

@app.route('/notification')
@login_required
def notification():
    cur = mysql.connection.cursor()
    cur.execute(f"SELECT * from notification where uid_notif = {current_user.id}")
    notifications = cur.fetchall()
    return render_template("user/notification.html", notifications=notifications)


@app.route('/notification/delete/<int:notif_id>')
@login_required
def del_notification(notif_id):
    cur = mysql.connection.cursor()
    cur.execute(f"DELETE from notification where notif_id = {notif_id}")
    mysql.connection.commit()
    return redirect(url_for('notification'))


# -------------------------BOOKMARKS-------------------------
@app.route('/bookmarks')
@login_required
def bookmarks():
    cur = mysql.connection.cursor()
    cur.execute(
        f"SELECT blog.*,bookmark.*,user.name from blog,bookmark,user where uid_bk = {current_user.id} and blog_id = blog_id_bk and blog.author_id = user.uid")
    bkms = cur.fetchall()
    cur.execute("SELECT * FROM blog,user WHERE blog.author_id = user.uid LIMIT 6")
    suggest_blogs = cur.fetchall()
    cur.execute(f"SELECT count(*) as cnt from bookmark where uid_bk = {current_user.id}")
    count = cur.fetchone()
    return render_template("user/bookmark.html", bkms=bkms, suggest_blogs=suggest_blogs, count=count["cnt"])


@app.route('/bookmarks/add/<int:blog_id>')
@login_required
def add_bookmarks(blog_id):
    cur = mysql.connection.cursor()
    cur.execute(f"INSERT into bookmark values({current_user.id},{blog_id})")
    mysql.connection.commit()
    return redirect(url_for('blog', blog_id=blog_id))


@app.route('/bookmarks/delete/<int:blog_id>')
@login_required
def del_bookmarks(blog_id):
    cur = mysql.connection.cursor()
    cur.execute(f"DELETE from bookmark where blog_id_bk = {blog_id} and uid_bk = {current_user.id}")
    mysql.connection.commit()
    return redirect(url_for('blog', blog_id=blog_id))


if __name__ == "__main__":
    app.run(debug=True, port=5173)
