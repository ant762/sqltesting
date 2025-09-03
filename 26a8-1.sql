-- 1 - E-commerce de Produtos Artesanais

-- Um marketplace conecta vendedores de produtos artesanais a compradores. O sistema precisa conter:

-- Usuários: podem ser compradores e/ou vendedores.

-- Produtos: cadastrados por vendedores, com preço, estoque, categoria e fotos.

-- Pedidos: compostos por vários itens, com status de pagamento e entrega.

-- Pagamentos: podem ser cartão, pix ou boleto, e devem registrar parcelas.

-- Avaliações: compradores podem avaliar produtos e vendedores separadamente.

-- Logística: sistema registra transportadora, código de rastreio e prazo de entrega.

create database ecommerce_artesanal;
use ecommerce_artesanal;

create table usuario (
    cod_usuario int primary key auto_increment not null,
    nome varchar(100) not null,
    email varchar(100) unique not null,
    telefone varchar(15),
    senha varchar(255) not null,  -- ideal para hash
    tipo_usuario enum('comprador', 'vendedor', 'ambos') not null default 'comprador',
    data_cadastro datetime default current_timestamp
);

create table categoria (
    cod_categoria int primary key auto_increment not null,
    nome varchar(50) not null
);

create table produto (
    cod_produto int primary key auto_increment not null,
    nome varchar(100) not null,
    descricao text,
    preco decimal(10,2) not null,
    estoque int not null,
    cod_categoria int not null,
    cod_vendedor int not null,
    foreign key (cod_categoria) references categoria(cod_categoria),
    foreign key (cod_vendedor) references usuario(cod_usuario)
);

create table foto_produto (
    cod_foto int primary key auto_increment not null,
    cod_produto int not null,
    url varchar(255) not null,
    foreign key (cod_produto) references produto(cod_produto)
);

create table logistica (
    cod_logistica int primary key auto_increment not null,
    transportadora varchar(100) not null,
    cod_rastreio varchar(50) unique not null,
    prazo_entrega varchar(50) not null
);

create table pedido (
    cod_pedido int primary key auto_increment not null,
    cod_comprador int not null,
    data_pedido datetime default current_timestamp,
    status_pagamento enum('pendente', 'pago', 'cancelado') default 'pendente',
    status_entrega enum('pendente', 'em_transito', 'entregue', 'cancelado') default 'pendente',
    cod_logistica int,
    foreign key (cod_comprador) references usuario(cod_usuario),
    foreign key (cod_logistica) references logistica(cod_logistica)
);

create table item_pedido (
    cod_item int primary key auto_increment not null,
    cod_pedido int not null,
    cod_produto int not null,
    quantidade int not null,
    preco_unitario decimal(10,2) not null,
    foreign key (cod_pedido) references pedido(cod_pedido),
    foreign key (cod_produto) references produto(cod_produto)
);

create table pagamento (
    cod_pagamento int primary key auto_increment not null,
    cod_pedido int not null,
    metodo_pagamento enum('cartao', 'pix', 'boleto') not null,
    valor_pago decimal(10,2) not null,
    parcelas int default 1,
    data_pagamento datetime default current_timestamp,
    foreign key (cod_pedido) references pedido(cod_pedido)
);

create table avaliacao_produto (
    cod_avaliacao int primary key auto_increment not null,
    cod_produto int not null,
    cod_comprador int not null,
    nota int not null check (nota between 1 and 5),
    comentario text,
    data_avaliacao datetime default current_timestamp,
    foreign key (cod_produto) references produto(cod_produto),
    foreign key (cod_comprador) references usuario(cod_usuario)
);

create table avaliacao_vendedor (
    cod_avaliacao int primary key auto_increment not null,
    cod_vendedor int not null,
    cod_comprador int not null,
    nota int not null check (nota between 1 and 5),
    comentario text,
    data_avaliacao datetime default current_timestamp,
    foreign key (cod_vendedor) references usuario(cod_usuario),
    foreign key (cod_comprador) references usuario(cod_usuario)
);

-- exemplos de insert. Tudo abaixo é gerado por I.A
insert into usuario (nome, email, telefone, senha, tipo_usuario) values
('Lucas Silva', 'lucas@email.com', '(11) 91234-5678', 'hashsenha1', 'ambos'),
('Maria Oliveira', 'maria@email.com', '(21) 99876-5432', 'hashsenha2', 'comprador'),
('Carla Souza', 'carla@email.com', '(31) 98765-4321', 'hashsenha3', 'vendedor');

-- Inserindo categorias de produtos
insert into categoria (nome) values
('Joias Artesanais'),
('Cerâmica'),
('Tecidos e Roupas');

-- Inserindo produtos (vendedor: Carla Souza)
insert into produto (nome, descricao, preco, estoque, cod_categoria, cod_vendedor) values
('Colar de Miçangas', 'Colar feito à mão com miçangas coloridas.', 50.00, 10, 1, 3),
('Vaso de Cerâmica Azul', 'Vaso decorativo artesanal em cerâmica.', 120.00, 5, 2, 3),
('Lenço de Algodão', 'Lenço feito com algodão orgânico, pintado à mão.', 35.00, 15, 3, 3);

-- Inserindo fotos dos produtos
insert into foto_produto (cod_produto, url) values
(1, 'http://exemplo.com/fotos/colar1.jpg'),
(1, 'http://exemplo.com/fotos/colar2.jpg'),
(2, 'http://exemplo.com/fotos/vaso1.jpg'),
(3, 'http://exemplo.com/fotos/lenco1.jpg');

-- Inserindo logística (exemplo)
insert into logistica (transportadora, cod_rastreio, prazo_entrega) values
('Correios', 'BR123456789', '5-7 dias úteis'),
('Jadlog', 'JD987654321', '3-5 dias úteis');

-- Inserindo pedidos (comprador: Maria Oliveira)
insert into pedido (cod_comprador, status_pagamento, status_entrega, cod_logistica) values
(2, 'pago', 'em_transito', 1),
(2, 'pendente', 'pendente', null);

-- Inserindo itens dos pedidos
insert into item_pedido (cod_pedido, cod_produto, quantidade, preco_unitario) values
(1, 1, 2, 50.00),  -- 2 colares
(1, 3, 1, 35.00),  -- 1 lenço
(2, 2, 1, 120.00); -- vaso no pedido pendente

-- Inserindo pagamentos
insert into pagamento (cod_pedido, metodo_pagamento, valor_pago, parcelas) values
(1, 'cartao', 135.00, 1);

-- Inserindo avaliações de produtos (Maria avaliando produtos)
insert into avaliacao_produto (cod_produto, cod_comprador, nota, comentario) values
(1, 2, 5, 'Produto lindo e acabamento excelente!'),
(3, 2, 4, 'Lenço com ótima qualidade, recomendo.');

-- Inserindo avaliações de vendedores (Maria avaliando Carla)
insert into avaliacao_vendedor (cod_vendedor, cod_comprador, nota, comentario) values
(3, 2, 5, 'Vendedora atenciosa e entrega rápida!');
