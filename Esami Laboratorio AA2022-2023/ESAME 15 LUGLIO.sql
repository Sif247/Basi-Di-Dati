-- NON MODIFICARE NULLA NEL RESTO DI QUESTO FILE
-- SE NON ISTRUITO IN PROPOSITO DAL DOCENTE

SET NOCOUNT ON
SET DATEFORMAT dmy

USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'DB20210715')  
	DROP DATABASE [DB20210715]
GO

CREATE DATABASE [DB20210715]
GO

USE [DB20210715]
GO


CREATE TABLE Persona (
id INT PRIMARY KEY,
nome VARCHAR(150),
tipo char(20), --'richiedente', 'intermediario'
);

insert INTO Persona VALUES 
(1,'EUGENIO ROSSI','richiedente'),
(2,'LUCA VERTACCHI', 'richiedente'),
(3,'SARA BIGI','intermediario'),
(4,'UNION-PRESTITI', 'intermediario'),
(5,'ENRICO VACONDIO','richiedente'),
(6,'ROBERTA LOIACONO', 'richiedente'),
(7,'GUSTAVO SERPANI', 'richiedente'),
(8,'MATILDE SARGENI', 'intermediario'),
(9,'ELIDE INCERTI','richiedente'),
(10,'ELENA DRENTINI', 'intermediario'),
(11,'SILVIA COSCA', 'richiedente'),
(12,'LUCIO GIUSTI','richiedente'),
(13,'TARQUINIO NERI','richiedente'),
(14,'LORETTA FINZI','intermediario');


CREATE TABLE Mutuo (
richiedente1 INT REFERENCES Persona(id) NOT NULL,
richiedente2 INT REFERENCES Persona(id) NULL,
dataRichiesta DATE NOT NULL,
somma MONEY NOT NULL,
descrizione TEXT,
stato INT, --0=Richiesta in corso, 1= Finanziamento attivato, 2=Finanziamento negato
dataInizioMutuo DATE,
dataFineMutuo DATE,
interessePercentuale FLOAT, -- valore tra 0,01 e 1
intermediario INT REFERENCES Persona(id) NULL,
PRIMARY KEY (richiedente1,dataRichiesta)
);

INSERT INTO Mutuo VALUES
(1, null, '10/07/2021',  25000, 'ristrutturazione abitazione in affitto',
0,null,null,0.05,null),
(1,2, '12/05/2019', 150000, 'acquisto terreno',
1,'01/08/2019','01/08/2029',0.08,4),
(1,2, '01/02/2020', 150000, 'costruzione casa',
1,'01/04/2020','01/08/2029',0.08,4),
(1,null,'12/05/2020', 100000, 'acquisto magazzino',
2,null,null,null,4),
(1,2,'1/02/2021', 100000, 'acquisto magazzino',
2,null,null,null,4),
(5,6,'03/07/2019', 300000, 'acquisto prima casa',
2,null,null,null,4),
(5,6,'12/10/2019', 200000, 'acquisto prima casa',
1,'03/12/2019','03/03/2039',0.10,3),
(5,6,'12/11/2019', 20000, 'acquisto mobili',
1,'03/01/2020','03/03/2039',0.10,3),
(9,null,'01/10/2020', 50000, 'ristrutturazione prima casa',
2,null,null,null,3),
(9,11,'01/05/2021', 50000, 'ristrutturazione prima casa',
1,'01/08/2021','01/08/2022',0.09,3),
(7,null,'01/01/2021', 500000, 'acquisto prima casa',
2,null,null,null,3),
(7,null,'01/05/2021', 300000, 'acquisto prima casa',
0,null,null,null,3),
(7,null,'08/05/2021',  35000, 'acquisto mobili',
1,'01/07/2021','01/07/2026',0.08,3),

(12,null,'08/05/2019',  3000, 'acquisto mobili',
1,'01/07/2019','01/07/2026',0.08,3);




CREATE TABLE PagamentoRata (
richiedente1 INT,
dataRichiesta DATE,
dataPagamento DATE,
sommapagata MONEY,
FOREIGN KEY (richiedente1,dataRichiesta) REFERENCES Mutuo(richiedente1,dataRichiesta),
PRIMARY KEY (richiedente1,dataRichiesta,dataPagamento)
);



INSERT INTO PagamentoRata VALUES

