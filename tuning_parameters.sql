-- tuning_parameters.sql
-- This script sets performance tuning parameters for MySQL/MariaDB

-- Increase maximum connections
SET GLOBAL max_connections = 500;

-- Adjust buffer pool size (adjust based on your system's memory)
SET GLOBAL innodb_buffer_pool_size = 1024 * 1024 * 1024;  -- 1GB

-- Adjust log file size (this change requires a restart)
SET GLOBAL innodb_log_file_size = 256 * 1024 * 1024;  -- 256MB

-- Enable query cache
SET GLOBAL query_cache_size = 64 * 1024 * 1024;  -- 64MB
SET GLOBAL query_cache_type = 1;

-- Set the maximum size for individual query results that can be cached
SET GLOBAL query_cache_limit = 1 * 1024 * 1024;  -- 1MB

-- Adjust the InnoDB log buffer size
SET GLOBAL innodb_log_buffer_size = 8 * 1024 * 1024;  -- 8MB

-- Set the flush log at transaction commit mode
SET GLOBAL innodb_flush_log_at_trx_commit = 1;

-- Set the lock wait timeout
SET GLOBAL innodb_lock_wait_timeout = 50;

-- Adjust thread cache size
SET GLOBAL thread_cache_size = 50;

-- Set the table open cache
SET GLOBAL table_open_cache = 2000;

-- Enable the slow query log and set the long query time
SET GLOBAL slow_query_log = 'ON';
SET GLOBAL slow_query_log_file = '/var/log/mysql/mysql-slow.log';
SET GLOBAL long_query_time = 2;  -- Log queries that take longer than 2 seconds

-- Set the temporary table size
SET GLOBAL tmp_table_size = 64 * 1024 * 1024;  -- 64MB

-- Set the maximum allowed packet size
SET GLOBAL max_allowed_packet = 64 * 1024 * 1024;  -- 64MB

-- Adjust key buffer size for MyISAM tables
SET GLOBAL key_buffer_size = 128 * 1024 * 1024;  -- 128MB

-- Print out the current values to verify changes
SHOW VARIABLES LIKE 'max_connections';
SHOW VARIABLES LIKE 'innodb_buffer_pool_size';
SHOW VARIABLES LIKE 'innodb_log_file_size';
SHOW VARIABLES LIKE 'query_cache_size';
SHOW VARIABLES LIKE 'query_cache_type';
SHOW VARIABLES LIKE 'query_cache_limit';
SHOW VARIABLES LIKE 'innodb_log_buffer_size';
SHOW VARIABLES LIKE 'innodb_flush_log_at_trx_commit';
SHOW VARIABLES LIKE 'innodb_lock_wait_timeout';
SHOW VARIABLES LIKE 'thread_cache_size';
SHOW VARIABLES LIKE 'table_open_cache';
SHOW VARIABLES LIKE 'slow_query_log';
SHOW VARIABLES LIKE 'slow_query_log_file';
SHOW VARIABLES LIKE 'long_query_time';
SHOW VARIABLES LIKE 'tmp_table_size';
SHOW VARIABLES LIKE 'max_allowed_packet';
SHOW VARIABLES LIKE 'key_buffer_size';
