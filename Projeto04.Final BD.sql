create schema projeto04;
-- Criação das tabelas
create table projeto04.paciente(
    id_paciente SERIAL primary key,
    nome_completo VARCHAR(100) not null,
    cpf CHAR(11) unique not null,
    data_nascimento DATE not null,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

create table projeto04.especialidades(
	id_especialidade serial primary key,
	nome_especialidade varchar(50) not null,
	descricao_especialidade varchar(200)
);

create table projeto04.procedimentos_odontologicos(
	id_procedimento SERIAL primary key,
	nome_procedimento VARCHAR (100),
	descricao VARCHAR (100),
	duracao_media int
);

create table projeto04.especialidades_procedimentos(
	id_procedimento int not null,
	id_especialidade int not null,
	foreign key (id_procedimento)references projeto04.procedimentos_odontologicos (id_procedimento),
	foreign key (id_especialidade)references projeto04.especialidades (id_especialidade)
);

create table projeto04.dentista (
    id_dentista SERIAL primary key,
	id_especialidade int not null,
    nome_completo VARCHAR(100) not null,
    cpf CHAR(11) unique not null,
    cro VARCHAR(20) unique not null,
    foreign key(id_especialidade) references projeto04.especialidades(id_especialidade)
);

create table projeto04.horario_atendimento (
    id_horario SERIAL primary key,
    id_dentista INT not null,
    dia_semana VARCHAR(10) not null check (dia_semana in ('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado')),
    hora_inicio TIME not null,
    hora_fim TIME not null,
    foreign key (id_dentista) references projeto04.dentista(id_dentista)
);

create table projeto04.consulta(
	id_consulta SERIAL primary key,
	id_paciente INT not null,
	id_dentista INT not null,
	foreign key (id_paciente) references projeto04.paciente(id_paciente),
	foreign key (id_dentista) references projeto04.dentista(id_dentista),
	data_consulta DATE not null,
	hora_consulta TIME not null,
	descricao_atendimento VARCHAR (100),	
	prescricao VARCHAR (100),
	status_consulta boolean default false
);
----------------------------------------------------------------------------------------------------

--inicio dos insert 

insert into projeto04.paciente (nome_completo, cpf, data_nascimento, telefone, email, endereco)
values
('Amanda Silva', '11111111111', '1990-05-12', '42-9999-1111', 'amanda.silva@gmail.com', 'Rua das Flores, 101'),
('Bruno Almeida', '22222222222', '1985-03-08', '42-9888-2222', 'bruno.almeida@gmail.com', 'Av Brasil, 250'),
('Carla Souza', '33333333333', '1992-07-21', '42-9777-3333', 'carla.souza@gmail.com', 'Rua XV de Novembro, 78'),
('Daniel Oliveira', '44444444444', '1988-12-30', '42-9666-4444', 'daniel.oliveira@gmail.com', 'Av Paraná, 450'),
('Eduarda Santos', '55555555555', '1995-01-15', '42-9555-5555', 'eduarda.santos@gmail.com', 'Rua das Acácias, 12'),
('Felipe Costa','66666666666', '1983-06-25', '42-9444-6666', 'felipe.costa@gmail.com', 'Rua Sete de Setembro, 99'),
('Gabriela Rocha','77777777777', '1998-09-18', '42-9333-7777', 'gabriela.rocha@gmail.com', 'Av João Pessoa, 310'),
('Henrique Lima','88888888888', '1991-04-09', '42-9222-8888', 'henrique.lima@gmail.com', 'Rua Marechal Deodoro, 55'),
('Isabela Ferreira','99999999999', '1986-11-02', '42-9111-9999', 'isabela.ferreira@gmail.com', 'Rua Pedro Álvares, 120'),
('João Pereira','10101010101', '1993-08-27', '42-9000-1010', 'joao.pereira@gmail.com', 'Av Independência, 75');

insert into projeto04.especialidades (nome_especialidade, descricao_especialidade) 
values
('Cirurgia e Traumatologia Buco-Maxilo-Facial', 'Diagnóstico e tratamento cirúrgico de doenças, lesões e anomalias da boca, maxilares e estruturas associadas'),
('Dentística', 'Prevenção, diagnóstico e tratamento dos dentes, visando a estética e restauração dental'),
('Endodontia', 'Diagnóstico, prevenção e tratamento das doenças da polpa dental e tecidos perirradiculares'),
('Odontopediatria', 'Atendimento odontológico especializado para crianças e adolescentes'),
('Ortodontia', 'Prevenção e correção das irregularidades dentofaciais e má oclusão'),
('Periodontia', 'Prevenção, diagnóstico e tratamento das doenças gengivais e tecidos de suporte dos dentes'),
('Implantodontia', 'Planejamento e colocação de implantes dentários para reabilitação oral'),
('Disfunção Temporomandibular e Dor Orofacial', 'Diagnóstico e tratamento das disfunções da ATM e dores na região orofacial'),
('Estomatologia', 'Diagnóstico e tratamento das doenças da boca e manifestações bucais de doenças sistêmicas'),
('Radiologia Odontológica e Imaginologia', 'Realização e interpretação de exames de imagem para diagnóstico odontológico');

insert into projeto04.procedimentos_odontologicos (nome_procedimento, descricao, duracao_media)
values
('Consulta inicial', 'Avaliação completa da saúde bucal do paciente', 30),
('Limpeza dental', 'Remoção de tártaro e polimento dos dentes', 45),
('Restauração em resina', 'Tratamento de cárie com material estético', 60),
('Canal radicular', 'Tratamento endodôntico do canal da raiz', 90),
('Extração dental simples', 'Remoção de dente sem complicações', 30),
('Clareamento dental', 'Procedimento estético para clarear os dentes', 60),
('Aplicação de flúor', 'Prevenção de cáries com flúor profissional', 15),
('Raspagem e alisamento radicular', 'Tratamento periodontal profundo', 75),
('Implante dentário', 'Instalação de pino de titânio no osso', 120),
('Coroa protética', 'Confecção e instalação de coroa dental', 90);

insert into projeto04.especialidades_procedimentos (id_procedimento, id_especialidade) 
values
-- Cirurgia Buco-Maxilo-Facial
(5, 1), -- Extração dental simples
(9, 1), -- Implante dentário

-- Dentística
(3, 2), -- Restauração em resina
(6, 2), -- Clareamento dental
(10, 2), -- Coroa protética

-- Endodontia
(4, 3), -- Canal radicular

-- Odontopediatria
(1, 4), -- Consulta inicial
(2, 4), -- Limpeza dental
(7, 4), -- Aplicação de flúor

-- Ortodontia
(1, 5), -- Consulta inicial
(6, 5), -- Clareamento dental

-- Periodontia
(8, 6), -- Raspagem e alisamento radicular
(2, 6), -- Limpeza dental

-- Implantodontia
(9, 7), -- Implante dentário
(10, 7), -- Coroa protética

-- DTM e Dor Orofacial
(1, 8), -- Consulta inicial

-- Estomatologia
(1, 9), -- Consulta inicial
(4, 9), -- Canal radicular

-- Radiologia Odontológica
(1, 10); -- Consulta inicial (avaliação)

insert into projeto04.dentista (nome_completo, id_especialidade, cpf, cro)
values
('Dr. Ricardo Almeida', 1, '12345678901', 'CRO12345-PR'),
('Dra. Mariana Costa', 2, '23456789012', 'CRO23456-PR'),
('Dr. Felipe Rocha', 3, '34567890123', 'CRO34567-PR'),
('Dra. Juliana Mendes', 4, '45678901234', 'CRO45678-PR'),
('Dr. Henrique Santos', 5, '56789012345', 'CRO56789-PR'),
('Dra. Amanda Ribeiro', 6, '67890123456', 'CRO67890-PR'),
('Dr. Bruno Oliveira', 7, '78901234567', 'CRO78901-PR'),
('Dra. Carla Fernandes', 8, '89012345678', 'CRO89012-PR'),
('Dr. Diego Martins', 9, '90123456789', 'CRO90123-PR'),
('Dra. Isabela Nogueira', 10, '01234567890', 'CRO01234-PR');

insert into projeto04.horario_atendimento (id_dentista, dia_semana, hora_inicio, hora_fim)
values
(1, 'Segunda', '08:00', '12:00'),
(2, 'Terça',  '13:30', '18:00'),
(3, 'Quarta', '09:00', '12:30'),
(4, 'Quinta', '14:00', '17:30'),
(5, 'Sexta',  '08:30', '11:30'),
(6, 'Sábado', '15:00', '19:00'),
(7, 'Segunda','07:00', '11:00'),
(8, 'Terça',  '12:00', '16:00'),
(9, 'Sexta',  '10:00', '14:00'),
(10,'Sábado', '16:30', '20:00');

insert into projeto04.consulta 
(id_paciente, id_dentista, data_consulta, hora_consulta, descricao_atendimento, prescricao, status_consulta)
values
(1, 2, '2025-09-01', '09:00',  'Consulta de avaliação inicial', 'Raio-X panorâmico', TRUE),
(2, 3, '2025-09-01', '10:30', 'Limpeza dentária', 'Enxaguante bucal diário', TRUE),
(3, 1, '2025-09-02', '14:00', 'Extração de dente', 'Analgésico 500mg', TRUE),
(4, 5, '2025-09-02', '15:30', 'Canal molar superior', 'Antibiótico 7 dias', TRUE),
(5, 6, '2025-09-03', '08:30', 'Aplicação de flúor', 'Retorno em 6 meses', TRUE),
(6, 4, '2025-09-03', '11:00', 'Restauração dentária', 'Evitar alimentos duros', TRUE),
(7, 7, '2025-09-04', '13:00', 'Avaliação ortodôntica', 'Solicitar moldagem', FALSE),
(8, 8, '2025-09-04', '16:00', 'Cirurgia de implante', 'Antibiótico + analgésico', FALSE),
(9, 9, '2025-09-05', '09:15', 'Clareamento dentário', 'Gel clareador por 7 dias', TRUE),
(10,10,'2025-09-05', '17:45', 'Revisão de canal', 'Anti-inflamatório 3 dias', FALSE);

-----------------------------------------------------------------------------------------------------------------
-- SQL Dois índices coerentes

create index idx_paciente_nome on
projeto04.paciente(nome_completo);

create index idx_procedimento_nomes on
projeto04.procedimentos_odontologicos(nome_procedimento);

select*from projeto04.procedimentos_odontologicos where nome_procedimento = 'Clareamento dental'
select*from projeto04.paciente where nome_completo = 'Henrique Lima'

-----------------------------------------------------------------------------------------------------------------
-- SQL de 3 atualizações de registros com condições em alguma tabela.

update projeto04.paciente
set telefone = '42-9999-5555'
where id_paciente = 3;

update projeto04.consulta
set status_consulta = false
where data_consulta = '2025-09-01';

update projeto04.horario_atendimento
set dia_semana = 'Sexta'
where id_dentista = 1;

--SQL de 3 exclusão de registros com condições em alguma tabela.

delete from projeto04.consulta
where id_dentista = 4;

delete from projeto04.horario_atendimento
where id_horario= 4;

delete from projeto04.dentista
where id_dentista = 4;

---- Cinco consultas contextualizadas

/*1a - Quantidade de consultas por especialidade: selecione todas as especialidades
dos dentistas e faça um COUNT para contar o número total de consultas realizadas por
cada especialidade. */

select e.nome_especialidade, 
	count (c.id_consulta) as total_consulta
	from projeto04.consulta c
	join projeto04.dentista d
		on c.id_dentista = d.id_dentista
	join projeto04.especialidades as e 
		on d.id_especialidade = e.id_especialidade
	group by e.nome_especialidade
	order by total_consulta;

/*2a - Quantidade de consultas realizadas por cada dentista: selecione o nome de todos
os dentistas e faça um COUNT para contar a quantidade de consultas realizadas por
cada um e exiba em ordem decrescente pela quantidade de consultas. */

select d.nome_completo,
	count (c.id_consulta) as total_consulta
	from projeto04.dentista d
	join projeto04.consulta c
		on d.id_dentista = c.id_dentista
	group by d.nome_completo
	order by total_consulta desc;

	
/*3a - Pacientes com maior número de consultas: liste os pacientes e a quantidade de
consultas que cada um realizou, ordenando em ordem decrescente pelo número de
consultas. */

select p.nome_completo,
	count (c.id_consulta) as total_consulta
	from projeto04.consulta c
	join projeto04.paciente p
		on c.id_paciente = p.id_paciente
	group by p.nome_completo
	order by total_consulta desc;

/* 4a - View com lista de consultas ordenadas por data: crie uma VIEW que selecione os
seguintes campos: id_consulta, nome_paciente, nome_dentista, data_consulta,
procedimentos_realizados e ordene em ordem decrescente pela data da consulta. */


create view consultas_por_data as
	select
	c.id_consulta,
	p.nome_completo as paciente,
	d.nome_completo as dentista,
	c.data_consulta,
	c.descricao_atendimento
	from projeto04.consulta c
	join projeto04.paciente p on p.id_paciente = c.id_paciente
	join projeto04.dentista d on d.id_dentista = c.id_dentista
	order by c.data_consulta desc;
	
-- consultar a view
select * from consultas_por_data
order by data_consulta desc;
------------------------------------------------------
-- 5a - Média de consultas por dentista
------------------------------------------------------
select avg(total_consulta) as media_consultas_por_dentista
from (
    select d.id_dentista, count(c.id_consulta) as total_consulta
    from projeto04.dentista d
    left join projeto04.consulta c on d.id_dentista = c.id_dentista
    group by d.id_dentista
) sub;