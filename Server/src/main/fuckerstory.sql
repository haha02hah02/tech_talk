/*
Navicat MySQL Data Transfer

Source Server         : odinms
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : fuckerstory

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-05-16 01:42:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `belong` int(11) DEFAULT NULL,
  `hp` int(11) unsigned zerofill DEFAULT NULL,
  `mp` int(11) unsigned zerofill DEFAULT NULL,
  `exp` int(11) unsigned zerofill DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `hair` int(11) DEFAULT NULL,
  `face` int(11) DEFAULT NULL,
  `eardrop` int(11) unsigned zerofill DEFAULT NULL,
  `cap` int(11) unsigned zerofill DEFAULT NULL,
  `longcoat` int(11) unsigned zerofill DEFAULT NULL,
  `shoes` int(11) unsigned zerofill DEFAULT NULL,
  `glove` int(11) unsigned zerofill DEFAULT NULL,
  `cape` int(11) unsigned zerofill DEFAULT NULL,
  `weapon` int(11) unsigned zerofill DEFAULT NULL,
  `job` int(11) DEFAULT NULL,
  `map` int(11) DEFAULT NULL,
  `rmap` int(11) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `checkcode` varchar(255) DEFAULT NULL,
  `coat` int(11) unsigned zerofill DEFAULT NULL,
  `pants` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `belong` (`belong`)
) ENGINE=MyISAM AUTO_INCREMENT=10001 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of characters
-- ----------------------------
INSERT INTO `characters` VALUES ('1', 'fucker', '2', '00000032767', '00000032767', '00000032767', '2000', '35550', '20035', '00001032021', '00001002140', '00001053116', '00001072189', '00001082685', '00001102801', '00001702170', '100', '105070300', '100000100', '0', '0', '4be8d05a2da2ff48ce6b4ba56375ea7bf5ef2b05', '00001040002', '00000000000');
INSERT INTO `characters` VALUES ('10000', 'fucker', '1', '00000000050', '00000000050', '00000032767', '2000', '35800', '20000', '00001032021', '00001002140', '00000000000', '00001072189', '00000000000', '00001102801', '00001702170', '200', '105070300', '100000000', '0', '0', '4be8d05a2da2ff48ce6b4ba56375ea7bf5ef2b05', '00000000000', '00000000000');

-- ----------------------------
-- Table structure for coin
-- ----------------------------
DROP TABLE IF EXISTS `coin`;
CREATE TABLE `coin` (
  `id` int(11) NOT NULL,
  `belong` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `provenance` varchar(255) DEFAULT NULL,
  `check_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of coin
-- ----------------------------
INSERT INTO `coin` VALUES ('1', '1', '999999', '0', 'system', '0044bd555a0551f169b88fd280c45a6866e4f8e0');
INSERT INTO `coin` VALUES ('2', '1', '999999', '1', 'system', '17b025264b0684c42dbbd27791ce99c5c3cc19e2');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `identify` int(11) DEFAULT NULL,
  `serial` int(11) DEFAULT NULL,
  `belong` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `slevel` int(11) DEFAULT NULL,
  `provenance` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `check_code` varchar(255) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `tradeble` int(11) DEFAULT NULL,
  `stochastic` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------

-- ----------------------------
-- Table structure for levels
-- ----------------------------
DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `belong` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `check_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of levels
-- ----------------------------
INSERT INTO `levels` VALUES ('1', '2', '100', 'd5cc47c5dcf6a4f4b5ff3aa88660e03d23d28c46');
INSERT INTO `levels` VALUES ('2', '10000', '100', 'd5cc47c5dcf6a4f4b5ff3aa88660e03d23d28c46');

-- ----------------------------
-- Table structure for possession
-- ----------------------------
DROP TABLE IF EXISTS `possession`;
CREATE TABLE `possession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belong` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `provenance` varchar(255) DEFAULT NULL,
  `check_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of possession
-- ----------------------------
INSERT INTO `possession` VALUES ('1', '1', '999999', '0', 'system', '34bf8892162e48c60d1abfcca6645e50958b91bc');
INSERT INTO `possession` VALUES ('2', '1', '999999', '1', 'system', '3719769c236b8e567e15edf3ce696f17ba3563a4');
INSERT INTO `possession` VALUES ('3', '10000', '9999999', '0', 'system', '3719769c236b8e567e15edf3ce696f17ba3563a4');
INSERT INTO `possession` VALUES ('4', '10000', '9999999', '1', 'system', '34bf8892162e48c60d1abfcca6645e50958b91bc');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `invitation` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `gm` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `ctime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `signTime` timestamp NULL DEFAULT NULL,
  `lastTime` timestamp NULL DEFAULT NULL,
  `ban` int(11) DEFAULT NULL,
  `banTime` timestamp NULL DEFAULT NULL,
  `checkCode` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '123', '1', '1', '100003', '2018-05-15 00:26:54', '2018-05-14 22:55:38', '2018-05-14 22:55:38', '0', '2018-05-14 22:55:38', '26e29d525b6dba77177f0e30be10f2e554542830', '127.0.0.1');
INSERT INTO `user` VALUES ('2', '421525157@qq.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '123', '1', '0', '100003', '2018-05-15 01:14:54', '2018-05-15 01:14:08', '2018-05-15 01:14:11', '0', '2018-05-15 01:14:47', '4be8d05a2da2ff48ce6b4ba56375ea7bf5ef2b05', '127.0.0.1');
