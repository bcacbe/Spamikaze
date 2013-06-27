-- MySQL dump 10.13  Distrib 5.6.10, for Linux (x86_64)
--
-- Host: localhost    Database: spamikaze
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `agent` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_country` (`country`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fqdn`
--

DROP TABLE IF EXISTS `fqdn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fqdn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(200) NOT NULL DEFAULT ' ',
  `abuse` varchar(80) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hostname` (`hostname`(40))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fqdn`
--

LOCK TABLES `fqdn` WRITE;
/*!40000 ALTER TABLE `fqdn` DISABLE KEYS */;
/*!40000 ALTER TABLE `fqdn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipentries`
--

DROP TABLE IF EXISTS `ipentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipentries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_received` int(11) NOT NULL DEFAULT '0',
  `date_logged` int(11) NOT NULL DEFAULT '0',
  `date_mail` int(11) NOT NULL DEFAULT '0',
  `id_subject` int(11) NOT NULL DEFAULT '0',
  `id_ip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_idip` (`id_ip`),
  KEY `idx_dl` (`date_logged`),
  KEY `idx_ip_dl` (`id_ip`,`date_logged`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipentries`
--

LOCK TABLES `ipentries` WRITE;
/*!40000 ALTER TABLE `ipentries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipentries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipnumbers`
--

DROP TABLE IF EXISTS `ipnumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipnumbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `octa` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `octb` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `octc` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `octd` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ipuniq` (`octa`,`octb`,`octc`,`octd`),
  KEY `idx_visible` (`visible`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipnumbers`
--

LOCK TABLES `ipnumbers` WRITE;
/*!40000 ALTER TABLE `ipnumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipnumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipremove`
--

DROP TABLE IF EXISTS `ipremove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipremove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `removetime` int(11) NOT NULL DEFAULT '0',
  `octa` tinyint(3) NOT NULL DEFAULT '0',
  `octb` tinyint(3) NOT NULL DEFAULT '0',
  `octc` tinyint(3) NOT NULL DEFAULT '0',
  `octd` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_remove` (`octa`,`octb`,`octc`,`octd`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipremove`
--

LOCK TABLES `ipremove` WRITE;
/*!40000 ALTER TABLE `ipremove` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipremove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popheaders`
--

DROP TABLE IF EXISTS `popheaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popheaders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `headers` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popheaders`
--

LOCK TABLES `popheaders` WRITE;
/*!40000 ALTER TABLE `popheaders` DISABLE KEYS */;
/*!40000 ALTER TABLE `popheaders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spammers`
--

DROP TABLE IF EXISTS `spammers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spammers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `octa` smallint(6) NOT NULL DEFAULT '0',
  `octb` smallint(6) NOT NULL DEFAULT '0',
  `octc` smallint(6) NOT NULL DEFAULT '0',
  `octd` smallint(6) NOT NULL DEFAULT '0',
  `spamtime` int(11) NOT NULL DEFAULT '0',
  `hostname` varchar(150) NOT NULL DEFAULT ' ',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `c_id` smallint(6) NOT NULL DEFAULT '0',
  `fqdn_id` int(11) NOT NULL DEFAULT '0',
  `spammerscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ip` (`octb`,`octa`,`octc`,`octd`),
  KEY `idx_view` (`id`,`octa`,`octb`,`octc`,`octd`,`hostname`,`visible`,`c_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spammers`
--

LOCK TABLES `spammers` WRITE;
/*!40000 ALTER TABLE `spammers` DISABLE KEYS */;
/*!40000 ALTER TABLE `spammers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(150) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_subject` (`subject`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_spammers` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--

LOCK TABLES `url` WRITE;
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
/*!40000 ALTER TABLE `url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelist`
--

DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelist`
--

LOCK TABLES `whitelist` WRITE;
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-27  9:21:14
