CREATE DATABASE FaculdadeDB;
USE FaculdadeDB;

CREATE TABLE Alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco TEXT,
    data_nascimento DATE
);

CREATE TABLE Professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco TEXT,
    departamento VARCHAR(50)
);

CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    carga_horaria INT
);

CREATE TABLE Turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    semestre ENUM('1º Semestre', '2º Semestre'),
    ano YEAR,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);

CREATE TABLE Matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id),
    FOREIGN KEY (id_turma) REFERENCES Turmas(id)
);

CREATE TABLE Aulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_turma INT,
    id_professor INT,
    data_aula DATETIME,
    FOREIGN KEY (id_turma) REFERENCES Turmas(id),
    FOREIGN KEY (id_professor) REFERENCES Professores(id)
);

-- Inserindo alunos
INSERT INTO Alunos (nome, email, telefone, endereco, data_nascimento) VALUES
('Ana Souza', 'ana.souza@example.com', '123456789', 'Rua A, 123', '2000-01-15'),
('Pedro Lima', 'pedro.lima@example.com', '987654321', 'Avenida B, 456', '1999-05-22');

-- Inserindo professores
INSERT INTO Professores (nome, email, telefone, endereco, departamento) VALUES
('Dr. João Silva', 'joao.silva@example.com', '234567890', 'Rua C, 789', 'Matemática'),
('Profa. Maria Oliveira', 'maria.oliveira@example.com', '876543210', 'Avenida D, 012', 'História');

-- Inserindo cursos
INSERT INTO Cursos (nome, descricao, carga_horaria) VALUES
('Matemática Básica', 'Curso introdutório de Matemática', 60),
('História Mundial', 'Curso sobre a história mundial', 80);

-- Inserindo turmas
INSERT INTO Turmas (id_curso, semestre, ano) VALUES
(1, '1º Semestre', 2024),
(2, '2º Semestre', 2024);

-- Inserindo matrículas
INSERT INTO Matriculas (id_aluno, id_turma, data_matricula) VALUES
(1, 1, NOW()),
(2, 2, NOW());

-- Inserindo aulas
INSERT INTO Aulas (id_turma, id_professor, data_aula) VALUES
(1, 1, '2024-09-20 08:00:00'),
(2, 2, '2024-09-21 10:00:00');

-- Atualizando o telefone de um aluno
UPDATE Alunos SET telefone = '111223344' WHERE id = 1;

-- Atualizando a descrição de um curso
UPDATE Cursos SET descricao = 'Curso introdutório de Matemática e Álgebra' WHERE id = 1;

-- Deletando uma matrícula
DELETE FROM Matriculas WHERE id = 1;

-- Deletando um professor
DELETE FROM Professores WHERE id = 2;

-- Selecionar todos os alunos
SELECT * FROM Alunos;

-- Selecionar todos os cursos com descrições distintas
SELECT DISTINCT descricao FROM Cursos;

-- Selecionar os 5 cursos mais longos (maior carga horária)
SELECT nome, carga_horaria FROM Cursos ORDER BY carga_horaria DESC LIMIT 5;

-- Criar uma nova tabela com alunos que estão matriculados em turmas específicas
CREATE TABLE AlunosMatriculados AS
SELECT a.nome, c.nome AS curso
FROM Alunos a
JOIN Matriculas m ON a.id = m.id_aluno
JOIN Turmas t ON m.id_turma = t.id
JOIN Cursos c ON t.id_curso = c.id;












