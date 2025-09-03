-- Sistema de ONG
-- A ONG “Solidariedade Ativa” precisa controlar voluntários, projetos e doações.

-- Campos sugeridos:
-- Voluntários: nome, CPF, telefone, e-mail, área atuação.
-- Projetos: nome, descrição, data início, data fim, responsável.
-- Participações: voluntário, projeto, função, horas dedicadas.
-- Doadores: nome, CPF/CNPJ, telefone, e-mail.
-- Doações: doador, projeto, valor, data, forma pagamento.
-- Regras de negócio:
-- Um voluntário pode participar de vários projetos.
-- Uma doação deve estar vinculada a um projeto específico.
-- Valor da doação deve ser maior que zero

CREATE DATABASE solidariedade_ativa;
USE solidariedade_ativa;

CREATE TABLE voluntarios (
    idVoluntario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    areaAtuacao VARCHAR(100)
);

CREATE TABLE projetos (
    idProjeto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    dataInicio DATETIME NOT NULL,
    dataFim DATETIME NOT NULL,
    responsavel VARCHAR(100) NOT NULL
);

CREATE TABLE participacoes (
    idParticipacao INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idVoluntario INT NOT NULL,
    idProjeto INT NOT NULL,
    funcao VARCHAR(100) NOT NULL,
    horasDedicadas INT NOT NULL CHECK (horasDedicadas > 0),
    FOREIGN KEY (idVoluntario) REFERENCES voluntarios (idVoluntario),
    FOREIGN KEY (idProjeto) REFERENCES projetos (idProjeto)
);

CREATE TABLE doadores (
    idDoador INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpfCnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE doacoes (
    idDoacao INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idDoador INT NOT NULL,
    idProjeto INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL CHECK (valor > 0),
    data DATETIME NOT NULL,
    formaPagamento ENUM('dinheiro', 'cartão', 'pix') NOT NULL,
    FOREIGN KEY (idDoador) REFERENCES doadores (idDoador),
    FOREIGN KEY (idProjeto) REFERENCES projetos (idProjeto)
);

INSERT INTO voluntarios (nome, cpf, telefone, email, areaAtuacao) VALUES
('voluntario unoo', '123.456.789-00', '(47) 99999-1234', 'voluntario.unoo@email.com', 'Educação'),
('voluntario doss', '987.654.321-00', '(47) 98888-5678', 'voluntario.doss@email.com', 'Saúde');

INSERT INTO projetos (nome, descricao, dataInicio, dataFim, responsavel) VALUES
('Projeto A', 'Ação de arrecadação de alimentos', '2025-09-01 08:00:00', '2025-09-10 18:00:00', 'Carlos Lima'),
('Projeto B', 'Campanha de vacinação', '2025-10-05 08:00:00', '2025-10-15 18:00:00', 'Maria Costa');

INSERT INTO participacoes (idVoluntario, idProjeto, funcao, horasDedicadas) VALUES
(1, 1, 'Coordenadora', 40),
(2, 2, 'Assistente de Saúde', 30);

INSERT INTO doadores (nome, cpfCnpj, telefone, email) VALUES
('doador unoo', '12.345.678/0001-99', '(47) 97777-3333', 'doador.unoo@email.com'),
('doador doss', '34.567.890/0001-11', '(47) 96666-4444', 'doador.doss@email.com');

INSERT INTO doacoes (idDoador, idProjeto, valor, data, formaPagamento) VALUES
(1, 1, 500.00, '2025-08-19 10:00:00', 'dinheiro'),
(2, 2, 300.00, '2025-08-19 11:00:00', 'cartão');
SELECT * FROM voluntarios;
SELECT * FROM projetos;
SELECT * FROM participacoes;
SELECT * FROM doadores;
SELECT * FROM doacoes;


