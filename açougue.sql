CREATE DATABASE acougue;
USE acougue;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
);

CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    contato VARCHAR(100)
);

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(15)
);

-- Inserir clientes
INSERT INTO clientes (nome, telefone, email) VALUES 
('João da Silva', '123456789', 'joao@gmail.com'),
('Maria Oliveira', '987654321', 'maria@gmail.com');

-- Inserir produtos
INSERT INTO produtos (nome, preco, quantidade) VALUES 
('Picanha', 59.90, 50),
('Alcatra', 49.90, 40),
('Costela', 39.90, 30);

-- Inserir fornecedores
INSERT INTO fornecedores (nome, telefone, contato) VALUES 
('Fornecedor A', '111222333', 'Carlos'),
('Fornecedor B', '444555666', 'Ana');

-- Inserir funcionários
INSERT INTO funcionarios (nome, cargo, telefone) VALUES 
('Pedro Santos', 'Açougueiro', '222333444'),
('Luana Almeida', 'Gerente', '555666777');

-- Inserir vendas
INSERT INTO vendas (cliente_id, total) VALUES 
(1, 159.80),
(2, 99.80);

-- Inserir itens de venda
INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES 
(1, 1, 2, 59.90),  -- 2 Picanhas para João
(1, 2, 1, 49.90),  -- 1 Alcatra para João
(2, 3, 2, 39.90);  -- 2 Costelas para Maria

-- Listar todos os clientes
SELECT * FROM clientes;

-- Listar todos os produtos
SELECT * FROM produtos;

-- Listar todos os fornecedores
SELECT * FROM fornecedores;

-- Listar todas as vendas com detalhes
SELECT v.id, c.nome AS cliente, v.data, v.total 
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id;

-- Listar itens de uma venda específica
SELECT iv.id, p.nome AS produto, iv.quantidade, iv.preco_unitario 
FROM itens_venda iv
JOIN produtos p ON iv.produto_id = p.id
WHERE iv.venda_id = 1;  -- Troque pelo ID da venda desejada

-- Listar todos os funcionários
SELECT * FROM funcionarios;
