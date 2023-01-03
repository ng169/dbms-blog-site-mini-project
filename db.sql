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
CREATE TABLE `blogsite`.`blog` (
  `blog_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `subtitle` VARCHAR(45) NULL,
  `content` VARCHAR(45) NOT NULL,
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


