-- A clínica “Vida Plena” precisa de um sistema para:
-- Pacientes: nome, CPF, telefone, endereço, data de nascimento.
-- Médicos: CRM, nome, especialidade, telefone, e-mail.
-- Consultas: paciente, médico, data e hora, motivo, diagnóstico, prescrição.
-- Especialidades: nome e descrição.
-- Regras de negócio:
-- Um paciente pode ter várias consultas com médicos diferentes.
-- Cada consulta deve registrar médico e paciente obrigatoriamente.
-- As prescrições médicas devem ser armazenadas como texto.

CREATE DATABASE ex02;
USE ex02;

CREATE TABLE pacientes (
    cpf VARCHAR(14) PRIMARY KEY NOT NULL,
    
    nome VARCHAR(45),
    telefone VARCHAR(20),
    endereco VARCHAR(100),
    dataNascimento DATE
);

CREATE TABLE medicos (
    CRM VARCHAR(15) PRIMARY KEY NOT NULL,
    
    nome VARCHAR(45),
    especialidade VARCHAR(45),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE consultas (
    idConsulta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    
    dataHora DATETIME,
    motivo TEXT,
    diagnostico TEXT,
    prescricao TEXT,
    idPacienteFK VARCHAR(14),
    FOREIGN KEY (idPacienteFK) REFERENCES pacientes (cpf),
    idMedicoFK VARCHAR(15),
    FOREIGN KEY (idMedicoFK) REFERENCES medicos (CRM)
);

INSERT INTO pacientes (cpf, nome, telefone, endereco, dataNascimento) VALUES
('12345678901', 'João da Silva', '(47) 99999-1111', 'Rua das Flores, 123 - Jaraguá do Sul/SC', '1988-05-14'),
('98765432100', 'Maria Oliveira', '(47) 98888-2222', 'Av. Central, 456 - Blumenau/SC', '1992-11-30'),
('45678912377', 'Carlos Souza', '(47) 97777-3333', 'Rua das Palmeiras, 789 - Joinville/SC', '1985-07-21');

INSERT INTO medicos (crm, nome, especialidade, telefone, email) VALUES
('CRM-SC 12345', 'Dr. Pedro Almeida', 'Cardiologia', '(47) 96666-4444', 'pedro.almeida@hospital.com'),
('CRM-SC 54321', 'Dra. Ana Costa', 'Pediatria', '(47) 95555-5555', 'ana.costa@clinica.com'),
('CRM-SC 67890', 'Dr. Felipe Martins', 'Ortopedia', '(47) 94444-6666', 'felipe.martins@saude.com');

SELECT * FROM pacientes;
