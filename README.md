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
