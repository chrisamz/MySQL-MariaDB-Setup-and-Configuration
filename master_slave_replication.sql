-- master_slave_replication.sql
-- This script sets up master-slave replication for MySQL/MariaDB

-- On Master Server
-- Step 1: Create a replication user
CREATE USER 'replication_user'@'%' IDENTIFIED BY 'replication_password';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%';
FLUSH PRIVILEGES;

-- Step 2: Lock the master database to obtain the current log file and position
FLUSH TABLES WITH READ LOCK;

-- Step 3: Check the master status
SHOW MASTER STATUS;

-- Note the File and Position values from the output of SHOW MASTER STATUS.
-- These values are needed to configure the slave.

-- Step 4: Export the master database
-- Use the following command to export the database (run this command from the shell, not from MySQL prompt):
-- mysqldump -u root -p --all-databases --master-data > master_dump.sql

-- Unlock the tables after the dump is complete
UNLOCK TABLES;

-- On Slave Server
-- Step 5: Import the master dump file to the slave server
-- Use the following command to import the database (run this command from the shell, not from MySQL prompt):
-- mysql -u root -p < master_dump.sql

-- Step 6: Configure the slave server
CHANGE MASTER TO
  MASTER_HOST='master_host',
  MASTER_USER='replication_user',
  MASTER_PASSWORD='replication_password',
  MASTER_LOG_FILE='mysql-bin.000001',  -- Replace with the File value from SHOW MASTER STATUS
  MASTER_LOG_POS= 107;  -- Replace with the Position value from SHOW MASTER STATUS

-- Step 7: Start the slave
START SLAVE;

-- Step 8: Verify the slave status
SHOW SLAVE STATUS\G;

-- The output of SHOW SLAVE STATUS should show 'Slave_IO_Running: Yes' and 'Slave_SQL_Running: Yes'.
-- Verify that the slave is successfully connected to the master and replication is working.
