CREATE DATABASE panificadora;
USE panificadora;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    id_categoria INT,
    quantidade_estoque INT NOT NULL,
    PRIMARY KEY (id_produto),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) UNIQUE NOT NULL,
    telefone_cliente VARCHAR(15),
    endereco_cliente TEXT,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100) NOT NULL,
    contato_fornecedor VARCHAR(100),
    telefone_fornecedor VARCHAR(15),
    PRIMARY KEY (id_fornecedor)
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    status_pedido ENUM('Pendente', 'Concluído', 'Cancelado') DEFAULT 'Pendente',
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_pedido (
    id_item INT AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_item),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT,
    id_produto INT,
    quantidade INT NOT NULL,
    data_entrada DATE,
    PRIMARY KEY (id_estoque),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT,
    id_cliente INT,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_venda),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE INDEX idx_nome_produto ON produtos (nome_produto);
CREATE INDEX idx_data_pedido ON pedidos (data_pedido);

INSERT INTO categorias (nome_categoria) VALUES ('Pães'), ('Bolachas'), ('Bolos');

INSERT INTO produtos (nome_produto, descricao, preco, id_categoria, quantidade_estoque) 
VALUES 
('Pão Francês', 'Pão fresco e crocante', 1.50, 1, 200),
('Biscoito de Chocolate', 'Biscoito com pedaços de chocolate', 2.50, 2, 100),
('Bolo de Cenoura', 'Bolo de cenoura com cobertura de chocolate', 15.00, 3, 50);

INSERT INTO clientes (nome_cliente, email_cliente, telefone_cliente, endereco_cliente) 
VALUES 
('Ana Souza', 'ana.souza@example.com', '123456789', 'Rua das Palmeiras, 100'),
('Pedro Lima', 'pedro.lima@example.com', '987654321', 'Avenida dos Bandeirantes, 200');

INSERT INTO fornecedores (nome_fornecedor, contato_fornecedor, telefone_fornecedor) 
VALUES 
('Panificadora ABC', 'José Almeida', '111222333'),
('Fornecedora de Ingredientes', 'Maria Silva', '444555666');

INSERT INTO pedidos (id_cliente, data_pedido, status_pedido) 
VALUES 
(1, '2024-09-15', 'Pendente'),
(2, '2024-09-16', 'Concluído');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES 
(1, 1, 5, 1.50),
(1, 2, 2, 2.50),
(2, 3, 1, 15.00);

INSERT INTO estoque (id_produto, quantidade, data_entrada) 
VALUES 
(1, 100, '2024-09-10'),
(2, 50, '2024-09-12'),
(3, 30, '2024-09-14');

INSERT INTO vendas (id_cliente, data_venda, valor_total) 
VALUES 
(1, '2024-09-15', 9.50),
(2, '2024-09-16', 15.00);


















