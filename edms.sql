/*
 Navicat Premium Data Transfer

 Source Server         : xzc
 Source Server Type    : MySQL
 Source Server Version : 50130
 Source Host           : localhost:3306
 Source Schema         : edms

 Target Server Type    : MySQL
 Target Server Version : 50130
 File Encoding         : 65001

 Date: 08/03/2021 16:42:24
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `number` int(11) NOT NULL COMMENT '班级人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('101', '计科1班', 48);
INSERT INTO `class` VALUES ('102', '计科2班', 50);
INSERT INTO `class` VALUES ('201', '软工1班', 47);
INSERT INTO `class` VALUES ('202', '软工2班', 45);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `credit` int(10) NOT NULL COMMENT '学分',
  `period` int(10) NOT NULL COMMENT '学时',
  `startdate` date NOT NULL COMMENT '开始日期',
  `enddate` date NOT NULL COMMENT '结束日期',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '必修课/选修课',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('0101', '编译原理', 5, 36, '2021-03-15', '2021-06-15', '必修课');
INSERT INTO `course` VALUES ('0102', '操作系统', 4, 32, '2020-09-01', '2021-01-01', '必修课');
INSERT INTO `course` VALUES ('0103', '汇编语言', 3, 36, '2020-09-01', '2021-01-01', '必修课');
INSERT INTO `course` VALUES ('0104', '软件方法与过程', 3, 36, '2020-09-01', '2021-01-01', '必修课');
INSERT INTO `course` VALUES ('0105', '计算方法', 3, 24, '2020-09-01', '2021-01-01', '必修课');
INSERT INTO `course` VALUES ('0201', '面向对象技术编程', 2, 24, '2020-09-01', '2020-11-01', '选修课');
INSERT INTO `course` VALUES ('0203', '软件开发环境', 2, 12, '2020-09-01', '2020-01-01', '选修课');
INSERT INTO `course` VALUES ('0204', '数据库设计', 2, 12, '2020-09-01', '2021-01-01', '选修课');
INSERT INTO `course` VALUES ('0501', '计算机网络', 5, 48, '2021-01-01', '2021-04-01', '必修课');

-- ----------------------------
-- Table structure for selectcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectcourse`;
CREATE TABLE `selectcourse`  (
  `sid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生编号',
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `tid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师编号',
  `score` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`sid`, `cid`, `tid`) USING BTREE,
  INDEX `selectcourse_foreign_cid`(`cid`) USING BTREE,
  INDEX `selectcourse_foreign_tid`(`tid`) USING BTREE,
  CONSTRAINT `selectcourse_foreign_cid` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selectcourse_foreign_sid` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selectcourse_foreign_tid` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of selectcourse
-- ----------------------------
INSERT INTO `selectcourse` VALUES ('201801', '0101', '0101', '72');
INSERT INTO `selectcourse` VALUES ('201801', '0102', '0103', '69');
INSERT INTO `selectcourse` VALUES ('201801', '0103', '0104', '69');
INSERT INTO `selectcourse` VALUES ('201801', '0105', '0103', '69');
INSERT INTO `selectcourse` VALUES ('201801', '0201', '0104', NULL);
INSERT INTO `selectcourse` VALUES ('201801', '0204', '0107', NULL);
INSERT INTO `selectcourse` VALUES ('201802', '0101', '0101', '100');
INSERT INTO `selectcourse` VALUES ('201802', '0102', '0103', '65');
INSERT INTO `selectcourse` VALUES ('201802', '0103', '0104', '65');
INSERT INTO `selectcourse` VALUES ('201802', '0105', '0103', '65');
INSERT INTO `selectcourse` VALUES ('201802', '0201', '0104', NULL);
INSERT INTO `selectcourse` VALUES ('201802', '0203', '0106', NULL);
INSERT INTO `selectcourse` VALUES ('201803', '0101', '0102', '78');
INSERT INTO `selectcourse` VALUES ('201803', '0102', '0101', '90');
INSERT INTO `selectcourse` VALUES ('201803', '0103', '0102', '75');
INSERT INTO `selectcourse` VALUES ('201803', '0104', '0104', '85');
INSERT INTO `selectcourse` VALUES ('201803', '0204', '0107', NULL);
INSERT INTO `selectcourse` VALUES ('201804', '0101', '0102', '100');
INSERT INTO `selectcourse` VALUES ('201804', '0102', '0101', '87');
INSERT INTO `selectcourse` VALUES ('201804', '0103', '0102', '65');
INSERT INTO `selectcourse` VALUES ('201804', '0104', '0104', '65');
INSERT INTO `selectcourse` VALUES ('201805', '0101', '0102', '100');
INSERT INTO `selectcourse` VALUES ('201805', '0102', '0101', '89');
INSERT INTO `selectcourse` VALUES ('201805', '0103', '0102', '78');
INSERT INTO `selectcourse` VALUES ('201805', '0104', '0104', '78');
INSERT INTO `selectcourse` VALUES ('201805', '0201', '0104', NULL);
INSERT INTO `selectcourse` VALUES ('201805', '0204', '0107', NULL);
INSERT INTO `selectcourse` VALUES ('201806', '0101', '0102', '89');
INSERT INTO `selectcourse` VALUES ('201806', '0102', '0101', '86');
INSERT INTO `selectcourse` VALUES ('201806', '0103', '0102', '86');
INSERT INTO `selectcourse` VALUES ('201806', '0104', '0104', '86');
INSERT INTO `selectcourse` VALUES ('201807', '0101', '0102', '96');
INSERT INTO `selectcourse` VALUES ('201807', '0102', '0101', '83');
INSERT INTO `selectcourse` VALUES ('201807', '0103', '0102', '96');
INSERT INTO `selectcourse` VALUES ('201807', '0104', '0104', '96');
INSERT INTO `selectcourse` VALUES ('201807', '0203', '0106', NULL);
INSERT INTO `selectcourse` VALUES ('201808', '0101', '0101', '69');
INSERT INTO `selectcourse` VALUES ('201808', '0102', '0103', '95');
INSERT INTO `selectcourse` VALUES ('201808', '0103', '0104', '95');
INSERT INTO `selectcourse` VALUES ('201808', '0105', '0103', '95');
INSERT INTO `selectcourse` VALUES ('201809', '0101', '0101', '73');
INSERT INTO `selectcourse` VALUES ('201809', '0102', '0103', '73');
INSERT INTO `selectcourse` VALUES ('201809', '0103', '0104', '73');
INSERT INTO `selectcourse` VALUES ('201809', '0105', '0103', '73');
INSERT INTO `selectcourse` VALUES ('201810', '0101', '0101', '100');
INSERT INTO `selectcourse` VALUES ('201810', '0102', '0103', '59');
INSERT INTO `selectcourse` VALUES ('201810', '0103', '0104', '59');
INSERT INTO `selectcourse` VALUES ('201810', '0105', '0103', '59');
INSERT INTO `selectcourse` VALUES ('201810', '0201', '0104', NULL);
INSERT INTO `selectcourse` VALUES ('201810', '0203', '0106', NULL);
INSERT INTO `selectcourse` VALUES ('201811', '0101', '0101', '98');
INSERT INTO `selectcourse` VALUES ('201811', '0102', '0103', '98');
INSERT INTO `selectcourse` VALUES ('201811', '0103', '0104', '98');
INSERT INTO `selectcourse` VALUES ('201811', '0105', '0103', '98');
INSERT INTO `selectcourse` VALUES ('201812', '0101', '0101', '89');
INSERT INTO `selectcourse` VALUES ('201812', '0102', '0103', '89');
INSERT INTO `selectcourse` VALUES ('201812', '0103', '0104', '89');
INSERT INTO `selectcourse` VALUES ('201812', '0105', '0103', '89');
INSERT INTO `selectcourse` VALUES ('201812', '0201', '0104', NULL);
INSERT INTO `selectcourse` VALUES ('201812', '0204', '0107', NULL);
INSERT INTO `selectcourse` VALUES ('201813', '0101', '0102', '64');
INSERT INTO `selectcourse` VALUES ('201813', '0102', '0101', '100');
INSERT INTO `selectcourse` VALUES ('201813', '0103', '0102', '72');
INSERT INTO `selectcourse` VALUES ('201813', '0104', '0104', '72');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生编号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
  `startyear` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入学年份',
  `classid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级号',
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号密码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_foreign_classid`(`classid`) USING BTREE,
  CONSTRAINT `student_foreign_classid` FOREIGN KEY (`classid`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201801', '白舟月', '女', '计科', '2018', '101', '201801');
INSERT INTO `student` VALUES ('201802', '吴坤坤', '男', '计科', '2018', '102', '201802');
INSERT INTO `student` VALUES ('201803', '谢聪聪', '男', '软工', '2018', '201', '201803');
INSERT INTO `student` VALUES ('201804', '陈博博', '男', '软工', '2018', '202', '201804');
INSERT INTO `student` VALUES ('201805', '小红', '女', '软工', '2018', '201', '201805');
INSERT INTO `student` VALUES ('201806', '小白', '男', '软工', '2018', '201', '201805');
INSERT INTO `student` VALUES ('201807', '小绿', '男', '软工', '2018', '201', '201807');
INSERT INTO `student` VALUES ('201808', '小紫', '女', '计科', '2018', '101', '201808');
INSERT INTO `student` VALUES ('201809', '小橙', '女', '计科', '2018', '102', '201809');
INSERT INTO `student` VALUES ('201810', '小明', '男', '计科', '2018', '101', '201810');
INSERT INTO `student` VALUES ('201811', '小曾', '男', '计科', '2018', '101', '201811');
INSERT INTO `student` VALUES ('201812', '小青', '女', '软工', '2018', '102', '201812');
INSERT INTO `student` VALUES ('201813', '小晓', '男', '软工', '2018', '202', '201813');
INSERT INTO `student` VALUES ('201820', '谢梓聪', '男', '计科', '2018', '101', '201820');

-- ----------------------------
-- Table structure for teachcourse
-- ----------------------------
DROP TABLE IF EXISTS `teachcourse`;
CREATE TABLE `teachcourse`  (
  `tid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师编号',
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  PRIMARY KEY (`tid`, `cid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  INDEX `teachcourse_foreign_cid`(`cid`) USING BTREE,
  CONSTRAINT `teachcourse_foreign_cid` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teachcourse_foreign_tid` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teachcourse
-- ----------------------------
INSERT INTO `teachcourse` VALUES ('0101', '0101');
INSERT INTO `teachcourse` VALUES ('0101', '0102');
INSERT INTO `teachcourse` VALUES ('0102', '0101');
INSERT INTO `teachcourse` VALUES ('0102', '0103');
INSERT INTO `teachcourse` VALUES ('0103', '0102');
INSERT INTO `teachcourse` VALUES ('0103', '0105');
INSERT INTO `teachcourse` VALUES ('0104', '0103');
INSERT INTO `teachcourse` VALUES ('0104', '0104');
INSERT INTO `teachcourse` VALUES ('0104', '0201');
INSERT INTO `teachcourse` VALUES ('0106', '0203');
INSERT INTO `teachcourse` VALUES ('0107', '0204');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师编号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师名称',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职称',
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('0101', '陶梅梅', '女', '副教授', '0101');
INSERT INTO `teacher` VALUES ('0102', '严明', '男', '教师', '0102');
INSERT INTO `teacher` VALUES ('0103', '闫刚', '男', '教授', '0103');
INSERT INTO `teacher` VALUES ('0104', '徐杰杰', '男', '教授', '0104');
INSERT INTO `teacher` VALUES ('0105', '薛康康', '男', '教师', '0105');
INSERT INTO `teacher` VALUES ('0106', '王红', '女', '副教授', '0106');
INSERT INTO `teacher` VALUES ('0107', '马玉', '女', '教师', '0107');

-- ----------------------------
-- Table structure for teaches
-- ----------------------------
DROP TABLE IF EXISTS `teaches`;
CREATE TABLE `teaches`  (
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `tid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师编号',
  `classid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级编号',
  PRIMARY KEY (`cid`, `tid`, `classid`) USING BTREE,
  INDEX `teaches_foreign_tid`(`tid`) USING BTREE,
  INDEX `teaches_foreign_classid`(`classid`) USING BTREE,
  CONSTRAINT `teaches_foreign_cid` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teaches_foreign_classid` FOREIGN KEY (`classid`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teaches_foreign_tid` FOREIGN KEY (`tid`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teaches
-- ----------------------------
INSERT INTO `teaches` VALUES ('0101', '0101', '101');
INSERT INTO `teaches` VALUES ('0101', '0101', '102');
INSERT INTO `teaches` VALUES ('0102', '0101', '201');
INSERT INTO `teaches` VALUES ('0102', '0101', '202');
INSERT INTO `teaches` VALUES ('0101', '0102', '201');
INSERT INTO `teaches` VALUES ('0101', '0102', '202');
INSERT INTO `teaches` VALUES ('0103', '0102', '201');
INSERT INTO `teaches` VALUES ('0103', '0102', '202');
INSERT INTO `teaches` VALUES ('0102', '0103', '101');
INSERT INTO `teaches` VALUES ('0102', '0103', '102');
INSERT INTO `teaches` VALUES ('0105', '0103', '101');
INSERT INTO `teaches` VALUES ('0105', '0103', '102');
INSERT INTO `teaches` VALUES ('0103', '0104', '101');
INSERT INTO `teaches` VALUES ('0103', '0104', '102');
INSERT INTO `teaches` VALUES ('0104', '0104', '201');
INSERT INTO `teaches` VALUES ('0104', '0104', '202');
INSERT INTO `teaches` VALUES ('0201', '0104', '101');
INSERT INTO `teaches` VALUES ('0201', '0104', '102');
INSERT INTO `teaches` VALUES ('0201', '0104', '201');
INSERT INTO `teaches` VALUES ('0201', '0104', '202');
INSERT INTO `teaches` VALUES ('0203', '0106', '101');
INSERT INTO `teaches` VALUES ('0203', '0106', '102');
INSERT INTO `teaches` VALUES ('0203', '0106', '201');
INSERT INTO `teaches` VALUES ('0203', '0106', '202');
INSERT INTO `teaches` VALUES ('0204', '0107', '101');
INSERT INTO `teaches` VALUES ('0204', '0107', '102');
INSERT INTO `teaches` VALUES ('0204', '0107', '201');
INSERT INTO `teaches` VALUES ('0204', '0107', '202');

-- ----------------------------
-- Table structure for usr
-- ----------------------------
DROP TABLE IF EXISTS `usr`;
CREATE TABLE `usr`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of usr
-- ----------------------------
INSERT INTO `usr` VALUES ('admin', 'admin');

-- ----------------------------
-- View structure for grade
-- ----------------------------
DROP VIEW IF EXISTS `grade`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `grade` AS select selectcourse.sid as sid,student.name as sname,student.classid as classid,course.id as cid,course.name as cname,credit,period,startdate,enddate,type,teacher.id as tid,teacher.name as tname,score  from course,selectcourse,teacher,student
	where course.id=selectcourse.cid and teacher.id=selectcourse.tid and selectcourse.sid=student.id ;

-- ----------------------------
-- View structure for teachclass
-- ----------------------------
DROP VIEW IF EXISTS `teachclass`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `teachclass` AS select cid,course.name as cname,tid,classid,class.name as classname,number from teaches,course,teacher,class
	where teaches.tid=teacher.id and class.id=teaches.classid and course.id=teaches.cid ;

-- ----------------------------
-- View structure for teachecourse
-- ----------------------------
DROP VIEW IF EXISTS `teachecourse`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `teachecourse` AS select cid,course.name as cname,credit,period,startdate,enddate,type,tid,teacher.name as tname from teachcourse,teacher,course
	where teachcourse.cid=course.id and teachcourse.tid=teacher.id ;

SET FOREIGN_KEY_CHECKS = 1;
