-- 2- Sistema de Gestão de Conferências Internacionais

-- Uma instituição organiza conferências com múltiplos eventos simultâneos.

-- Participantes: podem ser palestrantes ou ouvintes (ou ambos).

-- Eventos: cada conferência tem várias sessões, podendo ser palestras, workshops ou mesas-redondas.

-- Salas: cada sessão ocorre em uma sala com capacidade limitada.

-- Inscrições: participantes se inscrevem em eventos específicos, com limite de vagas.

-- Certificados: gerados automaticamente quando a participação é confirmada.
-- Desafio: modelar relações N:N, histórico de participação e restrições de capacidade.

create database conferencia_internacional;
use conferencia_internacional;

create table participante (
    cod_participante int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) unique not null,
    tipo enum('palestrante', 'ouvinte', 'ambos') not null default 'ouvinte'
);

create table sala (
    cod_sala int primary key auto_increment,
    nome varchar(50) not null,
    capacidade int not null
);

create table evento (
    cod_evento int primary key auto_increment,
    titulo varchar(150) not null,
    tipo enum('palestra', 'workshop', 'mesa-redonda') not null,
    data_hora datetime not null,
    cod_sala int not null,
    foreign key (cod_sala) references sala(cod_sala)
);

create table inscricao (
    cod_inscricao int primary key auto_increment,
    cod_participante int not null,
    cod_evento int not null,
    status enum('inscrito', 'confirmado', 'presente', 'ausente') default 'inscrito',
    data_inscricao datetime default current_timestamp,
    foreign key (cod_participante) references participante(cod_participante),
    foreign key (cod_evento) references evento(cod_evento),
    unique (cod_participante, cod_evento)
);

create table certificado (
    cod_certificado int primary key auto_increment,
    cod_inscricao int not null,
    data_emissao datetime default current_timestamp,
    arquivo_url varchar(255),
    foreign key (cod_inscricao) references inscricao(cod_inscricao)
);


-- inserts, gerados por I.A para testar--

-- Participantes
insert into participante (nome, email, tipo) values
('Ana Ribeiro', 'ana@email.com', 'ouvinte'),
('Carlos Mendes', 'carlos@email.com', 'palestrante'),
('Julia Lopes', 'julia@email.com', 'ambos'),
('Paulo Silva', 'paulo@email.com', 'ouvinte'),
('Marina Costa', 'marina@email.com', 'palestrante');

-- Salas
insert into sala (nome, capacidade) values
('Auditório Principal', 100),
('Sala Workshop A', 30),
('Sala Workshop B', 25),
('Sala de Conferências 1', 50),
('Sala de Conferências 2', 40);

-- Eventos
insert into evento (titulo, tipo, data_hora, cod_sala) values
('Futuro da IA', 'palestra', '2025-09-10 09:00:00', 1),
('Workshop de Machine Learning', 'workshop', '2025-09-10 11:00:00', 2),
('Mesa-redonda: Ética na Tecnologia', 'mesa-redonda', '2025-09-10 14:00:00', 1),
('Inovação em Robótica', 'palestra', '2025-09-11 10:00:00', 4),
('Desenvolvimento Sustentável', 'workshop', '2025-09-11 14:00:00', 5);

-- Inscrições (participantes se inscrevendo em eventos)
insert into inscricao (cod_participante, cod_evento, status) values
(1, 1, 'presente'),
(1, 2, 'confirmado'),
(2, 1, 'presente'),
(3, 3, 'presente'),
(4, 1, 'inscrito'),
(4, 4, 'confirmado'),
(5, 5, 'inscrito'),
(3, 4, 'presente'),
(2, 5, 'ausente');

-- Certificados gerados após participação confirmada
insert into certificado (cod_inscricao, arquivo_url) values
(1, 'https://certificados.com/ana_ia2025.pdf'),
(3, 'https://certificados.com/carlos_ia2025.pdf'),
(4, 'https://certificados.com/julia_etica2025.pdf'),
(8, 'https://certificados.com/julia_robotica2025.pdf');
