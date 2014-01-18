/*
Server Type    : MYSQL
Server Version : 5.0
Server DB-NAME :jouryney_info_db
create-time: 2014-01-12 12:00:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_example（样例表）` 
-- ----------------------------
DROP TABLE IF EXISTS `t_example`;
CREATE TABLE `t_example` (
  `example_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '样例int类型值',
  `example_name1` char(8) NOT NULL COMMENT '样例char类型值',
  `example_name2` varchar(8) NOT NULL COMMENT '样例varchar类型值',
  `example_name3` longtext DEFAULT NULL COMMENT '样例longtext类型值',
  `example_name4` datetime DEFAULT NULL COMMENT '样例datetime类型值',
  PRIMARY KEY (`example_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_user（平台用户注册表）` 
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(60) NOT NULL COMMENT '用户邮箱',
  `password` varchar(60) NOT NULL COMMENT '登录密码',
  `nickname` varchar(60) DEFAULT NULL COMMENT '用户昵称',
  `city_id` varchar(12) DEFAULT NULL COMMENT '用户所在地市',
  `register_time` datetime  COMMENT '用户注册时间',
  `latest_login_time` datetime DEFAULT NULL COMMENT '用户最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_user_information（平台用户基本信息表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_information`;
CREATE TABLE `t_user_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `gender` char(1) NOT NULL COMMENT '用户性别，1男，2女',
  `constellation` char(2) DEFAULT NULL COMMENT '用户星座',
  `age` char(10) DEFAULT NULL COMMENT '用户出生年月',
  `emotion` char(1) DEFAULT '1' COMMENT '1单身，2已婚',
  `contact` varchar(20) DEFAULT NULL COMMENT '用户联系方式',
  `character` varchar(120) DEFAULT NULL COMMENT '用户人品',
  `ideal_friend` varchar(120) DEFAULT NULL COMMENT '用户朋友',
  `savour` varchar(60) DEFAULT NULL COMMENT '用户兴趣',
  `plan` varchar(120) DEFAULT NULL COMMENT '用户计划',
  `recommend` varchar(120) DEFAULT NULL COMMENT '用户喜欢的',
  `head_img` varchar(120) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_user_information ADD CONSTRAINT fk_t_user_information_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_user_travels（用户游记表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_travels`;
CREATE TABLE `t_user_travels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `city_id` varchar(12) DEFAULT NULL COMMENT '游记地市',
  `travels_title` varchar(120) NOT NULL COMMENT '游记标题',
  `travels_content` longtext DEFAULT NULL COMMENT '游记内容',
  `write_time` datetime DEFAULT NULL COMMENT '录入时间',
  `latest_update_time` datetime  COMMENT '最后编辑时间',
  `release_status` char(1) DEFAULT '0' COMMENT '文章发表状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_user_travels ADD CONSTRAINT fk_t_user_travels_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_user_photo(用户相册表)`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_photo`;
CREATE TABLE `t_user_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `photo_createtime` datetime NOT NULL COMMENT '相册创建时间',
  `photo_title` varchar(120) DEFAULT NULL COMMENT '相册标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_user_photo ADD CONSTRAINT fk_t_user_photo_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_user_photo_detail（用户相册详细表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_photo_detail`;
CREATE TABLE `t_user_photo_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL COMMENT '相册编号',
  `picture_name` varchar(120) NOT NULL COMMENT '照片名称',
  `picture_path` varchar(256) NOT NULL COMMENT '照片路径',
  `picture_upload_time` datetime NOT NULL COMMENT '照片上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_user_photo_detail ADD CONSTRAINT fk_t_user_photo_photoid FOREIGN KEY(photo_id) REFERENCES t_user_photo(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_user_problem（用户提问表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_problem`;
CREATE TABLE `t_user_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `problem_title` varchar(60) NOT NULL COMMENT '问题标题',
  `problem_description` varchar(1000) DEFAULT NULL COMMENT '问题内容',
  `problem_time` datetime NOT NULL COMMENT '提问时间',
  `problem_examine` boolean DEFAULT false COMMENT '管理员审核状态',
  `problem_state` char(1) DEFAULT '0' COMMENT '提问状态',
  `problem_city` char(12) DEFAULT NULL COMMENT '提问城市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_user_problem ADD CONSTRAINT fk_t_user_problem_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_user_answer（用户回答表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_answer`;
CREATE TABLE `t_user_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `problem_id` int(11) NOT NULL COMMENT '问题ID',
  `answer_content` varchar(1000) DEFAULT NULL COMMENT '回答问题内容',
  `answer_time` datetime NOT NULL COMMENT '回答时间',
  `answer_adopt` boolean DEFAULT false COMMENT '是否被采纳',
  `answer_examine` boolean DEFAULT false COMMENT '管理员审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_user_answer ADD CONSTRAINT fk_t_user_answer_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE t_user_answer ADD CONSTRAINT fk_t_user_answer_problemid FOREIGN KEY(problem_id) REFERENCES t_user_problem(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_answer_integral（用户问答积分表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_answer_integral`;
CREATE TABLE `t_answer_integral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `answer_fraction` int(11) DEFAULT 0 COMMENT '回答总积分',
  `adopt_number` int(11) DEFAULT 0 COMMENT '回答总采纳问题个数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_answer_integral ADD CONSTRAINT fk_t_answer_integral_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_user_tribe（用户部落）`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_tribe`;
CREATE TABLE `t_user_tribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `tribe_name` varchar(60) DEFAULT NULL COMMENT '用户部落名称',
  `tribe_content` longtext DEFAULT NULL COMMENT '用户部落介绍',
  `tribe_notice` varchar(120) DEFAULT NULL COMMENT '部落公告',
  `tribe_img` varchar(120) DEFAULT NULL COMMENT '部落海报',
  `tribe_time` datetime NOT NULL COMMENT '部落创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_user_tribe ADD CONSTRAINT fk_t_user_tribe_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;


-- ----------------------------
-- Table structure for `t_tribe_members（部落成员）`
-- ----------------------------
DROP TABLE IF EXISTS `t_tribe_members`;
CREATE TABLE `t_tribe_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `tribe_id` int(11) NOT NULL COMMENT '部落id',
  `participant_time` datetime NOT NULL COMMENT '加入部落时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_tribe_members ADD CONSTRAINT fk_t_tribe_members_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE t_tribe_members ADD CONSTRAINT fk_t_tribe_members_tribeid FOREIGN KEY(tribe_id) REFERENCES t_user_tribe(id) ON DELETE CASCADE ON UPDATE CASCADE;


-- ----------------------------
-- Table structure for `t_tribe_topic（部落话题以及计划）`
-- ----------------------------
DROP TABLE IF EXISTS `t_tribe_topic`;
CREATE TABLE `t_tribe_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `tribe_id` int(11) NOT NULL COMMENT '部落id',
  `topic_title` varchar(60) DEFAULT NULL COMMENT '话题标题',
  `topic_content` longtext DEFAULT NULL COMMENT '话题详细内容',
  `topic_time` datetime NOT NULL COMMENT '话题发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_tribe_topic ADD CONSTRAINT fk_t_tribe_topic_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE t_tribe_topic ADD CONSTRAINT fk_t_tribe_topic_tribeid FOREIGN KEY(tribe_id) REFERENCES t_user_tribe(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_tribe_reply（部落话题回复表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_tribe_reply`;
CREATE TABLE `t_tribe_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `topic_id` int(11) NOT NULL COMMENT '话题id',
  `reply_content` varchar(1000) DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime NOT NULL COMMENT '话题回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_tribe_reply ADD CONSTRAINT fk_t_tribe_reply_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE t_tribe_reply ADD CONSTRAINT fk_t_tribe_reply_topicid FOREIGN KEY(topic_id) REFERENCES t_tribe_topic(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_activities_type（同城活动类型表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_activities_type`;
CREATE TABLE `t_activities_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL COMMENT '类型ID',
  `type_name` varchar(20) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_city_activities（同城活动表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_city_activities`;
CREATE TABLE `t_city_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `activities_type_id` int(11) NOT NULL COMMENT '同城活动类型',
  `activities_title` varchar(60) DEFAULT NULL COMMENT '同城活动标题',
  `activities_content` longtext DEFAULT NULL COMMENT '同城活动详细说明',
  `activities_start_time` datetime DEFAULT NULL COMMENT '同城活动开始时间',
  `activities_end_time` datetime DEFAULT NULL COMMENT '同城活动结束时间',
  `activities_city_id` varchar(12) DEFAULT NULL COMMENT '同城活动所在地市',
  `activities_area_id` varchar(12) DEFAULT NULL COMMENT '同城活动所在地市区',
  `activities_address` varchar(120) DEFAULT NULL COMMENT '同城活动详细地址',
  `activities_img` varchar(120) DEFAULT NULL COMMENT '同城活动海报',
  `activities_free` char(1) DEFAULT '0' COMMENT '是否收费',
  `bill_name` varchar(60) DEFAULT NULL COMMENT '消费项目名称',
  `bill_much` varchar(20) DEFAULT NULL COMMENT '消费金额',
  `activities_create_time` datetime DEFAULT NULL COMMENT '活动创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_city_activities ADD CONSTRAINT fk_t_city_activities_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_activities_enroll（同城活动报名表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_activities_enroll`;
CREATE TABLE `t_activities_enroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `activities_id` int(11) NOT NULL COMMENT '活动id',
  `enroll_time` datetime NOT NULL COMMENT '报名时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_activities_enroll ADD CONSTRAINT fk_t_activities_enroll_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_activities_topic（同城活动话题表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_activities_topic`;
CREATE TABLE `t_activities_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `activities_id` int(11) NOT NULL COMMENT '活动id',
  `topic_title` varchar(60) NOT NULL COMMENT '话题标题',
  `topic_content` varchar(1000) DEFAULT NULL COMMENT '话题内容', 
  `topic_time` datetime DEFAULT NULL COMMENT '话题发表时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_activities_topic ADD CONSTRAINT fk_t_activities_topic_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_activities_reply（同城活动话题回复表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_activities_reply`;
CREATE TABLE `t_activities_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `topic_id` int(11) NOT NULL COMMENT '活动id',
  `reply_content` varchar(1000) DEFAULT NULL COMMENT '话题回复内容', 
  `reply_time` datetime DEFAULT NULL COMMENT '话题回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_activities_reply ADD CONSTRAINT fk_t_activities_reply_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE t_activities_reply ADD CONSTRAINT fk_t_activities_reply_topicid FOREIGN KEY(uid) REFERENCES t_activities_topic(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_associate_tour（结伴旅游表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_associate_tour`;
CREATE TABLE `t_associate_tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `tour_title` varchar(60) DEFAULT NULL COMMENT '活动名称',
  `tour_content` longtext DEFAULT NULL COMMENT '活动详细内容',
  `tour_start_time` datetime DEFAULT NULL COMMENT '活动开始时间', 
  `tour_end_time` datetime DEFAULT NULL COMMENT '活动结束时间', 
  `tour_img` varchar(120) DEFAULT NULL COMMENT '活动海报', 
  `tour_create_time` datetime NOT NULL COMMENT '活动发起时间',
  `termini_id` varchar(12) DEFAULT NULL COMMENT '目的地',
  `departure_city` varchar(12) DEFAULT NULL COMMENT '出发地',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_associate_tour ADD CONSTRAINT fk_t_associate_tour_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_tour_enroll（结伴旅游报名表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_tour_enroll`;
CREATE TABLE `t_tour_enroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `tour_id` int(11) NOT NULL COMMENT '活动id',
  `enroll_time` datetime NOT NULL COMMENT '报名时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_tour_enroll ADD CONSTRAINT fk_t_tour_enroll_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_tour_label（结伴旅游标签表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_tour_label`;
CREATE TABLE `t_tour_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL COMMENT '标签ID',
  `type_name` varchar(60) DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_tour_relevancy_label（结伴同游标签关联表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_tour_relevancy_label`;
CREATE TABLE `t_tour_relevancy_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) DEFAULT NULL COMMENT '结伴旅游活动表ID',
  `type_id` int(11) DEFAULT NULL COMMENT '结伴同游标签ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_tour_relevancy_label ADD CONSTRAINT fk_t_tour_relevancy_label_tourid FOREIGN KEY(tour_id) REFERENCES t_associate_tour(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE t_tour_relevancy_label ADD CONSTRAINT fk_t_tour_relevancy_label_typeid FOREIGN KEY(type_id) REFERENCES t_tour_label(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_tour_termini（结伴同游目的地表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_tour_termini`;
CREATE TABLE `t_tour_termini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `termini_id` int(11) DEFAULT NULL COMMENT '目的地ID',
  `termini_name` varchar(60) DEFAULT NULL COMMENT '目的地名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_tour_topic（结伴同游话题表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_tour_topic`;
CREATE TABLE `t_tour_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `topic_content` varchar(1000) DEFAULT NULL COMMENT '结伴同游话题内容',
  `tour_id` int(11) NOT NULL COMMENT '结伴同游id',
  `topic_time` datetime NOT NULL COMMENT '话题发表时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_tour_topic ADD CONSTRAINT fk_t_tour_topic_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_tour_reply（结伴活动话题回复表）`
-- ----------------------------
DROP TABLE IF EXISTS `t_tour_reply`;
CREATE TABLE `t_tour_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `reply_content` varchar(1000) DEFAULT NULL COMMENT '结伴同游话题回复内容',
  `tour_id` int(11) NOT NULL COMMENT '结伴同游话题id',
  `reply_time` datetime NOT NULL COMMENT '话题回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
ALTER TABLE t_tour_reply ADD CONSTRAINT fk_t_tour_reply_uid FOREIGN KEY(uid) REFERENCES t_user(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE t_tour_reply ADD CONSTRAINT fk_t_tour_reply_tourid FOREIGN KEY(tour_id) REFERENCES t_tour_topic(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_province`
-- ----------------------------
DROP TABLE IF EXISTS `t_province`;
CREATE TABLE `t_province` (
  `province_code` varchar(12) NOT NULL COMMENT '省编码',
  `province_name` varchar(60) NOT NULL COMMENT '省名称',
  PRIMARY KEY (`province_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_city`
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `city_code` varchar(12) NOT NULL COMMENT '地市编码',
  `city_name` varchar(60) NOT NULL COMMENT '地市名称',
  `province_code` varchar(12) NOT NULL COMMENT '省编码',
  PRIMARY KEY (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE t_city ADD CONSTRAINT fk_t_city_provincecode FOREIGN KEY(province_code) REFERENCES t_province(province_code) ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Table structure for `t_district`
-- ----------------------------
DROP TABLE IF EXISTS `t_district`;
CREATE TABLE `t_district` (
  `district_code` varchar(12) NOT NULL COMMENT '区编码',
  `province_code` varchar(12) NOT NULL COMMENT '省编码',
  `city_code` varchar(12) NOT NULL COMMENT '地市编码',
  `district_name` varchar(60) NOT NULL COMMENT '区名称',
  PRIMARY KEY (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE t_district ADD CONSTRAINT fk_t_district_provincecode FOREIGN KEY(province_code) REFERENCES t_province(province_code) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE t_district ADD CONSTRAINT fk_t_district_citycode FOREIGN KEY(city_code) REFERENCES t_city(city_code) ON DELETE CASCADE ON UPDATE CASCADE;
