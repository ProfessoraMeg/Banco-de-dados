CREATE DATABASE MeuBancoDeDados;
USE MeuBancoDeDados;

CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE Transacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    valor DECIMAL(10, 2) NOT NULL,
    data_transacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Criar um novo usuário
CREATE USER 'usuario_normal'@'localhost' IDENTIFIED BY 'senha_forte';

-- Conceder permissões limitadas
GRANT SELECT, INSERT, UPDATE ON MeuBancoDeDados.Usuarios TO 'usuario_normal'@'localhost';
GRANT SELECT, INSERT ON MeuBancoDeDados.Transacoes TO 'usuario_normal'@'localhost';

-- Revogar permissões se necessário
REVOKE DELETE ON MeuBancoDeDados.Transacoes FROM 'usuario_normal'@'localhost';

-- Este comando é apenas um exemplo. No código do aplicativo, use uma função de hashing
-- como bcrypt ou Argon2 para hash da senha antes de armazená-la.
INSERT INTO Usuarios (nome, email, senha) VALUES ('João', 'joao@example.com', 'senha_hashada');

CREATE VIEW VistaTransacoes AS
SELECT 
    u.nome AS usuario_nome,
    t.valor,
    t.data_transacao
FROM 
    Transacoes t
JOIN 
    Usuarios u ON t.usuario_id = u.id;
    
    SELECT * FROM VistaTransacoes;







