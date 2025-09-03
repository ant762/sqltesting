-- 1- Sistema de Cinema
-- O cinema “CineMais” precisa controlar:

-- Filmes: título, gênero, duração (minutos), classificação indicativa.
-- Salas: número, capacidade, tipo (2D, 3D, IMAX).
-- Sessões: filme, sala, data e hora, preço do ingresso.
-- Vendas: sessão, assento, cliente, data da venda.
-- Regras de negócio:
-- Uma sessão é vinculada a um único filme e sala.
-- Não é possível vender dois ingressos para o mesmo assento na mesma sessão.
-- A capacidade da sala deve ser respeitada.

CREATE DATABASE ex01;
USE ex01;

CREATE TABLE Filmes (
	idFilme INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    
    titulo VARCHAR (45),
    genero varchar (45),
    duracaoMin INT,
    classificacaoIndicativa INT NOT NULL

);

CREATE TABLE Salas (
	idSala INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    
	numero INT,
    capacidade INT,
    tipo VARCHAR (4)
    
);

CREATE TABLE Sessoes (
	idSessoes INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    
    dataHora DATETIME,
    precoIngresso INT,
    
    idFilmeFK INT,
    FOREIGN KEY (idFilmeFK) REFERENCES Filmes (idFilme),
    
    idSalaFK INT,
    FOREIGN KEY (idSalaFK) REFERENCES Salas (idSala)
    

);

INSERT INTO Filmes (titulo, genero, duracaoMin, classificacaoIndicativa) VALUES
	("Carros 1", "Infantil/Comédia", 117, 0),
    ("Carros 2", "Infantil/Comédia", 106, 0);
    
INSERT INTO Salas (numero, capacidade, tipo) VALUES
	(111, 50, "3D"),
    (222, 50, "2D");

INSERT INTO Sessoes (dataHora, precoIngresso, idFilmeFK, idSalaFK) VALUES
	('2025-08-14 10:00:00', 30, 1, 2),
	('2025-8-15 10:30:00', 25, 2, 1);

SELECT * FROM Filmes;
SELECT * FROM Salas;
SELECT * FROM Sessoes;
