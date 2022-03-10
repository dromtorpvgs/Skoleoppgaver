create database task5;

use task5;

CREATE TABLE IF NOT EXISTS users(
    username varchar(255) primary key not null,
    password varchar(255) not null
);

INSERT INTO users (username,password) VALUES 
(
    CONCAT('admin',SUBSTRING(MD5(RAND()) FROM 1 FOR 4)),
    SUBSTRING(MD5(RAND()) FROM 1 FOR 8)
);
