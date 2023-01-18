from flask import request


def add_blog_category(blog_id, cur):
    category_list = request.form.getlist("categories")
    for category_id in category_list:
        cur.execute("INSERT INTO blog_category VALUES (%s,%s)", (blog_id, int(category_id)))


def send_notification(author_id, blog_title, cur):
    cur.execute(f"SELECT name from user where uid = {author_id}")
    author_name = cur.fetchone()
    author_name = author_name['name']
    cur.execute(f"SELECT subscriber_id from subscriber where author_id = {author_id}")
    subs = cur.fetchall()
    subs_id = [sub['subscriber_id'] for sub in subs]
    notif_title = f"NEW BLOG FROM {author_name}"
    notif_description = f"{author_name} has posted a blog on {blog_title}"
    for sub_id in subs_id:
        cur.execute(f"INSERT into notification(title,description,uid_notif) VALUES ('{notif_title}','{notif_description}',{sub_id})")


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
