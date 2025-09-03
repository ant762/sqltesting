-- Sistema de Restaurante
-- O restaurante “Sabor Caseiro” deseja informatizar o controle de pedidos e cardápio.

-- Campos sugeridos:
-- Clientes: nome, telefone, e-mail.
-- Mesas: número, capacidade, status (livre, ocupada).
-- Cardápio: prato, descrição, preço, categoria (entrada, prato principal, sobremesa, bebida).
-- Pedidos: número, mesa, cliente (opcional), data, status.
-- ItensPedido: pedido, prato, quantidade, preço unitário.
-- Pagamentos: pedido, valor total, forma pagamento, data.
-- Regras de negócio:
-- Uma mesa pode ter apenas um pedido ativo por vez.
-- Pedido pode conter vários pratos.
-- Não permitir preço negativo.


CREATE DATABASE ex07;
USE ex07;

CREATE TABLE clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE mesas (
    numero INT PRIMARY KEY NOT NULL,
    capacidade INT NOT NULL,
    status ENUM('livre', 'ocupada') NOT NULL
);

-- Tabela de Cardápio
CREATE TABLE cardapio (
    idPrato INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    prato VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) CHECK (preco >= 0) NOT NULL,
    categoria ENUM('entrada', 'prato principal', 'sobremesa', 'bebida') NOT NULL
);

CREATE TABLE pedidos (
    idPedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numeroMesa INT NOT NULL,
    idCliente INT,
    data DATETIME NOT NULL,
    status ENUM('ativo', 'finalizado') NOT NULL,
    FOREIGN KEY (numeroMesa) REFERENCES mesas (numero),
    FOREIGN KEY (idCliente) REFERENCES clientes (idCliente)
);

CREATE TABLE itensPedido (
    idItem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idPedido INT NOT NULL,
    idPrato INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    precoUnitario DECIMAL(10,2) CHECK (precoUnitario >= 0) NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES pedidos (idPedido),
    FOREIGN KEY (idPrato) REFERENCES cardapio (idPrato)
);

CREATE TABLE pagamentos (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idPedido INT NOT NULL,
    valorTotal DECIMAL(10,2) NOT NULL CHECK (valorTotal >= 0),
    formaPagamento ENUM('dinheiro', 'cartão', 'pix') NOT NULL,
    data DATETIME NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES pedidos (idPedido)
);


INSERT INTO clientes (nome, telefone, email) VALUES
('pessoa uma', '(47) 99999-1111', 'joao.silva@email.com'),
('pessoa duas', '(47) 98888-2222', 'maria.oliveira@email.com');

INSERT INTO mesas (numero, capacidade, status) VALUES
(1, 4, 'livre'),
(2, 2, 'ocupada'),
(3, 6, 'livre');

INSERT INTO cardapio (prato, descricao, preco, categoria) VALUES
('coisa 1', 'Salada com alface, frango grelhado e molho Caesar', 25.00, 'entrada'),
('coisa 2', 'Feijão preto com carnes e acompanhamentos', 45.00, 'prato principal'),
('coisa 3', 'Sobremesa de leite condensado e caramelo', 15.00, 'sobremesa'),
('coisa 4', 'Cerveja gelada', 8.00, 'bebida');

INSERT INTO pedidos (numeroMesa, idCliente, data, status) VALUES
(1, 1, '2025-08-19 12:30:00', 'ativo'),
(2, 2, '2025-08-19 13:00:00', 'finalizado');

INSERT INTO itensPedido (idPedido, idPrato, quantidade, precoUnitario) VALUES
(1, 2, 2, 45.00),
(1, 3, 1, 15.00);

INSERT INTO pagamentos (idPedido, valorTotal, formaPagamento, data) VALUES
(1, 105.00, 'cartão', '2025-08-19 13:00:00');

SELECT * FROM clientes;
SELECT * FROM mesas;
SELECT * FROM cardapio;
SELECT * FROM pedidos;
SELECT * FROM itensPedido;
SELECT * FROM pagamentos;
