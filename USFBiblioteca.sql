-- BANCO DE DADOS
-- Atividade Avaliativa - Unidade 3 - Tarefa
-- CURSO: ENGENHARIA DE SOFTWARE


-- DEFININDO AS ESTRUTURAS DO BANCO DE DADOS USANDO DDL (Linguagem de Definição de Dados)

CREATE DATABASE USFBiblioteca
USE USFBiblioteca


CREATE TABLE Periodo (
	ID_Periodo INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
)

CREATE TABLE Tipo (
	ID_Tipo INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
)

CREATE TABLE Curso(
	ID_Curso INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	ID_Periodo INT REFERENCES Periodo(ID_Periodo),
    ID_Tipo INT REFERENCES Tipo(ID_Tipo)
)

CREATE TABLE Aluno (
	ID_Aluno INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	RA CHAR(9) NOT NULL,
	CPF CHAR(11) NOT NULL,
	ID_Curso INT REFERENCES Curso(ID_Curso)
)

CREATE TABLE GeneroLivro (
	ID_Genero INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL

)

CREATE TABLE Livro (
	ID_Livro INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	ID_Genero INT REFERENCES GeneroLivro(ID_Genero)
)

CREATE TABLE Funcionario (
	ID_Funcionario INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
)

CREATE TABLE Emprestimo (
	ID_Emprestimo INT IDENTITY(1,1) PRIMARY KEY,
	ID_Aluno INT REFERENCES Aluno(ID_Aluno),
    ID_Livro INT REFERENCES Livro(ID_Livro),
	DataRetirada DATE NOT NULL,
	DataDevolucaoEsperada DATE NOT NULL,
	DataDevolucaoEfetiva DATE NULL,
	ID_Funcionario INT REFERENCES Funcionario(ID_Funcionario)
)


-- INSERINDO DADOS NAS RESPECTIVAS TABELAS USANDO DML (Linguagem de Manipulação de Dados)
INSERT INTO Periodo (Nome) VALUES ('Matutino')
INSERT INTO Periodo (Nome) VALUES ('Vespertino')
INSERT INTO Periodo (Nome) VALUES ('Noturno')
INSERT INTO Periodo (Nome) VALUES ('EAD')


INSERT INTO Tipo (Nome) VALUES ('Presencial')
INSERT INTO Tipo (Nome) VALUES ('EAD')
INSERT INTO Tipo (Nome) VALUES ('Semipresencial')


INSERT INTO Curso (Nome, ID_Periodo, ID_Tipo) VALUES ('Engenharia Civil', 1, 1)
INSERT INTO Curso (Nome, ID_Periodo, ID_Tipo) VALUES ('Matem�tica', 2, 2)
INSERT INTO Curso (Nome, ID_Periodo, ID_Tipo) VALUES ('Medicina', 3, 1)
INSERT INTO Curso (Nome, ID_Periodo, ID_Tipo) VALUES ('Direito', 4, 1)
INSERT INTO Curso (Nome, ID_Periodo, ID_Tipo) VALUES ('Administra��o', 3, 2)


INSERT INTO Aluno (Nome, RA, CPF, ID_Curso) VALUES ('Jo�o Silva', '123456789', '79848834753', 1)
INSERT INTO Aluno (Nome, RA, CPF, ID_Curso) VALUES ('Maria Oliveira', '234567890', '31966615043', 2)
INSERT INTO Aluno (Nome, RA, CPF, ID_Curso) VALUES ('Carlos Souza', '345678901', '86203784818', 3)
INSERT INTO Aluno (Nome, RA, CPF, ID_Curso) VALUES ('Ana Costa', '456789012', '77137279813', 4)
INSERT INTO Aluno (Nome, RA, CPF, ID_Curso) VALUES ('Pedro Lima', '567890123', '23258180393', 5)


INSERT INTO GeneroLivro (Nome) VALUES ('Tecnologia')
INSERT INTO GeneroLivro (Nome) VALUES ('Anatomia')
INSERT INTO GeneroLivro (Nome) VALUES ('Biologia')
INSERT INTO GeneroLivro (Nome) VALUES ('Ci�ncias Exatas')
INSERT INTO GeneroLivro (Nome) VALUES ('Terror')


