create database atividade10;
use atividade10;

create table cliente (
	id int auto_increment primary key,
	nome varchar(50) not null,
	sobrenome varchar(50) not null,
	cpf varchar(20) not null,
	turno enum('m', 'v', 'n') not null
);

 -- a parte abaixo dos inserts foi gerado pelo chatgpt para economizar o tempo na hora de testar.
INSERT INTO cliente (nome, sobrenome, cpf, turno) VALUES
('Carla', 'Silva', '58588513636', 'V'),
('Pedro', 'Souza', '21936216434', 'M'),
('Leonardo', 'Azevedo', '67828203186', 'N'),
('Paula', 'Martins', '52291852700', 'V'),
('Jéssica', 'Pereira', '29023136305', 'V'),
('Camila', 'Rocha', '47371884380', 'N'),
('José', 'Silva', '77249832191', 'M'),
('Marcelo', 'Souza', '33600044896', 'M'),
('Mônica', 'Martins', '77910572670', 'V'),
('Vitor', 'Machado', '60862093388', 'N');
-- acabou o chatgpt

alter table cliente add column nascimento date after sobrenome;


select * from cliente;


-- a parte abaixo dos UPDATES foram geradas pelo chatgpt para economizar o tempo na hora de testar.

UPDATE cliente SET nascimento = '1995-03-10' WHERE id = 1;
UPDATE cliente SET nascimento = '1990-06-25' WHERE id = 2;
UPDATE cliente SET nascimento = '1992-11-13' WHERE id = 3;
UPDATE cliente SET nascimento = '1998-07-01' WHERE id = 4;
UPDATE cliente SET nascimento = '1997-04-21' WHERE id = 5;
UPDATE cliente SET nascimento = '1996-12-15' WHERE id = 6;
UPDATE cliente SET nascimento = '1989-08-08' WHERE id = 7;
UPDATE cliente SET nascimento = '1993-09-18' WHERE id = 8;
UPDATE cliente SET nascimento = '1994-02-02' WHERE id = 9;
UPDATE cliente SET nascimento = '1991-10-30' WHERE id = 10;

