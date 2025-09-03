-- Oficina Mecânica
-- A oficina “Mecânica Rápida” quer informatizar ordens de serviço.

-- Campos sugeridos:
-- Clientes: nome, CPF, telefone, endereço.
-- Veículos: placa, modelo, marca, ano, cliente.
-- Ordens de Serviço: número, data abertura, data fechamento, status, valor total.
-- Serviços: nome, descrição, valor.
-- Peças: nome, fabricante, valor.
-- ItensServico: OS, serviço, quantidade, valor unitário.
-- ItensPeça: OS, peça, quantidade, valor unitário.
-- Regras de negócio:
-- Veículo pode ter várias OS.
-- OS pode ter vários serviços e peças.

CREATE DATABASE ex04;
USE ex04;

CREATE TABLE clientes (
    cpf VARCHAR(14) PRIMARY KEY NOT NULL,
    nome VARCHAR(60) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(100)
);

CREATE TABLE veiculos (
    placa VARCHAR(10) PRIMARY KEY NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    marca VARCHAR(45),
    ano INT,
    cpfClienteFk VARCHAR(14) NOT NULL,
    FOREIGN KEY (cpfClienteFk) REFERENCES clientes (cpf)
);

CREATE TABLE ordensServico (
    numero INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    placaVeiculoFk VARCHAR(10) NOT NULL,
    dataAbertura DATE NOT NULL,
    dataFechamento DATE,
    status VARCHAR(20),
    valorTotal DECIMAL(10,2),
    FOREIGN KEY (placaVeiculoFk) REFERENCES veiculos (placa)
);

CREATE TABLE servicos (
    idServico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    descricao TEXT,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE pecas (
    idPeca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    fabricante VARCHAR(60),
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE itensServico (
    idItemServico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numeroOsFk INT NOT NULL,
    idServicoFk INT NOT NULL,
    quantidade INT NOT NULL,
    valorUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (numeroOsFk) REFERENCES ordensServico (numero),
    FOREIGN KEY (idServicoFk) REFERENCES servicos (idServico)
);

CREATE TABLE itensPeca (
    idItemPeca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numeroOsFk INT NOT NULL,
    idPecaFk INT NOT NULL,
    quantidade INT NOT NULL,
    valorUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (numeroOsFk) REFERENCES ordensServico (numero),
    FOREIGN KEY (idPecaFk) REFERENCES pecas (idPeca)
);

INSERT INTO clientes (cpf, nome, telefone, endereco) VALUES
('12345678901', 'José Pereira', '(47) 99999-1111', 'Rua das Flores, 123'),
('98765432100', 'Ana Souza', '(47) 98888-2222', 'Av. Brasil, 456');

INSERT INTO veiculos (placa, modelo, marca, ano, cpfClienteFk) VALUES
('ABC1D23', 'Civic', 'Honda', 2020, '12345678901'),
('XYZ4E56', 'Corolla', 'Toyota', 2021, '98765432100');

INSERT INTO ordensServico (placaVeiculoFk, dataAbertura, dataFechamento, status, valorTotal) VALUES
('ABC1D23', '2025-08-10', NULL, 'Aberta', 0.00),
('XYZ4E56', '2025-08-05', '2025-08-12', 'Concluida', 850.00);

INSERT INTO servicos (nome, descricao, valor) VALUES
('Troca de óleo', 'Substituição do óleo do motor', 150.00),
('Alinhamento', 'Ajuste da geometria das rodas', 120.00);

INSERT INTO pecas (nome, fabricante, valor) VALUES
('Filtro de óleo', 'Bosch', 50.00),
('Pneu Aro 15', 'Michelin', 300.00);

INSERT INTO itensServico (numeroOsFk, idServicoFk, quantidade, valorUnitario) VALUES
(1, 1, 1, 150.00),
(2, 2, 1, 120.00);

INSERT INTO itensPeca (numeroOsFk, idPecaFk, quantidade, valorUnitario) VALUES
(1, 1, 1, 50.00),
(2, 2, 2, 300.00);

SELECT * FROM clientes;
