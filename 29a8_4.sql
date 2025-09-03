-- Atividade 4 – Clínica Médica
-- Crie um banco de dados para uma clínica médica com as seguintes tabelas:

-- Medicos (id_medico, nome, especialidade)

-- Pacientes (id_paciente, nome, telefone)

-- Consultas (id_consulta, id_medico, id_paciente, data_consulta)

-- 👉 Comando:

-- Crie as tabelas com relacionamento médico–paciente.

-- Insira 3 médicos, 4 pacientes e 5 consultas.

create database clinica_medica;
use clinica_medica;

create table medicos (
    id_medico int auto_increment primary key not null,
    nome varchar(100) not null,
    especialidade varchar(100) not null
);

create table pacientes (
    id_paciente int auto_increment primary key not null,
    nome varchar(100) not null,
    telefone varchar(20) not null
);

create table consultas (
    id_consulta int auto_increment primary key not null,
    id_medico int not null,
    id_paciente int not null,
    data_consulta datetime not null,
    foreign key (id_medico) references medicos(id_medico),
    foreign key (id_paciente) references pacientes(id_paciente)
);

INSERT INTO medicos (nome, especialidade) VALUES
('Dr. João', 'Cardiologia'),
('Dra. Maria', 'Pediatria'),
('Dr. Carlos', 'Ortopedia');

INSERT INTO pacientes (nome, telefone) VALUES
('Paciente 1', '1111-2222'),
('Paciente 2', '3333-4444'),
('Paciente 3', '5555-6666'),
('Paciente 4', '7777-8888');

INSERT INTO consultas (id_medico, id_paciente, data_consulta) VALUES
(1, 1, '2024-08-10 09:00:00'),
(1, 2, '2024-08-10 10:00:00'),
(2, 3, '2024-08-11 14:00:00'),
(2, 4, '2024-08-11 15:00:00'),
(3, 1, '2024-08-12 16:30:00');

select * from medicos;
select * from pacientes;
select * from consultas;
