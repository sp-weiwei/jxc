/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : db_jxc

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-12-04 21:23:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerNo` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `area` varchar(64) NOT NULL,
  `myd` varchar(64) DEFAULT NULL,
  `address` varchar(64) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('3', 'KH20181112045907', '唐浩荣', '长沙', '☆☆☆☆☆', '长沙', '15200565360', '这里的或还不错！！');
INSERT INTO `t_customer` VALUES ('4', 'KH20181112050052', 'Java', '长沙', '☆', '衡阳市', '15200565360', '');
INSERT INTO `t_customer` VALUES ('5', 'KH20181116022517', '张三', '内蒙古', '☆☆☆☆', '内蒙古呼和浩特市和林格尔盛乐经济园区', '15200565360', '666，好！！');
INSERT INTO `t_customer` VALUES ('6', 'KH20181116022602', '李四', '株洲', '☆☆☆', '湖南省株洲市开放区105号', '400-6603333', '');
INSERT INTO `t_customer` VALUES ('7', 'KH20181116022654', '王五', '上海', '☆☆☆☆☆', '上海市浦东区沿江路2018', '18073491099', '666，好！！');
INSERT INTO `t_customer` VALUES ('8', 'KH20181116022731', '赵六', '祁东', '☆☆☆☆', '湖南省衡阳市祁东县水果市场', '15200565360', '质量好，味道好，推荐！！！');

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsNo` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `inPrice` float NOT NULL,
  `outPrice` float NOT NULL,
  `stockDate` date NOT NULL,
  `inventory` int(128) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `wareHouseId` int(11) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', 'JH20181112045907', '苹果', '箱', '水果', '衡阳市', '50', '60', '2018-11-07', '1000', '1', '1', '质量好，味道好，推荐！！！');
INSERT INTO `t_goods` VALUES ('4', 'JH20181112045902', '笔记本', '台', '水果', '长沙', '5669', '6000', '2018-11-11', '999', '6', '2', '不错！！');
INSERT INTO `t_goods` VALUES ('6', 'JH20181112045904', '手机', '台', '电子产品', '长沙', '1999', '2599', '2018-11-11', '123', '8', '3', '666');
INSERT INTO `t_goods` VALUES ('7', 'JH20181112045905', '笔记本', '台', '电子产品', '衡阳市', '5669', '6000', '2018-11-11', '999', '6', '3', '不错！！');
INSERT INTO `t_goods` VALUES ('8', 'JH20181112045906', '插头', '个', '电子产品', '长沙', '50', '60', '2018-11-12', '999', '13', '4', '质量挺好的！！！');
INSERT INTO `t_goods` VALUES ('9', 'JH20181113073603', '鼠标', '个', '电子产品', '株洲', '100', '150', '2018-11-13', '100', '12', '5', '');
INSERT INTO `t_goods` VALUES ('10', 'JH20181113085914', '键盘', '个', '电子产品', '株洲', '100', '150', '2018-11-13', '100', '12', '6', '');
INSERT INTO `t_goods` VALUES ('13', 'JH20181116120836', '水杯', '个', '日用品', '长沙', '20', '30', '2018-11-16', '50', '16', '7', '');
INSERT INTO `t_goods` VALUES ('14', 'JH20181116120930', '垃圾袋', '盒', '日用品', '株洲', '10', '15', '2018-11-16', '60', '19', '1', '');
INSERT INTO `t_goods` VALUES ('15', 'JH20181116121014', '耳机', '盒', '电子产品', '株洲', '100', '120', '2018-11-16', '123', '13', '6', '不错！！');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(255) DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  `goodsId` int(64) NOT NULL,
  `goodsNum` int(11) NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `price` float NOT NULL,
  `sum` float NOT NULL,
  `orderDate` date NOT NULL,
  `address` varchar(64) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', 'DD20182016', '3', '1', '20', '箱', '60', '1200', '2018-11-07', '湖南省长沙市岳麓区湖南工业职业技术学院', '非常好！！！');
