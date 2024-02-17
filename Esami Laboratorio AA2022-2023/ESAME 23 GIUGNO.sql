-- NON MODIFICARE NULLA NEL RESTO DI QUESTO FILE
-- SE NON ISTRUITO IN PROPOSITO DAL DOCENTE


Set NOCOUNT ON
Set DATEFORMAT dmy


USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'DB20200623')  
	DROP DATABASE [DB20200623]
GO

CREATE DATABASE DB20200623
GO

USE DB20200623
GO
-- INIZIO CREAZIONE STRUTTURA


create table Proprietario(
cf varchar(20),
nome varchar(20),
cognome varchar(20),
data_nascita date,
Primary key(cf)
)

insert into Proprietario values('hnkfba70s26g123p','Amanda','Rossi','12/10/70')
insert into Proprietario values('hsdfha60s26g123p','Antonio','Belli','12/10/60')
insert into Proprietario values('lderba70s26g123p','Lucia','Rossi','20/02/70')
insert into Proprietario values('erdfsa40s26g123p','Giovanni','Sorbelli','29/03/40')
insert into Proprietario values('hnssda90s26g123p','Francesco','Maestri','02/10/90')
insert into Proprietario values('sertga85s26g123p','Domenico','Soci','01/11/85')

create table Esemplare
(
  identificativo integer primary key,
  cf_Proprietario varchar(20) references Proprietario, 
  SpecieAnimale varchar(20),
  eta integer,
  aspettativa_di_vita float,
  data_nascita date,
  data_morte date
);

insert into Esemplare values(1,'sertga85s26g123p', 'cane', 4, 11.5,'08/02/2018', null);
insert into Esemplare values(2,'hsdfha60s26g123p', 'cavallo', 5, 27.1,'08/09/2018',null );
insert into Esemplare values(3,'lderba70s26g123p', 'cane', 13, 11.5,'08/02/2018','25/12/2018');
insert into Esemplare values(4,'lderba70s26g123p', 'gatto', 11, 16,'08/02/2016','20/12/2018');
insert into Esemplare values(5,'hnssda90s26g123p', 'gatto', 1, 16,'08/05/2008',null);
insert into Esemplare values(6,'sertga85s26g123p', 'gatto', 20, 16,'08/06/2016', null);
insert into Esemplare values(7,'sertga85s26g123p', 'serpente', 2, 9.2,'18/06/2016', null);
insert into Esemplare values(8,'sertga85s26g123p', 'cane', 12, 11.5,'01/09/2016', '22/12/2018');
insert into Esemplare values(9,'hsdfha60s26g123p', 'cavallo', 1, 27.1,'11/06/2016', null);
insert into Esemplare values(10,'erdfsa40s26g123p', 'gatto', 9, 16,'13/08/2016', null);
insert into Esemplare values(11,'sertga85s26g123p', 'criceto', 2, 2.9,'03/11/2016', null);
insert into Esemplare values(12,'sertga85s26g123p', 'cane', 6, 11.5,'09/12/2011', null);


create table Visita
(
Esemplare integer references Esemplare,
data date,
fattura float,
primary key (Esemplare, data)
)

create table Farmaco
(
nome varchar(20) primary key,
prezzo float
)

insert into Visita values(1,'10/11/2019', 199.9);
insert into Visita values(2,'10/11/2019', 1909.9);
insert into Visita values(3,'12/12/2019', 201);
insert into Visita values(4,'13/12/2019', 1888);
insert into Visita values(4,'17/12/2019', 622);
insert into Visita values(5,'14/12/2019', 925);
insert into Visita values(6,'15/12/2019', 300);
insert into Visita values(7,'16/12/2019', 55.5);
insert into Visita values(8,'16/12/2019', 199.9);
insert into Visita values(9,'20/11/2019', 200);
insert into Visita values(10,'12/12/2018', 50);
insert into Visita values(11,'09/12/2018', 88);
insert into Visita values(1,'19/05/2020', 198);
insert into Visita values(2,'29/05/2020', 1500);

