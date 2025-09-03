-- Atividade 5 – Cinema
-- Crie um banco de dados para um cinema com as seguintes tabelas:

-- Filmes (id_filme, titulo, genero, duracao)

-- Salas (id_sala, numero, capacidade)

-- Sessoes (id_sessao, id_filme, id_sala, data_hora)

-- 👉 Comando:

-- Crie as tabelas relacionando filmes e salas nas sessões.

-- Insira 4 filmes, 3 salas e 5 sessões.

create database cinema;
use cinema;

create table filmes (
    id_filme int auto_increment primary key not null,
    titulo varchar(100) not null,
    genero varchar(50) not null,
    duracao int not null
);

create table salas (
    id_sala int auto_increment primary key not null,
    numero int not null,
    capacidade int not null
);

create table sessoes (
    id_sessao int auto_increment primary key not null,
    id_filme int not null,
    id_sala int not null,
    data_hora datetime not null,
    foreign key (id_filme) references filmes(id_filme),
    foreign key (id_sala) references salas(id_sala)
);

INSERT INTO filmes (titulo, genero, duracao) VALUES
('Filme A', 'Ação', 120),
('Filme B', 'Comédia', 90),
('Filme C', 'Drama', 110),
('Filme D', 'Terror', 100);

INSERT INTO salas (numero, capacidade) VALUES
(1, 100),
(2, 80),
(3, 60);

INSERT INTO sessoes (id_filme, id_sala, data_hora) VALUES
(1, 1, '2024-08-20 19:00:00'),
(2, 2, '2024-08-20 20:00:00'),
(3, 3, '2024-08-21 18:00:00'),
(4, 1, '2024-08-21 21:00:00'),
(1, 2, '2024-08-22 19:30:00');

select * from filmes;
select * from salas;
select * from sessoes;