(1,'12/05/2019','01/09/2019',1000),
(1,'12/05/2019','01/10/2019',1000),
(1,'12/05/2019','01/11/2019',1000),
(1,'12/05/2019','01/12/2019',1000),
(1,'12/05/2019','01/01/2020',1000),
(1,'12/05/2019','01/02/2020',1000);


INSERT INTO PagamentoRata VALUES
(1,'12/05/2019','01/03/2020',1000),
(1,'12/05/2019','01/04/2020',1000),
(1,'12/05/2019','01/05/2020',1000),
(1,'12/05/2019','01/06/2020',1000),
(1,'12/05/2019','01/07/2020',1000),
(1,'12/05/2019','01/08/2020',1000),
(1,'12/05/2019','01/09/2020',1000),
(1,'12/05/2019','01/10/2020',1000),
(1,'12/05/2019','01/11/2020',1000),
(1,'12/05/2019','01/12/2020',1000),
(1,'12/05/2019','01/01/2021',1000),
(1,'12/05/2019','01/02/2021',1000),
(1,'12/05/2019','01/03/2021',1000),
(1,'12/05/2019','01/04/2021',1000),
(1,'12/05/2019','01/05/2021',1000),
(1,'12/05/2019','01/06/2021',1000),
(1,'12/05/2019','01/07/2021',1000),

(1,'01/02/2020','01/06/2020',500),
(1,'01/02/2020','01/09/2020',500),
(1,'01/02/2020','01/12/2020',500),
(1,'01/02/2020','01/03/2021',500),
(1,'01/02/2020','01/06/2021',500),


(5,'12/10/2019','01/01/2020',500),
(5,'12/10/2019','01/02/2020',500),
(5,'12/10/2019','01/03/2020',500),
(5,'12/10/2019','01/04/2020',500),
(5,'12/10/2019','01/05/2020',500),
(5,'12/10/2019','01/06/2020',500),
(5,'12/10/2019','01/07/2020',500),




(12,'08/05/2019','01/08/2019',810),
(12,'08/05/2019','01/09/2019',810),
(12,'08/05/2019','01/10/2019',810),
(12,'08/05/2019','01/12/2019',810);


--ESERCIZIO 1

SELECT M.richiedente1, M.richiedente2, M.dataInizioMutuo, M.dataFineMutuo, M.dataRichiesta, M.descrizione, M.interessePercentuale, M.intermediario, M.somma
FROM Mutuo M, Persona PR
WHERE M.richiedente1= PR.id
AND PR.nome = 'ENRICO VACONDIO'
AND M.stato = 1;


--ESERCIZIO 2

SELECT M.richiedente1, M.dataRichiesta, M.somma, SUM(P.sommapagata) AS PAGATO
FROM Mutuo M, PagamentoRata P
WHERE  P.richiedente1 = M.richiedente1
AND P.dataRichiesta = M.dataRichiesta
GROUP BY M.richiedente1, M.dataRichiesta, M.somma

--ESERCIZIO 3

SELECT PR.id, PR.nome, (SELECT COUNT(M1.intermediario)
						FROM Mutuo M1
						WHERE M1.intermediario = PR.id
						AND M1.stato = 2) AS M_NEGATI
FROM PERSONA PR
WHERE PR.tipo = 'intermediario'
GROUP BY PR.id, PR.nome
ORDER BY M_NEGATI DESC

--OPPURE

SELECT PR.id, PR.nome, COUNT(M.intermediario) AS M_NEGATI
FROM PERSONA PR, MUTUO M
WHERE PR.id = M.intermediario
AND M.stato = 2
GROUP BY PR.id, PR.nome
ORDER BY M_NEGATI DESC

--ESERCIZIO 4

SELECT PR.id, PR.nome
FROM PERSONA PR
WHERE PR.tipo = 'richiedente'
AND PR.id NOT IN (SELECT PR2.id
					FROM Persona PR2, MUTUO M
					WHERE PR2.id = M.richiedente2
					AND M.stato = 1)


--ESERCIZIO 5

SELECT M.richiedente1, M.dataRichiesta, M.somma
FROM MUTUO M, PagamentoRata P
WHERE P.richiedente1 = M.richiedente1 
AND M.dataRichiesta = P.dataRichiesta
AND M.stato = 1
AND YEAR(M.dataInizioMutuo) = 2020
GROUP BY M.richiedente1, M.dataRichiesta, M.somma
HAVING DATEDIFF(m,max(dataPagamento),getdate()) > 6

