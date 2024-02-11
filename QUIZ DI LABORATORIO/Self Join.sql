

--Negozio(Negozio,Citta)
--Vendita(Negozio,Cliente,Prodotto)
 -- FK: Negozio REFERENCES Negozio

--Creare manualmente un nuovo database e far girare il seguente script

CREATE TABLE Negozio (
    Negozio VARCHAR(22) PRIMARY KEY,
    Citta VARCHAR(22)
);

CREATE TABLE Vendita (
    Negozio VARCHAR(22),
    Cliente VARCHAR(22),
    Prodotto VARCHAR(22),
    PRIMARY KEY (Negozio, Cliente, Prodotto),
    FOREIGN KEY (Negozio) REFERENCES Negozio(Negozio) ON DELETE CASCADE
);

INSERT INTO Negozio (Negozio, Citta) VALUES ('N_A_MO', 'Modena');
INSERT INTO Negozio (Negozio, Citta) VALUES ('N_A_RE', 'Reggio');
INSERT INTO Negozio (Negozio, Citta) VALUES ('N_B_MO', 'Modena');
INSERT INTO Negozio (Negozio, Citta) VALUES ('N_C_MO', 'Modena');

INSERT INTO Vendita (Negozio, Cliente, Prodotto) VALUES ('N_B_MO', 'ClienteA', 'ProdottoA');
INSERT INTO Vendita (Negozio, Cliente, Prodotto) VALUES ('N_B_MO', 'ClienteB', 'ProdottoA');
INSERT INTO Vendita (Negozio, Cliente, Prodotto) VALUES ('N_C_MO', 'ClienteC', 'ProdottoB');
INSERT INTO Vendita (Negozio, Cliente, Prodotto) VALUES ('N_C_MO', 'ClienteD', 'ProdottoA');
INSERT INTO Vendita (Negozio, Cliente, Prodotto) VALUES ('N_A_MO', 'ClienteB', 'ProdottoA');
INSERT INTO Vendita (Negozio, Cliente, Prodotto) VALUES ('N_A_RE', 'ClienteB', 'ProdottoB');
INSERT INTO Vendita (Negozio, Cliente, Prodotto) VALUES ('N_C_MO', 'ClienteB', 'ProdottoB');


--ESERCIZIO 1
--Selezionare le Coppie di Clienti , Cliente1 e Cliente2, che hanno acquistato almeno una volta  lo stesso Prodotto in negozi della  Stessa Citta (quindi il negozio non deve essere necessariamente lo stesso negozio, devono essere negozi della stessa città)

SELECT DISTINCT V1.Cliente, V2.Cliente
FROM Vendita V1, Vendita V2, Negozio N1, Negozio N2
WHERE V1.Prodotto = V2.Prodotto
AND V1.Negozio = N1.Negozio
AND V2.Negozio = N2.Negozio
AND N1.Citta = N2.Citta
AND V1.Cliente < V2.Cliente;

