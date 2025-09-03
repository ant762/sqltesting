-- Sistema de Eventos
-- A empresa “ShowTime” organiza eventos e precisa registrar participantes e ingressos.

-- Campos sugeridos:
-- Eventos: nome, local, data, capacidade, valor ingresso.
-- Participantes: nome, CPF, e-mail, telefone.
-- Ingressos: evento, participante, assento, valor pago.
-- Organizadores: nome, CPF, e-mail, função.
-- Regras de negócio:
-- Capacidade máxima do evento não pode ser ultrapassada.
-- Um participante pode comprar vários ingressos, mas para o mesmo evento apenas 1 assento.
-- Todo ingresso deve estar vinculado a um evento.

CREATE DATABASE showtime;
USE showtime;

CREATE TABLE eventos (
    idEvento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    local VARCHAR(100) NOT NULL,
    data DATETIME NOT NULL,
    capacidade INT NOT NULL CHECK (capacidade > 0),
    valorIngresso DECIMAL(10, 2) NOT NULL CHECK (valorIngresso >= 0)
);

CREATE TABLE participantes (
    idParticipante INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE ingressos (
    idIngresso INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idEvento INT NOT NULL,
    idParticipante INT NOT NULL,
    assento VARCHAR(10) NOT NULL,
    valorPago DECIMAL(10, 2) NOT NULL CHECK (valorPago >= 0),
    FOREIGN KEY (idEvento) REFERENCES eventos (idEvento),
    FOREIGN KEY (idParticipante) REFERENCES participantes (idParticipante),
    CONSTRAINT unicoAssentoEvento UNIQUE (idEvento, assento)
);

CREATE TABLE organizadores (
    idOrganizador INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100),
    funcao VARCHAR(50)
);


INSERT INTO eventos (nome, local, data, capacidade, valorIngresso) VALUES
('show 1', 'Estádio A', '2025-09-01 20:00:00', 5000, 120.00),
('show 2', 'Centro de Convenções', '2025-10-15 19:00:00', 1000, 80.00);

INSERT INTO participantes (nome, cpf, email, telefone) VALUES
('pessoa um', '123.456.789-00', 'pessoa.um@email.com', '(47) 99999-3333'),
('pessoa dois da silva', '987.654.321-00', 'pessoa.dois@email.com', '(47) 98888-4444');

INSERT INTO organizadores (nome, cpf, email, funcao) VALUES
('organizador primeiro', '111.222.333-44', 'organizador.primeiro@email.com', 'Coordenador de Eventos'),
('organizador segundo', '555.666.777-88', 'organizador.segundo@email.com', 'Assistente de Produção');

INSERT INTO ingressos (idEvento, idParticipante, assento, valorPago) VALUES
(1, 1, 'A01', 120.00),
(1, 2, 'B02', 120.00);

SELECT * FROM eventos;
SELECT * FROM participantes;
SELECT * FROM ingressos;
SELECT * FROM organizadores;
