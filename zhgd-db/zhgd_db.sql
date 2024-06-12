/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : zhgd_db

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 12/06/2024 10:54:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_datamsg
-- ----------------------------
DROP TABLE IF EXISTS `tb_datamsg`;
CREATE TABLE `tb_datamsg`  (
  `dataName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据名',
  `dataNum` int NULL DEFAULT NULL COMMENT '数据量',
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_datamsg
-- ----------------------------
INSERT INTO `tb_datamsg` VALUES ('user', 45, '144c666f8a769d0cb33695e473153713');

-- ----------------------------
-- Table structure for tb_dic
-- ----------------------------
DROP TABLE IF EXISTS `tb_dic`;
CREATE TABLE `tb_dic`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键UUID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型名称',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型值',
  `create_time` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间 YYYY-MM-DD hh:mm:ss',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '是否删除 1-正常 0-已删除',
  `dictype_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属字典类型，关联tb_dictype表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表 ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_dic
-- ----------------------------
INSERT INTO `tb_dic` VALUES ('4c8cf4648df9d67b80db3ce47d2093ed', '一号工地PM2.5', '一号工地PM2.5', '2024-05-22 19:48:32', 1, '3cda0c37b0c7520f6215306839baaed4');
INSERT INTO `tb_dic` VALUES ('7e95e239a6105d333ac684302f2e74b3', '材料区', '材料区', '2024-05-14 22:48:26', 1, '4a68d2963351eaf9c92159eaf09c13e7');
INSERT INTO `tb_dic` VALUES ('917fc3dc8455c913126972841dd182f4', '一号工地噪音', '一号工地噪音', '2024-05-22 19:48:46', 1, '3cda0c37b0c7520f6215306839baaed4');
INSERT INTO `tb_dic` VALUES ('a2ec7ebcc5868976a5eb2a150141e3b4', '生活区', '生活区', '2024-05-14 22:49:58', 1, '4a68d2963351eaf9c92159eaf09c13e7');
INSERT INTO `tb_dic` VALUES ('b5024faac840e7638c9d9c4d482ec608', '大厅', '大厅', '2024-05-22 19:03:02', 1, 'a9ca3a469692cb63a70565bdb13aa7ea');
INSERT INTO `tb_dic` VALUES ('c3007b26dbd51efeffc116af992e8d31', '生活区温度', '生活区温度', '2024-05-22 19:48:09', 1, '3cda0c37b0c7520f6215306839baaed4');
INSERT INTO `tb_dic` VALUES ('e290290ed864a7749520cde380a52654', '一号工地', '一号工地', '2024-05-22 19:03:52', 1, 'a9ca3a469692cb63a70565bdb13aa7ea');
INSERT INTO `tb_dic` VALUES ('e49085dc3ae5789345e1bfdcfd689bda', '办公区', '办公区', '2024-05-14 22:49:46', 1, '4a68d2963351eaf9c92159eaf09c13e7');

-- ----------------------------
-- Table structure for tb_dictype
-- ----------------------------
DROP TABLE IF EXISTS `tb_dictype`;
CREATE TABLE `tb_dictype`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键UUID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型名称',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型值',
  `create_time` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间 YYYY-MM-DD hh:mm:ss',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '是否删除 1-正常 0-已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_dictype
-- ----------------------------
INSERT INTO `tb_dictype` VALUES ('3cda0c37b0c7520f6215306839baaed4', '传感器', 'equipment', '2024-05-22 19:28:07', 1);
INSERT INTO `tb_dictype` VALUES ('4a68d2963351eaf9c92159eaf09c13e7', '地区', 'address', '2024-05-14 22:37:42', 1);
INSERT INTO `tb_dictype` VALUES ('a9ca3a469692cb63a70565bdb13aa7ea', '监控器', 'monitor', '2024-05-22 19:02:48', 1);

-- ----------------------------
-- Table structure for tb_equipment
-- ----------------------------
DROP TABLE IF EXISTS `tb_equipment`;
CREATE TABLE `tb_equipment`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键UUID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名字',
  `create_time` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间 YYYY-MM-DD hh:mm:ss',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态 1-可用 0-不可用',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '是否删除 1-正常 0-已删除',
  `cordon` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '警戒线',
  `start` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '起始',
  `end` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终止',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备地区',
  `flats` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `stream_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `value` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_equipment
-- ----------------------------
INSERT INTO `tb_equipment` VALUES ('1efab42d92795762155faf1631792438', '一号工地PM2.5', '2024-05-22 19:46:51', 1, 1, '150', '0', '250', '办公区', 'μg/m³', '1', '216');
INSERT INTO `tb_equipment` VALUES ('2bef5f0f3261354fafbed954d32984dd', '生活区湿度', '2024-05-22 19:35:34', 1, 1, '80', '0', '100', '生活区', '%', '1', '77');
INSERT INTO `tb_equipment` VALUES ('362a2ae7ad95d7c8149d087bcf7981d8', '一号工地噪音', '2024-05-22 19:43:53', 1, 1, '70', '0', '100', '办公区', '分贝', '123', '91');
INSERT INTO `tb_equipment` VALUES ('36b07fe156a3a2aa503e1137e73f2f31', '', '2024-06-04 13:07:32', 1, 0, '0', '0', '0', '', '', '', '0');
INSERT INTO `tb_equipment` VALUES ('3757c5a501282f49ed102c0daa537dc7', '湿度计', '2024-05-21 16:22:02', 1, 0, '1', '-1', '2', '生活区', '2', '1', '2');
INSERT INTO `tb_equipment` VALUES ('4669524e04aac2b1ca22b040ed1bd05a', '1', '2024-06-04 13:08:15', 1, 0, '0', '0', '0', '', '', '', '0');
INSERT INTO `tb_equipment` VALUES ('6f7e0d35d4f2cd0802b97730f303b26e', '一号工地温度', '2024-05-21 17:13:22', 1, 1, '30', '0', '40', '办公区', '°', '1', '28');
INSERT INTO `tb_equipment` VALUES ('78c02761b003812f5306407660bfcd76', '', '2024-06-04 13:13:16', 1, 0, '0', '0', '0', '办公区', '', '', '0');
INSERT INTO `tb_equipment` VALUES ('996ce4eb86bd4e800ff72f0b2c44a60b', '测试', '2024-06-04 13:05:25', 1, 1, '90', '0', '100', '生活区', '°', '1', '67');
INSERT INTO `tb_equipment` VALUES ('9b1ae1d2da67d48f1f59d6b113cbe7f0', '', '2024-06-04 13:10:16', 1, 0, '0', '0', '0', '', '', '', '0');
INSERT INTO `tb_equipment` VALUES ('cc3ad35cb48b893baf7315afa666ee59', '材料区温度', '2024-05-22 17:03:53', 1, 1, '30', '0', '40', '材料区', '°', '1', '23');
INSERT INTO `tb_equipment` VALUES ('d6b8a6fe1af8a9fd29645ebb8019e182', '材料区湿度', '2024-05-22 19:35:08', 1, 1, '80', '0', '100', '材料区', '%', '1', '52');
INSERT INTO `tb_equipment` VALUES ('e2bb60ee297fc9bd6aaab579b1dadc3f', '办公区湿度', '2024-05-22 19:36:01', 1, 1, '80', '0', '100', '办公区', '%', '1', '65');
INSERT INTO `tb_equipment` VALUES ('e8a9eddddad2a5fa116f0835232156bb', '生活区温度', '2024-05-22 17:03:17', 1, 1, '30', '0', '40', '生活区', '°', '1', '9');
INSERT INTO `tb_equipment` VALUES ('f9881cade37decb8bba9142f4d8fcfa9', '', '2024-06-04 13:07:05', 1, 0, '0', '0', '0', '', '', '', '0');

-- ----------------------------
-- Table structure for tb_monitor
-- ----------------------------
DROP TABLE IF EXISTS `tb_monitor`;
CREATE TABLE `tb_monitor`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键UUID',
  `stream_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频流地址',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名字',
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态 1-可用 0-不可用',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '是否删除 1-正常 0-已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_monitor
-- ----------------------------
INSERT INTO `tb_monitor` VALUES ('4ffd3de89fc20c2075879417b7fd01fc', 'http://your_stream_url/123', '1221', '生活区', 1, 0);
INSERT INTO `tb_monitor` VALUES ('6bc313aff00fda7abae7a5460b0c101d', '11223', '1232', '办公区', 1, 0);
INSERT INTO `tb_monitor` VALUES ('6e52a73d65d761ede438dbeb94c93a9c', '', '', '', 1, 0);
INSERT INTO `tb_monitor` VALUES ('7b94014bc9b0bca46a77e2f7f20ca0ad', '4312', '12', NULL, 1, 0);
INSERT INTO `tb_monitor` VALUES ('96cfa1604527b5901afb352c139fb378', '2', '2', NULL, 1, 0);
INSERT INTO `tb_monitor` VALUES ('9c89976e36769ca249f80d1904409eee', '212121', '122121', '', 1, 0);
INSERT INTO `tb_monitor` VALUES ('b51d0ae3e4e5f072ea187676f3e740f2', '/media/test.ef4804d4.mp4', '一号仓库', '材料区', 1, 1);
INSERT INTO `tb_monitor` VALUES ('bbaf46e4f3e2c5b2ef64cadcc778100b', '1', '1', '', 1, 0);
INSERT INTO `tb_monitor` VALUES ('ce94e2bdb0e341adfa97c36fc74659ff', '/media/test.ef4804d4.mp4', '一号宿舍', '生活区', 1, 1);
INSERT INTO `tb_monitor` VALUES ('df6407b3a8350e122cf0b051e3cf8c89', '1', '1', '生活区', 1, 0);
INSERT INTO `tb_monitor` VALUES ('e94d002e8a7167b587880e23a305c4d1', '/media/test.ef4804d4.mp4', '测试', '生活区', 1, 1);
INSERT INTO `tb_monitor` VALUES ('ee928a6ca55b592eb1d5027ddf9505da', '123', '大厅', '办公区', 1, 1);
INSERT INTO `tb_monitor` VALUES ('f57e92c06e18ea86f3389057a70debd6', '123', '一号工地', '办公区', 1, 1);
INSERT INTO `tb_monitor` VALUES ('fe0b970b7f9733625a23426775da9dc5', '123', '二号仓库', '材料区', 1, 1);

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键UUID',
  `time` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发生时间',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知说明',
  `create_time` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间 YYYY-MM-DD hh:mm:ss',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '是否删除 1-正常 0-已删除',
  `state` tinyint(1) NULL DEFAULT 0 COMMENT '状态 1-已处理 0-未处理',
  `equipment_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('065033f5a15ec05c79d04111315d9291', '2024-05-22 19:47:05', '警告：当前一号工地PM2.5数值已达到180μg/m³', '2024-05-22 19:47:05', 1, 1, '1efab42d92795762155faf1631792438');
INSERT INTO `tb_notice` VALUES ('1e76d4a0c393281a6c7c73ca20ec3751', '2024-05-22 20:36:40', '警告：当前材料区湿度数值已达到94%', '2024-05-22 20:36:40', 1, 1, 'd6b8a6fe1af8a9fd29645ebb8019e182');
INSERT INTO `tb_notice` VALUES ('20f74b45a106f6fae765cb4fd223e428', '2024-05-22 21:00:09', '警告：当前材料区湿度数值已达到95%', '2024-05-22 21:00:09', 1, 1, 'd6b8a6fe1af8a9fd29645ebb8019e182');
INSERT INTO `tb_notice` VALUES ('23797f3234842cd09ddec4ba82c40bf6', '2024-05-22 20:56:56', '警告：当前一号工地PM2.5数值已达到190μg/m³', '2024-05-22 20:56:56', 1, 1, '1efab42d92795762155faf1631792438');
INSERT INTO `tb_notice` VALUES ('23f29bc9d10253d7b331532686d4f956', '2024-05-22 21:06:32', '警告：当前生活区温度数值已达到40°', '2024-05-22 21:06:32', 1, 0, 'e8a9eddddad2a5fa116f0835232156bb');
INSERT INTO `tb_notice` VALUES ('2a0bc2c82e907ff77c8163727ab95547', '2024-05-22 20:56:47', '警告：当前材料区温度数值已达到39°', '2024-05-22 20:56:47', 1, 1, 'cc3ad35cb48b893baf7315afa666ee59');
INSERT INTO `tb_notice` VALUES ('359c4bfebb36bf8300956d1dd28c91b4', '2024-05-22 20:56:23', '警告：当前一号工地PM2.5数值已达到176μg/m³', '2024-05-22 20:56:23', 1, 1, '1efab42d92795762155faf1631792438');
INSERT INTO `tb_notice` VALUES ('3f042bcf6b6e693ba6c38898c2b939dc', '2024-05-22 17:06:48', '警告：当前办公区温度数值已达到36°', '2024-05-22 17:06:48', 1, 1, '6f7e0d35d4f2cd0802b97730f303b26e');
INSERT INTO `tb_notice` VALUES ('440c3afa3167d291201f55682819d3c0', '2024-05-22 21:16:30', '警告：当前生活区湿度数值已达到84%', '2024-05-22 21:16:30', 1, 0, '2bef5f0f3261354fafbed954d32984dd');
INSERT INTO `tb_notice` VALUES ('52980c9cf458b66be294a47b1224500d', '2024-05-22 21:00:54', '警告：当前生活区湿度数值已达到95%', '2024-05-22 21:00:54', 1, 1, '2bef5f0f3261354fafbed954d32984dd');
INSERT INTO `tb_notice` VALUES ('5d392a36d85bb674339006eb891b3c02', '2024-05-22 20:56:47', '警告：当前一号工地噪音数值已达到99分贝', '2024-05-22 20:56:47', 1, 1, '362a2ae7ad95d7c8149d087bcf7981d8');
INSERT INTO `tb_notice` VALUES ('625fd43fc4cf691ae096dc6ea2811fa5', '2024-05-22 16:37:10', '警告：当前办公区温度数值已达到26°', '2024-05-22 16:37:10', 1, 1, '6f7e0d35d4f2cd0802b97730f303b26e');
INSERT INTO `tb_notice` VALUES ('6498514c6b08748a74c6dc98a6c4c311', '2024-05-22 20:56:47', '警告：当前生活区温度数值已达到40°', '2024-05-22 20:56:47', 1, 1, 'e8a9eddddad2a5fa116f0835232156bb');
INSERT INTO `tb_notice` VALUES ('765c587e2e9b4600b5390d859fbdca0f', '2024-05-22 20:56:19', '警告：当前一号工地噪音数值已达到77分贝', '2024-05-22 20:56:19', 1, 1, '362a2ae7ad95d7c8149d087bcf7981d8');
INSERT INTO `tb_notice` VALUES ('7b1bebdfd1e47e16e6b491d3baba8604', '2024-05-22 21:00:19', '警告：当前办公区湿度数值已达到88%', '2024-05-22 21:00:19', 1, 1, 'e2bb60ee297fc9bd6aaab579b1dadc3f');
INSERT INTO `tb_notice` VALUES ('7f2295ab3cb303a65225abb4f0974083', '2024-05-22 21:16:35', '警告：当前一号工地温度数值已达到30°', '2024-05-22 21:16:35', 1, 0, '6f7e0d35d4f2cd0802b97730f303b26e');
INSERT INTO `tb_notice` VALUES ('885e5c6f040c05309991f6d8e5687ec7', '2024-05-22 19:36:05', '警告：当前生活区湿度数值已达到96%', '2024-05-22 19:36:05', 1, 1, '2bef5f0f3261354fafbed954d32984dd');
INSERT INTO `tb_notice` VALUES ('8ca946697c8919b75dcadde39dcd8a3d', '2024-05-22 20:56:34', '警告：当前生活区温度数值已达到33°', '2024-05-22 20:56:34', 1, 1, 'e8a9eddddad2a5fa116f0835232156bb');
INSERT INTO `tb_notice` VALUES ('914997b69eb00e898c9ca4f9672a95ad', '2024-05-22 20:57:16', '警告：当前一号工地噪音数值已达到96分贝', '2024-05-22 20:57:16', 1, 1, '362a2ae7ad95d7c8149d087bcf7981d8');
INSERT INTO `tb_notice` VALUES ('92e321ff111e8f499e4465ad25f82d8a', '2024-05-22 20:56:56', '警告：当前生活区温度数值已达到37°', '2024-05-22 20:56:56', 1, 1, 'e8a9eddddad2a5fa116f0835232156bb');
INSERT INTO `tb_notice` VALUES ('944f4c834c1a55b9733acd5496c175f4', '2024-05-22 21:17:00', '警告：当前办公区湿度数值已达到92%', '2024-05-22 21:17:00', 1, 0, 'e2bb60ee297fc9bd6aaab579b1dadc3f');
INSERT INTO `tb_notice` VALUES ('aab2c42174ba0a2d19c24a9a92e6d826', '2024-05-22 21:16:35', '警告：当前材料区湿度数值已达到85%', '2024-05-22 21:16:35', 1, 0, 'd6b8a6fe1af8a9fd29645ebb8019e182');
INSERT INTO `tb_notice` VALUES ('ac702a8a1d8ed6069b233ca08c0a28bc', '2024-05-22 20:59:59', '警告：当前材料区温度数值已达到33°', '2024-05-22 20:59:59', 1, 1, 'cc3ad35cb48b893baf7315afa666ee59');
INSERT INTO `tb_notice` VALUES ('caef2d89fdbf35f69d1c48258d265238', '2024-05-22 17:03:30', '警告：当前生活区温度数值已达到36°', '2024-05-22 17:03:30', 1, 1, 'e8a9eddddad2a5fa116f0835232156bb');
INSERT INTO `tb_notice` VALUES ('ce67960e3202a84907fb11a3320c2be8', '2024-05-22 19:36:15', '警告：当前办公区湿度数值已达到88%', '2024-05-22 19:36:15', 1, 1, 'e2bb60ee297fc9bd6aaab579b1dadc3f');
INSERT INTO `tb_notice` VALUES ('d06ee449996a4beaa15d0087582dbc59', '2024-05-22 16:36:44', '警告：当前办公区温度数值已达到7°', '2024-05-22 16:36:44', 1, 1, '6f7e0d35d4f2cd0802b97730f303b26e');
INSERT INTO `tb_notice` VALUES ('d3f4e8f47abb02f3f2b2afc8fef3f1c3', '2024-05-22 19:44:20', '警告：当前一号工地噪音数值已达到94分贝', '2024-05-22 19:44:20', 1, 1, '362a2ae7ad95d7c8149d087bcf7981d8');
INSERT INTO `tb_notice` VALUES ('d75f8b9e687b1d0a6f34506f52b8a2cf', '2024-05-22 20:56:47', '警告：当前一号工地PM2.5数值已达到171μg/m³', '2024-05-22 20:56:47', 1, 1, '1efab42d92795762155faf1631792438');
INSERT INTO `tb_notice` VALUES ('d9794b182444b0e06eea0cda0a854a70', '2024-05-22 17:04:26', '警告：当前材料区温度数值已达到31°', '2024-05-22 17:04:26', 1, 1, 'cc3ad35cb48b893baf7315afa666ee59');
INSERT INTO `tb_notice` VALUES ('e6d1d04c55c9d2919f96da5ea2911bd2', '2024-05-22 21:17:10', '警告：当前材料区温度数值已达到40°', '2024-05-22 21:17:10', 1, 0, 'cc3ad35cb48b893baf7315afa666ee59');
INSERT INTO `tb_notice` VALUES ('e914e8142f06a2124adcbcb03e41483a', '2024-05-22 22:05:36', 'test01', '2024-05-22 22:05:36', 1, 0, NULL);
INSERT INTO `tb_notice` VALUES ('f3aaec0a74d77353404817513f6ed66f', '2024-05-22 19:35:24', '警告：当前材料区湿度数值已达到85%', '2024-05-22 19:35:24', 1, 1, 'd6b8a6fe1af8a9fd29645ebb8019e182');
INSERT INTO `tb_notice` VALUES ('f50b97118abc2d68ed63098c9d904773', '2024-06-04 13:05:53', '警告：当前测试数值已达到100°', '2024-06-04 13:05:53', 1, 0, '996ce4eb86bd4e800ff72f0b2c44a60b');
INSERT INTO `tb_notice` VALUES ('f92c60899a7d8c59be98ec53bb8312d5', '2024-05-22 21:17:10', '警告：当前一号工地噪音数值已达到95分贝', '2024-05-22 21:17:10', 1, 0, '362a2ae7ad95d7c8149d087bcf7981d8');
INSERT INTO `tb_notice` VALUES ('f98278af3c31b990944086e94dddb4b8', '2024-05-22 21:06:38', '警告：当前一号工地PM2.5数值已达到190μg/m³', '2024-05-22 21:06:38', 1, 0, '1efab42d92795762155faf1631792438');
INSERT INTO `tb_notice` VALUES ('fab0a0902d3512cb4903730ee93e726d', '2024-05-22 21:00:14', '警告：当前一号工地温度数值已达到37°', '2024-05-22 21:00:14', 1, 1, '6f7e0d35d4f2cd0802b97730f303b26e');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键UUID',
  `account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间 YYYY-MM-DD hh:mm:ss',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '状态 1-可用 0-不可用',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '是否删除 1-正常 0-已删除',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `sex` tinyint(1) NULL DEFAULT 1 COMMENT '性别 1-男 0-女',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '角色 0-管理员 1-施工人员 2-施工经理 ',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('15519a7692124a607851b70d8d6b6624', '100043', '80b5ca330d6eb0b4d0659970853637f0', '2024-06-10 19:26:18', 1, 1, '1921668e-128c-4d82-b518-f0960262fd83', NULL, 1, 1, '用户100043');
INSERT INTO `tb_user` VALUES ('196e0c5ed4e71a64ec17a9ea06eab207', '100039', 'b5fae085521d14e8a0d850cfc342e30d', '2024-06-10 19:26:18', 1, 1, 'c8042bdd-1863-4341-81fc-f09bd9a9fb67', NULL, 1, 1, '用户100039');
INSERT INTO `tb_user` VALUES ('1a487dd8abfc8727ce66caa0a5e35597', '100038', 'd0c8d747f0bc8f642136e1b2205e3c9e', '2024-06-10 19:26:18', 1, 1, 'c695c26a-36ba-4e9e-b1b4-595cf197087b', NULL, 1, 1, '用户100038');
INSERT INTO `tb_user` VALUES ('217233dab486a7ac19efbcf1b8e6322a', '100045', '50cdfc1599faca0e01f5a0e6bbb1fe9c', '2024-06-10 19:26:18', 1, 1, '09698efe-644d-46f3-9892-0a327a7185c5', NULL, 1, 1, '用户100045');
INSERT INTO `tb_user` VALUES ('23a749199411f739a7eb608848403696', '100016', '2b70d50f285ef3ad1da0bb1296b2de7e', '2024-05-02 12:20:55', 1, 1, '157d7627-84d9-45a5-904b-e021f961837a', '13696970225', 0, 0, '张三');
INSERT INTO `tb_user` VALUES ('e448c48bc59b3608506ed26dffdf5959', '100005', '723201f785e5a76ca877c8bc5607d8e7', '2024-05-01 14:41:53', 1, 1, '999c2248-fe89-41f9-87fd-97b799a78bb8', NULL, 1, 1, '张四');
INSERT INTO `tb_user` VALUES ('f6b9091fbfe2630e2dd8f3606f16862a', '100044', '2334fcdaa63ab2a577f794b6a26ecc90', '2024-06-10 19:26:18', 1, 1, 'cb17285e-2c9c-4cf6-a4ff-f559ae457501', NULL, 1, 1, '用户100044');

SET FOREIGN_KEY_CHECKS = 1;
