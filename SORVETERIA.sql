CREATE DATABASE sorveteria;
USE sorveteria;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    data_cadastro DATE
);


CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    data_contratacao DATE
);

CREATE TABLE sabores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(5, 2) NOT NULL
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE pedido_sabores (
    pedido_id INT,
    sabor_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (sabor_id) REFERENCES sabores(id)
);

INSERT INTO clientes (nome, email, telefone, endereco)
VALUES
('Maria Silva', 'maria.silva@email.com', '123456789', 'Rua A, 123'),
('João Santos', 'joao.santos@email.com', '987654321', 'Rua B, 456');

INSERT INTO funcionarios (nome, cargo, salario)
VALUES
('Carlos Pereira', 'Atendente', 1500.00),
('Ana Souza', 'Gerente', 2500.00);

INSERT INTO sabores (nome, preco)
VALUES
('Chocolate', 5.50),
('Morango', 4.50),
('Baunilha', 4.00),
('Menta', 6.00);

INSERT INTO pedidos (cliente_id, total)
VALUES
(1, 15.50),
(2, 12.00);

INSERT INTO pedido_sabores (pedido_id, sabor_id, quantidade)
VALUES
(1, 1, 2), -- Pedido 1, 2 bolas de Chocolate
(1, 2, 1), -- Pedido 1, 1 bola de Morango
(2, 3, 3); -- Pedido 2, 3 bolas de Baunilha

SELECT * FROM clientes;

SELECT p.id AS pedido_id, c.nome AS cliente, s.nome AS sabor, ps.quantidade
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN pedido_sabores ps ON p.id = ps.pedido_id
JOIN sabores s ON ps.sabor_id = s.id;

SELECT SUM(total) AS total_vendas FROM pedidos;

SELECT nome, cargo, salario FROM funcionarios;

SELECT s.nome, SUM(ps.quantidade) AS total_vendido
FROM sabores s
JOIN pedido_sabores ps ON s.id = ps.sabor_id
GROUP BY s.nome
ORDER BY total_vendido DESC;

UPDATE sabores
SET preco = 6.00
WHERE nome = 'Morango';

DELETE FROM clientes
WHERE nome = 'João Santos';



