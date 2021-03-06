SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(0) NOT NULL,
  `SCHED_TIME` bigint(0) NOT NULL,
  `PRIORITY` int(0) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000170DC7532287874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(0) NOT NULL,
  `CHECKIN_INTERVAL` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'DESKTOP-0PL117V1632666332347', 1632667679867, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(0) NOT NULL,
  `REPEAT_INTERVAL` bigint(0) NOT NULL,
  `TIMES_TRIGGERED` bigint(0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(0) NULL DEFAULT NULL,
  `INT_PROP_2` int(0) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(0) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(0) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(0) NULL DEFAULT NULL,
  `PRIORITY` int(0) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(0) NOT NULL,
  `END_TIME` bigint(0) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(0) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1632668400000, 1632666600000, 5, 'WAITING', 'CRON', 1584246824000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000170DC7532287874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `news_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `news_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '????????????',
  `author_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '?????????',
  `header_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '??????url',
  `comment_count` int(0) NULL DEFAULT NULL COMMENT '?????????',
  `release_date` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `type` int(0) NULL DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '?????????????????????????????? ?????????Steam???????????????', '3DMGAME', 'https://p9.pstatp.com/thumb/6eed00026c4eac713a44', 3, '2020-07-31 22:23:00', 1);
INSERT INTO `news` VALUES (2, '??????????????????????????????????????????????????????????????????????????????????????????', '?????????????????????', 'https://p3.pstatp.com/thumb/43310001daafa9723ddf', 1, '2020-07-31 21:01:17', 2);
INSERT INTO `news` VALUES (3, '????????????Ready for PlayStation 5????????????', '????????????VGtime', 'https://p1.pstatp.com/thumb/dc0c0004c450216ab2f3', 6, '2020-07-30 13:11:32', 3);
INSERT INTO `news` VALUES (4, '???????????????????????????????????????????????????????????????', '???????????????', 'https://sf3-ttcdn-tos.pstatp.com/img/pgc-image/e200b9de317b4e73af24299ea063bec2~120x256.image', 12, '2020-07-30 13:11:32', 3);
INSERT INTO `news` VALUES (5, '???????????????????????????Q&A ????????????????????????????????????', '???????????????', 'https://sf6-ttcdn-tos.pstatp.com/img/pgc-image/2bfe5f2e082e415cb92a03cfcfcfead8~120x256.image', 4, '2020-08-01 08:22:47', 2);
INSERT INTO `news` VALUES (6, '2020??????????????????????????????????????????', '???????????????', 'https://sf3-ttcdn-tos.pstatp.com/img/mosaic-legacy/dc0d0001fca5e747f267~120x256.image', 7, '2020-07-30 12:48:37', 1);
INSERT INTO `news` VALUES (7, 'NBA????????????????????????????????????????????????????????????????????????????????????', '????????????', 'https://sf1-ttcdn-tos.pstatp.com/img/mosaic-legacy/ffbc0000ad1e717b76a6~120x256.image', 23, '2020-08-01 06:49:44', 1);
INSERT INTO `news` VALUES (8, 'NBA???????????????????????????????????????95???4?????????????????????????????????2???', '????????????', 'https://sf6-ttcdn-tos.pstatp.com/img/pgc-image/9f11654ff6184afd8941bcf7ccd3c5dd~120x256.image', 45, '2020-05-23 14:08:09', 2);

