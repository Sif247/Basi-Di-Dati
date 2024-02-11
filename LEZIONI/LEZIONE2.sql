--CHECK, UNIQUE

/*IL CHECK SERVE PER RIPORTARE DEI RIFERIMENTI SU ATTRIBUTI DELLE TABELLE
MENTRE IL UNIQUE RENDE UNICI DEGLI ATTRIBUTI IN MODO TALE CHE DIVENTINO DELLE FOREIGN KEY*/
/*
create table persona(
	CF varchar(20) PRIMARY KEY,
	nome varchar (50),
	cognome varchar(50),
);
*/
-- inseriamo le insert
--insert into persona values ('a','b', 'c')
--insert into persona values ('a','b1', 'c')


--*chaive primaria con la coppia di attributi
/*
DROP TABLE persona;

create table persona(
	CF varchar(20),
	nome varchar (50),
	cognome varchar(50),
	PRIMARY KEY(nome, cognome)
);
*/

-- inseriamo le insert
--insert into persona values ('a','b', 'c')
--insert into persona values ('a','b1', 'c')

--DROP TABLE persona;
/*
create table comune(
	comune varchar(50) PRIMARY KEY,
	provincia varchar(50)
	);

create table persona(
	CF varchar(20) PRIMARY KEY,
	nome varchar (50),
	cognome varchar(50),
	comune_di_residenza varchar(50) REFERENCES comune(comune)
);

insert into comune values ('Sasso di castalda', 'PZ');
insert into persona values ('benevent..02','domenico','beneventano', 'Sasso di castalda');
insert into persona values ('non moll02','domenico','beneventano', NULL);
*/

--NOT NULLL COME VINCOLO DI COLONNA
--DROP TABLE persona;
/*
create table persona(
	CF VARCHAR(50) PRIMARY KEY, 
	nome varchar(50),
	cognome varchar(50),
	CHECK (nome IS NOT NULL),
	CHECK(cognome IS NOT NULL)
);
OPPURE:
create table persona(
	CF VARCHAR(50) PRIMARY KEY, 
	nome varchar(50),
	cognome varchar(50),
	CHECK (nome IS NOT NULL, cognome IS NOT NULL)
);



--UNIQUE

DROP TABLE persona;

create table persona(
	CF VARCHAR(50) PRIMARY KEY, 
	nome varchar(50),
	cognome varchar(50),
	eta int check(eta >0 and eta < 120)
	UNIQUE (nome, cognome)
);



INSERT INTO persona values('ismds02','ismail','sifdine');
INSERT INTO persona values('fthall04','yasmine','sifdine');
INSERT INTO persona values('snmmmsy02','ismail','sifdine');
INSERT INTO persona values('fath04',NULL,NULL);

-- CONDIZIONI
DROP TABLE persona;

create table persona(
	CF VARCHAR(50) PRIMARY KEY, 
	nome varchar(50),
	cognome varchar(50),
	eta int check(eta >0 and eta < 120)
);

INSERT INTO persona values('ismds02','ismail','sifdine', 100);
*/
/*
   ESERCIZIO
Considerare la tabella:

CREATE TABLE RubricaTelefonica(
nome varchar(50),
cognome varchar(50),
NumeroTelefono varchar(12) )

Definire i vincoli di chiave e discutere il significato dei seguenti 5 casi, anche tramite 
inserimento di valori nelle tabelle
1) Nessuna chiave
2) Chiave primaria (nome, cognome, NumeroTelefono)
3) Chiave primaria (nome, cognome)
4) Chiave primaria (NumeroTelefono)
5) Chiave primaria (nome, cognome) e chiave alternativa NumeroTelefono
*/
--   RISOLUZIONE
/*
1)CREATE TABLE RubricaTelefonica(
nome varchar(50),
cognome varchar(50),
NumeroTelefono varchar(12) )

2)CREATE TABLE RubricaTelefonica(
	nome varchar(50),
	cognome varchar(50),
	NumeroTelefono varchar(12)
	PRIMARY KEY(nome, cognome, NumeroTelefono)
	);

3)CREATE TABLE RubricaTelefonica(
	nome varchar(50),
	cognome varchar(50),
	NumeroTelefono varchar(12)
	PRIMARY KEY(nome, cognome)
	);

4)CREATE TABLE RubricaTelefonica(
	nome varchar(50),
	cognome varchar(50),
	NumeroTelefono varchar(12)  PRIMARY KEY
	);

5) CREATE TABLE RubricaTelefonica(
	nome varchar(50),
	cognome varchar(50),
	NumeroTelefono varchar(12) UNIQUE,
	PRIMARY KEY(nome, cognome) 
	);



SELECT * FROM RubricaTelefonica;
*/
