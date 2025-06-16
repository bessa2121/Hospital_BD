-- Cria o banco de dados se não existir
CREATE DATABASE IF NOT EXISTS Hospital_BD;

-- Usa o banco de dados Hospital_BD
USE Hospital_BD;

-- Exclui tabelas se existirem
DROP TABLE IF EXISTS Visita, Internacao, Unidade_Internacao, Consulta, Atendimento, Funcionario_Recepcao, Agendamento, Medico, Paciente;

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

-- Tabela Unidade de Internação
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
