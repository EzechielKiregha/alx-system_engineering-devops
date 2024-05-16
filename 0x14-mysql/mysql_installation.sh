#!/bin/bash

# Define MySQL root password
MYSQL_ROOT_PASSWORD='Ezechiel01@'

# Update the package list
sudo apt-get update

# Install MySQL server
sudo apt-get install -y mysql-server

# Secure MySQL installation
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

echo "MySQL installation and initial setup completed."
