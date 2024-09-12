CREATE DATABASE EmpresaDB;
USE EmpresaDB;

CREATE TABLE Departamento (
    departamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Funcionario (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamento(departamento_id)
);

CREATE TABLE Perfil (
    funcionario_id INT PRIMARY KEY,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(funcionario_id)
);

CREATE TABLE Projeto (
    projeto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Funcionario_Projeto (
    funcionario_id INT,
    projeto_id INT,
    PRIMARY KEY (funcionario_id, projeto_id),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(funcionario_id),
    FOREIGN KEY (projeto_id) REFERENCES Projeto(projeto_id)
);

CREATE TABLE Tarefa (
    tarefa_id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    funcionario_id INT,
    projeto_id INT,
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(funcionario_id),
    FOREIGN KEY (projeto_id) REFERENCES Projeto(projeto_id)
);

CREATE TABLE Pessoa (
    pessoa_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('Cliente', 'Fornecedor') NOT NULL
);

CREATE TABLE Cliente (
    pessoa_id INT PRIMARY KEY,
    data_cadastro DATE,
    FOREIGN KEY (pessoa_id) REFERENCES Pessoa(pessoa_id)
);

CREATE TABLE Fornecedor (
    pessoa_id INT PRIMARY KEY,
    empresa VARCHAR(100),
    FOREIGN KEY (pessoa_id) REFERENCES Pessoa(pessoa_id)
);

INSERT INTO Departamento (nome) VALUES ('TI'), ('RH'), ('Financeiro');

INSERT INTO Funcionario (nome, departamento_id) VALUES ('Ana Silva', 1), ('Carlos Souza', 2);

INSERT INTO Projeto (nome) VALUES ('Projeto A'), ('Projeto B');

INSERT INTO Funcionario_Projeto (funcionario_id, projeto_id) VALUES (1, 1), (2, 2);

INSERT INTO Tarefa (descricao, funcionario_id, projeto_id) VALUES ('Desenvolvimento', 1, 1), ('Recrutamento', 2, 2);

INSERT INTO Pessoa (nome, tipo) VALUES ('João Cliente', 'Cliente'), ('Maria Fornecedor', 'Fornecedor');

INSERT INTO Cliente (pessoa_id, data_cadastro) VALUES (1, '2024-01-15');

INSERT INTO Fornecedor (pessoa_id, empresa) VALUES (2, 'Fornecedor XYZ');