INSERT INTO Livro (Nome, ID_Genero) VALUES ('Fundamentos de Engenharia', 1)
INSERT INTO Livro (Nome, ID_Genero) VALUES ('Anatomia Humana', 2)
INSERT INTO Livro (Nome, ID_Genero) VALUES ('Biologia Molecular', 3)
INSERT INTO Livro (Nome, ID_Genero) VALUES ('C�lculo Diferencial', 4)
INSERT INTO Livro (Nome, ID_Genero) VALUES ('It - A Coisa', 5)


INSERT INTO Funcionario (Nome) VALUES ('Lucas Martins')
INSERT INTO Funcionario (Nome) VALUES ('Fernanda Alves')
INSERT INTO Funcionario (Nome) VALUES ('Roberto Dias')
INSERT INTO Funcionario (Nome) VALUES ('Mariana Borges')
INSERT INTO Funcionario (Nome) VALUES ('Paulo Correia')


INSERT INTO Emprestimo (ID_Aluno, ID_Livro, DataRetirada, DataDevolucaoEsperada, DataDevolucaoEfetiva, ID_Funcionario)
VALUES (1, 1, '2024-10-01', '2024-10-15', '2024-10-14', 1)
INSERT INTO Emprestimo (ID_Aluno, ID_Livro, DataRetirada, DataDevolucaoEsperada, DataDevolucaoEfetiva, ID_Funcionario)
VALUES (2, 2, '2024-10-05', '2024-10-20', '2024-10-22', 2)
INSERT INTO Emprestimo (ID_Aluno, ID_Livro, DataRetirada, DataDevolucaoEsperada, DataDevolucaoEfetiva, ID_Funcionario)
VALUES (3, 3, '2024-10-10', '2024-10-25', NULL, 3); -- Empr�stimo ainda n�o devolvido
INSERT INTO Emprestimo (ID_Aluno, ID_Livro, DataRetirada, DataDevolucaoEsperada, DataDevolucaoEfetiva, ID_Funcionario)
VALUES (4, 4, '2024-10-12', '2024-10-27', '2024-10-27', 4)
INSERT INTO Emprestimo (ID_Aluno, ID_Livro, DataRetirada, DataDevolucaoEsperada, DataDevolucaoEfetiva, ID_Funcionario)
VALUES (5, 5, '2024-10-15', '2024-10-30', NULL, 5); -- Empr�stimo ainda n�o devolvido



-- TESTANDO CONSULTAS SIMPLES USANDO DQL (Linguagem de Consulta de Dados)

SELECT
	Emprestimo.ID_Emprestimo,
	Aluno.Nome AS 'Nome do Aluno',
	Aluno.RA,
	Aluno.CPF,
	Curso.Nome AS 'Nome do Curso',
	Periodo.Nome AS 'Periodo',
	Tipo.Nome AS 'Tipo',
	Livro.Nome AS 'Livro',
	GeneroLivro.Nome AS 'Genero',
	Funcionario.Nome AS 'Nome do Funcionario',
	Emprestimo.DataRetirada,
	Emprestimo.DataDevolucaoEsperada,
	Emprestimo.DataDevolucaoEfetiva
FROM
	Emprestimo
JOIN Aluno ON Emprestimo.ID_Aluno = Aluno.ID_Aluno
JOIN Curso ON Aluno.ID_Curso = Curso.ID_Curso
JOIN Periodo ON Curso.ID_Periodo = Periodo.ID_Periodo
JOIN Tipo ON Curso.ID_Tipo = Tipo.ID_Tipo
JOIN Livro ON Emprestimo.ID_Livro = Livro.ID_Livro
JOIN GeneroLivro ON Livro.ID_Genero = GeneroLivro.ID_Genero
JOIN Funcionario ON Emprestimo.ID_Funcionario = Funcionario.ID_Funcionario