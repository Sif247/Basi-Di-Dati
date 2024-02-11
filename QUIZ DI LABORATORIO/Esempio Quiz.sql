

-- NON MODIFICARE NULLA NEL RESTO DI QUESTO FILE
-- SE NON ISTRUITO IN PROPOSITO DAL DOCENTE

SET NOCOUNT ON
SET DATEFORMAT dmy

USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'DB20230609')  
	DROP DATABASE [DB20230609]
GO

CREATE DATABASE [DB20230609]
GO

USE [DB20230609]
GO

CREATE TABLE [dbo].[Conferenza](
	[titolo] [nvarchar](50) NOT NULL,
	[Anno] [int] NOT NULL,
	[localita] [nvarchar](50) NOT NULL,
	[NazioneConferenza] [nvarchar](50) NOT NULL,
  PRIMARY KEY ([titolo],[Anno])
 )
GO 


CREATE TABLE [dbo].[Articolo](
	[idarticolo] [int] PRIMARY KEY,
	[titolo] [nvarchar](300) NOT NULL,
	[settore] [nvarchar](100) NOT NULL,
	[TitoloConferenza] [nvarchar](50) NOT NULL,
	[AnnoConferenza] [int] NOT NULL,
		FOREIGN KEY([TitoloConferenza], [AnnoConferenza]) REFERENCES [Conferenza]
)
GO


CREATE TABLE [dbo].[Autore](
	[idautore] [int] PRIMARY KEY,
	[nome] [nvarchar](100) NOT NULL,
	[cognome] [nvarchar](100) NOT NULL,
	[afferenza] [nvarchar](200) NOT NULL,
	[NazioneAutore] [nvarchar](200) NOT NULL  )
GO

 
CREATE TABLE [dbo].[Scrive](
	[idautore] [int] REFERENCES [Autore],
	[idarticolo] [int] REFERENCES [Articolo],
PRIMARY KEY (	[idautore],[idarticolo])
)
GO

INSERT [dbo].[Conferenza] ([titolo], [Anno], [localita], [NazioneConferenza]) VALUES (N'DEXA', 2021, N'Bilbao', N'Spain')
GO
INSERT [dbo].[Conferenza] ([titolo], [Anno], [localita], [NazioneConferenza]) VALUES (N'DEXA', 2022, N'Madrid', N'Spain')
GO
INSERT [dbo].[Conferenza] ([titolo], [Anno], [localita], [NazioneConferenza]) VALUES (N'ICDT', 2020, N'Long Beach', N'USA')
GO
INSERT [dbo].[Conferenza] ([titolo], [Anno], [localita], [NazioneConferenza]) VALUES (N'ICDT', 2021, N'Rome', N'Italy')
GO
INSERT [dbo].[Conferenza] ([titolo], [Anno], [localita], [NazioneConferenza]) VALUES (N'ICDT', 2022, N'Madrid', N'Spain')
GO



INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (100, N'Enabling Reusability in Information Integration', N'Information Integration', N'ICDT', 2020)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (101, N'Managing Uncertainty of Schema Matching', N'Information Integration', N'ICDT', 2020)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (102, N'Propagating Updates Through XML Views', N'Information Integration', N'ICDT', 2020)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (103, N'Improving Data Integration With Dynamic Views', N'NLP', N'ICDT', 2020)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (105, N'Describing Entities With Dynamic Visualizations', N'VIS', N'ICDT', 2020)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (110, N'Algebra for Second-Order Logic and Uncertain Databases', N'Uncertain Data', N'ICDT', 2021)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (111, N'Querying and Mining of Uncertain Databases', N'Uncertain Data', N'ICDT', 2021)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (112, N'Schema Design for Uncertain Databases', N'Uncertain Data', N'ICDT', 2021)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (120, N'Schema Design for Uncertain Databases', N'Database Integration', N'ICDT', 2022)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (121, N'Resolving Attribute Incompatibility in Database Integration', N'Database Integration', N'ICDT', 2022)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (130, N'Heuristics for Query Optimization', N'Query Optimization', N'DEXA', 2021)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (131, N'A Query-Driven Approach to Entity Resolution', N'Query Optimization', N'DEXA', 2021)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (132, N'Reachability Querying: Can It Be Even Faster?', N'Query Optimization', N'DEXA', 2021)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (133, N'Efficient Query Processing in Web Search Engines', N'Web', N'DEXA', 2021)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (134, N'Generating Query Facets Using Knowledge Bases', N'KB', N'DEXA', 2021)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (140, N'A Comprehensive Study on Query-Driven Approaches for Entity Resolution', N'Query Optimization', N'DEXA', 2022)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (141, N'XTQuery: Query Facets Using Knowledge Bases', N'KB', N'DEXA', 2022)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (142, N'The Moving K Diversified Nearest Neighbor Query', N'Query Optimization', N'DEXA', 2022)
GO
INSERT [dbo].[Articolo] ([idarticolo], [titolo], [settore], [TitoloConferenza], [AnnoConferenza]) VALUES (143, N'Crowdsourcing for Top-K Query Processing over Uncertain Data', N'Uncertain Data', N'DEXA', 2022)
GO
INSERT [dbo].[Autore] ([idautore], [nome], [cognome], [afferenza], [NazioneAutore]) VALUES (1, N'Anhoi', N'James', N'University of Maryland', N'USA')
GO
INSERT [dbo].[Autore] ([idautore], [nome], [cognome], [afferenza], [NazioneAutore]) VALUES (2, N'Kelly', N'Clarkson', N'IBM Almaden Research Center', N'USA')
GO
INSERT [dbo].[Autore] ([idautore], [nome], [cognome], [afferenza], [NazioneAutore]) VALUES (3, N'Rey', N'Yong', N'University of Reggio Calabria', N'Italy')
GO
INSERT [dbo].[Autore] ([idautore], [nome], [cognome], [afferenza], [NazioneAutore]) VALUES (4, N'David', N'Jonson', N'University of Hong Kong', N'HongKong')
GO
INSERT [dbo].[Autore] ([idautore], [nome], [cognome], [afferenza], [NazioneAutore]) VALUES (5, N'Leona', N'Water', N'University of Texas', N'USA')
GO
INSERT [dbo].[Autore] ([idautore], [nome], [cognome], [afferenza], [NazioneAutore]) VALUES (6, N'Mattiew', N'Yegii', N'University of New Orleans', N'USA')
GO
INSERT [dbo].[Autore] ([idautore], [nome], [cognome], [afferenza], [NazioneAutore]) VALUES (7, N'Veronica', N'Rozzi', N'University of Reggio Calabria', N'Italy')
GO
INSERT [dbo].[Autore] ([idautore], [nome], [cognome], [afferenza], [NazioneAutore]) VALUES (8, N'John', N'White', N'University of Pechino', N'China')
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (1, 100)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (1, 111)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (1, 130)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (1, 141)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (2, 100)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (2, 111)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (2, 132)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (2, 141)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (3, 101)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (3, 120)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (3, 131)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (3, 133)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (4, 101)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (4, 112)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (4, 120)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (4, 130)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (4, 131)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (4, 133)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (5, 102)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (5, 105)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (5, 134)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (5, 142)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (5, 143)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (6, 103)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (6, 121)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (6, 134)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (7, 132)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (7, 140)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (8, 110)
GO
INSERT [dbo].[Scrive] ([idautore], [idarticolo]) VALUES (8, 140)
GO



--ESERCIZIO 1
--Selezionare gli autori della nazione 'USA' che hanno scritto  almeno un articolo  per una conferenza tenutasi in 'Italy'

SELECT A.nome,	A.cognome, A.NazioneAutore
FROM Autore A, Scrive S, Articolo Ar, Conferenza C
WHERE A.idautore = S.idautore 
AND	  S.idarticolo = AR.idarticolo
AND   AR.TitoloConferenza = C.titolo
AND   AR.AnnoConferenza = C.Anno
AND   NazioneConferenza = 'Italy'
AND   A.NazioneAutore = 'USA';


--ESERCIZIO 2
--Selezionare gli autori della nazione 'Italy' che hanno scritto almeno un articolo per una conferenza tenutasi in 'USA'

SELECT A.nome,	A.cognome, A.NazioneAutore
FROM Autore A, Scrive S, Articolo Ar, Conferenza C
WHERE A.idautore = S.idautore 
AND	  S.idarticolo = AR.idarticolo
AND   AR.TitoloConferenza = C.titolo
AND   AR.AnnoConferenza = C.Anno
AND   NazioneConferenza = 'USA'
AND   A.NazioneAutore = 'Italy';


--ESERCIZIO 3
--Selezionare le conferenze del 2022 in cui c'era almeno un articolo scritto da un autore della nazione 'Italy'

SELECT C.titolo, C.Anno, C.NazioneConferenza
FROM Conferenza C, Articolo AR, Scrive S, Autore A
WHERE C.Anno = 2022
AND   AR.AnnoConferenza = C.Anno
AND   AR.TitoloConferenza = C.titolo
AND   AR.idarticolo = S.idarticolo
AND   S.idautore = A.idautore
AND   A.NazioneAutore = 'Italy';


--ESERCIZIO 4
--Selezionare le conferenze con nazione 'USA' in cui c'era almeno un articolo scritto da un autore della nazione 'Italy'

SELECT C.titolo, C.Anno, C.NazioneConferenza
FROM Conferenza C, Articolo AR, Scrive S, Autore A
WHERE C.NazioneConferenza = 'USA'
AND   AR.AnnoConferenza = C.Anno
AND   AR.TitoloConferenza = C.titolo
AND   AR.idarticolo = S.idarticolo
AND   S.idautore = A.idautore
AND   A.NazioneAutore = 'Italy';