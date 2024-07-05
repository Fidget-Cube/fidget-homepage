# My Personal Website

Currently a static webserver with php.

Hosting with Nginx:
- `sudo apt install nginx`
- `sudo apt install php7.4-common php7.4-cli php7.4-fpm` (might be different php versions for your dist)
- Within /etc/nginx/sites-available/default:
    - `index index.html index.htm` -> `index index.php index.html index.htm`
    - Uncomment object labeled as `location ~ \.php$ {`
    - Re-comment line `fastcgi_pass 127.0.0.1:9000`
- Set environment variables:
    - Fill `.env`
    - `chmod +x setenv.sh && ./setenv.sh`
- Copy frontend folder to /var/www/html (or system equivalent default webroot)
- `sudo systemctl restart php7.4-fpm`
- `sudo nginx -t` and `sudo systemctl restart nginx`

Your website should now be live at localhost:80
To get an ssl cert, use certbot: https://certbot.eff.org/

Add Ratelimiting:
- Within /etc/nginx/sites-available/default:
    - add `limit_req_zone $binary_remote_addr zone=mylimit:10m rate=6r/m;` outside everything
    - add a new location, identical to the `location ~ \.php$ {` directive, but specified as `location = /submit/result.php {`
    - add `limit_req zone=mylimit;` inside `location = /submit/result.php {`

Hosting with Cloudflare:
 - Currently using Cloudflare for domain protections. Can actually create a tunnel to cloudflare without opening ports on our local server.
 - https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/local/
 - https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/local/as-a-service/linux/

TODO:
- Update post generation script
- Improve error pages
- Rotate daily songs every day
- Keep header static and update body while browsing
- Add and about page
- Add a guestbook

LINKS TODO:
- https://blackfogzine.org/ (make button for)
- https://corru.observer/widescreen/?path=/ (put under sidebar)
- https://passwordpassword.online (put under sidebar and make button and credit https://nikita-kryukov.itch.io/)
- https://lainzine.org/all-releases/lainzine06.pdf (make button for)
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

https://www.youtube.com/watch?v=be_Ms3nVG10