SET DATEFORMAT mdy

create table S(
Matr char(2) PRIMARY KEY,
SNome varchar(20) not null,
Citta char(2) null,
ACorso int not null)
go
create table D(
CD char(2) PRIMARY KEY,
CNome varchar(20) not null,
Citta char(2) null)
go
create table C(
CC char(2) PRIMARY KEY,
CNome varchar(20) not null,
CD char(2) not null references D)
go
create table E(
Matr char(2) references S,
CC char(2) references C,
Data date not null,
Voto int not null check ((voto>=18 and voto <=30) or (voto=33)),
PRIMARY KEY (Matr,CC) )
go


--inserimento degli studenti
Insert into S (Matr,SNome,Citta,ACorso)
values ('M1','Lucia Quaranta','SA',1)
Insert into S (Matr,SNome,Citta,ACorso)
values ('M2','Giacomo Tedesco','PA',2)
Insert into S (Matr,SNome,Citta,ACorso)
values ('M3','Carla Longo','MO',1)
Insert into S (Matr,SNome,Citta,ACorso)
values ('M4','Ugo Rossi','MO',1)
Insert into S (Matr,SNome,Citta,ACorso)
values ('M5','Valeria Neri','MO',2)
Insert into S (Matr,SNome,Citta,ACorso)
values ('M6','Giuseppe Verdi','BO',1)
Insert into S (Matr,SNome,Citta,ACorso)
values ('M7','Maria Rossi',null,1)

--inserimento dei docenti
insert into D (CD,CNome,Citta)
values ('D1','Paolo Rossi','MO')
insert into D (CD,CNome,Citta)
values ('D2','Maria Pastore','BO')
insert into D (CD,CNome,Citta)
values ('D3','Paola Caboni','FI')


--inserimento dei corsi
Insert into C(CC,CNome,CD)
values ('C1','Fisica 1','D1')
Insert into C(CC,CNome,CD)
values ('C2','Analisi Matematica 1','D2')
Insert into C(CC,CNome,CD)
values ('C3','Fisica 2','D1')
Insert into C(CC,CNome,CD)
values ('C4','Analisi Matematica 2','D3')


--inserimento degli esami
Insert into E (Matr,CC,Data,Voto)
values ('M1','C1','06-29-1995',24)
Insert into E (Matr,CC,Data,Voto)
values ('M1','C2','08-09-1996',33)
Insert into E (Matr,CC,Data,Voto)
values ('M1','C3','03-12-1996',30)
Insert into E (Matr,CC,Data,Voto)
values ('M2','C1','06-29-1995',28)
Insert into E (Matr,CC,Data,Voto)
values ('M2','C2','07-07-1996',24)
Insert into E (Matr,CC,Data,Voto)
values ('M3','C2','07-07-1996',27)
Insert into E (Matr,CC,Data,Voto)
values ('M3','C3','11-11-1996',25)
Insert into E (Matr,CC,Data,Voto)
values ('M4','C3','11-11-1996',33)
Insert into E (Matr,CC,Data,Voto)
values ('M6','C2','01-02-1996',28)
Insert into E (Matr,CC,Data,Voto)
values ('M7','C1','06-29-1995',24)
Insert into E (Matr,CC,Data,Voto)
values ('M7','C2','04-11-1996',26)
Insert into E (Matr,CC,Data,Voto)
values ('M7','C3','06-23-1996',27)

---------
SELECT * FROM S
SELECT * FROM E
--------------------------------------

--INTERROGAZIONI "ALMENO UNO" CON JOIN E SUBQUERY (IN)

--------------------------------------
--Studenti che hanno svolto almeno un esame
--TRAMITE JOIN
SELECT DISTINCT S.*
FROM S
		JOIN E ON (E.Matr = S.Matr)
--TRAMITE SUBQUERY
SELECT *
FROM S
WHERE MATR IN
		(SELECT MATR
			  FROM E)


--Per ogni docente, il nome del docente e dei corsi di cui è docente
SELECT * FROM D
SELECT * FROM C

SELECT D.CNOME, C.CNome
FROM D		
		JOIN C ON (D.CD = C.CD)

--CAMBIAMO NOME ALLE COLONNE IN USCITA
SELECT D.CNOME AS NOME_DOCENTE, C.CNome AS NOME_MATERIA
FROM D		
		JOIN C ON (D.CD = C.CD)
ORDER BY NOME_DOCENTE

--POSSIAMO RISOLVERLA TRAMITE SUBQUERY? NO
										--
SELECT * 
FROM D
WHERE CD IN (SELECT CD
				FROM C)
				--------------> SONO I DOCENTI CHE HANNO ALMENO UN CORSO

--Studenti che hanno sostenuto almeno un esame con voto >=28

SELECT S.SNome, E.Voto
FROM S 
		JOIN E ON (E.Matr = S.Matr)
		WHERE E.Voto >= 28
--OPPURE 

SELECT S.SNome, E.Voto
FROM S 
		JOIN E ON (E.Matr = S.Matr AND VOTO >=28)
		
--ORA CON SUBQUERY

SELECT *
FROM S
WHERE MATR IN
		(SELECT MATR
			  FROM E
			  WHERE VOTO >= 28)

--Studenti che hanno sostenuto almeno un esame di un corso fisica con voto >= 28
SELECT * FROM C
WHERE CNOME LIKE '%Fisica%'

SELECT S.*
FROM S	
		JOIN E ON (E.Matr = S.Matr)
		JOIN C ON (C.CC = E.CC)
		WHERE (C.CNOME LIKE '%Fisica%' AND E.Voto >= 28)

--TRAMITE SUBQUERY

SELECT *
FROM S
WHERE MATR IN
		(SELECT MATR
			  FROM E
					JOIN C ON (C.CC = E.CC)
					WHERE (C.CNOME LIKE '%Fisica%' AND E.Voto >= 28))

--TRAMITE DOPPIA SUBQUERY

SELECT *
FROM S
WHERE MATR IN ( SELECT MATR
				FROM E 
				WHERE CC IN (SELECT CC
							 FROM C
							 WHERE E.Voto >= 28 AND CNOME LIKE '%Fisica%'))

--Corsi dei docenti di modena e cn almeno un esame con voto >= 24

SELECT DISTINCT C.CNOME
FROM C
		JOIN D ON (D.CD = C.CD)
		JOIN E ON (E.CC = C.CC)
WHERE D.Citta = 'MO' AND E.Voto >= 24


------------------------------------------------------------------------

--INTERROGAZIONI "NESSUNO" SOLO ED ESCLUSIVAMENTE CON SUBQUERY (IN)

------------------------------------------------------------------------


--Studenti che non hanno sostenuto alcun esame con voto >= 28

SELECT *
FROM S
WHERE MATR NOT IN (SELECT MATR
				   FROM E
				   WHERE VOTO >= 28)

-- Corsi dei docenti di MO e con nessun esame con voto >= 24
SELECT *
FROM C
		JOIN D ON (D.CD = C.CD)
		WHERE D.Citta = 'MO' AND CC NOT IN (SELECT CC
											FROM E
											WHERE VOTO >= 24)
						  