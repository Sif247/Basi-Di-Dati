-- NON MODIFICARE NULLA NEL RESTO DI QUESTO FILE
-- SE NON ISTRUITO IN PROPOSITO DAL DOCENTE


Set NOCOUNT ON
Set DATEFORMAT dmy


USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'DBclinicaveterinaria2021')  
	DROP DATABASE [DBclinicaveterinaria2021]
GO

CREATE DATABASE [DBclinicaveterinaria2021]
GO

USE [DBclinicaveterinaria2021]
GO
-- INIZIO CREAZIONE STRUTTURA


create table Padrone(
cf varchar(20),
nome varchar(20),
cognome varchar(20),
data_nascita date,
Primary key(cf)
)

insert into Padrone values('hnkfba70s26g123p','Amanda','Rossi','12/10/70')
insert into Padrone values('hsdfha60s26g123p','Antonio','Belli','12/10/60')
insert into Padrone values('lderba70s26g123p','Lucia','Rossi','20/02/70')
insert into Padrone values('erdfsa40s26g123p','Giovanni','Sorbelli','29/03/40')
insert into Padrone values('hnssda90s26g123p','Francesco','Maestri','02/10/90')
insert into Padrone values('sertga85s26g123p','Domenico','Soci','01/11/85')

create table Animale
(
  identificativo integer primary key,
  cf_padrone varchar(20) references Padrone, 
  specie varchar(20),
  eta integer,
  aspettativa_di_vita float,
  data_morte date
);

insert into Animale values(1,'sertga85s26g123p', 'cane', 4, 11.5, null);
insert into Animale values(2,'hsdfha60s26g123p', 'cavallo', 5, 27.1,null );
insert into Animale values(3,'lderba70s26g123p', 'cane', 13, 11.5, '25/12/2020');
insert into Animale values(4,'lderba70s26g123p', 'gatto', 11, 16,'10/02/2021');
insert into Animale values(5,'hnssda90s26g123p', 'gatto', 1, 16,null);
insert into Animale values(6,'sertga85s26g123p', 'gatto', 20, 16, null);
insert into Animale values(7,'sertga85s26g123p', 'serpente', 2, 9.2, null);
insert into Animale values(8,'sertga85s26g123p', 'cane', 12, 11.5, '12/02/2021');
insert into Animale values(9,'hsdfha60s26g123p', 'cavallo', 1, 27.1, null);
insert into Animale values(10,'erdfsa40s26g123p', 'gatto', 9, 16, null);
insert into Animale values(11,'sertga85s26g123p', 'criceto', 2, 2.9, null);
insert into Animale values(12,'sertga85s26g123p', 'cane', 6, 11.5, null);


create table Visita
(
animale integer references Animale,
data date,
fattura float,
primary key (animale, data)
)

create table Farmaco
(
nome varchar(20) primary key,
prezzo float
)

insert into Visita values(1,'10/11/2020', 199.9);
insert into Visita values(2,'10/11/2020', 1909.9);
insert into Visita values(3,'12/12/2020', 201);
insert into Visita values(4,'13/12/2020', 1888);
insert into Visita values(4,'17/01/2021', 622);
insert into Visita values(5,'14/01/2021', 925);
insert into Visita values(6,'15/01/2021', 300);
insert into Visita values(7,'16/01/2021', 55.5);
insert into Visita values(8,'16/01/2021', 199.9);
insert into Visita values(9,'03/02/2021', 200);
insert into Visita values(10,'12/01/2021', 50);
insert into Visita values(11,'09/01/2021', 88);
insert into Visita values(1,'19/01/2021', 198);
insert into Visita values(1,'29/01/2021', 1500);

insert into Farmaco values ('hb20h', 30)
insert into Farmaco values ('posterix', 300)
insert into Farmaco values ('l30gb', 800)
insert into Farmaco values ('gbh', 20)
insert into Farmaco values ('ttp20', 10)
insert into Farmaco values ('lsh12', 100)

create table Somministrazioni
(
animale integer,
data date ,
nome varchar(20) references Farmaco,
dose integer,
primary key (nome,animale, data)
)


insert into Somministrazioni values(1,'10/11/2020', 'hb20h', 2);
insert into Somministrazioni values(1,'10/11/2020', 'ttp20', 2);
insert into Somministrazioni values(2,'10/11/2020','l30gb', 2);
insert into Somministrazioni values(4,'13/12/2020', 'posterix', 4);
insert into Somministrazioni values(4,'13/12/2020', 'lsh12', 2);
insert into Somministrazioni values(5,'14/01/2021', 'lsh12', 5);
insert into Somministrazioni values(6,'15/01/2021','gbh', 10);
insert into Somministrazioni values(6,'15/01/2021', 'ttp20',3);
insert into Somministrazioni values(8,'16/01/2021','hb20h', 3);
insert into Somministrazioni values(9,'03/02/2021','gbh',3);
insert into Somministrazioni values(9,'03/02/2021','ttp20', 5);
insert into Somministrazioni values(9,'03/02/2021', 'hb20h',1);
insert into Somministrazioni values(1,'19/01/2021','hb20h', 4);
insert into Somministrazioni values(1,'29/01/2021','l30gb',1);
insert into Somministrazioni values(4,'17/01/2021','posterix',2);


--ESERCIZIO 1

--[ALTER ] [TABLE ] [Animale] [ADD CONSTRAINT check_eta] [CHECK] [(eta>0)] 

--ESERCIZIO 2

ALTER TABLE Visita

	ADD CONSTRAINT FK_DATA
	UNIQUE (animale, data)
;

--ESERCIZIO 3

DROP TABLE Somministrazioni
	ADD CONSTRAINT FK_VISITA
	FOREIGN KEY (animale, data) REFERENCES Visita (animale, data)
	;

--ESERCIZIO 4

SELECT F2.nome
FROM Farmaco F2
WHERE F2.nome NOT IN (
						SELECT F.nome
						FROM Somministrazioni S, Farmaco F
						WHERE Somministrazioni.nome = F.nome );


--ESERCIZIO 5

SELECT YEAR(V.data), COUNT(V.animale) AS N_VISITE, A.identificativo, P.cf, P.nome, P.cognome
FROM Animale A, Visita V, Padrone P
WHERE A.identificativo = V.animale
AND P.cf = A.cf_padrone
GROUP BY A.identificativo,P.cf, P.nome, P.cognome, YEAR(V.data)
HAVING COUNT(*) >= ALL ( SELECT  COUNT(*)
						 FROM VISITA V1
						 WHERE YEAR(V1.DATA) = YEAR(V.data)
						 GROUP BY V1.animale);
												 
