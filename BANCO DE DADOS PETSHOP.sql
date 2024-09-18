CREATE DATABASE PetShopDB;
USE PetShopDB;

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco TEXT
);

CREATE TABLE Pets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Servicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME NOT NULL,
    tipo ENUM('Produto', 'Servico') NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);

CREATE TABLE ItensPedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    id_servico INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id)
);

INSERT INTO Clientes (nome, email, telefone, endereco) VALUES
('João Silva', 'joao.silva@example.com', '123456789', 'Rua das Flores, 123'),
('Maria Oliveira', 'maria.oliveira@example.com', '987654321', 'Avenida Brasil, 456');

INSERT INTO Pets (nome, especie, raca, idade, id_cliente) VALUES
('Rex', 'Cachorro', 'Labrador', 5, 1),
('Mia', 'Gato', 'Siamês', 3, 2);

INSERT INTO Produtos (nome, descricao, preco) VALUES
('Ração Cachorro', 'Ração para cachorro de alta qualidade', 150.00),
('Areia Gato', 'Areia para caixa de areia de gatos', 30.00);

INSERT INTO Servicos (nome, descricao, preco) VALUES
('Banho e Tosa', 'Serviço completo de banho e tosa para cachorros', 100.00),
('Consulta Veterinária', 'Consulta veterinária para check-up', 200.00);

INSERT INTO Pedidos (id_cliente, data_pedido, tipo, valor_total) VALUES
(1, NOW(), 'Produto', 180.00),
(2, NOW(), 'Servico', 300.00);

INSERT INTO ItensPedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 150.00),
(1, 2, 1, 30.00);

INSERT INTO Pedidos (id_cliente, data_pedido, tipo, valor_total) VALUES
(1, NOW(), 'Produto', 180.00),
(2, NOW(), 'Servico', 300.00);

INSERT INTO ItensPedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 150.00),
(1, 2, 1, 30.00);

INSERT INTO ItensPedido (id_pedido, id_servico, quantidade, preco_unitario) VALUES
(2, 1, 1, 100.00),
(2, 2, 1, 200.00);











