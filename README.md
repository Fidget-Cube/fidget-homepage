# My Personal Website

Currently a static webserver run on a LEMP stack (Linux, Nginx, MySQL, PHP).

### Setting Up Database:
- [Install and Set Up MariaDB](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04)
    - Make sure to follow ALL the steps, including creating an admin account with a password (?)
- Create a new database on the MariaDB server named "website"
    - `sudo mysql`
    - `CREATE DATABASE website;`
- Run `sudo mysql website < database/backup.sql`
    - (you can create a dump with `sudo mysqldump website > database/backup.sql`)

### Hosting with Nginx:
- `sudo apt install nginx`
- `sudo apt install php7.4-common php7.4-cli php7.4-fpm php7.4-mysql php7.4-curl php7.4-mbstring php7.4-xml` (might be different php versions for your dist)
- Install Composer Dependencies
    - `chmod +x install_composer.sh && ./install_composer.sh`
- Within /etc/nginx/sites-available/default:
    - `index index.html index.htm` -> `index index.php index.html index.htm`
    - Uncomment object labeled as `location ~ \.php$ {`
    - Re-comment line `fastcgi_pass 127.0.0.1:9000`
    - To add custom error pages, add these lines:
        - `error_page 404 /index.php?page=404;`
        - `error_page 403 /index.php?page=403;`
        - `error_page 500 /modules/error_pages/500.html;`
        - `error_page 503 /modules/error_pages/503.html;`
    - For extra security, add `deny all;` underneath two location objects that look like `location ~ composer {` and `location ~ vendor {`
- Set global PHP params:
    - Fill out `php-params.conf.example` with the appropriate secrets, rename it to `php-params.conf`, and place it in the `/etc/nginx/snippets` directory
    - Within /etc/nginx/sites-available/default, add the line `include snippets/php-params.conf;` inside the `location ~ \.php$ {` block
- Copy frontend folder to /var/www/html (or system equivalent default webroot)
- `sudo systemctl restart php7.4-fpm`
- `sudo nginx -t` and `sudo systemctl restart nginx`

Your website should now be live at localhost:80
To get an ssl cert, use certbot: https://certbot.eff.org/

### Add Ratelimiting:
- Within /etc/nginx/sites-available/default:
    - add `limit_req_zone $binary_remote_addr zone=mylimit:10m rate=6r/m;` outside everything
    - add a new location, identical to the `location ~ \.php$ {` directive, but specified as `location = /modules/submit/result.php {`
    - add `limit_req zone=mylimit;` inside `location = /modules/submit/result.php {`

### Hosting with Cloudflare:
 - Currently using Cloudflare for domain protections. Can actually create a tunnel to cloudflare without opening ports on our local server.
 - https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/local/
 - https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/local/as-a-service/linux/

### Adding a New Post:

I've created a script to simplify the process of creating a new post. Simply create a new markdown file in `posts/`, then run `generate_new_post.py`.

`pip3 install mysql-connector-python`

`python3 generate_new_post.py`

### TODO:
- Rotate daily fact every day
- Add a guestbook
- Add more songs

LINKS TODO:
- https://aesthetic.computer/ (add to list of things to do)
- https://sadgirlsclub.wtf/

- https://mrsmoe.neocities.org/
- https://halcybutton.neocities.org/
- https://tetrisk-lair.neocities.org/
- https://elite784.online/
- https://uncannyvalley.neocities.org/
- https://mebious.neocities.org/
- https://y2k.neocities.org/
- https://yesterweb.org/
- https://ninacti0n.neocities.org/
- https://whitedesert.neocities.org/
- https://suyu.neocities.org/
- https://blinkies.neocities.org/
- https://castlecyberskull.neocities.org/
- https://whereareyou.neocities.org/
- https://blackwings.neocities.org/
- https://incessantpain.neocities.org/
- https://the1980underground.neocities.org/
- https://87isopods.neocities.org/
- https://seekwebserial.wordpress.com/
- https://oran.business/020_List/Shitty+90s+website
