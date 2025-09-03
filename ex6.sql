-- Sistema de Transporte
-- A empresa “TransLog” gerencia viagens e passageiros.

-- Campos sugeridos:
-- Motoristas: nome, CNH, telefone, data admissão.
-- Veículos: placa, modelo, marca, ano, capacidade.
-- Rotas: origem, destino, distância, duração estimada.
-- Viagens: motorista, veículo, rota, data partida, data chegada prevista.
-- Passageiros: nome, CPF, telefone, e-mail.
-- Bilhetes: viagem, passageiro, assento, valor.
-- Regras de negócio:
-- Capacidade do veículo não pode ser excedida.
-- Não vender bilhete para assento já ocupado.

CREATE DATABASE ex06;
USE ex06;

CREATE TABLE motoristas (
    idMotorista INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    cnh VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    dataAdmissao DATE NOT NULL
);

CREATE TABLE veiculos (
    placa VARCHAR(10) PRIMARY KEY NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    marca VARCHAR(45),
    ano INT,
    capacidade INT NOT NULL
);

CREATE TABLE rotas (
    idRota INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    origem VARCHAR(60) NOT NULL,
    destino VARCHAR(60) NOT NULL,
    distancia DECIMAL(10,2),
    duracaoEstimada TIME
);

CREATE TABLE viagens (
    idViagem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idMotoristaFk INT NOT NULL,
    placaVeiculoFk VARCHAR(10) NOT NULL,
    idRotaFk INT NOT NULL,
    dataPartida DATETIME NOT NULL,
    dataChegadaPrevista DATETIME,
    FOREIGN KEY (idMotoristaFk) REFERENCES motoristas (idMotorista),
    FOREIGN KEY (placaVeiculoFk) REFERENCES veiculos (placa),
    FOREIGN KEY (idRotaFk) REFERENCES rotas (idRota)
);

CREATE TABLE passageiros (
    idPassageiro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE bilhetes (
    idBilhete INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idViagemFk INT NOT NULL,
    idPassageiroFk INT NOT NULL,
    assento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idViagemFk) REFERENCES viagens (idViagem),
    FOREIGN KEY (idPassageiroFk) REFERENCES passageiros (idPassageiro)
);

INSERT INTO motoristas (nome, cnh, telefone, dataAdmissao) VALUES
('Carlos Mendes', '12345678900', '(47) 99999-1111', '2023-05-10'),
('Fernanda Costa', '98765432100', '(47) 98888-2222', '2024-01-15');

INSERT INTO veiculos (placa, modelo, marca, ano, capacidade) VALUES
('ABC1D23', 'Ônibus Executivo', 'Mercedes', 2021, 46),
('XYZ4E56', 'Micro-ônibus', 'Volkswagen', 2020, 24);

INSERT INTO rotas (origem, destino, distancia, duracaoEstimada) VALUES
('Florianópolis', 'Joinville', 180.00, '03:00:00'),
('Blumenau', 'Curitiba', 220.00, '04:00:00');

INSERT INTO viagens (idMotoristaFk, placaVeiculoFk, idRotaFk, dataPartida, dataChegadaPrevista) VALUES
(1, 'ABC1D23', 1, '2025-08-20 08:00:00', '2025-08-20 11:00:00'),
(2, 'XYZ4E56', 2, '2025-08-21 09:00:00', '2025-08-21 13:00:00');

INSERT INTO passageiros (nome, cpf, telefone, email) VALUES
('Lucas Almeida', '12345678911', '(47) 97777-3333', 'lucas.almeida@email.com'),
('Paula Ferreira', '98765432111', '(47) 96666-4444', 'paula.ferreira@email.com');

INSERT INTO bilhetes (idViagemFk, idPassageiroFk, assento, valor) VALUES
(1, 1, 10, 120.00),
(2, 2, 5, 90.00);

SELECT * FROM motoristas;