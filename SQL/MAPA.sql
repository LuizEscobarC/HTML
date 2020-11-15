DROP TABLE TIPO_PRODUTO;

CREATE TABLE TIPO_PRODUTO
 (
 ID SERIAL PRIMARY KEY,
 DESCRICAO VARCHAR(120) NOT NULL
 );

 SELECT * FROM TIPO_PRODUTO;
 INSERT INTO TIPO_PRODUTO (DESCRICAO) VALUES ('Consumo, '), ('Venda');

 DROP TABLE TIPO_PAGAMENTO;

 CREATE         TABLE TIPO_PAGAMENTO(
 ID             SERIAL PRIMARY KEY,
 DESCRICAO      VARCHAR(120) NOT NULL);
 SELECT    *    FROM TIPO_PAGAMENTO;
 INSERT         INTO TIPO_PAGAMENTO (DESCRICAO) 
 VALUES ('A Vista'), ('A Prazo');

 DROP TABLE PRODUTOS;

 CREATE          TABLE PRODUTOS
 (
 ID              SERIAL PRIMARY KEY,
 DESCRICAO       VARCHAR(120) NOT NULL,
 VALOR           NUMERIC(10,2) NOT NULL,
 ID_TIPO_PRODUTO INTEGER NOT NULL,
 FOREIGN KEY     (ID_TIPO_PRODUTO) 
 REFERENCES      TIPO_PRODUTO(ID)
 );
 SELECT * FROM PRODUTOS;
 INSERT INTO PRODUTOS (DESCRICAO, VALOR, ID_TIPO_PRODUTO) 
 VALUES ('SABÃO EM PÓ 2KG', 17.00, 1);
 INSERT INTO PRODUTOS (DESCRICAO, VALOR, ID_TIPO_PRODUTO) 
 VALUES ('COXINHA', 5.00, 2);
 INSERT INTO PRODUTOS (DESCRICAO, VALOR, ID_TIPO_PRODUTO) 
 VALUES ('EMPADINHA', 7.00, 2);
 INSERT INTO PRODUTOS (DESCRICAO, VALOR, ID_TIPO_PRODUTO) 
 VALUES ('BOLO PEDAÇO', 7.50, 2);
 INSERT INTO PRODUTOS (DESCRICAO, VALOR, ID_TIPO_PRODUTO) 
 VALUES ('DETERGENTE 5 LITROS', 8.00, 1);
 INSERT INTO PRODUTOS (DESCRICAO, VALOR, ID_TIPO_PRODUTO) 
 VALUES ('PASTEL', 6.00, 2);
 INSERT INTO PRODUTOS (DESCRICAO, VALOR, ID_TIPO_PRODUTO) 
 VALUES ('PIZZA PEDAÇO', 7.00, 2);
 INSERT INTO PRODUTOS (DESCRICAO, VALOR, ID_TIPO_PRODUTO) 
 VALUES ('SUCO', 7.00, 2);

 DROP TABLE PEDIDOS;

 CREATE TABLE PEDIDOS(
 ID             SERIAL PRIMARY KEY,
 DATAB          DATE NOT NULL,
 ID_TIPO_PAGAMENTO  INTEGER NOT NULL,
 VALOR_TOTAL    NUMERIC(10,2) NOT NULL,
 FOREIGN KEY (ID_TIPO_PAGAMENTO) REFERENCES TIPO_PAGAMENTO(ID)
 );
 SELECT * FROM PEDIDOS;
 INSERT INTO   PEDIDOS (DATA, ID_TIPO_PAGAMENTO, VALOR_TOTAL)
 VALUES        ('2020/07/27', 1, 16.00),
               ('2020/08/05', 2, 27.00),
               ('2020/08/06', 1, 13.50)
 ;
 DROP TABLE      PEDIDOS_PRODUTOS;
 CREATE TABLE    PEDIDOS_PRODUTOS(
 ID              SERIAL PRIMARY KEY,
 ID_PEDIDO       INTEGER NOT NULL,
 ID_PRODUTO      INTEGER NOT NULL,
 QTDE            INTEGER NOT NULL,
 VALOR_UNIT      NUMERIC(10,2) NOT NULL,
 VALOR_TOTAL     NUMERIC(10,2) NOT NULL,
 FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDOS(ID),
 FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS(ID)
 );
 SELECT    *     FROM PEDIDOS_PRODUTOS;
 INSERT INTO     PEDIDOS_PRODUTOS (ID_PEDIDO, ID_PRODUTO, QTDE, VALOR_UNIT, VALOR_TOTAL)
 VALUES          (1, 2, 2, 5.00, 10.00),
                 (1, 6, 1, 6.00, 6.00),
                 (2, 3, 3, 7.00, 21.00),
                 (2, 6, 1, 6.00, 6.00),
                 (3, 4, 1, 7.50, 7.50),
                 (3, 6, 1, 6.00, 6.00)
 ;