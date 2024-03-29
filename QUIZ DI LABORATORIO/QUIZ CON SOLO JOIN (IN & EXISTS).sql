SET NOCOUNT ON
SET DATEFORMAT dmy

USE master
go

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'DB20230616')  
	DROP DATABASE DB20230616
GO

CREATE database DB20230616
GO
USE DB20230616
GO


CREATE TABLE [INSEGNAMENTO](
	[NOME_INSEGNAMENTO] [nvarchar](50) NOT NULL,
	[CDL] [int] NOT NULL,
	[DOCENTE] [nvarchar](50) NOT NULL,
	[ANNO_CORSO] [nvarchar](50) NOT NULL,
 PRIMARY KEY ([NOME_INSEGNAMENTO],	[ANNO_CORSO]) )
GO
CREATE TABLE [STUDENTE](
	[MATRICOLA] [int] NOT NULL PRIMARY KEY ,
	[NOME] [nvarchar](100) NOT NULL,
	[COGNOME] [nvarchar](100) NOT NULL,
	[NAZIONESTUDENTE] [nvarchar](200) NULL)
GO

CREATE TABLE [dbo].[APPELLO](
	[ID_APPELLO] [int] NOT NULL PRIMARY KEY,
	[SESSIONE] [nvarchar](100) NOT NULL,
	[NOME_INSEGNAMENTO] [nvarchar](50) NULL,
	[ANNO_CORSO] [nvarchar](50) NOT NULL,
	FOREIGN KEY([NOME_INSEGNAMENTO], [ANNO_CORSO]) REFERENCES [INSEGNAMENTO] 
	)
GO
CREATE TABLE [SOSTIENE](
	[MATRICOLA] [int] NOT NULL REFERENCES [STUDENTE],
	[ID_APPELLO] [int] NOT NULL REFERENCES [APPELLO],
PRIMARY KEY (	[MATRICOLA] ,[ID_APPELLO] )
)
GO

INSERT [STUDENTE] ([MATRICOLA], [NOME], [COGNOME], [NAZIONESTUDENTE]) VALUES (1, N'Anhoi', N'James', N'USA')
GO
INSERT [STUDENTE] ([MATRICOLA], [NOME], [COGNOME], [NAZIONESTUDENTE]) VALUES (2, N'Kelly', N'Clarkson', N'USA')
GO
INSERT [STUDENTE] ([MATRICOLA], [NOME], [COGNOME], [NAZIONESTUDENTE]) VALUES (3, N'Rey', N'Yong', N'Italy')
GO
INSERT [STUDENTE] ([MATRICOLA], [NOME], [COGNOME], [NAZIONESTUDENTE]) VALUES (4, N'David', N'Jonson', N'HongKong')
GO
INSERT [STUDENTE] ([MATRICOLA], [NOME], [COGNOME], [NAZIONESTUDENTE]) VALUES (5, N'Leona', N'Water', N'USA')
GO
INSERT [STUDENTE] ([MATRICOLA], [NOME], [COGNOME], [NAZIONESTUDENTE]) VALUES (6, N'Mattiew', N'Yegii', N'USA')
GO
INSERT [STUDENTE] ([MATRICOLA], [NOME], [COGNOME], [NAZIONESTUDENTE]) VALUES (7, N'Veronica', N'Rozzi', N'Italy')
GO
INSERT [STUDENTE] ([MATRICOLA], [NOME], [COGNOME], [NAZIONESTUDENTE]) VALUES (8, N'John', N'White', N'China')
GO

INSERT [INSEGNAMENTO] ([NOME_INSEGNAMENTO], [CDL], [DOCENTE], [ANNO_CORSO]) VALUES (N'ANALISI', 2020, N'Rossi', N'Primo')
GO
INSERT [INSEGNAMENTO] ([NOME_INSEGNAMENTO], [CDL], [DOCENTE], [ANNO_CORSO]) VALUES (N'ANALISI', 2021, N'Rossi', N'Secondo')
GO
INSERT [INSEGNAMENTO] ([NOME_INSEGNAMENTO], [CDL], [DOCENTE], [ANNO_CORSO]) VALUES (N'ANALISI', 2022, N'Verdi', N'Terzo')
GO
INSERT [INSEGNAMENTO] ([NOME_INSEGNAMENTO], [CDL], [DOCENTE], [ANNO_CORSO]) VALUES (N'FISICA', 2021, N'Chiari', N'Primo')
GO
INSERT [INSEGNAMENTO] ([NOME_INSEGNAMENTO], [CDL], [DOCENTE], [ANNO_CORSO]) VALUES (N'FISICA', 2022, N'Verdi', N'Terzo')
GO

INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (100, N'Estiva2010', N'ANALISI', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (101, N'Estiva2010', N'ANALISI', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (102, N'Estiva2010', N'ANALISI', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (103, N'Invernale2010', N'ANALISI', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (105, N'Invernale2011', N'ANALISI', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (110, N'Invernale2010', N'ANALISI', N'Secondo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (111, N'Invernale2011', N'ANALISI', N'Secondo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (112, N'Invernale2011', N'ANALISI', N'Secondo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (120, N'Invernale2010', N'ANALISI', N'Terzo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (121, N'Invernale2011', N'ANALISI', N'Terzo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (130, N'Invernale2010', N'FISICA', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (131, N'Invernale2009', N'FISICA', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (132, N'Speciale2010', N'FISICA', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (133, N'Speciale2011', N'FISICA', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (134, N'Speciale2010', N'FISICA', N'Primo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (140, N'Estiva2011', N'FISICA', N'Terzo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (141, N'Estiva2011', N'FISICA', N'Terzo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (142, N'Speciale2011', N'FISICA', N'Terzo')
GO
INSERT [dbo].[APPELLO] ([ID_APPELLO], [SESSIONE], [NOME_INSEGNAMENTO], [ANNO_CORSO]) VALUES (143, N'Estiva2011', N'FISICA', N'Terzo')
GO



INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (1, 100)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (1, 111)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (1, 130)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (1, 141)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (2, 100)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (2, 111)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (2, 132)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (2, 141)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (3, 101)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (3, 112)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (3, 120)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (3, 130)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (3, 131)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (3, 133)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (4, 101)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (4, 112)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (4, 120)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (4, 130)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (4, 131)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (4, 133)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (5, 102)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (5, 105)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (5, 134)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (5, 142)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (5, 143)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (6, 103)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (6, 121)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (6, 134)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (7, 132)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (7, 140)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (8, 110)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (8, 132)
GO
INSERT [SOSTIENE] ([MATRICOLA], [ID_APPELLO]) VALUES (8, 140)
GO


--ESERCIZIO 1
--Selezionare gli studenti (tutti gli attributi) che hanno sostenuto almeno un appello  di un insegnamento del 'Secondo' anno di corso

SELECT S.NOME, S.COGNOME,S.NAZIONESTUDENTE, S.MATRICOLA
FROM STUDENTE S, SOSTIENE SO, APPELLO A
WHERE S.MATRICOLA = SO.MATRICOLA
AND   SO.ID_APPELLO = A.ID_APPELLO
AND   A.ANNO_CORSO = 'Secondo';

--ESERCIZIO 2
--Selezionare gli appelli (tutti gli attributi) di un insegnamento del 'Secondo' anno di corso sostenuto da almeno uno studente con nazione 'China'

SELECT A.ID_APPELLO, SESSIONE, NOME_INSEGNAMENTO, ANNO_CORSO
FROM APPELLO A, SOSTIENE SO, STUDENTE S
WHERE ANNO_CORSO = 'Secondo'
AND   A.ID_APPELLO = SO.ID_APPELLO
AND   SO.MATRICOLA = S.MATRICOLA
AND   NAZIONESTUDENTE = 'China';

--ESERCIZIO 3
--Selezionare gli insegnamenti (tutti gli attributi) tali che almeno uno dei suoi appelli � stato sostenuto da uno studente con nazione 'China'

SELECT I.NOME_INSEGNAMENTO, I.ANNO_CORSO, CDL, DOCENTE
FROM INSEGNAMENTO I, APPELLO A, SOSTIENE SO, STUDENTE S
WHERE I.NOME_INSEGNAMENTO = A.NOME_INSEGNAMENTO
AND   I.ANNO_CORSO = A.ANNO_CORSO
AND   A.ID_APPELLO = SO.ID_APPELLO
AND   SO.MATRICOLA = S.MATRICOLA
AND   S.NAZIONESTUDENTE = 'China';

--ESERCIZIO 4
--Selezionare i DOCENTI  degli appelli della SESSIONE  'Invernale2010' in cui c'era almeno uno studente della nazione 'USA', cio�  i DOCENTI  degli insegnamenti in cui in almeno un appello della SESSIONE  'Invernale2010'  c'era almeno uno studente della nazione 'USA'

SELECT I.DOCENTE
FROM INSEGNAMENTO I, APPELLO A, SOSTIENE SO, STUDENTE S
WHERE I.NOME_INSEGNAMENTO = A.NOME_INSEGNAMENTO
AND   I.ANNO_CORSO = A.ANNO_CORSO
AND SESSIONE = 'Invernale2010'
AND   A.ID_APPELLO = SO.ID_APPELLO
AND   SO.MATRICOLA = S.MATRICOLA
AND   S.NAZIONESTUDENTE = 'USA';
