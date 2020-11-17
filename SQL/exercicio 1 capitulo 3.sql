/*NUMERO 1*/

CREATE TABLE  ALUNO
(
    ID         INT PRIMARY KEY,
    NOME        VARCHAR(30) NOT NULL,
    SOBRENOME   VARCHAR(30),
    RA          DECIMAL (8) NOT NULL,
    EMAIL       VARCHAR(30) NOT NULL
);
CREATE TABLE PROFESSOR
(
    ID       INT   PRIMARY KEY,
    NOME        VARCHAR(30),
    SOBRENOME   VARCHAR(30),
    TITULACAO   VARCHAR(30)
);
CREATE TABLE CURSO
(
    ID     INT PRIMARY KEY,
    NOME    VARCHAR(30),
    ANO     DECIMAL(4)
);
CREATE TABLE MATRICULA
(
    CURSO_FK INT NOT NULL,
    ALUNO_FK INT NOT NULL,
    PRIMARY KEY (CURSO_FK, ALUNO_FK),
    FOREIGN KEY(CURSO_FK) REFERENCES CURSO(ID),
    FOREIGN KEY(ALUNO_FK) REFERENCES ALUNO(ID)
);
CREATE TABLE DISCIPLINA
(
    ID INT PRIMARY KEY,
    NOME VARCHAR(30),
    CURSO_FK INT NOT NULL,
    PROFESSOR_FK INT NOT NULL,
    FOREIGN KEY(CURSO_FK) REFERENCES CURSO(ID),
    FOREIGN KEY(PROFESSOR_FK) REFERENCES PROFESSOR(ID)
);

/*NUMERO 2*/
/*LETRA A*/

SELECT ALUNO.NOME
FROM   ALUNO, CURSO, MATRICULA
WHERE  ALUNO.ID = MATRICULA.ALUNO_FK AND
CURSO.NOME = 'BANCO DE DADOS' AND CURSO.ID = MATRICULA.CURSO_FK;

/*LETRA B*/

SELECT PROFESSOR.TITULACAO
FROM   PROFESSOR, DICIPLINA
WHERE DICIPLINA.NOME = 'SQL' AND PROFESSOR.ID = DICIPLINA.PROFESSOR_FK;

/*LETRA C*/

SELECT ALUNO.NOME, ALUNO.SOBRENOME, ALUNO.RA
FROM   ALUNO, MATRICULA,CURSO,DICIPLINA,PROFESSOR
WHERE  MATRICULA.ALUNO_FK = ALUNO.ID AND
MATRICULA.CURSO_FK = CURSO.ID AND
DICIPLINA.CURSO_FK=CURSO.ID AND DICIPLINA.PROFESSOR_FK = PROFESSOR.ID AND
PROFESSOR.NOME = 'EDSON'


/*LETRA D*/

SELECT ID, NOME, ANO
FROM CURSO
WHERE ANO > 1990;

/* NUMERO 3*/

INSERT INTO ALUNO(NOME, SOBRENOME, RA)
VALUES ('MACACO', 'INDIO MEIABOMBA', 32103);

UPDATE CURSO
SET NOME = 'ANALISE E DESENVOLVIMENTO DE MACACOS', ANO = '2030-09-08'
WHERE ID = 1;

DELETE FROM DISCIPLINA
WHERE ID = 3; 

/* consultar todos os professores que não tenham telefones cadastrados*/

SELECT *
FROM PROFESSOR
WHERE FONE IS NULL;

/* Listar o nome e o cargo de todos os Funcionários que foram demitidos: */

SELECT NOME, CARGO
FROM FUNCIONARIOS
WHERE DATA_DEMISSAO IS NOT NULL;

/*consulta aninhada IN*/

SELECT telefone 
FROM telefone 
WHERE contato_fk IN
(
SELECT id 
FROM contato
WHERE sobrenome = ‘Machado’
)

/*Consulta aninhada EXISTS*/

SELECT f.nome, f.sobrenome 
FROM funcionario AS f 
WHERE EXISTS
(
    SELECT * FROM subordinado AS s 
    WHERE f.nome = s.nome
)