insert into Farmaco values ('antibiotico xy70', 40)
insert into Farmaco values ('posterix', 30)
insert into Farmaco values ('fermentix l30gb', 8)
insert into Farmaco values ('multivitaminico gbh', 22)
insert into Farmaco values ('integratore top10', 10)
insert into Farmaco values ('cicatrizzante', 15)

create table Somministrazioni
(
esemplare integer,
data date ,
num int,
nome varchar(20) references Farmaco,
dose integer,
primary key (num,esemplare, data)
)


insert into Somministrazioni values(1,'10/11/2019',1, 'antibiotico xy70', 2);
insert into Somministrazioni values(1,'10/11/2019',2, 'integratore top10', 2);
insert into Somministrazioni values(2,'10/11/2019',1, 'fermentix l30gb', 2);
insert into Somministrazioni values(4,'13/12/2019',2, 'posterix', 4);
insert into Somministrazioni values(4,'13/12/2019',1, 'cicatrizzante', 2);
insert into Somministrazioni values(5,'14/12/2019',1, 'cicatrizzante', 5);
insert into Somministrazioni values(6,'15/12/2019',1, 'multivitaminico gbh', 10);
insert into Somministrazioni values(6,'15/12/2019',2, 'integratore top10',3);
insert into Somministrazioni values(8,'16/12/2019',1, 'antibiotico xy70', 3);
insert into Somministrazioni values(9,'20/11/2019',1, 'multivitaminico gbh',3);
insert into Somministrazioni values(9,'20/11/2019',2, 'integratore top10', 5);
insert into Somministrazioni values(9,'20/11/2019',3,  'antibiotico xy70',1);
insert into Somministrazioni values(1,'19/05/2020',1, 'antibiotico xy70', 4);
insert into Somministrazioni values(2,'29/05/2020',1, 'fermentix l30gb',1);
insert into Somministrazioni values(2,'29/05/2020',2, 'posterix',2);


--ESERCIZIO 1

--RISPOSTA GIUSTA C

--ESERCIZIO 2

--[ALTER ] [TABLE ] [Proprietario] [ADD ] [citta] [varchar(50)]

--ESERCIZIO 3

--[ALTER ] [TABLE ] [Somministrazioni] [ADD CONSTRAINT fk_visita] [ FOREIGN KEY ] [(Esemplare,data)] [references] [Visita]

--ESERCIZIO 4

SELECT
    V.Esemplare AS Identificativo_Esemplare,
    COUNT(*) AS Numero_Visite
FROM Visita V
WHERE YEAR(V.data) = 2019
GROUP BY V.Esemplare
ORDER BY Numero_Visite DESC

-- RISPOSTA 4

--ESERCIZIO 5

ALTER TABLE Somministrazioni
DROP CONSTRAINT FK_Somministrazioni_Farmaco;

ALTER TABLE Somministrazioni
ADD CONSTRAINT FK_Somministrazioni_Farmaco 
FOREIGN KEY (nome) 
REFERENCES Farmaco(nome) 
ON DELETE SET NULL;

--ESERCIZIO 6

SELECT
    F.nome AS Nome_Farmaco,
    MAX(S.data) AS Ultima_Somministrazione
FROM Farmaco F
LEFT JOIN Somministrazioni S ON F.nome = S.nome
GROUP BY F.nome
ORDER BY Ultima_Somministrazione ASC;

--ESERCIZIO 7
--Visualizzare per ogni proprietario: il numero totale di esemplari in suo possesso ancora in vita (data_morte  dovrà essere null), il totale pagato per le visite di tutti i suoi animali (si faccia riferimento al costo riportato in fattura), il numero di visite medio subito dai suoi esemplari.


SELECT P.cf, P.cognome, P.nome, P.data_nascita, SUM(V.fattura) AS TOT_PAGATO, COUNT(E.identificativo) AS VISITE_MEDIE
FROM Proprietario P, Esemplare E, Visita V
WHERE P.cf = E.cf_Proprietario
AND V.Esemplare = E.identificativo
AND E.data_morte IS NULL
GROUP BY P.cf, P.cognome, P.nome, P.data_nascita


