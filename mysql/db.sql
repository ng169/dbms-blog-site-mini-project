-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: blogsite
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `subtitle` varchar(300) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `num_of_bookmarks` int DEFAULT '0',
  `author_id` int NOT NULL,
  PRIMARY KEY (`blog_id`),
  UNIQUE KEY `blog_id_UNIQUE` (`blog_id`),
  KEY `blogAuthor_idx` (`author_id`),
  CONSTRAINT `blogAuthor` FOREIGN KEY (`author_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'Lionel Messi: The GOAT','Messi Vs Ronaldo: Is The Debate Over ‘Who Is The GOAT’ Finally Settled?','<p><img alt=\"\" src=\"https://images.augustman.com/wp-content/uploads/sites/6/2022/12/21141817/Messi-Ronaldo-GOAT.jpg?tr=w-1920\" style=\"float:left\" /></p>\r\n\r\n<p>There is certainly no doubt that Lionel Messi and Cristiano Ronaldo are the two greatest footballers of the first quarter of the 21st century. But who is better when pitted against each other and how do their stats compare? When it comes to Messi vs Ronaldo, the debate over who&rsquo;s better has been going on for two decades and may have just come to a close at the 2022 FIFA World Cup in Qatar.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Before we dive into the statistics to try to find an answer, it is important to note that even FIFA now apparently considers the debate to be over with Messi leading Argentina to its third World Cup championship.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&ldquo;The GOAT debate is settled. The ultimate prize is now part of the collection. The legacy is complete,&rdquo; read a tweet posted by FIFA, with a picture of Messi holding the World Cup in one hand and his fifth Player of the Match award in the tournament after the final against France.</p>\r\n\r\n<p>Messi has done what Ronaldo couldn&rsquo;t. While both players have won every major trophy for club and country, the only prize missing from their cabinet was the&nbsp;<a href=\"https://www.augustman.com/in/culture/events/2022-fifa-world-cup-moments-shocking-inspiring-upsets/\" target=\"_blank\">FIFA World Cup</a>. Messi now has that while Ronaldo&rsquo;s dreams came crashing down as Portugal was knocked out by a spirited Morocco in the quarter-finals of the tournament in Qatar.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Indeed, the FIFA World Cup is what appears to have made the difference between the respective greatness of Messi and Ronaldo. However, statistics do help get a much clearer picture, and this is where the Messi vs Ronaldo debate gets intense.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Overall, Messi has scored 98 goals for Argentina in 172 games and is the record holder for most international goals by a South American male footballer.</p>\r\n\r\n<p>At the club level, Messi holds the record for most goals in La Liga with 474. In total, including clubs and country, Messi has scored 793 goals in 1,003 appearances. He also has 350 assists to his name.</p>\r\n\r\n<p>On the other hand, Ronaldo has scored 819 goals in 1,145 appearances for both club and country. The footballer has 234 assists to his name.</p>\r\n\r\n<p>Ronaldo is the&nbsp;<a href=\"https://www.augustman.com/in/amselect/hit-list/cristiano-ronaldo-manchester-united-insane-footballing-records/\" target=\"_blank\">top goalscorer</a>&nbsp;in men&rsquo;s international football with 118 goals for Portugal in 196 appearances. At the club level, he is also the all-time top goalscorer for La Liga team Real Madrid with 450 goals. He holds the record for most goals in the UEFA Champions League with 140.</p>\r\n\r\n<p>However, Messi holds the Guinness World Record for most goals in a calendar year with 91 in 2012. Ronaldo&rsquo;s highest in a calendar year is 69 goals.<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p>Several football pundits, current and former players have now said that the debate is over with Messi winning the FIFA World Cup in his last appearance in the most important tournament of the beautiful game.</p>\r\n\r\n<p>Messi certainly has now won everything that football can offer. However, it is also clear that Ronaldo is a gift to the game like no other. The Portugal great&rsquo;s goals outshine everyone past or present. That&rsquo;s in itself a statistic that Messi might never be able to match, given that Ronaldo is still playing even though he is 37 years old.</p>\r\n\r\n<p><img alt=\"\" src=\"https://images.augustman.com/wp-content/uploads/sites/6/2022/12/21142844/Leo-Messi-FIFA.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n','2023-01-22 18:27:26','2023-01-23 03:19:04',2,3),(2,'OpenAI domination','Microsoft Bets Big on the Creator of ChatGPT','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae gravida nunc, nec tincidunt ex. In ultrices volutpat elit ut pretium. Etiam lacus eros, venenatis auctor lectus nec, lobortis consectetur neque. Duis commodo porttitor urna, id cursus lectus vestibulum a. In id lorem metus. Pellentesque quis neque iaculis, venenatis lacus eget, dapibus risus. Donec interdum ut mauris et faucibus. Cras ut rutrum sapien. Integer at urna vitae lorem vestibulum tempus eu vel augue. Suspendisse non elit tellus. Proin in laoreet urna. Donec tristique purus eros, non rhoncus nunc volutpat eu. Aliquam egestas est et viverra ultricies. Nullam volutpat sapien sapien, a malesuada arcu consectetur in. Cras interdum, elit vitae aliquet volutpat, dui nisi ultrices tellus, vel commodo mi ipsum ac ligula. Phasellus pellentesque, ante sit amet ultrices aliquet, nulla enim maximus dui, quis aliquet quam mauris quis leo.</p>\r\n\r\n<p>Suspendisse ac turpis eget mi aliquam ultrices. Mauris maximus hendrerit tempor. Maecenas sed augue ante. Aenean a nisi eu mi sagittis luctus et nec mauris. Vivamus dolor lectus, varius nec sollicitudin et, elementum a tortor. Donec ultrices sagittis congue. Maecenas a consequat justo, eu consectetur tortor. Sed imperdiet erat dui, sit amet auctor odio maximus nec. Sed arcu ipsum, consectetur et metus sit amet, maximus maximus nibh. Pellentesque ac nulla non lorem vehicula aliquam nec eget nunc. Fusce in sapien vitae felis suscipit convallis. Sed vel arcu velit. Curabitur vel ante aliquet, venenatis nisl a, ultrices nibh. Pellentesque porttitor id tellus vitae congue. Donec ante arcu, auctor nec est ac, ornare tempor tortor.</p>\r\n\r\n<p>Vestibulum lacus ante, interdum nec dolor non, luctus ornare magna. Vivamus blandit vestibulum leo. Maecenas posuere porttitor neque sed viverra. Nullam non ante libero. Quisque odio massa, feugiat vel orci sed, molestie ultrices justo. Sed rutrum molestie porttitor. Fusce pretium, odio et tristique scelerisque, magna purus semper odio, quis euismod eros odio quis est. Cras convallis dignissim augue rutrum vestibulum. Nulla porttitor lectus vitae ipsum imperdiet, at volutpat purus lobortis. Nam luctus neque metus, nec tempus orci ultricies et. Nulla finibus eros sit amet dictum sagittis. Nam sed dignissim eros.</p>\r\n\r\n<p>Nunc ornare nunc vehicula posuere mollis. Morbi accumsan hendrerit nibh vitae fermentum. Sed a pulvinar leo, gravida vulputate leo. Integer rutrum orci a vehicula aliquet. Sed placerat, diam ut lobortis porta, nunc nisl dapibus ex, non elementum risus neque sit amet diam. Nulla feugiat nunc leo, a ultricies leo rhoncus ut. Pellentesque elementum finibus eros, nec fringilla nisi placerat quis. Etiam neque velit, porttitor id lectus eget, bibendum venenatis quam. Phasellus facilisis vestibulum felis, et ultricies sem gravida molestie. Donec consectetur leo pellentesque ex euismod vestibulum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam non lacinia enim.</p>\r\n\r\n<p>Nulla elementum nisl non neque dictum sollicitudin. Phasellus consectetur tellus id pulvinar tincidunt. Nam faucibus magna nec hendrerit pulvinar. Quisque maximus varius est at cursus. Pellentesque sed tellus eget sapien iaculis imperdiet. Sed sit amet tortor id dui aliquam pretium. Vivamus vitae ornare turpis. Donec dapibus eleifend magna, at dapibus neque varius nec. Praesent varius nulla dui, non consectetur augue tempus id. In sit amet leo sit amet lacus congue placerat non quis ipsum. In placerat orci ut sodales ultrices.</p>\r\n\r\n<p>Praesent dignissim lectus aliquam nisi sodales, eget sodales diam porta. Nullam hendrerit purus at nunc feugiat, eget hendrerit dolor congue. In sit amet varius risus. Nullam ultrices dictum suscipit. Sed eu tellus vitae lorem hendrerit suscipit at sit amet metus. Integer eu massa facilisis, suscipit magna non, tristique magna. Donec a lacinia nisl.</p>\r\n\r\n<p>Proin ac nisi at dui commodo convallis. Phasellus tincidunt placerat nibh, et elementum mauris mollis non. Curabitur congue risus nunc, ut pulvinar nisl lobortis et. Vestibulum non nulla eleifend, consequat lorem sed, interdum mi. Suspendisse neque ex, aliquam luctus dolor bibendum, mollis blandit turpis. Nam laoreet pulvinar magna eget convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam blandit vitae lorem eget dictum.</p>\r\n\r\n<p>Cras mattis, lorem et aliquet varius, lectus odio consequat nunc, et pulvinar metus dui ac velit. Sed consectetur pretium orci sit amet imperdiet. Duis dictum massa quis nunc scelerisque tempus. Vivamus commodo tellus in feugiat aliquam. Pellentesque rutrum tempor sem, nec aliquet diam posuere non. Maecenas non nisl vitae magna suscipit mattis. Nam at augue enim. Vivamus euismod mi ac quam tempus, dignissim molestie enim hendrerit. Cras at efficitur est. Nulla non nibh in tortor iaculis eleifend. Phasellus ut metus vitae erat porta vestibulum nec id est. Cras ac sem nisl. Vestibulum id vulputate arcu. Nulla vehicula tristique ex vitae tincidunt. Nunc nulla erat, consectetur malesuada ornare nec, vestibulum sed risus. Nam tempus eget diam eget vulputate.</p>\r\n\r\n<p>Nam id libero scelerisque orci elementum faucibus. Suspendisse maximus dui at fringilla sodales. Pellentesque et nulla at felis faucibus laoreet a sed orci. Nam cursus urna ut eros vehicula aliquam. Aliquam consectetur dictum lectus, et commodo diam pretium eget. Proin vitae mauris ultricies, volutpat lorem ac, sollicitudin mi. Morbi cursus venenatis rhoncus. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n\r\n<p>Nunc pretium suscipit massa, non porta ex viverra vitae. Nulla dictum rutrum consectetur. Proin auctor, mi id vestibulum aliquam, libero elit rhoncus metus, quis ultricies justo metus commodo urna. Suspendisse ac sapien id nibh commodo faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis tempus rhoncus enim, vel cursus nibh dignissim vel. Nunc non augue semper augue ultricies pulvinar.</p>\r\n','2023-01-23 03:23:31','2023-01-25 15:36:56',2,1),(3,'DBMS made easy','Learn everything you need to master DBMS in this blog.','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus, ante a feugiat semper, justo metus imperdiet odio, et tempus ex tortor a augue. Donec at magna iaculis velit tempus finibus. Curabitur porta lacus lorem, nec malesuada ante aliquet in. Cras id sem vitae mauris interdum bibendum. Maecenas tincidunt non leo eget iaculis. Praesent tempus, tellus a pretium auctor, arcu neque semper nisi, eu pretium nisi massa in orci. Nullam at sapien in nisl vehicula ultricies. Quisque nec tortor vel quam maximus dapibus vel at orci. Sed nec vulputate justo, et varius arcu.<br />\r\n<br />\r\nSed sodales tortor elit, vitae facilisis eros imperdiet ornare. Nullam eu dolor in elit tincidunt rutrum imperdiet sed lectus. Phasellus vulputate tortor non dui efficitur blandit nec eu ipsum. Donec sodales nibh mattis ante varius, vel consequat arcu tristique. Fusce at justo vitae lorem luctus semper. Praesent ac nisi ornare, viverra elit ullamcorper, imperdiet ante. Donec vitae augue sit amet ligula sollicitudin malesuada.<br />\r\n<br />\r\nCurabitur libero orci, tristique sed ante nec, congue eleifend nibh. Vivamus vehicula, sem vel suscipit mollis, urna ipsum maximus mi, ut pulvinar mauris justo ac augue. Maecenas at laoreet arcu. Suspendisse vel magna vel dolor sagittis luctus in ac massa. Cras aliquet pulvinar dignissim. Nunc at elementum turpis, nec eleifend neque. Donec lobortis egestas magna, eget efficitur ligula tempus non. Phasellus sit amet euismod lacus. Fusce ultricies quam id ligula tempor dapibus. Sed pharetra enim eget feugiat vehicula. Quisque pulvinar magna quis gravida feugiat. Vivamus vitae eros nec lorem molestie placerat et quis est. Vestibulum eget eros ut quam maximus fermentum eget non elit. Integer ac varius quam. Ut mollis tortor sem, vel tincidunt arcu malesuada a. Mauris lectus lacus, varius id tortor ut, sodales maximus ligula.<br />\r\n<br />\r\nPhasellus ultrices tempor consequat. Donec venenatis fermentum felis. Fusce pretium mauris sem, vel lobortis ipsum commodo pulvinar. Sed arcu mauris, euismod et rhoncus molestie, vehicula ac tortor. In euismod diam eu sem mattis commodo. Sed at nisi mauris. In cursus gravida iaculis. Praesent eleifend a nibh a condimentum. Maecenas euismod tellus ac facilisis sodales. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam auctor fringilla enim eu pellentesque. Aenean maximus a nunc sit amet dapibus. Sed mollis purus sapien, non tincidunt est condimentum ut<br />\r\n<br />\r\nSed vitae venenatis nulla, vel scelerisque est. Praesent id ultrices est, at bibendum lacus. Cras sollicitudin, mi a consequat vestibulum, mi purus feugiat elit, id dignissim erat justo nec odio. Morbi a euismod orci. Pellentesque nec arcu pharetra, lobortis dui vitae, aliquam felis. Pellentesque eu vestibulum leo, at efficitur enim. Praesent fringilla tellus lorem, in porta quam tempor non. Proin commodo metus ut erat volutpat pellentesque. Fusce ac egestas orci. Morbi sit amet massa justo.<br />\r\n<br />\r\nMorbi vel lorem lorem. Nunc sed ultricies tellus. Sed et diam venenatis, luctus ipsum a, pulvinar turpis. Nullam scelerisque erat quis augue tempor, sed hendrerit lectus auctor. Aenean ac tortor eu arcu euismod cursus. Nunc eget leo sed est laoreet elementum. Mauris feugiat facilisis dolor. Vestibulum sit amet orci quis velit dictum viverra quis in urna. In scelerisque enim porta, facilisis purus sed, cursus urna. Maecenas tempor tincidunt ligula ut tempus.<br />\r\n<br />\r\nAenean tellus diam, sagittis at arcu non, aliquam efficitur leo. Aenean interdum lorem ut velit molestie, sed iaculis odio venenatis. Sed nec bibendum orci. Mauris lectus dui, sodales nec ornare quis, elementum ut orci. Vivamus augue sem, dapibus a sapien a, ullamcorper finibus ante. Maecenas id semper libero. Phasellus augue nibh, varius et tristique id, pulvinar id libero. Fusce semper, nisi sit amet varius tempor, libero velit aliquam lacus, id mattis metus nunc sit amet risus. Vestibulum a faucibus massa. Vestibulum consequat non libero vitae finibus. Vestibulum consequat turpis sed elementum sodales. Nullam volutpat, magna ornare dictum tincidunt, neque ipsum consectetur justo, quis dignissim leo metus a neque. Sed vulputate ex eget nisi pharetra, luctus malesuada ante dictum. Nunc et lorem massa.<br />\r\n<br />\r\nDonec in quam ut orci faucibus dignissim. Nulla venenatis est ut massa suscipit rhoncus. Nulla in nunc finibus, interdum nulla sed, lobortis ligula. Nulla rhoncus volutpat viverra. Quisque at sem justo. Phasellus eget est non lorem iaculis dapibus quis eget purus. In tortor odio, suscipit lobortis euismod vel, scelerisque non orci. Proin nec tortor pulvinar, tempus arcu vel, commodo nisi. Nullam scelerisque eget purus vel accumsan. Duis at lacus in magna ullamcorper pellentesque. Aenean sagittis ex odio, vel malesuada massa lacinia ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris sed mauris ac dolor porta pulvinar ac id arcu. Etiam porta suscipit elementum. Fusce hendrerit posuere laoreet.<br />\r\n<br />\r\nPellentesque ex lectus, egestas egestas rhoncus sit amet, mattis in ante. Aenean at ultricies massa. Morbi velit leo, dignissim at euismod sit amet, tincidunt sit amet diam. Integer eget nunc sollicitudin, euismod libero nec, mollis mi. Praesent et venenatis dui. Sed et rhoncus mi. Nulla volutpat justo tortor, et semper risus euismod tempor. Quisque ultrices eu mi quis sodales. Vestibulum convallis urna eget urna pellentesque, vel fringilla enim luctus. Donec at sollicitudin massa. Suspendisse at diam a nulla fermentum hendrerit. Curabitur facilisis lacus dictum vehicula euismod.<br />\r\n<br />\r\nDonec placerat dolor a congue ullamcorper. Vivamus eget urna lacus. Pellentesque sagittis eu neque vel tincidunt. Aenean in ligula vel ipsum pharetra scelerisque nec eu urna. Maecenas dignissim arcu sed magna viverra, fringilla varius nulla gravida. Praesent laoreet eu augue nec pulvinar. Ut varius tempor orci, quis hendrerit justo malesuada tincidunt. Nulla sit amet sagittis lectus.</p>\r\n','2023-01-23 03:27:31','2023-01-23 03:49:31',1,1),(4,'Eating for Energy','Fueling your body with the right foods','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus, ante a feugiat semper, justo metus imperdiet odio, et tempus ex tortor a augue. Donec at magna iaculis velit tempus finibus. Curabitur porta lacus lorem, nec malesuada ante aliquet in. Cras id sem vitae mauris interdum bibendum. Maecenas tincidunt non leo eget iaculis. Praesent tempus, tellus a pretium auctor, arcu neque semper nisi, eu pretium nisi massa in orci. Nullam at sapien in nisl vehicula ultricies. Quisque nec tortor vel quam maximus dapibus vel at orci. Sed nec vulputate justo, et varius arcu.<br />\r\n<br />\r\nSed sodales tortor elit, vitae facilisis eros imperdiet ornare. Nullam eu dolor in elit tincidunt rutrum imperdiet sed lectus. Phasellus vulputate tortor non dui efficitur blandit nec eu ipsum. Donec sodales nibh mattis ante varius, vel consequat arcu tristique. Fusce at justo vitae lorem luctus semper. Praesent ac nisi ornare, viverra elit ullamcorper, imperdiet ante. Donec vitae augue sit amet ligula sollicitudin malesuada.<br />\r\n<br />\r\nCurabitur libero orci, tristique sed ante nec, congue eleifend nibh. Vivamus vehicula, sem vel suscipit mollis, urna ipsum maximus mi, ut pulvinar mauris justo ac augue. Maecenas at laoreet arcu. Suspendisse vel magna vel dolor sagittis luctus in ac massa. Cras aliquet pulvinar dignissim. Nunc at elementum turpis, nec eleifend neque. Donec lobortis egestas magna, eget efficitur ligula tempus non. Phasellus sit amet euismod lacus. Fusce ultricies quam id ligula tempor dapibus. Sed pharetra enim eget feugiat vehicula. Quisque pulvinar magna quis gravida feugiat. Vivamus vitae eros nec lorem molestie placerat et quis est. Vestibulum eget eros ut quam maximus fermentum eget non elit. Integer ac varius quam. Ut mollis tortor sem, vel tincidunt arcu malesuada a. Mauris lectus lacus, varius id tortor ut, sodales maximus ligula.<br />\r\n<br />\r\nPhasellus ultrices tempor consequat. Donec venenatis fermentum felis. Fusce pretium mauris sem, vel lobortis ipsum commodo pulvinar. Sed arcu mauris, euismod et rhoncus molestie, vehicula ac tortor. In euismod diam eu sem mattis commodo. Sed at nisi mauris. In cursus gravida iaculis. Praesent eleifend a nibh a condimentum. Maecenas euismod tellus ac facilisis sodales. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam auctor fringilla enim eu pellentesque. Aenean maximus a nunc sit amet dapibus. Sed mollis purus sapien, non tincidunt est condimentum ut<br />\r\n<br />\r\nSed vitae venenatis nulla, vel scelerisque est. Praesent id ultrices est, at bibendum lacus. Cras sollicitudin, mi a consequat vestibulum, mi purus feugiat elit, id dignissim erat justo nec odio. Morbi a euismod orci. Pellentesque nec arcu pharetra, lobortis dui vitae, aliquam felis. Pellentesque eu vestibulum leo, at efficitur enim. Praesent fringilla tellus lorem, in porta quam tempor non. Proin commodo metus ut erat volutpat pellentesque. Fusce ac egestas orci. Morbi sit amet massa justo.<br />\r\n<br />\r\nMorbi vel lorem lorem. Nunc sed ultricies tellus. Sed et diam venenatis, luctus ipsum a, pulvinar turpis. Nullam scelerisque erat quis augue tempor, sed hendrerit lectus auctor. Aenean ac tortor eu arcu euismod cursus. Nunc eget leo sed est laoreet elementum. Mauris feugiat facilisis dolor. Vestibulum sit amet orci quis velit dictum viverra quis in urna. In scelerisque enim porta, facilisis purus sed, cursus urna. Maecenas tempor tincidunt ligula ut tempus.<br />\r\n<br />\r\nAenean tellus diam, sagittis at arcu non, aliquam efficitur leo. Aenean interdum lorem ut velit molestie, sed iaculis odio venenatis. Sed nec bibendum orci. Mauris lectus dui, sodales nec ornare quis, elementum ut orci. Vivamus augue sem, dapibus a sapien a, ullamcorper finibus ante. Maecenas id semper libero. Phasellus augue nibh, varius et tristique id, pulvinar id libero. Fusce semper, nisi sit amet varius tempor, libero velit aliquam lacus, id mattis metus nunc sit amet risus. Vestibulum a faucibus massa. Vestibulum consequat non libero vitae finibus. Vestibulum consequat turpis sed elementum sodales. Nullam volutpat, magna ornare dictum tincidunt, neque ipsum consectetur justo, quis dignissim leo metus a neque. Sed vulputate ex eget nisi pharetra, luctus malesuada ante dictum. Nunc et lorem massa.<br />\r\n<br />\r\nDonec in quam ut orci faucibus dignissim. Nulla venenatis est ut massa suscipit rhoncus. Nulla in nunc finibus, interdum nulla sed, lobortis ligula. Nulla rhoncus volutpat viverra. Quisque at sem justo. Phasellus eget est non lorem iaculis dapibus quis eget purus. In tortor odio, suscipit lobortis euismod vel, scelerisque non orci. Proin nec tortor pulvinar, tempus arcu vel, commodo nisi. Nullam scelerisque eget purus vel accumsan. Duis at lacus in magna ullamcorper pellentesque. Aenean sagittis ex odio, vel malesuada massa lacinia ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris sed mauris ac dolor porta pulvinar ac id arcu. Etiam porta suscipit elementum. Fusce hendrerit posuere laoreet.<br />\r\n<br />\r\nPellentesque ex lectus, egestas egestas rhoncus sit amet, mattis in ante. Aenean at ultricies massa. Morbi velit leo, dignissim at euismod sit amet, tincidunt sit amet diam. Integer eget nunc sollicitudin, euismod libero nec, mollis mi. Praesent et venenatis dui. Sed et rhoncus mi. Nulla volutpat justo tortor, et semper risus euismod tempor. Quisque ultrices eu mi quis sodales. Vestibulum convallis urna eget urna pellentesque, vel fringilla enim luctus. Donec at sollicitudin massa. Suspendisse at diam a nulla fermentum hendrerit. Curabitur facilisis lacus dictum vehicula euismod.<br />\r\n<br />\r\nDonec placerat dolor a congue ullamcorper. Vivamus eget urna lacus. Pellentesque sagittis eu neque vel tincidunt. Aenean in ligula vel ipsum pharetra scelerisque nec eu urna. Maecenas dignissim arcu sed magna viverra, fringilla varius nulla gravida. Praesent laoreet eu augue nec pulvinar. Ut varius tempor orci, quis hendrerit justo malesuada tincidunt. Nulla sit amet sagittis lectus.</p>\r\n','2023-01-23 03:32:08','2023-01-23 03:32:08',0,1),(5,'Creative Writing','Unplug you inner author','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus, ante a feugiat semper, justo metus imperdiet odio, et tempus ex tortor a augue. Donec at magna iaculis velit tempus finibus. Curabitur porta lacus lorem, nec malesuada ante aliquet in. Cras id sem vitae mauris interdum bibendum. Maecenas tincidunt non leo eget iaculis. Praesent tempus, tellus a pretium auctor, arcu neque semper nisi, eu pretium nisi massa in orci. Nullam at sapien in nisl vehicula ultricies. Quisque nec tortor vel quam maximus dapibus vel at orci. Sed nec vulputate justo, et varius arcu.<br />\r\n<br />\r\nSed sodales tortor elit, vitae facilisis eros imperdiet ornare. Nullam eu dolor in elit tincidunt rutrum imperdiet sed lectus. Phasellus vulputate tortor non dui efficitur blandit nec eu ipsum. Donec sodales nibh mattis ante varius, vel consequat arcu tristique. Fusce at justo vitae lorem luctus semper. Praesent ac nisi ornare, viverra elit ullamcorper, imperdiet ante. Donec vitae augue sit amet ligula sollicitudin malesuada.<br />\r\n<br />\r\nCurabitur libero orci, tristique sed ante nec, congue eleifend nibh. Vivamus vehicula, sem vel suscipit mollis, urna ipsum maximus mi, ut pulvinar mauris justo ac augue. Maecenas at laoreet arcu. Suspendisse vel magna vel dolor sagittis luctus in ac massa. Cras aliquet pulvinar dignissim. Nunc at elementum turpis, nec eleifend neque. Donec lobortis egestas magna, eget efficitur ligula tempus non. Phasellus sit amet euismod lacus. Fusce ultricies quam id ligula tempor dapibus. Sed pharetra enim eget feugiat vehicula. Quisque pulvinar magna quis gravida feugiat. Vivamus vitae eros nec lorem molestie placerat et quis est. Vestibulum eget eros ut quam maximus fermentum eget non elit. Integer ac varius quam. Ut mollis tortor sem, vel tincidunt arcu malesuada a. Mauris lectus lacus, varius id tortor ut, sodales maximus ligula.<br />\r\n<br />\r\nPhasellus ultrices tempor consequat. Donec venenatis fermentum felis. Fusce pretium mauris sem, vel lobortis ipsum commodo pulvinar. Sed arcu mauris, euismod et rhoncus molestie, vehicula ac tortor. In euismod diam eu sem mattis commodo. Sed at nisi mauris. In cursus gravida iaculis. Praesent eleifend a nibh a condimentum. Maecenas euismod tellus ac facilisis sodales. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam auctor fringilla enim eu pellentesque. Aenean maximus a nunc sit amet dapibus. Sed mollis purus sapien, non tincidunt est condimentum ut<br />\r\n<br />\r\nSed vitae venenatis nulla, vel scelerisque est. Praesent id ultrices est, at bibendum lacus. Cras sollicitudin, mi a consequat vestibulum, mi purus feugiat elit, id dignissim erat justo nec odio. Morbi a euismod orci. Pellentesque nec arcu pharetra, lobortis dui vitae, aliquam felis. Pellentesque eu vestibulum leo, at efficitur enim. Praesent fringilla tellus lorem, in porta quam tempor non. Proin commodo metus ut erat volutpat pellentesque. Fusce ac egestas orci. Morbi sit amet massa justo.<br />\r\n<br />\r\nMorbi vel lorem lorem. Nunc sed ultricies tellus. Sed et diam venenatis, luctus ipsum a, pulvinar turpis. Nullam scelerisque erat quis augue tempor, sed hendrerit lectus auctor. Aenean ac tortor eu arcu euismod cursus. Nunc eget leo sed est laoreet elementum. Mauris feugiat facilisis dolor. Vestibulum sit amet orci quis velit dictum viverra quis in urna. In scelerisque enim porta, facilisis purus sed, cursus urna. Maecenas tempor tincidunt ligula ut tempus.<br />\r\n<br />\r\nAenean tellus diam, sagittis at arcu non, aliquam efficitur leo. Aenean interdum lorem ut velit molestie, sed iaculis odio venenatis. Sed nec bibendum orci. Mauris lectus dui, sodales nec ornare quis, elementum ut orci. Vivamus augue sem, dapibus a sapien a, ullamcorper finibus ante. Maecenas id semper libero. Phasellus augue nibh, varius et tristique id, pulvinar id libero. Fusce semper, nisi sit amet varius tempor, libero velit aliquam lacus, id mattis metus nunc sit amet risus. Vestibulum a faucibus massa. Vestibulum consequat non libero vitae finibus. Vestibulum consequat turpis sed elementum sodales. Nullam volutpat, magna ornare dictum tincidunt, neque ipsum consectetur justo, quis dignissim leo metus a neque. Sed vulputate ex eget nisi pharetra, luctus malesuada ante dictum. Nunc et lorem massa.<br />\r\n<br />\r\nDonec in quam ut orci faucibus dignissim. Nulla venenatis est ut massa suscipit rhoncus. Nulla in nunc finibus, interdum nulla sed, lobortis ligula. Nulla rhoncus volutpat viverra. Quisque at sem justo. Phasellus eget est non lorem iaculis dapibus quis eget purus. In tortor odio, suscipit lobortis euismod vel, scelerisque non orci. Proin nec tortor pulvinar, tempus arcu vel, commodo nisi. Nullam scelerisque eget purus vel accumsan. Duis at lacus in magna ullamcorper pellentesque. Aenean sagittis ex odio, vel malesuada massa lacinia ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris sed mauris ac dolor porta pulvinar ac id arcu. Etiam porta suscipit elementum. Fusce hendrerit posuere laoreet.<br />\r\n<br />\r\nPellentesque ex lectus, egestas egestas rhoncus sit amet, mattis in ante. Aenean at ultricies massa. Morbi velit leo, dignissim at euismod sit amet, tincidunt sit amet diam. Integer eget nunc sollicitudin, euismod libero nec, mollis mi. Praesent et venenatis dui. Sed et rhoncus mi. Nulla volutpat justo tortor, et semper risus euismod tempor. Quisque ultrices eu mi quis sodales. Vestibulum convallis urna eget urna pellentesque, vel fringilla enim luctus. Donec at sollicitudin massa. Suspendisse at diam a nulla fermentum hendrerit. Curabitur facilisis lacus dictum vehicula euismod.<br />\r\n<br />\r\nDonec placerat dolor a congue ullamcorper. Vivamus eget urna lacus. Pellentesque sagittis eu neque vel tincidunt. Aenean in ligula vel ipsum pharetra scelerisque nec eu urna. Maecenas dignissim arcu sed magna viverra, fringilla varius nulla gravida. Praesent laoreet eu augue nec pulvinar. Ut varius tempor orci, quis hendrerit justo malesuada tincidunt. Nulla sit amet sagittis lectus.</p>\r\n','2023-01-23 03:32:36','2023-01-23 03:32:36',0,1),(6,'Financial Planning','Setting and achieve financial goals','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus, ante a feugiat semper, justo metus imperdiet odio, et tempus ex tortor a augue. Donec at magna iaculis velit tempus finibus. Curabitur porta lacus lorem, nec malesuada ante aliquet in. Cras id sem vitae mauris interdum bibendum. Maecenas tincidunt non leo eget iaculis. Praesent tempus, tellus a pretium auctor, arcu neque semper nisi, eu pretium nisi massa in orci. Nullam at sapien in nisl vehicula ultricies. Quisque nec tortor vel quam maximus dapibus vel at orci. Sed nec vulputate justo, et varius arcu.<br />\r\n<br />\r\nSed sodales tortor elit, vitae facilisis eros imperdiet ornare. Nullam eu dolor in elit tincidunt rutrum imperdiet sed lectus. Phasellus vulputate tortor non dui efficitur blandit nec eu ipsum. Donec sodales nibh mattis ante varius, vel consequat arcu tristique. Fusce at justo vitae lorem luctus semper. Praesent ac nisi ornare, viverra elit ullamcorper, imperdiet ante. Donec vitae augue sit amet ligula sollicitudin malesuada.<br />\r\n<br />\r\nCurabitur libero orci, tristique sed ante nec, congue eleifend nibh. Vivamus vehicula, sem vel suscipit mollis, urna ipsum maximus mi, ut pulvinar mauris justo ac augue. Maecenas at laoreet arcu. Suspendisse vel magna vel dolor sagittis luctus in ac massa. Cras aliquet pulvinar dignissim. Nunc at elementum turpis, nec eleifend neque. Donec lobortis egestas magna, eget efficitur ligula tempus non. Phasellus sit amet euismod lacus. Fusce ultricies quam id ligula tempor dapibus. Sed pharetra enim eget feugiat vehicula. Quisque pulvinar magna quis gravida feugiat. Vivamus vitae eros nec lorem molestie placerat et quis est. Vestibulum eget eros ut quam maximus fermentum eget non elit. Integer ac varius quam. Ut mollis tortor sem, vel tincidunt arcu malesuada a. Mauris lectus lacus, varius id tortor ut, sodales maximus ligula.<br />\r\n<br />\r\nPhasellus ultrices tempor consequat. Donec venenatis fermentum felis. Fusce pretium mauris sem, vel lobortis ipsum commodo pulvinar. Sed arcu mauris, euismod et rhoncus molestie, vehicula ac tortor. In euismod diam eu sem mattis commodo. Sed at nisi mauris. In cursus gravida iaculis. Praesent eleifend a nibh a condimentum. Maecenas euismod tellus ac facilisis sodales. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam auctor fringilla enim eu pellentesque. Aenean maximus a nunc sit amet dapibus. Sed mollis purus sapien, non tincidunt est condimentum ut<br />\r\n<br />\r\nSed vitae venenatis nulla, vel scelerisque est. Praesent id ultrices est, at bibendum lacus. Cras sollicitudin, mi a consequat vestibulum, mi purus feugiat elit, id dignissim erat justo nec odio. Morbi a euismod orci. Pellentesque nec arcu pharetra, lobortis dui vitae, aliquam felis. Pellentesque eu vestibulum leo, at efficitur enim. Praesent fringilla tellus lorem, in porta quam tempor non. Proin commodo metus ut erat volutpat pellentesque. Fusce ac egestas orci. Morbi sit amet massa justo.<br />\r\n<br />\r\nMorbi vel lorem lorem. Nunc sed ultricies tellus. Sed et diam venenatis, luctus ipsum a, pulvinar turpis. Nullam scelerisque erat quis augue tempor, sed hendrerit lectus auctor. Aenean ac tortor eu arcu euismod cursus. Nunc eget leo sed est laoreet elementum. Mauris feugiat facilisis dolor. Vestibulum sit amet orci quis velit dictum viverra quis in urna. In scelerisque enim porta, facilisis purus sed, cursus urna. Maecenas tempor tincidunt ligula ut tempus.<br />\r\n<br />\r\nAenean tellus diam, sagittis at arcu non, aliquam efficitur leo. Aenean interdum lorem ut velit molestie, sed iaculis odio venenatis. Sed nec bibendum orci. Mauris lectus dui, sodales nec ornare quis, elementum ut orci. Vivamus augue sem, dapibus a sapien a, ullamcorper finibus ante. Maecenas id semper libero. Phasellus augue nibh, varius et tristique id, pulvinar id libero. Fusce semper, nisi sit amet varius tempor, libero velit aliquam lacus, id mattis metus nunc sit amet risus. Vestibulum a faucibus massa. Vestibulum consequat non libero vitae finibus. Vestibulum consequat turpis sed elementum sodales. Nullam volutpat, magna ornare dictum tincidunt, neque ipsum consectetur justo, quis dignissim leo metus a neque. Sed vulputate ex eget nisi pharetra, luctus malesuada ante dictum. Nunc et lorem massa.<br />\r\n<br />\r\nDonec in quam ut orci faucibus dignissim. Nulla venenatis est ut massa suscipit rhoncus. Nulla in nunc finibus, interdum nulla sed, lobortis ligula. Nulla rhoncus volutpat viverra. Quisque at sem justo. Phasellus eget est non lorem iaculis dapibus quis eget purus. In tortor odio, suscipit lobortis euismod vel, scelerisque non orci. Proin nec tortor pulvinar, tempus arcu vel, commodo nisi. Nullam scelerisque eget purus vel accumsan. Duis at lacus in magna ullamcorper pellentesque. Aenean sagittis ex odio, vel malesuada massa lacinia ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris sed mauris ac dolor porta pulvinar ac id arcu. Etiam porta suscipit elementum. Fusce hendrerit posuere laoreet.<br />\r\n<br />\r\nPellentesque ex lectus, egestas egestas rhoncus sit amet, mattis in ante. Aenean at ultricies massa. Morbi velit leo, dignissim at euismod sit amet, tincidunt sit amet diam. Integer eget nunc sollicitudin, euismod libero nec, mollis mi. Praesent et venenatis dui. Sed et rhoncus mi. Nulla volutpat justo tortor, et semper risus euismod tempor. Quisque ultrices eu mi quis sodales. Vestibulum convallis urna eget urna pellentesque, vel fringilla enim luctus. Donec at sollicitudin massa. Suspendisse at diam a nulla fermentum hendrerit. Curabitur facilisis lacus dictum vehicula euismod.<br />\r\n<br />\r\nDonec placerat dolor a congue ullamcorper. Vivamus eget urna lacus. Pellentesque sagittis eu neque vel tincidunt. Aenean in ligula vel ipsum pharetra scelerisque nec eu urna. Maecenas dignissim arcu sed magna viverra, fringilla varius nulla gravida. Praesent laoreet eu augue nec pulvinar. Ut varius tempor orci, quis hendrerit justo malesuada tincidunt. Nulla sit amet sagittis lectus.</p>\r\n','2023-01-23 03:33:20','2023-01-23 03:46:24',1,1),(7,'Virtual Reality','Immersive content so real, the truth really hurts','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus, ante a feugiat semper, justo metus imperdiet odio, et tempus ex tortor a augue. Donec at magna iaculis velit tempus finibus. Curabitur porta lacus lorem, nec malesuada ante aliquet in. Cras id sem vitae mauris interdum bibendum. Maecenas tincidunt non leo eget iaculis. Praesent tempus, tellus a pretium auctor, arcu neque semper nisi, eu pretium nisi massa in orci. Nullam at sapien in nisl vehicula ultricies. Quisque nec tortor vel quam maximus dapibus vel at orci. Sed nec vulputate justo, et varius arcu.<br />\r\n<br />\r\nSed sodales tortor elit, vitae facilisis eros imperdiet ornare. Nullam eu dolor in elit tincidunt rutrum imperdiet sed lectus. Phasellus vulputate tortor non dui efficitur blandit nec eu ipsum. Donec sodales nibh mattis ante varius, vel consequat arcu tristique. Fusce at justo vitae lorem luctus semper. Praesent ac nisi ornare, viverra elit ullamcorper, imperdiet ante. Donec vitae augue sit amet ligula sollicitudin malesuada.<br />\r\n<br />\r\nCurabitur libero orci, tristique sed ante nec, congue eleifend nibh. Vivamus vehicula, sem vel suscipit mollis, urna ipsum maximus mi, ut pulvinar mauris justo ac augue. Maecenas at laoreet arcu. Suspendisse vel magna vel dolor sagittis luctus in ac massa. Cras aliquet pulvinar dignissim. Nunc at elementum turpis, nec eleifend neque. Donec lobortis egestas magna, eget efficitur ligula tempus non. Phasellus sit amet euismod lacus. Fusce ultricies quam id ligula tempor dapibus. Sed pharetra enim eget feugiat vehicula. Quisque pulvinar magna quis gravida feugiat. Vivamus vitae eros nec lorem molestie placerat et quis est. Vestibulum eget eros ut quam maximus fermentum eget non elit. Integer ac varius quam. Ut mollis tortor sem, vel tincidunt arcu malesuada a. Mauris lectus lacus, varius id tortor ut, sodales maximus ligula.<br />\r\n<br />\r\nPhasellus ultrices tempor consequat. Donec venenatis fermentum felis. Fusce pretium mauris sem, vel lobortis ipsum commodo pulvinar. Sed arcu mauris, euismod et rhoncus molestie, vehicula ac tortor. In euismod diam eu sem mattis commodo. Sed at nisi mauris. In cursus gravida iaculis. Praesent eleifend a nibh a condimentum. Maecenas euismod tellus ac facilisis sodales. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam auctor fringilla enim eu pellentesque. Aenean maximus a nunc sit amet dapibus. Sed mollis purus sapien, non tincidunt est condimentum ut<br />\r\n<br />\r\nSed vitae venenatis nulla, vel scelerisque est. Praesent id ultrices est, at bibendum lacus. Cras sollicitudin, mi a consequat vestibulum, mi purus feugiat elit, id dignissim erat justo nec odio. Morbi a euismod orci. Pellentesque nec arcu pharetra, lobortis dui vitae, aliquam felis. Pellentesque eu vestibulum leo, at efficitur enim. Praesent fringilla tellus lorem, in porta quam tempor non. Proin commodo metus ut erat volutpat pellentesque. Fusce ac egestas orci. Morbi sit amet massa justo.<br />\r\n<br />\r\nMorbi vel lorem lorem. Nunc sed ultricies tellus. Sed et diam venenatis, luctus ipsum a, pulvinar turpis. Nullam scelerisque erat quis augue tempor, sed hendrerit lectus auctor. Aenean ac tortor eu arcu euismod cursus. Nunc eget leo sed est laoreet elementum. Mauris feugiat facilisis dolor. Vestibulum sit amet orci quis velit dictum viverra quis in urna. In scelerisque enim porta, facilisis purus sed, cursus urna. Maecenas tempor tincidunt ligula ut tempus.<br />\r\n<br />\r\nAenean tellus diam, sagittis at arcu non, aliquam efficitur leo. Aenean interdum lorem ut velit molestie, sed iaculis odio venenatis. Sed nec bibendum orci. Mauris lectus dui, sodales nec ornare quis, elementum ut orci. Vivamus augue sem, dapibus a sapien a, ullamcorper finibus ante. Maecenas id semper libero. Phasellus augue nibh, varius et tristique id, pulvinar id libero. Fusce semper, nisi sit amet varius tempor, libero velit aliquam lacus, id mattis metus nunc sit amet risus. Vestibulum a faucibus massa. Vestibulum consequat non libero vitae finibus. Vestibulum consequat turpis sed elementum sodales. Nullam volutpat, magna ornare dictum tincidunt, neque ipsum consectetur justo, quis dignissim leo metus a neque. Sed vulputate ex eget nisi pharetra, luctus malesuada ante dictum. Nunc et lorem massa.<br />\r\n<br />\r\nDonec in quam ut orci faucibus dignissim. Nulla venenatis est ut massa suscipit rhoncus. Nulla in nunc finibus, interdum nulla sed, lobortis ligula. Nulla rhoncus volutpat viverra. Quisque at sem justo. Phasellus eget est non lorem iaculis dapibus quis eget purus. In tortor odio, suscipit lobortis euismod vel, scelerisque non orci. Proin nec tortor pulvinar, tempus arcu vel, commodo nisi. Nullam scelerisque eget purus vel accumsan. Duis at lacus in magna ullamcorper pellentesque. Aenean sagittis ex odio, vel malesuada massa lacinia ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris sed mauris ac dolor porta pulvinar ac id arcu. Etiam porta suscipit elementum. Fusce hendrerit posuere laoreet.<br />\r\n<br />\r\nPellentesque ex lectus, egestas egestas rhoncus sit amet, mattis in ante. Aenean at ultricies massa. Morbi velit leo, dignissim at euismod sit amet, tincidunt sit amet diam. Integer eget nunc sollicitudin, euismod libero nec, mollis mi. Praesent et venenatis dui. Sed et rhoncus mi. Nulla volutpat justo tortor, et semper risus euismod tempor. Quisque ultrices eu mi quis sodales. Vestibulum convallis urna eget urna pellentesque, vel fringilla enim luctus. Donec at sollicitudin massa. Suspendisse at diam a nulla fermentum hendrerit. Curabitur facilisis lacus dictum vehicula euismod.<br />\r\n<br />\r\nDonec placerat dolor a congue ullamcorper. Vivamus eget urna lacus. Pellentesque sagittis eu neque vel tincidunt. Aenean in ligula vel ipsum pharetra scelerisque nec eu urna. Maecenas dignissim arcu sed magna viverra, fringilla varius nulla gravida. Praesent laoreet eu augue nec pulvinar. Ut varius tempor orci, quis hendrerit justo malesuada tincidunt. Nulla sit amet sagittis lectus.</p>\r\n','2023-01-23 03:35:14','2023-01-23 03:46:39',1,1),(8,'6G','The Future of Networks','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus, ante a feugiat semper, justo metus imperdiet odio, et tempus ex tortor a augue. Donec at magna iaculis velit tempus finibus. Curabitur porta lacus lorem, nec malesuada ante aliquet in. Cras id sem vitae mauris interdum bibendum. Maecenas tincidunt non leo eget iaculis. Praesent tempus, tellus a pretium auctor, arcu neque semper nisi, eu pretium nisi massa in orci. Nullam at sapien in nisl vehicula ultricies. Quisque nec tortor vel quam maximus dapibus vel at orci. Sed nec vulputate justo, et varius arcu.<br />\r\n<br />\r\nSed sodales tortor elit, vitae facilisis eros imperdiet ornare. Nullam eu dolor in elit tincidunt rutrum imperdiet sed lectus. Phasellus vulputate tortor non dui efficitur blandit nec eu ipsum. Donec sodales nibh mattis ante varius, vel consequat arcu tristique. Fusce at justo vitae lorem luctus semper. Praesent ac nisi ornare, viverra elit ullamcorper, imperdiet ante. Donec vitae augue sit amet ligula sollicitudin malesuada.<br />\r\n<br />\r\nCurabitur libero orci, tristique sed ante nec, congue eleifend nibh. Vivamus vehicula, sem vel suscipit mollis, urna ipsum maximus mi, ut pulvinar mauris justo ac augue. Maecenas at laoreet arcu. Suspendisse vel magna vel dolor sagittis luctus in ac massa. Cras aliquet pulvinar dignissim. Nunc at elementum turpis, nec eleifend neque. Donec lobortis egestas magna, eget efficitur ligula tempus non. Phasellus sit amet euismod lacus. Fusce ultricies quam id ligula tempor dapibus. Sed pharetra enim eget feugiat vehicula. Quisque pulvinar magna quis gravida feugiat. Vivamus vitae eros nec lorem molestie placerat et quis est. Vestibulum eget eros ut quam maximus fermentum eget non elit. Integer ac varius quam. Ut mollis tortor sem, vel tincidunt arcu malesuada a. Mauris lectus lacus, varius id tortor ut, sodales maximus ligula.<br />\r\n<br />\r\nPhasellus ultrices tempor consequat. Donec venenatis fermentum felis. Fusce pretium mauris sem, vel lobortis ipsum commodo pulvinar. Sed arcu mauris, euismod et rhoncus molestie, vehicula ac tortor. In euismod diam eu sem mattis commodo. Sed at nisi mauris. In cursus gravida iaculis. Praesent eleifend a nibh a condimentum. Maecenas euismod tellus ac facilisis sodales. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam auctor fringilla enim eu pellentesque. Aenean maximus a nunc sit amet dapibus. Sed mollis purus sapien, non tincidunt est condimentum ut<br />\r\n<br />\r\nSed vitae venenatis nulla, vel scelerisque est. Praesent id ultrices est, at bibendum lacus. Cras sollicitudin, mi a consequat vestibulum, mi purus feugiat elit, id dignissim erat justo nec odio. Morbi a euismod orci. Pellentesque nec arcu pharetra, lobortis dui vitae, aliquam felis. Pellentesque eu vestibulum leo, at efficitur enim. Praesent fringilla tellus lorem, in porta quam tempor non. Proin commodo metus ut erat volutpat pellentesque. Fusce ac egestas orci. Morbi sit amet massa justo.<br />\r\n<br />\r\nMorbi vel lorem lorem. Nunc sed ultricies tellus. Sed et diam venenatis, luctus ipsum a, pulvinar turpis. Nullam scelerisque erat quis augue tempor, sed hendrerit lectus auctor. Aenean ac tortor eu arcu euismod cursus. Nunc eget leo sed est laoreet elementum. Mauris feugiat facilisis dolor. Vestibulum sit amet orci quis velit dictum viverra quis in urna. In scelerisque enim porta, facilisis purus sed, cursus urna. Maecenas tempor tincidunt ligula ut tempus.<br />\r\n<br />\r\nAenean tellus diam, sagittis at arcu non, aliquam efficitur leo. Aenean interdum lorem ut velit molestie, sed iaculis odio venenatis. Sed nec bibendum orci. Mauris lectus dui, sodales nec ornare quis, elementum ut orci. Vivamus augue sem, dapibus a sapien a, ullamcorper finibus ante. Maecenas id semper libero. Phasellus augue nibh, varius et tristique id, pulvinar id libero. Fusce semper, nisi sit amet varius tempor, libero velit aliquam lacus, id mattis metus nunc sit amet risus. Vestibulum a faucibus massa. Vestibulum consequat non libero vitae finibus. Vestibulum consequat turpis sed elementum sodales. Nullam volutpat, magna ornare dictum tincidunt, neque ipsum consectetur justo, quis dignissim leo metus a neque. Sed vulputate ex eget nisi pharetra, luctus malesuada ante dictum. Nunc et lorem massa.<br />\r\n<br />\r\nDonec in quam ut orci faucibus dignissim. Nulla venenatis est ut massa suscipit rhoncus. Nulla in nunc finibus, interdum nulla sed, lobortis ligula. Nulla rhoncus volutpat viverra. Quisque at sem justo. Phasellus eget est non lorem iaculis dapibus quis eget purus. In tortor odio, suscipit lobortis euismod vel, scelerisque non orci. Proin nec tortor pulvinar, tempus arcu vel, commodo nisi. Nullam scelerisque eget purus vel accumsan. Duis at lacus in magna ullamcorper pellentesque. Aenean sagittis ex odio, vel malesuada massa lacinia ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris sed mauris ac dolor porta pulvinar ac id arcu. Etiam porta suscipit elementum. Fusce hendrerit posuere laoreet.<br />\r\n<br />\r\nPellentesque ex lectus, egestas egestas rhoncus sit amet, mattis in ante. Aenean at ultricies massa. Morbi velit leo, dignissim at euismod sit amet, tincidunt sit amet diam. Integer eget nunc sollicitudin, euismod libero nec, mollis mi. Praesent et venenatis dui. Sed et rhoncus mi. Nulla volutpat justo tortor, et semper risus euismod tempor. Quisque ultrices eu mi quis sodales. Vestibulum convallis urna eget urna pellentesque, vel fringilla enim luctus. Donec at sollicitudin massa. Suspendisse at diam a nulla fermentum hendrerit. Curabitur facilisis lacus dictum vehicula euismod.<br />\r\n<br />\r\nDonec placerat dolor a congue ullamcorper. Vivamus eget urna lacus. Pellentesque sagittis eu neque vel tincidunt. Aenean in ligula vel ipsum pharetra scelerisque nec eu urna. Maecenas dignissim arcu sed magna viverra, fringilla varius nulla gravida. Praesent laoreet eu augue nec pulvinar. Ut varius tempor orci, quis hendrerit justo malesuada tincidunt. Nulla sit amet sagittis lectus.</p>\r\n','2023-01-23 03:35:59','2023-01-23 03:46:34',1,1),(9,'A MySQL Wizard!','10 tricks to master MySQL programming','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus, ante a feugiat semper, justo metus imperdiet odio, et tempus ex tortor a augue. Donec at magna iaculis velit tempus finibus. Curabitur porta lacus lorem, nec malesuada ante aliquet in. Cras id sem vitae mauris interdum bibendum. Maecenas tincidunt non leo eget iaculis. Praesent tempus, tellus a pretium auctor, arcu neque semper nisi, eu pretium nisi massa in orci. Nullam at sapien in nisl vehicula ultricies. Quisque nec tortor vel quam maximus dapibus vel at orci. Sed nec vulputate justo, et varius arcu.<br />\r\n<br />\r\nSed sodales tortor elit, vitae facilisis eros imperdiet ornare. Nullam eu dolor in elit tincidunt rutrum imperdiet sed lectus. Phasellus vulputate tortor non dui efficitur blandit nec eu ipsum. Donec sodales nibh mattis ante varius, vel consequat arcu tristique. Fusce at justo vitae lorem luctus semper. Praesent ac nisi ornare, viverra elit ullamcorper, imperdiet ante. Donec vitae augue sit amet ligula sollicitudin malesuada.<br />\r\n<br />\r\nCurabitur libero orci, tristique sed ante nec, congue eleifend nibh. Vivamus vehicula, sem vel suscipit mollis, urna ipsum maximus mi, ut pulvinar mauris justo ac augue. Maecenas at laoreet arcu. Suspendisse vel magna vel dolor sagittis luctus in ac massa. Cras aliquet pulvinar dignissim. Nunc at elementum turpis, nec eleifend neque. Donec lobortis egestas magna, eget efficitur ligula tempus non. Phasellus sit amet euismod lacus. Fusce ultricies quam id ligula tempor dapibus. Sed pharetra enim eget feugiat vehicula. Quisque pulvinar magna quis gravida feugiat. Vivamus vitae eros nec lorem molestie placerat et quis est. Vestibulum eget eros ut quam maximus fermentum eget non elit. Integer ac varius quam. Ut mollis tortor sem, vel tincidunt arcu malesuada a. Mauris lectus lacus, varius id tortor ut, sodales maximus ligula.<br />\r\n<br />\r\nPhasellus ultrices tempor consequat. Donec venenatis fermentum felis. Fusce pretium mauris sem, vel lobortis ipsum commodo pulvinar. Sed arcu mauris, euismod et rhoncus molestie, vehicula ac tortor. In euismod diam eu sem mattis commodo. Sed at nisi mauris. In cursus gravida iaculis. Praesent eleifend a nibh a condimentum. Maecenas euismod tellus ac facilisis sodales. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam auctor fringilla enim eu pellentesque. Aenean maximus a nunc sit amet dapibus. Sed mollis purus sapien, non tincidunt est condimentum ut<br />\r\n<br />\r\nSed vitae venenatis nulla, vel scelerisque est. Praesent id ultrices est, at bibendum lacus. Cras sollicitudin, mi a consequat vestibulum, mi purus feugiat elit, id dignissim erat justo nec odio. Morbi a euismod orci. Pellentesque nec arcu pharetra, lobortis dui vitae, aliquam felis. Pellentesque eu vestibulum leo, at efficitur enim. Praesent fringilla tellus lorem, in porta quam tempor non. Proin commodo metus ut erat volutpat pellentesque. Fusce ac egestas orci. Morbi sit amet massa justo.<br />\r\n<br />\r\nMorbi vel lorem lorem. Nunc sed ultricies tellus. Sed et diam venenatis, luctus ipsum a, pulvinar turpis. Nullam scelerisque erat quis augue tempor, sed hendrerit lectus auctor. Aenean ac tortor eu arcu euismod cursus. Nunc eget leo sed est laoreet elementum. Mauris feugiat facilisis dolor. Vestibulum sit amet orci quis velit dictum viverra quis in urna. In scelerisque enim porta, facilisis purus sed, cursus urna. Maecenas tempor tincidunt ligula ut tempus.<br />\r\n<br />\r\nAenean tellus diam, sagittis at arcu non, aliquam efficitur leo. Aenean interdum lorem ut velit molestie, sed iaculis odio venenatis. Sed nec bibendum orci. Mauris lectus dui, sodales nec ornare quis, elementum ut orci. Vivamus augue sem, dapibus a sapien a, ullamcorper finibus ante. Maecenas id semper libero. Phasellus augue nibh, varius et tristique id, pulvinar id libero. Fusce semper, nisi sit amet varius tempor, libero velit aliquam lacus, id mattis metus nunc sit amet risus. Vestibulum a faucibus massa. Vestibulum consequat non libero vitae finibus. Vestibulum consequat turpis sed elementum sodales. Nullam volutpat, magna ornare dictum tincidunt, neque ipsum consectetur justo, quis dignissim leo metus a neque. Sed vulputate ex eget nisi pharetra, luctus malesuada ante dictum. Nunc et lorem massa.<br />\r\n<br />\r\nDonec in quam ut orci faucibus dignissim. Nulla venenatis est ut massa suscipit rhoncus. Nulla in nunc finibus, interdum nulla sed, lobortis ligula. Nulla rhoncus volutpat viverra. Quisque at sem justo. Phasellus eget est non lorem iaculis dapibus quis eget purus. In tortor odio, suscipit lobortis euismod vel, scelerisque non orci. Proin nec tortor pulvinar, tempus arcu vel, commodo nisi. Nullam scelerisque eget purus vel accumsan. Duis at lacus in magna ullamcorper pellentesque. Aenean sagittis ex odio, vel malesuada massa lacinia ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris sed mauris ac dolor porta pulvinar ac id arcu. Etiam porta suscipit elementum. Fusce hendrerit posuere laoreet.<br />\r\n<br />\r\nPellentesque ex lectus, egestas egestas rhoncus sit amet, mattis in ante. Aenean at ultricies massa. Morbi velit leo, dignissim at euismod sit amet, tincidunt sit amet diam. Integer eget nunc sollicitudin, euismod libero nec, mollis mi. Praesent et venenatis dui. Sed et rhoncus mi. Nulla volutpat justo tortor, et semper risus euismod tempor. Quisque ultrices eu mi quis sodales. Vestibulum convallis urna eget urna pellentesque, vel fringilla enim luctus. Donec at sollicitudin massa. Suspendisse at diam a nulla fermentum hendrerit. Curabitur facilisis lacus dictum vehicula euismod.<br />\r\n<br />\r\nDonec placerat dolor a congue ullamcorper. Vivamus eget urna lacus. Pellentesque sagittis eu neque vel tincidunt. Aenean in ligula vel ipsum pharetra scelerisque nec eu urna. Maecenas dignissim arcu sed magna viverra, fringilla varius nulla gravida. Praesent laoreet eu augue nec pulvinar. Ut varius tempor orci, quis hendrerit justo malesuada tincidunt. Nulla sit amet sagittis lectus.</p>\r\n','2023-01-23 03:38:28','2023-01-23 03:38:28',0,1),(10,'Switch to Cloud','Migrating to Cloud: A step by step guide','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dapibus, ante a feugiat semper, justo metus imperdiet odio, et tempus ex tortor a augue. Donec at magna iaculis velit tempus finibus. Curabitur porta lacus lorem, nec malesuada ante aliquet in. Cras id sem vitae mauris interdum bibendum. Maecenas tincidunt non leo eget iaculis. Praesent tempus, tellus a pretium auctor, arcu neque semper nisi, eu pretium nisi massa in orci. Nullam at sapien in nisl vehicula ultricies. Quisque nec tortor vel quam maximus dapibus vel at orci. Sed nec vulputate justo, et varius arcu.<br />\r\n<br />\r\nSed sodales tortor elit, vitae facilisis eros imperdiet ornare. Nullam eu dolor in elit tincidunt rutrum imperdiet sed lectus. Phasellus vulputate tortor non dui efficitur blandit nec eu ipsum. Donec sodales nibh mattis ante varius, vel consequat arcu tristique. Fusce at justo vitae lorem luctus semper. Praesent ac nisi ornare, viverra elit ullamcorper, imperdiet ante. Donec vitae augue sit amet ligula sollicitudin malesuada.<br />\r\n<br />\r\nCurabitur libero orci, tristique sed ante nec, congue eleifend nibh. Vivamus vehicula, sem vel suscipit mollis, urna ipsum maximus mi, ut pulvinar mauris justo ac augue. Maecenas at laoreet arcu. Suspendisse vel magna vel dolor sagittis luctus in ac massa. Cras aliquet pulvinar dignissim. Nunc at elementum turpis, nec eleifend neque. Donec lobortis egestas magna, eget efficitur ligula tempus non. Phasellus sit amet euismod lacus. Fusce ultricies quam id ligula tempor dapibus. Sed pharetra enim eget feugiat vehicula. Quisque pulvinar magna quis gravida feugiat. Vivamus vitae eros nec lorem molestie placerat et quis est. Vestibulum eget eros ut quam maximus fermentum eget non elit. Integer ac varius quam. Ut mollis tortor sem, vel tincidunt arcu malesuada a. Mauris lectus lacus, varius id tortor ut, sodales maximus ligula.<br />\r\n<br />\r\nPhasellus ultrices tempor consequat. Donec venenatis fermentum felis. Fusce pretium mauris sem, vel lobortis ipsum commodo pulvinar. Sed arcu mauris, euismod et rhoncus molestie, vehicula ac tortor. In euismod diam eu sem mattis commodo. Sed at nisi mauris. In cursus gravida iaculis. Praesent eleifend a nibh a condimentum. Maecenas euismod tellus ac facilisis sodales. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam auctor fringilla enim eu pellentesque. Aenean maximus a nunc sit amet dapibus. Sed mollis purus sapien, non tincidunt est condimentum ut<br />\r\n<br />\r\nSed vitae venenatis nulla, vel scelerisque est. Praesent id ultrices est, at bibendum lacus. Cras sollicitudin, mi a consequat vestibulum, mi purus feugiat elit, id dignissim erat justo nec odio. Morbi a euismod orci. Pellentesque nec arcu pharetra, lobortis dui vitae, aliquam felis. Pellentesque eu vestibulum leo, at efficitur enim. Praesent fringilla tellus lorem, in porta quam tempor non. Proin commodo metus ut erat volutpat pellentesque. Fusce ac egestas orci. Morbi sit amet massa justo.<br />\r\n<br />\r\nMorbi vel lorem lorem. Nunc sed ultricies tellus. Sed et diam venenatis, luctus ipsum a, pulvinar turpis. Nullam scelerisque erat quis augue tempor, sed hendrerit lectus auctor. Aenean ac tortor eu arcu euismod cursus. Nunc eget leo sed est laoreet elementum. Mauris feugiat facilisis dolor. Vestibulum sit amet orci quis velit dictum viverra quis in urna. In scelerisque enim porta, facilisis purus sed, cursus urna. Maecenas tempor tincidunt ligula ut tempus.<br />\r\n<br />\r\nAenean tellus diam, sagittis at arcu non, aliquam efficitur leo. Aenean interdum lorem ut velit molestie, sed iaculis odio venenatis. Sed nec bibendum orci. Mauris lectus dui, sodales nec ornare quis, elementum ut orci. Vivamus augue sem, dapibus a sapien a, ullamcorper finibus ante. Maecenas id semper libero. Phasellus augue nibh, varius et tristique id, pulvinar id libero. Fusce semper, nisi sit amet varius tempor, libero velit aliquam lacus, id mattis metus nunc sit amet risus. Vestibulum a faucibus massa. Vestibulum consequat non libero vitae finibus. Vestibulum consequat turpis sed elementum sodales. Nullam volutpat, magna ornare dictum tincidunt, neque ipsum consectetur justo, quis dignissim leo metus a neque. Sed vulputate ex eget nisi pharetra, luctus malesuada ante dictum. Nunc et lorem massa.<br />\r\n<br />\r\nDonec in quam ut orci faucibus dignissim. Nulla venenatis est ut massa suscipit rhoncus. Nulla in nunc finibus, interdum nulla sed, lobortis ligula. Nulla rhoncus volutpat viverra. Quisque at sem justo. Phasellus eget est non lorem iaculis dapibus quis eget purus. In tortor odio, suscipit lobortis euismod vel, scelerisque non orci. Proin nec tortor pulvinar, tempus arcu vel, commodo nisi. Nullam scelerisque eget purus vel accumsan. Duis at lacus in magna ullamcorper pellentesque. Aenean sagittis ex odio, vel malesuada massa lacinia ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris sed mauris ac dolor porta pulvinar ac id arcu. Etiam porta suscipit elementum. Fusce hendrerit posuere laoreet.<br />\r\n<br />\r\nPellentesque ex lectus, egestas egestas rhoncus sit amet, mattis in ante. Aenean at ultricies massa. Morbi velit leo, dignissim at euismod sit amet, tincidunt sit amet diam. Integer eget nunc sollicitudin, euismod libero nec, mollis mi. Praesent et venenatis dui. Sed et rhoncus mi. Nulla volutpat justo tortor, et semper risus euismod tempor. Quisque ultrices eu mi quis sodales. Vestibulum convallis urna eget urna pellentesque, vel fringilla enim luctus. Donec at sollicitudin massa. Suspendisse at diam a nulla fermentum hendrerit. Curabitur facilisis lacus dictum vehicula euismod.<br />\r\n<br />\r\nDonec placerat dolor a congue ullamcorper. Vivamus eget urna lacus. Pellentesque sagittis eu neque vel tincidunt. Aenean in ligula vel ipsum pharetra scelerisque nec eu urna. Maecenas dignissim arcu sed magna viverra, fringilla varius nulla gravida. Praesent laoreet eu augue nec pulvinar. Ut varius tempor orci, quis hendrerit justo malesuada tincidunt. Nulla sit amet sagittis lectus.</p>\r\n','2023-01-23 03:40:51','2023-01-23 03:46:16',1,1),(11,'Tennis Rivalries','Federer vs Nadal vs Djokovic','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et ante efficitur, aliquam dolor id, interdum quam. Maecenas accumsan nisi a sapien ornare, vitae porta quam aliquet. Vestibulum erat ex, pulvinar sit amet sagittis sit amet, consequat id mauris. Etiam et turpis sapien. Ut vel dui finibus, tempor erat non, auctor est. Curabitur consequat massa ac ex molestie, sed mattis erat scelerisque. Etiam elementum commodo finibus. Nam et ornare massa, non vehicula neque. Quisque et semper lorem. Duis eu leo ac neque auctor sagittis.</p>\r\n\r\n<p>Donec vel lectus et diam ornare varius sit amet quis lacus. Donec metus metus, euismod vitae mi in, pharetra hendrerit lacus. Nunc cursus nisi ac nisl eleifend iaculis. Aliquam erat volutpat. Praesent lacinia tellus ut arcu lacinia, at rutrum purus rutrum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur erat sem, sollicitudin quis nunc quis, aliquet vulputate leo. Etiam ipsum libero, semper sit amet blandit volutpat, vehicula id sem. Aenean gravida maximus quam, vel mollis mauris. Maecenas rhoncus augue nec risus sodales auctor.</p>\r\n\r\n<p>Vivamus eget tempor massa. Nulla facilisi. Phasellus iaculis ipsum ac turpis tristique varius. Suspendisse tincidunt ut ligula ac pulvinar. In urna dui, rhoncus vel iaculis eu, scelerisque consequat lorem. Donec eu lacinia elit. Sed sed viverra tortor, eu mollis dolor. Nullam ullamcorper diam rhoncus ultrices accumsan. Sed ac nisi mollis, ultrices lacus et, dapibus elit. Integer finibus leo turpis, sit amet luctus lacus ultrices eget. Sed non rhoncus tellus, sit amet sagittis velit.</p>\r\n\r\n<p>Quisque convallis ante et scelerisque aliquet. Mauris vel neque a urna consectetur ornare. Cras quis interdum urna, porttitor tincidunt mauris. Vivamus sit amet orci non ex euismod finibus sed sed lacus. Donec luctus lorem nec blandit faucibus. Integer sagittis erat ac consectetur rhoncus. Nulla tempus nulla ut lobortis sodales.</p>\r\n\r\n<p>Sed eu tortor at enim luctus pharetra eget ut quam. Aliquam cursus justo odio, eu tempus lectus sagittis nec. Ut vitae sodales urna. Fusce nec ornare arcu, id vehicula lectus. Vivamus vitae velit magna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque neque sapien, lacinia quis velit aliquet, lacinia venenatis purus. Proin ac nisl accumsan, faucibus ante ac, varius orci.</p>\r\n\r\n<p>Nunc quis lorem vestibulum, rutrum ante a, blandit tellus. Proin quis nibh ipsum. Pellentesque egestas ut nisl sit amet ultrices. In tempus sollicitudin porttitor. Curabitur sodales convallis velit, sed tristique magna consequat eget. Ut semper accumsan risus finibus molestie. Donec eget purus molestie, condimentum turpis ac, venenatis ante. Nunc volutpat in erat sit amet elementum. Vivamus et auctor justo. Pellentesque iaculis malesuada diam, at fermentum ipsum consequat ut. Nullam auctor augue eros, quis sagittis sapien dictum quis. Aenean efficitur, neque at lobortis rutrum, augue odio imperdiet ex, sit amet luctus urna risus ut massa. Etiam sodales diam in felis efficitur malesuada. Praesent quis interdum dui, sit amet consectetur magna. Fusce turpis libero, commodo ac justo in, pharetra eleifend libero. Sed justo leo, rutrum vel convallis quis, dapibus sit amet augue.</p>\r\n\r\n<p>Cras placerat magna at pretium pharetra. Aliquam pellentesque eros eu porttitor eleifend. Aliquam egestas in tortor vel mollis. Nulla facilisi. Nulla felis risus, tempor id sollicitudin nec, rutrum nec nunc. Aenean sit amet ultricies arcu. Quisque ac lorem ipsum. In cursus, elit id facilisis tempus, dui risus finibus justo, ac vestibulum libero leo sagittis nisl. Praesent scelerisque diam quis tristique iaculis. Vestibulum orci ex, tempus aliquam ultricies in, venenatis id ex. Suspendisse potenti. Aliquam erat volutpat. Phasellus a diam finibus, vulputate turpis a, ullamcorper sem.</p>\r\n\r\n<p>Aliquam erat volutpat. Donec bibendum facilisis mi, at dictum lacus laoreet eget. Sed maximus pretium risus quis aliquet. Phasellus efficitur nulla hendrerit lacus lobortis, vitae eleifend justo viverra. Duis quis felis dui. Nulla facilisis a quam ut rhoncus. Morbi in diam et ante ultrices maximus. Curabitur id molestie nisl, id aliquet felis. Fusce ac arcu aliquam, consequat justo id, pulvinar nulla. Curabitur erat magna, sodales quis mauris eget, consectetur cursus libero. Aliquam ullamcorper dignissim mi. Proin a tellus arcu. Phasellus eu vehicula enim, non lacinia neque. Nulla facilisi.</p>\r\n\r\n<p>Donec eleifend posuere quam vel imperdiet. Nulla at tincidunt enim. Aenean et placerat mi, sed tristique tortor. Duis accumsan, sem eu pellentesque consequat, ipsum dui tristique sem, in laoreet velit orci quis neque. Aenean dapibus fringilla tortor eget tincidunt. Pellentesque quis placerat nisi. Nulla efficitur maximus risus molestie vehicula. Ut maximus malesuada ipsum, sit amet tristique nisi iaculis at. Praesent tortor risus, sagittis sit amet erat vulputate, pretium euismod lacus. Curabitur ac diam blandit, ullamcorper quam eu, viverra justo. Nunc eget tellus porta, porta urna eget, mollis dolor. Phasellus tempus elit quis egestas euismod. Nulla sodales, est tempus consequat suscipit, diam elit pulvinar tellus, ac hendrerit leo mauris id est.</p>\r\n\r\n<p>Phasellus ac viverra ante, a laoreet metus. Morbi eget mi ut diam dapibus vestibulum. Nulla sed imperdiet urna. Proin pretium dictum luctus. Duis suscipit sed turpis non sagittis. Aenean tristique sollicitudin lectus et facilisis. Proin et magna urna. Duis dignissim mi at tempus ultricies. Maecenas ex sem, laoreet eget ipsum eu, ullamcorper placerat diam. Morbi finibus quam erat, nec consequat mi feugiat eu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc quis ultrices massa, vel commodo turpis. Etiam nec malesuada massa. Pellentesque imperdiet malesuada auctor. Pellentesque eu turpis mauris.</p>\r\n','2023-01-23 03:50:49','2023-01-23 03:50:49',0,4),(13,'test','test','<p>test</p>\r\n','2023-01-25 15:51:44','2023-01-25 15:51:44',0,6);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ng169`@`%`*/ /*!50003 TRIGGER `blog_BEFORE_INSERT` BEFORE INSERT ON `blog` FOR EACH ROW BEGIN
  IF NEW.date_added IS NULL THEN
    SET NEW.date_added = NOW();
  END IF;
  SET NEW.date_modified = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ng169`@`%`*/ /*!50003 TRIGGER `blog_AFTER_INSERT` AFTER INSERT ON `blog` FOR EACH ROW BEGIN
UPDATE `user`
SET num_of_blogs = num_of_blogs + 1
WHERE `user`.uid = NEW.author_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ng169`@`%`*/ /*!50003 TRIGGER `blog_BEFORE_UPDATE` BEFORE UPDATE ON `blog` FOR EACH ROW BEGIN
  SET NEW.date_modified = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ng169`@`%`*/ /*!50003 TRIGGER `blog_AFTER_DELETE` AFTER DELETE ON `blog` FOR EACH ROW BEGIN
UPDATE `user`
SET num_of_blogs = num_of_blogs - 1
WHERE `user`.uid = OLD.author_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category` (
  `blog_id_cb` int NOT NULL,
  `cat_id_cb` int NOT NULL,
  PRIMARY KEY (`blog_id_cb`,`cat_id_cb`),
  KEY `blogCat_c_id_idx` (`cat_id_cb`),
  CONSTRAINT `blogCat_b_id` FOREIGN KEY (`blog_id_cb`) REFERENCES `blog` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blogCat_c_id` FOREIGN KEY (`cat_id_cb`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (2,8),(3,8),(7,8),(8,8),(9,8),(10,8),(4,9),(1,10),(11,10),(3,11),(9,11),(5,13),(6,14);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmark` (
  `uid_bk` int NOT NULL,
  `blog_id_bk` int NOT NULL,
  PRIMARY KEY (`uid_bk`,`blog_id_bk`),
  KEY `bookmarkBlog_idx` (`blog_id_bk`),
  CONSTRAINT `bookmarkBlog` FOREIGN KEY (`blog_id_bk`) REFERENCES `blog` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookmarkUser` FOREIGN KEY (`uid_bk`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark`
--

LOCK TABLES `bookmark` WRITE;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
INSERT INTO `bookmark` VALUES (3,1),(4,1),(1,2),(6,2),(4,3),(4,6),(4,7),(4,8),(4,10);
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ng169`@`%`*/ /*!50003 TRIGGER `bookmark_AFTER_INSERT` AFTER INSERT ON `bookmark` FOR EACH ROW BEGIN
UPDATE `blog`
SET num_of_bookmarks = num_of_bookmarks + 1
WHERE `blog`.blog_id = NEW.blog_id_bk;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ng169`@`%`*/ /*!50003 TRIGGER `bookmark_AFTER_DELETE` AFTER DELETE ON `bookmark` FOR EACH ROW BEGIN
UPDATE `blog`
SET num_of_bookmarks = num_of_bookmarks - 1
WHERE `blog`.blog_id = OLD.blog_id_bk;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (8,'Technology'),(9,'Science'),(10,'Sports'),(11,'Programming'),(12,'Art'),(13,'Literature'),(14,'Finance');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `blog_id_comment` int NOT NULL,
  `uid_comment` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commentBlog_idx` (`blog_id_comment`),
  KEY `commentUser_idx` (`uid_comment`),
  CONSTRAINT `commentBlog` FOREIGN KEY (`blog_id_comment`) REFERENCES `blog` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commentUser` FOREIGN KEY (`uid_comment`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Messi is the best!','2023-01-23 03:19:21',1,4),(2,'Thank you for this amazing blog!!','2023-01-23 03:48:58',3,4),(3,'Good Blog!!','2023-01-25 13:01:58',2,5),(4,'test','2023-01-25 15:37:07',2,6);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ng169`@`%`*/ /*!50003 TRIGGER `comment_BEFORE_INSERT` BEFORE INSERT ON `comment` FOR EACH ROW BEGIN
	SET NEW.date_added = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `title` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `uid_notif` int NOT NULL,
  `notif_id` int NOT NULL AUTO_INCREMENT,
  `blog_id` int DEFAULT NULL,
  PRIMARY KEY (`notif_id`),
  UNIQUE KEY `notif_id_UNIQUE` (`notif_id`),
  KEY `notifUser_idx` (`uid_notif`),
  KEY `notifBlog_idx` (`blog_id`),
  CONSTRAINT `notifBlog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifUser` FOREIGN KEY (`uid_notif`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('NEW BLOG FROM John Doe','John Doe has posted a blog on DBMS made easy',4,2,3),('NEW BLOG FROM John Doe','John Doe has posted a blog on Eating for Energy',4,3,4),('NEW BLOG FROM John Doe','John Doe has posted a blog on Creative Writing',4,4,5),('NEW BLOG FROM John Doe','John Doe has posted a blog on Financial Planning',4,5,6),('NEW BLOG FROM John Doe','John Doe has posted a blog on Virtual Reality',4,6,7),('NEW BLOG FROM John Doe','John Doe has posted a blog on 6G',4,7,8),('NEW BLOG FROM John Doe','John Doe has posted a blog on A MySQL Wizard!',4,8,9);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriber` (
  `author_id` int NOT NULL,
  `subscriber_id` int NOT NULL,
  PRIMARY KEY (`author_id`,`subscriber_id`),
  KEY `subscriberSub_idx` (`subscriber_id`),
  CONSTRAINT `authorSub` FOREIGN KEY (`author_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subscriberSub` FOREIGN KEY (`subscriber_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
INSERT INTO `subscriber` VALUES (4,1),(1,4),(3,4),(1,5),(1,6);
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ng169`@`%`*/ /*!50003 TRIGGER `subscriber_AFTER_INSERT` AFTER INSERT ON `subscriber` FOR EACH ROW BEGIN
UPDATE `user`
SET num_of_subs = num_of_subs + 1
WHERE `user`.uid = NEW.author_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ng169`@`%`*/ /*!50003 TRIGGER `subscriber_AFTER_DELETE` AFTER DELETE ON `subscriber` FOR EACH ROW BEGIN
UPDATE `user`
SET num_of_subs = num_of_subs - 1
WHERE `user`.uid = OLD.author_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `ph_num` varchar(45) DEFAULT NULL,
  `prof_pic` varchar(200) DEFAULT NULL,
  `num_of_blogs` int DEFAULT '0',
  `num_of_subs` int DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John Doe','1111111111','user1.jpg',9,3),(2,'Dave Smith','1111111112','user2.jpg',0,0),(3,'C Ronaldo','7777777777','user3.png',1,1),(4,'Jake','1111111112','default_user.jpg',1,1),(5,'David ','1111111113','default_user.jpg',0,0),(6,'test','9999900000','default_user.jpg',1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogin` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `email_id` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`uid`,`email_id`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  CONSTRAINT `uidLogin` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin`
--

LOCK TABLES `userlogin` WRITE;
/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
INSERT INTO `userlogin` VALUES (1,'user1@gmail.com','1'),(2,'user2@gmail.com','1'),(3,'user3@gmail.com','1'),(4,'user4@gmail.com','1'),(5,'user5@gmail.com','1'),(6,'test@gmail.com','1');
/*!40000 ALTER TABLE `userlogin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-28 16:17:08
