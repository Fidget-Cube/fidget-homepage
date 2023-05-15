# My Personal Website

Currently a static webserver with php.

Hosting with Nginx:
- `sudo apt install nginx`
- `sudo apt install php7.4-common php7.4-cli php7.4-fpm` (might be different php versions for your dist)
- Within /etc/nginx/sites-available/default:
    - `index index.html index.htm` -> `index index.php index.html index.htm`
    - Uncomment object labeled as `location ~ \.php$ {`
    - Re-comment line `fastcgi_pass 127.0.0.1:9000`
- Copy frontend folder to /var/www/html (or system equivalent default webroot)
- `sudo systemctl restart php7.4-fpm`
- `sudo nginx -t` and `sudo systemctl restart nginx`

Your website should now be live at localhost:80
To get an ssl cert, use certbot: https://certbot.eff.org/

Add Ratelimiting:
- Within /etc/nginx/sites-available/default:
    - add `limit_req_zone $binary_remote_addr zone=mylimit:10m rate=6r/m;` outside everything
    - add `limit_req zone=mylimit;` inside `location ~ \.php$ {`

TODO:
 - Add directory of all posts
 - Add CV
 - Add RSS feed
 - Switch to Angular or something
