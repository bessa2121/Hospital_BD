-- Cria o banco de dados se não existir
create database if not exists Hospital_BD;

-- Usa o banco de dados Hospital_BD
USE Hospital_BD;

-- Exclui tabelas se existirem
DROP TABLE IF EXISTS Visita, Internacao, Consulta, Agendamento , Funcionario_Recepcao, Atendimento, Unidade_Internacao, Medico, Paciente;


-- Tabela Paciente
CREATE TABLE Paciente (
    paciente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    sexo ENUM('M', 'F', 'Outro'),
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    convenio VARCHAR(100)
);

-- Tabela Medico
CREATE TABLE Medico (
    medico_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE Unidade_Internacao (
    unidade_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_unidade VARCHAR(100)
);


-- Tabela Atendimento
CREATE TABLE Atendimento (
    atendimento_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    data DATETIME,
    motivo VARCHAR(255),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
);

-- Tabela Funcionario de Recepção
CREATE TABLE Funcionario_Recepcao (
    funcionario_id INT PRIMARY KEY AUTO_INCREMENT,
    atendimento_id INT,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    FOREIGN KEY (atendimento_id) REFERENCES Atendimento(atendimento_id)
);

-- Tabela Agendamento
CREATE TABLE Agendamento (
    agendamento_id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT,
    paciente_id INT,
    data_agendamento DATETIME,
    tipo_consulta VARCHAR(100),
    status VARCHAR(50),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario_Recepcao(funcionario_id),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
);

-- Tabela Consulta
CREATE TABLE Consulta (
    consulta_id INT PRIMARY KEY AUTO_INCREMENT,
    medico_id INT,
    paciente_id INT,
    data DATETIME,
    diagnostico TEXT,
    FOREIGN KEY (medico_id) REFERENCES Medico(medico_id),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
);

-- Tabela Internação
CREATE TABLE Internacao (
    internacao_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    unidade_id INT,
    medico_id INT,
    motivo_internacao VARCHAR(255),
    data_admissao DATE,
    data_saida DATE,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id),
    FOREIGN KEY (unidade_id) REFERENCES Unidade_Internacao(unidade_id),
    FOREIGN KEY (medico_id) REFERENCES Medico(medico_id)
);

-- Tabela Visita
CREATE TABLE Visita (
    visita_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    data_visita DATE,
    nome_visitante VARCHAR(100),
    relacionamento_visitante VARCHAR(50),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
);

INSERT INTO Medico (nome, especialidade) VALUES
('vDr. Carlos Almeida', 'vCardiologia'),
('vDra. Fernanda Silva', 'vDermatologia'),
('vDr. João Santos', 'vPediatria'),
('vDra. Maria Oliveira', 'vNeurologia'),
('vDr. Lucas Ferreira', 'vOrtopedia'),
('vDra. Cláudia Costa', 'vGinecologia'),
('vDr. Gabriel Souza', 'vOftalmologia'),
('vDra. Marta Silva', 'vEndocrinologia'),
('vDr. Rafael Pereira', 'vUrologia'),
('vDra. Adriana Lima', 'vPsiquiatria'),
('vDra. Patricia Oliveira', 'vOncologia'),
('vDr. Marcos Lima', 'vNefrologia'),
('vDra. Alice Barbosa', 'vInfectologia'),
('vDr. Thiago Costa', 'vGeriatria'),
('vDra. Bianca Silva', 'vCirurgia Geral'),
('vDr. Rodrigo Almeida', 'vPneumologia'),
('vDra. Amanda Santos', 'vAnestesiologia'),
('vDr. Felipe Martins', 'vReumatologia'),
('vDra. Juliana Costa', 'vHematologia'),
('vDr. Paulo Pereira', 'vCirurgia Plástica'),
('vDra. Beatriz Silva', 'vGastroenterologia'),
('vDr. Hugo Souza', 'vOtorrinolaringologia'),
('vDra. Kelly Andrade', 'vPediatria'),
('vDr. Sérgio Oliveira', 'vCardiologia'),
('vDr. Lucas Santana', 'vGinecologia'),
('vDra. Natália Silva', 'vNeurologia'),
('vDr. Eduardo Lima', 'vCirurgia Geral'),
('vDra. Simone Costa', 'vOftalmologia'),
('vDra. Mariana Pereira', 'vEndocrinologia'),
('vDra. Fernanda Almeida', 'vNefrologia'),
('vDr. José Santos', 'vOftalmologia'),
('vDra. Larissa Costa', 'vPediatria'),
('vDr. Gustavo Silva', 'vCardiologia'),
('vDr. Cláudio Barbosa', 'vAnestesiologia'),
('vDra. Alice Costa', 'vDermatologia'),
('vDr. Rui Pereira', 'vCirurgia Plástica'),
('vDra. Tânia Souza', 'vOftalmologia'),
('vDr. Jorge Oliveira', 'vOftalmologia'),
('vDra. Carina Lima', 'vPsicologia'),
('vDr. Igor Barbosa', 'vPsiquiatria'),
('vDra. Vânia Costa', 'vCirurgia Geral'),
('vDr. Fabio Pereira', 'vGeriatria'),
('vDra. Luana Santos', 'vPediatria'),
('vDr. Mauro Silva', 'vGinecologia'),
('vDra. Raquel Costa', 'vDermatologia'),
('vDr. Hugo Pereira', 'vReumatologia'),
('vDra. Daniela Lima', 'vOftalmologia');


INSERT INTO Unidade_Internacao (nome_unidade) VALUES
('vEnfermaria Geral 1'),
('vEnfermaria Geral 2'),
('vUTI Geral'),
('vEnfermaria Pediátrica'),
('vEnfermaria Neurológica'),
('vEnfermaria Cardíaca'),
('vEnfermaria Oncológica'),
('vEnfermaria Ginecológica'),
('vEnfermaria Ortopédica'),
('vUTI Neonatal');


