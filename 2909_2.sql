create database atividade05B;
use atividade05B;

create table alunos (
    matricula int auto_increment primary key not null,
    nome varchar(100) not null,
    sexo enum('F', 'M') not null,
    idade int(2) not null
);

insert into alunos (matricula, nome, sexo, idade) values
(1, 'Marcelo Medeiros',  'M', 35),
(2, 'Ana Paula Berlim',  'F', 25),
(3, 'Lucas Silva',  'M', 7),
(4, 'Caroline Silva',  'F', 19),
(5, 'Djalma Medeiros',  'M', 65),
(6, 'Artur Paes',  'M', 5),
(7, 'Eduarda Duda',  'F', 8);


select * from alunos;

select * from alunos where sexo = 'M';

select * from alunos where substring_index(nome, ' ', -1) = 'Medeiros'; # tive que pesquisar isso. basicamente, ele apaga a primeira parte e pesquisa só pela segunda (depois do espaço)

select avg(idade) as media_idade from alunos;

select max(idade) as maior_idade from alunos;

select count(*) as quantidade_alunos_menor_20 from alunos where idade < 20;

select matricula, idade from alunos where nome = 'Lucas Silva';

select nome, idade from Alunos order by idade asc limit 1;

select count(*) as quantidade_masculinos_10_20 from alunos where idade between 10 and 20 and sexo = 'M';

select count(*) as quantidade_mulheres from alunos where sexo = 'F';

select nome from alunos where nome like 'A%' and sexo = 'M';

update alunos set idade = 20 where nome = 'Caroline Silva';

delete from alunos where nome = 'Djalma Medeiros';
