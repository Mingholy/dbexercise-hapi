/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50552
Source Host           : localhost:3306
Source Database       : course

Target Server Type    : MYSQL
Target Server Version : 50552
File Encoding         : 65001

Date: 2017-03-28 16:27:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` char(15) COLLATE utf8_bin DEFAULT NULL,
  `course_type` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `course_credit` float DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('0', '模式识别', '讲授', '2');
INSERT INTO `course` VALUES ('1', 'C++编程', '讨论', '2');
INSERT INTO `course` VALUES ('2', '计算机视觉', '讨论', '1');
INSERT INTO `course` VALUES ('3', '密码学', '讲授', '3');
INSERT INTO `course` VALUES ('4', '数理分析', '讨论', '2');
INSERT INTO `course` VALUES ('5', '英语', '讲授', '3');
INSERT INTO `course` VALUES ('6', '声乐', '讨论', '1');
INSERT INTO `course` VALUES ('7', '控制理论', '讲授', '3');
INSERT INTO `course` VALUES ('8', '信号处理', '讨论', '2');
INSERT INTO `course` VALUES ('9', '物理学', '讲授', '3');
INSERT INTO `course` VALUES ('10', '化学分析', '讨论', '1');
INSERT INTO `course` VALUES ('11', '遗传学', '讲授', '3');
INSERT INTO `course` VALUES ('12', '数据结构', '讲授', '3');
INSERT INTO `course` VALUES ('13', '通信工程', '讲授', '2');
INSERT INTO `course` VALUES ('14', '随机数学', '讲授', '3');
INSERT INTO `course` VALUES ('15', '日语', '讲授', '2');
INSERT INTO `course` VALUES ('16', '美术', '讨论', '1');
INSERT INTO `course` VALUES ('17', '解剖学', '讨论', '1');
INSERT INTO `course` VALUES ('18', '有机化学', '讨论', '1');
INSERT INTO `course` VALUES ('19', '材料学', '讲授', '2');
INSERT INTO `course` VALUES ('20', '流体力学', '讲授', '3');
INSERT INTO `course` VALUES ('21', '复变函数', '讲授', '2');
INSERT INTO `course` VALUES ('22', '市场营销', '讲授', '3');
INSERT INTO `course` VALUES ('23', '人力资源管理', '讲授', '3');
INSERT INTO `course` VALUES ('24', '组织理论与设计', '讨论', '2');
INSERT INTO `course` VALUES ('25', '证券投资学', '讲授', '2');
INSERT INTO `course` VALUES ('26', '宏观经济学', '讨论', '1');
INSERT INTO `course` VALUES ('27', '微观经济学', '讲授', '2');
INSERT INTO `course` VALUES ('28', '管理学', '讲授', '2');
INSERT INTO `course` VALUES ('29', '公司战略', '讨论', '1');
INSERT INTO `course` VALUES ('30', '德语', '讲授', '3');
INSERT INTO `course` VALUES ('31', '西班牙语', '讲授', '2');

-- ----------------------------
-- Table structure for course_selected
-- ----------------------------
DROP TABLE IF EXISTS `course_selected`;
CREATE TABLE `course_selected` (
  `stu_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_grade` int(11) DEFAULT NULL,
  `prof_number` int(11) DEFAULT NULL,
  KEY `FK_Relationship_1` (`stu_id`),
  KEY `FK_Relationship_2` (`course_id`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of course_selected
-- ----------------------------
INSERT INTO `course_selected` VALUES ('0', '1', '99', '1');
INSERT INTO `course_selected` VALUES ('1', '3', '99', '3');
INSERT INTO `course_selected` VALUES ('2', '5', '99', '5');
INSERT INTO `course_selected` VALUES ('3', '7', '99', '7');
INSERT INTO `course_selected` VALUES ('4', '9', '99', '9');
INSERT INTO `course_selected` VALUES ('5', '11', '99', '1');
INSERT INTO `course_selected` VALUES ('6', '13', '88', '3');
INSERT INTO `course_selected` VALUES ('7', '15', '88', '5');
INSERT INTO `course_selected` VALUES ('8', '17', '88', '7');
INSERT INTO `course_selected` VALUES ('9', '19', '88', '9');
INSERT INTO `course_selected` VALUES ('10', '21', '88', '1');
INSERT INTO `course_selected` VALUES ('11', '23', '88', '3');
INSERT INTO `course_selected` VALUES ('12', '25', '88', '5');
INSERT INTO `course_selected` VALUES ('13', '27', '77', '7');
INSERT INTO `course_selected` VALUES ('14', '29', '77', '9');
INSERT INTO `course_selected` VALUES ('15', '31', '77', '1');
INSERT INTO `course_selected` VALUES ('16', '1', '77', '1');
INSERT INTO `course_selected` VALUES ('17', '3', '77', '3');
INSERT INTO `course_selected` VALUES ('18', '5', '77', '5');
INSERT INTO `course_selected` VALUES ('19', '7', '77', '7');
INSERT INTO `course_selected` VALUES ('20', '9', '66', '9');
INSERT INTO `course_selected` VALUES ('21', '11', '66', '1');
INSERT INTO `course_selected` VALUES ('22', '13', '66', '3');
INSERT INTO `course_selected` VALUES ('23', '15', '66', '5');
INSERT INTO `course_selected` VALUES ('24', '17', '66', '7');
INSERT INTO `course_selected` VALUES ('25', '19', '66', '9');
INSERT INTO `course_selected` VALUES ('26', '30', '55', '0');
INSERT INTO `course_selected` VALUES ('27', '29', '55', '9');
INSERT INTO `course_selected` VALUES ('28', '24', '66', '4');
INSERT INTO `course_selected` VALUES ('29', '26', '66', '6');
INSERT INTO `course_selected` VALUES ('30', '31', '55', '1');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('0', '计算机系');
INSERT INTO `department` VALUES ('1', '自动化系');
INSERT INTO `department` VALUES ('2', '艺术系');
INSERT INTO `department` VALUES ('3', '通信系');
INSERT INTO `department` VALUES ('4', '外语系');
INSERT INTO `department` VALUES ('5', '物理系');
INSERT INTO `department` VALUES ('6', '化学系');
INSERT INTO `department` VALUES ('7', '数学系');
INSERT INTO `department` VALUES ('8', '生物系');
INSERT INTO `department` VALUES ('9', '管理系');

-- ----------------------------
-- Table structure for professor
-- ----------------------------
DROP TABLE IF EXISTS `professor`;
CREATE TABLE `professor` (
  `prof_id` int(11) NOT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `prof_name` char(8) COLLATE utf8_bin DEFAULT NULL,
  `prof_title` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`prof_id`),
  KEY `FK_Relationship_6` (`dep_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of professor
