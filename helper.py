from flask import request


def add_blog_category(blog_id, cur):
    category_list = request.form.getlist("categories")
    for category_id in category_list:
        cur.execute("INSERT INTO blog_category VALUES (%s,%s)", (blog_id, int(category_id)))