CREATE DATABASE frutaria;
USE frutaria;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    data_cadastro date
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(5, 2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE venda_produtos (
    venda_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (venda_id) REFERENCES vendas(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO clientes (nome, telefone, endereco)
VALUES
('Ana Pereira', '123456789', 'Rua das Laranjeiras, 15'),
('José Almeida', '987654321', 'Rua do Pomar, 23');

INSERT INTO funcionarios (nome, cargo, salario)
VALUES
('Paula Sousa', 'Atendente', 1200.00),
('Carlos Ribeiro', 'Gerente', 2200.00);

INSERT INTO produtos (nome, preco, estoque)
VALUES
('Maçã', 3.50, 100),
('Banana', 2.30, 150),
('Laranja', 4.00, 80),
('Manga', 5.00, 60);

INSERT INTO vendas (cliente_id, total)
VALUES
(1, 20.50),
(2, 15.00);

INSERT INTO venda_produtos (venda_id, produto_id, quantidade)
VALUES
(1, 1, 5),  -- Venda 1, 5 Maçãs
(1, 2, 10), -- Venda 1, 10 Bananas
(2, 3, 5);  -- Venda 2, 5 Laranjas

SELECT * FROM clientes;

SELECT v.id AS venda_id, c.nome AS cliente, p.nome AS produto, vp.quantidade, v.total
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
JOIN venda_produtos vp ON v.id = vp.venda_id
JOIN produtos p ON vp.produto_id = p.id;

SELECT SUM(total) AS total_vendas FROM vendas;

SELECT nome, cargo, salario FROM funcionarios;

SELECT nome, estoque FROM produtos;

SELECT p.nome, SUM(vp.quantidade) AS total_vendido
FROM produtos p
JOIN venda_produtos vp ON p.id = vp.produto_id
GROUP BY p.nome
ORDER BY total_vendido DESC;

UPDATE produtos
SET preco = 4.50
WHERE nome = 'Banana';

UPDATE produtos
SET estoque = estoque - 5
WHERE nome = 'Maçã';

DELETE FROM clientes
WHERE nome = 'José Almeida';


