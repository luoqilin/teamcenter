/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.19 : Database - team
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`team` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `team`;

/*Table structure for table `game` */

DROP TABLE IF EXISTS `game`;

CREATE TABLE `game` (
  `game_id` int NOT NULL AUTO_INCREMENT COMMENT '游戏id',
  `game_name` varchar(50) DEFAULT NULL COMMENT '游戏名称',
  `rank_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '等级类型，R表示rank分，D表示段位，A表示战斗力',
  `rank_list` varchar(1024) DEFAULT NULL COMMENT '段位表，为空表示游戏没有段位',
  `max_team_size` int DEFAULT NULL COMMENT '游戏最大组队人数',
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `game` */

insert  into `game`(`game_id`,`game_name`,`rank_type`,`rank_list`,`max_team_size`) values (1,'英雄联盟','D','{\"最强王者\",\"大师\",\"钻石\",\"白金\",\"黄金\",\"白银\",\"青铜\",\"黑铁\"}.[1,5]',5),(2,'绝地求生','D','{\"最强王者\",\"钻石\",\"白金\",\"黄金\",\"白银\",\"青铜\"}.[1,5]',4);

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `player_id` int NOT NULL AUTO_INCREMENT COMMENT '玩家id',
  `game_id` int DEFAULT NULL COMMENT '游戏对应id',
  `name` varchar(50) DEFAULT NULL COMMENT '玩家游戏id',
  `rank` int DEFAULT NULL COMMENT '段位/战斗力/rank',
  `kd` float DEFAULT NULL COMMENT 'kd',
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `player` */

/*Table structure for table `player_room` */

DROP TABLE IF EXISTS `player_room`;

CREATE TABLE `player_room` (
  `room_id` int DEFAULT NULL COMMENT '房间id',
  `player_id` int DEFAULT NULL COMMENT '玩家id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `player_room` */

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `room_id` int NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `title` varchar(50) DEFAULT NULL COMMENT '房间标题',
  `game_id` int DEFAULT NULL COMMENT '对应的游戏id',
  `main_require` int DEFAULT NULL COMMENT '主要求（段位/战斗力>该要求）',
  `kd` float DEFAULT NULL COMMENT 'kd要求',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `room` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
