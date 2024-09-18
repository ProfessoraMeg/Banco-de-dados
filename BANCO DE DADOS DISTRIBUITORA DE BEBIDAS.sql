-- Criação do banco de dados
CREATE DATABASE DistribuidoraDB;
USE DistribuidoraDB;

-- Tabela de Fornecedores
CREATE TABLE Fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    endereco TEXT
);

-- Tabela de Bebidas
CREATE TABLE Bebidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id)
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id)
);

-- Tabela de Itens do Pedido
CREATE TABLE ItensPedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_bebida INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_bebida) REFERENCES Bebidas(id)
);

-- Inserindo fornecedores
INSERT INTO Fornecedores (nome, contato, endereco) VALUES
('Distribuidora ABC', 'contato@abc.com', 'Rua Principal, 123'),
('Bebidas XYZ', 'contato@xyz.com', 'Avenida Central, 456');

-- Inserindo bebidas
INSERT INTO Bebidas (nome, tipo, preco, estoque, id_fornecedor) VALUES
('Cerveja Lager', 'Cerveja', 4.50, 100, 1),
('Vinho Tinto', 'Vinho', 25.00, 50, 2);

-- Inserindo pedidos
INSERT INTO Pedidos (data_pedido, id_fornecedor) VALUES
(NOW(), 1),
(NOW(), 2);

-- Inserindo itens de pedido
INSERT INTO ItensPedido (id_pedido, id_bebida, quantidade, preco_unitario) VALUES
(1, 1, 20, 4.50),
(2, 2, 15, 25.00);

-- Atualizando o estoque de uma bebida
UPDATE Bebidas SET estoque = estoque - 10 WHERE id = 1;

-- Deletando um fornecedor
DELETE FROM Fornecedores WHERE id = 2;

-- Deletando uma bebida
DELETE FROM Bebidas WHERE id = 2;

-- Selecionar todas as bebidas
SELECT * FROM Bebidas;

-- Selecionar todas as bebidas distintas (sem duplicados)
SELECT DISTINCT nome FROM Bebidas;

-- Selecionar as primeiras 5 bebidas mais caras
SELECT nome, preco FROM Bebidas ORDER BY preco DESC LIMIT 5;

SELECT ALL nome FROM Bebidas;

SELECT DISTINCTROW nome FROM Bebidas;

-- Criar uma nova tabela com bebidas caras
CREATE TABLE BebidasCaras AS
SELECT nome, preco FROM Bebidas WHERE preco > 10;







