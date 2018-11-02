/*
Navicat MySQL Data Transfer

Source Server         : lh
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-10-20 19:12:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` varchar(255) NOT NULL,
  `book_name` varchar(20) ,
  `book_class_name` varchar(20) ,
  `book_author` varchar(20) DEFAULT NULL,
  `book_price` float ,
  `book_discount` float ,
  `book_description` varchar(255) DEFAULT NULL,
  `book_image` varchar(255) DEFAULT NULL,
  `book_isbn` varchar(17) ,
  `book_press` varchar(50) DEFAULT NULL,
  `booktype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4od1wqphgtj3l6956c6xxkl2t` (`booktype_id`),
  CONSTRAINT `FK4od1wqphgtj3l6956c6xxkl2t` FOREIGN KEY (`booktype_id`) REFERENCES `booktype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('4028abf4669084c101669084c71c0000', '软件项目管理与案例分析', '项目管理', 'pasf', '29', '20', '管理', 'img/book.jpg', '978-7-3021-3052-5', '清华大学出版社', '1');
INSERT INTO `books` VALUES ('4028abf4669084c101669084c7540001', '概率论与数理统计', '概率论', '阳平华', '29', '20', '数学', 'img/book.jpg', '978-7-5165-1661-4', '航空工业出版社', '1');
INSERT INTO `books` VALUES ('4028abf4669084c101669084c76c0002', 'JavaEE框架应用开发', 'javaEE', 'QST青软', '90', '0.9', 'ssh', 'img/book.jpg', '123-4-5678-9123-4', '清华大学出版社', '1');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '软件工程', '2016', '计算机工程学院');

-- ----------------------------
-- Table structure for mangers
-- ----------------------------
DROP TABLE IF EXISTS `mangers`;
CREATE TABLE `mangers` (
  `id` varchar(255) NOT NULL,
  `man_name` varchar(10) ,
  `man_password` varchar(32) ,
  `man_workNumber` varchar(8) ,
  `man_permission` int(11) ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mangers
-- ----------------------------
INSERT INTO `mangers` VALUES ('4028abf4669084c101669084c7850003', 'axc', 'E10ADC3949BA59ABBE56E057F20F883E', '20181001', '1');
INSERT INTO `mangers` VALUES ('4028abf4669084c101669084c79e0004', 'sdf', 'E10ADC3949BA59ABBE56E057F20F883E', '20181006', '2');

-- ----------------------------
-- Table structure for orderitems
-- ----------------------------
DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE `orderitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) DEFAULT NULL,
  `book_id` varchar(255) DEFAULT NULL,
  `quantity` int(11) ,
  `purchase_price` float ,
  PRIMARY KEY (`id`),
  KEY `FK90td7v08r46nlwukfklfeaygq` (`order_id`),
  KEY `FK4goudlxr1jdchk0pivxaggtrw` (`book_id`),
  CONSTRAINT `FK4goudlxr1jdchk0pivxaggtrw` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FK90td7v08r46nlwukfklfeaygq` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitems
-- ----------------------------
INSERT INTO `orderitems` VALUES ('1', '4028abf4669084c101669085294f0005', '4028abf4669084c101669084c71c0000', '1', '20');
INSERT INTO `orderitems` VALUES ('2', '4028abf4669084c101669085294f0005', '4028abf4669084c101669084c7540001', '2', '0.9');
INSERT INTO `orderitems` VALUES ('3', '4028abf4669084c101669085294f0005', '4028abf4669084c101669084c76c0002', '2', '20');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(255) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `order_no` varchar(15) ,
  `price` float ,
  `pay` bit(1) ,
  `order_time` datetime ,
  PRIMARY KEY (`id`),
  KEY `FKeudclkhb1qymuoqf76gg10i3t` (`student_id`),
  CONSTRAINT `FKeudclkhb1qymuoqf76gg10i3t` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('4028abf4669084c101669085294f0005', '234', '111810207927512', '61.8', '\0', '2018-10-20 16:08:57');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(12) ,
  `stu_name` varchar(10) ,
  `stu_college` varchar(15) ,
  `stu_grade` varchar(4) ,
  `stu_major` varchar(10) ,
  `stu_class` varchar(10) ,
  `stu_pwd` varchar(32) ,
  `permission` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('1', '2016100980', '0', '计算机工程学院', '2016', '软件工程', '5', '56D298AA8F02B36879D4FE7EC57E63B1', null);
INSERT INTO `students` VALUES ('2', '2016100981', '1', '计算机工程学院', '2016', '软件工程', '5', '4F07C2A1C81D1065FEF7AC5DCBF981A4', null);
INSERT INTO `students` VALUES ('3', '2016100982', '2', '计算机工程学院', '2016', '软件工程', '5', '74B23A8B198982EB7005F266A9F14B51', null);
INSERT INTO `students` VALUES ('4', '2016100983', '3', '计算机工程学院', '2016', '软件工程', '5', '72DD082471D2CEE9AA65A0B3CF1D0E9F', null);
INSERT INTO `students` VALUES ('5', '2016100984', '4', '计算机工程学院', '2016', '软件工程', '5', '7D0F8E2343DD003B21DEC4F03041C77A', null);
INSERT INTO `students` VALUES ('6', '2016100985', '5', '计算机工程学院', '2016', '软件工程', '5', '25D899528F0DA692AE81006EC1681BD5', null);
INSERT INTO `students` VALUES ('7', '2016100986', '6', '计算机工程学院', '2016', '软件工程', '5', '7F50487D8E183FEC58D854C6941A219C', null);
INSERT INTO `students` VALUES ('8', '2016100987', '7', '计算机工程学院', '2016', '软件工程', '5', '374EF1E267A51C85CC4512311C17078A', null);
INSERT INTO `students` VALUES ('9', '2016100988', '8', '计算机工程学院', '2016', '软件工程', '5', 'C64772E960030625955E0A0C87F581E4', null);
INSERT INTO `students` VALUES ('10', '2016100989', '9', '计算机工程学院', '2016', '软件工程', '5', 'A5D7D2CA9BAA47426DFD2C03B10841E7', null);
INSERT INTO `students` VALUES ('11', '20161009810', '10', '计算机工程学院', '2016', '软件工程', '5', '5D94BDEF580168C97F1C6D9356A07E57', null);
INSERT INTO `students` VALUES ('12', '20161009811', '11', '计算机工程学院', '2016', '软件工程', '5', 'D7E8C392CE320284BAA45D372A39B933', null);
INSERT INTO `students` VALUES ('13', '20161009812', '12', '计算机工程学院', '2016', '软件工程', '5', 'DB4FCE94B6EBADADE7935FE9909E1908', null);
INSERT INTO `students` VALUES ('14', '20161009813', '13', '计算机工程学院', '2016', '软件工程', '5', 'CDD044B5B38051E089351A2944535526', null);
INSERT INTO `students` VALUES ('15', '20161009814', '14', '计算机工程学院', '2016', '软件工程', '5', '21C265DC13B8B864C4BD9D7DD8200D0C', null);
INSERT INTO `students` VALUES ('16', '20161009815', '15', '计算机工程学院', '2016', '软件工程', '5', '776207A8B1D60E87F3BB892A0FB0837E', null);
INSERT INTO `students` VALUES ('17', '20161009816', '16', '计算机工程学院', '2016', '软件工程', '5', '19003461531A0B3A7D5F982CA4F3A840', '1');
INSERT INTO `students` VALUES ('18', '20161009817', '17', '计算机工程学院', '2016', '软件工程', '5', '387A4B3BFE9DBA8AFC985F30DC48DE00', null);
INSERT INTO `students` VALUES ('19', '20161009818', '18', '计算机工程学院', '2016', '软件工程', '5', '147604E66B3A6E1E2AA5C9AD3A6CB0DA', null);
INSERT INTO `students` VALUES ('20', '20161009819', '19', '计算机工程学院', '2016', '软件工程', '5', '1440F6EAC7FAB5DA6AD51FF6A7931632', null);
INSERT INTO `students` VALUES ('21', '20161009820', '20', '计算机工程学院', '2016', '软件工程', '5', '3FBCD9CBD0385E74F28BEE7FB7828BF4', null);
INSERT INTO `students` VALUES ('22', '20161009821', '21', '计算机工程学院', '2016', '软件工程', '5', '992D54CCBBAD7CDF416EA2C5AC6ECCD2', null);
INSERT INTO `students` VALUES ('23', '20161009822', '22', '计算机工程学院', '2016', '软件工程', '5', '2E5D5F50563A9EA8193E44797804C9D6', null);
INSERT INTO `students` VALUES ('24', '20161009823', '23', '计算机工程学院', '2016', '软件工程', '5', 'EA6E99B83752C779DCBDF06DF0AAE42E', null);
INSERT INTO `students` VALUES ('25', '20161009824', '24', '计算机工程学院', '2016', '软件工程', '5', '0A0766A6B72073AF3C9E8F3B42A5931D', null);
INSERT INTO `students` VALUES ('26', '20161009825', '25', '计算机工程学院', '2016', '软件工程', '5', '927FBEA17E745A46408ED4131DB6F0E6', null);
INSERT INTO `students` VALUES ('27', '20161009826', '26', '计算机工程学院', '2016', '软件工程', '5', '7F5707C487C1252821C869049D6E0D29', null);
INSERT INTO `students` VALUES ('28', '20161009827', '27', '计算机工程学院', '2016', '软件工程', '5', '7088F37C3F264EA00AC498DA0FAEB1B9', null);
INSERT INTO `students` VALUES ('29', '20161009828', '28', '计算机工程学院', '2016', '软件工程', '5', 'A46A2E1798290E648C9A1DBA32488E9C', null);
INSERT INTO `students` VALUES ('30', '20161009829', '29', '计算机工程学院', '2016', '软件工程', '5', '4EA3630815EC30899AA1162E568ACBE1', null);
INSERT INTO `students` VALUES ('31', '20161009830', '30', '计算机工程学院', '2016', '软件工程', '5', '403B21DD49E6EA47F4860D4F7C10B5EF', null);
INSERT INTO `students` VALUES ('32', '20161009831', '31', '计算机工程学院', '2016', '软件工程', '5', '10F1DCB0C17EEDCD252CA6E04313D71C', null);
INSERT INTO `students` VALUES ('33', '20161009832', '32', '计算机工程学院', '2016', '软件工程', '5', 'A9F0EAC3AD5831D552DA10FE7729835F', null);
INSERT INTO `students` VALUES ('34', '20161009833', '33', '计算机工程学院', '2016', '软件工程', '5', 'C90E98D95C598771CF672EC0E3FCABB2', null);
INSERT INTO `students` VALUES ('35', '20161009834', '34', '计算机工程学院', '2016', '软件工程', '5', 'E126857B8BCAE9125C55977809B4EB65', null);
INSERT INTO `students` VALUES ('36', '20161009835', '35', '计算机工程学院', '2016', '软件工程', '5', '01E52F6DA11567F02B0FA93618765695', null);
INSERT INTO `students` VALUES ('37', '20161009836', '36', '计算机工程学院', '2016', '软件工程', '5', 'DE53EE014EB1DC1FA41BCC9563E97707', null);
INSERT INTO `students` VALUES ('38', '20161009837', '37', '计算机工程学院', '2016', '软件工程', '5', 'CCF9E4C52D15D946592FEC48AAA176D3', null);
INSERT INTO `students` VALUES ('39', '20161009838', '38', '计算机工程学院', '2016', '软件工程', '5', 'CD9731125688E78AC9EFBF42B4F73936', null);
INSERT INTO `students` VALUES ('40', '20161009839', '39', '计算机工程学院', '2016', '软件工程', '5', 'E8E8738A5FB79C67401C73DDE96EF8D7', null);
INSERT INTO `students` VALUES ('41', '20161009840', '40', '计算机工程学院', '2016', '软件工程', '5', '11FE976688C0B4FAE303EFAF88C1BFE2', null);
INSERT INTO `students` VALUES ('42', '20161009841', '41', '计算机工程学院', '2016', '软件工程', '5', 'E746766F0B8FF1CADC41D5747A5AAA7D', null);
INSERT INTO `students` VALUES ('43', '20161009842', '42', '计算机工程学院', '2016', '软件工程', '5', 'CD13464D321C25015CCBE504BDF1760C', null);
INSERT INTO `students` VALUES ('44', '20161009843', '43', '计算机工程学院', '2016', '软件工程', '5', 'E11B73B10F67B814F0B256149CB43082', '1');
INSERT INTO `students` VALUES ('45', '20161009844', '44', '计算机工程学院', '2016', '软件工程', '5', '0B7EB575B7F190D864FAB67C44D47F17', null);
INSERT INTO `students` VALUES ('46', '20161009845', '45', '计算机工程学院', '2016', '软件工程', '5', '74D7069711DB685EE91D998799143EF0', null);
INSERT INTO `students` VALUES ('47', '20161009846', '46', '计算机工程学院', '2016', '软件工程', '5', '48ECE9D273017582C6244AA75B4DE957', null);
INSERT INTO `students` VALUES ('48', '20161009847', '47', '计算机工程学院', '2016', '软件工程', '5', 'B6D39C18D8364A113B58EDA041500764', '1');
INSERT INTO `students` VALUES ('49', '20161009848', '48', '计算机工程学院', '2016', '软件工程', '5', '2D11D4FFCFEB1F05868BC7F7BB49FA51', null);
INSERT INTO `students` VALUES ('50', '20161009849', '49', '计算机工程学院', '2016', '软件工程', '5', '79A21E8E06BDD5175B17805954358C41', '1');
INSERT INTO `students` VALUES ('51', '20161009850', '50', '计算机工程学院', '2016', '软件工程', '5', 'D736F1AE70F8DEFD6B08F7959A1E84FF', null);
INSERT INTO `students` VALUES ('52', '20161009851', '51', '计算机工程学院', '2016', '软件工程', '5', '5E12CFA2C972C16BFE82E9C477D103A7', '1');
INSERT INTO `students` VALUES ('53', '20161009852', '52', '计算机工程学院', '2016', '软件工程', '5', 'A01718CFEE01B2FE44B44B3A3D3B92FA', null);
INSERT INTO `students` VALUES ('54', '20161009853', '53', '计算机工程学院', '2016', '软件工程', '5', '3D716619DB4E4892134270318D0EBE62', null);
INSERT INTO `students` VALUES ('55', '20161009854', '54', '计算机工程学院', '2016', '软件工程', '5', '13554E4B1773663EA9FB468A530AB194', null);
INSERT INTO `students` VALUES ('56', '20161009855', '55', '计算机工程学院', '2016', '软件工程', '5', 'A26841FEE7FBFB676FAEB53B686D3F7D', null);
INSERT INTO `students` VALUES ('57', '20161009856', '56', '计算机工程学院', '2016', '软件工程', '5', 'FAF3B1C476226755AA84D3AC773D8DF4', null);
INSERT INTO `students` VALUES ('58', '20161009857', '57', '计算机工程学院', '2016', '软件工程', '5', '9F6FE61A7FB3A14609D60E1EAD3E495E', '1');
INSERT INTO `students` VALUES ('59', '20161009858', '58', '计算机工程学院', '2016', '软件工程', '5', '83D103D2B961A7285373D104659F79C2', null);
INSERT INTO `students` VALUES ('60', '20161009859', '59', '计算机工程学院', '2016', '软件工程', '5', '682347BF07E1A318B294567200560372', null);
INSERT INTO `students` VALUES ('61', '20161009860', '60', '计算机工程学院', '2016', '软件工程', '5', 'B9D134F05FBC9C68F5793515A6811797', null);
INSERT INTO `students` VALUES ('62', '20161009861', '61', '计算机工程学院', '2016', '软件工程', '5', '96324EFA568ABFFE32FB9B6A6C272ADA', null);
INSERT INTO `students` VALUES ('63', '20161009862', '62', '计算机工程学院', '2016', '软件工程', '5', '6AB917C94B8D512C39B7306655C66E03', null);
INSERT INTO `students` VALUES ('64', '20161009863', '63', '计算机工程学院', '2016', '软件工程', '5', '6FECDA6DF04BCBD3F60CC7B243DE6FAE', null);
INSERT INTO `students` VALUES ('65', '20161009864', '64', '计算机工程学院', '2016', '软件工程', '5', '40B415F6EA5748932EDE63B45ECB2DDB', null);
INSERT INTO `students` VALUES ('66', '20161009865', '65', '计算机工程学院', '2016', '软件工程', '5', 'B2D5500AD615BDDA00D1E0A37CC5138A', null);
INSERT INTO `students` VALUES ('67', '20161009866', '66', '计算机工程学院', '2016', '软件工程', '5', '893D284E0BF91292D17448F750EF2C85', null);
INSERT INTO `students` VALUES ('68', '20161009867', '67', '计算机工程学院', '2016', '软件工程', '5', 'A7A9B7B0CB6CBF2885D5ABE5BEA72945', null);
INSERT INTO `students` VALUES ('69', '20161009868', '68', '计算机工程学院', '2016', '软件工程', '5', '34547AE492DD3953424F53F89233E6B2', null);
INSERT INTO `students` VALUES ('70', '20161009869', '69', '计算机工程学院', '2016', '软件工程', '5', 'A0893A803D0775F048E8143BEF7345B0', null);
INSERT INTO `students` VALUES ('71', '20161009870', '70', '计算机工程学院', '2016', '软件工程', '5', '0E7CE19C6047728F109BBCDAFE200581', null);
INSERT INTO `students` VALUES ('72', '20161009871', '71', '计算机工程学院', '2016', '软件工程', '5', 'D90EA09F51CA3CC4BAB4F3CE0B01C1D8', null);
INSERT INTO `students` VALUES ('73', '20161009872', '72', '计算机工程学院', '2016', '软件工程', '5', 'DDE9E389DAC88B3D6FCA18C97495BFE5', null);
INSERT INTO `students` VALUES ('74', '20161009873', '73', '计算机工程学院', '2016', '软件工程', '5', '9FBF2D78FAD3607176B8527C3FDE81A7', null);
INSERT INTO `students` VALUES ('75', '20161009874', '74', '计算机工程学院', '2016', '软件工程', '5', 'F474DD071F4B861DF872DECF7504E827', null);
INSERT INTO `students` VALUES ('76', '20161009875', '75', '计算机工程学院', '2016', '软件工程', '5', '22029AC6A7211F5375270DF857A32ADE', null);
INSERT INTO `students` VALUES ('77', '20161009876', '76', '计算机工程学院', '2016', '软件工程', '5', 'FA123DE88E28B5D0F2A37C1E29B02959', null);
INSERT INTO `students` VALUES ('78', '20161009877', '77', '计算机工程学院', '2016', '软件工程', '5', 'ECBA512B7CA0100050C356210BF947F9', null);
INSERT INTO `students` VALUES ('79', '20161009878', '78', '计算机工程学院', '2016', '软件工程', '5', '6B3254EDD72459C94425545C25123FEA', null);
INSERT INTO `students` VALUES ('80', '20161009879', '79', '计算机工程学院', '2016', '软件工程', '5', '23F38C2833AB3142D8186BE7E87943CD', null);
INSERT INTO `students` VALUES ('81', '20161009880', '80', '计算机工程学院', '2016', '软件工程', '5', '2E67467760F1CE32C97E9DA201830F14', null);
INSERT INTO `students` VALUES ('82', '20161009881', '81', '计算机工程学院', '2016', '软件工程', '5', '8BD5FD127030FAD11CE6076CB1108479', null);
INSERT INTO `students` VALUES ('83', '20161009882', '82', '计算机工程学院', '2016', '软件工程', '5', 'DCC2C5A29E3373C9B58EADE287B5F324', null);
INSERT INTO `students` VALUES ('84', '20161009883', '83', '计算机工程学院', '2016', '软件工程', '5', 'E2A64DF227F2278DF9650A670D11384E', null);
INSERT INTO `students` VALUES ('85', '20161009884', '84', '计算机工程学院', '2016', '软件工程', '5', '6B3D18C19C2402C2DFAB83D621275612', null);
INSERT INTO `students` VALUES ('86', '20161009885', '85', '计算机工程学院', '2016', '软件工程', '5', '3EDE235C8758875F8B4630F6B2ED4E0A', null);
INSERT INTO `students` VALUES ('87', '20161009886', '86', '计算机工程学院', '2016', '软件工程', '5', 'CE7A957B349D23F4EED388322B8362FD', null);
INSERT INTO `students` VALUES ('88', '20161009887', '87', '计算机工程学院', '2016', '软件工程', '5', '33578D4DE2EF83F0531EDC6E63A4B652', '1');
INSERT INTO `students` VALUES ('89', '20161009888', '88', '计算机工程学院', '2016', '软件工程', '5', '0BC709ABB5D41B1BDDDE6D0CE4D1DF8D', null);
INSERT INTO `students` VALUES ('90', '20161009889', '89', '计算机工程学院', '2016', '软件工程', '5', '122614831A2D3751F8A9AC32F46EA918', null);
INSERT INTO `students` VALUES ('91', '20161009890', '90', '计算机工程学院', '2016', '软件工程', '5', 'A854AA9FBC61766B0FF4AB3C9D203458', null);
INSERT INTO `students` VALUES ('92', '20161009891', '91', '计算机工程学院', '2016', '软件工程', '5', 'EB6EBD6532B581D57A89374823952A4A', null);
INSERT INTO `students` VALUES ('93', '20161009892', '92', '计算机工程学院', '2016', '软件工程', '5', '97B11AFE764C9E1BA1021FB1AE8F1D97', null);
INSERT INTO `students` VALUES ('94', '20161009893', '93', '计算机工程学院', '2016', '软件工程', '5', 'BF5364F34DFDE8EF449780E8F592360A', null);
INSERT INTO `students` VALUES ('95', '20161009894', '94', '计算机工程学院', '2016', '软件工程', '5', '478C2FB5D9C984EAF7968913DFA03307', null);
INSERT INTO `students` VALUES ('96', '20161009895', '95', '计算机工程学院', '2016', '软件工程', '5', 'C5F000D434FCFA3AA010D906ACDFCF30', null);
INSERT INTO `students` VALUES ('97', '20161009896', '96', '计算机工程学院', '2016', '软件工程', '5', '491E4A535A71563DC6CB06718784513D', null);
INSERT INTO `students` VALUES ('98', '20161009897', '97', '计算机工程学院', '2016', '软件工程', '5', 'B99A7F224225EA1AA8A0C99C5D1792A6', null);
INSERT INTO `students` VALUES ('99', '20161009898', '98', '计算机工程学院', '2016', '软件工程', '5', 'F0E8580D401481CCE10A2945FABF2DD6', null);
INSERT INTO `students` VALUES ('100', '20161009899', '99', '计算机工程学院', '2016', '软件工程', '5', '633F802E69E7172FAE035518A5B0A201', '1');
INSERT INTO `students` VALUES ('101', '201610098100', '100', '计算机工程学院', '2016', '软件工程', '5', 'AC288C4D4FF3CF7C3AD3515A82687A43', '1');
INSERT INTO `students` VALUES ('102', '201610098101', '101', '计算机工程学院', '2016', '软件工程', '5', '52E716BD1130FAEAFF2E6CF721A0EE28', null);
INSERT INTO `students` VALUES ('103', '201610098102', '102', '计算机工程学院', '2016', '软件工程', '5', '5CB60CDEAE23F8B15731F9139D077B29', null);
INSERT INTO `students` VALUES ('104', '201610098103', '103', '计算机工程学院', '2016', '软件工程', '5', 'AD6D6FD2D93F51A6202734F518051F76', null);
INSERT INTO `students` VALUES ('105', '201610098104', '104', '计算机工程学院', '2016', '软件工程', '5', 'A7D4E80EFDEB9F61B79DA31DD8870DF7', null);
INSERT INTO `students` VALUES ('106', '201610098105', '105', '计算机工程学院', '2016', '软件工程', '5', 'EDD8EFEC722723B279431F3647033297', null);
INSERT INTO `students` VALUES ('107', '201610098106', '106', '计算机工程学院', '2016', '软件工程', '5', 'DFFF25CD033AD3671162461C91F61F60', null);
INSERT INTO `students` VALUES ('108', '201610098107', '107', '计算机工程学院', '2016', '软件工程', '5', '5C2BCAE3D5A907E1D62C25CE1AD59D40', null);
INSERT INTO `students` VALUES ('109', '201610098108', '108', '计算机工程学院', '2016', '软件工程', '5', 'E1A2A4EEC680C603D1900779DBE69431', null);
INSERT INTO `students` VALUES ('110', '201610098109', '109', '计算机工程学院', '2016', '软件工程', '5', 'EFD99F44CCD3DBF91D9DC942B39F5C5E', null);
INSERT INTO `students` VALUES ('111', '201610098110', '110', '计算机工程学院', '2016', '软件工程', '5', '7D8A3AA591D8F7332EF9DF328BF9A53F', '1');
INSERT INTO `students` VALUES ('112', '201610098111', '111', '计算机工程学院', '2016', '软件工程', '5', '631FE61FC5C9FBABD559143B3FC50205', null);
INSERT INTO `students` VALUES ('113', '201610098112', '112', '计算机工程学院', '2016', '软件工程', '5', '2D8569109612EB55949857365E8C54F9', null);
INSERT INTO `students` VALUES ('114', '201610098113', '113', '计算机工程学院', '2016', '软件工程', '5', 'A38ABE612D60AE6C88D7404F4DABC122', null);
INSERT INTO `students` VALUES ('115', '201610098114', '114', '计算机工程学院', '2016', '软件工程', '5', '3191A0600E29853416423383DC8D05BA', null);
INSERT INTO `students` VALUES ('116', '201610098115', '115', '计算机工程学院', '2016', '软件工程', '5', 'E2BC9FFF4954D1D2559923CFCE7B8D26', null);
INSERT INTO `students` VALUES ('117', '201610098116', '116', '计算机工程学院', '2016', '软件工程', '5', 'AFE24924E85A9593CAF703EF1F0FF852', null);
INSERT INTO `students` VALUES ('118', '201610098117', '117', '计算机工程学院', '2016', '软件工程', '5', '7A24C165844A2E853D9BCA88F8CF8E64', null);
INSERT INTO `students` VALUES ('119', '201610098118', '118', '计算机工程学院', '2016', '软件工程', '5', 'DC0B845AF064037CB502E1FDEACEC4D7', null);
INSERT INTO `students` VALUES ('120', '201610098119', '119', '计算机工程学院', '2016', '软件工程', '5', 'A41DB30367609AA6A41F948F8E829A01', '1');
INSERT INTO `students` VALUES ('121', '201610098120', '120', '计算机工程学院', '2016', '软件工程', '5', '7C3589282C8D857BDE651876F9313454', null);
INSERT INTO `students` VALUES ('122', '201610098121', '121', '计算机工程学院', '2016', '软件工程', '5', '7FCCC89F58A88E57BBD694C6A9E05BA0', null);
INSERT INTO `students` VALUES ('123', '201610098122', '122', '计算机工程学院', '2016', '软件工程', '5', '8249ED669DE39931C0F005C5D4E7A2E0', null);
INSERT INTO `students` VALUES ('124', '201610098123', '123', '计算机工程学院', '2016', '软件工程', '5', '591F566FC0402D8885138BFDF3EAE773', null);
INSERT INTO `students` VALUES ('125', '201610098124', '124', '计算机工程学院', '2016', '软件工程', '5', '7261FDF75D3569817989EFDDD0BAF7E9', null);
INSERT INTO `students` VALUES ('126', '201610098125', '125', '计算机工程学院', '2016', '软件工程', '5', 'F3D17BAF2D98A9C1A0926117ED6AE8E6', null);
INSERT INTO `students` VALUES ('127', '201610098126', '126', '计算机工程学院', '2016', '软件工程', '5', 'F7903FE24AC35C62C120AEE30C9F2906', null);
INSERT INTO `students` VALUES ('128', '201610098127', '127', '计算机工程学院', '2016', '软件工程', '5', '12216C6A9EC80DD281811FA0BCE3EC00', null);
INSERT INTO `students` VALUES ('129', '201610098128', '128', '计算机工程学院', '2016', '软件工程', '5', '69F89687AE89385A7FE68B91A7034BA2', null);
INSERT INTO `students` VALUES ('130', '201610098129', '129', '计算机工程学院', '2016', '软件工程', '5', 'A0503FE303A521B80A8869B54602209F', null);
INSERT INTO `students` VALUES ('131', '201610098130', '130', '计算机工程学院', '2016', '软件工程', '5', '956AA17A6BC9B016D523B4502CC1CEC6', '1');
INSERT INTO `students` VALUES ('132', '201610098131', '131', '计算机工程学院', '2016', '软件工程', '5', 'E0DF12593AE6201CF0137F6A9EFF8C6B', null);
INSERT INTO `students` VALUES ('133', '201610098132', '132', '计算机工程学院', '2016', '软件工程', '5', '93D0841196B26DD0FAE9C01708452FF6', null);
INSERT INTO `students` VALUES ('134', '201610098133', '133', '计算机工程学院', '2016', '软件工程', '5', '872D0E75A3EC19C21F16EB1E09D6B8F2', null);
INSERT INTO `students` VALUES ('135', '201610098134', '134', '计算机工程学院', '2016', '软件工程', '5', '74DE6142128381584A17FF85000FEC66', null);
INSERT INTO `students` VALUES ('136', '201610098135', '135', '计算机工程学院', '2016', '软件工程', '5', '62EB8205F60C559D099E16345E15DFC5', null);
INSERT INTO `students` VALUES ('137', '201610098136', '136', '计算机工程学院', '2016', '软件工程', '5', 'A763FBB782D841DD433EEF49F5C81607', null);
INSERT INTO `students` VALUES ('138', '201610098137', '137', '计算机工程学院', '2016', '软件工程', '5', '5608DA7E0B29630A6A6469F941CA62A5', null);
INSERT INTO `students` VALUES ('139', '201610098138', '138', '计算机工程学院', '2016', '软件工程', '5', '8D1DC7992FF35D6E7230C2E1CDEC156F', null);
INSERT INTO `students` VALUES ('140', '201610098139', '139', '计算机工程学院', '2016', '软件工程', '5', 'F24B88C1B3617A58325725D36665D7C9', '1');
INSERT INTO `students` VALUES ('141', '201610098140', '140', '计算机工程学院', '2016', '软件工程', '5', '62D19378D5030D6705697640DEEBA3B4', null);
INSERT INTO `students` VALUES ('142', '201610098141', '141', '计算机工程学院', '2016', '软件工程', '5', '80EE4F40940399C117F2138505192A66', null);
INSERT INTO `students` VALUES ('143', '201610098142', '142', '计算机工程学院', '2016', '软件工程', '5', '1CFD1EA104414E8B36AD1F06EEE0870F', null);
INSERT INTO `students` VALUES ('144', '201610098143', '143', '计算机工程学院', '2016', '软件工程', '5', '366240CA0159C9AC40378769992196E4', null);
INSERT INTO `students` VALUES ('145', '201610098144', '144', '计算机工程学院', '2016', '软件工程', '5', 'AE013FB54E6047F6BC2949F7AC2AD00F', null);
INSERT INTO `students` VALUES ('146', '201610098145', '145', '计算机工程学院', '2016', '软件工程', '5', '6119B48C0C87C89ACF472D41817C2D32', null);
INSERT INTO `students` VALUES ('147', '201610098146', '146', '计算机工程学院', '2016', '软件工程', '5', 'D8C4B8281D4ED4C1B5E36776F394C786', '1');
INSERT INTO `students` VALUES ('148', '201610098147', '147', '计算机工程学院', '2016', '软件工程', '5', 'C7C0AC85979D7CB1BD3618D22AAF0242', null);
INSERT INTO `students` VALUES ('149', '201610098148', '148', '计算机工程学院', '2016', '软件工程', '5', '9474F7585114F3640909BBF94A279661', null);
INSERT INTO `students` VALUES ('150', '201610098149', '149', '计算机工程学院', '2016', '软件工程', '5', 'E755B2C65B38B0D27AF865F9947FEE06', null);
INSERT INTO `students` VALUES ('151', '201610098150', '150', '计算机工程学院', '2016', '软件工程', '5', '7F8F18C558D81AB6057D1988706A01C3', null);
INSERT INTO `students` VALUES ('152', '201610098151', '151', '计算机工程学院', '2016', '软件工程', '5', '45E159A1BF81B541B20D339419281BB5', null);
INSERT INTO `students` VALUES ('153', '201610098152', '152', '计算机工程学院', '2016', '软件工程', '5', '35D9ACC856A6D3CA4F3BB8847B96BE0D', null);
INSERT INTO `students` VALUES ('154', '201610098153', '153', '计算机工程学院', '2016', '软件工程', '5', 'CAAD6CE521ED8445854B21042F5BA022', null);
INSERT INTO `students` VALUES ('155', '201610098154', '154', '计算机工程学院', '2016', '软件工程', '5', '9A63B7975E804752B0575694AC9FF76A', null);
INSERT INTO `students` VALUES ('156', '201610098155', '155', '计算机工程学院', '2016', '软件工程', '5', '1740892C727E27EF360D45F64F06B858', null);
INSERT INTO `students` VALUES ('157', '201610098156', '156', '计算机工程学院', '2016', '软件工程', '5', 'ED3A652B7290ED0D2F3DAE0E0D321702', '1');
INSERT INTO `students` VALUES ('158', '201610098157', '157', '计算机工程学院', '2016', '软件工程', '5', 'DDBE2A7D73E20D7830FD6A5C2DE7A62C', null);
INSERT INTO `students` VALUES ('159', '201610098158', '158', '计算机工程学院', '2016', '软件工程', '5', '82E7F88E875671889721126CCF18855D', null);
INSERT INTO `students` VALUES ('160', '201610098159', '159', '计算机工程学院', '2016', '软件工程', '5', '6D3FE1AF58653A1F51B475FD45773B2C', null);
INSERT INTO `students` VALUES ('161', '201610098160', '160', '计算机工程学院', '2016', '软件工程', '5', '580C2B9A47622FABCE1C0057AA641F06', null);
INSERT INTO `students` VALUES ('162', '201610098161', '161', '计算机工程学院', '2016', '软件工程', '5', 'FA9FB60A69913CE3821EACAE2D8DD9B8', null);
INSERT INTO `students` VALUES ('163', '201610098162', '162', '计算机工程学院', '2016', '软件工程', '5', '9680BF7EAC92D7DE45C55E8B958B7E6F', null);
INSERT INTO `students` VALUES ('164', '201610098163', '163', '计算机工程学院', '2016', '软件工程', '5', '9FEC521977CD27F7E50F0330A2640F09', null);
INSERT INTO `students` VALUES ('165', '201610098164', '164', '计算机工程学院', '2016', '软件工程', '5', '5434B2AF2547ECA5A53B1056806CB968', null);
INSERT INTO `students` VALUES ('166', '201610098165', '165', '计算机工程学院', '2016', '软件工程', '5', '31A67060AC93F6069DD6E33F6AF559A8', '1');
INSERT INTO `students` VALUES ('167', '201610098166', '166', '计算机工程学院', '2016', '软件工程', '5', '9D4BAFE68694777CE158593918B5FBD2', null);
INSERT INTO `students` VALUES ('168', '201610098167', '167', '计算机工程学院', '2016', '软件工程', '5', 'F2229F6AD7BE91DD3CE02BB8B07959CB', null);
INSERT INTO `students` VALUES ('169', '201610098168', '168', '计算机工程学院', '2016', '软件工程', '5', '7E0AABCEC995183FB903EBA97306F21E', null);
INSERT INTO `students` VALUES ('170', '201610098169', '169', '计算机工程学院', '2016', '软件工程', '5', '23FB821AE61D61716D2277C9BC629DBB', null);
INSERT INTO `students` VALUES ('171', '201610098170', '170', '计算机工程学院', '2016', '软件工程', '5', 'D67701B227EC71DF4C0B93A77475DA1D', null);
INSERT INTO `students` VALUES ('172', '201610098171', '171', '计算机工程学院', '2016', '软件工程', '5', 'E2520D35E9843659D694A48CCE053B46', null);
INSERT INTO `students` VALUES ('173', '201610098172', '172', '计算机工程学院', '2016', '软件工程', '5', '1721CF7829F4D58A865171F3A8B5DBCA', null);
INSERT INTO `students` VALUES ('174', '201610098173', '173', '计算机工程学院', '2016', '软件工程', '5', 'AA8C22B1B81BCB268059F3E469269D19', '1');
INSERT INTO `students` VALUES ('175', '201610098174', '174', '计算机工程学院', '2016', '软件工程', '5', '5CDFD7094485523886AE57D330787C4E', null);
INSERT INTO `students` VALUES ('176', '201610098175', '175', '计算机工程学院', '2016', '软件工程', '5', 'A18759B4804649828827655FF3A3EE68', null);
INSERT INTO `students` VALUES ('177', '201610098176', '176', '计算机工程学院', '2016', '软件工程', '5', '6BE31DDEE3860FD1677B2ABAF902BA30', null);
INSERT INTO `students` VALUES ('178', '201610098177', '177', '计算机工程学院', '2016', '软件工程', '5', '806306CC0C5F4D5CA4AC5C7F42405D79', null);
INSERT INTO `students` VALUES ('179', '201610098178', '178', '计算机工程学院', '2016', '软件工程', '5', 'E85C0D15858E3B979E0DF53748E34D2C', null);
INSERT INTO `students` VALUES ('180', '201610098179', '179', '计算机工程学院', '2016', '软件工程', '5', '6B8BDCD3B2311F19C07505129A35184F', null);
INSERT INTO `students` VALUES ('181', '201610098180', '180', '计算机工程学院', '2016', '软件工程', '5', 'B14095DBE6DD0E7DBBE4CBD50704BE73', null);
INSERT INTO `students` VALUES ('182', '201610098181', '181', '计算机工程学院', '2016', '软件工程', '5', '8CB5624BCB258130DE4FD9679A6B928A', null);
INSERT INTO `students` VALUES ('183', '201610098182', '182', '计算机工程学院', '2016', '软件工程', '5', '2622C13623A3E813FC5ED120AE678CA3', '1');
INSERT INTO `students` VALUES ('184', '201610098183', '183', '计算机工程学院', '2016', '软件工程', '5', '9331EE0A1895E2F255E779B5FD5EB5DE', null);
INSERT INTO `students` VALUES ('185', '201610098184', '184', '计算机工程学院', '2016', '软件工程', '5', 'FDC7E04C9EED7CA6ED531550588F1E0B', null);
INSERT INTO `students` VALUES ('186', '201610098185', '185', '计算机工程学院', '2016', '软件工程', '5', '22D7920B6FC6C1DA9241543FA5ACE798', null);
INSERT INTO `students` VALUES ('187', '201610098186', '186', '计算机工程学院', '2016', '软件工程', '5', '65A219F6D8EB55EAB02E2DA105155729', null);
INSERT INTO `students` VALUES ('188', '201610098187', '187', '计算机工程学院', '2016', '软件工程', '5', '5749FCCAE8AAF61BA05F8BABD4F1FA6B', null);
INSERT INTO `students` VALUES ('189', '201610098188', '188', '计算机工程学院', '2016', '软件工程', '5', 'DF5DC28130DA9BF1D03CBFD7725B835C', null);
INSERT INTO `students` VALUES ('190', '201610098189', '189', '计算机工程学院', '2016', '软件工程', '5', '2239A2C570D57C988606BD573C77529D', null);
INSERT INTO `students` VALUES ('191', '201610098190', '190', '计算机工程学院', '2016', '软件工程', '5', 'D2DBA5217BF9C9618324849D5642EA92', null);
INSERT INTO `students` VALUES ('192', '201610098191', '191', '计算机工程学院', '2016', '软件工程', '5', '53667398FD64F9892A7E2CC9FEE0D25B', '1');
INSERT INTO `students` VALUES ('193', '201610098192', '192', '计算机工程学院', '2016', '软件工程', '5', '2D879CD2480E4BBDE093355669F9DF25', null);
INSERT INTO `students` VALUES ('194', '201610098193', '193', '计算机工程学院', '2016', '软件工程', '5', 'B8DD4B536C18671A70D928E6E904D1C5', null);
INSERT INTO `students` VALUES ('195', '201610098194', '194', '计算机工程学院', '2016', '软件工程', '5', 'E23586FDD9C48ED2E7268525FF68BE83', null);
INSERT INTO `students` VALUES ('196', '201610098195', '195', '计算机工程学院', '2016', '软件工程', '5', 'BF415E4F52DC0A4A7B09A33F4A67A7CC', null);
INSERT INTO `students` VALUES ('197', '201610098196', '196', '计算机工程学院', '2016', '软件工程', '5', 'B3B86DD55AF13B86ED21C9A61DF0511E', null);
INSERT INTO `students` VALUES ('198', '201610098197', '197', '计算机工程学院', '2016', '软件工程', '5', '26800131A82E2FD2BF488096A2A21D4C', null);
INSERT INTO `students` VALUES ('199', '201610098198', '198', '计算机工程学院', '2016', '软件工程', '5', '6FB31FFFDFB6789E49E4177377BB390B', null);
INSERT INTO `students` VALUES ('200', '201610098199', '199', '计算机工程学院', '2016', '软件工程', '5', '84F47CADD5369E0649A01294992E07FD', null);
INSERT INTO `students` VALUES ('201', '201610098200', '200', '计算机工程学院', '2016', '软件工程', '6', '953141BFE59AF237FDF35EA7E3AF0CED', '1');
INSERT INTO `students` VALUES ('202', '201610098201', '201', '计算机工程学院', '2016', '软件工程', '6', '7728689CAB2FA2D7B1E31C8685FA9606', null);
INSERT INTO `students` VALUES ('203', '201610098202', '202', '计算机工程学院', '2016', '软件工程', '6', '2512C5E2FC1C38D8AD26F8311CE75E37', null);
INSERT INTO `students` VALUES ('204', '201610098203', '203', '计算机工程学院', '2016', '软件工程', '6', '378D90E8D76332E45D7968920B81E56D', null);
INSERT INTO `students` VALUES ('205', '201610098204', '204', '计算机工程学院', '2016', '软件工程', '6', '7BFF7A50259BB6EEE6A1BEE742DA52E0', null);
INSERT INTO `students` VALUES ('206', '201610098205', '205', '计算机工程学院', '2016', '软件工程', '6', '27993815350E30FCF025A9AB9DBD959C', null);
INSERT INTO `students` VALUES ('207', '201610098206', '206', '计算机工程学院', '2016', '软件工程', '6', '7B001A52C17A48E7387687405173B5C6', null);
INSERT INTO `students` VALUES ('208', '201610098207', '207', '计算机工程学院', '2016', '软件工程', '6', 'FDAFB1F0705CB7BAEA7537F8E44F7CDE', null);
INSERT INTO `students` VALUES ('209', '201610098208', '208', '计算机工程学院', '2016', '软件工程', '6', '92451FC3BBCEB20D37BE861DF7135152', null);
INSERT INTO `students` VALUES ('210', '201610098209', '209', '计算机工程学院', '2016', '软件工程', '6', 'A899A5A2F6621387208C1532A334A8EA', '1');
INSERT INTO `students` VALUES ('211', '201610098210', '210', '计算机工程学院', '2016', '软件工程', '6', '2D7B3D07F4FEE934B9442EF5554E8CD7', null);
INSERT INTO `students` VALUES ('212', '201610098211', '211', '计算机工程学院', '2016', '软件工程', '6', '494CF517D5329C2A08259378C5A5C580', null);
INSERT INTO `students` VALUES ('213', '201610098212', '212', '计算机工程学院', '2016', '软件工程', '6', '398112AEAB24CD85DBF862F8379A2618', null);
INSERT INTO `students` VALUES ('214', '201610098213', '213', '计算机工程学院', '2016', '软件工程', '6', '1C41AD0F9DDDEC3E665DB053526E7AE9', null);
INSERT INTO `students` VALUES ('215', '201610098214', '214', '计算机工程学院', '2016', '软件工程', '6', 'C94D81B6D8F94526086A623DA146C167', null);
INSERT INTO `students` VALUES ('216', '201610098215', '215', '计算机工程学院', '2016', '软件工程', '6', '81FCA412E99A6952A2512B245751911F', null);
INSERT INTO `students` VALUES ('217', '201610098216', '216', '计算机工程学院', '2016', '软件工程', '6', '1D842FD9CED505E791600EDBA8FE659F', null);
INSERT INTO `students` VALUES ('218', '201610098217', '217', '计算机工程学院', '2016', '软件工程', '6', 'AA0E89F44B6D6FF4D6D0DBC9B55C1316', null);
INSERT INTO `students` VALUES ('219', '201610098218', '218', '计算机工程学院', '2016', '软件工程', '6', '3D0A55A89B7D9D54ABB84C84D5A89FE5', null);
INSERT INTO `students` VALUES ('220', '201610098219', '219', '计算机工程学院', '2016', '软件工程', '6', '3418BD6089E027375FE6915F5FD1CD8A', '1');
INSERT INTO `students` VALUES ('221', '201610098220', '220', '计算机工程学院', '2016', '软件工程', '6', 'F1035FDCF253C8EB2CCA3B89368FAB88', null);
INSERT INTO `students` VALUES ('222', '201610098221', '221', '计算机工程学院', '2016', '软件工程', '6', 'B14FF75D5C871200335EB45D59C2AD7B', null);
INSERT INTO `students` VALUES ('223', '201610098222', '222', '计算机工程学院', '2016', '软件工程', '6', 'B7B33B62E7A3F4D715C13FE9FBE05D83', null);
INSERT INTO `students` VALUES ('224', '201610098223', '223', '计算机工程学院', '2016', '软件工程', '6', '0F6B7B367EFA05FD03FB943AABD26883', null);
INSERT INTO `students` VALUES ('225', '201610098224', '224', '计算机工程学院', '2016', '软件工程', '6', '7D94DA842E67B72ED7D934A868D62D69', null);
INSERT INTO `students` VALUES ('226', '201610098225', '225', '计算机工程学院', '2016', '软件工程', '6', '61B7E1D8B14EA3FB6ADFCD83668F916D', null);
INSERT INTO `students` VALUES ('227', '201610098226', '226', '计算机工程学院', '2016', '软件工程', '6', 'A2C9787488B22FE5F234E197CC75AD58', null);
INSERT INTO `students` VALUES ('228', '201610098227', '227', '计算机工程学院', '2016', '软件工程', '6', 'DBAF4DC3973385EBA20DAD01D775E692', null);
INSERT INTO `students` VALUES ('229', '201610098228', '228', '计算机工程学院', '2016', '软件工程', '6', 'D0B16E41E3C548625E04F9EFEFC08666', null);
INSERT INTO `students` VALUES ('230', '201610098229', '229', '计算机工程学院', '2016', '软件工程', '6', '92745E660A27CE08718758002E2D6AD5', null);
INSERT INTO `students` VALUES ('231', '201610098230', '230', '计算机工程学院', '2016', '软件工程', '6', '86ACADFC989E91F61D0E4154A9F37846', null);
INSERT INTO `students` VALUES ('232', '201610098231', '231', '计算机工程学院', '2016', '软件工程', '6', '839ADF6FC6C842918FF5AE1231C50D2E', null);
INSERT INTO `students` VALUES ('233', '201610098232', '232', '计算机工程学院', '2016', '软件工程', '6', 'A74AE29B214A14717FAA255292313481', null);
INSERT INTO `students` VALUES ('234', '201610098233', '233', '计算机工程学院', '2016', '软件工程', '6', 'C00801B71287D274A7E4DF50133A9F41', null);
INSERT INTO `students` VALUES ('235', '201610098234', '234', '计算机工程学院', '2016', '软件工程', '6', '9B37904B0881BEA9D509ADC1B4B5B344', null);
INSERT INTO `students` VALUES ('236', '201610098235', '235', '计算机工程学院', '2016', '软件工程', '6', '86B03FB96B962A05153426B0B84743D9', null);
INSERT INTO `students` VALUES ('237', '201610098236', '236', '计算机工程学院', '2016', '软件工程', '6', '2B62F24BD249038D08C678AC186DC412', null);
INSERT INTO `students` VALUES ('238', '201610098237', '237', '计算机工程学院', '2016', '软件工程', '6', '354C831526F6CB7786F4CD1F847C17FC', null);
INSERT INTO `students` VALUES ('239', '201610098238', '238', '计算机工程学院', '2016', '软件工程', '6', 'D3FDA62E722516233D7B134F48A0CB92', null);
INSERT INTO `students` VALUES ('240', '201610098239', '239', '计算机工程学院', '2016', '软件工程', '6', '94600AEBF2EC3B173EDC0DCE19FF9853', null);
INSERT INTO `students` VALUES ('241', '201610098240', '240', '计算机工程学院', '2016', '软件工程', '6', '532FA592B28235F2025F9574EEF43EDF', null);
INSERT INTO `students` VALUES ('242', '201610098241', '241', '计算机工程学院', '2016', '软件工程', '6', 'DF2118E4B2A06459FCC3462C9FFDB3AE', null);
INSERT INTO `students` VALUES ('243', '201610098242', '242', '计算机工程学院', '2016', '软件工程', '6', 'E1C19CF7EE7C0C0D251DA8B37500FA93', null);
INSERT INTO `students` VALUES ('244', '201610098243', '243', '计算机工程学院', '2016', '软件工程', '6', '464DA7D4F61D479B36D4AD3E80992138', null);
INSERT INTO `students` VALUES ('245', '201610098244', '244', '计算机工程学院', '2016', '软件工程', '6', '813E4F5BE1999E82E854F863E0341D82', null);
INSERT INTO `students` VALUES ('246', '201610098245', '245', '计算机工程学院', '2016', '软件工程', '6', '4CE0C6B5A4433CFEF4805EDD8BF5D15B', '1');
INSERT INTO `students` VALUES ('247', '201610098246', '246', '计算机工程学院', '2016', '软件工程', '6', 'CC2CE5C5494E41846C29AA470E948686', null);
INSERT INTO `students` VALUES ('248', '201610098247', '247', '计算机工程学院', '2016', '软件工程', '6', 'EA13A5C86EF979781A82FEF831C24771', null);
INSERT INTO `students` VALUES ('249', '201610098248', '248', '计算机工程学院', '2016', '软件工程', '6', '6609AADBEFF7717A3E35BCE399AB2550', null);
INSERT INTO `students` VALUES ('250', '201610098249', '249', '计算机工程学院', '2016', '软件工程', '6', '52DBF115DA1C610F48A03734DD690DE5', null);
INSERT INTO `students` VALUES ('251', '201610098250', '250', '计算机工程学院', '2016', '软件工程', '6', '441C0283DC26EC7668E62EDC88B09886', null);
INSERT INTO `students` VALUES ('252', '201610098251', '251', '计算机工程学院', '2016', '软件工程', '6', 'E131309CB580787E9C568AE6451C3A29', null);
INSERT INTO `students` VALUES ('253', '201610098252', '252', '计算机工程学院', '2016', '软件工程', '6', 'B08B7F39C7B216D8E7B2E339321F5263', null);
INSERT INTO `students` VALUES ('254', '201610098253', '253', '计算机工程学院', '2016', '软件工程', '6', '50EADDBEB1870C0A500C8F58BE5AD8C6', null);
INSERT INTO `students` VALUES ('255', '201610098254', '254', '计算机工程学院', '2016', '软件工程', '6', '7D3C11FD22E31D9D899492FB7D6C075E', null);
INSERT INTO `students` VALUES ('256', '201610098255', '255', '计算机工程学院', '2016', '软件工程', '6', '2F3813C708D04603D758D22E4C4FC0FF', null);
INSERT INTO `students` VALUES ('257', '201610098256', '256', '计算机工程学院', '2016', '软件工程', '6', 'F26AE294CB51E1B3F82C764ED467493A', '1');
INSERT INTO `students` VALUES ('258', '201610098257', '257', '计算机工程学院', '2016', '软件工程', '6', 'D0E5B92D903855E654F57C290949979D', null);
INSERT INTO `students` VALUES ('259', '201610098258', '258', '计算机工程学院', '2016', '软件工程', '6', 'B6AD445D573F42AB2B21B7BD73B4F629', null);
INSERT INTO `students` VALUES ('260', '201610098259', '259', '计算机工程学院', '2016', '软件工程', '6', 'F5B56DD360D4DC0E5784714210F1A8D2', null);
INSERT INTO `students` VALUES ('261', '201610098260', '260', '计算机工程学院', '2016', '软件工程', '6', '1205152411254AE22C7702BB332439A3', '1');
INSERT INTO `students` VALUES ('262', '201610098261', '261', '计算机工程学院', '2016', '软件工程', '6', '42975EEF519B99A70EC580AEAFCBAC61', null);
INSERT INTO `students` VALUES ('263', '201610098262', '262', '计算机工程学院', '2016', '软件工程', '6', '404994BDED7EBF622F53C333F9308AB8', null);
INSERT INTO `students` VALUES ('264', '201610098263', '263', '计算机工程学院', '2016', '软件工程', '6', 'A274B905FFC1FFEE4C37085726AA0D6F', null);
INSERT INTO `students` VALUES ('265', '201610098264', '264', '计算机工程学院', '2016', '软件工程', '6', 'A91A7F3FE593F3785940159F1820295B', null);
INSERT INTO `students` VALUES ('266', '201610098265', '265', '计算机工程学院', '2016', '软件工程', '6', 'BA456098AB980308D139C0B90F0FC52D', null);
INSERT INTO `students` VALUES ('267', '201610098266', '266', '计算机工程学院', '2016', '软件工程', '6', '8BB6DCE053E92E08AE4ED98C06AD3466', null);
INSERT INTO `students` VALUES ('268', '201610098267', '267', '计算机工程学院', '2016', '软件工程', '6', 'F4C139976274230642B78EC85E7360C4', null);
INSERT INTO `students` VALUES ('269', '201610098268', '268', '计算机工程学院', '2016', '软件工程', '6', 'A6A081DC3A9A9E13DE0735BEF36B70A2', null);
INSERT INTO `students` VALUES ('270', '201610098269', '269', '计算机工程学院', '2016', '软件工程', '6', 'E2569BBC271895CAC445A19D2FAE7C6D', null);
INSERT INTO `students` VALUES ('271', '201610098270', '270', '计算机工程学院', '2016', '软件工程', '6', 'CC51C461F060196E3375661825DC0B73', null);
INSERT INTO `students` VALUES ('272', '201610098271', '271', '计算机工程学院', '2016', '软件工程', '6', '24D2071CB274D54DBDDC5CC37F9F7551', null);
INSERT INTO `students` VALUES ('273', '201610098272', '272', '计算机工程学院', '2016', '软件工程', '6', 'D4B970974F2F1E97E549BF4AEFFEBD1C', null);
INSERT INTO `students` VALUES ('274', '201610098273', '273', '计算机工程学院', '2016', '软件工程', '6', '5FA5CB4CD2D3181388861BA74665CB6B', null);
INSERT INTO `students` VALUES ('275', '201610098274', '274', '计算机工程学院', '2016', '软件工程', '6', '1BDD3F64BA918C7AD6E078319BECE391', null);
INSERT INTO `students` VALUES ('276', '201610098275', '275', '计算机工程学院', '2016', '软件工程', '6', '09DCC89C80A2A99EF63ACE59447C67F5', null);
INSERT INTO `students` VALUES ('277', '201610098276', '276', '计算机工程学院', '2016', '软件工程', '6', 'BB13FC5541FB27851DC01A5F03F07899', null);
INSERT INTO `students` VALUES ('278', '201610098277', '277', '计算机工程学院', '2016', '软件工程', '6', '81DF4BB0FB0F1CE2DC548B90360D7A9C', null);
INSERT INTO `students` VALUES ('279', '201610098278', '278', '计算机工程学院', '2016', '软件工程', '6', 'C97293142B47D59948F7AA3F2C7EC31D', null);
INSERT INTO `students` VALUES ('280', '201610098279', '279', '计算机工程学院', '2016', '软件工程', '6', 'FF74C02351C9F7378E4C876464706D61', null);
INSERT INTO `students` VALUES ('281', '201610098280', '280', '计算机工程学院', '2016', '软件工程', '6', '8F7B668AF7FB3D17111BA6069CA83B72', '1');
INSERT INTO `students` VALUES ('282', '201610098281', '281', '计算机工程学院', '2016', '软件工程', '6', '2CA59FFEBDEF109083AC1C03E61451DB', null);
INSERT INTO `students` VALUES ('283', '201610098282', '282', '计算机工程学院', '2016', '软件工程', '6', 'AC26B2896914403A9925B1684C4DFB02', null);
INSERT INTO `students` VALUES ('284', '201610098283', '283', '计算机工程学院', '2016', '软件工程', '6', '4B63BA77AD63AF46C5E1E21CAB87C90C', null);
INSERT INTO `students` VALUES ('285', '201610098284', '284', '计算机工程学院', '2016', '软件工程', '6', '181CD0EE8A1EFC6876EABA763E967B95', null);
INSERT INTO `students` VALUES ('286', '201610098285', '285', '计算机工程学院', '2016', '软件工程', '6', '41D0BB7A2063F841546775546839C0E0', null);
INSERT INTO `students` VALUES ('287', '201610098286', '286', '计算机工程学院', '2016', '软件工程', '6', 'DA3D10C62247F5C3EADD5F51C62A24B8', null);
INSERT INTO `students` VALUES ('288', '201610098287', '287', '计算机工程学院', '2016', '软件工程', '6', '0C44624D6D08B0ACBFB524084C9433BE', null);
INSERT INTO `students` VALUES ('289', '201610098288', '288', '计算机工程学院', '2016', '软件工程', '6', 'F13B184BBC2362217E7DFD5A1D0484EA', null);
INSERT INTO `students` VALUES ('290', '201610098289', '289', '计算机工程学院', '2016', '软件工程', '6', '38C4EB4401A13DE374FD2E89FB371322', null);
INSERT INTO `students` VALUES ('291', '201610098290', '290', '计算机工程学院', '2016', '软件工程', '6', 'F37C17318F746ADB2AEF5C1653E2F834', null);
INSERT INTO `students` VALUES ('292', '201610098291', '291', '计算机工程学院', '2016', '软件工程', '6', '44F1BD5D92DA9D1CBBC099F9B0FCDA7C', null);
INSERT INTO `students` VALUES ('293', '201610098292', '292', '计算机工程学院', '2016', '软件工程', '6', '826ED2334FF234FBAFE7A2195FDC4A34', null);
INSERT INTO `students` VALUES ('294', '201610098293', '293', '计算机工程学院', '2016', '软件工程', '6', 'C5BA5761B7157DEEBD575D6A3A66CA81', null);
INSERT INTO `students` VALUES ('295', '201610098294', '294', '计算机工程学院', '2016', '软件工程', '6', '2B622FA4A84A7DA2C21CA14E91B29588', null);
INSERT INTO `students` VALUES ('296', '201610098295', '295', '计算机工程学院', '2016', '软件工程', '6', 'D9649A0104513EA56B41047035EB5489', null);
INSERT INTO `students` VALUES ('297', '201610098296', '296', '计算机工程学院', '2016', '软件工程', '6', 'D5BE472D41B0559C5D762AA4F2B8CC9E', null);
INSERT INTO `students` VALUES ('298', '201610098297', '297', '计算机工程学院', '2016', '软件工程', '6', 'BB64EF4CE3567E8C55359681C029A189', null);
INSERT INTO `students` VALUES ('299', '201610098298', '298', '计算机工程学院', '2016', '软件工程', '6', '65074E2BA99C19EBE13308E950234DA7', null);
INSERT INTO `students` VALUES ('300', '201610098299', '299', '计算机工程学院', '2016', '软件工程', '6', '85798416F3F3F0B5FCCBC7D5A59CF5B1', null);
INSERT INTO `students` VALUES ('301', '201610098300', '300', '计算机工程学院', '2016', '软件工程', '6', 'EF9DA8D8DE99D82AFFCDC5AD997EA1E1', null);
INSERT INTO `students` VALUES ('302', '201610098301', '301', '计算机工程学院', '2016', '软件工程', '6', '571A713F289C18AD7EF5B71ADFFA49B8', null);
INSERT INTO `students` VALUES ('303', '201610098302', '302', '计算机工程学院', '2016', '软件工程', '6', '6DCAFF4538FC9331FC4CA7DE05BB57C5', null);
INSERT INTO `students` VALUES ('304', '201610098303', '303', '计算机工程学院', '2016', '软件工程', '6', 'C096B1A077896313B7505B3F73EBBC6B', null);
INSERT INTO `students` VALUES ('305', '201610098304', '304', '计算机工程学院', '2016', '软件工程', '6', 'B88D9241960BE2CFC2930589B817880E', null);
INSERT INTO `students` VALUES ('306', '201610098305', '305', '计算机工程学院', '2016', '软件工程', '6', 'B56303EF3C52DEA8D4843A1B7E3C9145', null);
INSERT INTO `students` VALUES ('307', '201610098306', '306', '计算机工程学院', '2016', '软件工程', '6', '3CA3DB4ED1147786CDFC63AF191D8B6E', null);
INSERT INTO `students` VALUES ('308', '201610098307', '307', '计算机工程学院', '2016', '软件工程', '6', 'A9D1CAF795C3EA14F6F6E889C8469B8C', null);
INSERT INTO `students` VALUES ('309', '201610098308', '308', '计算机工程学院', '2016', '软件工程', '6', '5C24AFCC417094025738C673E5BAF69D', null);
INSERT INTO `students` VALUES ('310', '201610098309', '309', '计算机工程学院', '2016', '软件工程', '6', '6B28D33C9CF9CF3C181F5209BF382614', null);
INSERT INTO `students` VALUES ('311', '201610098310', '310', '计算机工程学院', '2016', '软件工程', '6', 'CCA1956A607A53D809FF1998694BB83A', null);
INSERT INTO `students` VALUES ('312', '201610098311', '311', '计算机工程学院', '2016', '软件工程', '6', '1222F32FE29E7A9F888802B34A66A8D0', null);
INSERT INTO `students` VALUES ('313', '201610098312', '312', '计算机工程学院', '2016', '软件工程', '6', '503A1F3DD46BBBF50526BE424338F18F', null);
INSERT INTO `students` VALUES ('314', '201610098313', '313', '计算机工程学院', '2016', '软件工程', '6', 'AFB87DE82C529D4E00F3317369ED884E', null);
INSERT INTO `students` VALUES ('315', '201610098314', '314', '计算机工程学院', '2016', '软件工程', '6', '9CE6DA4090CA4832D3C5B5F9A86C7D32', '1');
INSERT INTO `students` VALUES ('316', '201610098315', '315', '计算机工程学院', '2016', '软件工程', '6', '4818D7F064E5DCD4F247511299ABD9D8', null);
INSERT INTO `students` VALUES ('317', '201610098316', '316', '计算机工程学院', '2016', '软件工程', '6', 'C3AB07BF84DDB865E59F59AC845DAA5B', null);
INSERT INTO `students` VALUES ('318', '201610098317', '317', '计算机工程学院', '2016', '软件工程', '6', '8561DFE07F3C75D441A8A82150C341F2', null);
INSERT INTO `students` VALUES ('319', '201610098318', '318', '计算机工程学院', '2016', '软件工程', '6', 'E2F38DCC6EB6FDE82E1A57858B741F97', null);
INSERT INTO `students` VALUES ('320', '201610098319', '319', '计算机工程学院', '2016', '软件工程', '6', 'ADC394D1B8BAADA05F20026619AD741B', null);
INSERT INTO `students` VALUES ('321', '201610098320', '320', '计算机工程学院', '2016', '软件工程', '6', 'FDF5892EE0E2C5EE34BB2FDD5401B023', null);
INSERT INTO `students` VALUES ('322', '201610098321', '321', '计算机工程学院', '2016', '软件工程', '6', '6E057656AFFEE8F61728F5DA73E71D7B', null);
INSERT INTO `students` VALUES ('323', '201610098322', '322', '计算机工程学院', '2016', '软件工程', '6', 'CB419843D3C879C9786743E4BA027214', null);
INSERT INTO `students` VALUES ('324', '201610098323', '323', '计算机工程学院', '2016', '软件工程', '6', 'F65491F80E685839C05DAA3628C575A3', null);
INSERT INTO `students` VALUES ('325', '201610098324', '324', '计算机工程学院', '2016', '软件工程', '6', '02758B425B536E7F47079397C21314A0', null);
INSERT INTO `students` VALUES ('326', '201610098325', '325', '计算机工程学院', '2016', '软件工程', '6', '05F122F4254173560EE63279FCCB7C0E', null);
INSERT INTO `students` VALUES ('327', '201610098326', '326', '计算机工程学院', '2016', '软件工程', '6', 'F7E20C61CAB5AD4F5C7A1DDA08EE3D8B', null);
INSERT INTO `students` VALUES ('328', '201610098327', '327', '计算机工程学院', '2016', '软件工程', '6', '215AEE341CBF21C37CA185CCD9B6D802', null);
INSERT INTO `students` VALUES ('329', '201610098328', '328', '计算机工程学院', '2016', '软件工程', '6', '79D297E44BE0A3D02CDAD1CA8C222710', null);
INSERT INTO `students` VALUES ('330', '201610098329', '329', '计算机工程学院', '2016', '软件工程', '6', '004FE8B3159AC513B1C3635EFFF07BF8', null);
INSERT INTO `students` VALUES ('331', '201610098330', '330', '计算机工程学院', '2016', '软件工程', '6', '7373D5A4DEEABC4E044DA89C55EF8551', null);
INSERT INTO `students` VALUES ('332', '201610098331', '331', '计算机工程学院', '2016', '软件工程', '6', 'EBC03AF79E4B4B98F97457F79E8AD96D', null);
INSERT INTO `students` VALUES ('333', '201610098332', '332', '计算机工程学院', '2016', '软件工程', '6', '67BF1DCABF3F4FDE7C13E1B95CBB4C46', null);
INSERT INTO `students` VALUES ('334', '201610098333', '333', '计算机工程学院', '2016', '软件工程', '6', '8068564D2428A6487CD1EDE37E1C9F39', null);
INSERT INTO `students` VALUES ('335', '201610098334', '334', '计算机工程学院', '2016', '软件工程', '6', '5DD84DDC8122470434A064D5D56346EC', null);
INSERT INTO `students` VALUES ('336', '201610098335', '335', '计算机工程学院', '2016', '软件工程', '6', 'AC38D310AD1BFC8A46BEAE5BA0A19A05', null);
INSERT INTO `students` VALUES ('337', '201610098336', '336', '计算机工程学院', '2016', '软件工程', '6', '45A8435A3EF5B3F098A3D6509FB7E344', null);
INSERT INTO `students` VALUES ('338', '201610098337', '337', '计算机工程学院', '2016', '软件工程', '6', '9944B1E6AD9EE54709BE6EEFC9E42DE5', null);
INSERT INTO `students` VALUES ('339', '201610098338', '338', '计算机工程学院', '2016', '软件工程', '6', 'C35F3EC8D8FB63FA2716D1CB1A4E30A7', null);
INSERT INTO `students` VALUES ('340', '201610098339', '339', '计算机工程学院', '2016', '软件工程', '6', 'E80F2608060840DB24C99A4CA8C7E305', null);
INSERT INTO `students` VALUES ('341', '201610098340', '340', '计算机工程学院', '2016', '软件工程', '6', '86818FBB8983EE26C71A17A392046054', null);
INSERT INTO `students` VALUES ('342', '201610098341', '341', '计算机工程学院', '2016', '软件工程', '6', '2EBC84E0763423F5AF08EF893009DE9D', null);
INSERT INTO `students` VALUES ('343', '201610098342', '342', '计算机工程学院', '2016', '软件工程', '6', '509F4B65AF6E3EF7136A5AA3774636B4', null);
INSERT INTO `students` VALUES ('344', '201610098343', '343', '计算机工程学院', '2016', '软件工程', '6', 'E7924A9B61809DAAD59F99CF55509593', null);
INSERT INTO `students` VALUES ('345', '201610098344', '344', '计算机工程学院', '2016', '软件工程', '6', 'CB3F6258A7AE15D92BA9D5697C34E6E1', null);
INSERT INTO `students` VALUES ('346', '201610098345', '345', '计算机工程学院', '2016', '软件工程', '6', '4367191F034EA26CAEA8E80C939088D4', null);
INSERT INTO `students` VALUES ('347', '201610098346', '346', '计算机工程学院', '2016', '软件工程', '6', 'DE45FE182E0A62057C527316674F9E73', null);
INSERT INTO `students` VALUES ('348', '201610098347', '347', '计算机工程学院', '2016', '软件工程', '6', '6A9A95FB1BBF27C782D5FE76B91757E7', null);
INSERT INTO `students` VALUES ('349', '201610098348', '348', '计算机工程学院', '2016', '软件工程', '6', 'C73AEE4226BC37BEDB5C859530275E58', null);
INSERT INTO `students` VALUES ('350', '201610098349', '349', '计算机工程学院', '2016', '软件工程', '6', '5EFED8DA3C6501773D50A0C67E20E374', null);
INSERT INTO `students` VALUES ('351', '201610098350', '350', '计算机工程学院', '2016', '软件工程', '6', '868F6FA0A83103833E6DA6B187929B23', null);
INSERT INTO `students` VALUES ('352', '201610098351', '351', '计算机工程学院', '2016', '软件工程', '6', '85B519EE440DE3248FCA078EC1D994CB', null);
INSERT INTO `students` VALUES ('353', '201610098352', '352', '计算机工程学院', '2016', '软件工程', '6', '252ADFB468366A77AEAF39EC68C4FD2A', null);
INSERT INTO `students` VALUES ('354', '201610098353', '353', '计算机工程学院', '2016', '软件工程', '6', 'B31D544B982C94C4DFB1A14A2D46E3BC', null);
INSERT INTO `students` VALUES ('355', '201610098354', '354', '计算机工程学院', '2016', '软件工程', '6', '2F9E21EF2F1894981B4598796078BEF0', null);
INSERT INTO `students` VALUES ('356', '201610098355', '355', '计算机工程学院', '2016', '软件工程', '6', '41961366F1358EB7514FCFB7989C96B5', null);
INSERT INTO `students` VALUES ('357', '201610098356', '356', '计算机工程学院', '2016', '软件工程', '6', '5CBD60D759BF66B84A370546DEB927D5', null);
INSERT INTO `students` VALUES ('358', '201610098357', '357', '计算机工程学院', '2016', '软件工程', '6', '64DE6800CC50F53EF0400366886A1D66', null);
INSERT INTO `students` VALUES ('359', '201610098358', '358', '计算机工程学院', '2016', '软件工程', '6', 'D5698C636B09A625641FDC9CC4329628', null);
INSERT INTO `students` VALUES ('360', '201610098359', '359', '计算机工程学院', '2016', '软件工程', '6', 'B4203EA935B74B06B682450FA47322E3', null);
INSERT INTO `students` VALUES ('361', '201610098360', '360', '计算机工程学院', '2016', '软件工程', '6', '0181D9BDF6FA4BCA5928322B401EA410', null);
INSERT INTO `students` VALUES ('362', '201610098361', '361', '计算机工程学院', '2016', '软件工程', '6', 'A6030FB404687D4FA3F086066B50FF5A', null);
INSERT INTO `students` VALUES ('363', '201610098362', '362', '计算机工程学院', '2016', '软件工程', '6', '607DA2EB89ED90EC604D8E9B71F0AE0C', null);
INSERT INTO `students` VALUES ('364', '201610098363', '363', '计算机工程学院', '2016', '软件工程', '6', '4AB72B367CCEBF2005BCC7B6E9BC9872', null);
INSERT INTO `students` VALUES ('365', '201610098364', '364', '计算机工程学院', '2016', '软件工程', '6', '81F0549CF999961DB541C34653CC7106', null);
INSERT INTO `students` VALUES ('366', '201610098365', '365', '计算机工程学院', '2016', '软件工程', '6', 'B168883B133181DE6D4D34171BC86C5A', null);
INSERT INTO `students` VALUES ('367', '201610098366', '366', '计算机工程学院', '2016', '软件工程', '6', '5909E6E11DE82BFD8FF806E2B40417B5', null);
INSERT INTO `students` VALUES ('368', '201610098367', '367', '计算机工程学院', '2016', '软件工程', '6', 'F3864783FBB543CDC3E8A06B3DB6A96D', null);
INSERT INTO `students` VALUES ('369', '201610098368', '368', '计算机工程学院', '2016', '软件工程', '6', 'BDD2A52F22DBF8671033BDAEE1401B6F', null);
INSERT INTO `students` VALUES ('370', '201610098369', '369', '计算机工程学院', '2016', '软件工程', '6', '03A33EF51EE8D969BC7C997BF21AD27D', null);
INSERT INTO `students` VALUES ('371', '201610098370', '370', '计算机工程学院', '2016', '软件工程', '6', '7588D00FA9F046B920A7DCBAA8B9366E', null);
INSERT INTO `students` VALUES ('372', '201610098371', '371', '计算机工程学院', '2016', '软件工程', '6', '6A7E6E19053BAE90B6A1021182DEF434', null);
INSERT INTO `students` VALUES ('373', '201610098372', '372', '计算机工程学院', '2016', '软件工程', '6', '3B52F34EBD85E35A2BB3FAB30AA8F15F', null);
INSERT INTO `students` VALUES ('374', '201610098373', '373', '计算机工程学院', '2016', '软件工程', '6', '05C07EF9F8424AB7C2114B4B4E8FE1C3', null);
INSERT INTO `students` VALUES ('375', '201610098374', '374', '计算机工程学院', '2016', '软件工程', '6', '16FE0A479D9A4DCB8C93C28DA325F8D2', null);
INSERT INTO `students` VALUES ('376', '201610098375', '375', '计算机工程学院', '2016', '软件工程', '6', 'C808157158A00C4B5CDE2B16B9137630', null);
INSERT INTO `students` VALUES ('377', '201610098376', '376', '计算机工程学院', '2016', '软件工程', '6', '1E0F7B7FE40071A8E1C3D9C950DE36EE', null);
INSERT INTO `students` VALUES ('378', '201610098377', '377', '计算机工程学院', '2016', '软件工程', '6', 'A9B86EE3A9EE5DD5FC190B45CB6C6938', null);
INSERT INTO `students` VALUES ('379', '201610098378', '378', '计算机工程学院', '2016', '软件工程', '6', '86B531CE8889FFD746C8622FD50B3AFF', null);
INSERT INTO `students` VALUES ('380', '201610098379', '379', '计算机工程学院', '2016', '软件工程', '6', 'C385ADAFE098B446531A460B98638427', null);
INSERT INTO `students` VALUES ('381', '201610098380', '380', '计算机工程学院', '2016', '软件工程', '6', '35C3B966287D33779187385480B186A8', null);
INSERT INTO `students` VALUES ('382', '201610098381', '381', '计算机工程学院', '2016', '软件工程', '6', 'BCD38E66EB0961443CB817DD12F3842D', null);
INSERT INTO `students` VALUES ('383', '201610098382', '382', '计算机工程学院', '2016', '软件工程', '6', 'DF9BFC946C89DD2F4EAF407E4EFB0F20', null);
INSERT INTO `students` VALUES ('384', '201610098383', '383', '计算机工程学院', '2016', '软件工程', '6', '626DE957FA049CE0066AD7D9B4C32C2C', null);
INSERT INTO `students` VALUES ('385', '201610098384', '384', '计算机工程学院', '2016', '软件工程', '6', '771C2034401E084348A5D8D0FE78DFB5', null);
INSERT INTO `students` VALUES ('386', '201610098385', '385', '计算机工程学院', '2016', '软件工程', '6', '8244E71F817E3FA41A436DEAE6F3B58B', null);
INSERT INTO `students` VALUES ('387', '201610098386', '386', '计算机工程学院', '2016', '软件工程', '6', 'C284B756539A7D3B048E65CB741333E0', null);
INSERT INTO `students` VALUES ('388', '201610098387', '387', '计算机工程学院', '2016', '软件工程', '6', '063BA66ADC44B18A50058FCF4FE1D98C', null);
INSERT INTO `students` VALUES ('389', '201610098388', '388', '计算机工程学院', '2016', '软件工程', '6', '1FD2580A15AF783C0025D28A7BDC9BE5', null);
INSERT INTO `students` VALUES ('390', '201610098389', '389', '计算机工程学院', '2016', '软件工程', '6', '009199D5AC59A53FEB1F91E3B7B16AEA', null);
INSERT INTO `students` VALUES ('391', '201610098390', '390', '计算机工程学院', '2016', '软件工程', '6', '4A5A24EBC02E8EDC20AC455FC069EA3B', null);
INSERT INTO `students` VALUES ('392', '201610098391', '391', '计算机工程学院', '2016', '软件工程', '6', 'E20EBA67C80CB2249DE983C56995FF58', null);
INSERT INTO `students` VALUES ('393', '201610098392', '392', '计算机工程学院', '2016', '软件工程', '6', 'EB648E6393CDDD18DFF3B478492A6FD0', null);
INSERT INTO `students` VALUES ('394', '201610098393', '393', '计算机工程学院', '2016', '软件工程', '6', 'E392B2A7FFF2645AC281276DD2A24958', null);
INSERT INTO `students` VALUES ('395', '201610098394', '394', '计算机工程学院', '2016', '软件工程', '6', 'EF00EC5EA2E1F4ED54E98B9A949B622E', null);
INSERT INTO `students` VALUES ('396', '201610098395', '395', '计算机工程学院', '2016', '软件工程', '6', 'A19E7736F7F06A3103488E43CCF7ECE0', null);
INSERT INTO `students` VALUES ('397', '201610098396', '396', '计算机工程学院', '2016', '软件工程', '6', 'C4A6A268516C2D1708CC521F1FB714A8', null);
INSERT INTO `students` VALUES ('398', '201610098397', '397', '计算机工程学院', '2016', '软件工程', '6', 'A31511B16B87511B5897D12ABE0A95B6', null);
INSERT INTO `students` VALUES ('399', '201610098398', '398', '计算机工程学院', '2016', '软件工程', '6', '9CE9265B651725F97F0A478951343AC1', null);
INSERT INTO `students` VALUES ('400', '201610098399', '399', '计算机工程学院', '2016', '软件工程', '6', 'FADBD8E55A9A206F9ADF94D64A2C78B2', null);
INSERT INTO `students` VALUES ('401', '201610098400', '400', '计算机工程学院', '2016', '软件工程', '1', '8D968E3667224AEB46CC1FF25C65048F', null);
INSERT INTO `students` VALUES ('402', '201610098401', '401', '计算机工程学院', '2016', '软件工程', '1', 'FAB0B4413949572D7E380E595753275C', null);
INSERT INTO `students` VALUES ('403', '201610098402', '402', '计算机工程学院', '2016', '软件工程', '1', '54C845A8844356ACC1D767D67AA55A16', null);
INSERT INTO `students` VALUES ('404', '201610098403', '403', '计算机工程学院', '2016', '软件工程', '1', '988C28046AB766B9A950D9FF76E67CDF', null);
INSERT INTO `students` VALUES ('405', '201610098404', '404', '计算机工程学院', '2016', '软件工程', '1', 'C9057D04BAF33BD51D3DE488A192A0D0', null);
INSERT INTO `students` VALUES ('406', '201610098405', '405', '计算机工程学院', '2016', '软件工程', '1', '88AF6346E2D63A6519A5B78AC3AEFBBA', null);
INSERT INTO `students` VALUES ('407', '201610098406', '406', '计算机工程学院', '2016', '软件工程', '1', '588537FFFB0817A021191473835111A9', null);
INSERT INTO `students` VALUES ('408', '201610098407', '407', '计算机工程学院', '2016', '软件工程', '1', 'C1A624CAA8AB54A298BCCDF23A90D42D', null);
INSERT INTO `students` VALUES ('409', '201610098408', '408', '计算机工程学院', '2016', '软件工程', '1', 'C83FDFB5C6C6A5F7F20E313E4AADB5BB', null);
INSERT INTO `students` VALUES ('410', '201610098409', '409', '计算机工程学院', '2016', '软件工程', '1', 'A66AFFB36151750992839312314714E1', null);
INSERT INTO `students` VALUES ('411', '201610098410', '410', '计算机工程学院', '2016', '软件工程', '1', '275E8CED4755D04E59E4AADE6BC59440', null);
INSERT INTO `students` VALUES ('412', '201610098411', '411', '计算机工程学院', '2016', '软件工程', '1', '90C9FD248ECE1471FEB257B472D194F8', null);
INSERT INTO `students` VALUES ('413', '201610098412', '412', '计算机工程学院', '2016', '软件工程', '1', 'E445C996B669A1FF01C5D9C38251709F', null);
INSERT INTO `students` VALUES ('414', '201610098413', '413', '计算机工程学院', '2016', '软件工程', '1', '0ABCCB7A63CA581731BB3FA9C5D65FAE', null);
INSERT INTO `students` VALUES ('415', '201610098414', '414', '计算机工程学院', '2016', '软件工程', '1', '7778D20FDAE40007B5C1186EC97FC91A', null);
INSERT INTO `students` VALUES ('416', '201610098415', '415', '计算机工程学院', '2016', '软件工程', '1', '1476D1828079DBDD4CFD9133C128610B', null);
INSERT INTO `students` VALUES ('417', '201610098416', '416', '计算机工程学院', '2016', '软件工程', '1', 'A381FB267F6DBEA727781B580C46095B', null);
INSERT INTO `students` VALUES ('418', '201610098417', '417', '计算机工程学院', '2016', '软件工程', '1', '07C6A6D7A3A286E57282E056C96AEAD2', null);
INSERT INTO `students` VALUES ('419', '201610098418', '418', '计算机工程学院', '2016', '软件工程', '1', '553FF4AE05FDE74BEFA1328427376E25', null);
INSERT INTO `students` VALUES ('420', '201610098419', '419', '计算机工程学院', '2016', '软件工程', '1', '3544B5FED696C4B8606411DAEB7B2AFF', null);
INSERT INTO `students` VALUES ('421', '201610098420', '420', '计算机工程学院', '2016', '软件工程', '1', '8B89F7AB57D32F09FC4324990D15C126', null);
INSERT INTO `students` VALUES ('422', '201610098421', '421', '计算机工程学院', '2016', '软件工程', '1', '57A039A859E1206EBBE0DCE2384AFEB9', null);
INSERT INTO `students` VALUES ('423', '201610098422', '422', '计算机工程学院', '2016', '软件工程', '1', '967BDE993EAA7A3E3EF8D525E262BF18', null);
INSERT INTO `students` VALUES ('424', '201610098423', '423', '计算机工程学院', '2016', '软件工程', '1', 'C3511CA663B60845C1FDC365505B9044', null);
INSERT INTO `students` VALUES ('425', '201610098424', '424', '计算机工程学院', '2016', '软件工程', '1', 'E0A6E13FAA60D0FD161994965A27B4E6', null);
INSERT INTO `students` VALUES ('426', '201610098425', '425', '计算机工程学院', '2016', '软件工程', '1', '10A5E4C03ACB1BF0121671E8BCBCCCA4', null);
INSERT INTO `students` VALUES ('427', '201610098426', '426', '计算机工程学院', '2016', '软件工程', '1', '852E585872110FC4B3B150816F16490F', null);
INSERT INTO `students` VALUES ('428', '201610098427', '427', '计算机工程学院', '2016', '软件工程', '1', 'E4BF26D2F1FE1996EF5080D05A5134CB', null);
INSERT INTO `students` VALUES ('429', '201610098428', '428', '计算机工程学院', '2016', '软件工程', '1', 'CDE1FD490D7BC9843C5307A81C8A08D4', null);
INSERT INTO `students` VALUES ('430', '201610098429', '429', '计算机工程学院', '2016', '软件工程', '1', '86FB5A3F1B43C97147C9390F127EA4DC', null);
INSERT INTO `students` VALUES ('431', '201610098430', '430', '计算机工程学院', '2016', '软件工程', '1', '171BFDFBC6E8D14472553BD6F3D3855C', null);
INSERT INTO `students` VALUES ('432', '201610098431', '431', '计算机工程学院', '2016', '软件工程', '1', '06B98D1285AE3BE92FF08C899401B945', null);
INSERT INTO `students` VALUES ('433', '201610098432', '432', '计算机工程学院', '2016', '软件工程', '1', 'B3D315204F16A331EF6A761ECA565A70', null);
INSERT INTO `students` VALUES ('434', '201610098433', '433', '计算机工程学院', '2016', '软件工程', '1', '19A6772B05D039D49D033D31C9F12827', null);
INSERT INTO `students` VALUES ('435', '201610098434', '434', '计算机工程学院', '2016', '软件工程', '1', 'F217EFF68EBD018123612B2A5C55D914', null);
INSERT INTO `students` VALUES ('436', '201610098435', '435', '计算机工程学院', '2016', '软件工程', '1', 'A15FC6582D24DCBD60C70FBEACF40EFD', null);
INSERT INTO `students` VALUES ('437', '201610098436', '436', '计算机工程学院', '2016', '软件工程', '1', 'BCC1B83FCE7717765CAB845C245E0495', null);
INSERT INTO `students` VALUES ('438', '201610098437', '437', '计算机工程学院', '2016', '软件工程', '1', '31E21873A5F80F0497B26454CB555EF2', null);
INSERT INTO `students` VALUES ('439', '201610098438', '438', '计算机工程学院', '2016', '软件工程', '1', '4EDC94AAAFFDBEF54C495930FD15D07A', null);
INSERT INTO `students` VALUES ('440', '201610098439', '439', '计算机工程学院', '2016', '软件工程', '1', '03989FB636141F9B92DF66AFEE2589C3', null);
INSERT INTO `students` VALUES ('441', '201610098440', '440', '计算机工程学院', '2016', '软件工程', '1', '8DF1DD4BA7C69FBD5D890A9D07005361', null);
INSERT INTO `students` VALUES ('442', '201610098441', '441', '计算机工程学院', '2016', '软件工程', '1', '89D51F407E030F75C9F4D76EAD41AB19', null);
INSERT INTO `students` VALUES ('443', '201610098442', '442', '计算机工程学院', '2016', '软件工程', '1', '46C822A02004F76E559465A25F4FC68A', null);
INSERT INTO `students` VALUES ('444', '201610098443', '443', '计算机工程学院', '2016', '软件工程', '1', '7D89CBBAFEEB6188B98D7B042ED69A74', null);
INSERT INTO `students` VALUES ('445', '201610098444', '444', '计算机工程学院', '2016', '软件工程', '1', '4FB9FEDFB210AF30EB5E81AE37D3BBD9', null);
INSERT INTO `students` VALUES ('446', '201610098445', '445', '计算机工程学院', '2016', '软件工程', '1', '3F1416BF287B48BD1EB3D09FAE23AA7E', null);
INSERT INTO `students` VALUES ('447', '201610098446', '446', '计算机工程学院', '2016', '软件工程', '1', 'D591745670CD73EA65303744927616A9', null);
INSERT INTO `students` VALUES ('448', '201610098447', '447', '计算机工程学院', '2016', '软件工程', '1', '2037064C366590C169B3DDA228C6DF9F', null);
INSERT INTO `students` VALUES ('449', '201610098448', '448', '计算机工程学院', '2016', '软件工程', '1', 'B675B4DDE19DD549D6F9A600CFE620AD', null);
INSERT INTO `students` VALUES ('450', '201610098449', '449', '计算机工程学院', '2016', '软件工程', '1', '4F3C48101D24FABE9D9BE1591718B13B', null);
INSERT INTO `students` VALUES ('451', '201610098450', '450', '计算机工程学院', '2016', '软件工程', '1', '2A418149BD1F2C52BE1539D9A77AC28A', null);
INSERT INTO `students` VALUES ('452', '201610098451', '451', '计算机工程学院', '2016', '软件工程', '1', 'F98B546043B823C60C25EBCE8830523E', null);
INSERT INTO `students` VALUES ('453', '201610098452', '452', '计算机工程学院', '2016', '软件工程', '1', 'C88E5B9B9AD79F0B76E3A8D014B568A3', null);
INSERT INTO `students` VALUES ('454', '201610098453', '453', '计算机工程学院', '2016', '软件工程', '1', '7936FD3863FCBE676840418DFA25FA8A', null);
INSERT INTO `students` VALUES ('455', '201610098454', '454', '计算机工程学院', '2016', '软件工程', '1', '05CCD6D54825E2469798F4D441727EE8', null);
INSERT INTO `students` VALUES ('456', '201610098455', '455', '计算机工程学院', '2016', '软件工程', '1', 'F0FFBB75741CDBBCE623C16C36655D5D', null);
INSERT INTO `students` VALUES ('457', '201610098456', '456', '计算机工程学院', '2016', '软件工程', '1', '78D8F16A69D727E4C02E8A6BBA827C7F', null);
INSERT INTO `students` VALUES ('458', '201610098457', '457', '计算机工程学院', '2016', '软件工程', '1', '72F1900700378C20014B249039486ED3', null);
INSERT INTO `students` VALUES ('459', '201610098458', '458', '计算机工程学院', '2016', '软件工程', '1', '90742030B8587960F5F2C02C256F1EA6', null);
INSERT INTO `students` VALUES ('460', '201610098459', '459', '计算机工程学院', '2016', '软件工程', '1', '4A0CA78A6F5657C71B6CB7B06752C02F', null);
INSERT INTO `students` VALUES ('461', '201610098460', '460', '计算机工程学院', '2016', '软件工程', '1', 'C093425D310842249A2F9E67E782B6A1', null);
INSERT INTO `students` VALUES ('462', '201610098461', '461', '计算机工程学院', '2016', '软件工程', '1', '6DC8EC39097B477A0A50618BF97168E6', null);
INSERT INTO `students` VALUES ('463', '201610098462', '462', '计算机工程学院', '2016', '软件工程', '1', 'DDE924327C3645042517FB9E214AEB53', null);
INSERT INTO `students` VALUES ('464', '201610098463', '463', '计算机工程学院', '2016', '软件工程', '1', '0D760615B5FDD6C16C274226330B52D1', null);
INSERT INTO `students` VALUES ('465', '201610098464', '464', '计算机工程学院', '2016', '软件工程', '1', 'FD9189F99489629CB4B095B28161F234', null);
INSERT INTO `students` VALUES ('466', '201610098465', '465', '计算机工程学院', '2016', '软件工程', '1', '5B208D09EB96F92F90DF346405D83BD1', null);
INSERT INTO `students` VALUES ('467', '201610098466', '466', '计算机工程学院', '2016', '软件工程', '1', '28456035E7E7AC26997DF25D7A9E40BB', null);
INSERT INTO `students` VALUES ('468', '201610098467', '467', '计算机工程学院', '2016', '软件工程', '1', 'C4BC9E779094DF66FC261C19DDF589CF', null);
INSERT INTO `students` VALUES ('469', '201610098468', '468', '计算机工程学院', '2016', '软件工程', '1', '1A6F03B20D071676C7B06A78F6DC53CC', null);
INSERT INTO `students` VALUES ('470', '201610098469', '469', '计算机工程学院', '2016', '软件工程', '1', '729102A48E177CC60EDEB4B56DD305E2', null);
INSERT INTO `students` VALUES ('471', '201610098470', '470', '计算机工程学院', '2016', '软件工程', '1', '56BD10EEA885A6D3546A1567B607F4C8', null);
INSERT INTO `students` VALUES ('472', '201610098471', '471', '计算机工程学院', '2016', '软件工程', '1', '81791C6D11B61B6D0EC51E79DCF11E05', null);
INSERT INTO `students` VALUES ('473', '201610098472', '472', '计算机工程学院', '2016', '软件工程', '1', 'CBF95A08F5974CC3AF443CB058C4F8E8', null);
INSERT INTO `students` VALUES ('474', '201610098473', '473', '计算机工程学院', '2016', '软件工程', '1', 'BD4B7E0E4B3BEC4D823512A3AF1B527C', null);
INSERT INTO `students` VALUES ('475', '201610098474', '474', '计算机工程学院', '2016', '软件工程', '1', 'C448CFFF42425639322FA3992473618D', null);
INSERT INTO `students` VALUES ('476', '201610098475', '475', '计算机工程学院', '2016', '软件工程', '1', '85B03B7A69B19209A7339DB8120430F9', null);
INSERT INTO `students` VALUES ('477', '201610098476', '476', '计算机工程学院', '2016', '软件工程', '1', 'A53F9830E9BBEEAB80698FF64428E38C', null);
INSERT INTO `students` VALUES ('478', '201610098477', '477', '计算机工程学院', '2016', '软件工程', '1', '44F468A9FFFF9E7BB9AC4CA86F083B19', null);
INSERT INTO `students` VALUES ('479', '201610098478', '478', '计算机工程学院', '2016', '软件工程', '1', '6D20AB4BD6A56E70CC04217CC44884EA', null);
INSERT INTO `students` VALUES ('480', '201610098479', '479', '计算机工程学院', '2016', '软件工程', '1', 'CC250A49A981391C87BE10DCC4511DB1', null);
INSERT INTO `students` VALUES ('481', '201610098480', '480', '计算机工程学院', '2016', '软件工程', '1', '81D9C4FAB8639B360654F30F28E82CC6', null);
INSERT INTO `students` VALUES ('482', '201610098481', '481', '计算机工程学院', '2016', '软件工程', '1', '07FB2C68590C394711FC374770C160E1', null);
INSERT INTO `students` VALUES ('483', '201610098482', '482', '计算机工程学院', '2016', '软件工程', '1', 'C63387FBA0BACE49D030869DA5A6BC2C', null);
INSERT INTO `students` VALUES ('484', '201610098483', '483', '计算机工程学院', '2016', '软件工程', '1', 'C55C8E9770DF10E335DC7F2F2D148C19', null);
INSERT INTO `students` VALUES ('485', '201610098484', '484', '计算机工程学院', '2016', '软件工程', '1', 'F4CD3BA78F6B7C89FC233F68187B48CE', null);
INSERT INTO `students` VALUES ('486', '201610098485', '485', '计算机工程学院', '2016', '软件工程', '1', '4AD708F7A6A8A64A040D6EE62EEC4D32', null);
INSERT INTO `students` VALUES ('487', '201610098486', '486', '计算机工程学院', '2016', '软件工程', '1', '0F2DAEF98482A1C8B2121431CB454883', null);
INSERT INTO `students` VALUES ('488', '201610098487', '487', '计算机工程学院', '2016', '软件工程', '1', '518ADE4DB4A3222123ABBE9767891A0D', null);
INSERT INTO `students` VALUES ('489', '201610098488', '488', '计算机工程学院', '2016', '软件工程', '1', '8D05C76315ECFFCF3831B1D9798EB1E5', null);
INSERT INTO `students` VALUES ('490', '201610098489', '489', '计算机工程学院', '2016', '软件工程', '1', '1E6F9B3806190AEBFCBB619D5F65BF3C', null);
INSERT INTO `students` VALUES ('491', '201610098490', '490', '计算机工程学院', '2016', '软件工程', '1', '82A466B408422CBEAC91BDEEEC5EE2BE', null);
INSERT INTO `students` VALUES ('492', '201610098491', '491', '计算机工程学院', '2016', '软件工程', '1', 'FDE44F341C5F71B9C04C354B8CC74FD8', null);
INSERT INTO `students` VALUES ('493', '201610098492', '492', '计算机工程学院', '2016', '软件工程', '1', 'D8A092DF434EDEB09C56097D4EDD0E0D', null);
INSERT INTO `students` VALUES ('494', '201610098493', '493', '计算机工程学院', '2016', '软件工程', '1', 'B717EC22073A87FACB7C39209F6FDF9F', null);
INSERT INTO `students` VALUES ('495', '201610098494', '494', '计算机工程学院', '2016', '软件工程', '1', 'F6B0CDA14E45590580D8CF3BFC2D9B5E', null);
INSERT INTO `students` VALUES ('496', '201610098495', '495', '计算机工程学院', '2016', '软件工程', '1', '246E827F3683E5217EED74AAF806F889', null);
INSERT INTO `students` VALUES ('497', '201610098496', '496', '计算机工程学院', '2016', '软件工程', '1', '955E592F19A1D263DC4104CBEFC68060', null);
INSERT INTO `students` VALUES ('498', '201610098497', '497', '计算机工程学院', '2016', '软件工程', '1', '07803B4350E9596E87F3B53E99DCB0F8', null);
INSERT INTO `students` VALUES ('499', '201610098498', '498', '计算机工程学院', '2016', '软件工程', '1', '42A84649D08AED565CC7ECE13A56D372', null);
INSERT INTO `students` VALUES ('500', '201610098499', '499', '计算机工程学院', '2016', '软件工程', '1', 'A4F510F2F6AFD5835AFB12C42BCF8F35', null);
INSERT INTO `students` VALUES ('501', '201610098500', '500', '计算机工程学院', '2016', '软件工程', '3', '9F3A6431BA57CDF5F9B4ADB38FBC7C7E', null);
INSERT INTO `students` VALUES ('502', '201610098501', '501', '计算机工程学院', '2016', '软件工程', '3', '853A4051F7FA2321417C0260C77A314B', null);
INSERT INTO `students` VALUES ('503', '201610098502', '502', '计算机工程学院', '2016', '软件工程', '3', '585255B0A9851F2656A35E1E0F5198B1', null);
INSERT INTO `students` VALUES ('504', '201610098503', '503', '计算机工程学院', '2016', '软件工程', '3', '34E7D241F44F648E820A652F0E0272D8', null);
INSERT INTO `students` VALUES ('505', '201610098504', '504', '计算机工程学院', '2016', '软件工程', '3', '3EE5992A2A6342BD06428C1F39E50DCC', null);
INSERT INTO `students` VALUES ('506', '201610098505', '505', '计算机工程学院', '2016', '软件工程', '3', '924D72AFD12168B13E63ED54B449ED74', null);
INSERT INTO `students` VALUES ('507', '201610098506', '506', '计算机工程学院', '2016', '软件工程', '3', 'F015EB98CCEEC4A10F4E6DDA5BEC08B7', null);
INSERT INTO `students` VALUES ('508', '201610098507', '507', '计算机工程学院', '2016', '软件工程', '3', 'AB0873C69789AC7A958E5BE9CE78352E', null);
INSERT INTO `students` VALUES ('509', '201610098508', '508', '计算机工程学院', '2016', '软件工程', '3', '4ED95629E468C3D9C8D734936259DDD5', null);
INSERT INTO `students` VALUES ('510', '201610098509', '509', '计算机工程学院', '2016', '软件工程', '3', '2040D65DA8B8D7225E1ABF36BF294279', null);
INSERT INTO `students` VALUES ('511', '201610098510', '510', '计算机工程学院', '2016', '软件工程', '3', '968168A4487D28B046B3AEC6F7B83ADD', null);
INSERT INTO `students` VALUES ('512', '201610098511', '511', '计算机工程学院', '2016', '软件工程', '3', 'E1A34648393D3E56EFBB8A9713D7C856', null);
INSERT INTO `students` VALUES ('513', '201610098512', '512', '计算机工程学院', '2016', '软件工程', '3', 'E1FAE2782A4B1012FFC153F92BF39DA2', null);
INSERT INTO `students` VALUES ('514', '201610098513', '513', '计算机工程学院', '2016', '软件工程', '3', 'BDB9B24942B3FECF57F1B924BE01A21A', null);
INSERT INTO `students` VALUES ('515', '201610098514', '514', '计算机工程学院', '2016', '软件工程', '3', '261BD48E858115C010B3F5180F111A42', null);
INSERT INTO `students` VALUES ('516', '201610098515', '515', '计算机工程学院', '2016', '软件工程', '3', 'A4A20CA3BAA0466A6946F14E0D40291D', null);
INSERT INTO `students` VALUES ('517', '201610098516', '516', '计算机工程学院', '2016', '软件工程', '3', '297D7AF09681780C82041393EB61FB6A', null);
INSERT INTO `students` VALUES ('518', '201610098517', '517', '计算机工程学院', '2016', '软件工程', '3', '7CE390EC0BD4B0871A8EC99260FE58C8', null);
INSERT INTO `students` VALUES ('519', '201610098518', '518', '计算机工程学院', '2016', '软件工程', '3', '3FBB76EFCC2ED38038EEEBFB1ECE2AC8', null);
INSERT INTO `students` VALUES ('520', '201610098519', '519', '计算机工程学院', '2016', '软件工程', '3', '002B3A324E36E93BD89171EFFD830090', null);
INSERT INTO `students` VALUES ('521', '201610098520', '520', '计算机工程学院', '2016', '软件工程', '3', '64FFB748481107FE8F0EF317D2DB99B7', null);
INSERT INTO `students` VALUES ('522', '201610098521', '521', '计算机工程学院', '2016', '软件工程', '3', '960EA86EBC50502FC526C0B95ECC5C3B', null);
INSERT INTO `students` VALUES ('523', '201610098522', '522', '计算机工程学院', '2016', '软件工程', '3', 'F355502B88A4FAFBCA8ADE7D3399F0B3', null);
INSERT INTO `students` VALUES ('524', '201610098523', '523', '计算机工程学院', '2016', '软件工程', '3', '508168B36A05FBF2846EA415A75B1019', null);
INSERT INTO `students` VALUES ('525', '201610098524', '524', '计算机工程学院', '2016', '软件工程', '3', 'FA9FA865AE0E6CFD2EA18643C45480C8', null);
INSERT INTO `students` VALUES ('526', '201610098525', '525', '计算机工程学院', '2016', '软件工程', '3', '3E717159F4068D73DC39DCE6B4609150', null);
INSERT INTO `students` VALUES ('527', '201610098526', '526', '计算机工程学院', '2016', '软件工程', '3', 'BE7EC2D5858ECEA9DF943E5469C859FE', null);
INSERT INTO `students` VALUES ('528', '201610098527', '527', '计算机工程学院', '2016', '软件工程', '3', '1C702CDE04A1408B15B616F70870833B', null);
INSERT INTO `students` VALUES ('529', '201610098528', '528', '计算机工程学院', '2016', '软件工程', '3', 'D6904939F86F4B2DA87F51F38C6EBE64', null);
INSERT INTO `students` VALUES ('530', '201610098529', '529', '计算机工程学院', '2016', '软件工程', '3', '1DED12F9CFCCE7C527245A8C2BE37076', null);
INSERT INTO `students` VALUES ('531', '201610098530', '530', '计算机工程学院', '2016', '软件工程', '3', 'EDB8273A630E12A5EA757146373DF340', null);
INSERT INTO `students` VALUES ('532', '201610098531', '531', '计算机工程学院', '2016', '软件工程', '3', '04A1AF28729F263D3E94918C14F26A88', null);
INSERT INTO `students` VALUES ('533', '201610098532', '532', '计算机工程学院', '2016', '软件工程', '3', '26EB961B83B66DFECDF026FBE8B83BDA', null);
INSERT INTO `students` VALUES ('534', '201610098533', '533', '计算机工程学院', '2016', '软件工程', '3', '3F5D5D3D420515EDABCE43DFF7CD321B', null);
INSERT INTO `students` VALUES ('535', '201610098534', '534', '计算机工程学院', '2016', '软件工程', '3', 'E802324A480EE28A087A374E0AFC6730', null);
INSERT INTO `students` VALUES ('536', '201610098535', '535', '计算机工程学院', '2016', '软件工程', '3', '3EBA0B297C8B2E4E0A3C9AC91F5F742C', null);
INSERT INTO `students` VALUES ('537', '201610098536', '536', '计算机工程学院', '2016', '软件工程', '3', '026B127D7EBA87FA4094A6CC5B727D16', null);
INSERT INTO `students` VALUES ('538', '201610098537', '537', '计算机工程学院', '2016', '软件工程', '3', 'A47F2E6F8C75EF3912CEFDE84CC71A65', null);
INSERT INTO `students` VALUES ('539', '201610098538', '538', '计算机工程学院', '2016', '软件工程', '3', 'A7A864091D303B6A8D0DDC1E9F8B7C15', null);
INSERT INTO `students` VALUES ('540', '201610098539', '539', '计算机工程学院', '2016', '软件工程', '3', '3E271618C336A28B10D514521F4D85C3', null);
INSERT INTO `students` VALUES ('541', '201610098540', '540', '计算机工程学院', '2016', '软件工程', '3', '6AADF712692412E55157B29F00582CD8', null);
INSERT INTO `students` VALUES ('542', '201610098541', '541', '计算机工程学院', '2016', '软件工程', '3', 'E4AF50073BEB20AB0406BB0F63D82114', null);
INSERT INTO `students` VALUES ('543', '201610098542', '542', '计算机工程学院', '2016', '软件工程', '3', 'D951BAB60AEFFFB949E4F52C4D9853D5', null);
INSERT INTO `students` VALUES ('544', '201610098543', '543', '计算机工程学院', '2016', '软件工程', '3', '193605A116C342C1E1644463DDEB9156', null);
INSERT INTO `students` VALUES ('545', '201610098544', '544', '计算机工程学院', '2016', '软件工程', '3', 'AFE9385AA32A217F5E9EB49D6270A58C', null);
INSERT INTO `students` VALUES ('546', '201610098545', '545', '计算机工程学院', '2016', '软件工程', '3', 'B3479618429479FABE47E1F682E4C4FB', null);
INSERT INTO `students` VALUES ('547', '201610098546', '546', '计算机工程学院', '2016', '软件工程', '3', '4C82D5DB27816F07B4897403A40B9F35', null);
INSERT INTO `students` VALUES ('548', '201610098547', '547', '计算机工程学院', '2016', '软件工程', '3', 'CA9F5ED144BBB48FD56F10B835493ABE', null);
INSERT INTO `students` VALUES ('549', '201610098548', '548', '计算机工程学院', '2016', '软件工程', '3', '15B5E1BA3ECA72F9D3978BF2712AEC93', null);
INSERT INTO `students` VALUES ('550', '201610098549', '549', '计算机工程学院', '2016', '软件工程', '3', 'F7511605D0A96AA9FF9E3C5ADF234AF3', null);
INSERT INTO `students` VALUES ('551', '201610098550', '550', '计算机工程学院', '2016', '软件工程', '3', '1EFCA7FF64B6FBD93EB32B010AA88896', null);
INSERT INTO `students` VALUES ('552', '201610098551', '551', '计算机工程学院', '2016', '软件工程', '3', '5AA066E24ECF903D249D12586617C9B3', null);
INSERT INTO `students` VALUES ('553', '201610098552', '552', '计算机工程学院', '2016', '软件工程', '3', '4233E97ABE1BDBAF535898C5D24ED398', null);
INSERT INTO `students` VALUES ('554', '201610098553', '553', '计算机工程学院', '2016', '软件工程', '3', 'C095C5D632E142F9426FFA371AA38360', null);
INSERT INTO `students` VALUES ('555', '201610098554', '554', '计算机工程学院', '2016', '软件工程', '3', 'B2FEC0119C7EA13DA0D4E3B42534739D', null);
INSERT INTO `students` VALUES ('556', '201610098555', '555', '计算机工程学院', '2016', '软件工程', '3', '654190A15DEDD43D8FB1D50F7C626236', null);
INSERT INTO `students` VALUES ('557', '201610098556', '556', '计算机工程学院', '2016', '软件工程', '3', 'EA8876B20E1230B7DEE996C97188D950', null);
INSERT INTO `students` VALUES ('558', '201610098557', '557', '计算机工程学院', '2016', '软件工程', '3', '93CFD2D95722FE58FBD7EF005B7EBF88', null);
INSERT INTO `students` VALUES ('559', '201610098558', '558', '计算机工程学院', '2016', '软件工程', '3', 'E4003999E027C7B09ECB0CA3B1A56042', null);
INSERT INTO `students` VALUES ('560', '201610098559', '559', '计算机工程学院', '2016', '软件工程', '3', 'A19DD37788FC3CA87305939353B3190C', null);
INSERT INTO `students` VALUES ('561', '201610098560', '560', '计算机工程学院', '2016', '软件工程', '3', 'BE128C167F303A2B3F8D77DDFCD0CD06', null);
INSERT INTO `students` VALUES ('562', '201610098561', '561', '计算机工程学院', '2016', '软件工程', '3', '667696D9272112B9BB0874D24398E9BC', null);
INSERT INTO `students` VALUES ('563', '201610098562', '562', '计算机工程学院', '2016', '软件工程', '3', '084BBC372E3F6C49B91BDD2F4A05E5F7', null);
INSERT INTO `students` VALUES ('564', '201610098563', '563', '计算机工程学院', '2016', '软件工程', '3', '3A2C0AE00246945BE52462C7DFEDD8DD', null);
INSERT INTO `students` VALUES ('565', '201610098564', '564', '计算机工程学院', '2016', '软件工程', '3', 'BF1F5F4D570EE155B6CD7E29305C6BD6', null);
INSERT INTO `students` VALUES ('566', '201610098565', '565', '计算机工程学院', '2016', '软件工程', '3', 'DA435F2DE4AD3F455A4CDE03467A40B3', null);
INSERT INTO `students` VALUES ('567', '201610098566', '566', '计算机工程学院', '2016', '软件工程', '3', '4C6124F946DBF84D503C0D7D8E038ECC', null);
INSERT INTO `students` VALUES ('568', '201610098567', '567', '计算机工程学院', '2016', '软件工程', '3', 'F830395F308ADBF144802C2E0B4203C0', null);
INSERT INTO `students` VALUES ('569', '201610098568', '568', '计算机工程学院', '2016', '软件工程', '3', 'EA2B20021E10191B52733D0BFE82A37F', null);
INSERT INTO `students` VALUES ('570', '201610098569', '569', '计算机工程学院', '2016', '软件工程', '3', '67653495FA5EB3D56FC50273419605CC', null);
INSERT INTO `students` VALUES ('571', '201610098570', '570', '计算机工程学院', '2016', '软件工程', '3', '1936310E98DC68F91D7B7384D77A5CAE', null);
INSERT INTO `students` VALUES ('572', '201610098571', '571', '计算机工程学院', '2016', '软件工程', '3', 'C201456E8F3A913D35F79651F67D8EA0', null);
INSERT INTO `students` VALUES ('573', '201610098572', '572', '计算机工程学院', '2016', '软件工程', '3', '79FA3E4283C32F072D49F8CED7730A63', null);
INSERT INTO `students` VALUES ('574', '201610098573', '573', '计算机工程学院', '2016', '软件工程', '3', '040DA35DD05A97267222CD8851AF882E', null);
INSERT INTO `students` VALUES ('575', '201610098574', '574', '计算机工程学院', '2016', '软件工程', '3', '8C579FF3497FB5BDEA2931C101FE1AE6', null);
INSERT INTO `students` VALUES ('576', '201610098575', '575', '计算机工程学院', '2016', '软件工程', '3', 'C65655000E51ED58E3B0C49ED954908C', null);
INSERT INTO `students` VALUES ('577', '201610098576', '576', '计算机工程学院', '2016', '软件工程', '3', 'BDED7CFEC99B3A76882DE666DC62C5DB', null);
INSERT INTO `students` VALUES ('578', '201610098577', '577', '计算机工程学院', '2016', '软件工程', '3', 'F3B2B8DA4AA741B81DC0BD588E82B6EA', null);
INSERT INTO `students` VALUES ('579', '201610098578', '578', '计算机工程学院', '2016', '软件工程', '3', '33A6A2F7E7BE5648679B7F8B9939E7EE', null);
INSERT INTO `students` VALUES ('580', '201610098579', '579', '计算机工程学院', '2016', '软件工程', '3', '346636521133DB6F8275CA29734F4D6D', null);
INSERT INTO `students` VALUES ('581', '201610098580', '580', '计算机工程学院', '2016', '软件工程', '3', 'CAD9AA0B3A99984127AF1A49590DE794', null);
INSERT INTO `students` VALUES ('582', '201610098581', '581', '计算机工程学院', '2016', '软件工程', '3', 'EDCEAA2050847D5EE3C8AD6A723E8F9D', null);
INSERT INTO `students` VALUES ('583', '201610098582', '582', '计算机工程学院', '2016', '软件工程', '3', '4E42CEA19E84A3B19798A58CE948D23D', null);
INSERT INTO `students` VALUES ('584', '201610098583', '583', '计算机工程学院', '2016', '软件工程', '3', '610FF473586F93532D1ACAE60F7F82A1', null);
INSERT INTO `students` VALUES ('585', '201610098584', '584', '计算机工程学院', '2016', '软件工程', '3', 'F82508A6608A751D226A3BC649D9208E', null);
INSERT INTO `students` VALUES ('586', '201610098585', '585', '计算机工程学院', '2016', '软件工程', '3', 'E1FAFBEB4D93F7C7BF111171FBF9456D', null);
INSERT INTO `students` VALUES ('587', '201610098586', '586', '计算机工程学院', '2016', '软件工程', '3', 'F339127FC07EFE7F9719FE39C4199BD9', null);
INSERT INTO `students` VALUES ('588', '201610098587', '587', '计算机工程学院', '2016', '软件工程', '3', '1C85736CBAA7898D6D4ED0DC19A5F84E', null);
INSERT INTO `students` VALUES ('589', '201610098588', '588', '计算机工程学院', '2016', '软件工程', '3', '10B7EE6B332A8BC940DA060E7D592D3D', null);
INSERT INTO `students` VALUES ('590', '201610098589', '589', '计算机工程学院', '2016', '软件工程', '3', '27E75B8371C50AA2C40AF5D1FC6B6E52', null);
INSERT INTO `students` VALUES ('591', '201610098590', '590', '计算机工程学院', '2016', '软件工程', '3', '1FA576CBF70569CBE0E6D734FF7F9C19', null);
INSERT INTO `students` VALUES ('592', '201610098591', '591', '计算机工程学院', '2016', '软件工程', '3', 'E92337ABFE6C07C0CFE7589E0ABF316E', null);
INSERT INTO `students` VALUES ('593', '201610098592', '592', '计算机工程学院', '2016', '软件工程', '3', '1CF854EA974421E72A5B131F72A63092', null);
INSERT INTO `students` VALUES ('594', '201610098593', '593', '计算机工程学院', '2016', '软件工程', '3', 'FFEBB4909DA14EB3FB2A2C3D808A32D6', null);
INSERT INTO `students` VALUES ('595', '201610098594', '594', '计算机工程学院', '2016', '软件工程', '3', '9B8EF00149D2974B2BEB7190A234E34A', null);
INSERT INTO `students` VALUES ('596', '201610098595', '595', '计算机工程学院', '2016', '软件工程', '3', '7E80927531F83CD05842DE7B4032C36A', null);
INSERT INTO `students` VALUES ('597', '201610098596', '596', '计算机工程学院', '2016', '软件工程', '3', 'AFCEE81CF2DC0002E5D299C7CEEEE5E4', null);
INSERT INTO `students` VALUES ('598', '201610098597', '597', '计算机工程学院', '2016', '软件工程', '3', '9471B61453A432163AE237CA8544A1FA', null);
INSERT INTO `students` VALUES ('599', '201610098598', '598', '计算机工程学院', '2016', '软件工程', '3', '3D6C29E01AD6C518AADB5FC96D51C85D', null);
INSERT INTO `students` VALUES ('600', '201610098599', '599', '计算机工程学院', '2016', '软件工程', '3', '96BE67403CFF4D789853FE925DBB7FD2', null);
INSERT INTO `students` VALUES ('601', '201610098600', '600', '计算机工程学院', '2016', '软件工程', '3', '73AFC747827953506381CC07D5B1FDFF', null);
INSERT INTO `students` VALUES ('602', '201610098601', '601', '计算机工程学院', '2016', '软件工程', '3', '7D51A4BB657E7ACFE26D7B92EBF04B3D', null);
INSERT INTO `students` VALUES ('603', '201610098602', '602', '计算机工程学院', '2016', '软件工程', '3', 'EF1143E88B69081EB50A0D27F0B43F42', null);
INSERT INTO `students` VALUES ('604', '201610098603', '603', '计算机工程学院', '2016', '软件工程', '3', '9691577D0092EAE77329CFA6F33BAB63', null);
INSERT INTO `students` VALUES ('605', '201610098604', '604', '计算机工程学院', '2016', '软件工程', '3', '7A1C148F327DA579B0895F7246A985E8', null);
INSERT INTO `students` VALUES ('606', '201610098605', '605', '计算机工程学院', '2016', '软件工程', '3', 'C4A4DB00CA1B726772ABF6CF6026F48A', null);
INSERT INTO `students` VALUES ('607', '201610098606', '606', '计算机工程学院', '2016', '软件工程', '3', 'A391C6C9F772191F869ED4689BC08EB5', null);
INSERT INTO `students` VALUES ('608', '201610098607', '607', '计算机工程学院', '2016', '软件工程', '3', '4CADBD817E0BC0BFB1A6C58B5A96D6BE', null);
INSERT INTO `students` VALUES ('609', '201610098608', '608', '计算机工程学院', '2016', '软件工程', '3', '3DFB9CFC8882D39E1FF70E37BBC975D9', null);
INSERT INTO `students` VALUES ('610', '201610098609', '609', '计算机工程学院', '2016', '软件工程', '3', '948586FBE073BB71BF0499BD24635428', null);
INSERT INTO `students` VALUES ('611', '201610098610', '610', '计算机工程学院', '2016', '软件工程', '3', '71972ECEECDDD4E3C9F8DABBE258536F', null);
INSERT INTO `students` VALUES ('612', '201610098611', '611', '计算机工程学院', '2016', '软件工程', '3', '2FF6E83CEB4DC6DA4DAF5ED3AF2E4CFD', null);
INSERT INTO `students` VALUES ('613', '201610098612', '612', '计算机工程学院', '2016', '软件工程', '3', '3D34CA50535381A6FD714D342A969F20', null);
INSERT INTO `students` VALUES ('614', '201610098613', '613', '计算机工程学院', '2016', '软件工程', '3', '47565D3C6DD314D045F57DBB0C94A8FA', null);
INSERT INTO `students` VALUES ('615', '201610098614', '614', '计算机工程学院', '2016', '软件工程', '3', 'D617281F4320C0AFDB6F31A2E3203F79', null);
INSERT INTO `students` VALUES ('616', '201610098615', '615', '计算机工程学院', '2016', '软件工程', '3', 'DFC94337D72216959D3DA6FF9D2DE834', null);
INSERT INTO `students` VALUES ('617', '201610098616', '616', '计算机工程学院', '2016', '软件工程', '3', 'D747630A78733DDA25106E974BF69D86', null);
INSERT INTO `students` VALUES ('618', '201610098617', '617', '计算机工程学院', '2016', '软件工程', '3', '177DDE37601FE82F5DFD7B4040F686BE', null);
INSERT INTO `students` VALUES ('619', '201610098618', '618', '计算机工程学院', '2016', '软件工程', '3', '685219E3CBBD0243431179F66ED6852C', null);
INSERT INTO `students` VALUES ('620', '201610098619', '619', '计算机工程学院', '2016', '软件工程', '3', '27832472EE1A295FE83986C957B0F8B7', null);
INSERT INTO `students` VALUES ('621', '201610098620', '620', '计算机工程学院', '2016', '软件工程', '3', '050A4FC7C5DB76245D79327E8308C7FC', null);
INSERT INTO `students` VALUES ('622', '201610098621', '621', '计算机工程学院', '2016', '软件工程', '3', 'B184DC6BCC57B1FC7D38351B42B9ECF4', null);
INSERT INTO `students` VALUES ('623', '201610098622', '622', '计算机工程学院', '2016', '软件工程', '3', '947C72A8E6932EFB8649E10BE09CD627', null);
INSERT INTO `students` VALUES ('624', '201610098623', '623', '计算机工程学院', '2016', '软件工程', '3', '36C7FDFAD7DCB8646BCEA386A62E5AB4', null);
INSERT INTO `students` VALUES ('625', '201610098624', '624', '计算机工程学院', '2016', '软件工程', '3', 'FF06DB9ADFA8EA8F0F37BC3E2A721F26', null);
INSERT INTO `students` VALUES ('626', '201610098625', '625', '计算机工程学院', '2016', '软件工程', '3', '98247A46FEF5556AAEEADA923C6BF731', null);
INSERT INTO `students` VALUES ('627', '201610098626', '626', '计算机工程学院', '2016', '软件工程', '3', 'E61E1C2E6016E5C55EA766C7B9399418', null);
INSERT INTO `students` VALUES ('628', '201610098627', '627', '计算机工程学院', '2016', '软件工程', '3', '0B8C551E1B53AAA87FB9E18C0CE49B5D', null);
INSERT INTO `students` VALUES ('629', '201610098628', '628', '计算机工程学院', '2016', '软件工程', '3', 'DABB87489A97EE0FC6322C76042A8C63', null);
INSERT INTO `students` VALUES ('630', '201610098629', '629', '计算机工程学院', '2016', '软件工程', '3', 'EA3A6451755091972225EF00CA6BED45', null);
INSERT INTO `students` VALUES ('631', '201610098630', '630', '计算机工程学院', '2016', '软件工程', '3', '3FC5B2E04383A2652B2F036E10402C7F', null);
INSERT INTO `students` VALUES ('632', '201610098631', '631', '计算机工程学院', '2016', '软件工程', '3', '4CC7BD48B7162C7AFD7955B1C8E1415D', null);
INSERT INTO `students` VALUES ('633', '201610098632', '632', '计算机工程学院', '2016', '软件工程', '3', 'BA1A7AA47A9359522C3DB8747C84ACB2', null);
INSERT INTO `students` VALUES ('634', '201610098633', '633', '计算机工程学院', '2016', '软件工程', '3', '6F18D87A43CC9943428D645C57D696AE', null);
INSERT INTO `students` VALUES ('635', '201610098634', '634', '计算机工程学院', '2016', '软件工程', '3', '5A71ED6221E70D873309416C2D9C5158', null);
INSERT INTO `students` VALUES ('636', '201610098635', '635', '计算机工程学院', '2016', '软件工程', '3', 'AD51E721F7BCCF8BF2F5D6ED7B72B619', null);
INSERT INTO `students` VALUES ('637', '201610098636', '636', '计算机工程学院', '2016', '软件工程', '3', '8F5D3446CF3E83A79E198F3DCBEFF3C0', null);
INSERT INTO `students` VALUES ('638', '201610098637', '637', '计算机工程学院', '2016', '软件工程', '3', '82DEA2B651E04CCE9D85B73B10EEF203', null);
INSERT INTO `students` VALUES ('639', '201610098638', '638', '计算机工程学院', '2016', '软件工程', '3', '2467A65D9DAEECD7BE87CCFDA21ECD03', null);
INSERT INTO `students` VALUES ('640', '201610098639', '639', '计算机工程学院', '2016', '软件工程', '3', '78A0ED2D22C6156F2CA64A744F6EA5BD', null);
INSERT INTO `students` VALUES ('641', '201610098640', '640', '计算机工程学院', '2016', '软件工程', '3', 'BD2BD7F7F9E0E32476264EDC2FEB66F3', null);
INSERT INTO `students` VALUES ('642', '201610098641', '641', '计算机工程学院', '2016', '软件工程', '3', '306B3B13F05CBCEF27857DE8FDE4CF1C', null);
INSERT INTO `students` VALUES ('643', '201610098642', '642', '计算机工程学院', '2016', '软件工程', '3', '88F83B8A406D8BEA71CB447668A40841', null);
INSERT INTO `students` VALUES ('644', '201610098643', '643', '计算机工程学院', '2016', '软件工程', '3', '34BAB5B41D4BB5A946B5E1E869E68771', null);
INSERT INTO `students` VALUES ('645', '201610098644', '644', '计算机工程学院', '2016', '软件工程', '3', '3128DCA8FBD2DBFA942841EF332F9069', null);
INSERT INTO `students` VALUES ('646', '201610098645', '645', '计算机工程学院', '2016', '软件工程', '3', '5B3AB80D72F4434B07C3D86A7ED9923B', null);
INSERT INTO `students` VALUES ('647', '201610098646', '646', '计算机工程学院', '2016', '软件工程', '3', '1CDF472E4272E00BD6ABB9C057249F3E', null);
INSERT INTO `students` VALUES ('648', '201610098647', '647', '计算机工程学院', '2016', '软件工程', '3', '2D9D946DFA0D61D394E7A8F805C7B6EC', null);
INSERT INTO `students` VALUES ('649', '201610098648', '648', '计算机工程学院', '2016', '软件工程', '3', '6F727C26B2EFCDD23B96E4129FE17E99', null);
INSERT INTO `students` VALUES ('650', '201610098649', '649', '计算机工程学院', '2016', '软件工程', '3', 'E5EA36750C9D9464990BF2A9BC221885', null);
INSERT INTO `students` VALUES ('651', '201610098650', '650', '计算机工程学院', '2016', '软件工程', '3', '146D14839E0039370554776294E31B17', null);
INSERT INTO `students` VALUES ('652', '201610098651', '651', '计算机工程学院', '2016', '软件工程', '3', '49B7719F687519F19762CD412CF5A19A', null);
INSERT INTO `students` VALUES ('653', '201610098652', '652', '计算机工程学院', '2016', '软件工程', '3', 'F2D2AB0B41CE066094EE70AC57743D6B', null);
INSERT INTO `students` VALUES ('654', '201610098653', '653', '计算机工程学院', '2016', '软件工程', '3', '79858D081B3374A1CA0459DB16427CF1', null);
INSERT INTO `students` VALUES ('655', '201610098654', '654', '计算机工程学院', '2016', '软件工程', '3', 'EB39F9315CD08ABF2D9F3F08E4C39205', null);
INSERT INTO `students` VALUES ('656', '201610098655', '655', '计算机工程学院', '2016', '软件工程', '3', 'DDAF8A2D0168FA2AA8FBD8814D33ADBE', null);
INSERT INTO `students` VALUES ('657', '201610098656', '656', '计算机工程学院', '2016', '软件工程', '3', '94ABC1FC949AAEBB816015A3FAAB28A2', null);
INSERT INTO `students` VALUES ('658', '201610098657', '657', '计算机工程学院', '2016', '软件工程', '3', '5E8D32116D65248CEE1AB90CE6303524', null);
INSERT INTO `students` VALUES ('659', '201610098658', '658', '计算机工程学院', '2016', '软件工程', '3', 'D7514C7BEB73B563994D85C2DECD42D7', null);
INSERT INTO `students` VALUES ('660', '201610098659', '659', '计算机工程学院', '2016', '软件工程', '3', '7D89F2D97ADEC843E7CC3DE779F7BB9C', null);
INSERT INTO `students` VALUES ('661', '201610098660', '660', '计算机工程学院', '2016', '软件工程', '3', 'B0084BFF1E8D767122C00B84A5B7CFB1', null);
INSERT INTO `students` VALUES ('662', '201610098661', '661', '计算机工程学院', '2016', '软件工程', '3', '63B93AE2BF3D9A32C2AA0E9BAF22EA71', null);
INSERT INTO `students` VALUES ('663', '201610098662', '662', '计算机工程学院', '2016', '软件工程', '3', '2EEBD01143DAC2D6ADCD3BACA1079D22', null);
INSERT INTO `students` VALUES ('664', '201610098663', '663', '计算机工程学院', '2016', '软件工程', '3', '8E34F47B2D921A517158EC175BFED022', null);
INSERT INTO `students` VALUES ('665', '201610098664', '664', '计算机工程学院', '2016', '软件工程', '3', 'D507EA878658DC2EF616B999B76AB077', null);
INSERT INTO `students` VALUES ('666', '201610098665', '665', '计算机工程学院', '2016', '软件工程', '3', 'A3CED1A78B168FD0BEF5E3E2E6087975', null);
INSERT INTO `students` VALUES ('667', '201610098666', '666', '计算机工程学院', '2016', '软件工程', '3', 'D4604471222A4EFEA3402DC91599A1E8', null);
INSERT INTO `students` VALUES ('668', '201610098667', '667', '计算机工程学院', '2016', '软件工程', '3', '95106ECD3345951DC15605D7205F4902', null);
INSERT INTO `students` VALUES ('669', '201610098668', '668', '计算机工程学院', '2016', '软件工程', '3', '20B7F465FEB3B9CF8DEA2406070D4461', null);
INSERT INTO `students` VALUES ('670', '201610098669', '669', '计算机工程学院', '2016', '软件工程', '3', 'DAA009BD10479811D18B31D56B2C8EF6', null);
INSERT INTO `students` VALUES ('671', '201610098670', '670', '计算机工程学院', '2016', '软件工程', '3', '27FE67F75B067DEFBEA4255CD2DD7A34', null);
INSERT INTO `students` VALUES ('672', '201610098671', '671', '计算机工程学院', '2016', '软件工程', '3', 'C46F74E6FEAD22A6B688AE979B6CA409', null);
INSERT INTO `students` VALUES ('673', '201610098672', '672', '计算机工程学院', '2016', '软件工程', '3', 'F9C2C1D2F58336DF4FEA279EB07DE0F1', null);
INSERT INTO `students` VALUES ('674', '201610098673', '673', '计算机工程学院', '2016', '软件工程', '3', '3A09612863D578E3BCCC9338D60A03A9', null);
INSERT INTO `students` VALUES ('675', '201610098674', '674', '计算机工程学院', '2016', '软件工程', '3', 'AFBA62B24A2C4987BC943D573211A963', null);
INSERT INTO `students` VALUES ('676', '201610098675', '675', '计算机工程学院', '2016', '软件工程', '3', 'CA629D01E31399078E00A340CF868450', null);
INSERT INTO `students` VALUES ('677', '201610098676', '676', '计算机工程学院', '2016', '软件工程', '3', '639A2F215CD64C4A642F7C1CFCF83980', null);
INSERT INTO `students` VALUES ('678', '201610098677', '677', '计算机工程学院', '2016', '软件工程', '3', 'E2E26FDD3887889597FC039DD5994207', null);
INSERT INTO `students` VALUES ('679', '201610098678', '678', '计算机工程学院', '2016', '软件工程', '3', 'ED38A907E064B42440CB134D329F2682', null);
INSERT INTO `students` VALUES ('680', '201610098679', '679', '计算机工程学院', '2016', '软件工程', '3', 'C97D5913F11AB1872E014EBE4A283D7D', null);
INSERT INTO `students` VALUES ('681', '201610098680', '680', '计算机工程学院', '2016', '软件工程', '3', '763CAB90A419482E81240F20995B0DC8', null);
INSERT INTO `students` VALUES ('682', '201610098681', '681', '计算机工程学院', '2016', '软件工程', '3', '63BF52F1448C853131B8EAF9D610D973', null);
INSERT INTO `students` VALUES ('683', '201610098682', '682', '计算机工程学院', '2016', '软件工程', '3', 'AF3AB32C25F0BCE5F7D4FECC434E77A8', null);
INSERT INTO `students` VALUES ('684', '201610098683', '683', '计算机工程学院', '2016', '软件工程', '3', 'C721982B9967B019618A11D0302871C3', null);
INSERT INTO `students` VALUES ('685', '201610098684', '684', '计算机工程学院', '2016', '软件工程', '3', '99369F0A59FF2EB97B9851CD728CB21F', null);
INSERT INTO `students` VALUES ('686', '201610098685', '685', '计算机工程学院', '2016', '软件工程', '3', 'F8F3AE576CE394BA9AA4BDAA6BDEA0BA', null);
INSERT INTO `students` VALUES ('687', '201610098686', '686', '计算机工程学院', '2016', '软件工程', '3', 'D3CF7325D168AE570FB163E580B85987', null);
INSERT INTO `students` VALUES ('688', '201610098687', '687', '计算机工程学院', '2016', '软件工程', '3', '9FAF3108CF8FF661878F0DDD33129140', null);
INSERT INTO `students` VALUES ('689', '201610098688', '688', '计算机工程学院', '2016', '软件工程', '3', 'B564461DB20A5BCEEC63DA1922458553', null);
INSERT INTO `students` VALUES ('690', '201610098689', '689', '计算机工程学院', '2016', '软件工程', '3', 'AFDD4B13703E5FD750A691426BB3329B', null);
INSERT INTO `students` VALUES ('691', '201610098690', '690', '计算机工程学院', '2016', '软件工程', '3', 'EAC2B81E97BA26BE757551F29CF3C79B', null);
INSERT INTO `students` VALUES ('692', '201610098691', '691', '计算机工程学院', '2016', '软件工程', '3', '837CB8FF67043EE6E003C71BD8199A05', null);
INSERT INTO `students` VALUES ('693', '201610098692', '692', '计算机工程学院', '2016', '软件工程', '3', '0F88270E90460986EA6A0F2DADAA8118', null);
INSERT INTO `students` VALUES ('694', '201610098693', '693', '计算机工程学院', '2016', '软件工程', '3', '177DEB3DC86B997AF6FF2670C3B2867B', null);
INSERT INTO `students` VALUES ('695', '201610098694', '694', '计算机工程学院', '2016', '软件工程', '3', 'B38AD667B4F2D297C26938BF40659CFF', null);
INSERT INTO `students` VALUES ('696', '201610098695', '695', '计算机工程学院', '2016', '软件工程', '3', '5270CABF6331D3E3790C846DDF7C5507', null);
INSERT INTO `students` VALUES ('697', '201610098696', '696', '计算机工程学院', '2016', '软件工程', '3', 'D6BD4080F1A0E5A618C04061A811B05F', null);
INSERT INTO `students` VALUES ('698', '201610098697', '697', '计算机工程学院', '2016', '软件工程', '3', 'AD24969E9CF10E9742CF6F552B393EAD', null);
INSERT INTO `students` VALUES ('699', '201610098698', '698', '计算机工程学院', '2016', '软件工程', '3', '259DF86E309F6246EDDACD8FABDF778C', null);
INSERT INTO `students` VALUES ('700', '201610098699', '699', '计算机工程学院', '2016', '软件工程', '3', 'C2064D2BB47A301BFFA281AE1DFF91C4', null);
INSERT INTO `students` VALUES ('701', '201610098700', '700', '计算机工程学院', '2016', '软件工程', '2', '10268EDBA8E7659246553825A6C2B244', null);
INSERT INTO `students` VALUES ('702', '201610098701', '701', '计算机工程学院', '2016', '软件工程', '2', 'C912B42F5CE3CD975FD9828D324B6296', null);
INSERT INTO `students` VALUES ('703', '201610098702', '702', '计算机工程学院', '2016', '软件工程', '2', '07DFACCBA7F121E369891A8220D28005', null);
INSERT INTO `students` VALUES ('704', '201610098703', '703', '计算机工程学院', '2016', '软件工程', '2', '65BAF132F844E8A4A38CC0CD6B386826', null);
INSERT INTO `students` VALUES ('705', '201610098704', '704', '计算机工程学院', '2016', '软件工程', '2', '364F20401AA6559A76BCDF124E9B6245', null);
INSERT INTO `students` VALUES ('706', '201610098705', '705', '计算机工程学院', '2016', '软件工程', '2', '0BF1A4CB6230F91B44795E0F6557735A', null);
INSERT INTO `students` VALUES ('707', '201610098706', '706', '计算机工程学院', '2016', '软件工程', '2', 'D067CBB1D530E585CBEFDF73E6B96482', null);
INSERT INTO `students` VALUES ('708', '201610098707', '707', '计算机工程学院', '2016', '软件工程', '2', 'D6018169530C638F215DEEDA1FB78FC9', null);
INSERT INTO `students` VALUES ('709', '201610098708', '708', '计算机工程学院', '2016', '软件工程', '2', 'B735F2A4A34BF02EB970953ECD31AC20', null);
INSERT INTO `students` VALUES ('710', '201610098709', '709', '计算机工程学院', '2016', '软件工程', '2', 'D85D375CE77553D3881CA69E0167EEEE', null);
INSERT INTO `students` VALUES ('711', '201610098710', '710', '计算机工程学院', '2016', '软件工程', '2', '554FB262CD6943A37B7F3224DD07451B', null);
INSERT INTO `students` VALUES ('712', '201610098711', '711', '计算机工程学院', '2016', '软件工程', '2', '819B5B9758BC3E34FCCF3C0F01CC3DBB', null);
INSERT INTO `students` VALUES ('713', '201610098712', '712', '计算机工程学院', '2016', '软件工程', '2', '4B33821DFC9221CA377CA77EEAB4FCB6', null);
INSERT INTO `students` VALUES ('714', '201610098713', '713', '计算机工程学院', '2016', '软件工程', '2', 'D0889B0CCADFFCCD5A5A47B4AF4EAE1B', null);
INSERT INTO `students` VALUES ('715', '201610098714', '714', '计算机工程学院', '2016', '软件工程', '2', '97771BB4FC5DA0C357AF37BB3AD3E656', null);
INSERT INTO `students` VALUES ('716', '201610098715', '715', '计算机工程学院', '2016', '软件工程', '2', 'CB84E2A533C52568DC9BD5657A3C8290', null);
INSERT INTO `students` VALUES ('717', '201610098716', '716', '计算机工程学院', '2016', '软件工程', '2', '5DA982F73BF9671230500971944B7305', null);
INSERT INTO `students` VALUES ('718', '201610098717', '717', '计算机工程学院', '2016', '软件工程', '2', '1B718AC4BB0FA3025DD7B9E292BD28DE', null);
INSERT INTO `students` VALUES ('719', '201610098718', '718', '计算机工程学院', '2016', '软件工程', '2', '2AFC296A5D8C46A6616313B87E9A4B2E', null);
INSERT INTO `students` VALUES ('720', '201610098719', '719', '计算机工程学院', '2016', '软件工程', '2', 'A4136FB7AC5B3FBEA0C878B4F79CCE7A', null);
INSERT INTO `students` VALUES ('721', '201610098720', '720', '计算机工程学院', '2016', '软件工程', '2', '4EE8F37DE196CF60D883B28F4ADD1565', null);
INSERT INTO `students` VALUES ('722', '201610098721', '721', '计算机工程学院', '2016', '软件工程', '2', 'C27D11FAE51C35C1B4D476730D33BE91', null);
INSERT INTO `students` VALUES ('723', '201610098722', '722', '计算机工程学院', '2016', '软件工程', '2', 'AA43211DADA920D2869B353C5120FD53', null);
INSERT INTO `students` VALUES ('724', '201610098723', '723', '计算机工程学院', '2016', '软件工程', '2', 'D4C21854FE9FC33BF25BB5716EA79EAE', null);
INSERT INTO `students` VALUES ('725', '201610098724', '724', '计算机工程学院', '2016', '软件工程', '2', 'C1293A73400171FBB4E8BAF41A13D65F', null);
INSERT INTO `students` VALUES ('726', '201610098725', '725', '计算机工程学院', '2016', '软件工程', '2', '18988D34A16D32376555F086FF30482C', null);
INSERT INTO `students` VALUES ('727', '201610098726', '726', '计算机工程学院', '2016', '软件工程', '2', '1952A35AA4AFE779D6A113E1193DA45E', null);
INSERT INTO `students` VALUES ('728', '201610098727', '727', '计算机工程学院', '2016', '软件工程', '2', '283A9F6356A0FE91E5C8753085853B35', null);
INSERT INTO `students` VALUES ('729', '201610098728', '728', '计算机工程学院', '2016', '软件工程', '2', '6113E892018AA8A4DEFA4B22048A335C', null);
INSERT INTO `students` VALUES ('730', '201610098729', '729', '计算机工程学院', '2016', '软件工程', '2', '8E8B6A77E9C736A6FD9B1535F1B98279', null);
INSERT INTO `students` VALUES ('731', '201610098730', '730', '计算机工程学院', '2016', '软件工程', '2', 'D3160F4CEF944CA32A5B8C841A159B8D', null);
INSERT INTO `students` VALUES ('732', '201610098731', '731', '计算机工程学院', '2016', '软件工程', '2', 'D3F9AE43FDBA0EAC98E0234B97256B1B', null);
INSERT INTO `students` VALUES ('733', '201610098732', '732', '计算机工程学院', '2016', '软件工程', '2', '6C0D6F546708253C71D1B4487401E4EC', null);
INSERT INTO `students` VALUES ('734', '201610098733', '733', '计算机工程学院', '2016', '软件工程', '2', 'EB019E60891BA7DC168EF93C26080FF0', null);
INSERT INTO `students` VALUES ('735', '201610098734', '734', '计算机工程学院', '2016', '软件工程', '2', '80CCFEAA9499B7B1128F60CB254BE818', null);
INSERT INTO `students` VALUES ('736', '201610098735', '735', '计算机工程学院', '2016', '软件工程', '2', 'D7DEF7A412CA0CA11761BE1F65A1EE5E', null);
INSERT INTO `students` VALUES ('737', '201610098736', '736', '计算机工程学院', '2016', '软件工程', '2', '7DBE7D8190AC1D535517A464FA942CAF', null);
INSERT INTO `students` VALUES ('738', '201610098737', '737', '计算机工程学院', '2016', '软件工程', '2', 'AC413B707DF3173685E4A4471FF82DBE', null);
INSERT INTO `students` VALUES ('739', '201610098738', '738', '计算机工程学院', '2016', '软件工程', '2', '614DCD5319514BA48227A316BF16EBCF', null);
INSERT INTO `students` VALUES ('740', '201610098739', '739', '计算机工程学院', '2016', '软件工程', '2', '45A1F1B65490E8F564BDC9FD81D51FD1', null);
INSERT INTO `students` VALUES ('741', '201610098740', '740', '计算机工程学院', '2016', '软件工程', '2', 'D3516B8B401B07AADC21C06DE279EED6', null);
INSERT INTO `students` VALUES ('742', '201610098741', '741', '计算机工程学院', '2016', '软件工程', '2', 'DC2E4563B8D4C52CD1451807BA41AD47', null);
INSERT INTO `students` VALUES ('743', '201610098742', '742', '计算机工程学院', '2016', '软件工程', '2', 'E7BA409B57E436A9A567115197E2974D', null);
INSERT INTO `students` VALUES ('744', '201610098743', '743', '计算机工程学院', '2016', '软件工程', '2', '96B367D4266B37BB6D1611D01D470BD1', null);
INSERT INTO `students` VALUES ('745', '201610098744', '744', '计算机工程学院', '2016', '软件工程', '2', 'B7CB055566D5E135B03ECBAB69823FFF', null);
INSERT INTO `students` VALUES ('746', '201610098745', '745', '计算机工程学院', '2016', '软件工程', '2', '1A00E459F026D30E1E67FA285618E06F', null);
INSERT INTO `students` VALUES ('747', '201610098746', '746', '计算机工程学院', '2016', '软件工程', '2', '688CAF63017AEA428B04E55E364DC6F3', null);
INSERT INTO `students` VALUES ('748', '201610098747', '747', '计算机工程学院', '2016', '软件工程', '2', '98CD678FEC8EF4D0E1B778250B267F14', null);
INSERT INTO `students` VALUES ('749', '201610098748', '748', '计算机工程学院', '2016', '软件工程', '2', '7C7B5C8CADD1C822B2B957C82F9ED825', null);
INSERT INTO `students` VALUES ('750', '201610098749', '749', '计算机工程学院', '2016', '软件工程', '2', 'CC0F46D6A14F7634518F0683E91E89E4', null);
INSERT INTO `students` VALUES ('751', '201610098750', '750', '计算机工程学院', '2016', '软件工程', '2', '9E468BDADB327B4DC2DA145D7773E493', null);
INSERT INTO `students` VALUES ('752', '201610098751', '751', '计算机工程学院', '2016', '软件工程', '2', '7DEF5F109578E8AB9A0096FC4D8BDC73', null);
INSERT INTO `students` VALUES ('753', '201610098752', '752', '计算机工程学院', '2016', '软件工程', '2', '32F5A6B53408FD6870E794A0E88E6A38', null);
INSERT INTO `students` VALUES ('754', '201610098753', '753', '计算机工程学院', '2016', '软件工程', '2', '54A1DFFD42C69FF0E24CD1EAB2400D26', null);
INSERT INTO `students` VALUES ('755', '201610098754', '754', '计算机工程学院', '2016', '软件工程', '2', '0BAC2DAE0AF0C13078FC506DF61A797D', null);
INSERT INTO `students` VALUES ('756', '201610098755', '755', '计算机工程学院', '2016', '软件工程', '2', '61E25CC97C3D7C3314D219A7A1A66216', null);
INSERT INTO `students` VALUES ('757', '201610098756', '756', '计算机工程学院', '2016', '软件工程', '2', '7F057BE480F43697B766D6D1DBCB9625', null);
INSERT INTO `students` VALUES ('758', '201610098757', '757', '计算机工程学院', '2016', '软件工程', '2', '74337702B8E9080024AEC332FEE3D242', null);
INSERT INTO `students` VALUES ('759', '201610098758', '758', '计算机工程学院', '2016', '软件工程', '2', '10E3028284DA2C9023E7E6C19AE1EA0E', null);
INSERT INTO `students` VALUES ('760', '201610098759', '759', '计算机工程学院', '2016', '软件工程', '2', '63152879F7B94C7A3C997DD38953C570', null);
INSERT INTO `students` VALUES ('761', '201610098760', '760', '计算机工程学院', '2016', '软件工程', '2', '1E3A86DEB4411297E7DD4260310193D9', null);
INSERT INTO `students` VALUES ('762', '201610098761', '761', '计算机工程学院', '2016', '软件工程', '2', '6B1F9636205EB2846E6BB9838C32405D', null);
INSERT INTO `students` VALUES ('763', '201610098762', '762', '计算机工程学院', '2016', '软件工程', '2', '57205F241ED438E568997156D800BD46', null);
INSERT INTO `students` VALUES ('764', '201610098763', '763', '计算机工程学院', '2016', '软件工程', '2', 'D03CF683AA22D7820E000036DE0F82A5', null);
INSERT INTO `students` VALUES ('765', '201610098764', '764', '计算机工程学院', '2016', '软件工程', '2', '5B620B63340620E8BE8A16A6D986D623', null);
INSERT INTO `students` VALUES ('766', '201610098765', '765', '计算机工程学院', '2016', '软件工程', '2', '0BD60334E111E3C72D49D9701FE6F821', null);
INSERT INTO `students` VALUES ('767', '201610098766', '766', '计算机工程学院', '2016', '软件工程', '2', '2464F9D01E356F79521A17CEA6EA6924', null);
INSERT INTO `students` VALUES ('768', '201610098767', '767', '计算机工程学院', '2016', '软件工程', '2', '062DA8C947BE02598AFBC1B6E67AC363', null);
INSERT INTO `students` VALUES ('769', '201610098768', '768', '计算机工程学院', '2016', '软件工程', '2', '75F2D4E95558175C5AFBA629A4A790B3', null);
INSERT INTO `students` VALUES ('770', '201610098769', '769', '计算机工程学院', '2016', '软件工程', '2', '2407A65EC577F0D0EE47B50C97714587', null);
INSERT INTO `students` VALUES ('771', '201610098770', '770', '计算机工程学院', '2016', '软件工程', '2', '7CD4147D63C2261DE41A3B6D014763EC', null);
INSERT INTO `students` VALUES ('772', '201610098771', '771', '计算机工程学院', '2016', '软件工程', '2', '32D14D53085E2F37E3629D6BB817D455', null);
INSERT INTO `students` VALUES ('773', '201610098772', '772', '计算机工程学院', '2016', '软件工程', '2', '15ED4359DB87E6D4183FEC42AE8B98A2', null);
INSERT INTO `students` VALUES ('774', '201610098773', '773', '计算机工程学院', '2016', '软件工程', '2', 'BBC342F2D89BD84F8EFA69D2E7D5DDED', null);
INSERT INTO `students` VALUES ('775', '201610098774', '774', '计算机工程学院', '2016', '软件工程', '2', '997AECE563DCF144ABF480C51FC1110A', null);
INSERT INTO `students` VALUES ('776', '201610098775', '775', '计算机工程学院', '2016', '软件工程', '2', 'F5D84D7C0AEEBB0B790EE13DC7D065B5', null);
INSERT INTO `students` VALUES ('777', '201610098776', '776', '计算机工程学院', '2016', '软件工程', '2', '1388C77F61F39264EBB1D0010A73F52E', null);
INSERT INTO `students` VALUES ('778', '201610098777', '777', '计算机工程学院', '2016', '软件工程', '2', 'BE4B4A31F5384A810D0CD083E9DFA35A', null);
INSERT INTO `students` VALUES ('779', '201610098778', '778', '计算机工程学院', '2016', '软件工程', '2', '85660CE4BBAB4281E37FC07982FB94D1', null);
INSERT INTO `students` VALUES ('780', '201610098779', '779', '计算机工程学院', '2016', '软件工程', '2', 'D4190816832106B22C17BC2111C5B60A', null);
INSERT INTO `students` VALUES ('781', '201610098780', '780', '计算机工程学院', '2016', '软件工程', '2', '7D3D4E556D9C881434B66C2028754D4E', null);
INSERT INTO `students` VALUES ('782', '201610098781', '781', '计算机工程学院', '2016', '软件工程', '2', '9D1A253F28D7444043AF00F6EA7D505A', null);
INSERT INTO `students` VALUES ('783', '201610098782', '782', '计算机工程学院', '2016', '软件工程', '2', '31ABA07F69D11DFF9060F14F54CCE981', null);
INSERT INTO `students` VALUES ('784', '201610098783', '783', '计算机工程学院', '2016', '软件工程', '2', 'F360668ACF9847B5AAD2C0B061DC2A4D', null);
INSERT INTO `students` VALUES ('785', '201610098784', '784', '计算机工程学院', '2016', '软件工程', '2', '9AB93DBC028888DDA8A95A8DB3CD5901', null);
INSERT INTO `students` VALUES ('786', '201610098785', '785', '计算机工程学院', '2016', '软件工程', '2', '0D31DD2154EB3586397134EE744257E4', null);
INSERT INTO `students` VALUES ('787', '201610098786', '786', '计算机工程学院', '2016', '软件工程', '2', '5B795B8118BC4E7F3A1A24C47E0B2324', null);
INSERT INTO `students` VALUES ('788', '201610098787', '787', '计算机工程学院', '2016', '软件工程', '2', 'A83F37C66B5D019FE0F3C27D3940A925', null);
INSERT INTO `students` VALUES ('789', '201610098788', '788', '计算机工程学院', '2016', '软件工程', '2', 'D9CF6E7970F433AF7CB674C429A07762', null);
INSERT INTO `students` VALUES ('790', '201610098789', '789', '计算机工程学院', '2016', '软件工程', '2', 'DA1D42C188F6E3C04862AE2651DE2681', null);
INSERT INTO `students` VALUES ('791', '201610098790', '790', '计算机工程学院', '2016', '软件工程', '2', '8E6795D3B3105AE1C40544548E01CEDF', null);
INSERT INTO `students` VALUES ('792', '201610098791', '791', '计算机工程学院', '2016', '软件工程', '2', '6BB8B34305F2099489A30D4C75083484', null);
INSERT INTO `students` VALUES ('793', '201610098792', '792', '计算机工程学院', '2016', '软件工程', '2', '0F6E3F462B8C89379DD2119C9BCEFE34', null);
INSERT INTO `students` VALUES ('794', '201610098793', '793', '计算机工程学院', '2016', '软件工程', '2', '4B6B0774E51534A96F8FB8014287EB4D', null);
INSERT INTO `students` VALUES ('795', '201610098794', '794', '计算机工程学院', '2016', '软件工程', '2', '69ECFA3D1A486F4CCA35EA92E01AF17F', null);
INSERT INTO `students` VALUES ('796', '201610098795', '795', '计算机工程学院', '2016', '软件工程', '2', 'F6D50BAA4CE8117D4DE40BCCD1E1ADA9', null);
INSERT INTO `students` VALUES ('797', '201610098796', '796', '计算机工程学院', '2016', '软件工程', '2', '5D68235648D2824800D03152E50C585F', null);
INSERT INTO `students` VALUES ('798', '201610098797', '797', '计算机工程学院', '2016', '软件工程', '2', '01109FC3A0B88286DC0786AA5381069B', null);
INSERT INTO `students` VALUES ('799', '201610098798', '798', '计算机工程学院', '2016', '软件工程', '2', 'DB6DD6269A842E07237D5E065875F793', null);
INSERT INTO `students` VALUES ('800', '201610098799', '799', '计算机工程学院', '2016', '软件工程', '2', '4A10D2C1D8F7EC44BA3ABAA4A58DD01A', null);
INSERT INTO `students` VALUES ('801', '201610098800', '800', '计算机工程学院', '2016', '软件工程', '2', '5DD30FDBA82C507041FE6AAD3ACFA304', null);
INSERT INTO `students` VALUES ('802', '201610098801', '801', '计算机工程学院', '2016', '软件工程', '2', 'A978CCBDFFADECA1CCB1F119C9BF8A59', null);
INSERT INTO `students` VALUES ('803', '201610098802', '802', '计算机工程学院', '2016', '软件工程', '2', 'B1DEFAFF58A6EBFB296154EC604A5B9F', null);
INSERT INTO `students` VALUES ('804', '201610098803', '803', '计算机工程学院', '2016', '软件工程', '2', 'D5272385868109BE82E77CC498897F18', null);
INSERT INTO `students` VALUES ('805', '201610098804', '804', '计算机工程学院', '2016', '软件工程', '2', 'A0AC8951BCA8E7A525D6803CDC3D1F94', null);
INSERT INTO `students` VALUES ('806', '201610098805', '805', '计算机工程学院', '2016', '软件工程', '2', '34FF7B1ECB29DA8168AF82BAF63F589D', null);
INSERT INTO `students` VALUES ('807', '201610098806', '806', '计算机工程学院', '2016', '软件工程', '2', '7817B18EA44ED709026BDC1AADD166B1', null);
INSERT INTO `students` VALUES ('808', '201610098807', '807', '计算机工程学院', '2016', '软件工程', '2', 'A03EB28FABF7FB40C61308AAAA0CE5B3', null);
INSERT INTO `students` VALUES ('809', '201610098808', '808', '计算机工程学院', '2016', '软件工程', '2', 'CABF9934AF2135E5126B5A26D1275B4B', null);
INSERT INTO `students` VALUES ('810', '201610098809', '809', '计算机工程学院', '2016', '软件工程', '2', '4E51C19D3D4A94AE2C6EB8EEC9DB9E08', null);
INSERT INTO `students` VALUES ('811', '201610098810', '810', '计算机工程学院', '2016', '软件工程', '2', 'C1CB7EE8455BBAF29C8F4E2663C759D2', null);
INSERT INTO `students` VALUES ('812', '201610098811', '811', '计算机工程学院', '2016', '软件工程', '2', 'A4E82B7E7D98F7EA42E6847D5B62F981', null);
INSERT INTO `students` VALUES ('813', '201610098812', '812', '计算机工程学院', '2016', '软件工程', '2', '2D8AF34BF69F97D2CC563E223B4FA10B', null);
INSERT INTO `students` VALUES ('814', '201610098813', '813', '计算机工程学院', '2016', '软件工程', '2', '029F9D1346E07F7FDED6A10617118DED', null);
INSERT INTO `students` VALUES ('815', '201610098814', '814', '计算机工程学院', '2016', '软件工程', '2', 'A63B44DEFBF616D3717A20559A025E6E', null);
INSERT INTO `students` VALUES ('816', '201610098815', '815', '计算机工程学院', '2016', '软件工程', '2', '1450ED08AA8EDB90BCA84CECA1E0124C', null);
INSERT INTO `students` VALUES ('817', '201610098816', '816', '计算机工程学院', '2016', '软件工程', '2', 'E1BC97941953618B5991ED691EC85836', null);
INSERT INTO `students` VALUES ('818', '201610098817', '817', '计算机工程学院', '2016', '软件工程', '2', '74B8A22B43018216140E01CA671B7D01', null);
INSERT INTO `students` VALUES ('819', '201610098818', '818', '计算机工程学院', '2016', '软件工程', '2', 'E7B1AAE485C6148B582722AC19FEF648', null);
INSERT INTO `students` VALUES ('820', '201610098819', '819', '计算机工程学院', '2016', '软件工程', '2', '7F3F5AE58E4B290A7575A34C5D162337', null);
INSERT INTO `students` VALUES ('821', '201610098820', '820', '计算机工程学院', '2016', '软件工程', '2', 'C6FDE9C8DCFA89F79EB38FBAC0758092', null);
INSERT INTO `students` VALUES ('822', '201610098821', '821', '计算机工程学院', '2016', '软件工程', '2', '74CED3C32654C02DD95A29F27B70AE99', null);
INSERT INTO `students` VALUES ('823', '201610098822', '822', '计算机工程学院', '2016', '软件工程', '2', '21CDA1A187DCD09309DA20CE3C77C41C', null);
INSERT INTO `students` VALUES ('824', '201610098823', '823', '计算机工程学院', '2016', '软件工程', '2', '0D8025CACF78DBEE127A64FD07CF102F', null);
INSERT INTO `students` VALUES ('825', '201610098824', '824', '计算机工程学院', '2016', '软件工程', '2', 'C5650AB1084AAED0174FDFFCA9142E18', null);
INSERT INTO `students` VALUES ('826', '201610098825', '825', '计算机工程学院', '2016', '软件工程', '2', 'EC0A5166D96241E35CF4567033CF679F', null);
INSERT INTO `students` VALUES ('827', '201610098826', '826', '计算机工程学院', '2016', '软件工程', '2', 'EBB886B118A2407FE54C9EC479503DD8', null);
INSERT INTO `students` VALUES ('828', '201610098827', '827', '计算机工程学院', '2016', '软件工程', '2', '9E61EAF541CBEC6145A3407D5BE5F6E1', null);
INSERT INTO `students` VALUES ('829', '201610098828', '828', '计算机工程学院', '2016', '软件工程', '2', '4E8028B3216C72F8A18C84F73D24B472', null);
INSERT INTO `students` VALUES ('830', '201610098829', '829', '计算机工程学院', '2016', '软件工程', '2', '25CB58FAFBA2C169EF15CE0671806623', null);
INSERT INTO `students` VALUES ('831', '201610098830', '830', '计算机工程学院', '2016', '软件工程', '2', 'D8EC6225E06E085F2856D3FBE2E3B23E', null);
INSERT INTO `students` VALUES ('832', '201610098831', '831', '计算机工程学院', '2016', '软件工程', '2', '658FF65A8E9A2B7A1D84A3699B1C41EA', null);
INSERT INTO `students` VALUES ('833', '201610098832', '832', '计算机工程学院', '2016', '软件工程', '2', '9173F528980DEE8A4061D0FDF8052703', null);
INSERT INTO `students` VALUES ('834', '201610098833', '833', '计算机工程学院', '2016', '软件工程', '2', 'B71B493F5EA151764CAC1BC129653FA6', null);
INSERT INTO `students` VALUES ('835', '201610098834', '834', '计算机工程学院', '2016', '软件工程', '2', 'B59C1FEF8C4A1493A42A235BB0120398', null);
INSERT INTO `students` VALUES ('836', '201610098835', '835', '计算机工程学院', '2016', '软件工程', '2', '55E5513DCC3888387EFB83E848EDD684', null);
INSERT INTO `students` VALUES ('837', '201610098836', '836', '计算机工程学院', '2016', '软件工程', '2', '55527286B533D7D80CCFB91AF8C5F68A', null);
INSERT INTO `students` VALUES ('838', '201610098837', '837', '计算机工程学院', '2016', '软件工程', '2', 'CD231F867B87704D0415DEDA0E3DAA59', null);
INSERT INTO `students` VALUES ('839', '201610098838', '838', '计算机工程学院', '2016', '软件工程', '2', 'E33C9126A54A475B4C9B1350FD425B1C', null);
INSERT INTO `students` VALUES ('840', '201610098839', '839', '计算机工程学院', '2016', '软件工程', '2', '351B6F3B5F1CF4E9FCB81EB8F67F9CD6', null);
INSERT INTO `students` VALUES ('841', '201610098840', '840', '计算机工程学院', '2016', '软件工程', '2', '66F72F9929657FB23603787E64784CFA', null);
INSERT INTO `students` VALUES ('842', '201610098841', '841', '计算机工程学院', '2016', '软件工程', '2', '60931A2F60070C3B47410E9793DC0660', null);
INSERT INTO `students` VALUES ('843', '201610098842', '842', '计算机工程学院', '2016', '软件工程', '2', '139E5D2AA73FED402CA79C9C80E9285C', null);
INSERT INTO `students` VALUES ('844', '201610098843', '843', '计算机工程学院', '2016', '软件工程', '2', '409B30102069D057A66ABDEC90479FFF', null);
INSERT INTO `students` VALUES ('845', '201610098844', '844', '计算机工程学院', '2016', '软件工程', '2', '8D6D22988CA3B92D4A9B1CA355C7FF2D', null);
INSERT INTO `students` VALUES ('846', '201610098845', '845', '计算机工程学院', '2016', '软件工程', '2', '5027A5CEF57ACE48C72CEF52CED0F400', null);
INSERT INTO `students` VALUES ('847', '201610098846', '846', '计算机工程学院', '2016', '软件工程', '2', 'E24FE64E19A8BC65EB96F0534740ECF7', null);
INSERT INTO `students` VALUES ('848', '201610098847', '847', '计算机工程学院', '2016', '软件工程', '2', 'B2FD2FA330C573EA969A8643A8C7F8EA', null);
INSERT INTO `students` VALUES ('849', '201610098848', '848', '计算机工程学院', '2016', '软件工程', '2', '6F10F8FDFFF46957903DD4151E292F83', null);
INSERT INTO `students` VALUES ('850', '201610098849', '849', '计算机工程学院', '2016', '软件工程', '2', '2517D2A1DFFDDB249393E66689CE0ABC', null);
INSERT INTO `students` VALUES ('851', '201610098850', '850', '计算机工程学院', '2016', '软件工程', '2', '19FA2BC877E9FDF69FA20885B05D4AD9', null);
INSERT INTO `students` VALUES ('852', '201610098851', '851', '计算机工程学院', '2016', '软件工程', '2', '99D779E8F079BC554DD222ECDE1B83A8', null);
INSERT INTO `students` VALUES ('853', '201610098852', '852', '计算机工程学院', '2016', '软件工程', '2', '0F93668C73A808D6AA5122E426C88014', null);
INSERT INTO `students` VALUES ('854', '201610098853', '853', '计算机工程学院', '2016', '软件工程', '2', '7462A7D5228C8F754621D2648C649503', null);
INSERT INTO `students` VALUES ('855', '201610098854', '854', '计算机工程学院', '2016', '软件工程', '2', '05964A71270D520352D02BF8F017E44B', null);
INSERT INTO `students` VALUES ('856', '201610098855', '855', '计算机工程学院', '2016', '软件工程', '2', 'DBDB22D0D3F1597492BCBBF566B4C993', null);
INSERT INTO `students` VALUES ('857', '201610098856', '856', '计算机工程学院', '2016', '软件工程', '2', 'E5ADE363789058C21E30460D1C241F71', null);
INSERT INTO `students` VALUES ('858', '201610098857', '857', '计算机工程学院', '2016', '软件工程', '2', 'E15EBB91C9A107DD1EAA87901D5E4A33', null);
INSERT INTO `students` VALUES ('859', '201610098858', '858', '计算机工程学院', '2016', '软件工程', '2', 'FC2C3DA900EAC42157E31787F28FA30B', null);
INSERT INTO `students` VALUES ('860', '201610098859', '859', '计算机工程学院', '2016', '软件工程', '2', '2FE55764C6CEF758C99ADD2A0A2AC1D3', null);
INSERT INTO `students` VALUES ('861', '201610098860', '860', '计算机工程学院', '2016', '软件工程', '2', '7026B5A24A8C36601359C59336149D81', null);
INSERT INTO `students` VALUES ('862', '201610098861', '861', '计算机工程学院', '2016', '软件工程', '2', 'CB20399C7C970A15B30D3B1BD642E44F', null);
INSERT INTO `students` VALUES ('863', '201610098862', '862', '计算机工程学院', '2016', '软件工程', '2', '55AFB859FC3368C7780F50E53AA4FEF8', null);
INSERT INTO `students` VALUES ('864', '201610098863', '863', '计算机工程学院', '2016', '软件工程', '2', '30986BE4B7733E97B3C8915FD2B48BCC', null);
INSERT INTO `students` VALUES ('865', '201610098864', '864', '计算机工程学院', '2016', '软件工程', '2', 'F495488A35A52771B21D2169A0E516DD', null);
INSERT INTO `students` VALUES ('866', '201610098865', '865', '计算机工程学院', '2016', '软件工程', '2', 'D1A0EFF593A56272A5A9F1FDDB767C94', null);
INSERT INTO `students` VALUES ('867', '201610098866', '866', '计算机工程学院', '2016', '软件工程', '2', '7B6E65B9A7DA1C497D71B585AF054184', null);
INSERT INTO `students` VALUES ('868', '201610098867', '867', '计算机工程学院', '2016', '软件工程', '2', '5FBB3DA7B84C05E982118B4F1E2491C3', null);
INSERT INTO `students` VALUES ('869', '201610098868', '868', '计算机工程学院', '2016', '软件工程', '2', '87C6826655C891CEBD7D02B029FDD9B4', null);
INSERT INTO `students` VALUES ('870', '201610098869', '869', '计算机工程学院', '2016', '软件工程', '2', '1143D0E6160FAC4EBA4A93CD89BDA1EF', null);
INSERT INTO `students` VALUES ('871', '201610098870', '870', '计算机工程学院', '2016', '软件工程', '2', '93F063FE1C67DA44768DECBC80434F66', null);
INSERT INTO `students` VALUES ('872', '201610098871', '871', '计算机工程学院', '2016', '软件工程', '2', '8D6A2AD84CB80621A64C6BEFDF63FA27', null);
INSERT INTO `students` VALUES ('873', '201610098872', '872', '计算机工程学院', '2016', '软件工程', '2', 'DB57EAB088E4EE8DF9E33056A6ED3458', null);
INSERT INTO `students` VALUES ('874', '201610098873', '873', '计算机工程学院', '2016', '软件工程', '2', '7242C6315199DBFA6A5495FAD049A233', null);
INSERT INTO `students` VALUES ('875', '201610098874', '874', '计算机工程学院', '2016', '软件工程', '2', '7C3A5FCDB6AAC50FDFB6317E9901E7B3', null);
INSERT INTO `students` VALUES ('876', '201610098875', '875', '计算机工程学院', '2016', '软件工程', '2', '84DB88180C7A5074D90CAC23F2400FD5', null);
INSERT INTO `students` VALUES ('877', '201610098876', '876', '计算机工程学院', '2016', '软件工程', '2', '5B1A48B5FFF82D5A4B518153F7EDB6F8', null);
INSERT INTO `students` VALUES ('878', '201610098877', '877', '计算机工程学院', '2016', '软件工程', '2', '1BAD89F3D6CACBEA10E12C901F358110', null);
INSERT INTO `students` VALUES ('879', '201610098878', '878', '计算机工程学院', '2016', '软件工程', '2', '01DB8500024133791644404F5C31AB75', null);
INSERT INTO `students` VALUES ('880', '201610098879', '879', '计算机工程学院', '2016', '软件工程', '2', '2DFE627842E9BC4BB61215B49B313B7D', null);
INSERT INTO `students` VALUES ('881', '201610098880', '880', '计算机工程学院', '2016', '软件工程', '2', '434AA09C6A91B27BA7B9D3C644D0DB73', null);
INSERT INTO `students` VALUES ('882', '201610098881', '881', '计算机工程学院', '2016', '软件工程', '2', '54FC8D25E3ECC364514AB7B780F232CB', null);
INSERT INTO `students` VALUES ('883', '201610098882', '882', '计算机工程学院', '2016', '软件工程', '2', '3E0B3970E2BFE3F883466783CCC5D234', null);
INSERT INTO `students` VALUES ('884', '201610098883', '883', '计算机工程学院', '2016', '软件工程', '2', '885052F533B5DFC2F226796EB430D336', null);
INSERT INTO `students` VALUES ('885', '201610098884', '884', '计算机工程学院', '2016', '软件工程', '2', 'CA4FEED333FDC6B66E7F4B0D9643B218', null);
INSERT INTO `students` VALUES ('886', '201610098885', '885', '计算机工程学院', '2016', '软件工程', '2', '1D875AB34CF00AA78313977825B5E108', null);
INSERT INTO `students` VALUES ('887', '201610098886', '886', '计算机工程学院', '2016', '软件工程', '2', 'F011477F48390AA07C2D5ACB6105F462', null);
INSERT INTO `students` VALUES ('888', '201610098887', '887', '计算机工程学院', '2016', '软件工程', '2', '1E3C459F4F91C278352EAD347927952F', null);
INSERT INTO `students` VALUES ('889', '201610098888', '888', '计算机工程学院', '2016', '软件工程', '2', '5645024AF9D4635B312A9F9FBFBA8F9B', null);
INSERT INTO `students` VALUES ('890', '201610098889', '889', '计算机工程学院', '2016', '软件工程', '2', 'C4ACFC8620BB0BF90FBB1E5B1BE9882D', null);
INSERT INTO `students` VALUES ('891', '201610098890', '890', '计算机工程学院', '2016', '软件工程', '2', '882393476B1A156B4AFF8C22330D2F74', null);
INSERT INTO `students` VALUES ('892', '201610098891', '891', '计算机工程学院', '2016', '软件工程', '2', '9672A302C77BE2DCC6299984DEEE8D29', null);
INSERT INTO `students` VALUES ('893', '201610098892', '892', '计算机工程学院', '2016', '软件工程', '2', '79575586D20054205E19F90E4E1B48D2', null);
INSERT INTO `students` VALUES ('894', '201610098893', '893', '计算机工程学院', '2016', '软件工程', '2', 'A951EEDB048AF2D42D421E55EB28C722', null);
INSERT INTO `students` VALUES ('895', '201610098894', '894', '计算机工程学院', '2016', '软件工程', '2', '60D09AA4BF13AF1508D5D819AFA414B6', null);
INSERT INTO `students` VALUES ('896', '201610098895', '895', '计算机工程学院', '2016', '软件工程', '2', 'E2DE58EF244E1A34B2AA38E102C511C5', null);
INSERT INTO `students` VALUES ('897', '201610098896', '896', '计算机工程学院', '2016', '软件工程', '2', '7EBE12F221A0B1ECEDAD4F1AAD11E3E7', null);
INSERT INTO `students` VALUES ('898', '201610098897', '897', '计算机工程学院', '2016', '软件工程', '2', '67D0EC1FA41D0E9FCE8EED7A80524EE9', null);
INSERT INTO `students` VALUES ('899', '201610098898', '898', '计算机工程学院', '2016', '软件工程', '2', 'FDC89E42BEA14B551D069BC3CAA85DFB', null);
INSERT INTO `students` VALUES ('900', '201610098899', '899', '计算机工程学院', '2016', '软件工程', '2', 'AACF6AC10F132217EA40FAEB450E9A9A', null);
INSERT INTO `students` VALUES ('901', '201610098900', '900', '计算机工程学院', '2016', '软件工程', '2', 'F094462292AFA45F07EEA15983532F6F', null);
INSERT INTO `students` VALUES ('902', '201610098901', '901', '计算机工程学院', '2016', '软件工程', '2', '795D8834AD657758585A19D313551DE4', null);
INSERT INTO `students` VALUES ('903', '201610098902', '902', '计算机工程学院', '2016', '软件工程', '2', '53D23C41B83428591FBC1A746E0C16C8', null);
INSERT INTO `students` VALUES ('904', '201610098903', '903', '计算机工程学院', '2016', '软件工程', '2', '188B0ACA333A774C9AA05D25517E8C46', null);
INSERT INTO `students` VALUES ('905', '201610098904', '904', '计算机工程学院', '2016', '软件工程', '2', 'FD9A9DCB12CECF038ABD6CE53F589FE4', null);
INSERT INTO `students` VALUES ('906', '201610098905', '905', '计算机工程学院', '2016', '软件工程', '2', '50DBA819E9A059217DE272EFB7B81A57', null);
INSERT INTO `students` VALUES ('907', '201610098906', '906', '计算机工程学院', '2016', '软件工程', '2', '5D8AB205361E6219E19F30282B7589F2', null);
INSERT INTO `students` VALUES ('908', '201610098907', '907', '计算机工程学院', '2016', '软件工程', '2', 'A09F173F2363719989BDAC89BA606787', null);
INSERT INTO `students` VALUES ('909', '201610098908', '908', '计算机工程学院', '2016', '软件工程', '2', 'E1B833DFA2A7125404212D10F6CC0C11', null);
INSERT INTO `students` VALUES ('910', '201610098909', '909', '计算机工程学院', '2016', '软件工程', '2', '448CA249B5952027E52108A5C9126782', null);
INSERT INTO `students` VALUES ('911', '201610098910', '910', '计算机工程学院', '2016', '软件工程', '2', '3D311F1A0AD7687B9BFFC18329447DB0', null);
INSERT INTO `students` VALUES ('912', '201610098911', '911', '计算机工程学院', '2016', '软件工程', '2', '7CEB7549F0EFADE942C32D6CA10601E7', null);
INSERT INTO `students` VALUES ('913', '201610098912', '912', '计算机工程学院', '2016', '软件工程', '2', 'CAEAF89D57613C8BD9E65987D586ADE3', null);
INSERT INTO `students` VALUES ('914', '201610098913', '913', '计算机工程学院', '2016', '软件工程', '2', 'D0ADFB5CDA69E24A76015CB73AC68A83', null);
INSERT INTO `students` VALUES ('915', '201610098914', '914', '计算机工程学院', '2016', '软件工程', '2', '0EF18C948595D3631D0BE80B97F5DB21', null);
INSERT INTO `students` VALUES ('916', '201610098915', '915', '计算机工程学院', '2016', '软件工程', '2', '8D257A397CD2D4A4D644762A3516CD78', null);
INSERT INTO `students` VALUES ('917', '201610098916', '916', '计算机工程学院', '2016', '软件工程', '2', '540F6761FC22C6F4FC1FCA3B63AA7B00', null);
INSERT INTO `students` VALUES ('918', '201610098917', '917', '计算机工程学院', '2016', '软件工程', '2', '6A2D939CA463CEF7B06A188C24531E88', null);
INSERT INTO `students` VALUES ('919', '201610098918', '918', '计算机工程学院', '2016', '软件工程', '2', 'B65C019B41C2D75E11650869A019F52B', null);
INSERT INTO `students` VALUES ('920', '201610098919', '919', '计算机工程学院', '2016', '软件工程', '2', '0101675262411E9FB720E78CE7FFB077', null);
INSERT INTO `students` VALUES ('921', '201610098920', '920', '计算机工程学院', '2016', '软件工程', '2', '829A455904F358D688C48FD954A4DC18', null);
INSERT INTO `students` VALUES ('922', '201610098921', '921', '计算机工程学院', '2016', '软件工程', '2', '7594394DFBAC0653A4F89C1FA1C77992', null);
INSERT INTO `students` VALUES ('923', '201610098922', '922', '计算机工程学院', '2016', '软件工程', '2', 'ADF5BDADB7263D85B1287C4E592631A5', null);
INSERT INTO `students` VALUES ('924', '201610098923', '923', '计算机工程学院', '2016', '软件工程', '2', '11673B6D48743E663027EDF9F6FAA45B', null);
INSERT INTO `students` VALUES ('925', '201610098924', '924', '计算机工程学院', '2016', '软件工程', '2', 'B696583907DE81EA0584F0E89393E40C', null);
INSERT INTO `students` VALUES ('926', '201610098925', '925', '计算机工程学院', '2016', '软件工程', '2', '9FBF299C9ABE69EA88C89EC7D58D32E7', null);
INSERT INTO `students` VALUES ('927', '201610098926', '926', '计算机工程学院', '2016', '软件工程', '2', '1CDBC600FBD53EF1BC5525972848AED2', null);
INSERT INTO `students` VALUES ('928', '201610098927', '927', '计算机工程学院', '2016', '软件工程', '2', '7C7D425F14A69712F9A2B1C9D6B4C373', null);
INSERT INTO `students` VALUES ('929', '201610098928', '928', '计算机工程学院', '2016', '软件工程', '2', '4CC2E4A15A318397F7129B51CCEB0821', null);
INSERT INTO `students` VALUES ('930', '201610098929', '929', '计算机工程学院', '2016', '软件工程', '2', '84D496D8DE0D931E6C3BB3F3D4AFB2E0', null);
INSERT INTO `students` VALUES ('931', '201610098930', '930', '计算机工程学院', '2016', '软件工程', '2', '03138A6AECDF5E3F5F0291A4BB74D0F3', null);
INSERT INTO `students` VALUES ('932', '201610098931', '931', '计算机工程学院', '2016', '软件工程', '2', '570A3043A643D5EFA20DF840C4706EA0', null);
INSERT INTO `students` VALUES ('933', '201610098932', '932', '计算机工程学院', '2016', '软件工程', '2', '5E5CD46DEE924D64326E695DA375B424', null);
INSERT INTO `students` VALUES ('934', '201610098933', '933', '计算机工程学院', '2016', '软件工程', '2', '080E7BE84458F4B981B55BDAD2486188', null);
INSERT INTO `students` VALUES ('935', '201610098934', '934', '计算机工程学院', '2016', '软件工程', '2', '9FAB905F9A1773A50431A19F38631F2D', null);
INSERT INTO `students` VALUES ('936', '201610098935', '935', '计算机工程学院', '2016', '软件工程', '2', 'C3EED5A0CA8F680A5DF156131B2D76FF', null);
INSERT INTO `students` VALUES ('937', '201610098936', '936', '计算机工程学院', '2016', '软件工程', '2', '9D3B0A7E4CC2421FBB19FC0DDFCB6E76', null);
INSERT INTO `students` VALUES ('938', '201610098937', '937', '计算机工程学院', '2016', '软件工程', '2', '8E88867327424C0EF9153C36F19B1BC8', null);
INSERT INTO `students` VALUES ('939', '201610098938', '938', '计算机工程学院', '2016', '软件工程', '2', 'E9B4355E0998A260F45887FE33634238', null);
INSERT INTO `students` VALUES ('940', '201610098939', '939', '计算机工程学院', '2016', '软件工程', '2', '9F4A8E8CB900EF0419EBD5ADB7AE04D8', null);
INSERT INTO `students` VALUES ('941', '201610098940', '940', '计算机工程学院', '2016', '软件工程', '2', 'A9D08759D4511E426615757C7CD76078', null);
INSERT INTO `students` VALUES ('942', '201610098941', '941', '计算机工程学院', '2016', '软件工程', '2', 'F8EEB33E9BECEC62C946C758D582BE8D', null);
INSERT INTO `students` VALUES ('943', '201610098942', '942', '计算机工程学院', '2016', '软件工程', '2', 'E97205B88B412402D48A2E477F36C61F', null);
INSERT INTO `students` VALUES ('944', '201610098943', '943', '计算机工程学院', '2016', '软件工程', '2', '3C3188726258268E62D2EA30D436B815', null);
INSERT INTO `students` VALUES ('945', '201610098944', '944', '计算机工程学院', '2016', '软件工程', '2', '710DAAB97A36265E07CDABF505E654CD', null);
INSERT INTO `students` VALUES ('946', '201610098945', '945', '计算机工程学院', '2016', '软件工程', '2', 'E0AECADF81D6ED6EC83499EC0554B067', null);
INSERT INTO `students` VALUES ('947', '201610098946', '946', '计算机工程学院', '2016', '软件工程', '2', '9240D61B91DE869BC6199EE6B49BA5CF', null);
INSERT INTO `students` VALUES ('948', '201610098947', '947', '计算机工程学院', '2016', '软件工程', '2', 'B61ECCE7E40545FDD7EBF6788C237097', null);
INSERT INTO `students` VALUES ('949', '201610098948', '948', '计算机工程学院', '2016', '软件工程', '2', '6EA452C5D12AAE3EF46C46750BADC6D9', null);
INSERT INTO `students` VALUES ('950', '201610098949', '949', '计算机工程学院', '2016', '软件工程', '2', 'A57D2268BCDC129912D38AB9D5D21D28', null);
INSERT INTO `students` VALUES ('951', '201610098950', '950', '计算机工程学院', '2016', '软件工程', '2', '162AEAF34CFF167952780D53609B2408', null);
INSERT INTO `students` VALUES ('952', '201610098951', '951', '计算机工程学院', '2016', '软件工程', '2', 'D81F21BCD2FC2EA244CF1CD5F26644D7', null);
INSERT INTO `students` VALUES ('953', '201610098952', '952', '计算机工程学院', '2016', '软件工程', '2', 'A91683F682C4BE7CA16F715F5E6EB313', null);
INSERT INTO `students` VALUES ('954', '201610098953', '953', '计算机工程学院', '2016', '软件工程', '2', 'EA771FA18EE74AA719DD3BE7B421E5CD', null);
INSERT INTO `students` VALUES ('955', '201610098954', '954', '计算机工程学院', '2016', '软件工程', '2', '5B0D1EF1465C8A0759F6D2CFE7545391', null);
INSERT INTO `students` VALUES ('956', '201610098955', '955', '计算机工程学院', '2016', '软件工程', '2', '3988B1757B4F48D5396946A78AD59260', null);
INSERT INTO `students` VALUES ('957', '201610098956', '956', '计算机工程学院', '2016', '软件工程', '2', '0070510C08A83BF0770D96AEF3824236', null);
INSERT INTO `students` VALUES ('958', '201610098957', '957', '计算机工程学院', '2016', '软件工程', '2', 'E4F8AC699CCE0B54C9C60C3F883B8CAB', null);
INSERT INTO `students` VALUES ('959', '201610098958', '958', '计算机工程学院', '2016', '软件工程', '2', 'F6A5A42FE39FC7EF6AE3FBD2E68A5987', null);
INSERT INTO `students` VALUES ('960', '201610098959', '959', '计算机工程学院', '2016', '软件工程', '2', '90F8930500497FC84EB176CE8BCDD797', null);
INSERT INTO `students` VALUES ('961', '201610098960', '960', '计算机工程学院', '2016', '软件工程', '2', '22F04304974F5EDB368935661B686422', null);
INSERT INTO `students` VALUES ('962', '201610098961', '961', '计算机工程学院', '2016', '软件工程', '2', '4651A8197D84C13905647023F278AEF8', null);
INSERT INTO `students` VALUES ('963', '201610098962', '962', '计算机工程学院', '2016', '软件工程', '2', '43114C41D71B9FE06048760831294CD4', null);
INSERT INTO `students` VALUES ('964', '201610098963', '963', '计算机工程学院', '2016', '软件工程', '2', 'AB71D9F2F8C61C9DB61D039FD73B2E5C', null);
INSERT INTO `students` VALUES ('965', '201610098964', '964', '计算机工程学院', '2016', '软件工程', '2', 'BB3B7FF81D0BB3FCFF9BD132FC0F7164', null);
INSERT INTO `students` VALUES ('966', '201610098965', '965', '计算机工程学院', '2016', '软件工程', '2', 'E5425FB74045CA17428FDA1334328AEA', null);
INSERT INTO `students` VALUES ('967', '201610098966', '966', '计算机工程学院', '2016', '软件工程', '2', '8B79EA0E33CEE47B1E76EA7FAE993EC5', null);
INSERT INTO `students` VALUES ('968', '201610098967', '967', '计算机工程学院', '2016', '软件工程', '2', '03F08B7D192D40D33B2D193B9C20BFE4', null);
INSERT INTO `students` VALUES ('969', '201610098968', '968', '计算机工程学院', '2016', '软件工程', '2', 'E88CEDB25F0399444683C98426DCCA76', null);
INSERT INTO `students` VALUES ('970', '201610098969', '969', '计算机工程学院', '2016', '软件工程', '2', '2175E2D2DDE8F02EDA1403DA61C5CAFF', null);
INSERT INTO `students` VALUES ('971', '201610098970', '970', '计算机工程学院', '2016', '软件工程', '2', '2C2AC1780492451A40AA64138DF10939', null);
INSERT INTO `students` VALUES ('972', '201610098971', '971', '计算机工程学院', '2016', '软件工程', '2', 'EA04DE2FFC7966305D0E8BACB7A4CEE0', null);
INSERT INTO `students` VALUES ('973', '201610098972', '972', '计算机工程学院', '2016', '软件工程', '2', 'F61482FF7E3F976A70B4274B4908F54C', null);
INSERT INTO `students` VALUES ('974', '201610098973', '973', '计算机工程学院', '2016', '软件工程', '2', 'F3454652486F0DA3F05C4ED0AE292FE8', null);
INSERT INTO `students` VALUES ('975', '201610098974', '974', '计算机工程学院', '2016', '软件工程', '2', 'AEE442ED767F5E8362AD7E81B9B9CB78', null);
INSERT INTO `students` VALUES ('976', '201610098975', '975', '计算机工程学院', '2016', '软件工程', '2', '6A1AD62905BC656AF16C9BEB125BF7F7', null);
INSERT INTO `students` VALUES ('977', '201610098976', '976', '计算机工程学院', '2016', '软件工程', '2', '4470618C1D92CD20AD4D647919E29566', null);
INSERT INTO `students` VALUES ('978', '201610098977', '977', '计算机工程学院', '2016', '软件工程', '2', '8B5BD83DE86639A29CAF327A0813A78A', null);
INSERT INTO `students` VALUES ('979', '201610098978', '978', '计算机工程学院', '2016', '软件工程', '2', '83BB1B0AC8365F2D42ADE9053C5A2DA6', null);
INSERT INTO `students` VALUES ('980', '201610098979', '979', '计算机工程学院', '2016', '软件工程', '2', 'A9A25970CF4BB58C4D9264AD0443F079', null);
INSERT INTO `students` VALUES ('981', '201610098980', '980', '计算机工程学院', '2016', '软件工程', '2', '5630A0DCD01EFB46BD77BBBE58F0547B', null);
INSERT INTO `students` VALUES ('982', '201610098981', '981', '计算机工程学院', '2016', '软件工程', '2', '72CA7A77C3AD5B3BC9E1ED99873F8C29', null);
INSERT INTO `students` VALUES ('983', '201610098982', '982', '计算机工程学院', '2016', '软件工程', '2', '555CA7A4F6087A19F5715E7B45AD9734', null);
INSERT INTO `students` VALUES ('984', '201610098983', '983', '计算机工程学院', '2016', '软件工程', '2', '945BFCB92088215B77A2F9F979388A4C', null);
INSERT INTO `students` VALUES ('985', '201610098984', '984', '计算机工程学院', '2016', '软件工程', '2', '88DD7F3A167CF60795CF884A2C64ACBA', null);
INSERT INTO `students` VALUES ('986', '201610098985', '985', '计算机工程学院', '2016', '软件工程', '2', 'EB6F8EE8545B3BFFD6038573016B4E8B', null);
INSERT INTO `students` VALUES ('987', '201610098986', '986', '计算机工程学院', '2016', '软件工程', '2', 'CC10BCD1892EDF6647A4D81BA6007EF3', null);
INSERT INTO `students` VALUES ('988', '201610098987', '987', '计算机工程学院', '2016', '软件工程', '2', 'CB3E6898A9EF9955BEA4470676F9070D', null);
INSERT INTO `students` VALUES ('989', '201610098988', '988', '计算机工程学院', '2016', '软件工程', '2', 'B45A39924D96F9B9BD4ED44D403CC87C', null);
INSERT INTO `students` VALUES ('990', '201610098989', '989', '计算机工程学院', '2016', '软件工程', '2', '87DE1F29E6452283F8FBFACC1CCB1554', null);
INSERT INTO `students` VALUES ('991', '201610098990', '990', '计算机工程学院', '2016', '软件工程', '2', '3DF3A372858E05F0C1281E8ACE848C78', null);
INSERT INTO `students` VALUES ('992', '201610098991', '991', '计算机工程学院', '2016', '软件工程', '2', '6DFB8275877948D0420771E9C4245816', null);
INSERT INTO `students` VALUES ('993', '201610098992', '992', '计算机工程学院', '2016', '软件工程', '2', '5F8BB14784E74B40F80A17151CA25C6D', null);
INSERT INTO `students` VALUES ('994', '201610098993', '993', '计算机工程学院', '2016', '软件工程', '2', 'E3230718768BB730DEEDAF96000FBDBF', null);
INSERT INTO `students` VALUES ('995', '201610098994', '994', '计算机工程学院', '2016', '软件工程', '2', '24C09C3B369DC4138E31DEDD5602E528', null);
INSERT INTO `students` VALUES ('996', '201610098995', '995', '计算机工程学院', '2016', '软件工程', '2', '7FC870C12C95CE7506B8DC38D30F6ABA', null);
INSERT INTO `students` VALUES ('997', '201610098996', '996', '计算机工程学院', '2016', '软件工程', '2', 'C4629A63DB0F2EF24F2F6DFE0E9C632E', null);
INSERT INTO `students` VALUES ('998', '201610098997', '997', '计算机工程学院', '2016', '软件工程', '2', 'CD7C701DF92C4B4068A14CCF072738D6', null);
INSERT INTO `students` VALUES ('999', '201610098998', '998', '计算机工程学院', '2016', '软件工程', '2', 'E1DEF05FB071D504B88F187199081464', null);
INSERT INTO `students` VALUES ('1000', '201610098999', '999', '计算机工程学院', '2016', '软件工程', '2', '829205B6341D0391559F0A8E626DF6DF', null);
