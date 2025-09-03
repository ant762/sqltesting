-- Atividade 3 – Loja Online
-- Crie um banco de dados para uma loja online com as seguintes tabelas:

-- Clientes (id_cliente, nome, email)

-- Produtos (id_produto, nome, preco)

-- Pedidos (id_pedido, id_cliente, data_pedido)

-- 👉 Comando:

-- Crie as tabelas com relacionamento cliente-pedido.

-- Insira 4 clientes, 5 produtos e 3 pedidos.



create database loja_online;
use loja_online;

create table clientes (
    id_cliente int auto_increment primary key not null,
    nome varchar(100) not null,
    email varchar(100) not null
);

create table produtos (
    id_produto int auto_increment primary key not null,
    nome varchar(100) not null,
    preco decimal(10,2) not null
);

create table pedidos (
    id_pedido int auto_increment primary key not null,
    id_cliente int not null,
    data_pedido datetime not null,
    foreign key (id_cliente) references clientes(id_cliente)
);

INSERT INTO clientes (nome, email) VALUES
('Cliente A', 'clientea@email.com'),
('Cliente B', 'clienteb@email.com'),
('Cliente C', 'clientec@email.com'),
('Cliente D', 'cliented@email.com');

INSERT INTO produtos (nome, preco) VALUES
('Produto 1', 19.90),
('Produto 2', 39.50),
('Produto 3', 15.00),
('Produto 4', 100.00),
('Produto 5', 75.75);

INSERT INTO pedidos (id_cliente, data_pedido) VALUES
(1, '2024-08-01 10:00:00'),
(2, '2024-08-02 15:30:00'),
(3, '2024-08-03 18:45:00');

select * from clientes;
select * from produtos;
select * from pedidos;
