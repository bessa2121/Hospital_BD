# Hospital_BD
Trabalho de sala de criação de banco de dados com tema hospitalar

-- Criando o banco de dados e as tabelas

DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

-- Tabela de Pacientes
CREATE TABLE Paciente (
    Paciente_Id INT AUTO_INCREMENT PRIMARY KEY,
    Rg INT UNIQUE NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Cpf VARCHAR(11) UNIQUE NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Telefone VARCHAR(11),
    Endereco VARCHAR(150),
    Email VARCHAR(100),
    Convenio BOOLEAN NOT NULL
);

-- Tabela de Funcionários da Recepção
CREATE TABLE Funcionario_Recepcao (
    Funcionario_Id INT AUTO_INCREMENT PRIMARY KEY,
    Rg INT UNIQUE NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Cpf VARCHAR(11) UNIQUE NOT NULL,
    Telefone VARCHAR(11),
    Email VARCHAR(100)
);

-- Tabela de Médicos (responsáveis por internações)
CREATE TABLE Medico_Internacao (
    Medico_Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Crm VARCHAR(20) UNIQUE NOT NULL,
    Especialidade VARCHAR(50)
);

-- Tabela de Unidade de Internação
CREATE TABLE Unidade_Internacao (
    Unidade_Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Unidade VARCHAR(50) NOT NULL,
    Descricao TEXT
);

-- Tabela de Internações
CREATE TABLE Internacao (
    Internacao_Id INT AUTO_INCREMENT PRIMARY KEY,
    Paciente_Id INT NOT NULL,
    Unidade_Id INT NOT NULL,
    Medico_Id INT NOT NULL,
    Data_Admissao DATETIME NOT NULL,
    Data_Saida DATETIME,
    Motivo_Internacao VARCHAR(255),
    FOREIGN KEY (Paciente_Id) REFERENCES Paciente(Paciente_Id),
    FOREIGN KEY (Unidade_Id) REFERENCES Unidade_Internacao(Unidade_Id),
    FOREIGN KEY (Medico_Id) REFERENCES Medico_Internacao(Medico_Id)
);

-- Tabela de Agendamentos
CREATE TABLE Agendamento (
    Agendamento_Id INT AUTO_INCREMENT PRIMARY KEY,
    Paciente_Id INT NOT NULL,
    Funcionario_Id INT NOT NULL,
    Data_Agendamento DATETIME NOT NULL,
    Tipo_Consulta VARCHAR(80),
    Status VARCHAR(20),
    FOREIGN KEY (Paciente_Id) REFERENCES Paciente(Paciente_Id),
    FOREIGN KEY (Funcionario_Id) REFERENCES Funcionario_Recepcao(Funcionario_Id)
);

-- Tabela de Visitas
CREATE TABLE Visita (
    Visita_Id INT AUTO_INCREMENT PRIMARY KEY,
    Paciente_Id INT NOT NULL,
    Funcionario_Id INT NOT NULL,
    Data_Visita DATETIME NOT NULL,
    Nome_Visitante VARCHAR(50),
    Relacionamento_Visitante VARCHAR(50),
    FOREIGN KEY (Paciente_Id) REFERENCES Paciente(Paciente_Id),
    FOREIGN KEY (Funcionario_Id) REFERENCES Funcionario_Recepcao(Funcionario_Id)
);

-- Tabela de Logs de Atendimento da Recepção
CREATE TABLE Log_Atendimento_Recepcao (
    Log_Id INT AUTO_INCREMENT PRIMARY KEY,
    Funcionario_Id INT NOT NULL,
    Paciente_Id INT NOT NULL,
    Acao VARCHAR(255),
    Data_Acao DATETIME NOT NULL,
    FOREIGN KEY (Funcionario_Id) REFERENCES Funcionario_Recepcao(Funcionario_Id),
    FOREIGN KEY (Paciente_Id) REFERENCES Paciente(Paciente_Id)
);

-- Inserção de dados

