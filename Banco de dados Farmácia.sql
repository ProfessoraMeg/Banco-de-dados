CREATE DATABASE farmacia;
USE farmacia;

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

CREATE INDEX idx_nome_produto ON produtos (nome_produto);

CREATE INDEX idx_data_pedido ON pedidos (data_pedido);

INSERT INTO categorias (nome_categoria) VALUES ('Medicamentos'), ('Suplementos'), ('Cosméticos');

INSERT INTO produtos (nome_produto, descricao, preco, id_categoria, quantidade_estoque) 
VALUES 
('Paracetamol 500mg', 'Alívio da dor e febre', 10.00, 1, 100),
('Vitamina C 1000mg', 'Suplemento vitamínico', 25.00, 2, 50),
('Creme Hidratante', 'Creme para pele seca', 15.00, 3, 30);

INSERT INTO clientes (nome_cliente, email_cliente, telefone_cliente, endereco_cliente) 
VALUES 
('João Silva', 'joao.silva@example.com', '123456789', 'Rua das Flores, 123'),
('Maria Oliveira', 'maria.oliveira@example.com', '987654321', 'Avenida Central, 456');

INSERT INTO fornecedores (nome_fornecedor, contato_fornecedor, telefone_fornecedor) 
VALUES 
('Farmacorp Ltda', 'Carlos Santos', '111222333'),
('Saúde e Vida', 'Ana Costa', '444555666');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES 
(1, 1, 2, 10.00),
(1, 2, 1, 25.00),
(2, 3, 3, 15.00);


