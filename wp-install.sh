#!/bin/bash
# GET ALL USER INPUT
tput setaf 2; echo "Domain Name (eg. yoursitename.com)?"
read DOMAIN
tput setaf 2; echo "Username (eg. database name)?"
read USERNAME
tput setaf 2; echo "Updating OS................."
sleep 2;
tput sgr0
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update

tput setaf 2; echo "Installing Nginx"
sleep 2;
tput sgr0
sudo apt-get install nginx zip unzip pwgen -y

tput setaf 2; echo "Sit back and relax :) ......"
sleep 2;
tput sgr0
cd /etc/nginx/sites-available/
sudo wget -qO "$DOMAIN" https://git.kloudboy.com/nginxconf
sudo sed -i -e "s/example.com/$DOMAIN/" "$DOMAIN"
sudo sed -i -e "s/www.example.com/www.$DOMAIN/" "$DOMAIN"
sudo ln -s /etc/nginx/sites-available/"$DOMAIN" /etc/nginx/sites-enabled/
sudo mkdir /etc/nginx/kloudboy
cd /etc/nginx/kloudboy
sudo wget -q https://raw.githubusercontent.com/bajpangosh/High-Traffic-wordpress-server-configuration/master/kloudboy/general.conf
sudo wget -q https://raw.githubusercontent.com/bajpangosh/High-Traffic-wordpress-server-configuration/master/kloudboy/php_fastcgi.conf
sudo wget -q https://raw.githubusercontent.com/bajpangosh/High-Traffic-wordpress-server-configuration/master/kloudboy/wordpress.conf
sudo wget -q https://raw.githubusercontent.com/bajpangosh/High-Traffic-wordpress-server-configuration/master/kloudboy/security.conf
tput setaf 2; echo "Setting up Cloudflare FULL SSL"
sleep 2;
tput sgr0
sudo mkdir /etc/nginx/ssl
cd /etc/nginx/ssl/
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
sudo openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
cd /etc/nginx/
sudo mv nginx.conf nginx.conf.backup
sudo wget -qO nginx.conf https://raw.githubusercontent.com/bajpangosh/High-Traffic-wordpress-server-configuration/master/nginx.conf
sudo mkdir -p /var/www/"$DOMAIN"/public
cd /var/www/"$DOMAIN/public"
cd ~
tput setaf 2; echo "Installing WP-CLI...."
sleep 2;
tput sgr0
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
tput setaf 2; echo "Downloading Latest Wordpress...."
sleep 2;
tput sgr0
sudo wget -q wordpress.org/latest.zip
sudo unzip latest.zip
sudo mv wordpress/* /var/www/"$DOMAIN"/public/
sudo rm -rf wordpress latest.zip
tput setaf 2; echo "Nginx server installation completed.."
sleep 2;
tput sgr0
cd ~
sudo chown www-data:www-data -R /var/www/"$DOMAIN"/public
sudo systemctl restart nginx.service
tput setaf 2; echo "let's install php 7.4 and modules"
sleep 2;
tput sgr0
sudo apt install php7.4 php7.4-fpm -y
sudo apt install php-memcached php-bcmath php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y
tput setaf 2; echo "Some php.ini Tweaks"
sleep 2;
tput sgr0
sudo sed -i "s/post_max_size = .*/post_max_size = 128M/" /etc/php/7.4/fpm/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 3000M/" /etc/php/7.4/fpm/php.ini
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/7.4/fpm/php.ini
sudo sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php/7.4/fpm/php.ini
sudo sed -i "s/;max_input_vars = .*/max_input_vars = 5000/" /etc/php/7.4/fpm/php.ini
sudo sed -i "s/max_input_time = .*/max_input_time = 1000/" /etc/php/7.4/fpm/php.ini
sudo systemctl restart php7.4-fpm.service
tput setaf 2; echo "Instaling MariaDB"
sleep 2;
tput sgr0
sudo apt install mariadb-server mariadb-client php7.4-mysql -y
sudo systemctl restart php7.4-fpm.service
sudo mysql_secure_installation
PASS=`pwgen -s 14 1`
sudo mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $USERNAME;
CREATE USER '$USERNAME'@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $USERNAME.* TO '$USERNAME'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo
echo
tput setaf 2; echo "Here is your Credentials"
echo "--------------------------------"
echo "Website:    https://www.$DOMAIN"
echo "Dashboard:  https://www.$DOMAIN/wp-admin"
echo
tput setaf 4; echo "Database Name:   $USERNAME"
tput setaf 4; echo "Database Username:   $USERNAME"
tput setaf 4; echo "Database Password:   $PASS"
echo "--------------------------------"
tput sgr0
echo
echo
tput setaf 3;  echo "Installation & configuration successfully finished."
echo
echo "Twitter @bajpangosh"
echo "E-mail: support@kloudboy.com"
echo "Bye! Your boy KLOUDBOY!"
tput sgr0
