
--
-- Popolamento tabella `Utente`
--
INSERT INTO `Utente` (`username`, `password`) VALUES
('andrea.chinello94@alice.it', '1234'),
('andrea.chinello94@gmail.com', '12345'),
('hornoiu.irina@gmail.com', 'asdfg');

--
-- Popolamento tabella `Azienda`
--
INSERT INTO `Azienda` (`idAzienda`, `nome`, `pIva`, `ragioneSociale`, `gestitaDa`) VALUES
(1, 'AsdrubaleStampi', 123456789, 'spa', 1),
(2, 'DalVecchio', 234567891, 'spa', 2);

--
-- Popolamento tabella `TipoContratto`
--
INSERT INTO `TipoContratto` (`idTipologia`, `nome`, `durataMesi`, `descrizione`) VALUES
(1, 'Lavoro a tempo determinato', 3, NULL),
(2, 'lavoro a tempo parziale', 6, NULL),
(3, 'contratto di somministrazione ', 24, NULL),
(4, 'contratto di solidarietà', 12, NULL),
(5, 'contratto di formazione di lav', 36, NULL),
(6, 'contratto di lavoro ripartito', 4, NULL),
(7, 'lavoro a tempo indeterminato', NULL, NULL),
(8, 'contratto di apprendistato', NULL, NULL),
(9, 'contratto di insegnamento', 20, NULL),
(10, 'contratto a progetto', NULL, NULL),
(11, 'contratto di lavoro intermitte', 12, NULL),
(12, 'collaborazione', NULL, NULL);

