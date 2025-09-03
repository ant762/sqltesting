-- Sistema de Hotel
-- O Hotel “Sol e Mar” precisa controlar reservas e hóspedes.

-- Campos sugeridos:
-- Hóspedes: nome, CPF, telefone, e-mail, data nascimento.
-- Quartos: número, categoria, valor diária, status.
-- Categorias: nome, descrição.
-- Reservas: hóspede, quarto, data entrada, data saída, status.
-- Pagamentos: reserva, valor, data, forma.
-- Regras de negócio:
-- Um quarto não pode ter duas reservas no mesmo período.
-- Reserva deve ter hóspede e quarto.

 

CREATE DATABASE ex03;
USE ex03;

CREATE TABLE hospedes (
    cpf VARCHAR(14) PRIMARY KEY NOT NULL,
    nome VARCHAR(60) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_nascimento DATE
);

CREATE TABLE categorias (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    descricao TEXT
);

CREATE TABLE quartos (
    numero INT PRIMARY KEY NOT NULL,
    idCategoriaFK INT NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL,
    status VARCHAR(20), -- Ex: 'Disponível', 'Ocupado', 'Manutenção'
    FOREIGN KEY (idCategoriaFK) REFERENCES categorias (idCategoria)
);

CREATE TABLE reservas (
    idReserva INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cpfHospedeFK VARCHAR(14) NOT NULL,
    numeroQuartoFK INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    status VARCHAR(20), -- Ex: 'Ativa', 'Concluída', 'Cancelada'
    FOREIGN KEY (cpfHospedeFK) REFERENCES hospedes (cpf),
    FOREIGN KEY (numeroQuartoFK) REFERENCES quartos (numero)
);

CREATE TABLE pagamentos (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idReservaFK INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    forma_pagamento VARCHAR(30), -- Ex: 'Cartão', 'Dinheiro', 'Pix'
    FOREIGN KEY (idReservaFK) REFERENCES reservas (idReserva)
);

INSERT INTO hospedes (cpf, nome, telefone, email, data_nascimento) VALUES
('12345678901', 'João da Silva', '(47) 99999-1111', 'joao.silva@email.com', '1988-05-14'),
('98765432100', 'Maria Oliveira', '(47) 98888-2222', 'maria.oliveira@email.com', '1992-11-30'),
('45678912377', 'Carlos Souza', '(47) 97777-3333', 'carlos.souza@email.com', '1985-07-21');

INSERT INTO categorias (nome, descricao) VALUES
('Standard', 'Quarto simples com cama de casal e banheiro privativo'),
('Luxo', 'Quarto espaçoso com vista para o mar e varanda'),
('Suíte Master', 'Suíte completa com hidromassagem e varanda panorâmica');

INSERT INTO quartos (numero, idCategoriaFK, valor_diaria, status) VALUES
(101, 1, 200.00, 'Disponível'),
(102, 2, 350.00, 'Disponível'),
(201, 3, 500.00, 'Ocupado');

INSERT INTO reservas (cpfHospedeFK, numeroQuartoFK, data_entrada, data_saida, status) VALUES
('12345678901', 101, '2025-08-20', '2025-08-25', 'Ativa'),
('98765432100', 102, '2025-08-18', '2025-08-22', 'Concluída');

INSERT INTO pagamentos (idReservaFK, valor, data_pagamento, forma_pagamento) VALUES
(1, 1000.00, '2025-08-15', 'Pix'),
(2, 1400.00, '2025-08-10', 'Cartão');

SELECT * FROM hospedes;
