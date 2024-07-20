import os
import re
import subprocess
from datetime import datetime
from mysql.connector import connect

DIR = os.path.dirname(__file__)

db = connect(
    host="localhost",
    user="root",
    password="password",
    database="website"
)

cursor = db.cursor()

get_post_names = "SELECT name FROM posts;"
create_new_post = "INSERT INTO posts (name, title, date, content) VALUES (%s, %s, %s, %s);"

# Add all posts in the "posts" directory to the database
for root, _, files in os.walk(os.path.join(DIR, "posts/")):
    for file in files:
        post_name = os.path.basename(os.path.splitext(file)[0])
        cursor.execute(get_post_names)
        existing_posts = [name[0] for name in cursor.fetchall()]
        if post_name in existing_posts:
            continue
        with open(os.path.join(root, file), 'w') as fp:
            post_content = fp.read()
            post_date = datetime.now()
            post_title = re.findall("^# (.*)", post_content)[0] # TODO: add a better error message
            cursor.execute(create_new_post, (post_name, post_title, post_date, post_content))
        print(f"Added {post_name} to database.")
        db.commit()

# Export the database
ps = subprocess.run(['mysqldump', '-u', 'root', '--password=password', 'website'], capture_output=True)
ps.check_returncode()
with open(os.path.join(DIR, 'database/backup.sql'), 'wb') as fp:
    fp.write(ps.stdout)
