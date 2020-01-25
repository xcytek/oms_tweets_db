# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: my-bigdata-server.mysql.database.azure.com (MySQL 5.6.42.0)
# Database: oms_tweeets
# Generation Time: 2020-01-25 07:26:49 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `code`, `name`)
VALUES
	(1,'MX','Mexico');

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table following
# ------------------------------------------------------------

DROP TABLE IF EXISTS `following`;

CREATE TABLE `following` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `following_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `social_media_messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table genders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `genders`;

CREATE TABLE `genders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gender` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;

INSERT INTO `genders` (`id`, `gender`)
VALUES
	(1,'Mujer'),
	(2,'Hombre');

/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table geographic_areas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `geographic_areas`;

CREATE TABLE `geographic_areas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country` int(11) unsigned NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country` (`country`),
  KEY `city` (`city`),
  KEY `lat` (`lat`,`lon`),
  CONSTRAINT `geographic_areas_ibfk_1` FOREIGN KEY (`country`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table social_media_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_media_messages`;

CREATE TABLE `social_media_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `media_source` int(11) unsigned DEFAULT NULL,
  `geographic_area` int(11) unsigned NOT NULL,
  `gender` int(11) unsigned NOT NULL COMMENT '1 = Mujer; 2 = Hombre',
  `age` tinyint(1) unsigned NOT NULL,
  `school` varchar(100) DEFAULT '',
  `message` varchar(140) NOT NULL DEFAULT '',
  `pictures` varchar(2000) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_source` (`media_source`),
  KEY `geographic_area` (`geographic_area`),
  KEY `gender` (`gender`),
  CONSTRAINT `social_media_messages_ibfk_1` FOREIGN KEY (`media_source`) REFERENCES `social_media_sources` (`id`),
  CONSTRAINT `social_media_messages_ibfk_2` FOREIGN KEY (`geographic_area`) REFERENCES `geographic_areas` (`id`),
  CONSTRAINT `social_media_messages_ibfk_3` FOREIGN KEY (`gender`) REFERENCES `genders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table social_media_sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_media_sources`;

CREATE TABLE `social_media_sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `social_media` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `social_media_sources` WRITE;
/*!40000 ALTER TABLE `social_media_sources` DISABLE KEYS */;

INSERT INTO `social_media_sources` (`id`, `social_media`, `website`)
VALUES
	(1,'Twitter','https://twitter.com');

/*!40000 ALTER TABLE `social_media_sources` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
