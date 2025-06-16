-- Cria o banco de dados se não existir
create database if not exists Hospital_BD;

-- Usa o banco de dados Hospital_BD
USE Hospital_BD;

-- Exclui tabelas se existirem
DROP TABLE IF EXISTS VisitaV, InternacaoV, Unidade_InternacaoV, ConsultaV, AtendimentoV, Funcionario_RecepcaoV, AgendamentoV, MedicoV, PacienteV;


-- Tabela Paciente
CREATE TABLE PacienteV (
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
CREATE TABLE MedicoV (
    medico_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    especialidade VARCHAR(100)
);

-- Tabela Unidade de Internação
CREATE TABLE Unidade_InternacaoV (
    unidade_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_unidade VARCHAR(100)
);

-- Tabela Atendimento
CREATE TABLE AtendimentoV (
    atendimento_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    data DATETIME,
    motivo VARCHAR(255),
    FOREIGN KEY (paciente_id) REFERENCES PacienteV(paciente_id)
);

-- Tabela Funcionario de Recepção
CREATE TABLE Funcionario_RecepcaoV (
    funcionario_id INT PRIMARY KEY AUTO_INCREMENT,
    atendimento_id INT,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    FOREIGN KEY (atendimento_id) REFERENCES AtendimentoV(atendimento_id)
);

-- Tabela Agendamento
CREATE TABLE AgendamentoV (
    agendamento_id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT,
    paciente_id INT,
    data_agendamento DATETIME,
    tipo_consulta VARCHAR(100),
    status VARCHAR(50),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario_RecepcaoV(funcionario_id),
    FOREIGN KEY (paciente_id) REFERENCES PacienteV(paciente_id)
);

-- Tabela Consulta
CREATE TABLE ConsultaV (
    consulta_id INT PRIMARY KEY AUTO_INCREMENT,
    medico_id INT,
    paciente_id INT,
    data DATETIME,
    diagnostico TEXT,
    FOREIGN KEY (medico_id) REFERENCES MedicoV(medico_id),
    FOREIGN KEY (paciente_id) REFERENCES PacienteV(paciente_id)
);

-- Tabela Internação
CREATE TABLE InternacaoV (
    internacao_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    unidade_id INT,
    medico_id INT,
    motivo_internacao VARCHAR(255),
    data_admissao DATE,
    data_saida DATE,
    FOREIGN KEY (paciente_id) REFERENCES PacienteV(paciente_id),
    FOREIGN KEY (unidade_id) REFERENCES Unidade_InternacaoV(unidade_id),
    FOREIGN KEY (medico_id) REFERENCES MedicoV(medico_id)
);

-- Tabela Visita
CREATE TABLE VisitaV (
    visita_id INT PRIMARY KEY AUTO_INCREMENT,
    paciente_id INT,
    data_visita DATE,
    nome_visitante VARCHAR(100),
    relacionamento_visitante VARCHAR(50),
    FOREIGN KEY (paciente_id) REFERENCES PacienteV(paciente_id)
);

INSERT INTO PacienteV (nome, cpf, data_nascimento, sexo, telefone, endereco, convenio) VALUES
('Ana Souza', '123.456.789-00', '1980-05-12', 'F', '(11) 91234-5678', 'Rua A, 123', 'Unimed'),
('Carlos Silva', '234.567.890-11', '1975-08-20', 'M', '(21) 99876-5432', 'Rua B, 456', 'Bradesco Saúde'),
('Fernanda Lima', '345.678.901-22', '1992-11-30', 'F', '(31) 98765-4321', 'Av. Central, 789', 'Amil'),
('João Pedro', '456.789.012-33', '2000-01-01', 'M', '(41) 96543-2100', 'Rua C, 321', 'SulAmérica'),
('Juliana Dias', '567.890.123-44', '1985-03-15', 'F', '(51) 95432-1000', 'Av. das Flores, 654', 'Unimed'),
('Mateus Rocha', '678.901.234-55', '1990-07-07', 'M', '(61) 94321-0000', 'Rua D, 432', 'NotreDame'),
('Patrícia Mendes', '789.012.345-66', '1983-09-25', 'F', '(71) 93210-9999', 'Rua E, 543', 'Unimed'),
('Ricardo Alves', '890.123.456-77', '1999-12-10', 'M', '(81) 92109-8888', 'Av. Brasil, 876', 'Hapvida'),
('Bianca Torres', '901.234.567-88', '2001-06-22', 'F', '(91) 91098-7777', 'Rua F, 654', 'Amil'),
('Thiago Costa', '012.345.678-99', '1987-04-09', 'M', '(31) 99988-6666', 'Rua G, 765', 'SulAmérica'),
('Camila Martins', '147.258.369-00', '1995-02-14', 'F', '(11) 98877-5555', 'Rua H, 876', 'Unimed'),
('Daniel Ribeiro', '258.369.147-11', '1982-08-08', 'M', '(21) 97766-4444', 'Av. das Palmeiras, 123', 'Bradesco Saúde'),
('Isabela Pinto', '369.147.258-22', '1998-10-03', 'F', '(31) 96655-3333', 'Rua I, 987', 'Amil'),
('Lucas Moraes', '741.852.963-33', '1970-12-20', 'M', '(41) 95544-2222', 'Rua J, 654', 'NotreDame'),
('Marina Lopes', '852.963.741-44', '1993-03-08', 'F', '(51) 94433-1111', 'Rua K, 321', 'Hapvida'),
('Bruno Ferreira', '963.741.852-55', '1991-01-27', 'M', '(61) 93322-0000', 'Rua L, 210', 'SulAmérica'),
('Lorena Castro', '159.357.486-66', '1989-05-17', 'F', '(71) 92211-9999', 'Av. Oceânica, 333', 'Unimed'),
('Eduardo Nunes', '357.486.159-77', '1978-06-19', 'M', '(81) 91100-8888', 'Rua M, 456', 'Amil'),
('Tatiane Ramos', '486.159.357-88', '2002-09-30', 'F', '(91) 90099-7777', 'Rua N, 789', 'NotreDame'),
('Fábio Barros', '111.222.333-44', '1984-07-12', 'M', '(31) 98989-6666', 'Rua O, 101', 'Bradesco Saúde');

INSERT INTO MedicoV (nome, especialidade) VALUES
('Dr. João Lima', 'Cardiologia'),
('Dra. Ana Beatriz', 'Pediatria'),
('Dr. Paulo Santos', 'Ortopedia'),
('Dra. Camila Duarte', 'Ginecologia'),
('Dr. Bruno Leal', 'Neurologia'),
('Dra. Fernanda Lopes', 'Dermatologia'),
('Dr. Rafael Costa', 'Psiquiatria'),
('Dra. Luciana Faria', 'Oftalmologia'),
('Dr. Marcelo Vieira', 'Oncologia'),
('Dra. Carla Nunes', 'Endocrinologia'),
('Dr. André Mendes', 'Urologia'),
('Dra. Patrícia Silva', 'Reumatologia'),
('Dr. Felipe Moura', 'Infectologia'),
('Dra. Renata Almeida', 'Nutrologia'),
('Dr. Gustavo Torres', 'Gastroenterologia'),
('Dra. Sandra Pires', 'Alergologia'),
('Dr. Leandro Matos', 'Otorrinolaringologia'),
('Dra. Juliana Ferreira', 'Hematologia'),
('Dr. Vinícius Rocha', 'Nefrologia'),
('Dra. Paula Martins', 'Anestesiologia');

INSERT INTO Unidade_InternacaoV (nome_unidade) VALUES
('Unidade A'), ('Unidade B'), ('Unidade C'), ('Unidade D'), ('Unidade E'),
('Unidade F'), ('Unidade G'), ('Unidade H'), ('Unidade I'), ('Unidade J'),
('Unidade K'), ('Unidade L'), ('Unidade M'), ('Unidade N'), ('Unidade O'),
('Unidade P'), ('Unidade Q'), ('Unidade R'), ('Unidade S'), ('Unidade T');

INSERT INTO AtendimentoV (paciente_id, data, motivo) VALUES
(1, '2024-06-01 08:00:00', 'Dor de cabeça'),
(2, '2024-06-02 09:30:00', 'Febre alta'),
(3, '2024-06-03 10:15:00', 'Dor no estômago'),
(4, '2024-06-04 14:00:00', 'Fratura no braço'),
(5, '2024-06-05 11:00:00', 'Consulta de rotina'),
(6, '2024-06-06 13:45:00', 'Pressão alta'),
(7, '2024-06-07 12:30:00', 'Mal-estar geral'),
(8, '2024-06-08 15:20:00', 'Alergia'),
(9, '2024-06-09 16:10:00', 'Consulta pré-natal'),
(10, '2024-06-10 17:00:00', 'Dor nas costas'),
(11, '2024-06-11 08:50:00', 'Infecção urinária'),
(12, '2024-06-12 09:40:00', 'Dor no peito'),
(13, '2024-06-13 10:25:00', 'Tontura'),
(14, '2024-06-14 11:15:00', 'Vômitos'),
(15, '2024-06-15 14:05:00', 'Desmaios'),
(16, '2024-06-16 12:55:00', 'Pós-operatório'),
(17, '2024-06-17 16:35:00', 'Consulta geriátrica'),
(18, '2024-06-18 15:10:00', 'Dor abdominal'),
(19, '2024-06-19 13:00:00', 'Queimadura'),
(20, '2024-06-20 09:00:00', 'Consulta ortopédica');

INSERT INTO Funcionario_RecepcaoV (atendimento_id, nome, cargo, cpf, telefone) VALUES
(1, 'Luciana Reis', 'Recepcionista', '123.123.123-01', '(11) 99999-0001'),
(2, 'João Carvalho', 'Atendente', '234.234.234-02', '(11) 99999-0002'),
(3, 'Paula Andrade', 'Recepcionista', '345.345.345-03', '(11) 99999-0003'),
(4, 'Carlos Lopes', 'Auxiliar', '456.456.456-04', '(11) 99999-0004'),
(5, 'Renata Dias', 'Recepcionista', '567.567.567-05', '(11) 99999-0005'),
(6, 'Marcos Lima', 'Atendente', '678.678.678-06', '(11) 99999-0006'),
(7, 'Aline Silva', 'Recepcionista', '789.789.789-07', '(11) 99999-0007'),
(8, 'Fernando Rocha', 'Recepcionista', '890.890.890-08', '(11) 99999-0008'),
(9, 'Juliana Farias', 'Auxiliar', '901.901.901-09', '(11) 99999-0009'),
(10, 'Roberto Souza', 'Atendente', '012.012.012-10', '(11) 99999-0010'),
(11, 'Camila Martins', 'Recepcionista', '123.456.789-11', '(11) 99999-0011'),
(12, 'Thiago Moura', 'Recepcionista', '234.567.890-12', '(11) 99999-0012'),
(13, 'Gustavo Ramos', 'Auxiliar', '345.678.901-13', '(11) 99999-0013'),
(14, 'Vanessa Pires', 'Recepcionista', '456.789.012-14', '(11) 99999-0014'),
(15, 'Débora Castro', 'Atendente', '567.890.123-15', '(11) 99999-0015'),
(16, 'Bruno Almeida', 'Recepcionista', '678.901.234-16', '(11) 99999-0016'),
(17, 'Larissa Oliveira', 'Recepcionista', '789.012.345-17', '(11) 99999-0017'),
(18, 'Caio Teixeira', 'Auxiliar', '890.123.456-18', '(11) 99999-0018'),
(19, 'Isadora Melo', 'Atendente', '901.234.567-19', '(11) 99999-0019'),
(20, 'Leandro Cunha', 'Recepcionista', '012.345.678-20', '(11) 99999-0020');

INSERT INTO AgendamentoV (funcionario_id, paciente_id, data_agendamento, tipo_consulta, status) VALUES
(1, 1, '2024-06-05 10:00:00', 'Cardiologia', 'Agendado'),
(2, 2, '2024-06-06 11:00:00', 'Pediatria', 'Agendado'),
(3, 3, '2024-06-07 12:00:00', 'Ortopedia', 'Concluído'),
(4, 4, '2024-06-08 13:00:00', 'Ginecologia', 'Agendado'),
(5, 5, '2024-06-09 14:00:00', 'Dermatologia', 'Cancelado'),
(6, 6, '2024-06-10 15:00:00', 'Psiquiatria', 'Agendado'),
(7, 7, '2024-06-11 16:00:00', 'Oftalmologia', 'Concluído'),
(8, 8, '2024-06-12 17:00:00', 'Neurologia', 'Agendado'),
(9, 9, '2024-06-13 08:00:00', 'Endocrinologia', 'Cancelado'),
(10, 10, '2024-06-14 09:00:00', 'Gastroenterologia', 'Agendado'),
(11, 11, '2024-06-15 10:00:00', 'Nutrologia', 'Agendado'),
(12, 12, '2024-06-16 11:00:00', 'Urologia', 'Concluído'),
(13, 13, '2024-06-17 12:00:00', 'Otorrinolaringologia', 'Agendado'),
(14, 14, '2024-06-18 13:00:00', 'Alergologia', 'Concluído'),
(15, 15, '2024-06-19 14:00:00', 'Hematologia', 'Agendado'),
(16, 16, '2024-06-20 15:00:00', 'Nefrologia', 'Agendado'),
(17, 17, '2024-06-21 16:00:00', 'Anestesiologia', 'Cancelado'),
(18, 18, '2024-06-22 17:00:00', 'Cardiologia', 'Concluído'),
(19, 19, '2024-06-23 08:00:00', 'Pediatria', 'Agendado'),
(20, 20, '2024-06-24 09:00:00', 'Ortopedia', 'Agendado');

INSERT INTO ConsultaV (medico_id, paciente_id, data, diagnostico) VALUES
(1, 1, '2024-06-05 10:30:00', 'Hipertensão arterial controlada'),
(2, 2, '2024-06-06 11:15:00', 'Infecção viral leve'),
(3, 3, '2024-06-07 12:45:00', 'Fratura de clavícula'),
(4, 4, '2024-06-08 14:00:00', 'Gastrite crônica'),
(5, 5, '2024-06-09 15:20:00', 'Dermatite alérgica'),
(6, 6, '2024-06-10 16:10:00', 'Depressão moderada'),
(7, 7, '2024-06-11 17:30:00', 'Miopia'),
(8, 8, '2024-06-12 08:30:00', 'Crise convulsiva controlada'),
(9, 9, '2024-06-13 09:50:00', 'Diabetes tipo 2'),
(10, 10, '2024-06-14 11:00:00', 'Síndrome do intestino irritável'),
(11, 11, '2024-06-15 13:00:00', 'Obesidade grau 1'),
(12, 12, '2024-06-16 14:30:00', 'Infecção urinária'),
(13, 13, '2024-06-17 15:40:00', 'Rinite alérgica'),
(14, 14, '2024-06-18 16:20:00', 'Sinusite aguda'),
(15, 15, '2024-06-19 17:10:00', 'Anemia ferropriva'),
(16, 16, '2024-06-20 08:45:00', 'Doença renal crônica'),
(17, 17, '2024-06-21 09:30:00', 'Reação alérgica alimentar'),
(18, 18, '2024-06-22 10:50:00', 'Hepatite A'),
(19, 19, '2024-06-23 12:00:00', 'Insônia leve'),
(20, 20, '2024-06-24 13:15:00', 'Cefaleia tensional');

INSERT INTO InternacaoV (paciente_id, unidade_id, medico_id, motivo_internacao, data_admissao, data_saida) VALUES
(1, 1, 1, 'Cirurgia cardíaca', '2024-05-01', '2024-05-10'),
(2, 2, 2, 'Tratamento infeccioso', '2024-05-03', '2024-05-08'),
(3, 3, 3, 'Fratura exposta', '2024-05-05', '2024-05-15'),
(4, 4, 4, 'Curetagem uterina', '2024-05-07', '2024-05-09'),
(5, 5, 5, 'Tratamento de câncer', '2024-05-09', '2024-05-20'),
(6, 6, 6, 'Crise psicótica', '2024-05-11', '2024-05-18'),
(7, 7, 7, 'Infecção ocular grave', '2024-05-13', '2024-05-14'),
(8, 8, 8, 'Crise epiléptica', '2024-05-15', '2024-05-21'),
(9, 9, 9, 'Hiperglicemia severa', '2024-05-17', '2024-05-22'),
(10, 10, 10, 'Cirurgia intestinal', '2024-05-19', '2024-05-26'),
(11, 11, 11, 'Reeducação alimentar hospitalar', '2024-05-21', '2024-05-27'),
(12, 12, 12, 'Tratamento de infecção', '2024-05-23', '2024-05-29'),
(13, 13, 13, 'Tratamento de rinite grave', '2024-05-25', '2024-05-30'),
(14, 14, 14, 'Sinusite com complicações', '2024-05-27', '2024-06-02'),
(15, 15, 15, 'Anemia severa', '2024-05-29', '2024-06-05'),
(16, 16, 16, 'Problemas renais', '2024-05-31', '2024-06-07'),
(17, 17, 17, 'Choque anafilático', '2024-06-01', '2024-06-03'),
(18, 18, 18, 'Hepatite', '2024-06-03', '2024-06-10'),
(19, 19, 19, 'Distúrbios do sono', '2024-06-05', '2024-06-08'),
(20, 20, 20, 'Dor intensa na cabeça', '2024-06-07', '2024-06-09');

INSERT INTO VisitaV (paciente_id, data_visita, nome_visitante, relacionamento_visitante) VALUES
(1, '2024-06-01', 'Carlos Souza', 'Pai'),
(2, '2024-06-02', 'Maria da Silva', 'Mãe'),
(3, '2024-06-03', 'João Lima', 'Irmão'),
(4, '2024-06-04', 'Paula Mendes', 'Esposa'),
(5, '2024-06-05', 'Julio César', 'Tio'),
(6, '2024-06-06', 'Fernanda Moura', 'Amiga'),
(7, '2024-06-07', 'Patrícia Nogueira', 'Prima'),
(8, '2024-06-08', 'Rafael Torres', 'Marido'),
(9, '2024-06-09', 'Isabela Ramos', 'Filha'),
(10, '2024-06-10', 'Camila Souza', 'Irmã'),
(11, '2024-06-11', 'Carlos Alberto', 'Avô'),
(12, '2024-06-12', 'Marina Costa', 'Vizinha'),
(13, '2024-06-13', 'Rodrigo Moreira', 'Amigo'),
(14, '2024-06-14', 'Tatiane Alves', 'Madrinha'),
(15, '2024-06-15', 'Luciano Pires', 'Primo'),
(16, '2024-06-16', 'Juliana Martins', 'Filha'),
(17, '2024-06-17', 'Gabriel Castro', 'Filho'),
(18, '2024-06-18', 'Lorena Lopes', 'Sobrinha'),
(19, '2024-06-19', 'Fábio Andrade', 'Amigo'),
(20, '2024-06-20', 'Débora Silva', 'Cunhada');
