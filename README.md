# My Personal Website

Currently a static webserver run on a LEMP stack (Linux, Nginx, MySQL, PHP).

### Setting Up Database:
- [Install and Set Up MariaDB](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04)
    - NOTE: for some reason, no password is different from an empty password? You may need to set it explicitly:
        `sudo mysql`
        `SET PASSWORD FOR 'root'@'localhost' = PASSWORD('mypass');`
        `FLUSH PRIVILEGES;`
- Create a new database on the MariaDB server named "website"
    - `sudo mysql`
    - `CREATE DATABASE website;`
- Run `sudo mysql website --force < database/backup.sql`
    - (you can create a dump with `sudo mysqldump website > database/backup.sql`)

### Hosting with Nginx:
- `sudo apt install nginx`
- `sudo apt install php8.1-common php8.1-cli php8.1-fpm php8.1-mysql php8.1-curl php8.1-mbstring php8.1-xml zip 7zip` (might be different php versions for your dist)
- Install Composer Dependencies
    - `chmod +x install_composer.sh && ./install_composer.sh`
- Copy `nginx.config` into your Nginx config folder
    - `sudo cp nginx.config /etc/nginx/sites-available/default`
    - NOTE: You may need to change the PHP versions in this file, it currently includes "php8.1"
- Set global PHP params:
    - Fill out `php-params.conf.example` with the appropriate secrets, rename it to `php-params.conf`, and place it in the `/etc/nginx/snippets` directory
- Copy frontend folder to /var/www/html (or system equivalent default webroot)
- `sudo systemctl restart php8.1-fpm`
- `sudo nginx -t` and `sudo systemctl restart nginx`

Your website should now be live at localhost:80
To get an ssl cert, use certbot: https://certbot.eff.org/ (unnecessary if hosting with cloudflare)

### Hosting with Cloudflare:
 - Currently using Cloudflare for domain protections. Can actually create a tunnel to cloudflare without opening ports on our local server.
 - https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/local/
 - https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/local/as-a-service/linux/

### Adding a New Post:

I've created a script to simplify the process of creating a new post. Simply create a new markdown file in `posts/`, then run `generate_new_post.py`.

`pip3 install mysql-connector-python`

`python3 generate_new_post.py`

### TODO:
- Add a guestbook
- Add more songs
- Add more facts

LINKS TODO:
- https://aesthetic.computer/ (add to list of things to do)

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

