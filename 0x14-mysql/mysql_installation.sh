#!/usr/bin/env bash

# Stop MySQL service
sudo systemctl stop mysql

# Uninstall MySQL packages
sudo apt-get remove --purge -y mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-*

# Remove MySQL configuration and data files
sudo rm -rf /etc/mysql /var/lib/mysql

# Remove MySQL dependencies
sudo apt-get autoremove -y
sudo apt-get autoclean

echo "MySQL uninstallation completed."

# Update the package list
sudo apt-get update

# Download MySQL APT repository configuration tool for MySQL 5.7
wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb

# Install the MySQL APT repository configuration tool
sudo dpkg -i mysql-apt-config_0.8.10-1_all.deb

# Select the correct version (5.7) 
# When prompted the bionic will be best choice
sudo dpkg-reconfigure mysql-apt-config

# Update the package list again
sudo apt-get update

# Install MySQL server 5.7
sudo apt-get install -y mysql-server=5.7.*

# Define MySQL root password
MYSQL_ROOT_PASSWORD='Ezechiel01@'
sudo mysql_secure_installation <<EOF

n
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
y
y
y
EOF

# Create a .my.cnf file for root user to avoid entering password during automated scripts
cat <<EOL > ~/.my.cnf
[client]
user=root
password=$MYSQL_ROOT_PASSWORD
EOL

# Ensure the .my.cnf file is only readable by the user
chmod 600 ~/.my.cnf

# Restart MySQL service
sudo systemctl restart mysql

# Print MySQL version to verify installation
mysql --version

echo "MySQL 5.7 installation and initial setup completed."
