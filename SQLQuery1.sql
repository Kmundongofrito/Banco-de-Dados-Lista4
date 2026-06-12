CREATE DATABASE LocadoraDB;

USE LocadoraDB;

CREATE TABLE Diretores (
Id INT PRIMARY KEY IDENTITY,
Nome VARCHAR(200) not null UNIQUE
);

CREATE TABLE Generos (
Id INT PRIMARY KEY IDENTITY,
Nome VARCHAR(200) not null UNIQUE
);

CREATE TABLE Filmes (
Id INT PRIMARY KEY IDENTITY,
Titulo VARCHAR(150) not null UNIQUE,
Ano INT,
IdDiretor INT,
FOREIGN KEY (IdDiretor)
	REFERENCES Diretores(Id)
);

CREATE TABLE FilmesGeneros (
Id INT PRIMARY KEY IDENTITY,
IdFilme INT,
IdGenero INT,
FOREIGN KEY (IdFilme)
	REFERENCES Filmes(Id),
FOREIGN KEY (IdGenero)
	REFERENCES Generos(Id)
);

CREATE TABLE Clientes (
Id INT PRIMARY KEY IDENTITY,
Nome VARCHAR(200),
Email VARCHAR(100)
);

CREATE TABLE Locacoes (
Id INT PRIMARY KEY IDENTITY,
IdClient INT,
IdFilme INT,
DataLocacao Date,
FOREIGN KEY (IdCliente)
REFERENCES Clientes(Id),
FOREIGN KEY (IdFilme)
REFERENCES Filmes(Id)
);

INSERT INTO Generos(Nome)
VALUES ('Ação'),
('Drama'),
('Ficção Científica');

INSERT INTO Diretores(Nome)
VALUES ('Christopher Nolan'),
('Quentin Tarantino');

INSERT INTO Filmes(Titulo, Ano, IdDiretor)
VALUES ('A Origem', 2010, 1),
('Django Livre', 2012, 2),
('Interestelar', 2014, 1);

INSERT INTO FilmesGeneros(IdFilme, IdGenero)
VALUES (1,1),
(1,3),
(2,2),
(3,2),
(3,3);

SELECT * FROM Filmes;