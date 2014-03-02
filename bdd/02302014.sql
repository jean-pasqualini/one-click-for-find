-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: findone
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Document`
--

DROP TABLE IF EXISTS `Document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Document`
--

LOCK TABLES `Document` WRITE;
/*!40000 ALTER TABLE `Document` DISABLE KEYS */;
/*!40000 ALTER TABLE `Document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lieu`
--

DROP TABLE IF EXISTS `Lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Lat` int(11) NOT NULL,
  `Lng` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lieu`
--

LOCK TABLES `Lieu` WRITE;
/*!40000 ALTER TABLE `Lieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Objet`
--

DROP TABLE IF EXISTS `Objet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Objet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) DEFAULT NULL,
  `identifiant` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_870C633C7E9E4C8C` (`photo_id`),
  KEY `IDX_870C633C727ACA70` (`parent_id`),
  CONSTRAINT `FK_870C633C727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `Objet` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_870C633C7E9E4C8C` FOREIGN KEY (`photo_id`) REFERENCES `Document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Objet`
--

LOCK TABLES `Objet` WRITE;
/*!40000 ALTER TABLE `Objet` DISABLE KEYS */;
INSERT INTO `Objet` VALUES (4,NULL,'102','extraits des conditions tarifaires','extraits des conditions tarifaires applicables à compter du 1er juillet 2010','2010-04-16',8,3,2,4,9),(5,NULL,'101','Refus de l\'allocation d\'aide au retour à l\'emploie','Refus de l\'allocation d\'aide au retour à l\'emploie','2009-12-11',8,5,2,6,9),(8,NULL,'1001','Dossier rouge 2009 2010','Dossier rouge','2014-03-02',9,2,1,215,9),(9,NULL,'1002','Maison','Maison','2014-03-02',NULL,1,0,264,9),(10,NULL,'103','bordereau de remise de cheque de eveil et savoir','bordereau de remise de cheque de eveil et savoir de la part de la societe générale (paye)','2010-05-06',8,7,2,8,9),(11,NULL,'104','Notification de radiation du régime social des idépendent','Notification de radiation du régime social des indépendent\r\nCela fait partie de la céssation d\'activité de ma premiere activité d\'auto entrepreneur','2010-12-20',8,9,2,10,9),(12,NULL,'105','Dossier pour le permis','Dossier pour le permis','2010-03-30',8,11,2,12,9),(13,NULL,'106','Relevé de votre livret swing','Relevé de votre livret swing','2010-12-10',8,13,2,14,9),(14,NULL,'107','Relevé de votre livret jeune swing','Relevé de votre livret jeune swing','2010-12-28',8,15,2,16,9),(15,NULL,'108','Relevé de votre livret jeune swing','Relevé de votre livret jeune swing','2011-01-03',8,17,2,18,9),(16,NULL,'109','Recomandé avis de réception 1A 052 988 2044 6','Recomandé avis de réception 1A 052 988 2044 6','2010-12-14',8,19,2,20,9),(17,NULL,'110','Impot entreprise 2009','Renseignement relatif à l\'aneé 2009','2010-02-02',8,21,2,22,9),(18,NULL,'111','Déclaration trimestrielle de recette auto-entrepreneur 2010','Déclaration trimestrielle de recette auto-entrepreneur 2010','2010-01-13',8,23,2,24,9),(19,NULL,'112','Information d\'acces au serveur de renée costes','Information d\'acces au serveur de renée costes','2010-01-01',8,25,2,26,9),(20,NULL,'113','RIB Compte CCP la banque postale','RIB Compte CCP la banque postale','2010-11-30',8,27,2,28,9),(21,NULL,'114','contrat orange internet','contrat orange internet','2010-03-02',8,29,2,30,9),(22,NULL,'115','Lettre de rappel facture 601229023 1&1','Lettre de rappel facture 601229023 1&1','2010-02-04',8,31,2,32,9),(23,NULL,'116','Bordereau de remise de chèque eveil et savoir','Bordereau de remise de chèque eveil et savoir  30€','2010-08-13',8,33,2,34,9),(24,NULL,'117','Bordereau de remise de chèque 83 € eveil et savoir la banque postale','Bordereau de remise de chèque 83 € eveil et savoir la banque postale','2010-06-21',8,35,2,36,9),(25,NULL,'118','Bordereau de livraison SFR Kit 3G+ 2024997659','Bordereau de livraison SFR Kit 3G+','2010-08-13',8,37,2,38,9),(26,NULL,'119','Bordereau de remise de chèque la banque postale eveil et savoir paye','Bordereau de remise de chèque la banque postale eveil et savoir paye','2010-02-02',8,39,2,40,9),(27,NULL,'120','Abandon de procédure de radiation pole emploie','Abandon de procédure de radiation pole emploie','2010-08-19',8,41,2,42,9),(28,NULL,'122','Bordereau de remise de chèque pour la paye eveil et savoir','Bordereau de remise de chèque pour la paye eveil et savoir','2010-06-08',8,43,2,44,9),(29,NULL,'123','Modification temporaire de planning eveil et savoir au togo','Modification temporaire de planning eveil et savoir au togo','2010-04-07',8,45,2,46,9),(30,NULL,'124','Relevé de compte livret jeune swing','Relevé de compte livret jeune swing','2010-04-09',8,47,2,48,9),(31,NULL,'125','Convocation au premier entretretien de suivie','Convocation au premier entretretien de suivi de votre projet personalisé d\'accès à l\'emploie (RAPPEL)','2014-03-02',8,49,2,50,9),(32,NULL,'126','Avertissement dépassement découvert autorisé la banque postale','Avertissement dépassement découvert autorisé la banque postale','2010-06-11',8,51,2,52,9),(33,NULL,'127','Decission de cessation d\'inscription pole emploie','Decission de cessation d\'inscription pole emploie','2014-03-02',8,53,2,54,9),(34,NULL,'128','Relevé de votre livret jeune swing la banque postale','Relevé de votre livret jeune swing la banque postale','2010-10-01',8,55,2,56,9),(35,NULL,'130','Déclaration de radiation auto-entrepreneur','Déclaration de radiation auto-entrepreneur','2010-12-01',8,57,2,58,9),(36,NULL,'131','Relevé de votre livret jeune swing la banque postale','Relevé de votre livret jeune swing la banque postale','2010-12-23',8,59,2,60,9),(37,NULL,'132','Relevé de votre livret jeune swing la banque postale','Relevé de votre livret jeune swing la banque postale','2010-10-19',8,61,2,62,9),(38,NULL,'133','Relevé de votre livret jeune swing la banque postale','Relevé de votre livret jeune swing la banque postale','2010-11-16',8,63,2,64,9),(39,NULL,'134','Cheque en bois eveil et savoir la banque postale','Cheque en bois eveil et savoir la banque postale','2010-01-29',8,65,2,66,9),(40,NULL,'135','Attestation de rejet la banque postale de la part de la société générale eveil et savoir','Attestation de rejet la banque postale de la part de la société générale eveil et savoir','2010-01-29',8,67,2,68,9),(41,NULL,'136','Bordereau de remise de cheque eveil et savoir paye','Bordereau de remise de cheque eveil et savoir paye','2010-02-27',8,69,2,70,9),(42,NULL,'137','Justification de télé-actualisation par intenet pole emploie','Justification de télé-actualisation par intenet pole emploie','2010-02-07',8,71,2,72,9),(43,NULL,'138','Relevé de compte livret jeune swing','Relevé de compte livret jeune swing','2010-01-18',8,73,2,74,9),(44,NULL,'201','Recécipé d\'une opération financiere','Recécipé d\'une opération financiere','2009-01-06',8,75,2,76,9),(45,NULL,'202','Bordereau de remise de cheque','Bordereau de remise de cheque','2009-12-04',8,77,2,78,9),(46,NULL,'203','Certification d\'adhésion prémunys','Certification d\'adhésion prémunys','2009-02-10',8,79,2,80,9),(47,NULL,'204','Relevé de votre livret jeune swing','Relevé de votre livret jeune swing','2009-02-26',8,81,2,82,9),(48,NULL,'205','Déblocage de votre serveur 1&1','Déblocage de votre serveur 1&1','2009-01-26',8,83,2,84,9),(49,NULL,'206','Proposition d\'adhésion solésio vie','Proposition d\'adhésion solésio vie','2009-02-10',8,85,2,86,9),(50,NULL,'207','Création de compte la banque postale','Création de compte la banque postale','2009-02-07',8,87,2,88,9),(51,NULL,'208','Proposition d\'adhésion premunys','Proposition d\'adhésion premunys','2009-02-10',8,89,2,90,9),(52,NULL,'209','Demande d\'adhésion e-carte bleue','Demande d\'adhésion e-carte bleue','2009-01-06',8,91,2,92,9),(53,NULL,'210','Facture 0090000751 WII SPORT PACK','Facture 0090000751 WII SPORT PACK (249 € TTC) dans le magasin e-leclerc de persan','2009-02-16',8,93,2,94,9),(54,NULL,'211','Code d\'accès service e-carte bleu la banque postale','Code d\'accès service e-carte bleu la banque postale','2009-01-15',8,95,2,96,9),(55,NULL,'212','Inscription pole emploie','Inscription pole emploie','2009-11-30',8,97,2,98,9),(56,NULL,'213','Inscription répertoire entreprise insee','Inscription répertoire entreprise insee','2009-11-23',8,99,2,100,9),(57,NULL,'214','Déclaration de début d\'activité entreprise auto-entrepreneur','Déclaration de début d\'activité entreprise auto-entrepreneur','2009-10-23',8,101,2,102,9),(58,NULL,'214','Inscription d\'un de vos établisement à net-entreprise','Inscription d\'un de vos établisement à net-entreprise','2009-12-01',8,103,2,104,9),(59,NULL,'216','Certificat d\'adhésion contrat sélésio vie n° 238 628158 07','Certificat d\'adhésion contrat solésio vie n° 238 628158 07','2009-02-08',8,105,2,106,9),(60,NULL,'217','document solésio vie','document solésio vie','2009-02-28',8,107,2,108,9),(61,NULL,'218','document prévialys','document prévialys','2014-03-02',8,109,2,110,9),(62,NULL,'219','Document prémunys','Document prémunys','2009-02-28',8,111,2,112,9),(63,NULL,'220','Facture E-leclerc tv \"scott tvx150\" 189 € n° 0036898','Facture E-leclerc tv \"scott tvx150\" 189 €','2009-02-16',8,113,2,114,9),(64,NULL,'221','Proposition adhésion prévialys','Proposition adhésion prévialys','2009-02-10',8,115,2,116,9),(65,NULL,'222','Facture  jeux pc aion : the tower of eternity fnac','Facture  jeux pc aion : the tower of eternity fnac','2014-03-02',8,117,2,118,9),(66,NULL,'223','Document solésio','Document solésio','2009-07-28',8,119,2,120,9),(67,NULL,'224','Relevé d\'opération solésio vie','Relevé d\'opération solésio vie','2009-07-28',8,121,2,122,9),(68,NULL,'225','Formulaire de résilation d\'inscription net entreprise','Formulaire de résilation d\'inscription net entreprise','2009-12-04',8,123,2,124,9),(69,NULL,'226','Notification d\'affiliation au statut auto-entreprieneur','Notification d\'affiliation au statut auto-entreprieneur','2009-11-26',8,125,2,126,9),(70,NULL,'227','Certificat adhésion prévialys','Certificat adhésion prévialys','2009-02-10',8,127,2,128,9),(71,NULL,'228','Bon de command PC120 CONSOLE INFORMATIQUE Meuble Magasin but','Bon de command PC120 CONSOLE INFORMATIQUE Meuble Magasin but','2009-06-07',8,129,2,130,9),(72,NULL,'229','Adhésion poste appel téléphonique mobile la banque postale','Adhésion poste appel téléphonique mobile la banque postale','2009-07-02',8,131,2,132,9),(73,NULL,'230','Demande d\'arret de solésio vie, prémunys et prévialys','Demande d\'arret de solésio vie, prémunys et prévialys','2009-07-10',8,133,2,134,9),(74,NULL,'131','Contrat de travail (CDD) avec eveil et savoir','Contrat de travail (CDD) avec eveil et savoir','2009-12-04',8,135,2,136,9),(75,NULL,'232','Attribution d\'un nouveau code confidentiel la francaise des jeux','Attribution d\'un nouveau code confidentiel la francaise des jeux','2009-08-04',8,137,2,138,9),(76,NULL,'233','Facture n° 15903288 (57.90 €) Multi VGA Box chez play-asia.com','Facture n° 15903288 (57.90 €) Multi VGA Box','2009-07-22',8,139,2,140,9),(77,NULL,'234','Déclaration de radiation de status auto-entrepreneur','Déclaration de radiation de status auto-entrepreneur','2009-12-04',8,141,2,142,9),(78,NULL,'235','Vos identifiant de connection orange','Vos identifiant de connection orange','2009-06-21',8,143,2,144,9),(79,NULL,'236','avertissement avant radiation pole emploie','avertissement avant radiation pole emploie','2010-10-25',8,145,2,146,9),(80,NULL,'237','Remise de cheque paye eveil et savoir','Remise de cheque paye eveil et savoir','2009-12-24',8,147,2,148,9),(81,NULL,'238','Attestation d\'initiation aux alters et aux premiers secours','Attestation d\'initiation aux alters et aux premiers secours effectué l\'ors de l\'appel de préparation à la défense','2010-10-05',8,149,2,150,9),(82,NULL,'239','Certificat individuel de participation à l\'appel de préparation à la défense','Certificat individuel de participation à l\'appel de préparation à la défense','2010-10-05',8,151,2,152,9),(83,NULL,'240','Jornée d\'appel de préparation à la défense','Jornée d\'appel de préparation à la défense','2010-10-05',8,153,2,154,9),(84,NULL,'241','Votre projet personalisé d\'accès à l\'emploie','Votre projet personalisé d\'accès à l\'emploie','2009-12-11',8,155,2,156,9),(85,NULL,'242','Demande d\'emploi de mr pasqualini jean','Demande d\'emploi de mr pasqualini jean','2009-12-10',8,157,2,158,9),(86,NULL,'243','Avertissement découvert délai compte la banque postale','Avertissement découvert délai compte la banque postale','2009-11-26',8,159,2,160,9),(87,NULL,'244','Déclaration de situation mensuelle pole emploie','Déclaration de situation mensuelle de décembre 2009 pole emploie','2010-01-03',8,161,2,162,9),(88,NULL,'245','Convocationau premier entretien pour élaborer votre projet professionnel','Convocationau premier entretien pour élaborer votre projet professionnel','2009-12-10',8,163,2,164,9),(89,NULL,'246','Facture 3528591 ga-790fxta-ud5 (sound, 2x G-lan, Fw, Sat) carte mère 165.02 €','Facture 3528591 ga-790fxta-ud5 (sound, 2x G-lan, Fw, Sat) carte mère','2009-12-23',8,165,2,166,9),(90,NULL,'247','Attestation recu carte mère sur price minister (GA-790FXT-UD5)','Attestation recu carte mère sur price minister (GA-790FXT-UD5)','2009-12-23',8,167,2,168,9),(91,NULL,'248','Contrat orrange internet + tv + téléphone','Contrat orrange internet + tv + téléphone','2009-02-28',8,169,2,170,9),(92,NULL,'249','Facture webportage n° F-0902-02901-00002 de 119,60 € pour un client','Facture webportage n° F-0902-02901-00002','2009-02-09',8,171,2,172,9),(93,NULL,'250','Facture webportage n° F-0902-02901-00003','Facture webportage n° F-0902-02901-00003 pour un client','2009-02-12',8,173,2,174,9),(94,NULL,'251','Faacture fnac Window 7 edition familial prenium n° 694392866 à 51.50 €','Faacture fnac Window 7 edition familial prenium n° 694392866 à 51.50 €','2009-10-20',8,175,2,176,9),(95,NULL,'252','Facture UPS Taxe importation 23.55 €','Facture UPS Taxe importation 23.55 €','2009-10-08',8,177,2,178,9),(96,NULL,'254','Facture fnac n° 690432747 les simpson le film bue ray 20.49 €','Facture fnac n° 690432747 les simpson le film bue ray 20.49 €','2009-01-26',8,179,2,180,9),(97,NULL,'255','Bordereau fnac n°694392866 windows 7','Bordereau fnac n°694392866 windows 7','2009-10-20',8,181,2,182,9),(98,NULL,'256','Relevé de votre livret jeune swing','Relevé de votre livret jeune swing','2009-02-13',8,183,2,184,9),(99,NULL,'257','Confirmation produit banque postale','Confirmation produit banque postale','2009-02-25',8,185,2,186,9),(100,NULL,'258','Candidature développeur informatique / administrateur réseaux','Candidature développeur informatique / administrateur réseaux','2008-12-15',8,187,2,188,9),(101,NULL,'259','Cv développeur informatique','Cv développeur informatique','2010-01-01',8,189,2,190,9),(102,NULL,'260','Resumé recherche emploi pole emploie','Resumé recherche emploi pole emploie','2009-12-11',8,191,2,192,9),(103,NULL,'261','Fiche déligibilité cae pole emploie','Fiche déligibilité cae pole emploie','2010-01-01',8,193,2,194,9),(104,NULL,'262','Contrat de remboursement avec TRAIN','Contrat de remboursement avec TRAIN','2010-01-01',8,195,2,196,9),(105,NULL,'263','Confirmation de subscription orange internet tv téléphone','Confirmation de subscription orange internet tv téléphone','2009-02-28',8,197,2,198,9),(106,NULL,'264','Facture carrefour orange l\'isle adam liveplug 57.69 €','Facture carrefour orange l\'isle adam liveplug 57.69 €','2009-02-28',8,199,2,200,9),(107,NULL,'265','Déblocage de votre serveur 1&1','Déblocage de votre serveur 1&1','2009-01-27',8,201,2,202,9),(108,NULL,'266','Votre projet personnalisé d\'accès à l\'emploi','Votre projet personnalisé d\'accès à l\'emploi \r\nConclusions de l\'entretien du 10 décembre 2009','2009-12-10',8,203,2,204,9),(109,NULL,'1','Information sur la messagerie vocale pole emploie','Information sur la messagerie vocale pole emploie','2011-01-24',8,205,2,206,9),(110,NULL,'2','Opposition carte bleue','Opposition carte bleue','2011-02-03',8,207,2,208,9),(111,NULL,'3','Remise de cheque francoise haen 100 €','Remise de cheque francoise haen 100 €','2011-01-21',8,209,2,210,9),(112,NULL,'4','Remise de cheque Carracillo 30€','Remise de cheque Carracillo 30€','2011-01-21',8,211,2,212,9),(113,NULL,'5','Remise de cheque webcam service paye 696 €','Remise de cheque webcam service paye 696 €','2011-03-12',8,213,2,214,9),(114,NULL,'21','Liste de colisage office depot','Liste de colisage office depot','2011-12-28',118,227,2,228,9),(115,NULL,'345','Releve de votre livret jeune swing','Releve de votre livret jeune swing','2008-10-03',118,229,2,230,9),(116,NULL,'344','Licenciement financier renée costes','Licenciement financier renée costes','2008-12-16',118,231,2,232,9),(117,NULL,'304','Centre national privé de formation à distance','Centre national privé de formation à distance','2008-12-29',118,233,2,234,9),(118,NULL,'1004','Dossier jaune 2011 2012','Dossier jaune 2011 2012','2011-01-01',9,216,1,263,9),(119,NULL,'305','Recommandé centre financié la banque postale','Recommandé centre financié la banque postale','2008-12-23',118,217,2,218,9),(120,NULL,'301','Relevé de votre compte swing','Relevé de votre compte swing','2008-11-29',118,219,2,220,9),(121,NULL,'8','Avis d\'arret de travail eveil et savoir','Avis d\'arret de travail eveil et savoir','2011-01-04',118,221,2,222,9),(122,NULL,'7','Facture monpharmacien.fr Boule quies 8.70€','Facture monpharmacien.fr Boule quies 8.70€','2011-09-07',118,223,2,224,9),(123,NULL,'6','Releve de votre livret swing','Releve de votre livret swing','2011-01-26',118,225,2,226,9),(124,NULL,'302','Contrat compte bagoo','Contrat compte bagoo','2008-02-03',118,235,2,236,9),(125,NULL,'303','Cadeau porte clé aliatys','Cadeau porte clé aliatys','2008-12-26',118,237,2,238,9),(126,NULL,'9','Relevé de votre livret swing','Relevé de votre livret swing','2013-01-10',118,239,2,240,9),(127,NULL,'10','Information messagerie vocale pole emploie','Information messagerie vocale pole emploie','2011-11-30',118,241,2,242,9),(128,NULL,'11','Relevé de votre livret swing','Relevé de votre livret swing','2011-07-26',118,243,2,244,9),(129,NULL,'12','Relevé de votre livret swing','Relevé de votre livret swing','2011-04-06',118,245,2,246,9),(130,NULL,'13','Facture fnac n° 615310046 les geekete contre attaque bd 8.97 €','Facture fnac n° 615310046 les geekete contre attaque bd 8.97 €','2011-07-13',118,247,2,248,9),(131,NULL,'14','Code d’acess serveur eyeswebcrea','Code d’acess serveur eyeswebcrea','2011-02-01',118,249,2,250,9),(132,NULL,'15','Relevé de votre livret swing','Relevé de votre livret swing','2011-08-26',118,251,2,252,9),(133,NULL,'16','Mot de l\'emission de la carte pole emploie','Mot de l\'emission de la carte pole emploie','1011-01-29',118,253,2,254,9),(134,NULL,'17','Remise de cheque paye webcam service','Remise de cheque paye webcam service','2011-06-04',118,255,2,256,9),(135,NULL,'18','Remise de cheque webcam service paye','Remise de cheque webcam service paye','2011-07-22',118,257,2,258,9),(136,NULL,'19','Remise de cheque webcam service paye','Remise de cheque webcam service paye','2011-02-19',118,259,2,260,9),(137,NULL,'20','Relevé de votre livret swing','Relevé de votre livret swing','2011-12-26',118,261,2,262,9);
/*!40000 ALTER TABLE `Objet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stackable`
--

DROP TABLE IF EXISTS `Stackable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stackable` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Lat` int(11) DEFAULT NULL,
  `Lng` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifiant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F4D6B4DA727ACA70` (`parent_id`),
  KEY `IDX_F4D6B4DA64D218E` (`location_id`),
  CONSTRAINT `FK_F4D6B4DA64D218E` FOREIGN KEY (`location_id`) REFERENCES `Stackable` (`id`),
  CONSTRAINT `FK_F4D6B4DA727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `Stackable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stackable`
--

LOCK TABLES `Stackable` WRITE;
/*!40000 ALTER TABLE `Stackable` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stackable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tags`
--

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;
INSERT INTO `Tags` VALUES (8,'pole emploie'),(9,'allocation'),(10,'la banque postale'),(11,'centre financier'),(12,'conditions tarifaires'),(13,'dossier'),(14,'rouge'),(15,'2009'),(16,'2010'),(17,'maison'),(18,' rouge'),(19,' 2009'),(21,'cheque'),(22,'eveil et savoir'),(23,'societe générale'),(24,'paye'),(25,'radiation'),(26,'auto-entrepreneur'),(27,'rsi'),(28,'permis'),(29,'Relevé de compte'),(30,'livret'),(31,'swing'),(32,'avis de réception'),(33,'recommandé'),(34,'la poste'),(35,'impot'),(36,'entreprise'),(37,'2008'),(38,'renseignement'),(39,'déclaration'),(40,'trimestrielle'),(41,'recette'),(42,'information'),(43,'d\'accès'),(44,'serveur'),(45,'renée costes'),(46,'rib'),(47,'compte'),(48,'ccp'),(49,'contrat'),(50,'orange'),(51,'internet'),(52,'lettre'),(53,'rappel'),(54,'facture'),(55,'1&1'),(56,'sfr'),(57,'3G'),(58,'bordereau de livraison'),(59,'abandon'),(60,'procedure'),(61,'modification'),(62,'temporaire'),(63,'planning'),(64,'convocation'),(65,'entretien'),(66,'suivi'),(67,'emploie'),(68,'avertissement'),(69,'dépassement'),(70,'découvert'),(71,'autorisé'),(72,'cessation'),(73,'cheque en bois'),(74,'attesation'),(75,'rejet'),(76,'justification'),(77,'télé-actualisation'),(78,'recécipé'),(79,'opération financierre'),(80,'prémunys'),(81,'certificat'),(82,'adhésion'),(83,'déblocage'),(84,'proposition'),(85,'solésio'),(86,'création'),(87,'demande'),(88,'e-carte bleu'),(89,'paiement'),(90,'wii'),(91,'e-leclerc'),(92,'code'),(93,'service'),(94,'inscription'),(95,'insee'),(96,'début'),(97,'activité'),(98,'net-entreprise'),(99,'document'),(100,'prévialys'),(101,'télévision'),(102,'jeux pc'),(103,'fnac'),(104,'relevé'),(105,'formulaire'),(106,'résiliation'),(107,'notification'),(108,'affiliation'),(109,'bon de commande'),(110,'meuble'),(111,'but'),(112,'mobile'),(113,'arret'),(114,'cdd'),(115,'attribution'),(116,'francaise des jeux'),(117,'informatique'),(118,'play-asia.com'),(119,'identifiant'),(120,'connection'),(121,'ministère de la défence'),(122,'emploi'),(123,'délai'),(124,'situation'),(125,'mensuelle'),(126,'projet'),(127,'carte mére'),(128,'rlo24'),(129,'recu'),(130,'price minister'),(131,'webportage'),(132,'windows'),(133,'ups'),(134,'taxe'),(135,'importation'),(136,'simpson'),(137,'film'),(138,'blue ray'),(139,'confirmation'),(140,'produit'),(141,'candidature'),(142,'développeur'),(143,'cv'),(144,'résumé'),(145,'recherche'),(146,'éligibilité'),(147,'cae'),(148,'remboursement'),(149,'client'),(150,'souscription'),(151,'carrefour'),(152,'opposition'),(153,'carte bleu'),(154,'francoise haen'),(155,'carracillo'),(156,'webcam servic'),(157,'colisage'),(158,'office depot'),(159,'licenciement'),(160,'financier'),(161,'renée coste'),(162,'cnfdi'),(163,'2011'),(164,'2012'),(165,' 2011'),(166,' 2012'),(167,'avis'),(168,'travail'),(169,'monpharmacien.fr'),(170,'bagoo'),(171,' monpharmacien.fr'),(172,' arret'),(173,' avis'),(174,' travail'),(175,' Relevé de compte'),(176,' swing'),(177,' centre financier'),(178,' recommandé'),(179,'  centre financier'),(180,'  recommandé'),(181,'cadeau'),(182,'aliatys'),(183,'bd'),(184,'eyeswebcrea'),(185,'carte');
/*!40000 ALTER TABLE `Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_log_entries`
--

DROP TABLE IF EXISTS `ext_log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_log_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_class_lookup_idx` (`object_class`),
  KEY `log_date_lookup_idx` (`logged_at`),
  KEY `log_user_lookup_idx` (`username`),
  KEY `log_version_lookup_idx` (`object_id`,`object_class`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_log_entries`
--

LOCK TABLES `ext_log_entries` WRITE;
/*!40000 ALTER TABLE `ext_log_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_log_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext_translations`
--

DROP TABLE IF EXISTS `ext_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_class`,`field`,`foreign_key`),
  KEY `translations_lookup_idx` (`locale`,`object_class`,`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_translations`
--

LOCK TABLES `ext_translations` WRITE;
/*!40000 ALTER TABLE `ext_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ext_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objet_objet`
--

DROP TABLE IF EXISTS `objet_objet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objet_objet` (
  `objet_source` int(11) NOT NULL,
  `objet_target` int(11) NOT NULL,
  PRIMARY KEY (`objet_source`,`objet_target`),
  KEY `IDX_49EF5785EA559259` (`objet_source`),
  KEY `IDX_49EF5785F3B0C2D6` (`objet_target`),
  CONSTRAINT `FK_49EF5785F3B0C2D6` FOREIGN KEY (`objet_target`) REFERENCES `Objet` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_49EF5785EA559259` FOREIGN KEY (`objet_source`) REFERENCES `Objet` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objet_objet`
--

LOCK TABLES `objet_objet` WRITE;
/*!40000 ALTER TABLE `objet_objet` DISABLE KEYS */;
/*!40000 ALTER TABLE `objet_objet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objet_tags`
--

DROP TABLE IF EXISTS `objet_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objet_tags` (
  `objet_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  PRIMARY KEY (`objet_id`,`tags_id`),
  KEY `IDX_4D5E1D6FF520CF5A` (`objet_id`),
  KEY `IDX_4D5E1D6F8D7B4FB4` (`tags_id`),
  CONSTRAINT `FK_4D5E1D6F8D7B4FB4` FOREIGN KEY (`tags_id`) REFERENCES `Tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4D5E1D6FF520CF5A` FOREIGN KEY (`objet_id`) REFERENCES `Objet` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objet_tags`
--

LOCK TABLES `objet_tags` WRITE;
/*!40000 ALTER TABLE `objet_tags` DISABLE KEYS */;
INSERT INTO `objet_tags` VALUES (4,10),(4,11),(4,12),(5,8),(5,9),(8,13),(8,18),(8,19),(9,17),(10,21),(10,22),(10,23),(10,24),(11,25),(11,26),(11,27),(12,13),(12,28),(13,10),(13,29),(13,30),(13,31),(14,10),(14,29),(15,10),(15,29),(15,31),(16,32),(16,33),(16,34),(17,35),(17,36),(17,37),(17,38),(18,16),(18,26),(18,39),(18,40),(18,41),(19,42),(19,43),(19,44),(19,45),(20,10),(20,46),(20,47),(20,48),(21,49),(21,50),(21,51),(22,52),(22,53),(22,54),(22,55),(23,21),(23,22),(24,10),(24,21),(24,22),(25,56),(25,57),(25,58),(26,10),(26,21),(26,22),(26,24),(27,8),(27,25),(27,59),(27,60),(28,21),(28,22),(28,24),(29,22),(29,61),(29,62),(29,63),(30,10),(30,29),(30,31),(31,64),(31,65),(31,66),(31,67),(32,10),(32,68),(32,69),(32,70),(32,71),(33,8),(33,72),(34,10),(34,29),(34,31),(35,25),(35,26),(35,39),(36,10),(36,29),(36,31),(37,10),(37,16),(37,29),(37,31),(38,10),(38,16),(38,29),(38,31),(39,10),(39,22),(39,73),(40,10),(40,22),(40,73),(40,74),(40,75),(41,10),(41,21),(41,22),(41,24),(42,8),(42,51),(42,76),(42,77),(43,10),(43,29),(43,31),(44,10),(44,78),(44,79),(45,10),(45,21),(45,22),(46,10),(46,80),(46,81),(46,82),(47,10),(47,29),(47,31),(48,44),(48,55),(48,83),(49,10),(49,82),(49,84),(49,85),(50,10),(50,47),(50,86),(51,10),(51,80),(51,82),(51,84),(52,10),(52,82),(52,87),(52,88),(52,89),(53,54),(53,90),(53,91),(54,10),(54,88),(54,92),(54,93),(55,8),(55,94),(56,36),(56,94),(56,95),(57,26),(57,36),(57,39),(57,96),(57,97),(58,26),(58,94),(58,98),(59,49),(59,81),(59,82),(59,85),(60,10),(60,85),(60,99),(61,99),(61,100),(62,10),(62,80),(62,99),(63,54),(63,91),(63,101),(64,10),(64,82),(64,84),(64,100),(65,54),(65,102),(65,103),(66,10),(66,85),(66,99),(67,10),(67,85),(67,104),(68,94),(68,98),(68,105),(68,106),(69,26),(69,107),(69,108),(70,81),(70,82),(70,100),(71,109),(71,110),(71,111),(72,10),(72,82),(72,112),(73,80),(73,85),(73,87),(73,100),(73,113),(74,22),(74,49),(74,114),(75,92),(75,115),(75,116),(76,54),(76,117),(76,118),(77,25),(77,26),(77,39),(78,50),(78,51),(78,92),(78,119),(78,120),(79,8),(79,25),(79,68),(80,21),(80,22),(80,24),(81,28),(81,74),(81,121),(82,28),(82,81),(82,121),(83,28),(83,121),(84,8),(85,8),(85,87),(85,122),(86,10),(86,47),(86,68),(86,70),(86,123),(87,8),(87,39),(87,124),(87,125),(88,8),(88,64),(88,65),(88,126),(89,54),(89,117),(89,127),(89,128),(90,74),(90,127),(90,129),(90,130),(91,49),(91,50),(91,51),(92,54),(92,131),(93,54),(93,131),(94,54),(94,103),(94,117),(94,132),(95,54),(95,133),(95,134),(95,135),(96,54),(96,103),(96,136),(96,137),(96,138),(97,58),(97,103),(97,132),(98,10),(98,29),(98,30),(98,31),(99,10),(99,139),(99,140),(100,141),(100,142),(101,117),(101,142),(101,143),(102,8),(102,144),(102,145),(103,8),(103,146),(103,147),(104,49),(104,148),(104,149),(105,50),(105,51),(105,94),(105,139),(105,150),(106,50),(106,51),(106,54),(106,117),(106,151),(107,44),(107,55),(107,83),(108,8),(108,126),(108,145),(109,8),(109,42),(110,10),(110,152),(110,153),(111,10),(111,21),(111,154),(112,10),(112,21),(112,155),(113,10),(113,21),(113,24),(113,156),(114,54),(114,157),(114,158),(115,10),(115,29),(115,31),(116,159),(116,160),(116,161),(117,13),(117,162),(118,13),(118,165),(118,166),(119,10),(119,179),(119,180),(120,10),(120,175),(120,176),(121,22),(121,172),(121,173),(121,174),(122,54),(122,171),(123,10),(123,29),(123,31),(124,10),(124,47),(124,49),(124,170),(125,10),(125,181),(125,182),(126,10),(126,29),(126,31),(127,8),(127,42),(128,10),(128,29),(128,31),(129,10),(129,29),(129,31),(130,54),(130,103),(130,183),(131,44),(131,92),(131,184),(132,10),(132,29),(132,31),(133,8),(133,185),(134,21),(134,24),(134,156),(135,21),(135,24),(135,156),(136,10),(136,21),(136,156),(137,10),(137,29),(137,31);
/*!40000 ALTER TABLE `objet_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-02 10:59:18