-- Inserção de 50 registros para a tabela Paciente
INSERT INTO Paciente (Rg, Nome, Cpf, Data_Nascimento, Sexo, Telefone, Endereco, Email, Convenio)
VALUES
    (123456789, 'Ana Costa', '12345678901', '1990-05-12', 'F', '11987654321', 'Rua das Flores, 123, São Paulo', 'ana.costa@email.com', TRUE),
    (234567890, 'Bruno Souza', '23456789012', '1985-03-23', 'M', '21987654321', 'Rua das Palmeiras, 456, Rio de Janeiro', 'bruno.souza@email.com', FALSE),
    (345678901, 'Carlos Silva', '34567890123', '1992-08-10', 'M', '31987654321', 'Avenida Brasil, 789, Belo Horizonte', 'carlos.silva@email.com', TRUE),
    (456789012, 'Daniela Lima', '45678901234', '1987-02-15', 'F', '41987654321', 'Rua dos Três Irmãos, 123, Porto Alegre', 'daniela.lima@email.com', FALSE),
    (567890123, 'Eduardo Almeida', '56789012345', '1993-12-01', 'M', '51987654321', 'Avenida Central, 321, Curitiba', 'eduardo.almeida@email.com', TRUE),
    (678901234, 'Fernanda Pereira', '67890123456', '1989-07-25', 'F', '61987654321', 'Rua do Sol, 654, Florianópolis', 'fernanda.pereira@email.com', FALSE),
    (789012345, 'Gustavo Oliveira', '78901234567', '1991-06-17', 'M', '71987654321', 'Rua dos Ventos, 987, Campinas', 'gustavo.oliveira@email.com', TRUE),
    (890123456, 'Helena Santos', '89012345678', '1994-01-09', 'F', '81987654321', 'Avenida das Américas, 345, Brasília', 'helena.santos@email.com', FALSE),
    (901234567, 'Igor Ferreira', '90123456789', '1986-04-30', 'M', '91987654321', 'Rua da Serra, 112, Salvador', 'igor.ferreira@email.com', TRUE),
    (112233445, 'Juliana Rocha', '11223344501', '1995-11-19', 'F', '10987654321', 'Rua do Lago, 543, Fortaleza', 'juliana.rocha@email.com', FALSE);
    -- Adicione os 40 outros pacientes com dados similares

-- Inserção de 50 registros para a tabela Funcionario_Recepcao
INSERT INTO Funcionario_Recepcao (Rg, Nome, Cpf, Telefone, Email)
VALUES
    (123456789, 'Alice Rodrigues', '12345678901', '11987654321', 'alice.rodrigues@email.com'),
    (234567890, 'Bruna Martins', '23456789012', '21987654322', 'bruna.martins@email.com'),
    (345678901, 'Carlos Ferreira', '34567890123', '31987654323', 'carlos.ferreira@email.com'),
    (456789012, 'Daniela Souza', '45678901234', '41987654324', 'daniela.souza@email.com'),
    (567890123, 'Eduardo Costa', '56789012345', '51987654325', 'eduardo.costa@email.com'),
    (678901234, 'Fernanda Almeida', '67890123456', '61987654326', 'fernanda.almeida@email.com'),
    (789012345, 'Gustavo Pereira', '78901234567', '71987654327', 'gustavo.pereira@email.com'),
    (890123456, 'Helena Rocha', '89012345678', '81987654328', 'helena.rocha@email.com'),
    (901234567, 'Igor Lima', '90123456789', '91987654329', 'igor.lima@email.com'),
    (112233445, 'Juliana Barbosa', '11223344501', '10987654321', 'juliana.barbosa@email.com');
    -- Adicione os 40 outros funcionários da recepção com dados similares

-- Inserção de 50 registros para a tabela Medico_Internacao
INSERT INTO Medico_Internacao (Nome, Crm, Especialidade)
VALUES
    ('Dr. João Pereira', '1234567890', 'Cardiologia'),
    ('Dr. Maria Oliveira', '2345678901', 'Neurologia'),
    ('Dr. Carlos Silva', '3456789012', 'Pediatria'),
    ('Dr. Daniela Costa', '4567890123', 'Ortopedia'),
    ('Dr. Eduardo Almeida', '5678901234', 'Ginecologia');
    -- Adicione mais médicos

-- Inserção de 50 registros para a tabela Unidade_Internacao
INSERT INTO Unidade_Internacao (Nome_Unidade, Descricao)
VALUES
    ('Unidade A', 'Unidade de internação geral'),
    ('Unidade B', 'Unidade de cuidados intensivos'),
    ('Unidade C', 'Unidade de pediatria'),
    ('Unidade D', 'Unidade de ortopedia'),
    ('Unidade E', 'Unidade de ginecologia');
    -- Adicione mais unidades

