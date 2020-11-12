CREATE TABLE  ALUNO
(
    ID          PRIMARY KEY,
    NOME        VARCHAR(30) NOT NULL,
    SOBRENOME   VARCHAR(30),
    RA          INT NOT NULL,
    EMAIL       VARCHAR NOT NULL(60)
);
CREATE TABLE PROFESSOR
(
    ID          PRIMARY KEY,
    NOME        VARCHAR(30),
    SOBRENOME   VARCHAR(30),
    TITULACAO   VARCHAR(30)
);
CREATE TABLE CURSO
(
    ID      PRIMARY KEY,
    NOME    VARCHAR(30),
    ANO     DATA
);
CREATE TABLE MATRICULA
(
    CURSO_FK INTEGER,
    ALUNO_FK INT,
    FOREIGN KEY(CURSO_FK) REFERENCES CURSO(ID),
    FOREIGN KEY(ALUNO_FK) REFERENCES ALUNO(ID)
);
CREATE TABLE DISCIPLINA
(
    ID PRIMARY KEY,
    NOME VARCHAR(30),
    CURSO_FK INT,
    PROFESSOR_FK INT,
    FOREIGN KEY(CURSO_FK) REFERENCES CURSO(ID),
    FOREIGN KEY(PROFESSOR_FK) REFERENCES PROFESSOR(ID)
);