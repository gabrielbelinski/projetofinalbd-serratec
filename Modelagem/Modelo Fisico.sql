CREATE TABLE ProcedimentosOdontologicos 
( 
 id_procedimento INT PRIMARY KEY,  
 nome_procedimento VARCHAR(n),  
 descricao_procedimento VARCHAR(n),  
); 

CREATE TABLE Consulta 
( 
 data_consulta DATE,  
 prescricao VARCHAR(n),  
 status_consulta INT,  
 descricao_atendimento VARCHAR(n),  
 id_consulta INT PRIMARY KEY AUTO_INCREMENT,  
 idDentista INT,  
 idPaciente INT,  
); 

CREATE TABLE Paciente 
( 
 id_paciente INT PRIMARY KEY AUTO_INCREMENT,  
 nome_completo VARCHAR(n),  
 data_nascimento DATE,  
 telefone VARCHAR(n),  
 cpf CHAR(n),  
 email VARCHAR(n),  
 endereco VARCHAR(n),  
 UNIQUE (cpf)
); 

CREATE TABLE Dentista 
( 
 id_dentista INT PRIMARY KEY,  
 nome_completo VARCHAR(n),  
 cpf CHAR(n),  
 cro VARCHAR(n),  
 idEspecialidades INT,  
 UNIQUE (cpf)
); 

CREATE TABLE HorarioAtendimento 
( 
 id_horario INT PRIMARY KEY,  
 dia_semana VARCHAR(n),  
 hora_inicio DATE,  
 hora_fim DATE,  
 idDentista INT,  
); 

CREATE TABLE Especialidades 
( 
 id_especialidade INT PRIMARY KEY,  
 nome_especialidade VARCHAR(n),  
 descricao_especialidade VARCHAR(n),  
); 

CREATE TABLE Realiza 
( 
 id_especialidade INT PRIMARY KEY,  
 id_procedimento INT PRIMARY KEY,  
); 

ALTER TABLE Consulta ADD FOREIGN KEY(idDentista) REFERENCES Dentista (idDentista)
ALTER TABLE Consulta ADD FOREIGN KEY(idPaciente) REFERENCES Paciente (idPaciente)
ALTER TABLE Dentista ADD FOREIGN KEY(idEspecialidades) REFERENCES Especialidades (idEspecialidades)
ALTER TABLE HorarioAtendimento ADD FOREIGN KEY(idDentista) REFERENCES Dentista (idDentista)
ALTER TABLE Realiza ADD FOREIGN KEY(id_especialidade) REFERENCES Especialidades (id_especialidade)
ALTER TABLE Realiza ADD FOREIGN KEY(id_procedimento) REFERENCES ProcedimentosOdontologicos (id_procedimento)