-- Insira dados para as outras tabelas: Internacao, Agendamento, Visita, Log_Atendimento_Recepcao de maneira similar, criando registros aleatórios conforme necessário.
-- Inserção de 50 registros para a tabela Internacao
INSERT INTO Internacao (Paciente_Id, Unidade_Id, Medico_Id, Data_Admissao, Data_Saida, Motivo_Internacao)
VALUES
    (1, 1, 1, '2025-01-01 10:00:00', '2025-01-10 15:00:00', 'Tratamento cardiológico'),
    (2, 2, 2, '2025-02-05 08:30:00', '2025-02-15 17:30:00', 'Tratamento neurológico'),
    (3, 3, 3, '2025-03-10 14:00:00', '2025-03-18 12:00:00', 'Tratamento pediátrico'),
    (4, 4, 4, '2025-04-01 09:15:00', '2025-04-10 11:00:00', 'Fratura no braço'),
    (5, 5, 5, '2025-05-20 13:45:00', '2025-05-25 16:30:00', 'Acompanhamento ginecológico'),
    (6, 1, 1, '2025-06-01 11:00:00', NULL, 'Infarto agudo'),
    (7, 2, 2, '2025-06-05 10:30:00', NULL, 'Acidente vascular cerebral'),
    (8, 3, 3, '2025-07-15 14:30:00', '2025-07-20 09:00:00', 'Tratamento de asma'),
    (9, 4, 4, '2025-08-10 07:00:00', '2025-08-15 12:00:00', 'Fratura no joelho'),
    (10, 5, 5, '2025-09-05 15:00:00', '2025-09-12 17:30:00', 'Cirurgia ginecológica');
    -- Continue inserindo até 50 registros

-- Inserção de 50 registros para a tabela Agendamento
INSERT INTO Agendamento (Paciente_Id, Funcionario_Id, Data_Agendamento, Tipo_Consulta, Status)
VALUES
    (1, 1, '2025-01-15 09:00:00', 'Consulta Cardiológica', 'Confirmado'),
    (2, 2, '2025-02-10 10:00:00', 'Consulta Neurológica', 'Confirmado'),
    (3, 3, '2025-03-15 11:00:00', 'Consulta Pediátrica', 'Cancelado'),
    (4, 4, '2025-04-05 14:30:00', 'Consulta Ortopédica', 'Confirmado'),
    (5, 5, '2025-05-30 08:00:00', 'Consulta Ginecológica', 'Confirmado'),
    (6, 6, '2025-06-07 13:00:00', 'Consulta Cardiológica', 'Pendente'),
    (7, 7, '2025-06-20 10:00:00', 'Consulta Neurológica', 'Confirmado'),
    (8, 8, '2025-07-12 16:00:00', 'Consulta Pediátrica', 'Pendente'),
    (9, 9, '2025-08-01 09:00:00', 'Consulta Ortopédica', 'Confirmado'),
    (10, 10, '2025-09-10 14:30:00', 'Consulta Ginecológica', 'Cancelado');
    -- Continue inserindo até 50 registros

-- Inserção de 50 registros para a tabela Visita
INSERT INTO Visita (Paciente_Id, Funcionario_Id, Data_Visita, Nome_Visitante, Relacionamento_Visitante)
VALUES
    (1, 1, '2025-01-02 14:00:00', 'Maria Costa', 'Mãe'),
    (2, 2, '2025-02-06 10:00:00', 'Carlos Souza', 'Pai'),
    (3, 3, '2025-03-11 16:00:00', 'Juliana Silva', 'Irmã'),
    (4, 4, '2025-04-02 09:30:00', 'Eduardo Lima', 'Amigo'),
    (5, 5, '2025-05-22 15:00:00', 'Fernanda Costa', 'Esposa'),
    (6, 6, '2025-06-02 12:30:00', 'Gabriel Almeida', 'Filho'),
    (7, 7, '2025-06-06 17:00:00', 'Ana Oliveira', 'Irmã'),
    (8, 8, '2025-07-16 13:00:00', 'João Pereira', 'Pai'),
    (9, 9, '2025-08-02 10:00:00', 'Mariana Souza', 'Esposa'),
    (10, 10, '2025-09-06 14:30:00', 'Raul Costa', 'Amigo');
    -- Continue inserindo até 50 registros

-- Inserção de 50 registros para a tabela Log_Atendimento_Recepcao
INSERT INTO Log_Atendimento_Recepcao (Funcionario_Id, Paciente_Id, Acao, Data_Acao)
VALUES
    (1, 1, 'Recepcionado com sucesso', '2025-01-01 10:00:00'),
    (2, 2, 'Atendimento realizado', '2025-02-05 08:30:00'),
    (3, 3, 'Paciente cancelado', '2025-03-10 14:00:00'),
    (4, 4, 'Consulta agendada', '2025-04-01 09:15:00'),
    (5, 5, 'Recepcionado com sucesso', '2025-05-20 13:45:00'),
    (6, 6, 'Paciente aguardando atendimento', '2025-06-01 11:00:00'),
    (7, 7, 'Consulta confirmada', '2025-06-05 10:30:00'),
    (8, 8, 'Paciente aguardando atendimento', '2025-07-15 14:30:00'),
    (9, 9, 'Consulta realizada', '2025-08-10 07:00:00'),
    (10, 10, 'Paciente cancelado', '2025-09-05 15:00:00');
    -- Continue inserindo até 50 registros
    
