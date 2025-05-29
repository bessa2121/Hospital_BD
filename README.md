# Hospital_BD
Trabalho de sala de criação de banco de dados com tema hospitalar
MER :

Entidades e seus atributos:

Paciente
paciente_id (PK)
nome
cpf
data_nascimento
sexo
telefone
endereco
email

Funcionario_Recepcao
funcionario_id (PK)
nome
cargo
cpf
telefone
email

Agendamento
agendamento_id (PK)
paciente_id (FK)
funcionario_id (FK)
data_agendamento
tipo_consulta
status

Visita
visita_id (PK)
paciente_id (FK)
funcionario_id (FK)
data_visita
nome_visitante
relacionamento_visitante

Log_Atendimento_Recepcao
log_id (PK)
funcionario_id (FK)
paciente_id (FK)
acao
data_acao

Internacao
internacao_id (PK)
paciente_id (FK)
unidade_id (FK)
medico_id (FK)
data_admissao
data_saida
motivo_internacao

UnidadeInternacao
unidade_id (PK)
nome_unidade (Ex: UTI, Enfermaria, etc.)
descricao

MedicoInternacao
medico_id (PK)
nome
crm
especialidade




Paciente ↔ Agendamento:

Relacionamento 1:N (um paciente pode ter muitos agendamentos).
O campo paciente_id na tabela Agendamento é uma chave estrangeira.



Funcionario_Recepcao ↔ Agendamento:

Relacionamento 1:N (um funcionário pode registrar muitos agendamentos).
O campo funcionario_id na tabela Agendamento é uma chave estrangeira.


Paciente ↔ Visita:

Relacionamento 1:N (um paciente pode receber muitas visitas).
O campo paciente_id na tabela Visita é uma chave estrangeira.



Funcionario_Recepcao ↔ Visita:

Relacionamento 1:N (um funcionário pode registrar muitas visitas).
O campo funcionario_id na tabela Visita é uma chave estrangeira.



Paciente ↔ Log_Atendimento_Recepcao:

Relacionamento 1:N (um paciente pode ter muitos logs de atendimento).
O campo paciente_id na tabela Log_Atendimento_Recepcao é uma chave estrangeira.



Funcionario_Recepcao ↔ Log_Atendimento_Recepcao:

Relacionamento 1:N (um funcionário pode registrar muitos logs de atendimento).
O campo funcionario_id na tabela Log_Atendimento_Recepcao é uma chave estrangeira.



Paciente ↔ Internacao:

Relacionamento 1:N (um paciente pode ter várias internações).
O campo paciente_id na tabela Internacao é uma chave estrangeira.



UnidadeInternacao ↔ Internacao:

Relacionamento 1:N (uma unidade pode ter várias internações).
O campo unidade_id na tabela Internacao é uma chave estrangeira.



MedicoInternacao ↔ Internacao:

Relacionamento 1:N (um médico pode ser responsável por várias internações).
O campo medico_id na tabela Internacao é uma chave estrangeira.





--Usar Snake case para atributos , usar Pascal case para o nome da tabela e tudo maiusculo para tipagem 
--ATT: Sempre use underline(_) para separar as palavras.
--Obs: Use esse script como base


-- Tabela de Pacientes
CREATE TABLE paciente (
    paciente_id INT AUTO_INCREMENT PRIMARY KEY,
    rg INT UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    telefone VARCHAR(11),
    endereco VARCHAR(150),
    email VARCHAR(100),
    convenio BOOLEAN NOT NULL
);

-- Tabela de Funcionários da Recepção
CREATE TABLE funcionario_recepcao (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    rg INT UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(11),
    email VARCHAR(100)
);

-- Tabela de Médicos (responsáveis por internações)
CREATE TABLE medico_internacao (
    medico_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(50)
);

-- Tabela de Unidade de Internação
CREATE TABLE unidade_internacao (
    unidade_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_unidade VARCHAR(50) NOT NULL,
    descricao TEXT
);

-- Tabela de Internações
CREATE TABLE internacao (
    internacao_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT NOT NULL,
    unidade_id INT NOT NULL,
    medico_id INT NOT NULL,
    data_admissao DATETIME NOT NULL,
    data_saida DATETIME,
    motivo_internacao VARCHAR(255),
    FOREIGN KEY (paciente_id) REFERENCES paciente(paciente_id),
    FOREIGN KEY (unidade_id) REFERENCES unidade_internacao(unidade_id),
    FOREIGN KEY (medico_id) REFERENCES medico_internacao(medico_id)
);

-- Tabela de Agendamentos
CREATE TABLE agendamento (
    agendamento_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    data_agendamento DATETIME NOT NULL,
    tipo_consulta VARCHAR(80),
    status VARCHAR(20),
    FOREIGN KEY (paciente_id) REFERENCES paciente(paciente_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario_recepcao(funcionario_id)
);

-- Tabela de Visitas
CREATE TABLE visita (
    visita_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    data_visita DATETIME NOT NULL,
    nome_visitante VARCHAR(50),
    relacionamento_visitante VARCHAR(50),
    FOREIGN KEY (paciente_id) REFERENCES paciente(paciente_id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario_recepcao(funcionario_id)
);

-- Tabela de Logs de Atendimento da Recepção
CREATE TABLE log_atendimento_recepcao (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT NOT NULL,
    paciente_id INT NOT NULL,
    acao VARCHAR(255),
    data_acao DATETIME NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionario_recepcao(funcionario_id),
    FOREIGN KEY (paciente_id) REFERENCES paciente(paciente_id)
);