-- Inserir 5 pacientes
INSERT INTO Paciente (nome, cpf, data_nascimento, sexo, telefone, endereco, convenio) VALUES
('vJoão Silva', '111.111.111-11', '1980-05-10', 'M', '(11) 99999-9999', 'vRua A, 123', 'vPlano A'),
('vMaria Souza', '222.222.222-22', '1985-07-12', 'F', '(11) 98888-8888', 'vRua B, 456', 'vPlano B'),
('vCarlos Oliveira', '333.333.333-33', '1970-02-20', 'M', '(11) 97777-7777', 'vRua C, 789', 'vPlano C'),
('vAna Paula', '444.444.444-44', '1992-11-01', 'F', '(11) 96666-6666', 'vRua D, 101', 'vPlano A'),
('vFernanda Lima', '555.555.555-55', '1995-06-25', 'F', '(11) 95555-5555', 'vRua E, 202', 'vPlano B');

-- Inserir atendimentos para os pacientes acima
INSERT INTO Atendimento (paciente_id, data, motivo) VALUES
(1, '2025-06-01 08:00:00', 'vConsulta geral'),
(2, '2025-06-02 09:00:00', 'vExame de sangue'),
(3, '2025-06-03 10:00:00', 'vDor de cabeça'),
(4, '2025-06-04 11:00:00', 'vRetorno'),
(5, '2025-06-05 12:00:00', 'vConsulta ginecológica');

-- Inserir funcionários da recepção associados aos atendimentos criados
INSERT INTO Funcionario_Recepcao (atendimento_id, nome, cargo, cpf, telefone) VALUES
(1, 'vJuliana Mendes', 'vRecepcionista', '123.456.789-01', '(11) 98765-4321'),
(1, 'vLucas Oliveira', 'vRecepcionista', '678.901.234-56', '(11) 98765-4326'),
(2, 'vCarlos Pereira', 'vRecepcionista', '234.567.890-12', '(11) 98765-4322'),
(2, 'vIsabela Costa', 'vRecepcionista', '789.012.345-67', '(11) 98765-4327'),
(3, 'vAna Costa', 'vRecepcionista', '345.678.901-23', '(11) 98765-4323'),
(3, 'vPaula Alves', 'vRecepcionista', '890.123.456-78', '(11) 98765-4328'),
(4, 'vFernanda Lima', 'vRecepcionista', '456.789.012-34', '(11) 98765-4324'),
(4, 'vRogério Lima', 'vRecepcionista', '901.234.567-89', '(11) 98765-4329'),
(5, 'vMarcos Souza', 'vRecepcionista', '567.890.123-45', '(11) 98765-4325'),
(5, 'vCíntia Silva', 'vRecepcionista', '012.345.678-90', '(11) 98765-4330');



INSERT INTO Medico (nome, especialidade) VALUES
('vDr. Gustavo Ramos', 'vCardiologia'),
('vDra. Helena Freitas', 'vPediatria'),
('vDr. Marcelo Antunes', 'vOrtopedia'),
('vDra. Lívia Castro', 'vGinecologia'),
('vDr. João Torres', 'vClínico Geral');


INSERT INTO Agendamento (funcionario_id, paciente_id, data_agendamento, tipo_consulta, status) VALUES
(1, 1, '2025-06-20 10:00:00', 'vCardiologista', 'vConfirmado'),
(2, 2, '2025-06-21 09:30:00', 'vPediatria', 'vPendente'),
(3, 3, '2025-06-22 14:00:00', 'vOrtopedia', 'vCancelado'),
(4, 4, '2025-06-23 16:00:00', 'vClínico Geral', 'vConfirmado'),
(5, 5, '2025-06-24 13:30:00', 'vGinecologia', 'vConfirmado');

INSERT INTO Consulta (medico_id, paciente_id, data, diagnostico) VALUES
(1, 1, '2025-06-15 09:30:00', 'vAngina leve, indicado exame de esforço.'),
(2, 2, '2025-06-14 16:00:00', 'vInfecção viral tratada com antitérmico.'),
(3, 3, '2025-06-13 11:00:00', 'vHérnia de disco leve. Encaminhado para fisioterapia.'),
(5, 4, '2025-06-12 14:30:00', 'vPaciente saudável. Nenhuma alteração.'),
(4, 5, '2025-06-11 11:45:00', 'vExames preventivos solicitados.');

INSERT INTO Visita (paciente_id, data_visita, nome_visitante, relacionamento_visitante) VALUES
(1, '2025-06-11', 'vMarcos Pereira', 'vIrmão'),
(2, '2025-06-12', 'vRenata Martins', 'vMãe'),
(3, '2025-06-13', 'vJúlia Souza', 'vEsposa'),
(4, '2025-06-14', 'vPaulo Oliveira', 'vFilho'),
(5, '2025-06-15', 'vAmanda Lima', 'vNamorada');

INSERT INTO Internacao (paciente_id, unidade_id, medico_id, motivo_internacao, data_admissao, data_saida) VALUES
(1, 1, 1, 'vPneumonia aguda', '2025-06-01', '2025-06-10'),
(2, 3, 2, 'vInfarto agudo do miocárdio', '2025-06-03', '2025-06-15'),
(3, 4, 3, 'vBronquiolite', '2025-06-05', NULL),
(4, 6, 4, 'vArritmia cardíaca', '2025-06-07', '2025-06-12'),
(5, 7, 5, 'vQuimioterapia de manutenção', '2025-06-09', NULL);