-- ----------------------------
-- Table structure for news_thumb
-- ----------------------------
DROP TABLE IF EXISTS `news_thumb`;
CREATE TABLE `news_thumb`  (
  `thumb_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '?????????id',
  `thumb_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '?????????url',
  `news_id` int(0) NULL DEFAULT NULL COMMENT '??????id',
  PRIMARY KEY (`thumb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_thumb
-- ----------------------------
INSERT INTO `news_thumb` VALUES (1, 'http://p1-tt.byteimg.com/large/pgc-image/S6KR5958Y5X2Qt?from=pc', 1);
INSERT INTO `news_thumb` VALUES (2, 'http://p1-tt.byteimg.com/large/pgc-image/714415d37865444ca2bef51eb1706cda?from=pc', 2);
INSERT INTO `news_thumb` VALUES (3, 'http://p1-tt.byteimg.com/large/pgc-image/33b9831739764bdb8a157efce048ec85?from=pc', 2);
INSERT INTO `news_thumb` VALUES (4, 'http://p3-tt.byteimg.com/large/pgc-image/c8a4e737b54d41c1a84722fc1c6d191d?from=pc', 2);
INSERT INTO `news_thumb` VALUES (5, 'http://p6-tt.byteimg.com/large/pgc-image/S6CLixgC4HSrXD?from=pc', 3);
INSERT INTO `news_thumb` VALUES (6, 'http://p3-tt.byteimg.com/large/pgc-image/02973348d57d4dfba2d001f82caa3fcc?from=pc', 4);
INSERT INTO `news_thumb` VALUES (7, 'http://p1-tt.byteimg.com/large/pgc-image/a456c50fff344122b1b20ed99026c3f8?from=pc', 5);
INSERT INTO `news_thumb` VALUES (8, 'http://p3-tt.byteimg.com/large/pgc-image/02973348d57d4dfba2d001f82caa3fcc?from=pc', 5);
INSERT INTO `news_thumb` VALUES (9, 'http://p1-tt.byteimg.com/large/pgc-image/7add3e2a4f754d0baccc607cde132b5f?from=pc', 5);
INSERT INTO `news_thumb` VALUES (10, 'http://p1-tt.byteimg.com/large/pgc-image/b957bfacdd134aa9a1a7e47d40d1be4b?from=pc', 6);
INSERT INTO `news_thumb` VALUES (11, 'https://p3.pstatp.com/list/190x124/pgc-image/2b5f07505b67498e83e2faa32d637e5c', 7);
INSERT INTO `news_thumb` VALUES (12, 'https://p3.pstatp.com/list/190x124/pgc-image/2b5f07505b67498e83e2faa32d637e5c', 8);
INSERT INTO `news_thumb` VALUES (13, 'https://p3.pstatp.com/list/190x124/pgc-image/2b5f07505b67498e83e2faa32d637e5c', 8);
INSERT INTO `news_thumb` VALUES (14, 'https://p3.pstatp.com/list/190x124/pgc-image/2b5f07505b67498e83e2faa32d637e5c', 8);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean??????',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron?????????',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '????????????  0?????????  1?????????',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '????????????', '2020-03-15 12:30:33');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '????????????id',
  `job_id` bigint(0) NOT NULL COMMENT '??????id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'spring bean??????',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `status` tinyint(0) NOT NULL COMMENT '????????????    0?????????    1?????????',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `times` int(0) NOT NULL COMMENT '??????(???????????????)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 0, '2020-03-15 15:30:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-15 16:00:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-15 17:30:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-15 18:00:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 5, '2020-03-15 20:00:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-15 20:30:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 2, '2020-03-15 21:00:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-15 21:30:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 4, '2020-03-15 22:00:00');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 0, '2020-03-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-16 10:00:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-17 17:00:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 2, '2020-03-17 17:30:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 3, '2020-03-17 18:00:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 3, '2020-03-17 18:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 3, '2020-03-17 19:00:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 0, '2020-03-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 1, '2020-03-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 0, '2020-04-20 12:00:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 2, '2020-04-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 0, '2020-04-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 1, '2020-04-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 1, '2020-04-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 1, '2020-04-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 1, '2020-04-20 15:30:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-05 21:30:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-05 22:00:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-14 23:00:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-14 23:30:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 28, '2020-05-15 00:00:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 2, '2020-05-15 00:30:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 2, '2020-06-08 23:30:00');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 14, '2020-06-09 00:00:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 2, '2020-06-09 00:30:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-11 15:00:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-13 18:30:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-13 19:00:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-14 13:30:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-14 14:00:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 0, '2020-06-14 14:30:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 4, '2020-06-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 2, '2020-06-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 13, '2020-06-19 00:00:00');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 2, '2020-06-19 00:30:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 0, '2020-06-19 09:00:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 0, '2020-06-19 22:30:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 2, '2020-06-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 0, '2020-06-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-20 18:00:00');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-20 18:30:00');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-20 19:00:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 7, '2020-06-26 23:00:00');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-26 23:30:00');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 24, '2020-06-27 00:00:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 2, '2020-06-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 1, '2020-06-27 13:00:00');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 2, '2020-06-27 13:30:00');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-05 20:30:00');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 2, '2020-07-05 21:00:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-05 21:30:00');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-05 22:00:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-05 22:30:00');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-06 21:30:00');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-06 22:00:00');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-06 23:00:00');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-06 23:30:00');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 7, '2020-07-07 00:00:00');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 2, '2020-07-07 00:30:00');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-07 22:00:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 2, '2020-07-07 22:30:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 2, '2020-07-07 23:00:00');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-07 23:30:00');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 7, '2020-07-08 00:00:00');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 2, '2020-07-08 00:30:00');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-08 01:00:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 6, '2020-07-13 00:00:00');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-13 00:30:00');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-14 23:30:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 5, '2020-07-15 00:00:00');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-15 00:30:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-15 22:30:00');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-15 23:30:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 2, '2020-07-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 2, '2020-07-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 21:00:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 21:30:00');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 22:00:00');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 0, '2020-07-19 22:30:00');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 1, '2020-07-19 23:30:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 33, '2020-07-20 00:00:00');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 2, '2020-07-29 16:00:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 2, '2020-08-01 00:30:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-01 01:00:00');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-01 01:30:00');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-01 11:00:00');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-01 11:30:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-01 12:00:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-01 12:30:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-01 13:00:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-01 13:30:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-01 14:00:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-01 14:30:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-01 15:00:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-01 15:30:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-01 16:30:00');
INSERT INTO `schedule_job_log` VALUES (126, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-02 14:00:00');
INSERT INTO `schedule_job_log` VALUES (127, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-02 14:30:00');
INSERT INTO `schedule_job_log` VALUES (128, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-02 15:00:00');
INSERT INTO `schedule_job_log` VALUES (129, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-02 15:30:00');
INSERT INTO `schedule_job_log` VALUES (130, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-02 16:00:00');
INSERT INTO `schedule_job_log` VALUES (131, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-02 16:30:00');
INSERT INTO `schedule_job_log` VALUES (132, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-02 17:00:00');
INSERT INTO `schedule_job_log` VALUES (133, 1, 'testTask', 'renren', 0, NULL, 2, '2020-08-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES (134, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-03 22:30:00');
INSERT INTO `schedule_job_log` VALUES (135, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-03 23:00:00');
INSERT INTO `schedule_job_log` VALUES (136, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-03 23:30:00');
INSERT INTO `schedule_job_log` VALUES (137, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-05 22:00:00');
INSERT INTO `schedule_job_log` VALUES (138, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-05 23:00:00');
INSERT INTO `schedule_job_log` VALUES (139, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-05 23:30:00');
INSERT INTO `schedule_job_log` VALUES (140, 1, 'testTask', 'renren', 0, NULL, 4, '2020-08-06 00:00:00');
INSERT INTO `schedule_job_log` VALUES (141, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-06 00:30:00');
INSERT INTO `schedule_job_log` VALUES (142, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-11 09:30:00');
INSERT INTO `schedule_job_log` VALUES (143, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-11 10:00:00');
INSERT INTO `schedule_job_log` VALUES (144, 1, 'testTask', 'renren', 0, NULL, 2, '2020-08-16 22:30:00');
INSERT INTO `schedule_job_log` VALUES (145, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-16 23:00:00');
INSERT INTO `schedule_job_log` VALUES (146, 1, 'testTask', 'renren', 0, NULL, 2, '2020-08-16 23:30:00');
INSERT INTO `schedule_job_log` VALUES (147, 1, 'testTask', 'renren', 0, NULL, 18, '2020-08-17 00:00:00');
INSERT INTO `schedule_job_log` VALUES (148, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-17 00:30:00');
INSERT INTO `schedule_job_log` VALUES (149, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES (150, 1, 'testTask', 'renren', 0, NULL, 2, '2020-08-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES (151, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES (152, 1, 'testTask', 'renren', 0, NULL, 0, '2020-08-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES (153, 1, 'testTask', 'renren', 0, NULL, 1, '2020-08-26 17:30:00');
INSERT INTO `schedule_job_log` VALUES (154, 1, 'testTask', 'renren', 0, NULL, 0, '2020-09-06 18:00:00');
INSERT INTO `schedule_job_log` VALUES (155, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-06 18:30:00');
INSERT INTO `schedule_job_log` VALUES (156, 1, 'testTask', 'renren', 0, NULL, 0, '2020-09-06 19:00:00');
INSERT INTO `schedule_job_log` VALUES (157, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-06 19:30:00');
INSERT INTO `schedule_job_log` VALUES (158, 1, 'testTask', 'renren', 0, NULL, 0, '2020-09-06 20:00:00');
INSERT INTO `schedule_job_log` VALUES (159, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-06 20:30:00');
INSERT INTO `schedule_job_log` VALUES (160, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES (161, 1, 'testTask', 'renren', 0, NULL, 0, '2020-09-06 21:30:00');
INSERT INTO `schedule_job_log` VALUES (162, 1, 'testTask', 'renren', 0, NULL, 0, '2020-09-06 22:00:00');
INSERT INTO `schedule_job_log` VALUES (163, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-06 22:30:00');
INSERT INTO `schedule_job_log` VALUES (164, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-06 23:00:00');
INSERT INTO `schedule_job_log` VALUES (165, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-16 22:00:00');
INSERT INTO `schedule_job_log` VALUES (166, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-16 22:30:00');
INSERT INTO `schedule_job_log` VALUES (167, 1, 'testTask', 'renren', 0, NULL, 2, '2020-09-16 23:00:00');
INSERT INTO `schedule_job_log` VALUES (168, 1, 'testTask', 'renren', 0, NULL, 2, '2020-09-16 23:30:00');
INSERT INTO `schedule_job_log` VALUES (169, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-17 00:30:00');
INSERT INTO `schedule_job_log` VALUES (170, 1, 'testTask', 'renren', 0, NULL, 0, '2020-09-28 10:00:00');
INSERT INTO `schedule_job_log` VALUES (171, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-28 10:30:00');
INSERT INTO `schedule_job_log` VALUES (172, 1, 'testTask', 'renren', 0, NULL, 2, '2020-09-28 11:00:00');
INSERT INTO `schedule_job_log` VALUES (173, 1, 'testTask', 'renren', 0, NULL, 1, '2020-09-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES (174, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-03 11:00:00');
INSERT INTO `schedule_job_log` VALUES (175, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-03 12:30:00');
INSERT INTO `schedule_job_log` VALUES (176, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-03 13:00:00');
INSERT INTO `schedule_job_log` VALUES (177, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-03 13:30:00');
INSERT INTO `schedule_job_log` VALUES (178, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-03 22:30:00');
INSERT INTO `schedule_job_log` VALUES (179, 1, 'testTask', 'renren', 0, NULL, 5, '2020-10-04 00:00:00');
INSERT INTO `schedule_job_log` VALUES (180, 1, 'testTask', 'renren', 0, NULL, 2, '2020-10-04 00:30:00');
INSERT INTO `schedule_job_log` VALUES (181, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-04 01:00:00');
INSERT INTO `schedule_job_log` VALUES (182, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-04 01:30:00');
INSERT INTO `schedule_job_log` VALUES (183, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-04 02:00:00');
INSERT INTO `schedule_job_log` VALUES (184, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-04 02:30:00');
INSERT INTO `schedule_job_log` VALUES (185, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-04 03:00:00');
INSERT INTO `schedule_job_log` VALUES (186, 1, 'testTask', 'renren', 0, NULL, 1, '2020-10-04 03:30:00');
INSERT INTO `schedule_job_log` VALUES (187, 1, 'testTask', 'renren', 0, NULL, 0, '2020-10-04 04:00:00');
INSERT INTO `schedule_job_log` VALUES (188, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES (189, 1, 'testTask', 'renren', 0, NULL, 2, '2021-06-27 23:00:00');
INSERT INTO `schedule_job_log` VALUES (190, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-27 23:30:00');
INSERT INTO `schedule_job_log` VALUES (191, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 22:30:00');
INSERT INTO `schedule_job_log` VALUES (192, 1, 'testTask', 'renren', 0, NULL, 1, '2021-07-06 10:00:00');
INSERT INTO `schedule_job_log` VALUES (193, 1, 'testTask', 'renren', 0, NULL, 1, '2021-07-06 10:30:00');
INSERT INTO `schedule_job_log` VALUES (194, 1, 'testTask', 'renren', 0, NULL, 2, '2021-07-06 11:00:00');
INSERT INTO `schedule_job_log` VALUES (195, 1, 'testTask', 'renren', 0, NULL, 1, '2021-07-06 11:30:00');
INSERT INTO `schedule_job_log` VALUES (196, 1, 'testTask', 'renren', 0, NULL, 2, '2021-09-20 21:00:00');
INSERT INTO `schedule_job_log` VALUES (197, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-20 21:30:00');
INSERT INTO `schedule_job_log` VALUES (198, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-20 22:00:00');
INSERT INTO `schedule_job_log` VALUES (199, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-20 22:30:00');
INSERT INTO `schedule_job_log` VALUES (200, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-20 23:00:00');
INSERT INTO `schedule_job_log` VALUES (201, 1, 'testTask', 'renren', 0, NULL, 3, '2021-09-20 23:30:12');
INSERT INTO `schedule_job_log` VALUES (202, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-23 19:30:00');
INSERT INTO `schedule_job_log` VALUES (203, 1, 'testTask', 'renren', 0, NULL, 8, '2021-09-23 20:00:00');
INSERT INTO `schedule_job_log` VALUES (204, 1, 'testTask', 'renren', 0, NULL, 5, '2021-09-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES (205, 1, 'testTask', 'renren', 0, NULL, 1, '2021-09-26 19:30:00');
INSERT INTO `schedule_job_log` VALUES (206, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-26 20:00:00');
INSERT INTO `schedule_job_log` VALUES (207, 1, 'testTask', 'renren', 0, NULL, 0, '2021-09-26 22:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '?????????',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '???????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('047a9a96-6ebf-4c91-8198-154cc675e6b4', 'pcfcg', '2021-09-26 19:27:47');
INSERT INTO `sys_captcha` VALUES ('12', 'men8g', '2021-09-23 20:09:46');
INSERT INTO `sys_captcha` VALUES ('381cfdb2-2a69-4653-87af-68d0415b19bb', '7n4ga', '2020-08-03 23:12:43');
INSERT INTO `sys_captcha` VALUES ('3de67b53-d287-41e6-85fa-5d9432e9722b', '7ny73', '2020-03-15 19:36:51');
INSERT INTO `sys_captcha` VALUES ('47a06bd4-2e07-4ae8-8d7c-252dd6d8699e', '65fwm', '2020-08-03 23:17:50');
INSERT INTO `sys_captcha` VALUES ('4909766f-fe2c-4277-8507-ed1761c38a01', 'cnxcf', '2020-08-03 23:12:20');
INSERT INTO `sys_captcha` VALUES ('5f39812a-3a62-4d17-8c3e-c03ec66e61ca', '6yxx8', '2020-08-03 23:12:40');
INSERT INTO `sys_captcha` VALUES ('6515975d-9bae-4f61-8e4d-04a874e34a28', 'b7g65', '2020-08-03 23:12:14');
INSERT INTO `sys_captcha` VALUES ('6f89997a-282b-46f9-8e61-192501c19175', '4fe4f', '2020-08-03 23:17:57');
INSERT INTO `sys_captcha` VALUES ('7fc52f6c-517c-4883-8440-e99416a9d787', 'f5b4e', '2020-08-03 23:12:39');
INSERT INTO `sys_captcha` VALUES ('988631d3-69ef-4942-8fbb-35576900cb4f', '683an', '2021-09-26 22:49:24');
INSERT INTO `sys_captcha` VALUES ('a1ab51c8-c115-4e79-8da7-4d285cf3efd8', '7b3b7', '2020-08-20 16:25:58');
INSERT INTO `sys_captcha` VALUES ('a5409fe3-2a92-47cd-84e7-2845dad38591', 'benn5', '2020-08-01 13:18:24');
INSERT INTO `sys_captcha` VALUES ('asdsads', 'gfpxp', '2021-06-29 14:43:20');
INSERT INTO `sys_captcha` VALUES ('b038fd02-96d8-42aa-8466-f758178b8217', '2cd82', '2020-03-15 19:36:52');
INSERT INTO `sys_captcha` VALUES ('cc8070e6-5ffc-4cc4-8cb3-7978d8439ce7', 'fe2c8', '2020-08-03 23:12:31');
INSERT INTO `sys_captcha` VALUES ('d20ed40e-2c9b-4c27-88c6-a034af18ec7b', '7nna2', '2020-03-15 19:36:45');
INSERT INTO `sys_captcha` VALUES ('demoData', 'axcwp', '2020-08-20 15:32:58');
INSERT INTO `sys_captcha` VALUES ('dfd3378c-58c3-4f62-8f01-7c5e26aab62c', 'eed52', '2020-03-15 19:36:50');
INSERT INTO `sys_captcha` VALUES ('e67fc8a1-29e3-46cc-8613-202d56e3888b', 'wmdn6', '2020-08-01 13:16:03');
INSERT INTO `sys_captcha` VALUES ('ff97f28e-4ee2-4502-8e33-5b0d5a591ca3', 'daem7', '2020-08-20 16:26:10');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '??????   0?????????   1?????????',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '?????????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '?????????????????????');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '?????????',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `time` bigint(0) NOT NULL COMMENT '????????????(??????)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP??????',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"App????????????\",\"type\":0,\"icon\":\"bianji\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2020-07-19 12:44:14');
INSERT INTO `sys_log` VALUES (2, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"????????????\",\"url\":\"app/videolist\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2020-07-19 12:46:04');
INSERT INTO `sys_log` VALUES (3, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"??????\",\"perms\":\"app:videolist:list,app:videolist:info\",\"type\":2,\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2020-07-19 12:51:12');
INSERT INTO `sys_log` VALUES (4, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"??????\",\"perms\":\"app:videolist:save\",\"type\":2,\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2020-07-19 12:51:44');
INSERT INTO `sys_log` VALUES (5, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":32,\"name\":\"??????\",\"perms\":\"app:videolist:update\",\"type\":2,\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2020-07-19 12:52:10');
INSERT INTO `sys_log` VALUES (6, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":32,\"name\":\"??????\",\"perms\":\"app:videolist:delete\",\"type\":2,\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2020-07-19 12:52:30');
INSERT INTO `sys_log` VALUES (7, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":31,\"name\":\"????????????\",\"url\":\"app/videocategory\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 9, '0:0:0:0:0:0:0:1', '2020-07-19 15:57:26');
INSERT INTO `sys_log` VALUES (8, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":37,\"name\":\"??????\",\"url\":\"\",\"perms\":\"app:videocategory:list,app:videocategory:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 5, '0:0:0:0:0:0:0:1', '2020-07-19 15:58:13');
INSERT INTO `sys_log` VALUES (9, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":37,\"name\":\"??????\",\"url\":\"\",\"perms\":\"app:videocategory:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 20, '0:0:0:0:0:0:0:1', '2020-07-19 17:39:19');
INSERT INTO `sys_log` VALUES (10, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":37,\"name\":\"??????\",\"url\":\"\",\"perms\":\"app:videocategory:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2020-07-19 17:39:44');
INSERT INTO `sys_log` VALUES (11, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":37,\"name\":\"??????\",\"url\":\"\",\"perms\":\"app:videocategory:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 12, '0:0:0:0:0:0:0:1', '2020-07-19 17:40:02');
INSERT INTO `sys_log` VALUES (12, 'admin', '????????????', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"app\",\"remark\":\"app???????????????\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,35,36,37,38,39,40,41,-666666],\"createTime\":\"Jul 19, 2020 5:59:37 PM\"}]', 80, '0:0:0:0:0:0:0:1', '2020-07-19 17:59:38');
INSERT INTO `sys_log` VALUES (13, 'admin', '????????????', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 38, '0:0:0:0:0:0:0:1', '2020-07-19 18:00:21');
INSERT INTO `sys_log` VALUES (14, 'admin', '????????????', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"???????????????\",\"remark\":\"?????????????????????\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666],\"createTime\":\"Jul 19, 2020 6:01:42 PM\"}]', 47, '0:0:0:0:0:0:0:1', '2020-07-19 18:01:43');
INSERT INTO `sys_log` VALUES (15, 'admin', '????????????', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"root\",\"password\":\"c6db632acaff993431124f792982b3a84ddb67b12856adc314954a45d486795d\",\"salt\":\"aH1XLPH0wBuZq2kl2Pas\",\"email\":\"abc@123.com\",\"mobile\":\"18371458987\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jul 19, 2020 6:02:29 PM\"}]', 17, '0:0:0:0:0:0:0:1', '2020-07-19 18:02:30');
INSERT INTO `sys_log` VALUES (16, 'admin', '????????????', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"???????????????\",\"remark\":\"???????????????\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40,41,-666666],\"createTime\":\"Jul 19, 2020 6:03:06 PM\"}]', 62, '0:0:0:0:0:0:0:1', '2020-07-19 18:03:06');
INSERT INTO `sys_log` VALUES (17, 'admin', '????????????', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":5,\"username\":\"super\",\"password\":\"115dc8bb37d0925b7e6005c3081d58fa49b74d0ee0d0df98cb18aadef5023274\",\"salt\":\"N48VinVrrKjUkdYztiJe\",\"email\":\"123@qq.com\",\"mobile\":\"18371458526\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Jul 19, 2020 6:03:35 PM\"}]', 13, '0:0:0:0:0:0:0:1', '2020-07-19 18:03:35');
INSERT INTO `sys_log` VALUES (18, 'admin', '????????????', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 7, '0:0:0:0:0:0:0:1', '2020-07-19 18:03:51');
INSERT INTO `sys_log` VALUES (19, 'admin', '????????????', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":4,\"username\":\"root\",\"salt\":\"aH1XLPH0wBuZq2kl2Pas\",\"email\":\"abc@123.com\",\"mobile\":\"18371458987\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 8, '0:0:0:0:0:0:0:1', '2020-07-19 18:03:57');
INSERT INTO `sys_log` VALUES (20, 'admin', '????????????', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":4,\"username\":\"user\",\"salt\":\"aH1XLPH0wBuZq2kl2Pas\",\"email\":\"abc@123.com\",\"mobile\":\"18371458987\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 18, '0:0:0:0:0:0:0:1', '2020-07-19 18:04:06');
INSERT INTO `sys_log` VALUES (21, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":31,\"name\":\"????????????\",\"url\":\"app/news\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 19, '0:0:0:0:0:0:0:1', '2020-08-01 13:16:32');
INSERT INTO `sys_log` VALUES (22, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":42,\"name\":\"??????\",\"url\":\"\",\"perms\":\"app:news:list,app:news:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 14, '0:0:0:0:0:0:0:1', '2020-08-01 13:17:29');
INSERT INTO `sys_log` VALUES (23, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":42,\"name\":\"??????\",\"url\":\"\",\"perms\":\"app:news:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 4, '0:0:0:0:0:0:0:1', '2020-08-01 13:17:57');
INSERT INTO `sys_log` VALUES (24, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":42,\"name\":\"??????\",\"url\":\"\",\"perms\":\"app:news:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 13, '0:0:0:0:0:0:0:1', '2020-08-01 13:18:11');
INSERT INTO `sys_log` VALUES (25, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":42,\"name\":\"??????\",\"url\":\"\",\"perms\":\"app:news:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', 15, '0:0:0:0:0:0:0:1', '2020-08-01 13:18:25');
INSERT INTO `sys_log` VALUES (26, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"????????????\",\"url\":\"app/videolist\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0,\"list\":[]}]', 11, '0:0:0:0:0:0:0:1', '2021-09-26 19:46:49');
INSERT INTO `sys_log` VALUES (27, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[37]', 3, '0:0:0:0:0:0:0:1', '2021-09-26 19:52:36');
INSERT INTO `sys_log` VALUES (28, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[38]', 24, '0:0:0:0:0:0:0:1', '2021-09-26 19:52:45');
INSERT INTO `sys_log` VALUES (29, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[38]', 7, '0:0:0:0:0:0:0:1', '2021-09-26 19:52:47');
INSERT INTO `sys_log` VALUES (30, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[37]', 3, '0:0:0:0:0:0:0:1', '2021-09-26 19:52:51');
INSERT INTO `sys_log` VALUES (31, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[39]', 11, '0:0:0:0:0:0:0:1', '2021-09-26 19:52:55');
INSERT INTO `sys_log` VALUES (32, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[41]', 11, '0:0:0:0:0:0:0:1', '2021-09-26 19:53:02');
INSERT INTO `sys_log` VALUES (33, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[40]', 11, '0:0:0:0:0:0:0:1', '2021-09-26 19:53:08');
INSERT INTO `sys_log` VALUES (34, 'admin', '????????????', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[37]', 11, '0:0:0:0:0:0:0:1', '2021-09-26 19:53:14');
INSERT INTO `sys_log` VALUES (35, 'admin', '????????????', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@qq.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[2,3],\"createUserId\":1}]', 114, '0:0:0:0:0:0:0:1', '2021-09-26 20:02:54');
INSERT INTO `sys_log` VALUES (36, 'admin', '????????????', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@qq.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1}]', 15, '0:0:0:0:0:0:0:1', '2021-09-26 20:03:15');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '?????????ID??????????????????0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????(??????????????????????????????user:list,user:create)',
  `type` int(0) NULL DEFAULT NULL COMMENT '??????   0?????????   1?????????   2?????????',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `order_num` int(0) NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '????????????', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '???????????????', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '????????????', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '????????????', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL??????', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '????????????', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '??????', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '??????', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '??????', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '??????', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '??????', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '??????', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '????????????', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '????????????', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '??????', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '??????', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '??????', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '??????', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '??????', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '??????', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '??????', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '??????', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '??????', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '??????', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '??????', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '??????', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '????????????', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '????????????', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '????????????', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 0, 'App????????????', NULL, NULL, 0, 'bianji', 0);
INSERT INTO `sys_menu` VALUES (32, 31, '????????????', 'app/videolist', NULL, 1, 'zhedie', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '??????', NULL, 'app:videolist:list,app:videolist:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, 32, '??????', NULL, 'app:videolist:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, 32, '??????', NULL, 'app:videolist:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (36, 32, '??????', NULL, 'app:videolist:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (37, 31, '????????????', 'app/videocategory', '', 1, 'log', 0);
INSERT INTO `sys_menu` VALUES (38, 37, '??????', '', 'app:videocategory:list,app:videocategory:info', 2, '', 0);
INSERT INTO `sys_menu` VALUES (39, 37, '??????', '', 'app:videocategory:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (40, 37, '??????', '', 'app:videocategory:update', 2, '', 0);
INSERT INTO `sys_menu` VALUES (41, 37, '??????', '', 'app:videocategory:delete', 2, '', 0);
INSERT INTO `sys_menu` VALUES (42, 31, '????????????', 'app/news', NULL, 1, 'editor', 0);
INSERT INTO `sys_menu` VALUES (43, 42, '??????', '', 'app:news:list,app:news:info', 2, '', 0);
INSERT INTO `sys_menu` VALUES (44, 42, '??????', '', 'app:news:save', 2, '', 0);
INSERT INTO `sys_menu` VALUES (45, 42, '??????', '', 'app:news:update', 2, '', 0);
INSERT INTO `sys_menu` VALUES (46, 42, '??????', '', 'app:news:delete', 2, '', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'URL??????',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '????????????',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `create_user_id` bigint(0) NULL DEFAULT NULL COMMENT '?????????ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'app', 'app???????????????', 1, '2021-07-06 17:59:38');
INSERT INTO `sys_role` VALUES (2, '???????????????', '?????????????????????', 1, '2020-07-19 18:01:43');
INSERT INTO `sys_role` VALUES (3, '???????????????', '???????????????', 1, '2021-07-06 18:03:06');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '??????ID',
  `menu_id` bigint(0) NULL DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '???????????????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 31);
INSERT INTO `sys_role_menu` VALUES (2, 1, 32);
INSERT INTO `sys_role_menu` VALUES (3, 1, 33);
INSERT INTO `sys_role_menu` VALUES (4, 1, 34);
INSERT INTO `sys_role_menu` VALUES (5, 1, 35);
INSERT INTO `sys_role_menu` VALUES (6, 1, 36);
INSERT INTO `sys_role_menu` VALUES (12, 1, -666666);
INSERT INTO `sys_role_menu` VALUES (13, 2, 1);
INSERT INTO `sys_role_menu` VALUES (14, 2, 2);
INSERT INTO `sys_role_menu` VALUES (15, 2, 15);
INSERT INTO `sys_role_menu` VALUES (16, 2, 16);
INSERT INTO `sys_role_menu` VALUES (17, 2, 17);
INSERT INTO `sys_role_menu` VALUES (18, 2, 18);
INSERT INTO `sys_role_menu` VALUES (19, 2, 3);
INSERT INTO `sys_role_menu` VALUES (20, 2, 19);
INSERT INTO `sys_role_menu` VALUES (21, 2, 20);
INSERT INTO `sys_role_menu` VALUES (22, 2, 21);
INSERT INTO `sys_role_menu` VALUES (23, 2, 22);
INSERT INTO `sys_role_menu` VALUES (24, 2, 4);
INSERT INTO `sys_role_menu` VALUES (25, 2, 23);
INSERT INTO `sys_role_menu` VALUES (26, 2, 24);
INSERT INTO `sys_role_menu` VALUES (27, 2, 25);
INSERT INTO `sys_role_menu` VALUES (28, 2, 26);
INSERT INTO `sys_role_menu` VALUES (29, 2, 5);
INSERT INTO `sys_role_menu` VALUES (30, 2, 6);
INSERT INTO `sys_role_menu` VALUES (31, 2, 7);
INSERT INTO `sys_role_menu` VALUES (32, 2, 8);
INSERT INTO `sys_role_menu` VALUES (33, 2, 9);
INSERT INTO `sys_role_menu` VALUES (34, 2, 10);
INSERT INTO `sys_role_menu` VALUES (35, 2, 11);
INSERT INTO `sys_role_menu` VALUES (36, 2, 12);
INSERT INTO `sys_role_menu` VALUES (37, 2, 13);
INSERT INTO `sys_role_menu` VALUES (38, 2, 14);
INSERT INTO `sys_role_menu` VALUES (39, 2, 27);
INSERT INTO `sys_role_menu` VALUES (40, 2, 29);
INSERT INTO `sys_role_menu` VALUES (41, 2, 30);
INSERT INTO `sys_role_menu` VALUES (42, 2, -666666);
INSERT INTO `sys_role_menu` VALUES (43, 3, 1);
INSERT INTO `sys_role_menu` VALUES (44, 3, 2);
INSERT INTO `sys_role_menu` VALUES (45, 3, 15);
INSERT INTO `sys_role_menu` VALUES (46, 3, 16);
INSERT INTO `sys_role_menu` VALUES (47, 3, 17);
INSERT INTO `sys_role_menu` VALUES (48, 3, 18);
INSERT INTO `sys_role_menu` VALUES (49, 3, 3);
INSERT INTO `sys_role_menu` VALUES (50, 3, 19);
INSERT INTO `sys_role_menu` VALUES (51, 3, 20);
INSERT INTO `sys_role_menu` VALUES (52, 3, 21);
INSERT INTO `sys_role_menu` VALUES (53, 3, 22);
INSERT INTO `sys_role_menu` VALUES (54, 3, 4);
INSERT INTO `sys_role_menu` VALUES (55, 3, 23);
INSERT INTO `sys_role_menu` VALUES (56, 3, 24);
INSERT INTO `sys_role_menu` VALUES (57, 3, 25);
INSERT INTO `sys_role_menu` VALUES (58, 3, 26);
INSERT INTO `sys_role_menu` VALUES (59, 3, 5);
INSERT INTO `sys_role_menu` VALUES (60, 3, 6);
INSERT INTO `sys_role_menu` VALUES (61, 3, 7);
INSERT INTO `sys_role_menu` VALUES (62, 3, 8);
INSERT INTO `sys_role_menu` VALUES (63, 3, 9);
INSERT INTO `sys_role_menu` VALUES (64, 3, 10);
INSERT INTO `sys_role_menu` VALUES (65, 3, 11);
INSERT INTO `sys_role_menu` VALUES (66, 3, 12);
INSERT INTO `sys_role_menu` VALUES (67, 3, 13);
INSERT INTO `sys_role_menu` VALUES (68, 3, 14);
INSERT INTO `sys_role_menu` VALUES (69, 3, 27);
INSERT INTO `sys_role_menu` VALUES (70, 3, 29);
INSERT INTO `sys_role_menu` VALUES (71, 3, 30);
INSERT INTO `sys_role_menu` VALUES (72, 3, 31);
INSERT INTO `sys_role_menu` VALUES (73, 3, 32);
INSERT INTO `sys_role_menu` VALUES (74, 3, 33);
INSERT INTO `sys_role_menu` VALUES (75, 3, 34);
INSERT INTO `sys_role_menu` VALUES (76, 3, 35);
INSERT INTO `sys_role_menu` VALUES (77, 3, 36);
INSERT INTO `sys_role_menu` VALUES (83, 3, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '?????????',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '???',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '?????????',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '??????  0?????????   1?????????',
  `create_user_id` bigint(0) NULL DEFAULT NULL COMMENT '?????????ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@qq.com', '13612345678', 1, 1, '2021-09-26 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '??????ID',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '???????????????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (3, 5, 3);
INSERT INTO `sys_user_role` VALUES (6, 4, 1);
INSERT INTO `sys_user_role` VALUES (9, 1, 3);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(0) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '????????????Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, '588a23247b866dd2fd18a4ecdaab50e5', '2021-09-27 10:25:56', '2021-09-26 22:25:56');
INSERT INTO `sys_user_token` VALUES (4, '958fb8a2b949ec2302de99500ba6bb52', '2021-07-06 06:04:27', '2021-07-06 18:04:27');
INSERT INTO `sys_user_token` VALUES (5, '2e59fc3957b7020068919af1dd21a225', '2021-07-06 06:08:08', '2021-07-06 18:08:08');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '?????????',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '?????????',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '??????',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'test1', 'root', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2021-07-06 13:24:44');

-- ----------------------------
-- Table structure for video_category
-- ----------------------------
DROP TABLE IF EXISTS `video_category`;
CREATE TABLE `video_category`  (
  `category_id` int(0) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_category
-- ----------------------------
INSERT INTO `video_category` VALUES (1, '??????');
INSERT INTO `video_category` VALUES (2, '??????');
INSERT INTO `video_category` VALUES (3, '??????');
INSERT INTO `video_category` VALUES (4, '??????');
INSERT INTO `video_category` VALUES (5, 'vlog');
INSERT INTO `video_category` VALUES (6, '??????');
INSERT INTO `video_category` VALUES (7, '??????');
INSERT INTO `video_category` VALUES (8, '??????');

-- ----------------------------
-- Table structure for video_list
-- ----------------------------
DROP TABLE IF EXISTS `video_list`;
CREATE TABLE `video_list`  (
  `vid` int(0) NOT NULL AUTO_INCREMENT COMMENT '??????id\r\n',
  `vtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '????????????\r\n',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '????????????\r\n',
  `coverUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '?????????',
  `headurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '????????????url\r\n',
  `comment_num` int(0) NULL DEFAULT NULL COMMENT '???????????????',
  `like_num` int(0) NULL DEFAULT NULL COMMENT '?????????',
  `collect_num` int(0) NULL DEFAULT NULL COMMENT '?????????',
  `playUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '??????url',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '????????????',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '????????????',
  `category_id` int(0) NULL DEFAULT NULL COMMENT '????????????ID',
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_list
-- ----------------------------
INSERT INTO `video_list` VALUES (1, '??????????????????????????????P???????????????1V4', '???????????????', 'http://sf3-xgcdn-tos.pstatp.com/img/tos-cn-i-0004/527d013205a74eb0a77202d7a9d5b511~tplv-crop-center:1041:582.jpg', 'https://sf1-ttcdn-tos.pstatp.com/img/pgc-image/c783a73368fa4666b7842a635c63a8bf~360x360.image', 121, 123, 122, 'http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4', '2021-07-06 11:21:45', '2021-07-06 02:00:10', 1);
INSERT INTO `video_list` VALUES (2, '?????????2??????????????? 2-3 ????????????', '????????????', 'https://lf1-xgcdn-tos.pstatp.com/img/tos-cn-p-0000/9ff7fe6c89e44ca3a22aad5744e569e3~tplv-crop-center:1041:582.jpg', 'https://sf6-ttcdn-tos.pstatp.com/img/mosaic-legacy/8110/752553978~360x360.image', 1300, 500, 120, 'http://vfx.mtime.cn/Video/2019/03/21/mp4/190321153853126488.mp4', '2021-07-06 10:00:01', '2021-07-06 02:00:03', 1);
INSERT INTO `video_list` VALUES (3, '?????????????????????????????????????????????????????????', '??????????????????', 'https://sf1-xgcdn-tos.pstatp.com/img/tos-cn-i-0004/83cc11d5e26047c6b0ead149f41a8266~tplv-crop-center:1041:582.jpg', 'https://p3.pstatp.com/large/a14a000405f16e51842f', 10, 19, 5, 'http://vfx.mtime.cn/Video/2019/03/19/mp4/190319222227698228.mp4', '2021-07-06 09:59:58', '2021-07-06 02:00:00', 1);
INSERT INTO `video_list` VALUES (4, '??????14????????????????????????????????????????????????', 'E????????????E', 'https://sf1-xgcdn-tos.pstatp.com/img/tos-cn-i-0004/b9553b7a28d94f27a7115157797b52ff~tplv-crop-center:1041:582.jpg', 'https://sf3-ttcdn-tos.pstatp.com/img/pgc-image/f6b840d23f9e465bb5ac9e570b28321d~360x360.image', 22, 180, 963, 'http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4', '2021-07-06 09:59:55', '2021-07-06 01:59:57', 1);
INSERT INTO `video_list` VALUES (5, '?????????210????????????20????????????', '????????????', 'https://lf6-xgcdn-tos.pstatp.com/img/tos-cn-i-0004/b821f00833b54e25ac941c7d267c2b75~tplv-crop-center:1041:582.jpg', 'https://p9.pstatp.com/large/6edc0000758b2daaa6cc', 36, 3, 56, 'http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4', '2021-07-06 09:59:52', '2021-07-06 01:59:54', 3);
INSERT INTO `video_list` VALUES (6, '10???????????????????????????', '??????????????????', 'https://sf3-xgcdn-tos.pstatp.com/img/p1901/d9d5ae15079a8073f5cdb04b6a80777a~tplv-crop-center:1041:582.jpg', 'https://sf3-ttcdn-tos.pstatp.com/img/mosaic-legacy/da860012437af2fd24c2~360x360.image', 96, 700, 89, 'http://vfx.mtime.cn/Video/2019/03/18/mp4/190318214226685784.mp4', '2021-07-06 09:59:49', '2021-07-06 01:59:51', 3);
INSERT INTO `video_list` VALUES (7, '????????????????????????????????????????????????', '????????????', 'https://lf3-xgcdn-tos.pstatp.com/img/tos-cn-i-0004/51109f43de0346f68b7fd93103658aa4~tplv-crop-center:1041:582.jpg', 'https://p1.pstatp.com/large/719f0015d12364d07c5b', 9, 56, 123, 'http://vfx.mtime.cn/Video/2019/03/19/mp4/190319104618910544.mp4', '2021-07-06 09:59:45', '2021-07-06 01:59:47', 3);
INSERT INTO `video_list` VALUES (8, '2320???2?????????????????????????????????????????????', '????????????', 'https://sf3-xgcdn-tos.pstatp.com/img/tos-cn-i-0004/5ecedb083288435cbbf51ef04723d991~tplv-crop-center:1041:582.jpg', 'https://sf1-ttcdn-tos.pstatp.com/img/mosaic-legacy/dae9000ee0a875804aae~360x360.image', 98, 546, 23, 'http://vfx.mtime.cn/Video/2019/03/19/mp4/190319125415785691.mp4', '2021-07-06 09:59:43', '2021-07-06 01:59:44', 3);
INSERT INTO `video_list` VALUES (9, '122???????????????????????????????????????', '?????????', 'https://lf6-xgcdn-tos.pstatp.com/img/tos-cn-i-0004/28b99fcd52bf4e45a7f4a28ab2f21685~tplv-crop-center:1041:582.jpg', 'https://sf6-ttcdn-tos.pstatp.com/img/mosaic-legacy/b77400114e944ff697e4~360x360.image', 156, 56, 856, 'http://vfx.mtime.cn/Video/2019/03/17/mp4/190317150237409904.mp4', '2021-07-06 09:59:39', '2021-07-06 01:59:41', 3);
INSERT INTO `video_list` VALUES (10, '10???????????????????????????50????????????', '?????????', 'https://sf6-xgcdn-tos.pstatp.com/img/tos-cn-i-0004/edcc153551794b67a2de2683ff8b0ee2~tplv-crop-center:1041:582.jpg', 'https://sf3-ttcdn-tos.pstatp.com/img/pgc-image/7cbcfbb82fa142058fd45549d3b63a5b~360x360.image', 85, 4566, 100, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 09:59:35', '2021-07-06 01:59:38', 3);
INSERT INTO `video_list` VALUES (11, '?????????????????????????????????????????????????????????', '???????????????', 'https://p3-xg.byteimg.com/img/tos-cn-i-0004/bd1c46a6e99a491cab93ae359df1a287~tplv-crop-center:1041:582.jpg', 'https://p3.pstatp.com/large/888f000186913353fe3f', 123, 500, 320, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:58:19', 8);
INSERT INTO `video_list` VALUES (12, '??????????????????????????????????????????????????????????????????????????????????????????', '????????????', 'https://p1-xg.byteimg.com/img/tos-cn-i-0004/9a50e691dd2646d6983ccebb93607033~tplv-crop-center:1041:582.jpg', 'https://sf6-ttcdn-tos.pstatp.com/img/pgc-image/1f5b712339ab475aa6ba0280d36189ba~360x360.image', 12, 343, 78, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:58:24', 8);
INSERT INTO `video_list` VALUES (13, 'F-22?????????????????????????????????????????????????????????????????????', '?????????????????????', 'https://p9-xg.byteimg.com/img/tos-cn-i-0004/e6750544a3ee4f8182c984949f966bc2~tplv-crop-center:1041:582.jpg', 'https://sf6-ttcdn-tos.pstatp.com/img/mosaic-legacy/4110014cf3649fd8d6b~360x360.image', 543, 423, 22, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:58:28', 8);
INSERT INTO `video_list` VALUES (14, '?????????????????????????????????????????????????????????????????????-160???????????????', 'YiTube', 'https://p9-xg.byteimg.com/img/tos-cn-i-0004/1a9fd82c375d4124bd860d253ca1d502~tplv-crop-center:1041:582.jpg', 'https://sf3-ttcdn-tos.pstatp.com/img/mosaic-legacy/ff3700002d8bc2b3ab3e~360x360.image', 654, 234, 466, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:58:33', 8);
INSERT INTO `video_list` VALUES (15, '????????????????????????????????????????????????', '??????????????????', 'https://p9-xg.byteimg.com/img/tos-cn-i-0004/19c44751e9124b069d23cddbc46e29fb~tplv-crop-center:1041:582.jpg', 'https://sf1-ttcdn-tos.pstatp.com/img/user-avatar/d58021eb3b4d5a6066eaf84fb793b360~360x360.image', 12, 45, 6, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:58:40', 2);
INSERT INTO `video_list` VALUES (16, '???????????????????????????????????????????????????????????????', '?????????', 'https://p1-xg.byteimg.com/img/tos-cn-p-0000/527b08d0f31d4705a4d8f4a72120948c~tplv-crop-center:1041:582.jpg', 'https://p3.pstatp.com/large/dac80011227f8d67d02b', 34, 456, 123, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:58:44', 2);
INSERT INTO `video_list` VALUES (17, '???????????????????????????????????????', '????????????', 'https://p3-xg.byteimg.com/img/tos-cn-i-0004/1820c36d7a3846acaca9c24f18b01944~tplv-crop-center:1041:582.jpg', 'https://p1.pstatp.com/large/8b5f000540ca210dc4a7', 76, 47, 768, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:58:47', 2);
INSERT INTO `video_list` VALUES (18, '????????????????????????????????????????????????????????????', '??????????????????', 'https://p3-xg.byteimg.com/img/tos-cn-p-0026/a225869a56d1715823d6f74d6a765b01~tplv-crop-center:1041:582.jpg', 'https://p3.pstatp.com/large/da57000d5b84204f3e8f', 43, 46, 78, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 22:39:15', '2021-07-06 01:58:50', 4);
INSERT INTO `video_list` VALUES (19, '????????????????????????????????????????????????????????????', '?????????', 'https://p3-xg.byteimg.com/img/tos-cn-i-0004/36f0b389b3d44d5dbd60590a0adf8c2a~tplv-crop-center:1041:582.jpg', 'https://sf1-ttcdn-tos.pstatp.com/img/mosaic-legacy/dae9000a4fdeff22675f~360x360.image', 65, 66, 567, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:58:57', 5);
INSERT INTO `video_list` VALUES (20, '????????????????????????????????????,????????????????????????', '???????????????', 'https://p3-xg.byteimg.com/img/tos-cn-i-0004/55386236bbf74f5794251a24fba85ef1~tplv-crop-center:1041:582.jpg', 'https://p1.pstatp.com/large/986a0004c8fa4adec094', 776, 67, 23, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:59:02', 5);
INSERT INTO `video_list` VALUES (21, '2020??????????????????????????????25??????????????????', '????????????????????????', 'https://p9-xg.byteimg.com/img/tos-cn-i-0004/7c09b805c10e44469edfb76eaf7b666b~tplv-crop-center:1041:582.jpg', 'https://sf6-ttcdn-tos.pstatp.com/img/user-avatar/a0fb5b628254086d23af194c4eec2426~360x360.image', 43, 45, 1123, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:59:10', 5);
INSERT INTO `video_list` VALUES (22, '???????????????????????????????????????????????????????????????????????????', '???????????????', 'https://p1-xg.byteimg.com/img/tos-cn-i-0004/4a482126d41c4da49c3baaa5ea65b0f6~tplv-crop-center:1041:582.jpg', 'https://p1.pstatp.com/large/4e6900026fa8d9eaee0a', 43, 654, 21, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:59:13', 5);
INSERT INTO `video_list` VALUES (23, '?????????????????????????????????????????????????????????????????????', '???????????????', 'https://p1-xg.byteimg.com/img/tos-cn-i-0004/975b48746c584e79b77df1a43531d4bf~tplv-crop-center:1041:582.jpg', 'https://p3.pstatp.com/large/ef40008c39119bef556', 56, 3435, 74, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:59:19', 6);
INSERT INTO `video_list` VALUES (24, '????????????????????????????????????????????????????????????', '???????????????', 'https://p1-xg.byteimg.com/img/tos-cn-p-0026/71b6b37e67a05c3103de521bcc1bd8cc~tplv-crop-center:1041:582.jpg', 'https://sf1-ttcdn-tos.pstatp.com/img/mosaic-legacy/dac80012b10b5678b21e~360x360.image', 45, 234, 567, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:59:22', 6);
INSERT INTO `video_list` VALUES (25, '??????????????????????????????????????????', '??????????????????', 'https://p3-xg.byteimg.com/img/tos-cn-i-0004/eadd7aebf3174fa3b793acd310d2549a~tplv-crop-center:1041:582.jpg', 'https://p3.pstatp.com/large/289a0019c8fc986e193f', 45, 234, 6, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:59:27', 7);
INSERT INTO `video_list` VALUES (26, '?????????????????????vs?????????????????????????????????', 'papi???????????????', 'https://p1-xg.byteimg.com/img/tos-cn-i-0004/a2165f779651487c94b27233d162c3dc~tplv-crop-center:1041:582.jpg', 'https://p1.pstatp.com/large/47220003b76b9bfc799c', 211, 12, 345, 'http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4', '2021-07-06 16:05:38', '2021-07-06 01:59:32', 7);

SET FOREIGN_KEY_CHECKS = 1;
