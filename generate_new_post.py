# Run this script to automatically populate the website with a new post!

import sys
import os
import subprocess
import re
from datetime import datetime
from argparse import ArgumentParser

def main(post_name, post_title=None, categories=None):
    html_name = os.path.join(os.path.dirname(__file__), f"posts/{post_name}.html")
    md_name = os.path.join(os.path.dirname(__file__), f"posts/{post_name}.md")
    if not os.path.exists(md_name):
        raise AssertionError(f"Please create a {post_name}.md file in the posts/ directory.")
    if not post_title:
        with open(md_name, "r") as fp:
            post_title = re.sub("^#+", "", fp.readlines()[0]).strip()
    if not categories:
        categories = []

    # Convert markdown to html
    args = ["pandoc", "--wrap=none", "--ascii=true", "-f", "markdown", "-t", "html", "-o", html_name, md_name]
    subprocess.run(args)

    # Create post page
    with open(html_name, "r") as fp:
        post_html = fp.read()
    post_page = "<!DOCTYPE html>\n\
<html>\n\
    <head>\n\
        <title>&#387;u&#7433;&#670;&#596;&#592;H &#477;qn&#390;-&#647;&#477;&#387;p&#7433;&#8498;</title>\n\
        <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"/img/favicon.ico\">\n\
        <meta name=\"description\" content=\"Fidget-Cube Homepage\">\n\
        <link rel=\"stylesheet\" href=\"/css/style.css\">\n\
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n\
    </head>\n\
    <body>\n\
        <?php include \"../modules/header.html\"?>\n\
        <div class=\"blog_post\">\n\
            {}\n\
        </div>\n\
    </body>\n\
</html>\n".format(re.sub('\n', '\n            ', post_html).strip())
    with open(os.path.join(os.path.dirname(__file__), f"frontend/posts/{post_name}.php"), "w") as fp:
        fp.write(post_page)

    # Add post summary module
    category_list = ""
    for category in categories:
        if category == categories[-1]:
            category_list += f"    <a id=\"category\" href=\"/categories/{category.lower()}.php\">{category}</a>\n"
        else:
            category_list += f"    <a id=\"category\" href=\"/categories/{category.lower()}.php\">{category}</a>, \n"
    post_summary = f"<h2 id=\"title\">\n\
    <a href=\"/posts/{post_name}.php\">{post_title}</a>\n\
</h2>\n\
{re.findall('<p>.*</p>', post_html)[0]}\n\
{re.findall('<p>.*</p>', post_html)[1]}\n\
<span id=\"category\">\n\
    <time datetime=\"{datetime.now().strftime('%Y-%m-%dT%H:%M:%S-07:00')}\">{datetime.now().strftime('%b %d %Y')} -- </time>\n\
{category_list}\
</span>"
    with open(os.path.join(os.path.dirname(__file__), f"frontend/modules/posts/{post_name}.html"), "w") as fp:
        fp.write(post_summary)

    # Add post to directory.php
    with open(os.path.join(os.path.dirname(__file__), f"frontend/posts/directory.php"), "r") as fp:
        directory = fp.read()
    directory_listing = f"<ul id=\"description\">\n\
                        <li>\n\
                            <span>\n\
                                <time datetime=\"{datetime.now().strftime('%Y-%m-%dT%H:%M:%S-07:00')}\">{datetime.now().strftime('%b %d %Y')} -- </time>\n\
                                <a href=\"/posts/{post_name}.php\">{post_title}</a>\n\
                            </span>\n\
                        </li>\n"
    updated_directory = re.sub("<ul id=\"description\">\n", directory_listing, directory)
    with open(os.path.join(os.path.dirname(__file__), f"frontend/posts/directory.php"), "w") as fp:
        fp.write(updated_directory)

    # Add post to index.php
    with open(os.path.join(os.path.dirname(__file__), f"frontend/index.php"), "r") as fp:
        homepage = fp.read()
    homepage_listing = f"<ul>\n\
                    <li>\n\
                        <?php include \"./modules/posts/{post_name}.html\"?>\n\
                    </li>\n"
    updated_homepage = re.sub("<ul>\n", homepage_listing, homepage)
    with open(os.path.join(os.path.dirname(__file__), f"frontend/index.php"), "w") as fp:
        fp.write(updated_homepage)

    for category in categories:
        # Check for existence of category
        if os.path.exists(os.path.join(os.path.dirname(__file__), f"frontend/categories/{category.lower()}.php")):
            # If exists, add to the category page
            with open(os.path.join(os.path.dirname(__file__), f"frontend/categories/{category.lower()}.php"), "r") as fp:
                category_page = fp.read()
            category_page_listing = f"<ul>\n\
                    <li>\n\
                        <?php include \"../modules/posts/{post_name}.html\"?>\n\
                    </li>\n"
            updated_category_page = re.sub("<ul>\n", category_page_listing, category_page)
            with open(os.path.join(os.path.dirname(__file__), f"frontend/categories/{category.lower()}.php"), "w") as fp:
                fp.write(updated_category_page)
        else:
            # If doesn't exist, create a new category page...
            category_page = f"<!DOCTYPE html>\n\
<html>\n\
    <head>\n\
        <title>&#387;u&#7433;&#670;&#596;&#592;H &#477;qn&#390;-&#647;&#477;&#387;p&#7433;&#8498;</title>\n\
        <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"/img/favicon.ico\">\n\
        <meta name=\"description\" content=\"Fidget-Cube Homepage\">\n\
        <link rel=\"stylesheet\" href=\"/css/style.css\">\n\
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n\
    </head>\n\
    <body>\n\
        <?php include \"../modules/header.html\"?>\n\
        <span>\n\
            <div class=\"feed\">\n\
                <h2 class=\"category_title\">\n\
                    Category: {category}\n\
                </h2>\n\
                <ul>\n\
                    <li>\n\
                        <?php include \"../modules/posts/{post_name}.html\"?>\n\
                    </li>\n\
                </ul>\n\
            </div>\n\
            <?php include \"../modules/sidebar.html\"?>\n\
        </span>\n\
    </body>\n\
</html>"
            with open(os.path.join(os.path.dirname(__file__), f"frontend/categories/{category.lower()}.php"), "w") as fp:
                fp.write(category_page)
            
            # ...and add category to the sidebar
            with open(os.path.join(os.path.dirname(__file__), f"frontend/modules/sidebar.html"), "r") as fp:
                sidebar = fp.read()
            sidebar_listing = f"    <li>\n\
            <a href=\"/categories/{category.lower()}.php\">{category}</a>\n\
        </li>\n\
    </ul>\n"
            updated_sidebar = re.sub("</ul>\n", sidebar_listing, sidebar)
            with open(os.path.join(os.path.dirname(__file__), f"frontend/modules/sidebar.html"), "w") as fp:
                fp.write(updated_sidebar)
            
    # Finally, update the Atom feed
    with open(os.path.join(os.path.dirname(__file__), f"frontend/feed"), "r") as fp:
        feed = fp.read()
    feed_listing = "<icon>https://fidgetcube.dev/img/favicon.ico</icon>\n\
    <entry>\n\
        <title>{}</title>\n\
        <link href=\"https://fidgetcube.dev/posts/{}.php\" rel=\"alternate\" type=\"text/html\"/>\n\
        <published>{}</published>\n\
        <updated>{}</updated>\n\
        <id>https://fidgetcube.dev/posts/{}.php</id>\n\
        <content type=\"html\">\n\
            {}\n\
        </content>\n\
        <summary type=\"html\">\n\
            {}\n\
            {}\n\
        </summary>\n\
        <author>\n\
            <name>Max vonBlankenburg</name>\n\
        </author>\n\
        <category term=\"{}\"/>\n\
    </entry>\n".format(
        post_title,
        post_name,
        datetime.now().strftime('%Y-%m-%dT%H:%M:%S-07:00'),
        datetime.now().strftime('%Y-%m-%dT%H:%M:%S-07:00'),
        post_name,
        re.sub('\n', '\n            ', post_html).strip(),
        re.findall('<p>.*</p>', post_html)[0],
        re.findall('<p>.*</p>', post_html)[1],
        categories[0]
    )
    updated_feed = re.sub("<icon>https://fidgetcube.dev/img/favicon.ico</icon>\n", feed_listing, feed)
    with open(os.path.join(os.path.dirname(__file__), f"frontend/feed"), "w") as fp:
        fp.write(updated_feed)



if __name__ == '__main__':
    parser = ArgumentParser(prog="Post Generator", description="Automatically generate files to add a new post to the website.")
    parser.add_argument('post_name', help="Name used to refer to the post, in filenames, etc.")
    parser.add_argument('-C', '--categories', nargs='*', help="Categories that the post fits under (e.g. Cryptography, Research, Conventions)")
    parser.add_argument('-t', '--title', help="Title of the post, if different from the post name.")
    args = parser.parse_args()

    main(args.post_name, post_title=args.title, categories=args.categories)

