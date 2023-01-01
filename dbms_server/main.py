from flask import Flask
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
    cur.execute("SELECT * FROM blogs")
    result = cur.fetchall()
    for item in result:
        print(item)
    return result[0]

if __name__ == "__main__":
    app.run(debug=True)
    
    







