
/*		COMANDI DATA MANIPULATION LANGUAGE
INSERT -> inserimento dati in una tabella
UPDATE -> aggiornare i dati di una tabella
DELETE -> cancellazione dati di una tabella
SELECT -> selezionare (recuperare) dati da una tabella
*/

/*		DEFAULT
utilizzato per le condizione predifinite:
CREATE TABLE nome_tabella (---Nomecolonna datatype DEFAULT valore_default...)
*/

/*
CREATE TABLE TEST(
LUOGO VARCHAR(40) DEFAULT 'Roma',
NUMERO INT DEFAULT 0,
NOME VARCHAR(40) DEFAULT NULL
)

insert into test values (DEFAULT, DEFAULT, DEFAULT);
insert into test values('Modena', 3, DEFAULT);
*/


/*ESERCIZIO
CREARE TABELLA PERSONA CHE CONTENGA NOME, COGNOME, DATA DI NASCITA,
CITTA' DI RESIDENZA,NUMERO DI LAUREE POSSEDUTE,
LA CHIAVE PRIMARIA DELLA TABELLA E' LA COPPIA NOME E COGNOME, 
INOLTRE LA CITTA DI RESIDENZA HA VALORE DI DEFAULT CHE � MODENA.

INSERIRE PER LA COLONNA NUMLAUREEE IL VALORE DI DEFAULT 0
*/
/*RISOLUZIONE ESERCIZIO
CREATE TABLE persona(
NOME VARCHAR(20),
COGNOME VARCHAR(20),
DATANASCITA DATE,
CITTA VARCHAR(50) DEFAULT 'Modena',
NUMLAUREE INT,
CONSTRAINT PK_PERSONA  PRIMARY KEY(NOME, COGNOME)
)

ALTER TABLE PERSONA
ADD CONSTRAINT def_NUMLAUREE DEFAULT 0 FOR NUMLAUREE


SET DATEFORMAT dmy

INSERT INTO PERSONA VALUES ('Mario','Rossi','25/01/1990','Reggio Emilia', 1);
INSERT INTO PERSONA VALUES ('Carlo','Esposito','05/03/1990',DEFAULT, NULL);
INSERT INTO PERSONA VALUES ('Giuseppe','Esposito','05/03/1990',DEFAULT, DEFAULT);
INSERT INTO PERSONA (NOME, COGNOME, NUMLAUREE) VALUES ('Giuseppe', 'Romano', NULL)
INSERT INTO PERSONA(NUMLAUREE) VALUES (DEFAULT);--> ERRORE(LE CHIAVI NON POSSONO ESSERE NULL)
INSERT INTO PERSONA (NOME, COGNOME) VALUES
('Paolo','Bianchi'),
('Marco','Neri'),
('Michele','Verdi');
*/
/*		UPDATE
serve per aggiornare i dati
sintassi:
	UPDATE nome_tabella
	SET nome_tabella = valore_attributo (SET permette di dare un nuovo valore all'atributo attributo )
	[WHERE condizione_di_selezione] (WHERE permette di identificare(tramite una condizione logica) le tuple che interessano la modifica)
*/
/* cambio nome e data di nascita di michele verdi

UPDATE PERSONA

SET NOME = 'Michelino', DATANASCITA = '21/01/2010'
WHERE NOME = 'Michele' AND COGNOME = 'Verdi';
*/
/*cambio cognome di carlo
UPDATE PERSONA
SET COGNOME = 'Neri'
WHERE NOME = 'Carlo';
*/
/* ------------------> ERRORE PERCHE' ESISTONO 2 GIUSEPPE
UPDATE PERSONA
SET COGNOME = 'Ferrari'
WHERE NOME = 'Giuseppe';
*/
/* OPERAZIONI CON GLI INT FUNZIONANO TUTTI(I VALORI NULL CON CAMBIANO CON LE OPERAZIONI MA SOLO CON LE SOSTITUZIONI)
UPDATE PERSONA 
SET NUMLAUREE = NUMLAUREE + 1;
*/
/*		DELETE
il comando DELETE permette di cancellare una o piu tuple dalla tabella

Sintassi: 
	DELETE FROM nome_tabella
	[WHERE condizione_logica] (identifica le tuple da cancellare)
							  (se WHERE non viene identificato viene eliminato tutto il contenuto della tabella)

*/
/* eliminato le persone con cognome Neri o Bianchi
DELETE FROM PERSONA
WHERE COGNOME = 'Neri'
OR COGNOME = 'Bianchi';
*/

--DELETE FROM PERSONA;--> ELIMINATO TUTTI I RECORD DELLA TABELLA

