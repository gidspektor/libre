-- MySQL dump 10.13  Distrib 8.0.21, for osx10.15 (x86_64)
--
-- Host: localhost    Database: libre
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `libre`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `libre` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `libre`;

--
-- Table structure for table `api_cities`
--

DROP TABLE IF EXISTS `api_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_cities`
--

LOCK TABLES `api_cities` WRITE;
/*!40000 ALTER TABLE `api_cities` DISABLE KEYS */;
INSERT INTO `api_cities` VALUES (7,'Aude'),(16,'Aveyron'),(27,'Badalona'),(40,'Badia del Valles'),(41,'Barbera del Valles'),(19,'Barcelona'),(5,'Castello d\'Empuries'),(32,'Cerdanyola'),(25,'Cornella'),(18,'Correze'),(26,'El Prat de Llobregat'),(22,'Esplugues de Llobregat'),(4,'Girona'),(12,'Herault'),(9,'Huesca'),(21,'L\'Hospitalet de Llobregat'),(39,'La Llagosta'),(6,'Lleida'),(17,'Marseille'),(37,'Molins de Rei'),(30,'Montcada i Reixac'),(35,'Montgat'),(14,'Montpellier'),(8,'Palma'),(13,'Parisot'),(44,'Polinya'),(34,'Ripollet'),(1,'Sabadell'),(20,'Sant Adrio de Besos'),(31,'Sant Boi de Llobregat'),(33,'Sant Cugat'),(29,'Sant Feliu de Llobregat'),(42,'Sant Fost de Campsentelles'),(28,'Sant Joan Despi'),(24,'Sant Just Desvern'),(38,'Sant Vicenc dels Horts'),(36,'Santa Coloma de Cervello'),(23,'Santa Coloma de Gramenet'),(43,'Santa Perpetua de Mogoda'),(3,'Tarragona'),(2,'Terrassa'),(10,'Toulouse'),(15,'Valencia'),(11,'Zaragoza');
/*!40000 ALTER TABLE `api_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_countries`
--

DROP TABLE IF EXISTS `api_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_countries`
--

LOCK TABLES `api_countries` WRITE;
/*!40000 ALTER TABLE `api_countries` DISABLE KEYS */;
INSERT INTO `api_countries` VALUES (1,'Afghanistan'),(2,'Albania'),(3,'Algeria'),(4,'American Samoa'),(5,'Andorra'),(6,'Angola'),(7,'Anguilla'),(8,'Antarctica'),(9,'Antigua and Barbuda'),(10,'Argentina'),(11,'Armenia'),(12,'Aruba'),(13,'Australia'),(14,'Austria'),(15,'Azerbaijan'),(16,'Bahamas '),(17,'Bahrain'),(18,'Bangladesh'),(19,'Barbados'),(20,'Belarus'),(21,'Belgium'),(22,'Belize'),(23,'Benin'),(24,'Bermuda'),(25,'Bhutan'),(26,'Bolivia'),(27,'Bonaire, Sint Eustatius and Saba'),(28,'Bosnia and Herzegovina'),(29,'Botswana'),(30,'Bouvet Island'),(31,'Brazil'),(32,'British Indian Ocean Territory '),(33,'Brunei Darussalam'),(34,'Bulgaria'),(35,'Burkina Faso'),(36,'Burundi'),(37,'Cabo Verde'),(38,'Cambodia'),(39,'Cameroon'),(40,'Canada'),(41,'Cayman Islands '),(42,'Central African Republic'),(43,'Chad'),(44,'Chile'),(45,'China'),(46,'Christmas Island'),(47,'Cocos (Keeling) Islands'),(48,'Colombia'),(49,'Comoros '),(50,'Congo'),(51,'Cook Islands '),(52,'Costa Rica'),(58,'Cote d\'Ivoire'),(53,'Croatia'),(54,'Cuba'),(55,'Curacao'),(56,'Cyprus'),(57,'Czechia'),(59,'Denmark'),(60,'Djibouti'),(61,'Dominica'),(62,'Dominican Republic'),(63,'Ecuador'),(64,'Egypt'),(65,'El Salvador'),(66,'Equatorial Guinea'),(67,'Eritrea'),(68,'Estonia'),(69,'Eswatini'),(70,'Ethiopia'),(71,'Falkland Islands'),(72,'Faroe Islands '),(73,'Fiji'),(74,'Finland'),(75,'France'),(76,'French Guiana'),(77,'French Polynesia'),(78,'French Southern Territories'),(79,'Gabon'),(80,'Gambia '),(81,'Georgia'),(82,'Germany'),(83,'Ghana'),(84,'Gibraltar'),(85,'Greece'),(86,'Greenland'),(87,'Grenada'),(88,'Guadeloupe'),(89,'Guam'),(90,'Guatemala'),(91,'Guernsey'),(92,'Guinea'),(93,'Guinea-Bissau'),(94,'Guyana'),(95,'Haiti'),(96,'Heard Island and McDonald Islands'),(97,'Holy See '),(98,'Honduras'),(99,'Hong Kong'),(100,'Hungary'),(101,'Iceland'),(102,'India'),(103,'Indonesia'),(104,'Iran'),(105,'Iraq'),(106,'Ireland'),(107,'Isle of Man'),(108,'Israel'),(109,'Italy'),(110,'Jamaica'),(111,'Japan'),(112,'Jersey'),(113,'Jordan'),(114,'Kazakhstan'),(115,'Kenya'),(116,'Kiribati'),(119,'Kuwait'),(120,'Kyrgyzstan'),(121,'Lao People\'s Democratic Republic'),(122,'Latvia'),(123,'Lebanon'),(124,'Lesotho'),(125,'Liberia'),(126,'Libya'),(127,'Liechtenstein'),(128,'Lithuania'),(129,'Luxembourg'),(130,'Macao'),(131,'Madagascar'),(132,'Malawi'),(133,'Malaysia'),(134,'Maldives'),(135,'Mali'),(136,'Malta'),(137,'Marshall Islands'),(138,'Martinique'),(139,'Mauritania'),(140,'Mauritius'),(141,'Mayotte'),(142,'Mexico'),(143,'Micronesia'),(144,'Moldova'),(145,'Monaco'),(146,'Mongolia'),(147,'Montenegro'),(148,'Montserrat'),(149,'Morocco'),(150,'Mozambique'),(151,'Myanmar'),(152,'Namibia'),(153,'Nauru'),(154,'Nepal'),(155,'Netherlands '),(156,'New Caledonia'),(157,'New Zealand'),(158,'Nicaragua'),(159,'Niger'),(160,'Nigeria'),(161,'Niue'),(162,'Norfolk Island'),(117,'North Korea'),(163,'Northern Mariana Islands '),(164,'Norway'),(165,'Oman'),(166,'Pakistan'),(167,'Palau'),(168,'Palestine, State of'),(169,'Panama'),(170,'Papua New Guinea'),(171,'Paraguay'),(172,'Peru'),(173,'Philippines'),(174,'Pitcairn'),(175,'Poland'),(176,'Portugal'),(177,'Puerto Rico'),(178,'Qatar'),(179,'Republic of North Macedonia'),(183,'Reunion'),(180,'Romania'),(181,'Russian Federation'),(182,'Rwanda'),(184,'Saint Barthelemy'),(185,'Saint Helena, Ascension and Tristan da Cunha'),(186,'Saint Kitts and Nevis'),(187,'Saint Lucia'),(188,'Saint Martin (French part)'),(189,'Saint Pierre and Miquelon'),(190,'Saint Vincent and the Grenadines'),(191,'Samoa'),(192,'San Marino'),(193,'Sao Tome and Principe'),(194,'Saudi Arabia'),(195,'Senegal'),(196,'Serbia'),(197,'Seychelles'),(198,'Sierra Leone'),(199,'Singapore'),(200,'Sint Maarten (Dutch part)'),(201,'Slovakia'),(202,'Slovenia'),(203,'Solomon Islands'),(204,'Somalia'),(205,'South Africa'),(206,'South Georgia and the South Sandwich Islands'),(118,'South Korea'),(207,'South Sudan'),(208,'Spain'),(209,'Sri Lanka'),(210,'Sudan'),(211,'Suriname'),(212,'Svalbard and Jan Mayen'),(213,'Sweden'),(214,'Switzerland'),(215,'Syrian Arab Republic'),(216,'Taiwan'),(217,'Tajikistan'),(218,'Tanzania, United Republic of'),(219,'Thailand'),(220,'Timor-Leste'),(221,'Togo'),(222,'Tokelau'),(223,'Tonga'),(224,'Trinidad and Tobago'),(225,'Tunisia'),(226,'Turkey'),(227,'Turkmenistan'),(228,'Turks and Caicos Islands'),(229,'Tuvalu'),(230,'Uganda'),(231,'Ukraine'),(232,'United Arab Emirates'),(233,'United Kingdom'),(234,'United States of America)'),(235,'Uruguay'),(236,'Uzbekistan'),(237,'Vanuatu'),(238,'Venezuela)'),(239,'Viet Nam'),(240,'Virgin Islands (British)'),(241,'Virgin Islands (U.S.)'),(242,'Wallis and Futuna'),(243,'Western Sahara'),(244,'Yemen'),(245,'Zambia'),(246,'Zimbabwe');
/*!40000 ALTER TABLE `api_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_countriescities`
--

DROP TABLE IF EXISTS `api_countriescities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_countriescities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_countries_cities_city_id_76280eed_fk_api_cities_id` (`city_id`),
  KEY `api_countries_cities_country_id_3681e163_fk_api_countries_id` (`country_id`),
  CONSTRAINT `api_countries_cities_city_id_76280eed_fk_api_cities_id` FOREIGN KEY (`city_id`) REFERENCES `api_cities` (`id`),
  CONSTRAINT `api_countries_cities_country_id_3681e163_fk_api_countries_id` FOREIGN KEY (`country_id`) REFERENCES `api_countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_countriescities`
--

LOCK TABLES `api_countriescities` WRITE;
/*!40000 ALTER TABLE `api_countriescities` DISABLE KEYS */;
INSERT INTO `api_countriescities` VALUES (1,11,208),(2,25,208),(3,15,208),(4,41,208),(5,22,208),(6,7,208),(7,32,208),(8,9,208),(9,14,208),(10,10,208),(11,33,208),(12,44,208),(13,19,208),(14,20,208),(15,1,208),(16,31,208),(17,13,208),(18,27,208),(19,37,208),(20,4,208),(21,2,208),(22,36,208),(23,30,208),(24,18,208),(25,42,208),(26,34,208),(27,5,208),(28,21,208),(29,23,208),(30,40,208),(31,43,208),(32,3,208),(33,28,208),(34,8,208),(35,16,208),(36,35,208),(37,6,208),(38,38,208),(39,17,208),(40,26,208),(41,39,208),(42,29,208),(43,24,208),(44,12,208);
/*!40000 ALTER TABLE `api_countriescities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_events`
--

DROP TABLE IF EXISTS `api_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `date_time` datetime(6) NOT NULL,
  `location_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `show` tinyint(1) NOT NULL,
  `sold_out` tinyint(1) NOT NULL,
  `tickets_bought` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_events_location_id_9cbfb142_fk_api_location_id` (`location_id`),
  CONSTRAINT `api_events_location_id_9cbfb142_fk_api_location_id` FOREIGN KEY (`location_id`) REFERENCES `api_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_events`
--

LOCK TABLES `api_events` WRITE;
/*!40000 ALTER TABLE `api_events` DISABLE KEYS */;
INSERT INTO `api_events` VALUES (2,'Event in some basement with some people doing some shit, definitely alcohol involved. Come get involved in a night that will lead to self hatred and shame in the day after.','2021-01-29 20:00:00.000000',79,'Basement jam',1,0,3),(3,'A dance event with live music acts and then a round of djs to take you through the night, drugs will be there, you should be too.','2021-01-30 22:00:00.000000',32,'Dance away',1,0,7),(4,'Live music act with craft event where you get to take home your achievements with you.','2021-01-28 19:00:00.000000',12,'Craft music',0,0,0),(5,'Join us for a night of art and music in an exclusive location.','2021-02-05 20:00:00.000000',95,'Musical art',1,1,20),(6,'Event in some basement with some people doing some shit, probably drugs involved. Come get involved in a night that will lead to self hatred and shame in the day after.','2021-02-02 00:00:00.000000',13,'ocid test',1,0,9),(7,'Come and enjoy corona free dancing until you drop! This will be an intimate space with live music acts to take you through the night.','2021-10-29 22:00:00.000000',49,'Dance till death',1,0,18),(8,'A night full of strobe lights, good vibes and people who want to dance. Come down to this unique treat in a large event space.','2021-12-10 22:00:00.000000',32,'Strobe light night',1,0,6),(9,'An evening gazing at art accompanied by the pleasure of some live music acts in this chilled intimate space.','2022-03-10 20:00:00.000000',15,'Arts and Music',1,1,120),(10,'Join us for a night of art and music in an exclusive location.','2021-12-22 20:00:00.000000',1,'Art stuff',1,0,4),(11,'Come along to this jungle themed evening of dancing until the early ours of the mornin','2021-11-20 22:00:00.000000',51,'Danceathon',1,0,0);
/*!40000 ALTER TABLE `api_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_location`
--

DROP TABLE IF EXISTS `api_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street_address` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `post_code` varchar(10) DEFAULT NULL,
  `price_per_day` int DEFAULT NULL,
  `price_per_hour` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `allows_own_drinks` tinyint(1) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `basic_sound_system` tinyint(1) DEFAULT NULL,
  `professional_sound_system` tinyint(1) NOT NULL,
  `serves_alcohol` tinyint(1) NOT NULL,
  `city_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_location_city_id_7ff1f151_fk_api_cities_id` (`city_id`),
  KEY `api_location_country_id_b01153c7_fk_api_countries_id` (`country_id`),
  CONSTRAINT `api_location_city_id_7ff1f151_fk_api_cities_id` FOREIGN KEY (`city_id`) REFERENCES `api_cities` (`id`),
  CONSTRAINT `api_location_country_id_b01153c7_fk_api_countries_id` FOREIGN KEY (`country_id`) REFERENCES `api_countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_location`
--

LOCK TABLES `api_location` WRITE;
/*!40000 ALTER TABLE `api_location` DISABLE KEYS */;
INSERT INTO `api_location` VALUES (1,'Pere IV 483','La Clandestina','0801',NULL,NULL,80,0,'2131e55c-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(2,'Linconl 3','Iború Events','08006',100,NULL,90,0,'21cf50ee-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(3,'Carrer de Floridablanca 92','Cahoot Coworking','08015',NULL,NULL,250,0,'224a77ec-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(4,'Carrer dels Mestres Casals i martorell 21','Cityzen Barcelona','08003',540,NULL,45,0,'22e4e7b4-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(5,'Carrer Paraguai 36','Sala Creativa','08020',2550,200,260,0,'2384c928-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(6,'Passatge de Sant Benet, 2 Bis','Sent Soví','08003',450,100,65,0,'2416edee-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(7,'Sant Pere Més Alt, 1','La Casa de la Seda','08003',200,NULL,100,0,'24a955c6-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(8,'Carrer de la Boquería 10','Petit Palace Boquería Garden','08002',400,NULL,130,0,'257cadea-574a-11eb-be04-acde48001122',NULL,1,1,1,19,208),(9,'Pere IV 483','WHAREHOUSE 483','08901',200,NULL,150,0,'26105a22-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(10,'C/ Casp 127','Corevents Barcelona','08013',1200,NULL,200,0,'27490290-574a-11eb-be04-acde48001122',NULL,1,1,1,19,208),(11,'Ramon turró, 168-170, Local-1','Zamness Room','08005',200,25,20,0,'27d462fe-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(12,'Monlau, 26','innovapark','08027',90,NULL,50,0,'28608fe0-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(13,'C/ Pallars, 65 -6o3a-','Espacio Casa Rita','08018',800,100,100,0,'28f34182-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(14,'Buenaventura Muñoz 6','Valid World Hall','08018',NULL,NULL,250,0,'299225f4-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(15,'Carrer Jesús 3-5','InGracia / Sala Soho','08012',NULL,NULL,120,0,'2a18d07c-574a-11eb-be04-acde48001122',NULL,1,1,1,19,208),(16,'Sardenya, 29','Patio y sala San Félix','08005',500,40,100,0,'2a946dc2-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(17,'Infanta Isabel, 4','La Balsa','08022',NULL,NULL,150,0,'2b2bfd9a-574a-11eb-be04-acde48001122',NULL,1,0,1,19,208),(18,'Plaça Reial, 3','Just Royal BCN','08002',500,100,60,0,'2bb6727c-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(19,'Calle Princesa 53','El Foro','08003',NULL,NULL,120,0,'2c4fd070-574a-11eb-be04-acde48001122',NULL,1,1,1,19,208),(20,'Passeig de Gràcia 32','The GlassRoom','08007',NULL,NULL,100,0,'2cdac9b4-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(21,'Carrer de Pallars, 84','Imasd Loft','08018',NULL,150,60,0,'2d5e1cb0-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(22,'Calle Zamora 46, 5º3ª','MeetBox','08005',840,97,150,0,'2e0b529a-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(23,'Carrer d\'Aribau 242','Ivy Resto Lounge / Lounge Bar','08006',NULL,NULL,150,0,'2e92c3f6-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(24,'berlinès, 5 baixos 2ª','The Inspiration House','08006',750,100,100,0,'2f1a320a-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(25,'Carrer Jesús 3-5','InGracia / Sala Escenario','08012',NULL,NULL,80,0,'2fbf060e-574a-11eb-be04-acde48001122',NULL,1,1,1,19,208),(26,'Travessera de Dalt, 33 Bajos (Gardens Stairs)','TEAM ROOM','08024',200,40,49,0,'304a01c8-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(27,'Pelai, 18','Pelayo','08001',120,20,45,0,'30cab62e-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(28,'Travessera de Dalt, 33 Bajos (Escaleras Jardines)','BEE´S KNEES','08024',120,30,20,0,'3173de98-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(29,'Travessera de Dalt, 33 Bajos (Escaleras Jardines)','HONEYCOMB','08024',80,15,24,0,'31f4bd92-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(30,'Gran Vía de les Corts Catalanes 570','Sala Aquarella','08011',NULL,NULL,300,0,'32a1dbb2-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(31,'Carrer Sant Joaquim, 23','Meeatings23','08012',NULL,NULL,60,0,'33373b6c-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(32,'C/Gomis','Espacio para eventos con terraza','08023',750,100,100,0,'33d1a0e4-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(33,'Plaça Dante','Esferic Barcelona / Sala Vidreres','08038',NULL,NULL,290,0,'345b8764-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(34,'Passatge de Casamitjana, 17','Casamitjana 17','08005',NULL,NULL,30,0,'35274cf0-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(35,'La Rambla 130','Canvas / Sala Rambla','08002',NULL,NULL,80,0,'35b9eaa6-574a-11eb-be04-acde48001122',NULL,1,0,1,19,208),(36,'Plaça Dante','Esferic Barcelona / Sala Brossa','08038',NULL,NULL,230,0,'365625f6-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(37,'Carrer Girona 81','Inspiring Retro Design Space','08009',75,10,20,0,'37f1b24a-574a-11eb-be04-acde48001122',NULL,1,0,1,19,208),(38,'Carrer Aragó, 178-180 Sot 3, Local 12, 08011 ','Espacio Centro de la Tierra ','08011',160,20,30,0,'38ab0768-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(39,'Escorial, 180 Bajos','HONEYBEES','08024',165,35,30,0,'3929def8-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(40,'Carrer d\'Espinoi ','Imasd Club','08023',NULL,150,60,0,'3ab323ba-574a-11eb-be04-acde48001122',NULL,1,1,1,19,208),(41,'Entença 325 - 335','Auditorio MGS','08029',3000,NULL,288,0,'3b65f1a2-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(42,'Carrer del Bruc, 147','ArteriaBCN / Lounge','08037',NULL,NULL,80,0,'3be5343a-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(43,'Carrer de Joaquín Costa, 24','Golden Studio / Loft','08001',NULL,NULL,100,0,'3c7dc18c-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(44,'Escorial, 180 Bajos','JELLY + BUZZ','08024',225,45,40,0,'3d04919e-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(45,'Gomis 34','GBC Business Center / Sala polivalente con terraza','08023',500,100,150,0,'3d9e43c0-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(46,'Calle Aribau 259','Talent Point Hub Barcelona','08021',450,80,25,0,'3e30a580-574a-11eb-be04-acde48001122',NULL,1,1,1,19,208),(47,'Monlau, 26','locale2','08027',75,NULL,35,0,'3f0c332a-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(48,'C/ Pujades 126','Valkiria Hub Space','08005',NULL,NULL,250,0,'3fde5d50-574a-11eb-be04-acde48001122',NULL,1,1,1,19,208),(49,'Carrer de Joaquín Costa, 24','Golden Studio / Apartment','28001',NULL,NULL,100,1,'40877dea-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(50,'Av. del Marquès de l\'Argentera, 13','Clubhaus','08003',3000,100,300,0,'410bdbf8-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(51,'Dolors Aleu, 19-21','Stilus','08090',NULL,NULL,180,0,'41a3e858-574a-11eb-be04-acde48001122',NULL,1,1,1,21,208),(52,'Albigesos, 25-27 Bajos','BEE STING','08024',85,20,43,0,'424b5c8c-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(53,'Gran Via de les Corts Catalanes 672','CREC Coworking Eixample - Sala de Formación Sheldoon Cooper','08010',200,30,50,0,'42e69a26-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(54,'Blesa 27','CREC Coworking Sabadell - Sala reunión Hawkins','08004',80,15,8,0,'438475c0-574a-11eb-be04-acde48001122',NULL,1,0,0,NULL,208),(55,'Gomis 34','GBC Rooftop Barcelona','08023',900,NULL,120,0,'440f0d66-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(56,'Carrer de Girona 118','Almalibre Açaí Bar - Barcelona','08009',NULL,NULL,60,0,'449be736-574a-11eb-be04-acde48001122',NULL,0,0,1,19,208),(57,'Arenas Shopping Center, Gran Via de les Corts Catalanes, 373','La Cúpula','08015',NULL,NULL,1800,0,'4525971a-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(58,'C/ d\'en Blanco 38','kokot studio','08028',NULL,40,100,0,'45a7c028-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(59,'Paseo de Gracia 2, 3.2','BARCELONA PRESS ROOM','08007',NULL,NULL,40,0,'46628b2e-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(60,'Escorial, 180 Bajos','JELLY','08024',100,20,6,0,'472797a2-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(61,'Gomis 34','GBC Business Center - Sala ejecutiva','08023',200,25,0,0,'47b6ad84-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(62,'Plaça Doctor Andreu, 2','Merbeyé / Cabaret','08035',NULL,NULL,65,0,'483a4126-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(63,'Carrer de Sant Sever,4','La Particular','08002',500,60,35,0,'48b26e76-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(64,'Passeig Mare Nostrum, 19-21','Mamarosa Beach / Terraza','08039',NULL,NULL,110,0,'496fb5bc-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(65,'Moll de la marina, 12','Sailboat in Port olímpic','08005',NULL,200,12,0,'4a135582-574a-11eb-be04-acde48001122',NULL,0,0,1,19,208),(66,'Escorial, 180 Bajos','DRONE TABLE','08024',75,10,5,0,'4a96b0b2-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(67,'Sant Antoni Maria Claret 514','Sala de reuniones','08027',160,20,14,0,'4b35c012-574a-11eb-be04-acde48001122',NULL,0,0,1,19,208),(68,'Blesa 27','CREC Coworking Poble Sec - Sala reunión Sauron','08004',200,30,15,0,'4bf8a730-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(69,'Blesa 27','CREC Coworking Poble Sec - Sala B para eventos','08004',640,100,300,0,'4c9ad5b4-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(70,'La Rambla 130','Canvas / Sala Celeste','08002',NULL,NULL,25,0,'4d379746-574a-11eb-be04-acde48001122',NULL,1,0,1,19,208),(71,'C/ Girona, 8','The baSEment','08010',NULL,NULL,120,0,'4dbfc8f0-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(72,'Carrer de Joaquín Costa, 24','Golden Studio / Studio','08001',NULL,NULL,150,0,'4e78e812-574a-11eb-be04-acde48001122',NULL,0,1,0,19,208),(73,'Carrer d\'Oliana, 24','Rex Café','08006',500,75,25,0,'4fa91a68-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(74,'Aribau, 230-240 8º L Bis','Espacio Mood Aribau','08006',750,NULL,40,0,'5045e2b2-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(75,'Escorial, 180 Bajos','BEEKEEPER VIP','08024',110,25,6,0,'50d6a540-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(76,'Sant Gil 4Bis Bajos1','Gastroespacio artístico exclusivo en el centro de Barcelona para eventos privados','08001',700,100,60,0,'516de734-574a-11eb-be04-acde48001122',NULL,1,0,1,19,208),(77,'C/Diputació,211','Atic Barcelona CENTRO DE NEGOCIOS','08011',480,65,40,0,'51ee7e4e-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(78,'Blesa 27','CREC Coworking Poble Sec - Sala formación Ripley','08004',160,30,25,0,'5274efce-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(79,'La Rambla 29','Basement29 Club','08002',300,NULL,120,0,'52f38ff0-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(80,'Passatge de Casamitjana, 15','Casamitjana 15','08005',NULL,NULL,60,0,'53736d56-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(81,'Carrer del Bruc, 147','ArteriaBCN / Galería','08037',NULL,NULL,100,0,'5417c34c-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(82,'Aribau 242','Ivy Resto Lounge','08006',NULL,NULL,250,0,'54b4dbc8-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(83,'C/ Diputación, 211','Àtic Barcelona Salas de reuniones','08011',165,25,12,0,'553dbd8a-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(84,'Carrer del Bruc, 147','ArteriaBCN / Sala','08037',NULL,NULL,40,0,'55c308f0-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(85,'WTC Torre Norte, Local 26 Moll de Barcelona ','COMMONS AO','08039',NULL,NULL,200,0,'56481f36-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(86,'Calle Galileu 254 Bajos 2','Espacio para talleres y cursos','08028',100,NULL,30,0,'56cbd628-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(87,'Passeig Mare Nostrum, 19-21','Mamarosa Beach / Restaurante','08039',NULL,NULL,180,0,'5762b458-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(88,'Vila i Vilà 65','Hiroshima theater','08004',NULL,NULL,130,0,'57e2ed12-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(89,'Gomis 34','GBC Business Center / Sala de formaciones','08023',200,30,20,0,'58a03674-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(90,'Carrer creu dels molers 19 ','La Vaca Coworking / Sótano','08004',NULL,70,150,0,'59342be0-574a-11eb-be04-acde48001122',NULL,1,1,0,NULL,208),(91,'Calle Galileu 254 Bajos 2','Sala de Reuniones','08028',NULL,10,6,0,'5a74a606-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(92,'Carrer de la Legalitat, 27,','Cooking Area','08024',NULL,NULL,20,0,'5b069908-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(93,'La Rambla 130','Canvas / Sala Combinada','08002',NULL,NULL,50,0,'5bc5b338-574a-11eb-be04-acde48001122',NULL,1,0,1,19,208),(94,'Passeig de Picasso, 26-30','K+K Hotel Picasso','08003',NULL,NULL,120,0,'5c569204-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(95,'Carrer de Sant Sever, 5','La Biblioteca','08002',500,60,20,0,'5cd4a1e4-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(96,'Carrer creu dels molers 19','La Vaca Coworking / Sala de reuniones','08004',NULL,25,10,0,'5dd3d06a-574a-11eb-be04-acde48001122',NULL,1,0,0,NULL,208),(97,'Cortines 23','COR23','08003',900,150,130,0,'5e64df9c-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(98,'Ramón Trias Fargas (acceso playa)','Icebarcelona','08005',NULL,NULL,80,0,'5f00cb78-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(99,'C/ Diputación, 211','Àtic Barcelona Terraza','08011',NULL,NULL,40,0,'5f854d08-574a-11eb-be04-acde48001122',NULL,1,1,0,19,208),(100,'Gran Via de les Corts Catalanes 672','CREC Coworking Eixample - Sala de reunión Moulin Rouge','08010',200,30,8,0,'60148770-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(101,'Albigesos, 25-27 Bajos','BEE TWO','08024',55,9,5,0,'60a7f71c-574a-11eb-be04-acde48001122',NULL,0,0,0,19,208),(102,'Verdi 98','YogaOne Verdi','08012',350,NULL,100,0,'6156e920-574a-11eb-be04-acde48001122',NULL,1,0,0,19,208),(103,'Carrer creu dels molers 19','La Vaca Coworking / Espacio Principal','08004',NULL,120,150,0,'620c2826-574a-11eb-be04-acde48001122',NULL,1,1,0,NULL,208),(104,'Carrer Bergara, 3','Belushi\'s Barcelona','08002',NULL,NULL,180,0,'62f8e9b8-574a-11eb-be04-acde48001122',NULL,1,0,1,19,208),(105,'Plaça Doctor Andreu, 2','Merbeyé / Terraza','08035',NULL,NULL,65,0,'63cd496a-574a-11eb-be04-acde48001122',NULL,0,1,1,19,208),(106,'Passatge Can Politic, 13, b L\'Hospitalet de Llobregat','The Garage of The Bass Valley','08907',NULL,NULL,350,0,'647d581e-574a-11eb-be04-acde48001122',NULL,1,1,1,21,208);
/*!40000 ALTER TABLE `api_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_usercomments`
--

DROP TABLE IF EXISTS `api_usercomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_usercomments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(1000) DEFAULT NULL,
  `date_time` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_usercomments_user_id_d18856f4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `api_usercomments_user_id_d18856f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_usercomments`
--

LOCK TABLES `api_usercomments` WRITE;
/*!40000 ALTER TABLE `api_usercomments` DISABLE KEYS */;
INSERT INTO `api_usercomments` VALUES (4,'let me be your funk','2021-03-12 21:59:17.559873',3),(5,'Im have funk but no guitar','2021-03-12 22:00:59.396820',3),(6,'funk piano','2021-03-12 22:45:32.272243',2),(7,'funky drums?','2021-03-12 22:47:22.404101',2),(8,'jazz flute?','2021-03-12 22:48:11.001741',2),(9,'jazz piano?','2021-03-12 22:48:27.913543',2),(10,'let me show you my funk!','2021-03-12 22:52:19.381884',2),(11,'I can drum!!!!!!','2021-03-12 22:56:10.651933',2),(12,'mainly on tables though','2021-03-12 22:56:46.718277',2),(13,'be my funk','2021-03-14 18:34:29.348569',2),(15,'where are you?','2021-03-14 18:40:21.953488',2),(16,'please be my friend','2021-03-14 18:46:51.740864',2),(17,'I sing jazz and soul but could always find some funk!','2021-03-14 19:27:02.028231',5),(18,'Guess who\'s cool enough to be in this band!','2021-03-15 00:50:26.595218',16),(19,'funk rapper?','2021-03-15 00:54:26.273812',16),(20,'Id be very keen to make some jam together whilst you play guitar','2021-03-15 01:02:49.706018',17),(21,'test','2021-03-19 19:35:36.771586',3),(22,'test','2021-03-19 19:50:29.074547',3),(23,'blip blop','2021-03-19 19:54:36.092483',3),(24,'glip glop','2021-03-19 21:00:17.843188',3),(25,'blip','2021-03-19 21:02:38.400518',2),(26,'blop','2021-03-19 21:09:49.980395',2),(27,'shlip','2021-03-19 21:43:30.398155',3),(28,'lefgn','2021-03-19 21:45:50.373210',3),(29,'shlipshlop','2021-03-19 22:02:08.179567',2),(30,'kkj','2021-03-19 22:12:05.931002',3),(31,'ghjk','2021-03-19 22:27:14.327871',3),(32,'1','2021-03-19 22:41:27.330015',3),(33,'jaaaaaam','2021-03-19 22:44:39.622827',19),(34,'2nd','2021-03-19 23:07:16.820459',2),(35,'3rd','2021-03-19 23:10:42.683727',20),(36,'last','2021-03-19 23:18:26.142490',21),(37,'blop','2021-03-19 23:47:25.120583',3),(38,'butterr','2021-03-20 01:25:39.725532',3),(39,'butter','2021-03-20 01:26:11.295212',35),(40,'butter!','2021-03-20 01:29:34.106909',35);
/*!40000 ALTER TABLE `api_usercomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_usereventsassoc`
--

DROP TABLE IF EXISTS `api_usereventsassoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_usereventsassoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_usereventsassoc_event_id_86316e20_fk_api_events_id` (`event_id`),
  KEY `api_usereventsassoc_user_id_32ebca34_fk_auth_user_id` (`user_id`),
  CONSTRAINT `api_usereventsassoc_event_id_86316e20_fk_api_events_id` FOREIGN KEY (`event_id`) REFERENCES `api_events` (`id`),
  CONSTRAINT `api_usereventsassoc_user_id_32ebca34_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_usereventsassoc`
--

LOCK TABLES `api_usereventsassoc` WRITE;
/*!40000 ALTER TABLE `api_usereventsassoc` DISABLE KEYS */;
INSERT INTO `api_usereventsassoc` VALUES (1,2,2,1),(2,2,3,2),(3,3,2,2),(4,3,2,2),(5,3,2,1),(6,3,2,1),(7,3,2,1),(8,6,2,1),(9,6,2,1),(10,6,2,1),(11,6,2,1),(12,6,2,1),(13,6,2,1),(14,6,2,1),(15,6,2,1),(16,6,2,1),(17,7,3,1),(18,7,3,2),(19,7,2,1),(20,7,2,1),(21,8,2,1),(22,8,2,1),(23,10,5,1),(24,10,5,1),(25,7,23,1),(26,7,23,1),(27,8,24,1),(28,8,24,1),(29,7,26,2),(30,8,27,2),(31,10,28,2),(32,7,29,2),(33,7,30,2),(34,7,31,2),(35,7,32,2),(36,7,33,1);
/*!40000 ALTER TABLE `api_usereventsassoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_userpostcommentsassoc`
--

DROP TABLE IF EXISTS `api_userpostcommentsassoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_userpostcommentsassoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_comment_id` int NOT NULL,
  `user_post_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_userpostcomments_user_post_id_ab715f50_fk_api_userp` (`user_post_id`),
  KEY `api_userpostcomments_user_comment_id_dd162fa4_fk_api_userc` (`user_comment_id`),
  CONSTRAINT `api_userpostcomments_user_comment_id_dd162fa4_fk_api_userc` FOREIGN KEY (`user_comment_id`) REFERENCES `api_usercomments` (`id`),
  CONSTRAINT `api_userpostcomments_user_post_id_ab715f50_fk_api_userp` FOREIGN KEY (`user_post_id`) REFERENCES `api_userposts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userpostcommentsassoc`
--

LOCK TABLES `api_userpostcommentsassoc` WRITE;
/*!40000 ALTER TABLE `api_userpostcommentsassoc` DISABLE KEYS */;
INSERT INTO `api_userpostcommentsassoc` VALUES (1,4,3),(2,5,3),(3,6,3),(4,7,3),(5,8,3),(6,9,3),(7,10,3),(8,11,5),(9,12,5),(10,13,3),(12,15,3),(13,16,5),(14,17,4),(15,18,7),(16,19,4),(17,20,6),(18,21,3),(19,22,5),(20,23,3),(21,24,7),(22,25,7),(23,26,7),(24,27,7),(25,28,7),(26,29,7),(27,30,7),(28,31,7),(29,32,5),(30,33,6),(31,34,7),(32,35,3),(33,36,3),(34,37,4),(35,38,6),(36,39,3),(37,40,8);
/*!40000 ALTER TABLE `api_userpostcommentsassoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_userposts`
--

DROP TABLE IF EXISTS `api_userposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_userposts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `date_time` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_userposts_user_id_6f798790_fk_auth_user_id` (`user_id`),
  KEY `api_userposts_city_id_011c899f_fk_api_cities_id` (`city_id`),
  CONSTRAINT `api_userposts_city_id_011c899f_fk_api_cities_id` FOREIGN KEY (`city_id`) REFERENCES `api_cities` (`id`),
  CONSTRAINT `api_userposts_user_id_6f798790_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userposts`
--

LOCK TABLES `api_userposts` WRITE;
/*!40000 ALTER TABLE `api_userposts` DISABLE KEYS */;
INSERT INTO `api_userposts` VALUES (3,'Looking for a funk bass','Were a band based in barcelona looking for a funk bassist to perform at a vue venues on here over the summer','2021-03-11 22:57:07.105118',2,19),(4,'Singer wanted','We do a mix of funk and soul and were looking for a singer to complement the group were currently a drummer, guitarist and a trumpet. Leave a comment if you wanna do some gigs','2021-03-11 22:58:41.958739',2,19),(5,'drummer wanted','im a bass guitarist looking for a drummer to jam with and hopeful start performing soon','2021-03-12 17:29:31.613309',3,19),(6,'Looking for people to jam with','Hey im in barcelona and am open to whoever wants to jam together im an acoustic guitarist.','2021-03-14 18:48:02.269041',2,19),(7,'School of rock band wanted','I pretended to be a teacher in a school and taught some kids how to play in a band long story short i went to prison for fraud and kidnapping but im looking to get back in the game.','2021-03-14 20:39:27.785341',14,19),(8,'i need butter','lets trade some butter i got jam and other stuff jam jam jam jam','2021-03-20 01:29:17.234398',35,19);
/*!40000 ALTER TABLE `api_userposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add API key',7,'add_apikey'),(26,'Can change API key',7,'change_apikey'),(27,'Can delete API key',7,'delete_apikey'),(28,'Can view API key',7,'view_apikey'),(29,'Can add cities',8,'add_cities'),(30,'Can change cities',8,'change_cities'),(31,'Can delete cities',8,'delete_cities'),(32,'Can view cities',8,'view_cities'),(33,'Can add countries',9,'add_countries'),(34,'Can change countries',9,'change_countries'),(35,'Can delete countries',9,'delete_countries'),(36,'Can view countries',9,'view_countries'),(37,'Can add location',10,'add_location'),(38,'Can change location',10,'change_location'),(39,'Can delete location',10,'delete_location'),(40,'Can view location',10,'view_location'),(41,'Can add events',11,'add_events'),(42,'Can change events',11,'change_events'),(43,'Can delete events',11,'delete_events'),(44,'Can view events',11,'view_events'),(45,'Can add countries_cities',12,'add_countries_cities'),(46,'Can change countries_cities',12,'change_countries_cities'),(47,'Can delete countries_cities',12,'delete_countries_cities'),(48,'Can view countries_cities',12,'view_countries_cities'),(49,'Can add guest user',13,'add_guestuser'),(50,'Can change guest user',13,'change_guestuser'),(51,'Can delete guest user',13,'delete_guestuser'),(52,'Can view guest user',13,'view_guestuser'),(53,'Can add user events assoc',14,'add_usereventsassoc'),(54,'Can change user events assoc',14,'change_usereventsassoc'),(55,'Can delete user events assoc',14,'delete_usereventsassoc'),(56,'Can view user events assoc',14,'view_usereventsassoc'),(57,'Can add countries cities',12,'add_countriescities'),(58,'Can change countries cities',12,'change_countriescities'),(59,'Can delete countries cities',12,'delete_countriescities'),(60,'Can view countries cities',12,'view_countriescities'),(61,'Can add user post comments assoc',15,'add_userpostcommentsassoc'),(62,'Can change user post comments assoc',15,'change_userpostcommentsassoc'),(63,'Can delete user post comments assoc',15,'delete_userpostcommentsassoc'),(64,'Can view user post comments assoc',15,'view_userpostcommentsassoc'),(65,'Can add user comments',16,'add_usercomments'),(66,'Can change user comments',16,'change_usercomments'),(67,'Can delete user comments',16,'delete_usercomments'),(68,'Can view user comments',16,'view_usercomments'),(69,'Can add user posts',17,'add_userposts'),(70,'Can change user posts',17,'change_userposts'),(71,'Can delete user posts',17,'delete_userposts'),(72,'Can view user posts',17,'view_userposts');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$qwGI7f7GFiOS$6AU3UrB88DXAddKSyviGc8rjR6vTf+tj76xEg0ujqio=','2021-03-10 20:38:48.557571',1,'gideonspektor','','','',1,1,'2021-01-18 15:27:04.954677'),(2,'pbkdf2_sha256$216000$EmsgEvbQ6Fs3$9fmxaLnSDljCqiEkos20yVdK9M/6QlHbwYLEhEhoZmI=',NULL,0,'gidspektor@gmail.com','gideon','spektor','gidspektor@gmail.com',0,1,'2021-02-08 10:37:15.483099'),(3,'pbkdf2_sha256$216000$qYVfNN8QDxyl$Az3XqYWw1TIrZCTlvDwPhdjIg4W4EIexb3U0/t6Wh1I=',NULL,0,'test@gmail.com','test','testerson','test@gmail.com',0,1,'2021-02-17 12:53:58.956980'),(4,'pbkdf2_sha256$216000$za0AdrsUchDq$jTmkmtVnTy/tCAkMopxLOE52XhTjVEVSIaptJzccA8E=',NULL,0,'testerman@gmail.com','senior','testerman','testerman@gmail.com',0,1,'2021-03-14 19:21:48.944821'),(5,'pbkdf2_sha256$216000$wkUocas4aMC0$o0zr8woL7icOiODFPiSW3Bg0ajpKba9n/YmY31b6QGY=',NULL,0,'testerlady@gmail.com','madam','tester','testerlady@gmail.com',0,1,'2021-03-14 19:24:44.995005'),(6,'pbkdf2_sha256$216000$lemqnV0dZSNy$Vn66ZQpEWbvbYGDjVOJY742DAH3AORlEdKGcBMlKg8E=',NULL,0,'john@gmail.com','john','pendleton','john@gmail.com',0,1,'2021-03-14 19:41:33.054774'),(7,'pbkdf2_sha256$216000$607Q0EChyJAd$ZbpXBbGUp9pYZBi+jb1quT5ADu1BcM7oFCeRZXpHBSo=',NULL,0,'sneibly@gmail.com','john','sneibly','sneibly@gmail.com',0,1,'2021-03-14 19:42:51.808933'),(8,'pbkdf2_sha256$216000$CtDoVMcGNnjJ$laBCEb9hbRVkEEiWXZxMTQS1TUvS4yO3K/CjM6IKcCI=',NULL,0,'poop@gmail.com','poop','pooperson','poop@gmail.com',0,1,'2021-03-14 20:16:25.112444'),(9,'pbkdf2_sha256$216000$X1P80ClawVyz$GkrKSXA7t6Zeu75Gf3WlnIuONQb+5BUoLHs613tJoRs=',NULL,0,'senior@gmail.com','senior','poop','senior@gmail.com',0,1,'2021-03-14 20:18:23.610188'),(10,'pbkdf2_sha256$216000$nnwUPY8Z4jil$SCEmFuB8rhRj6XPRSuY818kSIQq6k1m50GdvXX29vAU=',NULL,0,'senior1@gmail.com','senior','poop','senior1@gmail.com',0,1,'2021-03-14 20:19:16.833331'),(11,'pbkdf2_sha256$216000$XAC3NkFGvbBG$NjogbaJpgj3z6oo1ycqJZG77/1IEPFIz6o+YmWLGvL0=',NULL,0,'butt@gmail.com','senior','butt','butt@gmail.com',0,1,'2021-03-14 20:21:17.494660'),(12,'pbkdf2_sha256$216000$RELbAsSutkdt$Ad+qKB9ZEPbqugNeynoV+EzYqmpz4LpvQvXDjjdvcs4=',NULL,0,'bigbutts@gmail.com','but','man','bigbutts@gmail.com',0,1,'2021-03-14 20:22:24.661382'),(13,'pbkdf2_sha256$216000$wvluN00eOeYe$VFH4BzUtVq8iryzwLwdb3UU15YXlW23jk7MeGMeavqA=',NULL,0,'bigbutt@gmail.com','big','butt','bigbutt@gmail.com',0,1,'2021-03-14 20:23:30.716856'),(14,'pbkdf2_sha256$216000$dEcVDCbkiDuG$xpQdT8t5YvHDDm2MzZWId00OXXzUPbHUCy8ReTARca8=',NULL,0,'snoo@gmail.com','sneibly','man','snoo@gmail.com',0,1,'2021-03-14 20:36:53.013381'),(15,'pbkdf2_sha256$216000$BJt2CasfcEuU$GyCK80AzEKtoJcHyD43bwEPypXfC3+8UFI1KWIWgyIE=',NULL,0,'lawrence@gmail.com','lawrence','sneibly','lawrence@gmail.com',0,1,'2021-03-15 00:48:13.557479'),(16,'pbkdf2_sha256$216000$youBHn5moNKo$E+Sx+LEjQ68Tv5b8vR3i+hgzkUWdR3QaLlfcEirdZJk=',NULL,0,'ldog@gmail.com','Lawrence','sneibly','ldog@gmail.com',0,1,'2021-03-15 00:49:48.273860'),(17,'pbkdf2_sha256$216000$oHqsDDJIw0NX$VdbY4VVM2XGnfdofdoueaJL/vC2Qa+7BDQ12Jzq4KGI=',NULL,0,'kwest@gmail.com','kayne','west','kwest@gmail.com',0,1,'2021-03-15 00:54:25.922399'),(18,'pbkdf2_sha256$216000$sCWP0fr8Rlbb$k2CD20qnc0+UCHsNcLaeVHa2Y2ekqS7Mjm2ePSfLZXw=',NULL,0,'mdog@gmail.com','Mildred','lady','mdog@gmail.com',0,1,'2021-03-15 01:02:49.338634'),(19,'pbkdf2_sha256$216000$Ns6n9SlTKbmN$N7RT9/VdRpIZ1B2PWgrG5Hwxl6msY04eCgx44IHxuuM=',NULL,0,'p@aol.com','pie','man','p@aol.com',0,1,'2021-03-19 22:44:37.362039'),(20,'pbkdf2_sha256$216000$rWLQW731MLiI$D2y0VyVIhEtOyOH2sv2q3yrbYNtAI8i0uv89luKybng=',NULL,0,'b@a.com','blip','blop','b@a.com',0,1,'2021-03-19 23:10:41.508289'),(21,'pbkdf2_sha256$216000$D9dnWhpb7iDp$YxYPyRk8d5SttuakjhF7de5QmHShlEYg3XbYxYpHNIU=',NULL,0,'kj@aol.com','jip','jop','kj@aol.com',0,1,'2021-03-19 23:18:24.980020'),(22,'pbkdf2_sha256$216000$IS6c7js1dqrQ$YSngSIbxBVDKsNUAM3tokWcRV7iwpInT+/sQxFVeB14=',NULL,0,'b@aol.com','blop','b','b@aol.com',0,1,'2021-03-20 00:24:22.728818'),(23,'pbkdf2_sha256$216000$xaesW6ny30S6$qA0paDtfC3CdCFi6XG+EFPKz7N+SlIzTU2qQ+jzxgHk=',NULL,0,'c@aol.com','carl','blop','c@aol.com',0,1,'2021-03-20 00:26:22.731338'),(24,'pbkdf2_sha256$216000$lphnH6hrF7N3$A3/ef5yqspsBNiwFRLUBW4skz0noU+rLU8xECHSkbBY=',NULL,0,'pam@aol.com','pam','sam','pam@aol.com',0,1,'2021-03-20 00:30:42.629808'),(25,'pbkdf2_sha256$216000$L1gjAb9H9XBX$DlKNLIu0BYiLuBhhbzOTNkGvehq1C8x1G2Gg/IOP8gQ=',NULL,0,'cas@aol.com','cunt','face','cas@aol.com',0,1,'2021-03-20 00:31:56.572651'),(26,'pbkdf2_sha256$216000$Pf7gjgzwpsln$vkOeBSJz9EVJhVXxIwhONO+H76T+TdWWYcHrAdXSx4M=',NULL,0,'789h@gmail.com','poop','nbutt','789h@gmail.com',0,1,'2021-03-20 00:33:26.623263'),(27,'pbkdf2_sha256$216000$czDKBWMCmLHX$cuVDaH4ZM88Dfoq27mq/qAMzftRplKAJeX+Kqi8ZQ/I=',NULL,0,'pdiddy@aol.com','p','diddy','pdiddy@aol.com',0,1,'2021-03-20 00:35:26.387911'),(28,'pbkdf2_sha256$216000$AVzL4B5hP7lQ$yJY/U8DNH/3Wl3eOdr7cSPSbgzSek0V2XNx2dxUXWEo=',NULL,0,'snek@aol.com','john','snek','snek@aol.com',0,1,'2021-03-20 00:36:53.075149'),(29,'pbkdf2_sha256$216000$5dRqAbvU9X2W$naK5JjxH80bTiJAphe+PpGyXPr/Azdybe05cIJB/Jpc=',NULL,0,'bob@aolc.com','bob','sn','bob@aolc.com',0,1,'2021-03-20 00:39:39.076808'),(30,'pbkdf2_sha256$216000$Tof7fUfbyakR$kGWHP1HlzX1RJttgBfPTyA/Yt/0Ch1+WPC5ubj3Pde0=',NULL,0,'posh@aol.com','sno','p','posh@aol.com',0,1,'2021-03-20 00:41:42.559783'),(31,'pbkdf2_sha256$216000$q3p1gDa0OJEk$XhfEkdu2MmMCmCTnZVvgh9Pg/BIexQpW5gqsGTpUeJk=',NULL,0,'dcik@aol.com','prick','dick','dcik@aol.com',0,1,'2021-03-20 00:43:19.924969'),(32,'pbkdf2_sha256$216000$XuIORaKYf6zw$OG78cT4EhqTqY8D2C5YiHJzTsb0H/+vokvGIep0BKd4=',NULL,0,'pfaceepoop@aol.com','poop','face','pfaceepoop@aol.com',0,1,'2021-03-20 01:16:05.404647'),(33,'pbkdf2_sha256$216000$30nnVGjtufKb$PYjnMTBcwpGjfpHcMdZBiKyFzlgy5KPrbP6HvSsE/Vs=',NULL,0,'ghdjkd@gmail.com','gideon','spektor','ghdjkd@gmail.com',0,1,'2021-03-20 01:17:57.675444'),(34,'pbkdf2_sha256$216000$29J8GcawBVO9$9+n94w7vGbNPzE8POudR2aIo2ecnMje9pnkZGajgHgk=',NULL,0,'padf@aol.com','poop','man','padf@aol.com',0,1,'2021-03-20 01:25:05.972496'),(35,'pbkdf2_sha256$216000$8xboxFaCOLeM$zfbMRSD4DFogLYdspEjC/Yt8iYL95sZ/rYg9938W1Nk=',NULL,0,'bsf@aol.com','butter','man','bsf@aol.com',0,1,'2021-03-20 01:26:11.001384'),(36,'pbkdf2_sha256$216000$LkhUj3R85Ver$kr8cUmyR1eqQ9s1h13LX909QgHcpKuSnN/i9ySskO+Y=',NULL,0,'6789@aol.com','poo','face','6789@aol.com',0,1,'2021-03-20 02:29:09.114907');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-01-18 15:41:47.974628','106','The Garage of The Bass Valley',2,'[{\"changed\": {\"fields\": [\"City\"]}}]',10,1),(2,'2021-01-18 15:41:55.951416','106','The Garage of The Bass Valley',2,'[]',10,1),(3,'2021-01-18 15:54:11.593787','2','Basement29 Club / 2021-01-29 20:00:00+00:00',1,'[{\"added\": {}}]',11,1),(4,'2021-01-18 16:12:26.152495','3','Espacio para eventos con terraza / 2021-01-30 22:00:00+00:00',1,'[{\"added\": {}}]',11,1),(5,'2021-01-18 16:17:40.530124','4','innovapark / 2021-01-28 19:00:00+00:00',1,'[{\"added\": {}}]',11,1),(6,'2021-01-18 17:17:36.144323','VRLGBfl9.pbkdf2_sha256$216000$FOYtum3asHSM$9kLZjBacyy72IWXLkUzN72DBxOe+7gGR0QtxucvOh1w=','events',1,'[{\"added\": {}}]',7,1),(7,'2021-01-18 17:40:11.716528','VRLGBfl9.pbkdf2_sha256$216000$FOYtum3asHSM$9kLZjBacyy72IWXLkUzN72DBxOe+7gGR0QtxucvOh1w=','events',3,'',7,1),(8,'2021-01-18 17:40:31.078635','hE8LjPWB.pbkdf2_sha256$216000$2ADFezSJF0ga$AgEPNgYbsX3dchH1LcfXvOPqZJuwkvJkXvS1vURi6d0=','events',1,'[{\"added\": {}}]',7,1),(9,'2021-01-18 20:46:46.949911','4','innovapark / 2021-01-28 19:00:00+00:00',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(10,'2021-01-18 20:46:58.723738','3','Espacio para eventos con terraza / 2021-01-30 22:00:00+00:00',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(11,'2021-01-18 20:50:31.419810','2','Basement29 Club / 2021-01-29 20:00:00+00:00',2,'[{\"changed\": {\"fields\": [\"Description\", \"Name\"]}}]',11,1),(12,'2021-01-18 20:52:10.501071','12','innovapark',2,'[{\"changed\": {\"fields\": [\"City\"]}}]',10,1),(13,'2021-01-18 20:53:49.706099','12','innovapark',2,'[{\"changed\": {\"fields\": [\"City\"]}}]',10,1),(14,'2021-01-29 19:47:08.619470','4','innovapark / 2021-01-28 19:00:00+00:00',2,'[{\"changed\": {\"fields\": [\"Show\"]}}]',11,1),(15,'2021-01-29 19:48:21.124127','5','La Biblioteca / 2021-02-05 20:00:00+00:00',1,'[{\"added\": {}}]',11,1),(16,'2021-02-03 19:18:51.133337','6','Espacio Casa Rita / 2021-02-02 00:00:00+00:00',1,'[{\"added\": {}}]',11,1),(17,'2021-03-10 20:40:27.985793','7','Golden Studio / Apartment / 2021-10-29 22:00:00+00:00',1,'[{\"added\": {}}]',11,1),(18,'2021-03-10 23:26:24.958191','8','Espacio para eventos con terraza / 2021-12-10 22:00:00+00:00',1,'[{\"added\": {}}]',11,1),(19,'2021-03-11 00:05:37.486351','9','InGracia / Sala Soho / 2022-03-10 20:00:00+00:00',1,'[{\"added\": {}}]',11,1),(20,'2021-03-14 19:14:51.295184','10','La Clandestina / 2021-12-22 20:00:00+00:00',1,'[{\"added\": {}}]',11,1),(21,'2021-03-14 19:17:02.922017','11','HONEYBEES / 2021-11-20 22:00:00+00:00',1,'[{\"added\": {}}]',11,1),(22,'2021-03-14 19:18:00.910714','11','Auditorio MGS / 2021-11-20 22:00:00+00:00',2,'[{\"changed\": {\"fields\": [\"Location\"]}}]',11,1),(23,'2021-03-14 19:18:24.322679','11','Stilus / 2021-11-20 22:00:00+00:00',2,'[{\"changed\": {\"fields\": [\"Location\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(8,'api','cities'),(9,'api','countries'),(12,'api','countriescities'),(11,'api','events'),(13,'api','guestuser'),(10,'api','location'),(16,'api','usercomments'),(14,'api','usereventsassoc'),(15,'api','userpostcommentsassoc'),(17,'api','userposts'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'rest_framework_api_key','apikey'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-01-15 15:47:48.902371'),(2,'auth','0001_initial','2021-01-15 15:47:48.978705'),(3,'admin','0001_initial','2021-01-15 15:47:49.127244'),(4,'admin','0002_logentry_remove_auto_add','2021-01-15 15:47:49.172571'),(5,'admin','0003_logentry_add_action_flag_choices','2021-01-15 15:47:49.180609'),(6,'api','0001_initial','2021-01-15 15:47:49.230586'),(7,'contenttypes','0002_remove_content_type_name','2021-01-15 15:47:49.332269'),(8,'auth','0002_alter_permission_name_max_length','2021-01-15 15:47:49.358125'),(9,'auth','0003_alter_user_email_max_length','2021-01-15 15:47:49.375799'),(10,'auth','0004_alter_user_username_opts','2021-01-15 15:47:49.382729'),(11,'auth','0005_alter_user_last_login_null','2021-01-15 15:47:49.408034'),(12,'auth','0006_require_contenttypes_0002','2021-01-15 15:47:49.409786'),(13,'auth','0007_alter_validators_add_error_messages','2021-01-15 15:47:49.419973'),(14,'auth','0008_alter_user_username_max_length','2021-01-15 15:47:49.452412'),(15,'auth','0009_alter_user_last_name_max_length','2021-01-15 15:47:49.480465'),(16,'auth','0010_alter_group_name_max_length','2021-01-15 15:47:49.495509'),(17,'auth','0011_update_proxy_permissions','2021-01-15 15:47:49.505080'),(18,'auth','0012_alter_user_first_name_max_length','2021-01-15 15:47:49.534058'),(19,'rest_framework_api_key','0001_initial','2021-01-15 15:47:49.544268'),(20,'rest_framework_api_key','0002_auto_20190529_2243','2021-01-15 15:47:49.560852'),(21,'rest_framework_api_key','0003_auto_20190623_1952','2021-01-15 15:47:49.563688'),(22,'rest_framework_api_key','0004_prefix_hashed_key','2021-01-15 15:47:49.618878'),(23,'sessions','0001_initial','2021-01-15 15:47:49.627815'),(24,'api','0002_auto_20210115_1657','2021-01-15 16:57:07.302960'),(25,'api','0003_auto_20210118_1541','2021-01-18 15:41:40.413751'),(26,'api','0004_events_name','2021-01-18 20:45:57.430885'),(27,'api','0005_events_show','2021-01-20 11:20:21.387434'),(28,'api','0006_countries_cities','2021-01-20 11:20:21.410214'),(29,'api','0007_auto_20210120_1915','2021-01-20 19:15:44.604997'),(30,'api','0008_auto_20210120_1932','2021-01-20 19:32:12.708481'),(31,'api','0009_guestuser','2021-03-07 02:00:15.136102'),(32,'api','0010_auto_20210308_0123','2021-03-08 01:23:14.042354'),(33,'api','0011_auto_20210308_0219','2021-03-08 02:19:21.520589'),(34,'api','0012_events_sold_out','2021-03-08 03:05:53.846371'),(35,'api','0013_events_tickets_bought','2021-03-08 20:12:50.990930'),(36,'api','0014_usercomments_userpostcommentsassoc_userposts','2021-03-11 16:48:02.114479'),(37,'api','0015_auto_20210311_2242','2021-03-11 22:42:09.649974'),(38,'api','0016_auto_20210312_2052','2021-03-12 20:52:05.341770'),(39,'api','0017_auto_20210312_2111','2021-03-12 21:11:06.656780');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5mszweufopc9rurwgiacr1iwn1rso84a','.eJxVjDsOwjAQBe_iGllee-3YlPQ5g7XrDw6gRMqnQtydREoB7ZuZ9xaRtrXFbSlzHLK4ChCX340pPct4gPyg8T7JNI3rPLA8FHnSRfZTLq_b6f4dNFraXhsOQduAYEyHhM76oJLuFFcihQxQPVZblNkRKme09ZUY2CEgQmXx-QKl6DZx:1l1WS3:5QZ-pxFVpz9QaFn3hovgHryrOPlHohFQ50fMrl8GJ8Y','2021-02-01 15:28:19.447119'),('aay36hqtbcgg3gy2um0cadl07x15ayju','.eJxVjDsOwjAQBe_iGllee-3YlPQ5g7XrDw6gRMqnQtydREoB7ZuZ9xaRtrXFbSlzHLK4ChCX340pPct4gPyg8T7JNI3rPLA8FHnSRfZTLq_b6f4dNFraXhsOQduAYEyHhM76oJLuFFcihQxQPVZblNkRKme09ZUY2CEgQmXx-QKl6DZx:1lIe22:XrPWntKtDp3DYvCsb78JeQrrq4fBGzxcm2zzknU7x4E','2021-03-20 21:00:14.677275'),('gjt69ghtb19r3ltr2ime8p10xw8uvcin','.eJxVjDsOwjAQBe_iGllee-3YlPQ5g7XrDw6gRMqnQtydREoB7ZuZ9xaRtrXFbSlzHLK4ChCX340pPct4gPyg8T7JNI3rPLA8FHnSRfZTLq_b6f4dNFraXhsOQduAYEyHhM76oJLuFFcihQxQPVZblNkRKme09ZUY2CEgQmXx-QKl6DZx:1lK5bU:FTRsvMeJw4HEVl7BFc3_rE7Irj_HPP--JA5pkevQigI','2021-03-24 20:38:48.572732'),('yh2gk1qks7eiluzz7p7a7vnct2nrshmk','.eJxVjDsOwjAQBe_iGllee-3YlPQ5g7XrDw6gRMqnQtydREoB7ZuZ9xaRtrXFbSlzHLK4ChCX340pPct4gPyg8T7JNI3rPLA8FHnSRfZTLq_b6f4dNFraXhsOQduAYEyHhM76oJLuFFcihQxQPVZblNkRKme09ZUY2CEgQmXx-QKl6DZx:1l5ZiT:9Csw1nlZY9fEzGoYJogFsGxYL2SgL9em4imnBjAyzag','2021-02-12 19:46:01.056743');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rest_framework_api_key_apikey`
--

DROP TABLE IF EXISTS `rest_framework_api_key_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rest_framework_api_key_apikey` (
  `id` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `hashed_key` varchar(100) NOT NULL,
  `prefix` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`),
  KEY `rest_framework_api_key_apikey_created_c61872d9` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rest_framework_api_key_apikey`
--

LOCK TABLES `rest_framework_api_key_apikey` WRITE;
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` DISABLE KEYS */;
INSERT INTO `rest_framework_api_key_apikey` VALUES ('hE8LjPWB.pbkdf2_sha256$216000$2ADFezSJF0ga$AgEPNgYbsX3dchH1LcfXvOPqZJuwkvJkXvS1vURi6d0=','2021-01-18 17:40:31.077873','events',0,'2021-05-31 00:00:00.000000','pbkdf2_sha256$216000$2ADFezSJF0ga$AgEPNgYbsX3dchH1LcfXvOPqZJuwkvJkXvS1vURi6d0=','hE8LjPWB');
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-20 10:25:35
