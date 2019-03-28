--
-- Creazione tabella `Utente`
--
DROP TABLE IF EXISTS `Utente`;
CREATE TABLE `Utente` (
  idUtente int(5) AUTO_INCREMENT PRIMARY KEY,
  username varchar(30) NOT NULL,
  password varchar(12) NOT NULL
) ENGINE=InnoDB;

--
-- Creazione tabella `Azienda`
--
DROP TABLE IF EXISTS `Azienda`;
CREATE TABLE `Azienda` (
  idAzienda int(11) AUTO_INCREMENT PRIMARY KEY,
  nome varchar(15) NOT NULL,
  pIva int(20) NOT NULL,
  ragioneSociale text NOT NULL,
  gestitaDa int(11) NOT NULL,
  UNIQUE (pIva),
  FOREIGN KEY (gestitaDa) REFERENCES Utente(idUtente)
                ON DELETE NO ACTION
) ENGINE=InnoDB;

--
-- Creazione tabella `TipoContratto`
--
DROP TABLE IF EXISTS `TipoContratto`;
CREATE TABLE `TipoContratto` (
  idTipologia int(11) AUTO_INCREMENT PRIMARY KEY,
  nome varchar(30) NOT NULL,
  durataMesi int(11) DEFAULT NULL,
  descrizione text
) ENGINE=InnoDB;

--
-- Creazione tabella `Lavoratore`
--
DROP TABLE IF EXISTS `Lavoratore`;
CREATE TABLE `Lavoratore` (
  idLav int(11) AUTO_INCREMENT PRIMARY KEY,
  nome varchar(10) NOT NULL,
  cognome varchar(15) NOT NULL,
  dataDiNascita date NOT NULL,
  codF varchar(16) NOT NULL,
  indirizzo text NOT NULL,
  citta text NOT NULL,
  prov varchar(2) NOT NULL,
  stato varchar(2) NOT NULL DEFAULT 'IT',
  mansione enum('Manager','Quadro','Impiegato','Operaio') NOT NULL DEFAULT 'Operaio',
  direttore enum('Si','No') DEFAULT 'No',
  rischio enum('Alto','Medio','Basso') NOT NULL DEFAULT 'Basso',
  dataAssunzione date NOT NULL,
  dataLicenziamento date DEFAULT NULL
) ENGINE=InnoDB;

--
-- Creazione tabella `Sede`
--
DROP TABLE IF EXISTS `Sede`;
CREATE TABLE `Sede` (
  idSede int(11) AUTO_INCREMENT PRIMARY KEY,
  azienda int(11) NOT NULL,
  tipoSede enum('Principale','Secondaria') NOT NULL DEFAULT 'Secondaria',
  indirizzo text NOT NULL,
  citta text NOT NULL,
  prov varchar(2) NOT NULL,
  stato varchar(2) NOT NULL DEFAULT 'IT',
  idDirettore int(11) NOT NULL,
   FOREIGN KEY (azienda) REFERENCES Azienda(idAzienda)
                ON DELETE NO ACTION,
   FOREIGN KEY (idDirettore) REFERENCES Lavoratore(idLav)
                ON DELETE NO ACTION
) ENGINE=InnoDB;

--
-- Creazione tabella `Contratto`
--
DROP TABLE IF EXISTS `Contratto`;
CREATE TABLE `Contratto` (
  idSedeLav int(11) AUTO_INCREMENT PRIMARY KEY,
  idSede int(11) NOT NULL,
  idLav int(11) NOT NULL,
  idTipoC int(11) NOT NULL,
  dataArrivoSede date NOT NULL,
  dataTermineSede date DEFAULT NULL,
  FOREIGN KEY (idSede) REFERENCES Sede(idSede)
                ON DELETE NO ACTION,
  FOREIGN KEY (idLav) REFERENCES Lavoratore(idLav)
                ON DELETE NO ACTION,  
  FOREIGN KEY (idTipoC) REFERENCES TipoContratto(idTipologia)
                ON DELETE NO ACTION
) ENGINE=InnoDB;

--
-- Creazione tabella `Corso`
--
DROP TABLE IF EXISTS `Corso`;
CREATE TABLE `Corso` (
  idCorso int(11) AUTO_INCREMENT PRIMARY KEY,
  nome varchar(20) NOT NULL,
  descrizione text NOT NULL,
  sostenutoDa varchar(20) NOT NULL,
  dataInizio date NOT NULL,
  durataOre tinyint(3) unsigned NOT NULL,  
  dataFine date NOT NULL,
  validitaRischio enum('Alto','Medio','Basso') NOT NULL DEFAULT 'Basso'
) ENGINE=InnoDB;

--
-- Creazione tabella `LavoratoreCorso`
--
DROP TABLE IF EXISTS `LavoratoreCorso`;
CREATE TABLE `LavoratoreCorso` (
  idLavCorso int(11) AUTO_INCREMENT PRIMARY KEY,
  idCorso int(11) NOT NULL,
  idLav int(11) NOT NULL,
  FOREIGN KEY (idCorso) REFERENCES Corso(idCorso)
                ON DELETE NO ACTION,
  FOREIGN KEY (idLav) REFERENCES Lavoratore(idLav)
                ON DELETE NO ACTION
) ENGINE=InnoDB;

--
-- Creazione tabella `VisitaMedica`
--
DROP TABLE IF EXISTS `VisitaMedica`;
CREATE TABLE `VisitaMedica` (
  idLav int(11) NOT NULL,
  data date NOT NULL,
  causaVisita text NOT NULL,
  nomeMedico varchar(30) NOT NULL,
  risultato enum('Visita Superata','Visita non Superata') NOT NULL,
  note text,
  PRIMARY KEY (idLav, data),
  FOREIGN KEY (idLav) REFERENCES Lavoratore(idLav)
                ON DELETE NO ACTION
) ENGINE=InnoDB;

--
-- Creazione tabella `Oggetto`
--
DROP TABLE IF EXISTS `Oggetto`;
CREATE TABLE  `Oggetto` (
  idOggetto int(11) AUTO_INCREMENT PRIMARY KEY,
  nome varchar(20) NOT NULL,
  dataAcquisto date DEFAULT NULL,
  sede int(11) NOT NULL,
  zonaCollocazione int(11) DEFAULT NULL,
  controllo enum('Si','No') NOT NULL,
  FOREIGN KEY (sede) REFERENCES Sede(idSede) 
                ON DELETE NO ACTION
) ENGINE=InnoDB;

--
-- Creazione tabella `Manutenzione`
--
DROP TABLE IF EXISTS `Manutenzione`;
CREATE TABLE `Manutenzione` (
  oggetto int(11) NOT NULL,
  data date NOT NULL,
  dataRinnovo date NOT NULL,
  risultato enum('Sicuro','Non sicuro') NOT NULL DEFAULT 'Non sicuro',
  PRIMARY KEY (oggetto, data),
  FOREIGN KEY (oggetto) REFERENCES Oggetto(idOggetto)
                ON DELETE NO ACTION
) ENGINE=InnoDB;

