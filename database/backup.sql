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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'omgzip','OMGzip','2024-07-19 22:26:06','# OMGzip\n## OMG, it\'s a .zip! \n> solves: 79  \n> points: 56  \n> challenge file(s): [omgzip](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/omgzip), [data.tar.omgzip](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/data.tar.omgzip)  \n> solution file(s): [decompressor.py](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/decompressor.py)  \n> original challenge github: https://github.com/Nautilus-Institute/quals-2023/tree/main/omgzip  \n\ndata.tar.omgzip is a .tar file compressed using a custom compression program called omgzip. The Python source code for omgzip is provided, so all you need to do is reverse the logic of the program and write your own decompression program.\n\nFrom the creator:  \n\"The original version of this challenge was pretty trivially solvable by ChatGPT, so I made it more difficult before its release and added a bunch of random comments and changed a bunch of variable names to make doing that take more time. We\'ll see if I was successful or not.\"\n\nThe source code is pretty funny to read through. All the comments are basically worthless, and the creator even makes use of confusing naming conventions and data types (i.e. `idx += True`) in order to throw off any kind of LLM trying to understand the code logic automatically. Regardless, any human with a decent amount of programming experience shouldn\'t be thrown off by this as long as they examine the logic of the code itself, it\'s not overly complicated.\n\nOverall, the compression can be broken down into two steps. First, the compress() function is called, which looks for repeated concurrent bytes in the file and groups them together with a count. This can be reversed with some simple if/else logic, which I\'ve done in uncompress_part1(). The second step calls the encode() method from a Deflator class on the file bytes, which is a bit more complicated.\n\nTo understand this second step, you first need to understand the data structure defined by the Family class. For those familiar with data structures, this is a [binary tree](https://www.geeksforgeeks.org/binary-tree-data-structure/) implementation. Each node contains an int of data and pointers to its parent and two children. This data structure is used by the Deflater class to map common bytes to shorter bit arrays, which I\'ll get into later.\n\nWhen an object of the Deflater class is created, a complete binary tree of depth 8 is created and stored in self.money (see \"[Types of binary trees](https://en.wikipedia.org/wiki/Binary_tree)\"). Each node of the binary tree at depth 8 contains a number. Since the tree is 8 layers deep, there are 256 total nodes at the 8th layer, because 2^8 = 256. The nodes store incremental numbers from \"right\" to \"left\", starting with 0 in the rightmost node and ending with 255 in the leftmost. For purposes of visualizing the graph, I\'m speaking as if the \"successful_firstborn\" child is on the right side of the parent, and the \"conflicted_stepchild\" child is on the left side. Pointers to each of these layer 8 nodes are also stored in self.dictionary, from right (at index \"0\") to left (at index \"255\").\n\nIn case your head is spinning, here\'s a [visual aid](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/bintree.jpg). Luckily you wont have to reverse this setup step; setting up the binary tree will be exactly the same for decompression.\n\nMoving on to the encode() method. This method runs _travesty() on each individual byte of the file. _travesty() plugs this byte into self.dictionary in order to get one of the binary tree nodes at layer 8. From this node, it then travels up the levels of the tree, writing a single bit of data for each layer travelled. If the child node is on the left side of the parent, a 1 is written, and if on the right, a 0 is written. The first time _travesty() is run, this simply writes the binary representation of the input byte, because of the way the tree was set up. Take 0x00 for example. The tree is 8 layers deep, and numbers are ordered from lowest to highest left -> right. 0x00 is on the farthest right node and is on the right side of every parent, so traversing the tree upwards produces 00000000. These bits are then added to the output array in big-endian format (most significant bit on the left), and then _magic() function is called on the starting layer 8 node before returning.\n\nIf the _magic() function wasn\'t called, each call to _travesty() would output the exact byte that was put in, as described above. However, _magic() performs a bit of scrambling on the binary tree on each pass, which makes things complicated. Put simply, _magic() switches the position of the input node with its aunt/uncle node, then does the same to that aunt/uncle\'s parent node until it reaches the root of the tree. Ultimately this puts the node at a higher layer in the tree, and also makes the tree no longer complete. Fortunately, you don\'t need to reverse this function, but it is important to understand, because this means our future bytes wont always map to themselves anymore, nor will they always map to 8 bits in the resulting file. If you do want a visual aid, though, I\'ve got a rough drawing [here](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/magic.jpg)\n\nSo, that\'s it! The encode() method transforms each byte into an array of bits, which are combined and converted into bytes and returned. Once you understand the program, you can write your decompression algorithm.\n\nIn my solution, I copied over the entire Family and Deflater classes into my decompression script, since their functions can still be used for decompression (I did change some of the names to make more sense though). I added a new function, decode(), that starts by converting the entire file into a bit array, since that\'s the last step performed by encode(). I then wrote another new function, _tribute(), which, in combination with decode(), iterates over the entire bit array and recovers each byte one by one. Since _travesty() traverses the binary tree from bottom to top, _tribute() instead traverses it from top to bottom. The path it follows is determined by the bit array; if a 1 is encountered, it goes to the left child, if a 0, the right. Once it finds a node with no children, it can simply read the data inside the node to get the original byte used to encode the bits. If the decompression is done in order, starting from the beginning of the file, I can also run _magic() (renamed _scrambler) on the node that was found to update the binary tree the same way it was updated during compression. This process of using input bits to traverse the tree, then running _magic() each time we complete a byte, is looped over until we run out of input bits.\n\nIn total, to decompress the file data.tar.omgzip, you need to perform 3 steps. First, remove the OMGZIP header. Second, use your custom decode() function within the Deflater class to decode the bits of the file into their original bytes. Third and finally, use your reversed compress() function to expand the repeated bits of the file. And that\'s it! Write the bytes to data.tar, un-tar the archive, and get the flag from the \"flag\" file!\n\n(Alternatively, just run decompressor.py on data.tar.omgzip. But that\'s just using my solution, and that\'s no fun right?)\n\nAddendum:  \nThe implementation I wrote in Python is really slow, taking around 15-20 minutes to decompress the whole file. A faster implementation could be written in a faster language, like C++ or Rust. My friend [Sam](reference needed) helped a lot with the completion of this challenge and wrote his own implementation of the algorithm in Rust. You can find his solution [here](reference needed).\n\n'),(2,'javascript_is_a_joke','JavaScript is a Joke','2024-07-19 22:26:06','# JavaScript is a Joke\n\nHe did it! He said the line!\n\n(this is not a serious blog post if you couldn\'t tell, adult language ahead)\n\nSo anyway, it\'s a month in at my new job at Semgrep. Really fun so far. I get to research new CVEs that come out in open source software, which means I get to see all the new major disasters firsthand. On rare occasions you get to see the sophisticated new hacks against major libraries or whatever, but most of it is just access mismanagement, \"isadmin\" cookies, awful vuln descriptions and, as you may have guessed, JavaScript acting as the one thing standing between humanity and a prosperous world society. I\'m not here to write a cool, detailed description of a CTF challenge solution or sophisticated hack. No, today is all just complaints.\n\nAt some point I will do a post outlining some of the most god-awful CVE disclosures I have had the privilege to discover, but we\'ll save that for later. I have faith in the security research community bringing us quality content to laugh at in the coming months.\n\nSo I have three things to bring up. The first is a popular weakness that was discovered in the way JavaScript handles objects: Prototype Pollution. The first of these was disclosed in 2019, and since then researchers have been variant hunting the shit out of it. It\'s a very fickle vuln, just as likely to be harmless as it is to allow code execution privileges. I\'ll do my best to explain how it works.\n\nFirst thing to know is that every JavaScript object `{}` has a prototype `{}.__proto__`. This defines the attributes (member functions and variables) the object is created with. Prototypes are inheritable, so if you define a \"child\" object based off a \"parent\" object, the child prototype contains all the attributes of the parent prototype as well. Also, every object is inherited from the default object `{}`. You can probably see where this is going.\n\nIf we modify the prototype of the default object and add our own attributes (for example: `{}.__proto__.something = \"foobar\"`), those attributes will **automatically be added to any existing objects *and* any new objects!** Of course JavaScript lets you do this, this is totally fine! Except that this means, of course, **anyone with access to the default object prototype can add whatever they want to every single object in the code**.\n\nOf course, if you code doesn\'t make assumptions about what attributes are in what objects, you should be fine. But if it does, congratulations, you\'ve given code editing rights to Anonymous.\n\nThe second thing I have to bring up is more of a cool fact! A cool fact that could totally crash your Javascript code without you even knowing it existed.\n\n`{ toString: \'\' }` is impossible to automatically convert to a primitive! Why is this? [Type coercion](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#type_coercion).\n\nIn order to automatically convert an object (like `{}`) to a primitive value (like `3` or `\"foobar\"`), JavaScript tries 3 things:\n\n1. calling the object\'s `[@@toPrimitive]()` function, which `{ toString: \'\' }` does not have.\n2. calling `{ toString: \'\' }.valueOf()`, which returns {} itself, which is not a primitive so it\'s ignored.\n3. calling `{ toString: \'\' }.toString()`, which *would* return `\"[object Object]\"`, but we overwrote the `toString` method with an empty string instead, so it\'s no longer a function.\n\nIf all 3 attempts fail, a TypeError is thrown! This can lead to some cute lil [DoS vulns](https://github.com/advisories/GHSA-hhr9-rh25-hvf9).\n\nNow for the final thing, and this one takes the cake. Have any of y\'all used [vm2](https://github.com/patriksimek/vm2) before? It\'s a project attempting to take Node.js\' built-in `vm` module and make it secure! Mainly by attempting to patch every single hole imaginable, and there were a lot. Admittedly, their tenacity and determination was commendable, but ultimately, JavaScript won. I didn\'t work on the project, so I don\'t know all the details, but from a little bit of research it appears that Node was intercepting calls inside the vm before they could be proxied or overwritten. That sounds to me like patching every hole in a bucket only for the bucket to tip over.\n\nSo vm2 hit a dead end, what\'s the big deal? Well, the big deal is that *everyone uses vm2*. If you\'re looking to easily secure user-run code, vm2 is the go-to solution. Now that it\'s gone, there is only *one* project *in existence* focused on secure virtualization of JavaScript. If isolated-vm goes under, we\'re fucking toast.\n\nThere\'s also a more in-depth description of that story over on the Semgrep blog, if you want to learn more. I would link it, but that would be a little masturbatory, plus no one reads this blog anyway.\n\nOh, I got one more as a bonus for reading this far. Friendly reminder for how much garbage there is on npm: https://www.npmjs.com/package/npm-ghost-726?activeTab=code\n\nSome goobers wrote a script that literally uploads thousands of copies of the same package to npm. Apparently the goal was to inflate the dependent count on their main node packages, so they would have more credibility and \"clout\". It\'s not really harmful, just false advertising I guess. npm is a minefield when it comes to broken, malicous, or downright weird packages.\n\nAnyway, that\'s all I have for today. Maybe now is a good time to admit that I\'ve been writing it Javascript my entire life up until now. I feel like that should be correct. If the language isn\'t strongly typed, why should its name be?\n'),(3,'provably_secure_2','Provably Secure 2','2024-07-19 22:26:06','# Provably Secure 2\n## Now with less cheese! Still pretty simple though. `nc mc.ax 31497`\n> category: Crypto  \n> author: jyu  \n> solves: 155  \n> points: 117  \n> challenge file(s): [server.py](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DiceCTF/Provably-Secure-2/server.py)  \n> solution file(s): [client.py](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DiceCTF/Provably-Secure-2/client.py)  \n\n\nThis server is basically a simulation of the IND-CCA2 game testing a custom cryptographic system. The game is described in detail here https://en.wikipedia.org/wiki/Ciphertext_indistinguishability.  \n\nThe server makes 128 passes, generating a random bit (0 or 1) each pass. Our goal is to call a \"Solve\" function, and correctly \"guess\" the bit 128 times, at which point a flag is printed. In addition, the server also provides \"Query Encryption\" and \"Query Decryption\" functions.  \n\nThe \"Query Encryption\" Function asks for 2 messages to encrypt. If the random bit is 0 it encrypts the first one and returns the ciphertext, and if the bit is 1 it encrypts the second. Unfortunately, we are unable to predict this bit using encryption alone, since this cryptosystem is IND-CPA secured. That is, when the cryptosystem is given the same message multiple times, it will encrypt it differently every time. We cannot simply work backwards by comparing ciphertext with their respective plaintext.  \n\nThe \"Query Decryption\" Function takes an encrypted message and decrypts it. Unlike in Provably Secure (original), we can\'t simply query decryption on ciphertext we just encrypted, which would immediately tell us what message produced the ciphertext. The function checks our input to make sure it doesn\'t match past encryption queries.  \n\nSo we can\'t cheese this game. We have to prove that this cryptosystem is not IND-CCA2 secured somehow.  \n\nThe encryption process uses 2 RSA public/private keys (r0, r1), and goes something like this:  \n\n`ciphertext = r0-public-key(random_data) + r1-public-key(plaintext ⊕ random_data)`  \n\nAnd the decryption process (with ciphertext split in half):  \n\n`plaintext = r0-private-key(ciphertext0) ⊕ r1-private-key(ciphertext1)`  \n\nThis operation works because of properties of the XOR (⊕) operation. Namely, if a ⊕ b = c, then c ⊕ b = a and c ⊕ a = b. We can actually use this property to our advantage.  \n\nLet\'s make 2 encryption queries. For the first, we\'ll make m0 00000000000000000000000000000000 for simplicity, and m1 ffffffffffffffffffffffffffffffff for fun.  \n\n```\nm0 (16 byte hexstring): 00000000000000000000000000000000\nm1 (16 byte hexstring): ffffffffffffffffffffffffffffffff\n298c7e2c...\n```  \n\nFor the second, we\'ll make both messages the same (also 00000000000000000000000000000000 for simplicity).  \n\n```\nm0 (16 byte hexstring): 00000000000000000000000000000000\nm1 (16 byte hexstring): 00000000000000000000000000000000\n7f5b2a85...\n```  \n\nFrom what we know about the encryption process, both of these outputs are a combination of 2 ciphertexts, I\'ll name them ct0_a and ct1_a from our first query, and ct0_b and ct1_b from our second. For the rest of this proof, \"a\" will denote data from our first encryption query, and \"b\" will denote the second.  \n\nSince these ciphertexts are encrypted and decrypted separately, we can mix them around. What if we were to pair ct0_a with ct1_b, and ct0_b with ct1_a?  \n\n`r0-private-key(ct0_a) ⊕ r1-private-key(ct1_b) = (random_data_a) ⊕ (plaintext_b ⊕ random_data_b)`  \n\n`r0-private-key(ct0_b) ⊕ r1-private-key(ct1_a) = (random_data_b) ⊕ (plaintext_a ⊕ random data_a)`  \n\nWhen we made the second query before, we made sure that plaintext_b was 00000000000000000000000000000000 for a reason. Any bit XOR-ed with 0 is itself, the identity property. For this reason, we can remove plaintext_b from the expression, as it does not affect the final XOR product.  \n\n`random_data_a ⊕ random_data_b`  \n\n`random_data_b ⊕ plaintext_a ⊕ random data_a`  \n\nUsing the other property of XOR we know about, we can simply XOR these two values together, and the result will be plaintext_a.  \n\n`random_data_a ⊕ random_data_b ⊕ random_data_b ⊕ plaintext_a ⊕ random data_a = plaintext_a`  \n\nAnd we\'ve successfully recovered plaintext from a ciphertext message! If plaintext_a is 00000000000000000000000000000000, we know m0 was used to make the ciphertext, meaning the random bit is 0. If plaintext_a is ffffffffffffffffffffffffffffffff, the inverse is true, and the random bit is 1.  \n\n');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'The Norwood Suite Main Theme','Cosmo D',NULL,'https://www.youtube.com/watch?v=BajS3cugInY','TheNorwoodSuiteOSTMainTheme.mp3'),(2,'Violet Water','comfort._',NULL,'https://youtu.be/YZht21PH-eM','violetwater.mp3'),(3,'Crawl Space','TURQUOISEDEATH',1,'https://www.youtube.com/watch?v=fZMsw0A7MKI','CrawlSpace.mp3'),(4,'star queen yuuki','FlowerBoyDeMii',2,'https://www.youtube.com/watch?v=UQ0cslo9bZI','StarQueenYuuki.mp3'),(5,'Jigsaw Falling Into Place','Radiohead',3,'https://www.youtube.com/watch?v=TR2HPSjcJ7I','JigsawFallingIntoPlace.mp3'),(6,'After Dark','Mr. Kitty',NULL,'https://www.youtube.com/watch?v=sVx1mJDeUjY','AfterDark.mp3'),(7,'Sea, Swallow Me','Cocteau Twins',NULL,'https://www.youtube.com/watch?v=1uWbEe7U3ZY','SeaSwallowMe.mp3'),(8,'End of Small Sanctuary','Akira Yamaoka',NULL,'https://www.youtube.com/watch?v=cADH06lKVNA','EndOfSmallSanctuary.mp3'),(9,'Hopelessness','Sewerslvt',NULL,'https://www.youtube.com/watch?v=GSk8wjK8nyY','Hopelessness.mp3'),(10,'Unsaid Warning','T.H.C.',NULL,'https://www.youtube.com/watch?v=6xODEKgCJ38','UnsaidWarning.mp3'),(11,'Soft Goth','Astrophysics',NULL,'https://www.youtube.com/watch?v=xKV0ouSapqI','SoftGoth.mp3'),(12,'Beach Walk','Whitewoods',NULL,'https://www.youtube.com/watch?v=oF9yHO-UUws','BeachWalk.mp3'),(13,'My Time','Bo En',NULL,'https://www.youtube.com/watch?v=OkMLYNWP-yo','MyTime.mp3'),(14,'Ya No Hay Verano','Depresión Sonora & Astrophysics',NULL,'https://www.youtube.com/watch?v=8oCrWOyLsWE','YaNoHayVeranoAstrophysicsRemake.mp3'),(15,'Bloodhail','Have a Nice Life',NULL,'https://www.youtube.com/watch?v=sXyRAsBp998','Bloodhail.mp3'),(16,'Make It Forever','George Clanton',NULL,'https://www.youtube.com/watch?v=cLYs4gxVimQ','MakeItForever.mp3'),(17,'Blackbox Life Recorder 21f','Aphex Twin',NULL,'https://www.youtube.com/watch?v=e_Ue_P7vcRE','BlackboxLifeRecorder21f.mp3'),(18,'Comfort Chain','Instupendo',NULL,'https://www.youtube.com/watch?v=8b-WwN4H7lE','ComfortChain.mp3'),(19,'Dear Alice','Arai Tatsuku',NULL,'https://www.youtube.com/watch?v=gsPgVTO8D68','DearAlice.mp3'),(20,'Bollywood Apologetics','Black Wing',NULL,'https://www.youtube.com/watch?v=9S4VSZdxRh0','BollywoodApologetics.mp3'),(21,'Frankie M','Swans',NULL,'https://www.youtube.com/watch?v=w1I8JJXq1kY','FrankieM.mp3'),(22,'dreamcore','Yandere',NULL,'https://www.youtube.com/watch?v=I81aoHiDzyo','Dreamcore.mp3'),(23,'B With XTC','Harmful Logic & DJ Kuroneko',NULL,'https://www.youtube.com/watch?v=EQ5JvrAaq9o','xtc.mp3'),(24,'Fleeting Frozen Heart','Xxtarlit⚸',NULL,'https://www.youtube.com/watch?v=nGd4ZcR7Qh8','FleetingFrozenHeart.mp3'),(25,'Nhk!?','Goreshit',NULL,'https://www.youtube.com/watch?v=DOTFVhfDBCk','nhk.mp3'),(26,'Shihandu Takenu Des','Rory in early 20s',NULL,'https://www.youtube.com/watch?v=7AFPNtupKgI','ShihanduTakenuDes.mp3'),(27,'Chrome Hearts','Nfract',NULL,'https://www.youtube.com/watch?v=AUHziXV61nw','ChromeHearts.mp3');
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

-- Dump completed on 2024-07-19 22:45:41
