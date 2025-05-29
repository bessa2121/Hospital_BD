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
