/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	10.6.22-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `facts`
--

DROP TABLE IF EXISTS `facts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `facts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `source` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facts`
--

LOCK TABLES `facts` WRITE;
/*!40000 ALTER TABLE `facts` DISABLE KEYS */;
INSERT INTO `facts` VALUES (1,'If you have medical expenses that you can\'t pay, you can appeal to the US Department of Health and Human Services for financial aid.','benefits.gov','https://www.benefits.gov/benefit-finder'),(2,'A quick-and-dirty heat radiator can be made using a clay pot and a few candles.','Prepping Planet','https://preppingplanet.com/how-to-heat-a-room-with-a-candle/'),(3,'The vast majority of commercial coin-operated laundry machines can be opened with the same 3 key models from Greenwald industries.','Reddit','https://www.reddit.com/r/UnethicalLifeProTips/comments/15y7k4r/ulpt_the_vast_majority_of_commercial_coinoperated/'),(4,'Many banks offer what is called a Money Market account as an alternative to traditional savings accounts; these typically have higher interest rates, and thus, higher yields.','Forbes','https://www.forbes.com/advisor/banking/money-market-account/what-is-a-money-market-account/'),(5,'DefCon isn\'t actually cancelled; and no, there is no Black Badge raffle.','Personal Experience','https://www.wired.com/story/defcon-is-canceled/'),(6,'Used public goods are often auctioned off for cheap.','Public Surplus','https://www.publicsurplus.com/sms/browse/home'),(7,'You can use a password manager to generate long, complex, random passwords for all of your online accounts, without needing to remember any of them.','Wikipedia','https://en.wikipedia.org/wiki/List_of_password_managers'),(8,'If you want to stay warm in a wet environment, wear wool or synthetic layers; remember, cotton kills.','section hiker','https://sectionhiker.com/why-does-cotton-kill/'),(9,'Two dropped objects of the same shape and size will fall at the same speed, regardless of weight.','Isaac Newton / Galileo Galilei','https://physics-network.org/what-is-galileos-theory-of-falling-bodies/'),(10,'You are enough.','',''),(11,'William Howard Taft is the only Supreme Court justice to become president of the United States','Wikipedia','https://en.wikipedia.org/wiki/Taft_Court'),(12,'Curious about the common practices and effects of Hormone Replacement Therapy (HRT)? Check out the DIY HRT directory. (NOTE: This resource should NOT be substituted for professional medical advice)','DIY HRT','https://diyhrt.wiki/index'),(13,'Learning morse code is easy, actually!','Google','https://morse.withgoogle.com/learn/'),(14,'Lift heavy objects with your legs, not your back.','Every manual laborer ever','https://breakingmuscle.com/why-you-lift-with-your-legs-not-your-back/'),(15,'You don\'t have to floss all of your teeth, only the ones you want to keep.','Every dental hygienist ever','https://www.healthline.com/health/benefits-of-flossing'),(16,'Every gun is always loaded.','The four rules of firearm safety','https://www.nssf.org/articles/4-primary-rules-of-firearm-safety/'),(17,'If you back up your Skilsaw while it\'s still running, it will come back to you faster than you wanted.','Skil Saw Safety','https://assets-global.website-files.com/6062403b2ddb897f75cce854/622e7384c75c224363115f19_Skill-Saw-Safe-use-Policy_1_.pdf'),(18,'The internet has a nearly limitless supply of free information. You can learn how to fix a car, how to code, CPR, a new language, what the best movies ever made are. What are you waiting for?','here','https://www.google.com/'),(19,'Community college tuition averages at about 1/10th of the cost of a traditional university; this coupled with high transfer admission rates to higher universities make it a much cheaper path to a Bachelor\'s degree in the United States.','NSHSS','https://www.nshss.org/resources/blog/blog-posts/community-college-vs-university-pros-and-cons-of-cost-class-size-and-student-experience/');
/*!40000 ALTER TABLE `facts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-03 18:19:00