--ESERCIZIO 2
--Selezionare le Coppie di Clienti , Cliente1 e Cliente2, che hanno acquistato almeno una volta  in negozi della stessa Citta   (quindi non interessano i prodotti acquistati e i Negozi dove è stato effettuato l'acquisto, ma solo il fatto che tali negozi siano nella stessa Città)
/*
Cliente1    Cliente2
ClienteA    ClienteB
ClienteB    ClienteC
ClienteB    ClienteD
ClienteC    ClienteD
*/

SELECT DISTINCT V1.Cliente, V2.Cliente
FROM Vendita V1, Vendita V2, Negozio N1, Negozio N2
WHERE V1.Negozio = N1.Negozio
AND V2.Negozio = N2.Negozio
AND N1.Citta = N2.Citta
AND V1.Cliente < V2.Cliente;


--ESERCIZIO 3
--Selezionare le Coppie di Clienti , Cliente1 e Cliente2, che hanno acquistato almeno una volta  nello stesso Negozio  (quindi non interessano i prodotti acquistati, ma solo il fatto che l'acquisto sia stato fatto dai due clienti nello stesso  negozio)
/*
Cliente1    Cliente2
ClienteA    ClienteB
ClienteB    ClienteC
ClienteB    ClienteD
ClienteC    ClienteD
*/


SELECT DISTINCT V1.Cliente, V2.Cliente
FROM Vendita V1, Vendita V2, Negozio N1, Negozio N2
WHERE V1.Negozio = N1.Negozio
AND V2.Negozio = N2.Negozio
AND N1.NEGOZIO = N2.NEGOZIO
AND V1.Cliente < V2.Cliente;


--ESERCIZIO 4
--Selezionare le Coppie di Clienti che hanno acquistato - almeno una volta -  lo stesso Prodotto  nello stesso Negozio
/*
Cliente1    Cliente2
ClienteA    ClienteB
ClienteB    ClienteC
ClienteB    ClienteD
ClienteC    ClienteD
*/

SELECT DISTINCT V1.Cliente, V2.Cliente
FROM Vendita V1, Vendita V2, Negozio N1, Negozio N2
WHERE V1.Prodotto = V2.Prodotto
AND V1.Negozio = N1.Negozio
AND V2.Negozio = N2.Negozio
AND N1.Negozio = N2.Negozio
AND V1.Cliente < V2.Cliente;

--ESERCIZIO 5
--Selezionare le Coppie di Negozi , Negozio1 e Negozio2, che  hanno venduto, almeno una volta, allo stesso Cliente   (quindi  uno stesso cliente ha acquistato almeno una volta  sia in Negozio1 e almeno una volta in Negozio2)  
/*
Negozio1    Negozio2
N_A_MO    N_A_RE
N_A_MO    N_B_MO
N_A_MO    N_C_MO
N_A_RE    N_B_MO
N_A_RE    N_C_MO
N_B_MO    N_C_MO
*/

SELECT N1.Negozio, N2.Negozio
FROM Negozio N1, Negozio N2, Vendita V1, Vendita V2
WHERE N1.Negozio = V1.Negozio
AND N2.Negozio = V2.Negozio
AND V1.Cliente = V2.Cliente
AND N1.Negozio < N2.Negozio;


--ESERCIZIO 5
--Selezionare le Coppie di Negozi , Negozio1 e Negozio2,
--che sono  nella Stessa Citta e hanno venduto almeno un prodotto allo Stesso Cliente (quindi non è necessario che sia lo stesso Prodotto, ma solo che uno stesso cliente abbia acquistato almeno una volta sia in Negozio1 e almeno una volta in Negozio2, e che tali negozi siano della stessa città) 
/*
Negozio1    Negozio2
N_A_MO    N_B_MO
N_A_MO    N_C_MO
N_B_MO    N_C_MO
*/

SELECT N1.Negozio, N2.Negozio
FROM Negozio N1, Negozio N2, Vendita V1, Vendita V2
WHERE N1.Citta = N2.Citta
AND N1.Negozio = V1.Negozio
AND N2.Negozio = V2.Negozio
AND V1.Cliente = V2.Cliente
AND N1.Negozio < N2.Negozio; 


--ESERCIZIO 6
--Selezionare le Coppie di Negozi , Negozio1 e Negozio2, che  hanno venduto, almeno una volta, allo stesso cliente lo stesso Prodotto  (quindi  uno stesso cliente ha acquistato almeno una volta  lo stesso Prodotto sia in Negozio1 che in Negozio2)  
/*
Negozio1    Negozio2
N_A_MO    N_B_MO
N_A_RE    N_C_MO
*/


SELECT N1.Negozio, N2.Negozio
FROM Negozio N1, Negozio N2, Vendita V1, Vendita V2
WHERE N1.Negozio = V1.Negozio
AND N2.Negozio = V2.Negozio
AND V1.Cliente = V2.Cliente
AND V1.Prodotto = V2.Prodotto
AND N1.Negozio < N2.Negozio; 


--ESERCIZIO 7
--Selezionare le Coppie di Negozi , Negozio1 e Negozio2, che  sono della stessa Citta e hanno venduto, almeno una volta, allo stesso cliente lo stesso Prodotto 
/*
Negozio1    Negozio2
N_A_MO    N_B_MO
*/

SELECT N1.Negozio, N2.Negozio
FROM Negozio N1, Negozio N2, Vendita V1, Vendita V2
WHERE N1.Citta = N2.Citta
AND N1.Negozio = V1.Negozio
AND N2.Negozio = V2.Negozio
AND V1.Cliente = V2.Cliente
AND V1.Prodotto = V2.Prodotto
AND N1.Negozio < N2.Negozio; 
