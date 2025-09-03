-- Atividade 2 – Escola
-- Crie um banco de dados para uma escola com as seguintes tabelas:

-- Alunos (id_aluno, nome, data_nascimento)

-- Cursos (id_curso, nome_curso, carga_horaria)

-- Matriculas (id_matricula, id_aluno, id_curso, data_matricula)

-- 👉 Comando:

-- Crie as tabelas, relacionando aluno e curso via matrícula.

-- Insira 5 alunos, 3 cursos e pelo menos 5 matrículas.

create database escola;
use escola;

create table alunos (
	id_aluno int auto_increment primary key not null,
	nome varchar(100) not null,
	data_nascimento datetime not null

);

create table cursos (
	id_curso int auto_increment primary key not null,
	nome_curso varchar(100) not null,
    carga_horaria int(10) not null
    
);


create table matriculas (
	id_matricula int auto_increment primary key not null,
    id_aluno int not null,
	id_curso int not null,
	data_matricula datetime not null,
	foreign key (id_aluno) references alunos (id_aluno),
	foreign key (id_curso) references cursos (id_curso)

);

INSERT INTO alunos (nome, data_nascimento) VALUES
('aluno fulano', '2007-01-06 12:53:00'),
('aluno ciclano', '2008-01-06 12:52:00'),
('aluno beutrano', '2009-01-06 12:51:00'),
('aluno samaritano', '2008-01-06 12:52:00'),
('aluno levita', '2009-01-06 12:51:00');

INSERT INTO cursos (nome_curso, carga_horaria) VALUES
('desenvolvimento de sistemas', 24),
('curso de portugol', 3600),
('curso de programação em html5 e css', 7200);

INSERT INTO matriculas (id_aluno, id_curso, data_matricula) VALUES
(1, 1, '2020-01-27 12:53:00'),
(2, 2, '2020-01-27 12:57:00'),
(3, 3, '2020-01-27 12:56:00'),
(4, 1, '2020-01-27 12:55:00'),
(5, 2, '2020-01-27 12:54:00');



select * from alunos;
select * from cursos;
select * from matriculas;