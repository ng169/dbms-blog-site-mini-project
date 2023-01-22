CREATE DATABASE IF NOT EXISTS blogsite;
USE blogsite;

-- User Table
CREATE TABLE IF NOT EXISTS `blogsite`.`user` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `ph_num` VARCHAR(45) NULL,
  `prof_pic` VARCHAR(200) NULL,
  `num_of_blogs` INT NULL DEFAULT 0,
  `num_of_subs` INT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `uid_UNIQUE` (`uid` ASC) VISIBLE);

-- User Login Table
CREATE TABLE IF NOT EXISTS `blogsite`.`userlogin` (
  `uid` INT NOT NULL AUTO_INCREMENT,
  `email_id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uid`, `email_id`),
  UNIQUE INDEX `email_id_UNIQUE` (`email_id` ASC) VISIBLE,
  UNIQUE INDEX `uid_UNIQUE` (`uid` ASC) VISIBLE,
  CONSTRAINT `uidLogin`
    FOREIGN KEY (`uid`)
    REFERENCES `blogsite`.`user` (`uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- Blog Table
CREATE TABLE IF NOT EXISTS `blogsite`.`blog` (
  `blog_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `subtitle` VARCHAR(45) NULL,
  `content` VARCHAR(1000) NOT NULL,
  `date_added` VARCHAR(45) NULL,
  `date_modified` VARCHAR(45) NULL,
  `num_of_reads` INT NULL DEFAULT 0,
  `num_of_bookmarks` INT NULL DEFAULT 0,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`blog_id`),
  UNIQUE INDEX `blog_id_UNIQUE` (`blog_id` ASC) VISIBLE,
  INDEX `blogAuthor_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `blogAuthor`
    FOREIGN KEY (`author_id`)
    REFERENCES `blogsite`.`user` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Trigger to increment num_of_blogs in user table on insert into blog
DROP TRIGGER IF EXISTS `blogsite`.`blog_AFTER_INSERT`;

DELIMITER $$
USE `blogsite`$$
CREATE DEFINER = CURRENT_USER TRIGGER `blogsite`.`blog_AFTER_INSERT` AFTER INSERT ON `blog` FOR EACH ROW
BEGIN
UPDATE `user`
SET num_of_blogs = num_of_blogs + 1
WHERE `user`.uid = NEW.author_id;
END$$
DELIMITER ;

-- Trigger to decrement num_of_blogs in user table on delete into blog
DROP TRIGGER IF EXISTS `blogsite`.`blog_AFTER_DELETE`;

DELIMITER $$
USE `blogsite`$$
CREATE DEFINER = CURRENT_USER TRIGGER `blogsite`.`blog_AFTER_DELETE` AFTER DELETE ON `blog` FOR EACH ROW
BEGIN
UPDATE `user`
SET num_of_blogs = num_of_blogs - 1
WHERE `user`.uid = OLD.author_id;
END$$
DELIMITER ;



-- Bookmarks Table

CREATE TABLE `blogsite`.`bookmark` (
  `uid_bk` INT NOT NULL,
  `blog_id_bk` INT NOT NULL,
  PRIMARY KEY (`uid_bk`, `blog_id_bk`),
  INDEX `bookmarkBlog_idx` (`blog_id_bk` ASC) VISIBLE,
  CONSTRAINT `bookmarkUser`
    FOREIGN KEY (`uid_bk`)
    REFERENCES `blogsite`.`user` (`uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `bookmarkBlog`
    FOREIGN KEY (`blog_id_bk`)
    REFERENCES `blogsite`.`blog` (`blog_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- Trigger to increment num_of_bookmarks
DROP TRIGGER IF EXISTS `blogsite`.`bookmark_AFTER_INSERT`;

DELIMITER $$
USE `blogsite`$$
CREATE DEFINER = CURRENT_USER TRIGGER `blogsite`.`bookmark_AFTER_INSERT` AFTER INSERT ON `bookmark` FOR EACH ROW
BEGIN
UPDATE `blog`
SET num_of_bookmarks = num_of_bookmarks + 1
WHERE `blog`.blog_id = NEW.blog_id_bk;
END$$
DELIMITER ;

-- Trigger to decrement num_of_bookmarks
DROP TRIGGER IF EXISTS `blogsite`.`bookmark_AFTER_DELETE`;

DELIMITER $$
USE `blogsite`$$
CREATE DEFINER = CURRENT_USER TRIGGER `blogsite`.`bookmark_AFTER_DELETE` AFTER DELETE ON `bookmark` FOR EACH ROW
BEGIN
UPDATE `blog`
SET num_of_bookmarks = num_of_bookmarks - 1
WHERE `blog`.blog_id = OLD.blog_id_bk;
END$$
DELIMITER ;

-- trigger to change date added and date modified
DROP TRIGGER IF EXISTS `blogsite`.`blog_BEFORE_INSERT`;

DELIMITER $$
USE `blogsite`$$
CREATE DEFINER = CURRENT_USER TRIGGER `blogsite`.`blog_BEFORE_INSERT` BEFORE INSERT ON `blog` FOR EACH ROW
BEGIN
  IF NEW.date_added IS NULL THEN
    SET NEW.date_added = NOW();
  END IF;
  SET NEW.date_modified = NOW();
END$$
DELIMITER ;

-- trigger to change date modified
DROP TRIGGER IF EXISTS `blogsite`.`blog_BEFORE_UPDATE`;

DELIMITER $$
USE `blogsite`$$
CREATE DEFINER = CURRENT_USER TRIGGER `blogsite`.`blog_BEFORE_UPDATE` BEFORE UPDATE ON `blog` FOR EACH ROW
BEGIN
  SET NEW.date_modified = NOW();
END$$
DELIMITER ;


-- category table
CREATE TABLE `blogsite`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_id_UNIQUE` (`category_id` ASC) VISIBLE);

