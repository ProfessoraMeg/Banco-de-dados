CREATE DATABASE cadastro_db;
USE cadastro_db;


CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);
