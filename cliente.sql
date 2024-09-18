-- Cria a tabela clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    PRIMARY KEY (id_cliente)
);

-- Cria a tabela pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATE,
    valor DECIMAL(10, 2),
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Adiciona a coluna telefone na tabela clientes
ALTER TABLE clientes
ADD telefone VARCHAR(15);

-- Cria um índice na coluna data_pedido da tabela pedidos
CREATE INDEX idx_data_pedido
ON pedidos (data_pedido);

-- Remove a tabela pedidos e todos os seus dados
DROP TABLE pedidos;

-- Adiciona uma restrição UNIQUE ao campo email na tabela clientes
ALTER TABLE clientes
ADD CONSTRAINT unique_email UNIQUE (email);

-- Para adicionar uma restrição CHECK (em versões recentes do MySQL) em pedidos
ALTER TABLE pedidos
ADD CONSTRAINT check_valor
CHECK (valor > 0);

