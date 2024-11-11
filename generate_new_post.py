# Run this script to automatically populate the website code with a new post!

import os
import re
import subprocess
from datetime import datetime
from mysql.connector import connect

DIR = os.path.dirname(__file__)
MYSQL_ROOT_PW = os.getenv('MYSQL_ROOT_PW')

def main():
    db = connect(
        host="localhost",
        user="root",
        password="",
        database="website"
    )
    cursor = db.cursor()

    # SQL Statements
    get_post_names = "SELECT name FROM posts;"
    create_new_post = "INSERT INTO posts (name, title, date, headliner, content) VALUES (%s, %s, %s, %s, %s);"
    update_post = "UPDATE posts SET title = %s, headliner = %s, content = %s WHERE name = %s;"
    get_post_id = "SELECT id FROM posts WHERE name = %s;"
    get_category_names = "SELECT name FROM categories WHERE post_id = %s;"
    add_category = "INSERT INTO categories (post_id, name) VALUES (%s, %s);"

    # Add all posts in the "posts" directory to the database
    for root, _, files in os.walk(os.path.join(DIR, "posts/")):
        for file in files:
            post_name = os.path.basename(os.path.splitext(file)[0])
            post_date = datetime.now()
            with open(os.path.join(root, file), 'r') as fp:
                post_content = fp.read()
                post_title = re.findall(r"^# (.*)", post_content)[0] # TODO: add a better error message
                post_headliner = re.findall(r"\n\n(.*)\n", post_content)[0] # TODO: add a better error message
                post_categories = re.findall(r"<!-- Categories:(.*) -->", post_content)[0].split(',') # TODO: add a better error message
            cursor.execute(get_post_names)
            existing_posts = [name[0] for name in cursor.fetchall()]
            if post_name in existing_posts:
                cursor.execute(update_post, (post_title, post_headliner, post_content, post_name))
                print(f"Updated {post_name} in database.")
            else:
                cursor.execute(create_new_post, (post_name, post_title, post_date, post_headliner, post_content))
                print(f"Added {post_name} to database.")
            
            cursor.execute(get_post_id, (post_name,))
            post_id = cursor.fetchall()[0][0]
            cursor.execute(get_category_names, (post_id,))
            existing_categories = [name[0] for name in cursor.fetchall()]
            for category in post_categories:
                if category not in existing_categories:
                    cursor.execute(add_category, (post_id, category))
                    print(f"Added new category {category} to database.")

            db.commit()

    # Export the database
    ps = subprocess.run(['sudo', 'mysqldump', 'website'], capture_output=True)
    ps.check_returncode()
    with open(os.path.join(DIR, 'database/backup.sql'), 'wb') as fp:
        fp.write(ps.stdout)

if __name__ == '__main__':
    main()
