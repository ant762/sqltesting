create database atividade11A;
use atividade11A;

create table cliente (
    id int auto_increment primary key not null,
	cpf varchar(11) not null,
    nome varchar(100) not null,
    sobrenome varchar(50) not null,
    sexo enum('F', 'M') not null
);

insert into cliente (id, nome, sobrenome, cpf, sexo) values
(1, 'Rosa', 'Azevedo', '88766934410', 'F'),
(2, 'Cintia', 'Silva', '36490291073', 'F'),
(3, 'Conrado', 'Martins', '26165924432', 'M'),
(4, 'Roberto', 'Nunes', '10534277203', 'M'),
(5, 'Tiago', 'Rocha', '63145054180', 'M'),
(6, 'João', 'Linhares', '18294062193', 'M'),
(7, 'Lurdes', 'Albuquerque', '87776772354', 'F'),
(8, 'Sara', 'Souza', '63798337099', 'F'),
(9, 'Larissa', 'Nunes', '73777022327', 'F'),
(10, 'Maurício', 'Machado', '34933861580', 'M');

update cliente set nome = 'Katia', sobrenome ='Chavez', cpf = '95427351301', sexo = 'F' where id = 5;
update cliente set nome = 'Paloma', sobrenome ='Nunes', cpf = '95427334567', sexo = 'F' where id = 10;
alter table cliente add column telefone varchar(11) not null;


update cliente set telefone = '47995675676' where id = 1;
update cliente set telefone = '47990988980' where id = 2;
update cliente set telefone = '47995686899' where id = 3;
update cliente set telefone = '47997865676' where id = 4;
update cliente set telefone = '47995656757' where id = 5;
update cliente set telefone = '47991098598' where id = 6;
update cliente set telefone = '47992866439' where id = 7;
update cliente set telefone = '47991067325' where id = 8;
update cliente set telefone = '47998462067' where id = 9;
update cliente set telefone = '47991009425' where id = 10;



select * from cliente