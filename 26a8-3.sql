-- 3 - Sistema de Gestão de Competições Esportivas

-- Competições: têm várias modalidades e categorias.

-- Atletas: podem competir em múltiplas modalidades e equipes.

-- Equipes: compostas por atletas e treinadores.

-- Resultados: registram posição, pontuação e medalhas.
-- Desafio: modelar relacionamentos complexos N:N e histórico de participação, com chaves compostas e restrições de integridade.

create database competicoes_esportivas;
use competicoes_esportivas;

create table competicao (
    cod_competicao int primary key auto_increment not null,
    nome varchar(150) not null,
    data_inicio date not null,
    data_fim date not null,
    local varchar(150) not null
);

create table modalidade (
    cod_modalidade int primary key auto_increment not null,
    nome varchar(100) not null
);

create table categoria (
    cod_categoria int primary key auto_increment not null,
    nome varchar(100) not null
);

create table competicao_modalidade_categoria (
    cod_competicao int not null,
    cod_modalidade int not null,
    cod_categoria int not null,
    primary key (cod_competicao, cod_modalidade, cod_categoria),
    foreign key (cod_competicao) references competicao(cod_competicao),
    foreign key (cod_modalidade) references modalidade(cod_modalidade),
    foreign key (cod_categoria) references categoria(cod_categoria)
);

create table atleta (
    cod_atleta int primary key auto_increment not null,
    nome varchar(100) not null,
    data_nascimento date,
    nacionalidade varchar(50)
);

create table equipe (
    cod_equipe int primary key auto_increment not null,
    nome varchar(100) not null,
    pais varchar(50)
);

create table treinador (
    cod_treinador int primary key auto_increment not null,
    nome varchar(100) not null,
    telefone varchar(20)
);

create table atleta_equipe (
    cod_atleta int not null,
    cod_equipe int not null,
    primary key (cod_atleta, cod_equipe),
    foreign key (cod_atleta) references atleta(cod_atleta),
    foreign key (cod_equipe) references equipe(cod_equipe)
);

create table treinador_equipe (
    cod_treinador int not null,
    cod_equipe int not null,
    primary key (cod_treinador, cod_equipe),
    foreign key (cod_treinador) references treinador(cod_treinador),
    foreign key (cod_equipe) references equipe(cod_equipe)
);

create table participacao (
    cod_participacao int primary key auto_increment not null,
    cod_atleta int not null,
    cod_competicao int not null,
    cod_modalidade int not null,
    cod_categoria int not null,
    cod_equipe int,
    foreign key (cod_atleta) references atleta(cod_atleta),
    foreign key (cod_competicao) references competicao(cod_competicao),
    foreign key (cod_modalidade) references modalidade(cod_modalidade),
    foreign key (cod_categoria) references categoria(cod_categoria),
    foreign key (cod_equipe) references equipe(cod_equipe),
    unique (cod_atleta, cod_competicao, cod_modalidade, cod_categoria)
);

create table resultado (
    cod_resultado int primary key auto_increment not null,
    cod_participacao int not null,
    posicao int not null,
    pontuacao decimal(10,2) not null,
    medalha enum('ouro', 'prata', 'bronze', 'nenhuma') default 'nenhuma',
    foreign key (cod_participacao) references participacao(cod_participacao)
);

-- inserts gerados por I.A para fins de teste lá --

-- Competições
insert into competicao (nome, data_inicio, data_fim, local) values
('Campeonato Nacional 2025', '2025-07-01', '2025-07-10', 'São Paulo'),
('Jogos Regionais 2025', '2025-09-05', '2025-09-15', 'Rio de Janeiro');

-- Modalidades
insert into modalidade (nome) values
('Atletismo'),
('Natação'),
('Futebol');

-- Categorias
insert into categoria (nome) values
('Masculino'),
('Feminino'),
('Sub-18'),
('Profissional');

-- Relacionando competições com modalidades e categorias
insert into competicao_modalidade_categoria (cod_competicao, cod_modalidade, cod_categoria) values
(1, 1, 1), -- Campeonato Nacional - Atletismo - Masculino
(1, 1, 2), -- Campeonato Nacional - Atletismo - Feminino
(1, 2, 1), -- Campeonato Nacional - Natação - Masculino
(2, 3, 3); -- Jogos Regionais - Futebol - Sub-18

-- Atletas
insert into atleta (nome, data_nascimento, nacionalidade) values
('João Silva', '2005-04-15', 'Brasil'),
('Ana Paula', '2003-12-01', 'Brasil'),
('Carlos Mendes', '2000-07-20', 'Brasil');

-- Equipes
insert into equipe (nome, pais) values
('Time A', 'Brasil'),
('Time B', 'Brasil');

-- Treinadores
insert into treinador (nome, telefone) values
('Roberto Costa', '(11) 99999-1111'),
('Fernanda Lima', '(21) 98888-2222');

-- Atletas em equipes
insert into atleta_equipe (cod_atleta, cod_equipe) values
(1, 1),
(2, 1),
(3, 2);

-- Treinadores em equipes
insert into treinador_equipe (cod_treinador, cod_equipe) values
(1, 1),
(2, 2);

-- Participações
insert into participacao (cod_atleta, cod_competicao, cod_modalidade, cod_categoria, cod_equipe) values
(1, 1, 1, 1, 1), -- João - Campeonato Nacional - Atletismo Masculino - Time A
(2, 1, 2, 2, 1), -- Ana Paula - Campeonato Nacional - Natação Feminino - Time A
(3, 2, 3, 3, 2); -- Carlos - Jogos Regionais - Futebol Sub-18 - Time B

-- Resultados
insert into resultado (cod_participacao, posicao, pontuacao, medalha) values
(1, 1, 10.0, 'ouro'),
(2, 2, 8.5, 'prata'),
(3, 3, 6.0, 'bronze');

