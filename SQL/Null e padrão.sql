/*Aqui é criada uma tabela contato e epecificado valores não nulos para 
  nao ficarem vazios, e para por padrão é utilizado o DEFAULT*/
CREATE TABLE contato
(
    ID INT PRIMARY KEY,
    NOME VARCHAR(30)    NOT NULL,
    SOBRENOME VARCHAR(30) NOT NULL DEFAULT 'Silva',
    NASCIMENTO DECIMAL(10,2)
);