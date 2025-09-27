/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.0.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	12.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
set autocommit=0;
INSERT INTO `albums` VALUES
(1,'Se Bueno','TURQUOISEDEATH','Shoegaze, Atmospheric Drum & Bass','https://www.youtube.com/watch?v=PadJz4o_jUM','A beautiful experimental mixture of sampled music, ambience, shoegaze rock to invoke a brief moment of calming blue. Featuring several heavy hitters that make this album spread its wings (Astrophysics, 2 0 2 1, BrokenTeeth, Prannoul and Asian Glow).'),
(2,'Elysium','FlowerBoyDeMii','Atmospheric Drum & Bass','https://www.youtube.com/watch?v=tGXleMureBs','Essential listening for early 2020s drum & bass, uses the Jungle inspiration extremely well. Featuring more heavy hitters from the sampled music scene (IX Fall$, optic core, Egofear, TURQUOISEDEATH, llwll). May 20th is a special day.'),
(3,'In Rainbows','Radiohead','Alternative Rock','https://www.youtube.com/watch?v=bgsmr7t8zGE&list=PL90uWKIpHUob7f4raEOR_n1i_isnMyE5V','I just really like the music.');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categories` VALUES
(2,1,'Reverse Engineering'),
(3,2,'JavaScript'),
(4,3,'Cryptography'),
(5,4,'Reverse Engineering'),
(6,4,'Exploitation'),
(7,5,'Games'),
(8,6,'Camping');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

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
set autocommit=0;
INSERT INTO `facts` VALUES
(1,'If you have medical expenses that you can\'t pay, you can appeal to the US Department of Health and Human Services for financial aid.','benefits.gov','https://www.benefits.gov/benefit-finder'),
(2,'A quick-and-dirty heat radiator can be made using a clay pot and a few candles.','Prepping Planet','https://preppingplanet.com/how-to-heat-a-room-with-a-candle/'),
(3,'The vast majority of commercial coin-operated laundry machines can be opened with the same 3 key models from Greenwald industries.','Reddit','https://www.reddit.com/r/UnethicalLifeProTips/comments/15y7k4r/ulpt_the_vast_majority_of_commercial_coinoperated/'),
(4,'Many banks offer what is called a Money Market account as an alternative to traditional savings accounts; these typically have higher interest rates, and thus, higher yields.','Forbes','https://www.forbes.com/advisor/banking/money-market-account/what-is-a-money-market-account/'),
(5,'DefCon isn\'t actually cancelled; and no, there is no Black Badge raffle.','Personal Experience','https://www.wired.com/story/defcon-is-canceled/'),
(6,'Used public goods are often auctioned off for cheap.','Public Surplus','https://www.publicsurplus.com/sms/browse/home'),
(7,'You can use a password manager to generate long, complex, random passwords for all of your online accounts, without needing to remember any of them.','Wikipedia','https://en.wikipedia.org/wiki/List_of_password_managers'),
(8,'If you want to stay warm in a wet environment, wear wool or synthetic layers; remember, cotton kills.','section hiker','https://sectionhiker.com/why-does-cotton-kill/'),
(9,'Two dropped objects of the same shape and size will fall at the same speed, regardless of weight.','Isaac Newton / Galileo Galilei','https://physics-network.org/what-is-galileos-theory-of-falling-bodies/'),
(10,'You are enough.','',''),
(11,'William Howard Taft is the only Supreme Court justice to become president of the United States','Wikipedia','https://en.wikipedia.org/wiki/Taft_Court'),
(12,'Curious about the common practices and effects of Hormone Replacement Therapy (HRT)? Check out the DIY HRT directory. (NOTE: This resource should NOT be substituted for professional medical advice)','DIY HRT','https://diyhrt.wiki/index'),
(13,'Learning morse code is easy, actually!','Google','https://morse.withgoogle.com/learn/'),
(14,'Lift heavy objects with your legs, not your back.','Every manual laborer ever','https://breakingmuscle.com/why-you-lift-with-your-legs-not-your-back/'),
(15,'You don\'t have to floss all of your teeth, only the ones you want to keep.','Every dental hygienist ever','https://www.healthline.com/health/benefits-of-flossing'),
(16,'Every gun is always loaded.','The four rules of firearm safety','https://www.nssf.org/articles/4-primary-rules-of-firearm-safety/'),
(17,'If you back up your Skilsaw while it\'s still running, it will come back to you faster than you wanted.','Skil Saw Safety','https://assets-global.website-files.com/6062403b2ddb897f75cce854/622e7384c75c224363115f19_Skill-Saw-Safe-use-Policy_1_.pdf'),
(18,'The internet has a nearly limitless supply of free information. You can learn how to fix a car, how to code, CPR, a new language, what the best movies ever made are. What are you waiting for?','here','https://www.google.com/'),
(19,'Community college tuition averages at about 1/10th of the cost of a traditional university; this coupled with high transfer admission rates to higher universities make it a much cheaper path to a Bachelor\'s degree in the United States.','NSHSS','https://www.nshss.org/resources/blog/blog-posts/community-college-vs-university-pros-and-cons-of-cost-class-size-and-student-experience/');
/*!40000 ALTER TABLE `facts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS `guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook`
--

