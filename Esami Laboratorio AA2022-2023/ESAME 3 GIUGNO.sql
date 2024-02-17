SET NOCOUNT ON
SET DATEFORMAT dmy

USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'DB_smartphone_abb')  
	DROP DATABASE [DB_smartphone_abb]
GO

CREATE database DB_smartphone_abb
GO
USE DB_smartphone_abb
GO

/*
Creo gli script delle tabelle
*/

CREATE TABLE CLIENTE(
CODCL INT PRIMARY KEY,
NOME VARCHAR(45) NOT NULL,
ETA INT)
GO
INSERT INTO CLIENTE VALUES(1, 'ROMEO TRABOCCHI',28)
INSERT INTO CLIENTE VALUES(2, 'CRISTOPHER FRASSINO',28)
INSERT INTO CLIENTE VALUES(3, 'GIANNI NIBALI',28)
INSERT INTO CLIENTE VALUES(4, 'MICHELE SCARPONI',30)
INSERT INTO CLIENTE VALUES(5, 'NORA STELLA',30)
INSERT INTO CLIENTE VALUES(6, 'GIULIA TRENTI',40)
INSERT INTO CLIENTE VALUES(7, 'ROMEO EDDAMMO',45)
GO

CREATE TABLE TABLET(
CODTAB INT PRIMARY KEY,
MARCA VARCHAR(45) NOT NULL,
TIPO VARCHAR(45) NOT NULL,
PREZZO MONEY NOT NULL)
GO
INSERT INTO TABLET VALUES (100,'Amazon', 'Fire HD 10',490) 
INSERT INTO TABLET VALUES (101,'Samsung', 'Galaxy Tab S6',520) 
INSERT INTO TABLET VALUES (102,'Microsoft','Surface Pro x', 970)
INSERT INTO TABLET VALUES (103,'Microsoft','Surface Go', 470)
INSERT INTO TABLET VALUES (104,'Apple','iPad 2019', 370)
GO

CREATE TABLE SMARTPHONE(
CODSMART INT PRIMARY KEY,
MARCA VARCHAR(45) NOT NULL,
TIPO VARCHAR(45) NOT NULL,
PREZZO MONEY NOT NULL)
GO
INSERT INTO SMARTPHONE VALUES (1,'SAMSUNG','GALAXY S9',300)
INSERT INTO SMARTPHONE VALUES (2,'SAMSUNG','GALAXY S10',600)
INSERT INTO SMARTPHONE VALUES (3,'APPLE','IPHONE 7',600)
INSERT INTO SMARTPHONE VALUES (4,'APPLE','IPHONE 11',840)
INSERT INTO SMARTPHONE VALUES (5,'NOKIA','LUMIA 930',200)
INSERT INTO SMARTPHONE VALUES (6,'LG','G8X',620) 
GO

CREATE TABLE ACQUISTO(
DATA date,
CODCL INT REFERENCES CLIENTE,
CODSMART INT REFERENCES SMARTPHONE,
CODTAB INT REFERENCES TABLET,
PRIMARY KEY(CODCL,DATA)
)

INSERT INTO ACQUISTO VALUES('2/02/2020',2,2,null)
INSERT INTO ACQUISTO VALUES('6/03/2020',3,3,null)
INSERT INTO ACQUISTO VALUES('15/04/2020',3,null,100)
INSERT INTO ACQUISTO VALUES('15/04/2020',4,null,101)
INSERT INTO ACQUISTO VALUES('11/05/2020',5,4,null)
INSERT INTO ACQUISTO VALUES('11/05/2020',6,null,102)

CREATE TABLE ABBONAMENTO(
NUM_SIM int PRIMARY KEY,
DATA date,
CODCL INT REFERENCES CLIENTE,
CODSMART INT REFERENCES SMARTPHONE,
CODTAB INT REFERENCES TABLET,
TRAFFICO_INTERNET INT,
MINUTI_VOCE INT,
COSTO_MENSILE MONEY NOT NULL
)

INSERT INTO ABBONAMENTO VALUES(340505050, '01/12/2019',1,1,null,1,400,20)
INSERT INTO ABBONAMENTO VALUES(349933050, '01/12/2019',1,null,104,1,400,20)
INSERT INTO ABBONAMENTO VALUES(333101010, '15/08/2019',4,null,102,2,0,15)
INSERT INTO ABBONAMENTO VALUES(333202020, '15/08/2019',5,null,103,3,800,30)
INSERT INTO ABBONAMENTO VALUES(340678780, '01/11/2019',2,3,null,1,400,20)




--ESERCIZIO 1
/*
Inserire 30 euro come valore di default per l’attributo costo_mensile in tabella Abbonamento.
Scegliere l'istruzione corretta (-1 punto per risposte errate).

Domanda 1Scegli un'alternativa:

a.
alter table Abbonamento add constraint dft_costo_mensile 30 default for costo_mensile


b.
alter table Abbonamento add default 30 for costo_mensile 


c.
alter table Abbonamento  add constraint dft_costo_mensile default 30 for costo_mensile


d.
alter table Abbonamento alter column costo_mensile default 30
*/

  RISPOSTA CORRETTA C

--ESERCIZIO 2
--Modificare la tabella acquisto, aggiungendo l'attributo "data_vendita" di tipo data

[ALTER ] [TABLE ] [acquisto ] [ADD ] [data_vendita ] [DATE]

--ESERCIZIO 3
--Modificare la tabella acquisto, aggiungendo il vincolo che un cliente non possa comprare due volte lo stesso smartphone

[ALTER ] [TABLE ] [acquisto ] [ADD CONSTRAINT ] [unique_smartphone] [UNIQUE] [(CODCL,CODSMART)]


--ESERCIZIO 4
--Selezionare il nome dei clienti che hanno acquistato uno tablet di tipo “Surface” (qualsiasi modello Surface).

SELECT C.NOME
FROM CLIENTE C, ACQUISTO A, TABLET T
WHERE C.CODCL = A.CODCL
AND A.CODTAB = T.CODTAB
AND T.TIPO LIKE 'Surface%';

--ESERCIZIO 5
--Riportare il totale pagato al mese dal cliente 'Gianni Nibali' per tutti i suoi abbonamenti sottoscritti.

SELECT SUM(A.COSTO_MENSILE) 
FROM ABBONAMENTO A, CLIENTE C
WHERE A.CODCL = C.CODCL
AND C.NOME = 'Gianni Nibali'



--ESERCIZIO 6 //SBAGLIATA
--Selezionare per ogni marca di tablet, il numero e il prezzo medio degli tablet acquistati nel 2020, includere nel risultato anche le marche per le quali non sono stati acquistati tablet in tale anno. Ordinare il risultato per il prezzo medio degli tablet in senso descrescente.


SELECT T.MARCA, COUNT(T.CODTAB) AS CONTEGGIO, AVG(T.PREZZO) AS MEDIA
FROM TABLET T, ACQUISTO A
WHERE T.CODTAB = A.CODTAB
AND YEAR(A.DATA) = 2020
GROUP BY T.MARCA
ORDER BY MEDIA DESC
