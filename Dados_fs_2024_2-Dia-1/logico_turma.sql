/* logico_turma: */

CREATE TABLE Aluno (
    Nome VARCHAR,
    Matricula INTEGER,
    Data_nasc DATE,
    Sexo CHAR,
    CPF INTEGER,
    Endereco VARCHAR,
    fk_Turma_ID_turma SMALLINT,
    PRIMARY KEY (Matricula, CPF)
);

CREATE TABLE Turma (
    ID_turma SMALLINT PRIMARY KEY,
    Turno CHAR,
    Periodo SMALLINT,
    fk_Professor_Registro_Profissional INTEGER,
    fk_Professor_CPF INTEGER,
    fk_Professor_E_mail VARCHAR
);

CREATE TABLE Disciplina (
    Id_disciplina INTEGER PRIMARY KEY,
    Nome VARCHAR,
    Prof_responsavel VARCHAR,
    Turno SMALLINT
);

CREATE TABLE Professor (
    Registro_Profissional INTEGER,
    CPF INTEGER,
    Nome VARCHAR,
    E_mail VARCHAR,
    PRIMARY KEY (Registro_Profissional, CPF, E_mail)
);

CREATE TABLE estuda (
    fk_Aluno_Matricula INTEGER,
    fk_Aluno_CPF INTEGER,
    fk_Disciplina_Id_disciplina INTEGER
);

CREATE TABLE leciona (
    fk_Professor_Registro_Profissional INTEGER,
    fk_Professor_CPF INTEGER,
    fk_Professor_E_mail VARCHAR,
    fk_Disciplina_Id_disciplina INTEGER
);
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_Turma_ID_turma)
    REFERENCES Turma (ID_turma)
    ON DELETE RESTRICT;
 
ALTER TABLE Turma ADD CONSTRAINT FK_Turma_2
    FOREIGN KEY (fk_Professor_Registro_Profissional, fk_Professor_CPF, fk_Professor_E_mail)
    REFERENCES Professor (Registro_Profissional, CPF, E_mail)
    ON DELETE RESTRICT;
 
ALTER TABLE estuda ADD CONSTRAINT FK_estuda_1
    FOREIGN KEY (fk_Aluno_Matricula, fk_Aluno_CPF)
    REFERENCES Aluno (Matricula, CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE estuda ADD CONSTRAINT FK_estuda_2
    FOREIGN KEY (fk_Disciplina_Id_disciplina)
    REFERENCES Disciplina (Id_disciplina)
    ON DELETE RESTRICT;
 
ALTER TABLE leciona ADD CONSTRAINT FK_leciona_1
    FOREIGN KEY (fk_Professor_Registro_Profissional, fk_Professor_CPF, fk_Professor_E_mail)
    REFERENCES Professor (Registro_Profissional, CPF, E_mail)
    ON DELETE RESTRICT;
 
ALTER TABLE leciona ADD CONSTRAINT FK_leciona_2
    FOREIGN KEY (fk_Disciplina_Id_disciplina)
    REFERENCES Disciplina (Id_disciplina)
    ON DELETE RESTRICT;