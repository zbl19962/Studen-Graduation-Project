/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : gproject

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 20xx-xx-xx 14:56:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `adminName` varchar(32) NOT NULL COMMENT '用户登录账号',
  `adminPwd` varchar(32) NOT NULL COMMENT '用户登录密码',
  `adminRealName` varchar(32) DEFAULT NULL COMMENT '管理员真实姓名',
  `adminSex` tinyint(4) DEFAULT '1' COMMENT '1为男性、2为女性',
  `adminAge` tinyint(4) DEFAULT NULL COMMENT '管理员年龄',
  `adminPhone` varchar(11) DEFAULT NULL COMMENT '管理员联系方式',
  `adminEmail` varchar(32) DEFAULT NULL,
  `adminAddress` varchar(256) DEFAULT NULL COMMENT '管理员住址',
  `createTime` varchar(12) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(12) DEFAULT NULL COMMENT '用户最后一次信息更新时间、默认为账户创建时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '1为一级管理员、2为二级教师管理员、3为二级学生管理员',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `gproject`
-- ----------------------------
DROP TABLE IF EXISTS `gproject`;
CREATE TABLE `gproject` (
  `gpId` int(11) NOT NULL AUTO_INCREMENT COMMENT '毕设编号',
  `gpThrId` int(11) DEFAULT NULL COMMENT '指导教师编号',
  `gpTitle` varchar(128) DEFAULT NULL COMMENT '毕设标题',
  `gpContent` varchar(2048) DEFAULT NULL COMMENT '毕设内容',
  `gpAim` varchar(128) DEFAULT NULL COMMENT '毕设目的',
  `gpRequest` varchar(128) DEFAULT NULL COMMENT '毕设要求',
  `gpMust` varchar(128) DEFAULT NULL COMMENT '必备知识',
  `gpFormal` varchar(128) DEFAULT NULL COMMENT '提交形式',
  `gpOthers` varchar(2048) DEFAULT NULL COMMENT '毕设相关备注',
  `createTime` varchar(12) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(12) DEFAULT NULL COMMENT '更新时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '1为发布且未选择、2为发布且已选择、3为已确认、-1为删除',
  PRIMARY KEY (`gpId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gproject
-- ----------------------------

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `majorId` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `majorName` varchar(64) DEFAULT NULL COMMENT '专业名称',
  PRIMARY KEY (`majorId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `msgId` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msgParentId` int(11) DEFAULT NULL COMMENT '用于消息回复',
  `msgFromId` int(11) DEFAULT NULL COMMENT '消息发送者',
  `msgAccessId` int(11) DEFAULT NULL COMMENT '消息接收者',
  `msgContent` varchar(1024) DEFAULT NULL COMMENT '消息内容',
  `createTime` varchar(12) DEFAULT NULL COMMENT '消息发送时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '1为普通消息、2为管理员通告',
  PRIMARY KEY (`msgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `stlinks`
-- ----------------------------
DROP TABLE IF EXISTS `stlinks`;
CREATE TABLE `stlinks` (
  `stlId` int(11) NOT NULL AUTO_INCREMENT COMMENT '毕设选择关系表',
  `stlSpId` int(11) DEFAULT NULL COMMENT '毕设Id',
  `stlStuId` int(11) DEFAULT NULL COMMENT '学生ID',
  `createTime` varchar(12) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(12) DEFAULT NULL COMMENT '更新时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '1为选中、2为确认、3为放弃',
  PRIMARY KEY (`stlId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stlinks
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `stuCard` varchar(32) NOT NULL COMMENT '用户登录账号 为学生学号',
  `stuPwd` varchar(32) NOT NULL COMMENT '用户登录密码',
  `stuRealName` varchar(32) DEFAULT NULL COMMENT '学生真实姓名',
  `stuSex` tinyint(4) DEFAULT '1' COMMENT '1为男性、2为女性',
  `stuAge` tinyint(4) DEFAULT NULL COMMENT '学生年龄',
  `stuPhone` varchar(11) DEFAULT NULL COMMENT '学生联系方式',
  `stuEmail` varchar(64) DEFAULT NULL,
  `stuMajor` tinyint(4) DEFAULT NULL COMMENT '学生专业',
  `createTime` varchar(12) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(12) DEFAULT NULL COMMENT '用户最后一次信息更新时间、默认为账户创建时间',
  `state` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`stuId`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `thrId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `thrName` varchar(32) NOT NULL COMMENT '用户登录账号',
  `thrPwd` varchar(32) NOT NULL COMMENT '用户登录密码',
  `thrRealName` varchar(32) DEFAULT NULL COMMENT '用户真实姓名',说
  `thrSex` tinyint(4) DEFAULT '1' COMMENT '1为男性、2为女性',
  `thrAge` tinyint(4) DEFAULT NULL COMMENT '用户年龄',
  `thrStudy` varchar(128) DEFAULT NULL COMMENT '用户研究方向',
  `thrEmail` varchar(32) DEFAULT NULL,
  `thrPhone` varchar(11) DEFAULT NULL COMMENT '用户联系方式',
  `showState` char(4) DEFAULT NULL,
  `thrAddress` varchar(256) DEFAULT NULL COMMENT '用户办公地址',
  `createTime` varchar(12) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(12) DEFAULT NULL COMMENT '用户最后一次信息更新时间、默认为账户创建时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '1正常 -1为回收站',
  PRIMARY KEY (`thrId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
