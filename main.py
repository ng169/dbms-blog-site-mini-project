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
    blogs = cur.fetchall()
    return render_template("index.html",all_blogs = blogs)

if __name__ == "__main__":
    app.run(debug=True)
    