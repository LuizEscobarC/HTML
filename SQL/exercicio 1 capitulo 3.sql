/*NUMERO 1*/

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

/*NUMERO 2*/
/*LETRA A*/

SELECT ALUNO.NOME
FROM   ALUNO
WHERE  ALUNO.ID = MATRICULA.ALUNO_FK AND NOME = 'BANCO DE DADOS';

/*LETRA B*/

SELECT PROFESSOR.TITULACAO
FROM   PROFESSOR
WHERE  PROFESSOR.TITULACAO = 'SQL';

/*LETRA C*/

SELECT NOME, SOBRENOME, RA
FROM   ALUNO
WHERE  MATRICULA.ALUNO_FK = DISCIPLINA.PROFESSOR_FK
AND    PROFESSOR.NOME = 'EDSON';

/*LETRA D*/

SELECT *
FROM CURSO
WHERE ANO = '1990-__-__';

/* NUMERO 3*/

INSERT INTO ALUNO(NOME, SOBRENOME, RA)
VALUES ('MACACO', 'INDIO MEIABOMBA', 32103);

UPDATE CURSO
SET NOME = 'ANALISE E DESENVOLVIMENTO DE MACACOS', ANO = '2030-09-08'
WHERE ID = 1;

DELETE FROM DISCIPLINA
WHERE ID = 3; 
