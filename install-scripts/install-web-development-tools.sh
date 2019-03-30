#============
# Php 
#============
sudo apt update 
sudo apt upgrade
echo "installing Php ..."
if type -p php > /dev/null; then
    echo "Php Installed" >> $log_file
else
    echo "Php FAILED TO INSTALL!!!" >> $log_file
fi
sudo apt install php-mbstring php-curl php-mcrypt php-gettext php-xml php-json
echo "Php Modules Installed ..." >> $log_file

#============
# Composer 
#============
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
echo "Composer Installed ..." >> $log_file

#============
# The Best -- Laravel --
#============
composer global require "laravel/installer"
echo "laravel/installer Installed ..." >> $log_file
