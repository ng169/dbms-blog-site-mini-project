from flask import Blueprint, request, jsonify, redirect, url_for, render_template
from __main__ import mysql

user_blueprint = Blueprint("user", __name__, static_folder="static", template_folder="templates")


@user_blueprint.route("/users", methods=["GET"])
def users():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM user")
    user_data = cur.fetchall()
    cur.execute("SELECT * FROM userlogin")
    login_data = cur.fetchall()
    return jsonify(user=user_data, login=login_data)


@user_blueprint.route("/users/add", methods=["GET", "POST"])
def add_user():
    cur = mysql.connection.cursor()
    if request.method == "POST":
        name = request.form.get("name")
        email = request.form.get("email")
        phnum = request.form.get("phnum")
        password = request.form.get("password")
        prof_pic = request.form.get("prof_pic")
        cur.execute("INSERT INTO user (name, ph_num) VALUES (%s, %s)", (name, phnum))
        if prof_pic != "":
            cur.execute("INSERT INTO user (prof_pic) VALUES (%s)", prof_pic)
        cur.execute("INSERT INTO userlogin (email_id, password) VALUES (%s, %s)", (email, password))
        mysql.connection.commit()
        return redirect(url_for("user_blueprint.users"))
    return render_template("register.html")


@user_blueprint.route("/user/update/<int:user_id>", methods=["GET", "POST"])
def update_user(user_id):
    cur = mysql.connection.cursor()
    if request.method == "POST":
        name = request.form.get("name")
        email = request.form.get("email")
        phnum = request.form.get("phnum")
        password = request.form.get("password")
        prof_pic = request.form.get("prof_pic")
        cur.execute("UPDATE user SET name =%s, ph_num=%s, prof_pic = %s WHERE uid = %s",
                    (name, phnum, prof_pic, user_id))
        cur.execute("UPDATE userlogin SET email_id = %s, password = %s WHERE uid = %s", (email, password, user_id))
        mysql.connection.commit()
        return redirect(url_for("user_blueprint.users"))
    return render_template("update_user.html")


@user_blueprint.route("/user/delete/<int:user_id>", methods=["GET"])
def delete_user(user_id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM user WHERE uid = %s", (user_id))
    mysql.connection.commit()
    return redirect(url_for("user_blueprint.users"))
