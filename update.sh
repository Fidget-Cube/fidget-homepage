# Backup the guestbook
sudo mysqldump website guestbook > database/guestbook_backup.sql

# Get latest changes from remote
git pull

# Update database
sudo mysql website --force < database/backup.sql

# Restore guestbook
sudo mysql website --force < database/guestbook_backup.sql

# Update frontend
sudo cp -r frontend/* /var/www/html

# Restart services
# Unsure of what php version we have, so try all of them
sudo systemctl restart php7.4-fpm
sudo systemctl restart php8.1-fpm
sudo systemctl restart php8.2-fpm
sudo nginx -t
sudo systemctl restart nginx