INSERT INTO `t_order` VALUES ('3', 'DD20182208', '4', '4', '20', '台', '2000', '40000', '2018-11-12', '湖南省衡阳市太康有限公司', '挺好卖的！');
INSERT INTO `t_order` VALUES ('4', 'DD20181113', '4', '4', '20', '箱', '50', '1000', '2018-11-13', '湖南祁东县', '好!');
INSERT INTO `t_order` VALUES ('5', 'DD20181114', '3', '1', '20', '箱', '60', '1200', '2018-11-14', '祁东', '好');
INSERT INTO `t_order` VALUES ('7', 'DD20181114', '4', '4', '50', '台', '5000', '250000', '2018-11-15', '湖南省长沙市岳麓区102', '666，好！！');
INSERT INTO `t_order` VALUES ('8', 'DD20181116', '5', '14', '50', '个', '20', '1000', '2018-11-01', '湖南省衡阳市祁东县水果市场', '');
INSERT INTO `t_order` VALUES ('9', 'DD20181116', '6', '10', '10', '台', '120', '1200', '2018-11-05', '湖南省长沙市岳麓区102', '');
INSERT INTO `t_order` VALUES ('10', 'DD20181116', '7', '13', '30', '个', '50', '1500', '2018-11-11', '上海市浦东区沿江路2018', '不错！！');
INSERT INTO `t_order` VALUES ('11', 'DD20181116', '8', '15', '10', '个', '20', '200', '2018-10-31', '内蒙古呼和浩特市和林格尔盛乐经济园区', '');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员');
INSERT INTO `t_role` VALUES ('2', '经理');
INSERT INTO `t_role` VALUES ('3', '采购主管');
INSERT INTO `t_role` VALUES ('4', '销售主管');

-- ----------------------------
-- Table structure for `t_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierNo` varchar(64) NOT NULL,
  `principal` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `area` varchar(64) DEFAULT NULL,
  `xyd` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `phone` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES ('1', 'GYS20181009092455', '梦瑶', '康泰有限公司', '衡阳', '☆☆☆☆', '湖南省永州市', '12654887456', '325487415@qq.com', '3543');