LOCK TABLES `guestbook` WRITE;
/*!40000 ALTER TABLE `guestbook` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `guestbook` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `content` text DEFAULT NULL,
  `headliner` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `posts` VALUES
(1,'omgzip','OMGzip','2023-05-09 00:00:00','# OMGzip\n## OMG, it\'s a .zip! \n> solves: 79  \n> points: 56  \n> challenge file(s): [omgzip](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/omgzip), [data.tar.omgzip](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/data.tar.omgzip)  \n> solution file(s): [decompressor.py](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/decompressor.py)  \n> original challenge github: https://github.com/Nautilus-Institute/quals-2023/tree/main/omgzip  \n\nJust this past weekend, [Pacific Hackers Association](https://www.meetup.com/pacifichackers/) and [HackMiami](https://www.meetup.com/hackmiami/) joined forces to compete in the [DEFCON CTF Qualifiers](https://quals.2023.nautilus.institute/index.html). The top 12 teams from this CTF go on to play the most competitive and challenging CTF in the world at DEFCON 31. Though, to be fair, our team wasn\'t of that caliber. We were able to solve 2 challenges (not counting the sanity checks) and finished in 92nd place, which is a great success by my standards! I was able to solve this one with the help of my friend Sam. It\'s a reverse engineering challenge, but with Python code instead of x86 assembly, which makes things much nicer.\n\ndata.tar.omgzip is a .tar file compressed using a custom compression program called omgzip. The Python source code for omgzip is provided, so all you need to do is reverse the logic of the program and write your own decompression program.\n\nFrom the creator:  \n\"The original version of this challenge was pretty trivially solvable by ChatGPT, so I made it more difficult before its release and added a bunch of random comments and changed a bunch of variable names to make doing that take more time. We\'ll see if I was successful or not.\"\n\nThe source code is pretty funny to read through. All the comments are basically worthless, and the creator even makes use of confusing naming conventions and data types (i.e. `idx += True`) in order to throw off any kind of LLM trying to understand the code logic automatically. Regardless, any human with a decent amount of programming experience shouldn\'t be thrown off by this as long as they examine the logic of the code itself, it\'s not overly complicated.\n\nOverall, the compression can be broken down into two steps. First, the compress() function is called, which looks for repeated concurrent bytes in the file and groups them together with a count. This can be reversed with some simple if/else logic, which I\'ve done in uncompress_part1(). The second step calls the encode() method from a Deflator class on the file bytes, which is a bit more complicated.\n\nTo understand this second step, you first need to understand the data structure defined by the Family class. For those familiar with data structures, this is a [binary tree](https://www.geeksforgeeks.org/binary-tree-data-structure/) implementation. Each node contains an int of data and pointers to its parent and two children. This data structure is used by the Deflater class to map common bytes to shorter bit arrays, which I\'ll get into later.\n\nWhen an object of the Deflater class is created, a complete binary tree of depth 8 is created and stored in self.money (see \"[Types of binary trees](https://en.wikipedia.org/wiki/Binary_tree)\"). Each node of the binary tree at depth 8 contains a number. Since the tree is 8 layers deep, there are 256 total nodes at the 8th layer, because 2^8 = 256. The nodes store incremental numbers from \"right\" to \"left\", starting with 0 in the rightmost node and ending with 255 in the leftmost. For purposes of visualizing the graph, I\'m speaking as if the \"successful_firstborn\" child is on the right side of the parent, and the \"conflicted_stepchild\" child is on the left side. Pointers to each of these layer 8 nodes are also stored in self.dictionary, from right (at index \"0\") to left (at index \"255\").\n\nIn case your head is spinning, here\'s a visual aid:\n\n![binary tree](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/bintree.jpg).\n\nLuckily you wont have to reverse this setup step; setting up the binary tree will be exactly the same for decompression.\n\nMoving on to the encode() method. This method runs _travesty() on each individual byte of the file. _travesty() plugs this byte into self.dictionary in order to get one of the binary tree nodes at layer 8. From this node, it then travels up the levels of the tree, writing a single bit of data for each layer travelled. If the child node is on the left side of the parent, a 1 is written, and if on the right, a 0 is written. The first time _travesty() is run, this simply writes the binary representation of the input byte, because of the way the tree was set up. Take 0x00 for example. The tree is 8 layers deep, and numbers are ordered from lowest to highest left -> right. 0x00 is on the farthest right node and is on the right side of every parent, so traversing the tree upwards produces 00000000. These bits are then added to the output array in big-endian format (most significant bit on the left), and then _magic() function is called on the starting layer 8 node before returning.\n\nIf the _magic() function wasn\'t called, each call to _travesty() would output the exact byte that was put in, as described above. However, _magic() performs a bit of scrambling on the binary tree on each pass, which makes things complicated. Put simply, _magic() switches the position of the input node with its aunt/uncle node, then does the same to that aunt/uncle\'s parent node until it reaches the root of the tree. Ultimately this puts the node at a higher layer in the tree, and also makes the tree no longer complete. Fortunately, you don\'t need to reverse this function, but it is important to understand, because this means our future bytes wont always map to themselves anymore, nor will they always map to 8 bits in the resulting file. If you do want a visual aid, though, I\'ve got a rough drawing here:\n\n![magic function](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/magic.jpg)\n\nSo, that\'s it! The encode() method transforms each byte into an array of bits, which are combined and converted into bytes and returned. Once you understand the program, you can write your decompression algorithm.\n\nIn my solution, I copied over the entire Family and Deflater classes into my decompression script, since their functions can still be used for decompression (I did change some of the names to make more sense though). I added a new function, decode(), that starts by converting the entire file into a bit array, since that\'s the last step performed by encode(). I then wrote another new function, _tribute(), which, in combination with decode(), iterates over the entire bit array and recovers each byte one by one. Since _travesty() traverses the binary tree from bottom to top, _tribute() instead traverses it from top to bottom. The path it follows is determined by the bit array; if a 1 is encountered, it goes to the left child, if a 0, the right. Once it finds a node with no children, it can simply read the data inside the node to get the original byte used to encode the bits. If the decompression is done in order, starting from the beginning of the file, I can also run _magic() (renamed _scrambler) on the node that was found to update the binary tree the same way it was updated during compression. This process of using input bits to traverse the tree, then running _magic() each time we complete a byte, is looped over until we run out of input bits.\n\nIn total, to decompress the file data.tar.omgzip, you need to perform 3 steps. First, remove the OMGZIP header. Second, use your custom decode() function within the Deflater class to decode the bits of the file into their original bytes. Third and finally, use your reversed compress() function to expand the repeated bits of the file. And that\'s it! Write the bytes to data.tar, un-tar the archive, and get the flag from the \"flag\" file!\n\n(Alternatively, just run decompressor.py on data.tar.omgzip. But that\'s just using my solution, and that\'s no fun right?)\n\nAddendum:  \nThe implementation I wrote in Python is really slow, taking around 15-20 minutes to decompress the whole file. A faster implementation could be written in a faster language, like C++ or Rust. My friend [Sam](reference needed) helped a lot with the completion of this challenge and wrote his own implementation of the algorithm in Rust. You can find his solution [here](reference needed).\n\n<!-- Categories:Reverse Engineering -->\n','Just this past weekend, [Pacific Hackers Association](https://www.meetup.com/pacifichackers/) and [HackMiami](https://www.meetup.com/hackmiami/) joined forces to compete in the [DEFCON CTF Qualifiers](https://quals.2023.nautilus.institute/index.html). The top 12 teams from this CTF go on to play the most competitive and challenging CTF in the world at DEFCON 31. Though, to be fair, our team wasn\'t of that caliber. We were able to solve 2 challenges (not counting the sanity checks) and finished in 92nd place, which is a great success by my standards! I was able to solve this one with the help of my friend Sam. It\'s a reverse engineering challenge, but with Python code instead of x86 assembly, which makes things much nicer.'),
(2,'javascript_is_a_joke','JavaScript is a Joke','2023-08-27 00:00:00','# JavaScript is a Joke\n\nHe did it! He said the line!\n\n(this is not a serious blog post if you couldn\'t tell, adult language ahead)\n\nSo anyway, it\'s a month in at my new job at Semgrep. Really fun so far. I get to research new CVEs that come out in open source software, which means I get to see all the new major disasters firsthand. On rare occasions you get to see the sophisticated new hacks against major libraries or whatever, but most of it is just access mismanagement, \"isadmin\" cookies, awful vuln descriptions and, as you may have guessed, JavaScript acting as the one thing standing between humanity and a prosperous world society. I\'m not here to write a cool, detailed description of a CTF challenge solution or sophisticated hack. No, today is all just complaints.\n\nAt some point I will do a post outlining some of the most god-awful CVE disclosures I have had the privilege to discover, but we\'ll save that for later. I have faith in the security research community bringing us quality content to laugh at in the coming months.\n\nSo I have three things to bring up. The first is a popular weakness that was discovered in the way JavaScript handles objects: Prototype Pollution. The first of these was disclosed in 2019, and since then researchers have been variant hunting the shit out of it. It\'s a very fickle vuln, just as likely to be harmless as it is to allow code execution privileges. I\'ll do my best to explain how it works.\n\nFirst thing to know is that every JavaScript object `{}` has a prototype `{}.__proto__`. This defines the attributes (member functions and variables) the object is created with. Prototypes are inheritable, so if you define a \"child\" object based off a \"parent\" object, the child prototype contains all the attributes of the parent prototype as well. Also, every object is inherited from the default object `{}`. You can probably see where this is going.\n\nIf we modify the prototype of the default object and add our own attributes (for example: `{}.__proto__.something = \"foobar\"`), those attributes will **automatically be added to any existing objects *and* any new objects!** Of course JavaScript lets you do this, this is totally fine! Except that this means, of course, **anyone with access to the default object prototype can add whatever they want to every single object in the code**.\n\nOf course, if you code doesn\'t make assumptions about what attributes are in what objects, you should be fine. But if it does, congratulations, you\'ve given code editing rights to Anonymous.\n\nThe second thing I have to bring up is more of a cool fact! A cool fact that could totally crash your Javascript code without you even knowing it existed.\n\n`{ toString: \'\' }` is impossible to automatically convert to a primitive! Why is this? [Type coercion](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#type_coercion).\n\nIn order to automatically convert an object (like `{}`) to a primitive value (like `3` or `\"foobar\"`), JavaScript tries 3 things:\n\n1. calling the object\'s `[@@toPrimitive]()` function, which `{ toString: \'\' }` does not have.\n2. calling `{ toString: \'\' }.valueOf()`, which returns {} itself, which is not a primitive so it\'s ignored.\n3. calling `{ toString: \'\' }.toString()`, which *would* return `\"[object Object]\"`, but we overwrote the `toString` method with an empty string instead, so it\'s no longer a function.\n\nIf all 3 attempts fail, a TypeError is thrown! This can lead to some cute lil [DoS vulns](https://github.com/advisories/GHSA-hhr9-rh25-hvf9).\n\nNow for the final thing, and this one takes the cake. Have any of y\'all used [vm2](https://github.com/patriksimek/vm2) before? It\'s a project attempting to take Node.js\' built-in `vm` module and make it secure! Mainly by attempting to patch every single hole imaginable, and there were a lot. Admittedly, their tenacity and determination was commendable, but ultimately, JavaScript won. I didn\'t work on the project, so I don\'t know all the details, but from a little bit of research it appears that Node was intercepting calls inside the vm before they could be proxied or overwritten. That sounds to me like patching every hole in a bucket only for the bucket to tip over.\n\nSo vm2 hit a dead end, what\'s the big deal? Well, the big deal is that *everyone uses vm2*. If you\'re looking to easily secure user-run code, vm2 is the go-to solution. Now that it\'s gone, there is only *one* project *in existence* focused on secure virtualization of JavaScript. If isolated-vm goes under, we\'re fucking toast.\n\nThere\'s also a more in-depth description of that story over on the Semgrep blog, if you want to learn more. I would link it, but that would be a little masturbatory, plus no one reads this blog anyway.\n\nOh, I got one more as a bonus for reading this far. Friendly reminder for how much garbage there is on npm: https://www.npmjs.com/package/npm-ghost-726?activeTab=code\n\nSome goobers wrote a script that literally uploads thousands of copies of the same package to npm. Apparently the goal was to inflate the dependent count on their main node packages, so they would have more credibility and \"clout\". It\'s not really harmful, just false advertising I guess. npm is a minefield when it comes to broken, malicous, or downright weird packages.\n\nAnyway, that\'s all I have for today. Maybe now is a good time to admit that I\'ve been writing it Javascript my entire life up until now. I feel like that should be correct. If the language isn\'t strongly typed, why should its name be?\n\n<!-- Categories:JavaScript -->\n','He did it! He said the line!'),
(3,'provably_secure_2','Provably Secure 2','2023-02-08 00:00:00','# Provably Secure 2\n## Now with less cheese! Still pretty simple though. `nc mc.ax 31497`\n> category: Crypto  \n> author: jyu  \n> solves: 155  \n> points: 117  \n> challenge file(s): [server.py](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DiceCTF/Provably-Secure-2/server.py)  \n> solution file(s): [client.py](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DiceCTF/Provably-Secure-2/client.py)  \n\nThis server is basically a simulation of the IND-CCA2 game testing a custom cryptographic system. The game is described in detail here https://en.wikipedia.org/wiki/Ciphertext_indistinguishability.  \n\nThe server makes 128 passes, generating a random bit (0 or 1) each pass. Our goal is to call a \"Solve\" function, and correctly \"guess\" the bit 128 times, at which point a flag is printed. In addition, the server also provides \"Query Encryption\" and \"Query Decryption\" functions.  \n\nThe \"Query Encryption\" Function asks for 2 messages to encrypt. If the random bit is 0 it encrypts the first one and returns the ciphertext, and if the bit is 1 it encrypts the second. Unfortunately, we are unable to predict this bit using encryption alone, since this cryptosystem is IND-CPA secured. That is, when the cryptosystem is given the same message multiple times, it will encrypt it differently every time. We cannot simply work backwards by comparing ciphertext with their respective plaintext.  \n\nThe \"Query Decryption\" Function takes an encrypted message and decrypts it. Unlike in Provably Secure (original), we can\'t simply query decryption on ciphertext we just encrypted, which would immediately tell us what message produced the ciphertext. The function checks our input to make sure it doesn\'t match past encryption queries.  \n\nSo we can\'t cheese this game. We have to prove that this cryptosystem is not IND-CCA2 secured somehow.  \n\nThe encryption process uses 2 RSA public/private keys (r0, r1), and goes something like this:  \n\n`ciphertext = r0-public-key(random_data) + r1-public-key(plaintext ⊕ random_data)`  \n\nAnd the decryption process (with ciphertext split in half):  \n\n`plaintext = r0-private-key(ciphertext0) ⊕ r1-private-key(ciphertext1)`  \n\nThis operation works because of properties of the XOR (⊕) operation. Namely, if a ⊕ b = c, then c ⊕ b = a and c ⊕ a = b. We can actually use this property to our advantage.  \n\nLet\'s make 2 encryption queries. For the first, we\'ll make m0 00000000000000000000000000000000 for simplicity, and m1 ffffffffffffffffffffffffffffffff for fun.  \n\n`m0 (16 byte hexstring): 00000000000000000000000000000000`\n`m1 (16 byte hexstring): ffffffffffffffffffffffffffffffff`\n`298c7e2c...`\n\nFor the second, we\'ll make both messages the same (also 00000000000000000000000000000000 for simplicity).  \n\n`m0 (16 byte hexstring): 00000000000000000000000000000000`\n`m1 (16 byte hexstring): 00000000000000000000000000000000`\n`7f5b2a85...`\n\nFrom what we know about the encryption process, both of these outputs are a combination of 2 ciphertexts, I\'ll name them ct0_a and ct1_a from our first query, and ct0_b and ct1_b from our second. For the rest of this proof, \"a\" will denote data from our first encryption query, and \"b\" will denote the second.  \n\nSince these ciphertexts are encrypted and decrypted separately, we can mix them around. What if we were to pair ct0_a with ct1_b, and ct0_b with ct1_a?  \n\n`r0-private-key(ct0_a) ⊕ r1-private-key(ct1_b) = (random_data_a) ⊕ (plaintext_b ⊕ random_data_b)`  \n\n`r0-private-key(ct0_b) ⊕ r1-private-key(ct1_a) = (random_data_b) ⊕ (plaintext_a ⊕ random data_a)`  \n\nWhen we made the second query before, we made sure that plaintext_b was 00000000000000000000000000000000 for a reason. Any bit XOR-ed with 0 is itself, the identity property. For this reason, we can remove plaintext_b from the expression, as it does not affect the final XOR product.  \n\n`random_data_a ⊕ random_data_b`  \n\n`random_data_b ⊕ plaintext_a ⊕ random data_a`  \n\nUsing the other property of XOR we know about, we can simply XOR these two values together, and the result will be plaintext_a.  \n\n`random_data_a ⊕ random_data_b ⊕ random_data_b ⊕ plaintext_a ⊕ random data_a = plaintext_a`  \n\nAnd we\'ve successfully recovered plaintext from a ciphertext message! If plaintext_a is 00000000000000000000000000000000, we know m0 was used to make the ciphertext, meaning the random bit is 0. If plaintext_a is ffffffffffffffffffffffffffffffff, the inverse is true, and the random bit is 1.  \n\n<!-- Categories:Cryptography -->\n','This server is basically a simulation of the IND-CCA2 game testing a custom cryptographic system. The game is described in detail here https://en.wikipedia.org/wiki/Ciphertext_indistinguishability.  '),
(4,'rop_part_1','How to Gain Code Execution on a C Binary using a Buffer Overflow, Part 1','2024-08-05 21:36:51','# How to Gain Code Execution on a C Binary using a Buffer Overflow, Part 1\n\nSo, you\'re playing a CTF and you decide to try the `pwn` category for the first time. You\'re given a file with a weird or no extension, and a string that looks something like `nc mydoma.in 12345`. You figure out what [NetCat](https://linuxize.com/post/netcat-nc-command-with-examples/) is and you connect to the server, which asks you for some input and kicks you out no matter what you enter. You\'ve never seen a challenge like this before.\n\nAllow me to introduce you to the Buffer Overflow vulnerability. This is one of the most well known and commonly exploited vulnerabilities in the world, or at the very least, used to be. Ever since the famous paper was released, [Smashing The Stack For Fun And Profit](https://www.eecs.umich.edu/courses/eecs588/static/stack_smashing.pdf), no C program has been safe. This vulnerability allows an attacker to functionally run whatever code they want on a running C program that accepts user input, and doesn\'t properly limit the length of that input.\n\nThere have been many summaries and writeups of this kind of problem, as well as variations of it, online. I\'ll give a special shoutout to [Rapid7\'s explanation](https://www.rapid7.com/blog/post/2019/02/19/stack-based-buffer-overflow-attacks-what-you-need-to-know/), as they go into the practical nature of this vulnerability and cover many of the same things this blog post touches on as well. For right now, I want to return to the original question. Say you\'re playing a CTF and you come across a challenge that requires you to exploit this vulnerability. How do you do it *right*?\n\nLet\'s get right into it. These challenges will typically give you two things. The first is an executable binary file compiled from the C programming language. This is the file with the weird extension you may have encountered. This file can be run in a standard Linux command line (or a Mac terminal, or in WSL for Windows). Simply make it executable and run it with the following commands:\n\n`chmod +x challenge-file-name && ./challenge-file-name`\n\nOnce you run it, you should see some output in the terminal that looks strangely similar. Now look at the second thing the challenge gives you: a connection string. This string gives you all the information you need to connect to a remote server on the internet. Most commonly, this is a NetCat command that looks something like this:\n\n`nc <ip address or domain> <port number>` e.g. `nc 12.34.567.89 1234`\n\nGo ahead and type this string into your terminal and run it. Notice how it gives the exact same output as when you ran the executable binary? That\'s because it\'s the exact same program. Your goal for this challenge is to connect to this remote server and exploit the program running on it, and you\'re given this exact program so you can analyze the code and test your exploit.\n\nSo now that we know exactly what we\'re being given, it\'s time to analyze the executable binary. What\'s *actually* being run on this server?\n\nThere are many binary analysis tools out there you can use. In this tutorial we will use the Gnu Debugger, or gdb. This is a command line tool that comes pre-installed on most Linux distributions, and there\'s even an [online version](https://www.onlinegdb.com/)! (though you do need the source code for this version)\n\nTo start analyzing the challenge binary, run the following commmand:\n\n`gdb challenge-file-name`\n\n![gdb-screenshot-1](/img/gdb-1.png)\n\nSo, we know that this program accepts some form of input from a user, but that doesn\'t necessarily mean that it has a buffer overflow vulnerability. Let\'s take a look at the code itself to confirm for sure that it is vulnerable. Unfortunately, we aren\'t given the exact C source code for this program, but we *can* look at something similar and more lower-level. It\'s called [x86 Assembly Language](https://www.cs.virginia.edu/~evans/cs216/guides/x86.html):\n\n![gdb-screenshot-2](/img/gdb-2.png)\n\nAssembly languages of all kinds are very complicated to understand and analyze, it\'s fine if you don\'t understand anything you see in the picture above. While I do recommend studying up on what assembly language is and how it works, that wont be necessary for this guide. For now, just understand that this is the representation of the program that your computer *actually* sees and understands, and knows how to execute. And it can be analyzed just like any other language.\n\nGoing back to the picture above, we are specifically looking at the assembly code for the \"main\" function. On some of the lines, in red text and enclosed in angle brackets <>, are function names like \"printf@plt\", \"fgets@plt\" and \"strcmp@plt\". These are standard C library functions. \"fgets\" in particular is a function that accepts input, and can potentially be vulnerable to buffer overflow. Let\'s try it out! To run the program, enter the `run` command in gdb, and when it asks for your input, put in like 100 random characters.\n\n![gdb-screenshot-3](/img/gdb-3.png)\n\nBingo! Our input caused a Segmentation Fault! If the program handled our input correctly it would have just output \"incorrect password\", but instead something inside broke! Let\'s take a look at what exactly broke. Run the program again, but before you do, run the command `break main` to make the program stop right before the \"main\" function.\n\n![gdb-screenshot-4](/img/gdb-4.png)\n\nThis is where we have to talk about something called [Address Space Layout Randomization](https://en.wikipedia.org/wiki/Address_space_layout_randomization). You need to understand computer architecture to fully get it, but basically it means that each time you run a program, it is loaded into a random memory space on your computer. We want to look at the program at the exact point in time that we broke it with our input, so we need to have the exact memory address of that point in the code. Go ahead and run `disassemble main` again and see how the numbers on the left side change.\n\n![gdb-screenshot-5](/img/gdb-5.png)\n\nNow they all have a bunch of 5s! Your numbers are going to be different from mine since they are random memory addresses. This shouldn\'t matter though, all you have to do now is set a breakpoint at the very last \"ret\" instruction in the code. Run `break *0x0000555555555354`, replacing my memory address with the one showing up on the very last line of your assembly code. Then run `continue` and send it your spaghetti.\n\n![gdb-screenshot-6](/img/gdb-6.png)\n\nPerfect, we\'ve hit the breakpoint. Now run `x/s $sp` - e(x)amine (s)tring at (s)tack (p)ointer.\n\n![gdb-screenshot-7](/img/gdb-7.png)\n\nThere it is! All that spaghetti we inputted. Basically, when we sent a super long string to the program input, it put the first part of it into a variable, but didn\'t have anywhere to put the rest of it, so it \"overflowed\" into the program stack!\n\nI\'ll leave you at this for now. So far, we\'ve confirmed that this program has a buffer overflow vulnerability, have successfully crashed the program, and can see exactly where our overflowed input is being stored. In the next post, I\'ll touch on how exactly to get that \"code execution\" promised in the title of this post, so you can actually solve this CTF challenge. Hope this was helpful, and I\'ll see you in the next one!\n\n<!-- Categories:Reverse Engineering,Exploitation -->\n','So, you\'re playing a CTF and you decide to try the `pwn` category for the first time. You\'re given a file with a weird or no extension, and a string that looks something like `nc mydoma.in 12345`. You figure out what [NetCat](https://linuxize.com/post/netcat-nc-command-with-examples/) is and you connect to the server, which asks you for some input and kicks you out no matter what you enter. You\'ve never seen a challenge like this before.'),
(5,'3ds_modding_101','3ds Modding 101','2025-06-13 17:42:41','# 3ds Modding 101\n\nStill have one of these old things? Nintendo might not make them anymore, but they\'re still useful.\n\n![3ds](https://www.giantbomb.com/a/uploads/original/0/5150/1686077-3dshw11908.jpg)\n\nWith rapidly innovating game markets, there\'s no room anymore for a console that just exists to be used indefinitely. No \"blue ocean\" business model, just an endless supply of new consoles to replace the old. And with the Switch 2 finally coming out, I went back to the only Nintendo console I still own. A Nintendo 3ds, obtained day 1 at Target in 2011.\n\nTurns out I still had some pretty good games for it. Star Fox, Ocarina of Time, Fire Emblem. But there were also a lot I remember wanting to play, but never got around to. Games like Majora\'s Mask and Shovel Knight. I also had misplaced my old copy of Mariokart 7. Looking online, some of these games can be worth hundreds of dollars to buy, did I miss my shot at ever experiencing these games for myself?\n\nNo. Thanks to archival websites like [Vimm\'s Lair](https://vimm.net/links) and [Emuparadise](https://www.emuparadise.me/roms-isos-games.php) we still have access to these games in the form of ROMs - digital copies of video game cartridges. These ROMs can be run on emulators such as Citra and Dolphin. But that\'s only possible to do on a supported computer; how do we download these files onto our 3ds and play them on the original hardware?\n\nIntroducing... 3ds jailbreaking! https://3ds.hacks.guide/\n\nJailbreaking your 3ds allows you to install custom firmware on the device and gives you full control of all the device internals. There are easy guides you can follow online, and helpful folks in the forums as well. In addition to allowing you to install 3ds ROMs off the internet, you can also...\n\n- Customize your home theme!\n- Edit, backup and restore save data!\n- Install cheats!\n- Install custom software built for the 3ds, like messenger apps or video clients!\n- Install mods for existing games!\n\nAnd so much more!\n\nIn addition to the main draw of playing all your favorite discontinued 3ds games, there are two other major reasons I personally wanted to mod my 3ds. The first was console emulation. The truth is, the 3ds can emulate way more than just 3ds games.\n\nYou\'re probably already familiar with the fact that you can play classic DS games on your 3ds as well, simply by plugging in the game cartridge. Naturally, there\'s an emulator for these games too. And that\'s not all! Community developers have integrated emulators from many more classic consoles, including the NES, SNES, Gameboy and Gameboy Advance. You can play games never even ported to the 3ds in the first place! I personally recommend [TWiLight Menu++](https://wiki.ds-homebrew.com/twilightmenu/installing-3ds) for a nice suite of emulators.\n\nThe second reason I had for jailbreaking my 3ds was less out of curiosity and more out of necessity. On April 8th, 2024, Nintendo took down all online services supporting the 3ds. That includes, perhaps most relevantly, online multiplayer and the eshop. It was a long run, but ultimately the moustached man decided we weren\'t profitable anymore and cut us off. 3ds players have become completely isolated.\n\nAs if. As long as self-hosting is legal, fans will run their own servers, that much has been made clear. There\'s a Nintendo network alternative currently running called the [Pretendo network](https://pretendo.network/). If you\'re lucky, their servers wont have been taken down by Nintendo by the time of reading, and if so, I sincerely hope there is some other alternative out there. These servers bring online multiplayer back for all supported games, so all you need to take care of is finding active players.\n\nUltimately, I just wanted to plug all these dedicated creators making content for a console released over a decade ago, y\'all are really amazing. As for you, dear reader, what are you waiting for? Dust off that old console of yours and give it some love.\n\n<!-- Categories:Games -->\n','Still have one of these old things? Nintendo might not make them anymore, but they\'re still useful.'),
(6,'return_to_the_woods','Return to the Woods','2025-09-26 21:39:01','# Return to the Woods\n\nTaken from my backpacking journal, entry dated to September 24th, written at a camp on the edge of a lake in the Sierras of the western USA.\n\nLike many people, I love to go hiking and backpacking. And camping. For most people it\'s pretty obvious why it\'s enjoyable, and why it isn\'t. You get to experience natural beauty. You don\'t have to worry about anything except your own survival. You can be alone and free with your thoughts. It\'s also difficult, dirty and uncomfortable. You have to forgo many of the common conveniences we\'ve grown accostomed to.\n\nFor a long time I thought the wilderness was where I belonged. I was in the boy scouts through childhood (highly recommend, I think they accept more than just boys now too), and they taught me how to survive in the wilderness (editing note: they only teach the basics, you\'ll need proper training to actually \"survive\" on your own). How to start a fire, how to perform first aid, valuable outdoor knowledge. Whenever I went on trips with them, I felt refreshed and at home, as if the weight of acting as a \"human being\" in a \"civilized society\" was lifted off my shoulders. In the wilderness, everything you need to worry about is right there in front of you, and if something is wrong, you know right away (editing note: that doesn\'t always mean the mistakes you make have immediate consequences, be prepared!).\n\nEventually I grew up and left the scouts, and got too busy with college and work to take trips of any kind. I didn\'t like it, nature is therapudic, and I needed that in my life. Eventually (now, really) I got to have enough freedom to start car camping and backpacking again, and it\'s good to be back.\n\nA lot of people take long journeys out into the wilderness alone to \"find themselves\". Others give up on society entirely, preferring instead to live more naturally, closer to how our ancestors lived. I\'ve considered doing these things myself. But, staying out here for too long, feeling the emptiness take hold, I\'ve had to ask myself if I\'m \"getting away\" from it all or if I\'m \"running away\" from it. There are many things I love about the modern world - the computers, the music, urban ruins, and perhaps most importantly, other humans. As much as we may want to return to our roots as hunter-gatherers, it\'s hard to find a community that way (editing note: or maybe I\'m just not cut out for it lol).\n\nSo I stay in the middle between two worlds. Between the technological hell that destroys us, and the natural world left over once we\'re all gone.\n\n<!-- Categories:Camping -->\n','Taken from my backpacking journal, entry dated to September 24th, written at a camp on the edge of a lake in the Sierras of the western USA.');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `artist` varchar(80) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `filename` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `songs` VALUES
(1,'The Norwood Suite Main Theme','Cosmo D',NULL,'https://www.youtube.com/watch?v=BajS3cugInY','TheNorwoodSuiteOSTMainTheme.mp3'),
(2,'Violet Water','comfort._',NULL,'https://youtu.be/YZht21PH-eM','violetwater.mp3'),
(3,'Crawl Space','TURQUOISEDEATH',1,'https://www.youtube.com/watch?v=fZMsw0A7MKI','CrawlSpace.mp3'),
(4,'star queen yuuki','FlowerBoyDeMii',2,'https://www.youtube.com/watch?v=UQ0cslo9bZI','StarQueenYuuki.mp3'),
(5,'Jigsaw Falling Into Place','Radiohead',3,'https://www.youtube.com/watch?v=TR2HPSjcJ7I','JigsawFallingIntoPlace.mp3'),
(6,'After Dark','Mr. Kitty',NULL,'https://www.youtube.com/watch?v=sVx1mJDeUjY','AfterDark.mp3'),
(7,'Sea, Swallow Me','Cocteau Twins',NULL,'https://www.youtube.com/watch?v=1uWbEe7U3ZY','SeaSwallowMe.mp3'),
(8,'End of Small Sanctuary','Akira Yamaoka',NULL,'https://www.youtube.com/watch?v=cADH06lKVNA','EndOfSmallSanctuary.mp3'),
(9,'Hopelessness','Sewerslvt',NULL,'https://www.youtube.com/watch?v=GSk8wjK8nyY','Hopelessness.mp3'),
(10,'Unsaid Warning','T.H.C.',NULL,'https://www.youtube.com/watch?v=6xODEKgCJ38','UnsaidWarning.mp3'),
(11,'Soft Goth','Astrophysics',NULL,'https://www.youtube.com/watch?v=xKV0ouSapqI','SoftGoth.mp3'),
(12,'Beach Walk','Whitewoods',NULL,'https://www.youtube.com/watch?v=oF9yHO-UUws','BeachWalk.mp3'),
(13,'My Time','Bo En',NULL,'https://www.youtube.com/watch?v=OkMLYNWP-yo','MyTime.mp3'),
(14,'Ya No Hay Verano','Depresión Sonora & Astrophysics',NULL,'https://www.youtube.com/watch?v=8oCrWOyLsWE','YaNoHayVeranoAstrophysicsRemake.mp3'),
(15,'Bloodhail','Have a Nice Life',NULL,'https://www.youtube.com/watch?v=sXyRAsBp998','Bloodhail.mp3'),
(16,'Make It Forever','George Clanton',NULL,'https://www.youtube.com/watch?v=cLYs4gxVimQ','MakeItForever.mp3'),
(17,'Blackbox Life Recorder 21f','Aphex Twin',NULL,'https://www.youtube.com/watch?v=e_Ue_P7vcRE','BlackboxLifeRecorder21f.mp3'),
(18,'Comfort Chain','Instupendo',NULL,'https://www.youtube.com/watch?v=8b-WwN4H7lE','ComfortChain.mp3'),
(19,'Dear Alice','Arai Tatsuku',NULL,'https://www.youtube.com/watch?v=gsPgVTO8D68','DearAlice.mp3'),
(20,'Bollywood Apologetics','Black Wing',NULL,'https://www.youtube.com/watch?v=9S4VSZdxRh0','BollywoodApologetics.mp3'),
(21,'Frankie M','Swans',NULL,'https://www.youtube.com/watch?v=w1I8JJXq1kY','FrankieM.mp3'),
(22,'dreamcore','Yandere',NULL,'https://www.youtube.com/watch?v=I81aoHiDzyo','dreamcore.mp3'),
(23,'B With XTC','Harmful Logic & DJ Kuroneko',NULL,'https://www.youtube.com/watch?v=EQ5JvrAaq9o','xtc.mp3'),
(24,'Fleeting Frozen Heart','Xxtarlit⚸',NULL,'https://www.youtube.com/watch?v=nGd4ZcR7Qh8','FleetingFrozenHeart.mp3'),
(25,'Nhk!?','Goreshit',NULL,'https://www.youtube.com/watch?v=DOTFVhfDBCk','nhk.mp3'),
(26,'Shihandu Takenu Des','Rory in early 20s',NULL,'https://www.youtube.com/watch?v=7AFPNtupKgI','ShihanduTakenuDes.mp3'),
(27,'Chrome Hearts','Nfract',NULL,'https://www.youtube.com/watch?v=AUHziXV61nw','ChromeHearts.mp3'),
(28,'Hacker','Death Grips',NULL,'https://www.youtube.com/watch?v=uoZgZT4DGSY','Hacker.mp3'),
(29,'SALMON CANNON','NANORAY',NULL,'https://www.youtube.com/watch?v=cLFryV6tumw','SALMONCANNON.mp3'),
(30,'Countach Ballad','GnB Chili',NULL,'https://www.youtube.com/watch?v=f9JwI8DkizU','CountachBallad.mp3'),
(31,'BRAINWORMS','Rural Internet',NULL,'https://www.youtube.com/watch?v=5jJBxZdC3D8','brainworms.mp3'),
(32,'恢复','2 8 1 4',NULL,'https://www.youtube.com/watch?v=CwJx3Dbh4e8','birthofanewday.mp3'),
(33,'Mary\'s Theme','Stelvio Cipriani',NULL,'https://www.youtube.com/watch?v=OGQR3Chf9hE','marystheme.mp3'),
(34,'Shiki No Uta (Cover)','The Brotet',NULL,'https://www.youtube.com/watch?v=IiVkl_n5qvw','shikinouta.mp3'),
(35,'Look Alive, Sunshine','Asian Glow & Weatherday',NULL,'https://www.youtube.com/watch?v=WkOTGBRRnS8','lookalive.mp3'),
(36,'Can You Hear the Whistle Blow','缺省',NULL,'https://www.youtube.com/watch?v=-QzVLHfe0gk','whistle.mp3'),
(37,'iliad','my dead girlfriend',NULL,'https://www.youtube.com/watch?v=BkXvL0CWyBo','iliad.mp3'),
(38,'THE THIRD EYE (Fool on cool Version)','the pillows',NULL,'https://www.youtube.com/watch?v=nCosaOgmF2o','thirdeye.mp3'),
(39,'左の種','downy',NULL,'https://www.youtube.com/watch?v=6wj7VwAagbU','downy.mp3'),
(40,'Cut Lips','Weatherday',NULL,'https://www.youtube.com/watch?v=Rjyt_lMR5FA','cutlips.mp3'),
(41,'lochness','julie',NULL,'https://www.youtube.com/watch?v=M9BUMGvjq0g','lochness.mp3'),
(42,'Primal','CQ',NULL,'https://www.youtube.com/watch?v=2u6mCKUlVvo','primal.mp3'),
(43,'More Rain','Twinkle Park',NULL,'https://www.youtube.com/watch?v=A239OlBoPAk','morerain.mp3'),
(44,'Heathers','Surf Curse',NULL,'https://www.youtube.com/watch?v=f1SdjtDljOg','heathers.mp3'),
(45,'T.V. Drones','Clams',NULL,'https://www.youtube.com/watch?v=DIPL4_Qc35M','tvdrones.mp3'),
(46,'夜鷹','Kinoko Teikoku',NULL,'https://www.youtube.com/watch?v=rmeKRQXjfZA','kino.mp3'),
(47,'New Order','MASS OF THE FERMENTING DREGS',NULL,'https://www.youtube.com/watch?v=CrK8Svu25Bs','neworder.mp3'),
(48,'This Too Shall Pass','Delete Insert',NULL,'https://www.youtube.com/watch?v=qx0V3ORmIOc','deleteinsert.mp3'),
(49,'Resonance','Home',NULL,'https://www.youtube.com/watch?v=9wOKrDbaGwU','resonance.mp3'),
(50,'from the roof top~somewhere in the silence [sniper\'s theme]','Ilaria Graziano',NULL,'https://www.youtube.com/watch?v=0PRXwtdmjcA','sniperstheme.mp3'),
(51,'Only You','Hakushi Hasegawa',NULL,'https://www.youtube.com/watch?v=TbRoIhHySWY','onlyyou.mp3'),
(52,'Судно (Борис Рижий)','Molchat Doma',NULL,'https://www.youtube.com/watch?v=6KeEw0yp9_Q','ship.mp3'),
(53,'Caught In Time, So Far Away','You\'ll Never Get To Heaven',NULL,'https://www.youtube.com/watch?v=TUGZnd0LrQo','caughtintime.mp3'),
(54,'Rose in a Glass','Provoker',NULL,'https://www.youtube.com/watch?v=M8-7ow5ACgw','roseinaglass.mp3'),
(55,'HURT','1 800 PAIN',NULL,'https://www.youtube.com/watch?v=yt8L0K14Q6E','hurt.mp3'),
(56,'ESPER','FREE.99',NULL,'https://www.youtube.com/watch?v=DNizaPN4Tas','esper.mp3'),
(57,'ctrl','Mayyro',NULL,'https://www.youtube.com/watch?v=yO9uLKwrArs','ctrl.mp3'),
(58,'seventeen','Jane Remover',NULL,'https://www.youtube.com/watch?v=nC32adEGRVI','seventeen.opus'),
(59,'Pain','Pink Panthress',NULL,'https://www.youtube.com/watch?v=lw_XFnk5kwU','pain.opus'),
(60,'Last Song','CQ',NULL,'https://www.youtube.com/watch?v=fv8qtyYM6O8','LastSong.opus'),
(61,'Tetsuo The Bullet Man Theme','Trent Reznor',NULL,'https://www.youtube.com/watch?v=HvqPrAbMcK0','TetsuoTheBulletMan.opus'),
(62,'white girl manifestation type beat','haunt',NULL,'https://soundcloud.com/hauntinglyhorrible/shes2cute','WhiteGirlManifestation.opus'),
(63,'It\'s Almost Like You\'re Here','Yndling',NULL,'https://www.youtube.com/watch?v=YQBUCt4XVdw','ItsAlmostLikeYoureHere.m4a'),
(64,'Backstairs Breathing','Fleshwater',NULL,'https://www.youtube.com/watch?v=bJZIyKAtfek','BackstairsBreathing.opus'),
(65,'Kikoken (Hyper Mode)','Goreshit',NULL,'https://www.youtube.com/watch?v=pkgNW8-rioo','Kikoken.opus'),
(66,'Be Normal','Joyless',NULL,'https://www.youtube.com/watch?v=m4j7dpdQ6-k','BeNormal.opus'),
(67,'PAIN IS GOOD','1 800 PAIN',NULL,'https://www.youtube.com/watch?v=gfoCxh_5jzM','PAINISGOOD.opus'),
(68,'Road Movie','Sylvia55',NULL,'https://www.youtube.com/watch?v=H-m4vBYswTs','RoadMovie.opus'),
(69,'Sicko Mode','Travis Scott',NULL,'https://www.youtube.com/watch?v=xBRhIsJZ2eU','TrainingMode.opus'),
(70,'Dumbest Girl Alive','100 Gecs',NULL,'https://www.youtube.com/watch?v=oXrbMDww9ss','DumbestGirlAlive.m4a');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-09-26 21:39:01
