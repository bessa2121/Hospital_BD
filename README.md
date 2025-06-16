# Hospital_BD
Trabalho de sala de criação de banco de dados com tema hospitalar
MER :

Entidade - Paciente
Atributos
PK paciente_id
nome
cpf
data_nascimento
sexo
telefone
endereco
convenio

Entidade - Agendamento
Atributos
PK agendamento_id
FK funcionario_id
FK paciente_id
data_agendamento
tipo_consulta
status

Entidade - Funcionario_Recepcao
Atributos
PK funcionario_id
FK atendimento_id
nome
cargo
cpf
telefone

Entidade - Atendimento
Atributos
PK atendimento_id
FK paciente_id
data
motivo

Entidade - Consulta
Atributos
PK consulta_id
FK medico_id
FK paciente_id
data
diagnostico

Entidade - Medico
Atributos
PK medico_id
nome
especialidade

Entidade - Internacao
Atributos
PK internacao_id
FK paciente_id
FK unidade_id
FK medico_id
motivo_internacao
data_admissao
data_saida

Entidade - Unidade_Internacao
Atributos
PK unidade_id
nome_unidade

Entidade - Visita
Atributos
PK visita_id
FK paciente_id
data_visita
nome_visitante
relacionamento_visitante
