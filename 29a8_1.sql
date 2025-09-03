-- Atividade 1 – Biblioteca
-- Crie um banco de dados para uma biblioteca com as seguintes tabelas:

-- Autores (id_autor, nome, nacionalidade)

-- Livros (id_livro, titulo, ano_publicacao, id_autor)

-- Usuarios (id_usuario, nome, email)

-- 👉 Comando:

-- Crie as tabelas com chaves primárias e estrangeiras.

-- Insira 3 autores, 5 livros e 4 usuários.

create database biblioteca;
use biblioteca;

create table autores (
	id_autor int auto_increment primary key,
	nome varchar(100) not null,
	nacionalidade varchar(100) not null

);

create table livros (
	id_livro int auto_increment primary key,
	titulo varchar(100) not null,
    ano_publicacao int(4) not null,
    id_autor int,
    foreign key (id_autor) references autores (id_autor)
);


create table usuarios (
	id_usuario int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null
);

INSERT INTO autores (id_autor, nome, nacionalidade) VALUES
('1', 'Fiódor Dostoiévski', 'Russo'),
('2', 'Chuck Palahniuk', 'Estadounidense'),
('3', 'Kentaro Miura', 'Japonês');

INSERT INTO livros (titulo, ano_publicacao, id_autor) VALUES
('Crime e Castigo', '1866', '1'),
('Clube da Luta', '1996', '2'),
('Berserk: Deluxe Edition Vol. 1', '2019', '3'),
('Berserk: Deluxe Edition Vol. 2', '2019', '3'),
('Berserk: Deluxe Edition Vol. 3', '2019', '3');

INSERT INTO usuarios (nome, email) VALUES
('jubiscleito da silva primeiro', 'jubiscleitodasilvaprimeiro@gmail.com'),
('jubiscleito da silva segundo', 'jubiscleitodasilvasegundo@gmail.com'),
('jubiscleito da silva terceiro', 'jubiscleitodasilvaterceiro@gmail.com'),
('jubiscleito da silva quarto', 'jubiscleitodasilvaquarto@gmail.com');




select * from livros;
select * from usuarios;
select * from autores;