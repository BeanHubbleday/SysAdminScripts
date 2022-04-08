#!/bin/bash
# A Shell Script To Automate The Setup Of A LAMP Stack By Jack Hubbleday
# Created: 21-05-2019
# Last Edited: 12-10-2020
sudo yum install httpd
# Installs Apache.
sudo systemctl start httpd.service
# Starts the Apache service.
sudo systemctl enable httpd.service
# Enables the Apache service to start on startup.
sudo yum install mariadb-server mariadb
# Installs MariaDB, a SQL databse.
sudo systemctl start mariadb
# Starts the MariaDB service.
sudo mysql_secure_installation
# Starts the MariaDB initialisation process which needs to be manually completed.
sudo systemctl enable mariadb.service
# Enables the MariaDB service to start on startup.
sudo yum install php php-mysql -y
# Installs PHP.
sudo systemctl restart httpd.service
# Restarts the Apache service, necessary after install PHP.
sudo firewall-cmd --permanent --zone=public --add-service=http 
# Opens the port for http on the firewall.
sudo firewall-cmd --permanent --zone=public --add-service=https
# Opens the port for https on the firewall.
sudo firewall-cmd --reload
# Restarts the firewall, necessary after editing ports.
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# Installs the "EPEL" repository.
sudo yum install yum-utils
# Installs the "yum-utils" tools which can be found in the EPEL repository.
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
# Installs the "remi" repository.
sudo yum-config-manager --enable remi-php72
# Enables yum to speak to the remi repository so that it can download PHP v7.2 from it.
sudo yum install php72 php72-php-fpm php72-php-mysqlnd php72-php-opcache php72-php-xml php72-php-xmlrpc php72-php-gd php72-php-mbstring php72-php-json
# Installs PHP v7.2 which is found in the remi repository.
sudo rm -rf /usr/bin/php
# Removes directory created during the PHP install process.
sudo ln -s /usr/bin/php72 /usr/bin/php
# Links the standard PHP directopry to the PHP v7.2 directory so that the system, by default uses the latest verison, v7.2.
echo "LAMP Stack Setup Is Complete"
# Outputs a message to the console to let the user know 
