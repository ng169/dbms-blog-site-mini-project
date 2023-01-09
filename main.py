from flask import Flask, jsonify, request, render_template, redirect, url_for
from flask_mysqldb import MySQL
from forms import LoginForm, RegisterForm
from flask_login import LoginManager, UserMixin, login_user, logout_user, current_user, login_required

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


@app.route('/')
def home():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM blog")
    blogs = cur.fetchall()
    user = None
    if current_user.is_authenticated:
        cur.execute(f"select * from user where uid = {current_user.id}")
        user = cur.fetchone()
    return render_template("index.html", all_blogs=blogs, user=user)


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
        cur.execute("INSERT INTO user (name, ph_num) VALUES (%s, %s)", (name, phnum))
        cur.execute("INSERT INTO userlogin (email_id, password) VALUES (%s, %s)", (email, password))
        mysql.connection.commit()
        return redirect(url_for("login"))
    return render_template("auth/register.html", form=register_form)


@app.route('/logout', methods=["GET", "POST"])
@login_required
def logout():
    logout_user()
    return redirect(url_for("home"))




if __name__ == "__main__":
    app.run(debug=True, port=5173)