-- blog category table
CREATE TABLE `blogsite`.`blog_category` (
  `blog_id_cb` INT NOT NULL,
  `cat_id_cb` INT NOT NULL,
  PRIMARY KEY (`blog_id_cb`, `cat_id_cb`),
  INDEX `blogCat_c_id_idx` (`cat_id_cb` ASC) VISIBLE,
  CONSTRAINT `blogCat_b_id`
    FOREIGN KEY (`blog_id_cb`)
    REFERENCES `blogsite`.`blog` (`blog_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `blogCat_c_id`
    FOREIGN KEY (`cat_id_cb`)
    REFERENCES `blogsite`.`category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- comment table
CREATE TABLE `blogsite`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200) NOT NULL,
  `date_added` DATETIME NULL,
  `upvotes` INT NULL DEFAULT 0,
  `blog_id_comment` INT NOT NULL,
  `uid_comment` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `commentBlog_idx` (`blog_id_comment` ASC) VISIBLE,
  INDEX `commentUser_idx` (`uid_comment` ASC) VISIBLE,
  CONSTRAINT `commentBlog`
    FOREIGN KEY (`blog_id_comment`)
    REFERENCES `blogsite`.`blog` (`blog_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `commentUser`
    FOREIGN KEY (`uid_comment`)
    REFERENCES `blogsite`.`user` (`uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- trigger to change date added
DROP TRIGGER IF EXISTS `blogsite`.`comment_BEFORE_INSERT`;

DELIMITER $$
USE `blogsite`$$
CREATE DEFINER = CURRENT_USER TRIGGER `blogsite`.`comment_BEFORE_INSERT` BEFORE INSERT ON `comment` FOR EACH ROW
BEGIN
	SET NEW.date_added = NOW();
END$$
DELIMITER ;

-- notification table
CREATE TABLE `blogsite`.`notification` (
  `title` VARCHAR(20) NOT NULL,
  `description` VARCHAR(100) NULL,
  `uid_notif` INT NOT NULL,
  PRIMARY KEY (`title`),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC) VISIBLE,
  INDEX `notifUser_idx` (`uid_notif` ASC) VISIBLE,
  CONSTRAINT `notifUser`
    FOREIGN KEY (`uid_notif`)
    REFERENCES `blogsite`.`user` (`uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- draft table
CREATE TABLE `blogsite`.`draft` (
  `draft_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(1000) NOT NULL,
  `date_added` DATETIME NULL,
  `uid_draft` INT NOT NULL,
  PRIMARY KEY (`draft_id`),
  UNIQUE INDEX `draft_id_UNIQUE` (`draft_id` ASC) VISIBLE,
  INDEX `userDraft_idx` (`uid_draft` ASC) VISIBLE,
  CONSTRAINT `userDraft`
    FOREIGN KEY (`uid_draft`)
    REFERENCES `blogsite`.`user` (`uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- trigger to change date added in draft
DROP TRIGGER IF EXISTS `blogsite`.`draft_BEFORE_INSERT`;

DELIMITER $$
USE `blogsite`$$
CREATE DEFINER = CURRENT_USER TRIGGER `blogsite`.`draft_BEFORE_INSERT` BEFORE INSERT ON `draft` FOR EACH ROW
BEGIN
	SET NEW.date_added = NOW();
END$$
DELIMITER ;


-- subscriber table
CREATE TABLE `blogsite`.`subscriber` (
  `author_id` INT NOT NULL,
  `subscriber_id` INT NOT NULL,
  PRIMARY KEY (`author_id`, `subscriber_id`),
  INDEX `subscriberSub_idx` (`subscriber_id` ASC) VISIBLE,
  CONSTRAINT `authorSub`
    FOREIGN KEY (`author_id`)
    REFERENCES `blogsite`.`user` (`uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `subscriberSub`
    FOREIGN KEY (`subscriber_id`)
    REFERENCES `blogsite`.`user` (`uid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

