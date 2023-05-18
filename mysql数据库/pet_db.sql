/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : pet_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2019-12-03 20:04:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_expert`
-- ----------------------------
DROP TABLE IF EXISTS `t_expert`;
CREATE TABLE `t_expert` (
  `expertUserName` varchar(30) NOT NULL COMMENT 'expertUserName',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `expertPhoto` varchar(60) NOT NULL COMMENT '专家照片',
  `school` varchar(80) NOT NULL COMMENT '毕业学校',
  `workExperience` varchar(50) NOT NULL COMMENT '工作经验',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `expertDesc` varchar(8000) NOT NULL COMMENT '专家详情',
  PRIMARY KEY  (`expertUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_expert
-- ----------------------------
INSERT INTO `t_expert` VALUES ('zj001', '123', '张兴婷', '女', '2019-08-28', 'upload/8209275b-f68b-4f35-b5cd-9a95aefe01f0.jpg', '宠物医科大学', '3年', '13980412801', '<p>对各种犬类疾病了如指掌，精心呵护你的爱犬</p>');
INSERT INTO `t_expert` VALUES ('zj002', '123', '孟晓光', '女', '2019-08-07', 'upload/c1cea1fc-c933-40c8-a587-600a8ec1c4f2.jpg', '宠物学院', '2年', '13085308123', '<p>爱心呵护你的爱犬，为你的狗狗建立一个好的计划</p>');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '回复内容',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  `shenHeState` varchar(20) NOT NULL default '待审核' COMMENT '审核状态',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '拉布拉多生病了怎么看', '我感觉我家的狗狗生病了，怎么辨别', 'user1', '2019-08-28 16:57:06', '你最好找宠物医院看看', '2019-08-28 16:57:09', '已审核');
INSERT INTO `t_leaveword` VALUES ('2', '我家泰迪不会得狂犬病了吧', '最近总是喜欢乱叫咬人', 'user2', '2019-08-29 19:55:48', '--', '--', '待审核');
INSERT INTO `t_leaveword` VALUES ('3', 'aaa', 'bbb', 'user1', '2019-12-03 19:58:25', '--', '--', '待审核');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `newsId` int(11) NOT NULL auto_increment COMMENT '资讯id',
  `newsClassObj` int(11) NOT NULL COMMENT '资讯分类',
  `title` varchar(80) NOT NULL COMMENT '资讯标题',
  `petClassObj` int(11) NOT NULL COMMENT '宠物分类',
  `tixing` varchar(20) NOT NULL COMMENT '宠物体型',
  `content` varchar(5000) NOT NULL COMMENT '资讯内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`newsId`),
  KEY `newsClassObj` (`newsClassObj`),
  KEY `petClassObj` (`petClassObj`),
  CONSTRAINT `t_news_ibfk_2` FOREIGN KEY (`petClassObj`) REFERENCES `t_petclass` (`petClassId`),
  CONSTRAINT `t_news_ibfk_1` FOREIGN KEY (`newsClassObj`) REFERENCES `t_newsclass` (`newsClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '1', '狗狗洗澡常识', '1', '不限制', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">定期给宠物洗澡：猫猫和狗狗应每隔7～15天洗澡一次，应选择专用浴液，否则易患皮肤病</span></p>', '2019-08-28 16:59:30');
INSERT INTO `t_news` VALUES ('2', '3', '狗狗疫苗注射时间', '2', '不限制', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">定期给宠物注射疫苗：给宠物注射疫苗非常重要，狗狗和猫猫每年都要注射疫苗；幼犬应在断奶后15天注射疫苗，连注3次。在注射疫苗前一周应驱虫，否则影响疫苗的功效</span></p>', '2019-08-29 21:39:27');
INSERT INTO `t_news` VALUES ('3', '2', '宠物狗狗喂养计划', '1', '小型', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">饮食：狗狗和猫猫最好的主食是狗粮、猫粮。因为其配方科学，能满足宠物对蛋白质、碳水化合物、脂肪、维生素和无机盐等生长的 需求。长期食用肉、肝、骨头等食物有害宠物健康，犬吃洋葱和过量维生素A、D，易发生中毒。</span></p>', '2019-08-29 21:41:32');
INSERT INTO `t_news` VALUES ('4', '3', '狗狗寄生虫驱虫时间', '2', '不限制', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">要定期给宠物驱虫：猫猫和狗狗很容易患螨虫、蛔虫、绦虫、蚤、华支睾吸虫、虱等寄生虫病，通常宠物出生后20天就应该驱虫了。成年狗狗和猫猫每半年驱一次虫。</span></p>', '2019-08-29 21:42:30');
INSERT INTO `t_news` VALUES ('5', '3', '狗狗体温检查', '2', '不限制', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; text-align: justify; background-color: rgb(255, 255, 255);\">量体温：体温的高低是猫猫、狗狗健康的重要标志。一般幼犬体温在38.5-39.5度之间，成年犬体温在37.5～38.5度之间。而猫猫正常体温在38.5～39.5度之间。作为饲主一定要记得每天早晚给宠物检测体温。</span></p>', '2019-08-29 21:43:09');

-- ----------------------------
-- Table structure for `t_newsclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_newsclass`;
CREATE TABLE `t_newsclass` (
  `newsClassId` int(11) NOT NULL auto_increment COMMENT '分类id',
  `newsClassName` varchar(20) NOT NULL COMMENT '分类名称',
  PRIMARY KEY  (`newsClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_newsclass
-- ----------------------------
INSERT INTO `t_newsclass` VALUES ('1', '宠物常识');
INSERT INTO `t_newsclass` VALUES ('2', '喂养计划');
INSERT INTO `t_newsclass` VALUES ('3', '疾病预防');

-- ----------------------------
-- Table structure for `t_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `orderId` int(11) NOT NULL auto_increment COMMENT '预约id',
  `expertObj` varchar(30) NOT NULL COMMENT '预约专家',
  `orderDate` varchar(20) default NULL COMMENT '预约日期',
  `orderTime` varchar(20) NOT NULL COMMENT '预约时间',
  `orderContent` varchar(500) NOT NULL COMMENT '预约内容',
  `userObj` varchar(30) NOT NULL COMMENT '预约用户',
  `handleState` varchar(20) NOT NULL COMMENT '处理状态',
  `handleResult` varchar(500) default NULL COMMENT '处理结果',
  `memo` varchar(500) default NULL COMMENT '预约备注',
  PRIMARY KEY  (`orderId`),
  KEY `expertObj` (`expertObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_orderinfo_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`expertObj`) REFERENCES `t_expert` (`expertUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('1', 'zj001', '2019-09-03', '下午2点', '我家狗狗精神不是很好，来看看有啥病', 'user1', '待处理', '--', 'test');
INSERT INTO `t_orderinfo` VALUES ('2', 'zj002', '2019-09-05', '下午2点', '我宠物爱乱叫咬人了，来做检查', 'user2', '待处理', '--', '麻烦了');

-- ----------------------------
-- Table structure for `t_petclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_petclass`;
CREATE TABLE `t_petclass` (
  `petClassId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `petClassName` varchar(20) NOT NULL COMMENT '类别名称',
  PRIMARY KEY  (`petClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_petclass
-- ----------------------------
INSERT INTO `t_petclass` VALUES ('1', '拉布拉多');
INSERT INTO `t_petclass` VALUES ('2', '泰迪');
INSERT INTO `t_petclass` VALUES ('3', '中华田园犬');

-- ----------------------------
-- Table structure for `t_postinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_postinfo`;
CREATE TABLE `t_postinfo` (
  `postInfoId` int(11) NOT NULL auto_increment COMMENT '帖子id',
  `title` varchar(80) NOT NULL COMMENT '帖子标题',
  `petClassObj` int(11) NOT NULL COMMENT '宠物分类',
  `content` varchar(5000) NOT NULL COMMENT '帖子内容',
  `hitNum` int(11) NOT NULL COMMENT '浏览量',
  `userObj` varchar(30) NOT NULL COMMENT '发帖人',
  `addTime` varchar(20) default NULL COMMENT '发帖时间',
  `jinghuaFlag` varchar(20) NOT NULL COMMENT '是否精华帖',
  `shenHeState` varchar(20) default '待审核' COMMENT '审核状态',
  PRIMARY KEY  (`postInfoId`),
  KEY `petClassObj` (`petClassObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_postinfo_ibfk_1` FOREIGN KEY (`petClassObj`) REFERENCES `t_petclass` (`petClassId`),
  CONSTRAINT `t_postinfo_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_postinfo
-- ----------------------------
INSERT INTO `t_postinfo` VALUES ('1', '我家拉布拉多最近没胃口', '1', '<p>最近不爱吃食品，总是一个人睡觉不想动</p>', '12', 'user1', '2019-08-28 16:56:41', '是', '已审核');
INSERT INTO `t_postinfo` VALUES ('2', '我家泰迪最近性情暴躁', '2', '<p>不知道怎么了，我们家的宝贝最近比较容易发狂，我都被它咬了一口，烦死了</p>', '1', 'user2', '2019-08-29 19:37:47', '否', '已审核');
INSERT INTO `t_postinfo` VALUES ('3', '11111', '1', '<p>2222</p>', '0', 'user1', '2019-12-03 19:58:39', '否', '待审核');

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `replyId` int(11) NOT NULL auto_increment COMMENT '回复id',
  `postInfoObj` int(11) NOT NULL COMMENT '被回帖子',
  `content` varchar(2000) NOT NULL COMMENT '回复内容',
  `userObj` varchar(30) NOT NULL COMMENT '回复人',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`replyId`),
  KEY `postInfoObj` (`postInfoObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_reply_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_reply_ibfk_1` FOREIGN KEY (`postInfoObj`) REFERENCES `t_postinfo` (`postInfoId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES ('1', '1', '谁知道这是什么原因吗？', 'user1', '2019-08-28 16:56:57');
INSERT INTO `t_reply` VALUES ('2', '1', '可能是生病了吧！', 'user2', '2019-08-29 21:35:25');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `petClassObj` int(11) NOT NULL COMMENT '宠物类别',
  `nicheng` varchar(20) NOT NULL COMMENT '宠物昵称',
  `petPhoto` varchar(60) NOT NULL COMMENT '宠物照片',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `tixing` varchar(20) NOT NULL COMMENT '体型',
  `weight` varchar(20) NOT NULL COMMENT '体重',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `sfym` varchar(20) NOT NULL COMMENT '是否接种疫苗',
  `name` varchar(20) NOT NULL COMMENT '主人姓名',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮件',
  `memo` varchar(500) default NULL COMMENT '备注信息',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`),
  KEY `petClassObj` (`petClassObj`),
  CONSTRAINT `t_userinfo_ibfk_1` FOREIGN KEY (`petClassObj`) REFERENCES `t_petclass` (`petClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '1', '旺财', 'upload/db672561-5656-4d00-be60-fd60679f6c4f.jpg', '雄性', '中等', '32Kg', '2019-08-28', '是', '张曦', '13084310842', 'zhangxi@126.com', '测试', '2019-08-28 16:54:10');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '2', '泰宝', 'upload/0e020611-ca6a-4de1-b438-08cb7f98e4ee.jpg', '雄性', '小型', '23', '2019-08-21', '是', '王建胜', '13029301342', 'jiansheng@163.com', '测试', '2019-08-29 21:15:07');
