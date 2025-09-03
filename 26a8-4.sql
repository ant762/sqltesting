-- 4- Sistema de Gestão de Artistas e Eventos Culturais

-- Artistas: podem atuar em múltiplos eventos.

-- Eventos: cada evento tem data, local e tipo (show, exposição, palestra).

-- Ingressos: para cada evento, com assentos, preço e status.

-- Patrocinadores: vinculados a eventos, com aporte financeiro e visibilidade.
-- Desafio: criar modelo físico incluindo N:N entre artistas e eventos, controle de ingressos e patrocínios.

create database eventos_culturais;
use eventos_culturais;

create table artista (
    cod_artista int primary key auto_increment not null,
    nome varchar(100) not null,
    genero varchar(50),
    data_nascimento date,
    nacionalidade varchar(50)
);

create table tipo_evento (
    cod_tipo_evento int primary key auto_increment not null,
    nome varchar(50) not null
);

create table evento (
    cod_evento int primary key auto_increment not null,
    nome varchar(150) not null,
    data_evento datetime not null,
    local varchar(100) not null,
    cod_tipo_evento int not null,
    foreign key (cod_tipo_evento) references tipo_evento(cod_tipo_evento)
);

create table artista_evento (
    cod_artista int not null,
    cod_evento int not null,
    primary key (cod_artista, cod_evento),
    foreign key (cod_artista) references artista(cod_artista),
    foreign key (cod_evento) references evento(cod_evento)
);

-- Tabela de ingressos para cada evento
create table ingresso (
    cod_ingresso int primary key auto_increment not null,
    cod_evento int not null,
    assento varchar(10) not null,
    preco decimal(10,2) not null,
    status enum('disponível', 'vendido', 'reservado') default 'disponível',
    foreign key (cod_evento) references evento(cod_evento)
);

create table patrocinador (
    cod_patrocinador int primary key auto_increment not null,
    nome varchar(100) not null,
    aporte_financeiro decimal(15,2) not null,
    visibilidade varchar(50)
);

create table patrocinador_evento (
    cod_patrocinador int not null,
    cod_evento int not null,
    primary key (cod_patrocinador, cod_evento),
    foreign key (cod_patrocinador) references patrocinador(cod_patrocinador),
    foreign key (cod_evento) references evento(cod_evento)
);

-- inserts gerados por I.A abaixo pra testar --

-- Inserindo artistas
insert into artista (nome, genero, data_nascimento, nacionalidade) values
('João Santana', 'Música Popular Brasileira', '1985-05-15', 'Brasil'),
('Maria Clara', 'Artes Visuais', '1990-08-20', 'Brasil'),
('Carlos Mendes', 'Folk', '1982-12-10', 'Brasil');

-- Inserindo tipos de eventos
insert into tipo_evento (nome) values
('Show'),
('Exposição'),
('Palestra');

-- Inserindo eventos
insert into evento (nome, data_evento, local, cod_tipo_evento) values
('Festival de Música Brasileira', '2025-06-15 20:00:00', 'Arena Anhembi', 1),
('Exposição de Arte Contemporânea', '2025-07-01 10:00:00', 'Museu de Arte Moderna', 2),
('Palestra sobre Sustentabilidade', '2025-08-10 15:00:00', 'Centro Cultural São Paulo', 3);

-- Artistas participando de eventos
insert into artista_evento (cod_artista, cod_evento) values
(1, 1), -- João Santana no Festival de Música Brasileira
(2, 2), -- Maria Clara na Exposição de Arte Contemporânea
(3, 3), -- Carlos Mendes na Palestra sobre Sustentabilidade
(1, 3); -- João Santana também na Palestra sobre Sustentabilidade

-- Inserindo ingressos para o Festival de Música Brasileira
insert into ingresso (cod_evento, assento, preco, status) values
(1, 'A1', 150.00, 'disponível'),
(1, 'A2', 150.00, 'disponível'),
(1, 'B1', 100.00, 'vendido'),
(1, 'B2', 100.00, 'reservado');

-- Inserindo ingressos para a Exposição de Arte Contemporânea
insert into ingresso (cod_evento, assento, preco, status) values
(2, 'C1', 30.00, 'disponível'),
(2, 'C2', 30.00, 'disponível'),
(2, 'C3', 30.00, 'reservado');

-- Inserindo patrocinadores
insert into patrocinador (nome, aporte_financeiro, visibilidade) values
('Banco do Brasil', 50000.00, 'logomarca no evento'),
('Coca-Cola', 20000.00, 'stand e ações promocionais');

-- Inserindo patrocinadores vinculados aos eventos
insert into patrocinador_evento (cod_patrocinador, cod_evento) values
(1, 1), -- Banco do Brasil no Festival de Música Brasileira
(2, 2); -- Coca-Cola na Exposição de Arte Contemporânea
