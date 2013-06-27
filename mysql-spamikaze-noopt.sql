-- MySQL dump 10.13  Distrib 5.6.10, for Linux (x86_64)
--
-- Host: localhost    Database: spamikaze
-- ------------------------------------------------------
-- Server version	5.6.10
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agents`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `id` int(13) NOT NULL,
  `agent` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--


--
-- Table structure for table `country`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_country` (`country`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--


--
-- Table structure for table `fqdn`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fqdn` (
  `id` int(11) NOT NULL,
  `hostname` varchar(200) NOT NULL DEFAULT ' ',
  `abuse` varchar(80) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hostname` (`hostname`(40))
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fqdn`
--


--
-- Table structure for table `ipentries`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipentries` (
  `id` int(11) NOT NULL,
  `date_received` int(11) NOT NULL DEFAULT '0',
  `date_logged` int(11) NOT NULL DEFAULT '0',
  `date_mail` int(11) NOT NULL DEFAULT '0',
  `id_subject` int(11) NOT NULL DEFAULT '0',
  `id_ip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_idip` (`id_ip`),
  KEY `idx_dl` (`date_logged`),
  KEY `idx_ip_dl` (`id_ip`,`date_logged`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipentries`
--


--
-- Table structure for table `ipnumbers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipnumbers` (
  `id` int(11) NOT NULL,
  `octa` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `octb` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `octc` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `octd` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ipuniq` (`octa`,`octb`,`octc`,`octd`),
  KEY `idx_visible` (`visible`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipnumbers`
--


--
-- Table structure for table `ipremove`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipremove` (
  `id` int(11) NOT NULL,
  `removetime` int(11) NOT NULL DEFAULT '0',
  `octa` tinyint(3) NOT NULL DEFAULT '0',
  `octb` tinyint(3) NOT NULL DEFAULT '0',
  `octc` tinyint(3) NOT NULL DEFAULT '0',
  `octd` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_remove` (`octa`,`octb`,`octc`,`octd`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipremove`
--


--
-- Table structure for table `popheaders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popheaders` (
  `id` int(11) NOT NULL,
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `headers` text NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popheaders`
--


--
-- Table structure for table `spammers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spammers` (
  `id` int(11) NOT NULL,
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
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spammers`
--


--
-- Table structure for table `subjects`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject` varchar(150) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_subject` (`subject`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--


--
-- Table structure for table `url`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `id` int(11) NOT NULL,
  `id_spammers` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--


--
-- Table structure for table `whitelist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_email` (`email`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelist`
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-27  9:34:34
