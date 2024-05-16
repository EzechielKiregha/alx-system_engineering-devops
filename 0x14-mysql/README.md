# MySQL Installation Automation Script

This repository contains a Bash script to automate the installation and initial setup of MySQL on Ubuntu servers.

## Script Overview

The `install_mysql.sh` script performs the following tasks:
1. Updates the package list.
2. Installs the MySQL server package.
3. Secures the MySQL installation by setting a root password and disabling insecure features.
4. Creates a `.my.cnf` file to store MySQL credentials.
5. Restarts the MySQL service.
6. Verifies the installation by printing the MySQL version.

## Prerequisites

- Ubuntu operating system
- User with sudo privileges
- SSH access to the servers