-- ----------------------------
INSERT INTO `professor` VALUES ('0', '0', '牛根生', '教授');
INSERT INTO `professor` VALUES ('1', '1', '王石', '教授');
INSERT INTO `professor` VALUES ('2', '2', '马化腾', '副教授');
INSERT INTO `professor` VALUES ('3', '3', '周鸿祎', '副教授');
INSERT INTO `professor` VALUES ('4', '4', '马云', '教授');
INSERT INTO `professor` VALUES ('5', '5', '柳传志', '教授');
INSERT INTO `professor` VALUES ('6', '6', '史玉柱', '副教授');
INSERT INTO `professor` VALUES ('7', '7', '王建宙', '教授');
INSERT INTO `professor` VALUES ('8', '8', '李彦宏', '副教授');
INSERT INTO `professor` VALUES ('9', '9', '周小川', '教授');
INSERT INTO `professor` VALUES ('10', '0', '王健林', '教授');
INSERT INTO `professor` VALUES ('11', '1', '李开复', '教授');

-- ----------------------------
-- Table structure for prof_course
-- ----------------------------
DROP TABLE IF EXISTS `prof_course`;
CREATE TABLE `prof_course` (
  `course_id` int(11) DEFAULT NULL,
  `prof_id` int(11) DEFAULT NULL,
  KEY `FK_Relationship_3` (`prof_id`),
  KEY `FK_Relationship_4` (`course_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`prof_id`) REFERENCES `professor` (`prof_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of prof_course
-- ----------------------------
INSERT INTO `prof_course` VALUES ('0', '0');
INSERT INTO `prof_course` VALUES ('1', '1');
INSERT INTO `prof_course` VALUES ('2', '2');
INSERT INTO `prof_course` VALUES ('3', '3');
INSERT INTO `prof_course` VALUES ('4', '4');
INSERT INTO `prof_course` VALUES ('5', '5');
INSERT INTO `prof_course` VALUES ('6', '6');
INSERT INTO `prof_course` VALUES ('7', '7');
INSERT INTO `prof_course` VALUES ('8', '8');
INSERT INTO `prof_course` VALUES ('9', '9');
INSERT INTO `prof_course` VALUES ('10', '0');
INSERT INTO `prof_course` VALUES ('11', '1');
INSERT INTO `prof_course` VALUES ('12', '2');
INSERT INTO `prof_course` VALUES ('13', '3');
INSERT INTO `prof_course` VALUES ('14', '4');
INSERT INTO `prof_course` VALUES ('15', '5');
INSERT INTO `prof_course` VALUES ('16', '6');
INSERT INTO `prof_course` VALUES ('17', '7');
INSERT INTO `prof_course` VALUES ('18', '8');
INSERT INTO `prof_course` VALUES ('19', '9');
INSERT INTO `prof_course` VALUES ('20', '0');
INSERT INTO `prof_course` VALUES ('21', '1');
INSERT INTO `prof_course` VALUES ('22', '2');
INSERT INTO `prof_course` VALUES ('23', '3');
INSERT INTO `prof_course` VALUES ('24', '4');
INSERT INTO `prof_course` VALUES ('25', '5');
INSERT INTO `prof_course` VALUES ('26', '6');
INSERT INTO `prof_course` VALUES ('27', '7');
INSERT INTO `prof_course` VALUES ('28', '8');
INSERT INTO `prof_course` VALUES ('29', '9');
INSERT INTO `prof_course` VALUES ('30', '0');
INSERT INTO `prof_course` VALUES ('31', '1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `stu_name` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `stu_gender` char(1) COLLATE utf8_bin DEFAULT NULL,
  `stu_bday` date DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `FK_Relationship_7` (`dep_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('0', '0', '张三', '男', '1987-06-10');
INSERT INTO `student` VALUES ('1', '1', '李四', '男', '1987-06-10');
INSERT INTO `student` VALUES ('2', '2', '王五', '女', '1987-06-10');
INSERT INTO `student` VALUES ('3', '3', '赵六', '男', '1987-06-10');
INSERT INTO `student` VALUES ('4', '4', '李德', '男', '1987-06-10');
INSERT INTO `student` VALUES ('5', '5', '王和', '男', '1987-06-10');
INSERT INTO `student` VALUES ('6', '6', '田亮', '男', '1987-06-10');
INSERT INTO `student` VALUES ('7', '7', '周润发', '男', '1987-06-10');
INSERT INTO `student` VALUES ('8', '8', '刘德华', '男', '1987-06-10');
INSERT INTO `student` VALUES ('9', '9', '谢霆锋', '男', '1987-06-10');
INSERT INTO `student` VALUES ('10', '0', '邓超', '男', '1987-06-10');
INSERT INTO `student` VALUES ('11', '1', '刘翔', '男', '1986-02-14');
INSERT INTO `student` VALUES ('12', '2', '姚明', '男', '1986-02-14');
INSERT INTO `student` VALUES ('13', '3', '高峰', '男', '1986-02-14');
INSERT INTO `student` VALUES ('14', '4', '史冬鹏', '男', '1986-02-14');
INSERT INTO `student` VALUES ('15', '5', '郭晶晶', '女', '1986-02-14');
INSERT INTO `student` VALUES ('16', '6', '汤唯', '女', '1986-02-14');
INSERT INTO `student` VALUES ('17', '7', '范冰冰', '女', '1986-02-14');
INSERT INTO `student` VALUES ('18', '8', '李冰冰', '女', '1986-02-14');
INSERT INTO `student` VALUES ('19', '9', '赵本山', '男', '1986-02-14');
INSERT INTO `student` VALUES ('20', '0', '郭德纲', '男', '1986-02-14');
INSERT INTO `student` VALUES ('21', '1', '于谦', '男', '1986-02-14');
INSERT INTO `student` VALUES ('22', '2', '岳云鹏', '男', '1987-08-14');
INSERT INTO `student` VALUES ('23', '3', '姜昆', '男', '1987-09-05');
INSERT INTO `student` VALUES ('24', '4', '李金斗', '男', '1987-09-05');
INSERT INTO `student` VALUES ('25', '5', '刘青云', '男', '1987-09-05');
INSERT INTO `student` VALUES ('26', '6', '张靓颖', '女', '1987-09-05');
INSERT INTO `student` VALUES ('27', '7', '韩寒', '男', '1987-09-05');
INSERT INTO `student` VALUES ('28', '8', '李宇春', '女', '1987-09-05');
INSERT INTO `student` VALUES ('29', '9', '张静初', '女', '1987-09-05');
INSERT INTO `student` VALUES ('30', '9', '莫文蔚', '女', '1987-09-05');
