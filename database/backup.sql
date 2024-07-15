/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `artist` varchar(80) DEFAULT NULL,
  `genre` varchar(40) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Se Bueno','TURQUOISEDEATH','Shoegaze, Atmospheric Drum & Bass','https://www.youtube.com/watch?v=PadJz4o_jUM','A beautiful experimental mixture of sampled music, ambience, shoegaze rock to invoke a brief moment of calming blue. Featuring several heavy hitters that make this album spread its wings (Astrophysics, 2 0 2 1, BrokenTeeth, Prannoul and Asian Glow).'),(2,'Elysium','FlowerBoyDeMii','Atmospheric Drum & Bass','https://www.youtube.com/watch?v=tGXleMureBs','Essential listening for early 2020s drum & bass, uses the Jungle inspiration extremely well. Featuring more heavy hitters from the sampled music scene (IX Fall$, optic core, Egofear, TURQUOISEDEATH, llwll). May 20th is a special day.'),(3,'In Rainbows','Radiohead','Alternative Rock','https://www.youtube.com/watch?v=bgsmr7t8zGE&list=PL90uWKIpHUob7f4raEOR_n1i_isnMyE5V','I just really like the music.');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `artist` varchar(80) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `filename` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'The Norwood Suite Main Theme','Cosmo D',NULL,'https://www.youtube.com/watch?v=BajS3cugInY','TheNorwoodSuiteOSTMainTheme.mp3'),(2,'Violet Water','comfort._',NULL,'https://youtu.be/YZht21PH-eM','violetwater.mp3'),(3,'Crawl Space','TURQUOISEDEATH',1,'https://www.youtube.com/watch?v=fZMsw0A7MKI','CrawlSpace.mp3'),(4,'star queen yuuki','FlowerBoyDeMii',2,'https://www.youtube.com/watch?v=UQ0cslo9bZI','StarQueenYuuki.mp3'),(5,'Jigsaw Falling Into Place','Radiohead',3,'https://www.youtube.com/watch?v=TR2HPSjcJ7I','JigsawFallingIntoPlace.mp3'),(6,'After Dark','Mr. Kitty',NULL,'https://www.youtube.com/watch?v=sVx1mJDeUjY','AfterDark.mp3'),(7,'Sea, Swallow Me','Cocteau Twins',NULL,'https://www.youtube.com/watch?v=1uWbEe7U3ZY','SeaSwallowMe.mp3'),(8,'End of Small Sanctuary','Akira Yamaoka',NULL,'https://www.youtube.com/watch?v=cADH06lKVNA','EndOfSmallSanctuary.mp3'),(9,'Hopelessness','Sewerslvt',NULL,'https://www.youtube.com/watch?v=GSk8wjK8nyY','Hopelessness.mp3'),(10,'Unsaid Warning','T.H.C.',NULL,'https://www.youtube.com/watch?v=6xODEKgCJ38','UnsaidWarning.mp3'),(11,'Soft Goth','Astrophysics',NULL,'https://www.youtube.com/watch?v=xKV0ouSapqI','SoftGoth.mp3'),(12,'Beach Walk','Whitewoods',NULL,'https://www.youtube.com/watch?v=oF9yHO-UUws','BeachWalk.mp3'),(13,'My Time','Bo En',NULL,'https://www.youtube.com/watch?v=OkMLYNWP-yo','MyTime.mp3'),(14,'Ya No Hay Verano','Depresión Sonora & Astrophysics',NULL,'https://www.youtube.com/watch?v=8oCrWOyLsWE','YaNoHayVeranoAstrophysicsRemake.mp3'),(15,'Bloodhail','Have a Nice Life',NULL,'https://www.youtube.com/watch?v=sXyRAsBp998','Bloodhail.mp3'),(16,'Make It Forever','George Clanton',NULL,'https://www.youtube.com/watch?v=cLYs4gxVimQ','MakeItForever.mp3'),(17,'Blackbox Life Recorder 21f','Aphex Twin',NULL,'https://www.youtube.com/watch?v=e_Ue_P7vcRE','BlackboxLifeRecorder21f.mp3'),(18,'Comfort Chain','Instupendo',NULL,'https://www.youtube.com/watch?v=8b-WwN4H7lE','ComfortChain.mp3'),(19,'Dear Alice','Arai Tatsuku',NULL,'https://www.youtube.com/watch?v=gsPgVTO8D68','DearAlice.mp3'),(20,'Bollywood Apologetics','Black Wing',NULL,'https://www.youtube.com/watch?v=9S4VSZdxRh0','BollywoodApologetics.mp3'),(21,'Frankie M','Swans',NULL,'https://www.youtube.com/watch?v=w1I8JJXq1kY','FrankieM.mp3'),(22,'dreamcore','Yandere',NULL,'https://www.youtube.com/watch?v=I81aoHiDzyo','Dreamcore.mp3'),(23,'B With XTC','Harmful Logic & DJ Kuroneko',NULL,'https://www.youtube.com/watch?v=EQ5JvrAaq9o','xtc.mp3'),(24,'Fleeting Frozen Heart','Xxtarlit⚸',NULL,'https://www.youtube.com/watch?v=nGd4ZcR7Qh8','FleetingFrozenHeart.mp3'),(25,'Nhk!?','Goreshit',NULL,'https://www.youtube.com/watch?v=DOTFVhfDBCk','nhk.mp3'),(26,'Shihandu Takenu Des','Rory in early 20s',NULL,'https://www.youtube.com/watch?v=7AFPNtupKgI','ShihanduTakenuDes.mp3');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-14 23:24:52
