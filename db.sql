CREATE TABLE `blog` (
   `blog_id` int NOT NULL AUTO_INCREMENT,
   `title` varchar(300) NOT NULL,
   `subtitle` varchar(300) DEFAULT NULL,
   `content` longtext,
   `date_added` datetime DEFAULT NULL,
   `date_modified` datetime DEFAULT NULL,
   `num_of_bookmarks` int DEFAULT '0',
   `author_id` int NOT NULL,
   PRIMARY KEY (`blog_id`),
   UNIQUE KEY `blog_id_UNIQUE` (`blog_id`),
   KEY `blogAuthor_idx` (`author_id`),
   CONSTRAINT `blogAuthor` FOREIGN KEY (`author_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
 );

 CREATE TABLE `blog_category` (
   `blog_id_cb` int NOT NULL,
   `cat_id_cb` int NOT NULL,
   PRIMARY KEY (`blog_id_cb`,`cat_id_cb`),
   KEY `blogCat_c_id_idx` (`cat_id_cb`),
   CONSTRAINT `blogCat_b_id` FOREIGN KEY (`blog_id_cb`) REFERENCES `blog` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `blogCat_c_id` FOREIGN KEY (`cat_id_cb`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
 );

 CREATE TABLE `bookmark` (
   `uid_bk` int NOT NULL,
   `blog_id_bk` int NOT NULL,
   PRIMARY KEY (`uid_bk`,`blog_id_bk`),
   KEY `bookmarkBlog_idx` (`blog_id_bk`),
   CONSTRAINT `bookmarkBlog` FOREIGN KEY (`blog_id_bk`) REFERENCES `blog` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `bookmarkUser` FOREIGN KEY (`uid_bk`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
 );

 CREATE TABLE `category` (
   `category_id` int NOT NULL AUTO_INCREMENT,
   `name` varchar(45) DEFAULT NULL,
   PRIMARY KEY (`category_id`),
   UNIQUE KEY `category_id_UNIQUE` (`category_id`)
 );

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
 );

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
 );

 CREATE TABLE `subscriber` (
   `author_id` int NOT NULL,
   `subscriber_id` int NOT NULL,
   PRIMARY KEY (`author_id`,`subscriber_id`),
   KEY `subscriberSub_idx` (`subscriber_id`),
   CONSTRAINT `authorSub` FOREIGN KEY (`author_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `subscriberSub` FOREIGN KEY (`subscriber_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
 );

 CREATE TABLE `user` (
   `uid` int NOT NULL AUTO_INCREMENT,
   `name` varchar(45) NOT NULL,
   `ph_num` varchar(45) DEFAULT NULL,
   `prof_pic` varchar(200) DEFAULT NULL,
   `num_of_blogs` int DEFAULT '0',
   `num_of_subs` int DEFAULT '0',
   PRIMARY KEY (`uid`),
   UNIQUE KEY `uid_UNIQUE` (`uid`)
 );

 CREATE TABLE `userlogin` (
   `uid` int NOT NULL AUTO_INCREMENT,
   `email_id` varchar(45) NOT NULL,
   `password` varchar(45) NOT NULL,
   PRIMARY KEY (`uid`,`email_id`),
   UNIQUE KEY `email_id_UNIQUE` (`email_id`),
   UNIQUE KEY `uid_UNIQUE` (`uid`),
   CONSTRAINT `uidLogin` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
 );


 -- trigger

CREATE TRIGGER `subscriber_AFTER_INSERT`
AFTER INSERT ON `subscriber`
FOR EACH ROW
BEGIN
    UPDATE `user`
    SET num_of_subs = num_of_subs + 1
    WHERE `user`.uid = NEW.author_id;
END


CREATE TRIGGER `subscriber_AFTER_DELETE`
AFTER DELETE ON `subscriber`
FOR EACH ROW
BEGIN
    UPDATE `user`
    SET num_of_subs = num_of_subs - 1
    WHERE `user`.uid = OLD.author_id;
END

CREATE TRIGGER `comment_BEFORE_INSERT`
BEFORE INSERT ON `comment`
FOR EACH ROW
BEGIN
	SET NEW.date_added = NOW();
END


CREATE TRIGGER `bookmark_AFTER_INSERT`
AFTER INSERT ON `bookmark`
FOR EACH ROW
BEGIN
    UPDATE `blog`
    SET num_of_bookmarks = num_of_bookmarks + 1
    WHERE `blog`.blog_id = NEW.blog_id_bk;
END

CREATE TRIGGER `bookmark_AFTER_DELETE`
AFTER DELETE ON `bookmark`
FOR EACH ROW
BEGIN
    UPDATE `blog`
    SET num_of_bookmarks = num_of_bookmarks - 1
    WHERE `blog`.blog_id = OLD.blog_id_bk;
END

CREATE TRIGGER `blog_BEFORE_INSERT`
BEFORE INSERT ON `blog`
FOR EACH ROW
BEGIN
  IF NEW.date_added IS NULL THEN
    SET NEW.date_added = NOW();
  END IF;
  SET NEW.date_modified = NOW();
END

CREATE TRIGGER `blog_AFTER_INSERT`
AFTER INSERT ON `blog`
FOR EACH ROW
BEGIN
    UPDATE `user`
    SET num_of_blogs = num_of_blogs + 1
    WHERE `user`.uid = NEW.author_id;
END

CREATE TRIGGER `blog_BEFORE_UPDATE`
BEFORE UPDATE ON `blog`
FOR EACH ROW
BEGIN
  SET NEW.date_modified = NOW();
END

CREATE TRIGGER `blog_AFTER_DELETE`
AFTER DELETE ON `blog`
FOR EACH ROW
BEGIN
    UPDATE `user`
    SET num_of_blogs = num_of_blogs - 1
    WHERE `user`.uid = OLD.author_id;
END