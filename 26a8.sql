#  02 - MODELO FÍSICO
# 1 - Criar o banco de dados “maternidade”.
# 2 - Criar as tabelas: “bebe”, “mae” e “medico”, conforme imagem do Diagrama ER. Ao criar
# as tabelas, não esquecer dos atributos e principalmente das chaves primárias e estrangeiras.

create database maternidade;
use maternidade;

create table mae (
    cod_mae int primary key auto_increment not null,
    nome varchar(100) not null,
    datanascmae datetime not null,
    telefone varchar(15),
    endereco varchar(100),
    cpf varchar(14) unique not null
);

create table bebe (
    cod_bebe int primary key auto_increment not null,
    nome varchar(100) not null,
    datanascbebe datetime not null,
    peso decimal(5,2),
    altura decimal(4,1),
    cod_mae int,
    foreign key (cod_mae) references mae(cod_mae)
);

create table medico (
    crm varchar(15) primary key not null,
    nome varchar(100) not null,
    especialidade varchar(45) not null,
    telefone varchar(15),
    email varchar(100),
    horario_atendimento varchar(50)
);


-- inserts gerados com I.A para teste. NÃO escrevi o código abaixo --
insert into mae (nome, datanascmae, telefone, endereco, cpf) values
('ana silva', '1985-04-15', '(11) 91234-5678', 'rua das flores, 123, sao paulo, sp', '123.456.789-00'),
('mariana oliveira', '1990-07-22', '(21) 99876-5432', 'av. brasil, 456, rio de janeiro, rj', '234.567.890-01'),
('juliana santos', '1982-12-01', '(31) 98765-4321', 'praça da república, 789, belo horizonte, mg', '345.678.901-02');

insert into medico (crm, nome, especialidade, telefone, email, horario_atendimento) values
('123456', 'dr. pedro alves', 'ginecologia', '(11) 98765-4321', 'pedro.alves@email.com', '08:00 - 16:00'),
('789012', 'dr. carlos pereira', 'obstetrícia', '(21) 97654-3210', 'carlos.pereira@email.com', '09:00 - 17:00'),
('345678', 'dr. lucas costa', 'pediatria', '(31) 96543-2109', 'lucas.costa@email.com', '10:00 - 18:00');

insert into bebe (nome, datanascbebe, peso, altura, cod_mae) values
('pedro silva', '2025-08-01 10:30:00', 3.200, 50, 1),  -- Bebê de Ana Silva
('julia oliveira', '2025-08-02 14:45:00', 2.800, 48, 2),  -- Bebê de Mariana Oliveira
('miguel santos', '2025-08-03 09:15:00', 3.350, 52, 3);  -- Bebê de Juliana Santos