--
-- Popolamento tabella `Lavoratore`
--
INSERT INTO `Lavoratore` (`idLav`, `nome`, `cognome`, `dataDiNascita`, `codF`, `indirizzo`, `citta`, `prov`, `stato`, `mansione`, `direttore`, `rischio`, `dataAssunzione`) VALUES
(1, 'Alfredo', 'Dalcaldo', '1994-12-12', 'LFRDLC11A11B11ER', 'Via t vecellio 11', 'Nove', 'TV', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(2, 'Alsazio', 'Rogganerarolo', '1915-12-08', 'LSZRGGNRRL01A01', 'via della madonna 1/a', 'Napoli', 'NP', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(3, 'Salsazio', 'Ditemma', '1999-07-07', 'LFRDLC11A11B11ER', 'Via tiepolo 14', 'Pieve', 'TV', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(4, 'Nijo', 'Tacos', '1999-01-01', 'LSZRGGNRRL01A01', 'via dei fagioli 66', 'Scorze', 'VI', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(5, 'carlo', 'carli', '1988-09-01', 'asdfasdfasdfasdf', 't vecellio 12', 'Napoli', 'NP', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(6, 'asdrubale', 'carli', '2000-11-04', 'asdfa00000000dfa', 't vecellio 24', 'Napoli', 'NP', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(7, 'giancarlo', 'romano', '1978-10-11', 'gi11ro10no78aser', 'via del lavoro 12', 'Vicenza', 'VI', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(8, 'damiano', 'casareccio', '1955-06-05', 'da55re06cio05asd', 'via pio XX 64A', 'Magliano', 'GR', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(9, 'ruggero', 'marconzio', '1945-01-05', 'ru05ma45io01qw12', 'via quaglio 23', 'Monza', 'MZ', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(10, 'mara', 'perato', '1978-10-10', 'ma10ra10pe78to19', 'via della repubblica 43', 'Biassono', 'MI', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(11, 'roberta', 'dal conte', '1986-08-09', 'ro09da08te86ta19', 'viale vivai 13B', 'Alessandria', 'TO', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03'),
(12, 'angelino', 'boscaro', '1970-10-12', 'an12ro10bo70no19', 'via tintoretto 54', 'Brusadure', 'PD', 'IT', 'Operaio', 'No', 'Basso', '2016-01-03');

--
-- Popolamento tabella `Sede`
--
INSERT INTO `Sede` (`idSede`, `azienda`, `tipoSede`, `indirizzo`, `citta`, `prov`, `stato`, `idDirettore`) VALUES
(1, 1, 'Principale', 'via Tiepolo 955', 'Brugine', 'PD', 'IT', 1),
(2, 1, 'Secondaria', 'via Frassignoni 23', 'Legnaro', 'PD', 'IT', 4),
(3, 2, 'Principale', 'via delle industrie 14/F', 'Treviso', 'TV', 'IT', 7),
(4, 2, 'Secondaria', 'via san benedetto di assisi 666', 'Aosta', 'AO', 'IT', 10);

--
-- Popolamento tabella `Contratto`
--
INSERT INTO `Contratto` (`idSedeLav`, `idSede`, `idLav`, `idTipoC`, `dataArrivoSede`, `dataTermineSede`) VALUES
(1, 1, 2, 1, '2016-06-11', '2017-01-01'),
(2, 1, 1, 1, '2016-06-11', '2017-01-01'),
(3, 1, 3, 4, '1990-01-01', NULL),
(4, 2, 4, 6, '1990-01-01', NULL),
(5, 2, 5, 8, '1990-01-01', NULL),
(6, 2, 6, 1, '1990-05-01', NULL),
(7, 3, 8, 9, '1999-01-01', NULL),
(8, 3, 7, 1, '1999-01-01', NULL),
(9, 3, 9, 1, '1999-01-01', NULL),
(10, 4, 10, 4, '1999-01-01', NULL),
(11, 4, 11, 4, '1999-01-01', NULL),
(12, 4, 12, 4, '1999-01-01', NULL);

--
-- Popolamento tabella `Corso`
--
INSERT INTO `Corso` (`idCorso`, `nome`, `descrizione`, `sostenutoDa`, `dataInizio`, `durataOre`, `dataFine`, `validitaRischio` ) VALUES
(1, 'corso formazione sic', 'basso livello', 'Fabrizio Contiero', '2017-01-08',  48, '2017-02-08', 'Basso'),
(2, 'corso formazione sic', 'alto livello', 'Mirco Chinello', '2005-08-07', 95, '2005-11-07', 'Alto'),
(3, 'corso di informazion', 'informazione base - sistemi e sicurezza', 'Giancarlo Costa', '2000-02-05', 6, '2000-03-04', 'Basso'),
(4, 'corso primo soccorso', 'formazione su primo soccorso', 'Carlo de francheschi', '2002-02-02', 10, '2002-02-15', 'Medio');

--
-- Popolamento tabella `LavoratoreCorso`
--
INSERT INTO `LavoratoreCorso` (`idLavCorso`, `idCorso`, `idLav`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 8),
(4, 1, 9),
(5, 2, 12),
(6, 2, 7),
(7, 2, 4),
(8, 3, 1),
(9, 4, 8),
(10, 4, 4),
(11, 3, 5),
(12, 3, 9),
(13, 3, 1),
(14, 4, 1);

--
-- Popolamento tabella `VisitaMedica`
--
INSERT INTO `VisitaMedica` (`idLav`, `data`, `causaVisita`, `nomeMedico`, `risultato`, `note`) VALUES
(1, '2001-02-02', 'visita medica per malattia ', 'Gianluca Roverto', 'Visita Superata', 'tutto okay '),
(5, '2007-03-01', 'visita medica di routine', 'Nino Saldera', 'Visita Superata', 'morirà presto'),
(7, '2008-06-04', 'visita medica contrattuale', 'Ernesto Ladri', 'Visita non Superata', 'controllo per cancro ai polmoni dovuto al fumo'),
(4, '2004-01-03', 'visita medica contrattuale', 'Vladimir Bogdani', 'Visita Superata', NULL);

--
-- Popolamento tabella `Oggetto`
--
INSERT INTO `Oggetto` (`idOggetto`, `nome`, `dataAcquisto`, `sede`, `zonaCollocazione`, `controllo`) VALUES
(1, 'bancone', '2000-03-03', 3, 2, 'No'),
(2, 'lavagna', '2000-03-03', 4, 8,  'No'),
(3, 'sedia', '2000-03-03', 1, 8, 'No'),
(4, 'ascensore', '2000-03-03', 1, 49, 'Si');

--
-- Popolamento `Manutenzione`
--
INSERT INTO `Manutenzione` (`oggetto`, `data`, `dataRinnovo`, `risultato`) VALUES
(4, '2002-03-03', '2004-03-03', 'Sicuro'),
(4, '2003-03-03', '2006-03-03', 'Sicuro'),
(4, '2004-03-03', '2008-03-03', 'Sicuro'),
(4, '2006-03-03', '2008-03-03', 'Non sicuro');
