CREATE DATABASE DB_NAME;
GRANT ALL PRIVILEGES ON *.* TO 'DB_USER'@'%' IDENTIFIED BY 'DB_PASS';
FLUSH PRIVILEGES;
