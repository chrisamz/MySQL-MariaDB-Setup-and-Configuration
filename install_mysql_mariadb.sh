#!/bin/bash

# MySQL/MariaDB Installation Script
# This script installs MySQL or MariaDB and performs initial setup

# Exit immediately if a command exits with a non-zero status.
set -e

# Variables
DB_TYPE="mysql"  # Change to "mariadb" if you want to install MariaDB
MYSQL_ROOT_PASSWORD="your_root_password"  # Replace with a secure password
REPLICATION_USER="replication_user"
REPLICATION_PASSWORD="replication_password"

# Update package information
echo "Updating package information..."
sudo apt update

# Install MySQL or MariaDB
if [ "$DB_TYPE" == "mysql" ]; then
    echo "Installing MySQL..."
    sudo apt install -y mysql-server
else
    echo "Installing MariaDB..."
    sudo apt install -y mariadb-server
fi

# Secure MySQL/MariaDB installation
echo "Securing MySQL/MariaDB installation..."
sudo mysql_secure_installation <<EOF

y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
n
y
y
EOF

# Create replication user
echo "Creating replication user..."
sudo mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER '$REPLICATION_USER'@'%' IDENTIFIED BY '$REPLICATION_PASSWORD';"
sudo mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT REPLICATION SLAVE ON *.* TO '$REPLICATION_USER'@'%';"
sudo mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# Confirm installation and user creation
echo "Confirming installation and user creation..."
sudo mysql -u root -p$MYSQL_ROOT_PASSWORD -e "SELECT user, host FROM mysql.user;"

echo "MySQL/MariaDB installation and initial setup completed successfully."