INSERT INTO `t_supplier` VALUES ('2', 'GYS20181009094115', '优璇', '满昌有限公司', '永州', '☆☆', '湖南省永州市', '1535434348', '325487415@qq.com', '453');
INSERT INTO `t_supplier` VALUES ('3', 'GYS20181009092545', '语嫣', '祥升有限公司', '株洲', '☆☆☆', '湖南省株洲市', '12457838786', '325487415@qq.com', '786');
INSERT INTO `t_supplier` VALUES ('4', 'GYS20181109094455', '李四', '洁柔有限公司', '长沙', '☆☆☆☆☆', '湖南省长沙市岳麓区102', '15200565360', '318951721@qq.com', '这里的或还不错！！');
INSERT INTO `t_supplier` VALUES ('5', 'GYS20181110022541', '王五', '水果市场', '祁东', '☆☆☆', '湖南省衡阳市祁东县水果市场', '18073491099', '2011542514@qq.com', '这里的水果还行！！！');
INSERT INTO `t_supplier` VALUES ('6', 'GYS20181110022630', '小明', '华硕电脑有限公司', '长沙', '☆☆☆☆', '湖南省长沙市岳麓区102', '15200565360', '2911729767@qq.com', '不错！！');
INSERT INTO `t_supplier` VALUES ('7', 'GYS20181110022755', '赵六', '苹果有限公司', '长沙', '☆☆☆', '湖南省衡阳市祁东县水果市场', '18073491099', '318951721@qq.com', '这里的水果还行！！！');
INSERT INTO `t_supplier` VALUES ('8', 'GYS20181009094455', '刘红安', '同富有限公司', '衡阳', '☆☆☆☆', '湖南省衡阳市雁塔区1006号', '15164887526', '254698748@qq.com', '6666');
INSERT INTO `t_supplier` VALUES ('9', 'GYS20181009094455', '婉婷', '聚兴有限公司', '岳阳', '☆☆☆☆', '湖南省岳阳市', '12654887456', '325487415@qq.com', '可以！！');
INSERT INTO `t_supplier` VALUES ('10', 'GYS20181009094455', '婉婷', '茂宏有限公司', '岳阳', '☆☆☆', '湖南省岳阳市', '125478521487', '325487415@qq.com', '质量不错！');
INSERT INTO `t_supplier` VALUES ('11', 'GYS20181009094456', '幽兰', '盈信有限公司', '衡阳', '☆☆☆', '湖南省衡阳市', '14895475845', '325487415@qq.com', '好评');
INSERT INTO `t_supplier` VALUES ('12', 'GYS20181009094457', '凌薇', '宝佳有限公司', '长沙', '☆', '湖南省长沙市', '13214587954', '325487415@qq.com', '差评');
INSERT INTO `t_supplier` VALUES ('13', 'GYS20181009094458', '晴霎', '东恒有限公司', '株洲', '☆☆☆☆', '湖南省株洲市', '12654887456', '325487415@qq.com', '阿尔山噶');
INSERT INTO `t_supplier` VALUES ('14', 'GYS20181009094425', '佑怡', '中久有限公司', '祁东', '☆☆☆', '湖南省祁东县', '12654887456', '325487415@qq.com', '阿瑟尴尬');
INSERT INTO `t_supplier` VALUES ('15', 'GYS20181009094655', '夏岚', '多德有限公司', '岳阳', '☆☆☆☆', '湖南省岳阳市', '16164522654', '325487415@qq.com', '噶围观');
INSERT INTO `t_supplier` VALUES ('16', 'GYS20181009094855', '璟雯', '百耀有限公司', '岳阳', '☆', '湖南省岳阳市', '12654887456', '325487415@qq.com', '哥嘎嘎嘎');
INSERT INTO `t_supplier` VALUES ('17', 'GYS20181009091455', '雨薇', '欣茂有限公司', '长沙', '☆☆☆', '湖南省长沙市', '12654887456', '325487415@qq.com', '暗室逢灯告诉大哥');
INSERT INTO `t_supplier` VALUES ('18', 'GYS20181009094245', '韵寒', '凯源有限公司', '长沙', '☆☆', '湖南省长沙市', '12654887456', '325487415@qq.com', '查收');
INSERT INTO `t_supplier` VALUES ('19', 'GYS20181009092145', '钰彤', '台盈有限公司', '衡阳', '☆☆☆☆', '湖南省衡阳市', '12654887456', '325487415@qq.com', '786');
INSERT INTO `t_supplier` VALUES ('23', 'GYS20181114065948', '蒙牛', '蒙牛有限公司', '内蒙古', '☆☆☆☆☆', '内蒙古呼和浩特市和林格尔盛乐经济园区', '400-6603333', '2011542514@qq.com', '质量好，味道好，推荐！！！');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `trueName` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '123', '小唐', '2911729767@qq.com', '15200565360', '1');
INSERT INTO `t_user` VALUES ('2', 'java', '123', '小红', '356984523@qq.com', '15265447853', '2');
INSERT INTO `t_user` VALUES ('4', '小明', '123', '将晓月', '526548742@163.com', '13548547863', '3');
INSERT INTO `t_user` VALUES ('5', '小红', '123', '刘红丽', '236541547@qq.com', '12547442587', '4');

-- ----------------------------
-- Table structure for `t_warehouse`
-- ----------------------------
DROP TABLE IF EXISTS `t_warehouse`;
CREATE TABLE `t_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `num` int(32) DEFAULT NULL,
  `state` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_warehouse
-- ----------------------------
INSERT INTO `t_warehouse` VALUES ('1', 'CK1001', '10000', '0');
INSERT INTO `t_warehouse` VALUES ('2', 'CK1002', '2000', '1');
INSERT INTO `t_warehouse` VALUES ('3', 'CK1003', '1000', '1');
INSERT INTO `t_warehouse` VALUES ('4', 'CK1004', '3000', '1');
INSERT INTO `t_warehouse` VALUES ('5', 'CK1005', '5000', '2');
INSERT INTO `t_warehouse` VALUES ('6', 'CK1006', '9000', '1');
INSERT INTO `t_warehouse` VALUES ('7', 'CK1007', '10000', '1');
INSERT INTO `t_warehouse` VALUES ('8', 'CK1008', '4000', '1');
INSERT INTO `t_warehouse` VALUES ('9', 'CK1009', '8000', '1');
