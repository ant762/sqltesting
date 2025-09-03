create database cinemais;
use cinemais;

create table filmes (
	codigo integer(8) not null primary key,
	titulo varchar(200) not null,
	genero varchar(100) not null,
	duracao time,
	classificacao integer(2) not null
);

create table salas(
	numero integer(2) not null primary key,
	capacidade integer(3) not null,
	tipo varchar(4) not null check (tipo IN ('2D','3D','IMAX'))
);

create table sessoes(
	codigo integer(5) not null primary key,
	dia date not null, 
	preco decimal(3) not null,
	numero_sala integer(2),
	foreign key(numero_sala) references salas(numero),
	codigo_filme integer(8),
	foreign key(codigo_filme) references filmes(codigo)
);

create table vendas(
	assento integer(5) not null primary key,
	cliente varchar(100) not null,
	dia date not null,
	codigo_sessao integer(5),
	foreign key(codigo_sessao) references sessoes(codigo)
);