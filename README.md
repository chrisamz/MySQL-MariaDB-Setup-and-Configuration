# MySQL/MariaDB Setup and Configuration

## Overview

This project involves setting up and configuring a MySQL or MariaDB database, including the setup of master-slave replication and performance tuning. The guide provides detailed scripts and instructions to help you set up, replicate, and optimize your MySQL/MariaDB database efficiently.

## Technologies

- MySQL
- MariaDB

## Key Features

- Installation scripts
- Master-slave replication setup
- Configuration files
- Performance tuning parameters

## Project Structure

```
mysql_mariadb-setup/
├── install_mysql_mariadb.sh
├── master_slave_replication.sql
├── my.cnf
├── tuning_parameters.sql
├── README.md
└── LICENSE
```

## Instructions

### 1. Clone the Repository

Start by cloning the repository to your local machine:

```bash
git clone https://github.com/your-username/mysql_mariadb-setup.git
cd mysql_mariadb-setup
```

### 2. Run the Installation Script

Use the provided shell script to install MySQL or MariaDB. Ensure you have the necessary permissions and that the script is executable:

```bash
chmod +x install_mysql_mariadb.sh
./install_mysql_mariadb.sh
```

### 3. Set Up Master-Slave Replication

Configure master-slave replication by running the provided SQL script:

```bash
mysql -u root -p < master_slave_replication.sql
```

### 4. Apply Configuration Settings

Copy the `my.cnf` file to your MySQL/MariaDB configuration directory (usually `/etc/mysql/`) and restart the MySQL/MariaDB service:

```bash
sudo cp my.cnf /etc/mysql/my.cnf
sudo systemctl restart mysql
```

### 5. Apply Performance Tuning Parameters

Run the provided SQL script to apply performance tuning parameters:

```bash
mysql -u root -p < tuning_parameters.sql
```

## Detailed Steps and Explanations

Refer to the sections below for detailed steps and explanations for each part of the setup process.

### Installation Script (`install_mysql_mariadb.sh`)

This script automates the installation of MySQL or MariaDB. It performs the following tasks:
- Installs necessary packages
- Sets up MySQL or MariaDB
- Secures the installation

```bash
#!/bin/bash

# MySQL/MariaDB Installation Script
# This script installs MySQL or MariaDB and performs initial setup

# Exit immediately if a command exits with a non-zero status.
set -e

# Update package information
sudo apt update

# Install MySQL or MariaDB
sudo apt install -y mysql-server

# Secure MySQL installation
sudo mysql_secure_installation

echo "MySQL/MariaDB installation and initial setup completed successfully."
```

### Master-Slave Replication Setup (`master_slave_replication.sql`)

This SQL script configures master-slave replication for your MySQL/MariaDB database.

```sql
-- master_slave_replication.sql
-- This script sets up master-slave replication

-- On Master Server
-- Step 1: Configure Master
CHANGE MASTER TO MASTER_HOST='master_host', MASTER_USER='replication_user', MASTER_PASSWORD='replication_password', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS= 107;

-- Step 2: Start Slave
START SLAVE;

-- Step 3: Verify Slave Status
SHOW SLAVE STATUS\G;
```

### Configuration File (`my.cnf`)

This is an example configuration file for MySQL/MariaDB. It includes settings for replication and performance tuning.

```ini
[mysqld]
server-id               = 1
log_bin                 = /var/log/mysql/mysql-bin.log
binlog_do_db            = your_database_name
relay-log               = /var/log/mysql/mysql-relay-bin.log
relay-log-index         = /var/log/mysql/mysql-relay-bin.index
auto-increment-increment=2
auto-increment-offset=1
```

### Performance Tuning Parameters (`tuning_parameters.sql`)

This SQL script applies performance tuning parameters to optimize your MySQL/MariaDB database.

```sql
-- tuning_parameters.sql
-- This script sets performance tuning parameters for MySQL/MariaDB

-- Increase maximum connections
SET GLOBAL max_connections = 500;

-- Adjust buffer pool size
SET GLOBAL innodb_buffer_pool_size = 1G;

-- Adjust log file size
SET GLOBAL innodb_log_file_size = 256M;

-- Enable query cache
SET GLOBAL query_cache_size = 64M;
SET GLOBAL query_cache_type = 1;
```

## Contributing

We welcome contributions to improve this project. If you would like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Contact

For questions or issues, please open an issue in the repository or contact the project maintainers at [your-email@example.com].

---

Thank you for using our MySQL/MariaDB Setup and Configuration project! We hope this guide helps you set up, replicate, and optimize your MySQL/MariaDB database efficiently.
