CREATE TABLE VIAGGIO (
    IDVIAGGIO INT ,
    ANNO INT ,
    DESTINAZIONE VARCHAR(255),
	PRIMARY KEY(IDVIAGGIO,ANNO)
);


CREATE TABLE CLIENTE (
    IDCLIENTE INT PRIMARY KEY,
    NAZIONE VARCHAR(255) 
);


CREATE TABLE PRENOTA (
    IDVIAGGIO INT,
    ANNO INT,
    IDCLIENTE INT,
    NUMEROPOSTI INT,
    PRIMARY KEY (IDVIAGGIO, ANNO,  IDCLIENTE),
    FOREIGN KEY (IDVIAGGIO,ANNO) REFERENCES VIAGGIO(IDVIAGGIO,ANNO),
    FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);


CREATE TABLE EFFETTUA (
    IDVIAGGIO INT,
    ANNO INT,
    IDCLIENTE INT,
    NUMEROPRESENTI INT,
    PRIMARY KEY (IDVIAGGIO, ANNO,  IDCLIENTE),
    FOREIGN KEY (IDVIAGGIO,ANNO) REFERENCES VIAGGIO(IDVIAGGIO,ANNO),
    FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

INSERT INTO CLIENTE (IDCLIENTE, NAZIONE) VALUES
(201, 'NazioneA'),
(202, 'NazioneB'),
(203, 'NazioneB'),
(204, 'NazioneC'),
(205, 'NazioneC');


INSERT INTO VIAGGIO (IDVIAGGIO, ANNO, DESTINAZIONE) VALUES
(1, 2010, 'DESTINAZIONE1'),
(2, 2010, 'DESTINAZIONE2'),
(1, 2011, 'DESTINAZIONE2'),
(2, 2011, 'DESTINAZIONE3'),
(3, 2010, 'DESTINAZIONE3');


INSERT INTO PRENOTA (IDVIAGGIO, ANNO, IDCLIENTE, NUMEROPOSTI)
VALUES
(1, 2010, 201, 3),
(1, 2010, 203, 2),
(1, 2011, 203, 2),
(1, 2011, 204, 4),
(2, 2010, 202, 4),
(2, 2010, 203, 3),
(2, 2011, 204, 3),
(2, 2011, 205, 2),
(3, 2010, 201, 3),
(3, 2010, 205, 2);


INSERT INTO EFFETTUA (IDVIAGGIO, ANNO,      IDCLIENTE,    numeropresenti) VALUES
(1, 2011,  203, 2),
(2, 2011,  204, 3),
(3, 2010,  205, 3),
(2, 2010,  204, 3),
(2, 2010,  205, 3),
(1, 2011,  205, 2),
(2, 2011,  201, 2),
(1, 2010, 202, 2),
(2, 2010,  202, 3);


--ES1
SELECT C.IDCLIENTE, C.NAZIONE
FROM CLIENTE C, PRENOTA P, VIAGGIO V
WHERE C.NAZIONE = 'NazioneC'
AND P.IDCLIENTE = C.IDCLIENTE
AND P.IDVIAGGIO = V.IDVIAGGIO
AND P.ANNO = V.ANNO
AND V.DESTINAZIONE = 'Destinazione2'

UNION

SELECT C.IDCLIENTE, C.NAZIONE
FROM CLIENTE C, EFFETTUA E, VIAGGIO V
WHERE C.NAZIONE = 'NazioneC'
AND E.IDCLIENTE = C.IDCLIENTE
AND E.IDVIAGGIO = V.IDVIAGGIO
AND E.ANNO = V.ANNO
AND V.DESTINAZIONE = 'Destinazione2';

--ES2

SELECT DISTINCT C.NAZIONE
FROM CLIENTE C
WHERE C.IDCLIENTE NOT IN (SELECT E.IDCLIENTE
						  FROM EFFETTUA E, VIAGGIO V
						  WHERE E.IDVIAGGIO = V.IDVIAGGIO
						  AND E.ANNO = V.ANNO
						  AND V.DESTINAZIONE = 'Destinazione1');


--ES3

SELECT V.IDVIAGGIO, V.DESTINAZIONE, V.ANNO
FROM VIAGGIO V
WHERE V.DESTINAZIONE = 'Destinazione3'
AND NOT EXISTS (SELECT *
			    FROM CLIENTE C
				WHERE C.NAZIONE = 'NazioneA'
				AND NOT EXISTS (SELECT *
								FROM EFFETTUA E
								WHERE E.IDCLIENTE = C.IDCLIENTE
								AND E.ANNO = V.ANNO
								AND E.IDVIAGGIO = V.IDVIAGGIO));

--ES4

SELECT V.DESTINAZIONE, COUNT(E.IDCLIENTE) 
FROM VIAGGIO V, EFFETTUA E, CLIENTE C
WHERE E.IDCLIENTE = C.IDCLIENTE
AND E.ANNO = V.ANNO
AND E.IDVIAGGIO = V.IDVIAGGIO
AND C.NAZIONE = 'NazioneB'
GROUP BY V.DESTINAZIONE
HAVING COUNT(E.NUMEROPRESENTI) >= 2;

--ES5

CREATE VIEW 
SELECT P.IDCLIENTE
FROM PRENOTA P
WHERE NOT EXISTS (SELECT *
			      FROM EFFETTUA 
				  WHERE NOT EXISTS (SELECT *
									FROM CLIENTE))

--MANCANZA DI TEMPO

--ES6





CREATE TABLE VIAGGI_PRENOTATI_ED_EFFETTUATI (
    IDVIAGGIO INT,
    ANNO INT,
    IDCLIENTE INT,
    FOREIGN KEY (IDVIAGGIO,ANNO) REFERENCES PRENOTA(IDVIAGGIO,ANNO),
    FOREIGN KEY (IDVIAGGIO,ANNO) REFERENCES EFFETTUA(IDVIAGGIO,ANNO)
);

INSERT INTO EFFETTUA (IDVIAGGIO, ANNO, IDCLIENTE ) VALUES
(1, 2011,  203),
(2, 2011,  204),
(3, 2010,  205),
(2, 2010,  204),
(2, 2010,  205),
(1, 2011,  205),
(2, 2011,  201),
(1, 2010, 202),
(2, 2010,  202);