/*ESEMPIO 

-- CONSIDERIAMO UNA VERSIONE SEMPLIFICATA DEL DB DEL LIBRO 

� classica associazione binaria molti a molti esame(E)tra DOCENTE(D) E STUDENTE(S) 


CREATE TABLE D( 

    CD CHAR(2) PRIMARY KEY, 

    CNOME VARCHAR(20) NOT NULL, 

    CITTA CHAR(2) NULL) 

 

CREATE TABLE S( 

   MATR CHAR(2) PRIMARY KEY, 

   SNOME VARCHAR(20) NOT NULL, 

   CITTA CHAR(2) NULL, 

   ACORSO INT NOT NULL) 

 

CREATE TABLE E( 

    MATR CHAR(2), 

    CC CHAR(2), 

    CD CHAR(2), 

PRIMARY KEY (MATR,CC) )
 

--- DEFINIAMO I DUE VINCOLI DI INTEGRIT� REFERENZIALE 

ALTER TABLE E  

ADD CONSTRAINT E_S_FK FOREIGN KEY (MATR) REFERENCES S 

 

ALTER TABLE E  

ADD CONSTRAINT E_C_FK FOREIGN KEY (CD) REFERENCES D 


 --INSERIMENTO DEI DOCENTI 

INSERT INTO D (CD,CNOME,CITTA) VALUES ('D1','PAOLO ROSSI','MO') 

INSERT INTO D (CD,CNOME,CITTA) VALUES ('D2','MARIA PASTORE','BO') 

 

--INSERIMENTO DEGLI STUDENTI 

INSERT INTO S (MATR,SNOME,CITTA,ACORSO) VALUES ('M1','LUCIA QUARANTA','SA',1) 

INSERT INTO S (MATR,SNOME,CITTA,ACORSO) VALUES ('M2','GIACOMO TEDESCO','PA',2) 

 

--INSERIMENTO DEGLI ESAMI 

DELETE FROM E 

INSERT INTO E  VALUES ('M1','C1','D1') 

INSERT INTO E(MATR,CC)  VALUES ('M1','C2')  -- NON SI INSERISCE IL DOCENTE 

INSERT INTO E  VALUES ('M2','C1','D2') 


--- DEFINIZIONE DI UN VALORE DI DEFAULT PER UN DOCENTE 

 

ALTER TABLE E 

ADD CONSTRAINT SETDEFAULT_CD DEFAULT 'NN' FOR CD; 



--INSERIMENTO DEGLI ESAMI 

DELETE FROM E 

INSERT INTO E  VALUES ('M1','C1','D1') 

INSERT INTO E(MATR,CC)  VALUES ('M1','C2')  -- NON SI INSERISCE IL DOCENTE 

INSERT INTO E  VALUES ('M2','C1','D2') 


-- ALLORA � NECESSARIO INSERIRE IL VALORE DI DEFAULT NELLA 

-- TABELLA REFERENZIATA 

INSERT INTO D (CD,CNOME,CITTA) VALUES ('NN','NN','NN') 

 

--INSERIMENTO DEGLI ESAMI 

DELETE FROM E 

INSERT INTO E  VALUES ('M1','C1','D1') 

INSERT INTO E(MATR,CC)  VALUES ('M1','C2')  -- NON SI INSERISCE IL DOCENTE 

INSERT INTO E  VALUES ('M2','C1','D2') 


--- proviamo l'integrit� referenziale 

 

DELETE FROM D WHERE CD='D2' 

--- NON POSSO CANCELLARE D2 PERCH� C'� L'INTEGRIT� REFERENZIALE!! 

 

-- ALLORA DEFINISCO IL FOREIGN KEY CONSTRAINT TRAMITE OPZIONE 

-- ON DELETE CASCADE 

 

-- CANCELLO IL PRECEDENTE CONSTRAINT 

ALTER TABLE E  DROP  CONSTRAINT E_C_FK  

-- E LO RIDEFINISCO CON ON DELETE CASCADE 

ALTER TABLE E  

ADD CONSTRAINT E_C_FK  

FOREIGN KEY (CD) REFERENCES D  

ON DELETE CASCADE 

 

-- VEDIAMONE IL FUNZIONAMENTO 

DELETE FROM D WHERE CD='D2' 


-- PROVIAMO SET DEFAULT 

 

-- METTO DI NUOVO DENTRO IL DOCENTE D2 

INSERT INTO D (CD,CNOME,CITTA) VALUES ('D2','MARIA PASTORE','BO') 

 

 

ALTER TABLE E  DROP  CONSTRAINT E_C_FK  

 

ALTER TABLE E  ADD CONSTRAINT E_C_FK FOREIGN KEY (CD) REFERENCES D  
ON DELETE SET DEFAULT 

 

--INSERIMENTO DEGLI ESAMI 

DELETE FROM E 

INSERT INTO E  VALUES ('M1','C1','D1') 

INSERT INTO E(MATR,CC)  VALUES ('M1','C2')  -- NON SI INSERISCE IL DOCENTE 

INSERT INTO E  VALUES ('M2','C1','D2') 

 

DELETE FROM D 

WHERE CD='D2' 

--- USIAMO INFINE SET NULL 

ALTER TABLE E  

DROP  CONSTRAINT E_C_FK  

 

ALTER TABLE E  

ADD CONSTRAINT E_C_FK FOREIGN KEY (CD) REFERENCES D  
ON DELETE SET NULL 

 

 

INSERT INTO D (CD,CNOME,CITTA) VALUES ('D2','MARIA PASTORE','BO') 

 

DELETE FROM E 

INSERT INTO E  VALUES ('M1','C1','D1') 

INSERT INTO E(MATR,CC)  VALUES ('M1','C2') 

INSERT INTO E  VALUES ('M2','C1','D2') 



DELETE FROM D 

WHERE CD='D2' 

*/

----> MANCANO LA FOREIGN KEY DA ESAME E A STUDENTE S E MOSTRIAMO COME DUE VINCOLI FK AGISCONO IN CASCATA 


SELECT * FROM D;

SELECT * FROM S;

SELECT * FROM E;