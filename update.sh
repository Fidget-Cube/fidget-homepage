# Get latest changes from remote
git pull

# Update database
sudo mysql website --force < database/backup.sql

# Update frontend
sudo cp -r frontend/* /var/www/html

# Restart services
sudo systemctl restart php8.1-fpm
sudo nginx -t
sudo systemctl restart nginx
