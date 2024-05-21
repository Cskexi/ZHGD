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

 Date: 21/05/2024 19:37:10
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
INSERT INTO `tb_datamsg` VALUES ('user', 34, '144c666f8a769d0cb33695e473153713');

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
INSERT INTO `tb_dic` VALUES ('7e95e239a6105d333ac684302f2e74b3', '材料区', '材料区', '2024-05-14 22:48:26', 1, '4a68d2963351eaf9c92159eaf09c13e7');
INSERT INTO `tb_dic` VALUES ('a2ec7ebcc5868976a5eb2a150141e3b4', '生活区', '生活区', '2024-05-14 22:49:58', 1, '4a68d2963351eaf9c92159eaf09c13e7');
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
INSERT INTO `tb_dictype` VALUES ('4a68d2963351eaf9c92159eaf09c13e7', '地区', 'address', '2024-05-14 22:37:42', 1);

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
INSERT INTO `tb_equipment` VALUES ('3757c5a501282f49ed102c0daa537dc7', 't', '2024-05-21 16:22:02', 1, 1, '1', '-1', '2', '', '2', '1', '1');
INSERT INTO `tb_equipment` VALUES ('6f7e0d35d4f2cd0802b97730f303b26e', '办公区温度', '2024-05-21 17:13:22', 1, 1, '30', '0', '40', '办公区', '°', '1', '16');

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
INSERT INTO `tb_monitor` VALUES ('7b94014bc9b0bca46a77e2f7f20ca0ad', '4312', '12', NULL, 1, 0);
INSERT INTO `tb_monitor` VALUES ('96cfa1604527b5901afb352c139fb378', '2', '2', NULL, 1, 0);
INSERT INTO `tb_monitor` VALUES ('9c89976e36769ca249f80d1904409eee', '212121', '122121', '', 1, 0);
INSERT INTO `tb_monitor` VALUES ('b51d0ae3e4e5f072ea187676f3e740f2', '123', '一号仓库', '材料区', 1, 1);
INSERT INTO `tb_monitor` VALUES ('bbaf46e4f3e2c5b2ef64cadcc778100b', '1', '1', '', 1, 0);
INSERT INTO `tb_monitor` VALUES ('ce94e2bdb0e341adfa97c36fc74659ff', '123', '一号宿舍', '生活区', 1, 1);
INSERT INTO `tb_monitor` VALUES ('df6407b3a8350e122cf0b051e3cf8c89', '1', '1', '生活区', 1, 0);
INSERT INTO `tb_monitor` VALUES ('ee928a6ca55b592eb1d5027ddf9505da', '123', '大厅', '办公区', 1, 1);
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------

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
INSERT INTO `tb_user` VALUES ('0d4ca3a41361982c9b29e829b86f7930', '100031', '5d1128a66f2d65e9608a9516ecd0f9b0', '2024-05-02 12:27:23', 1, 1, 'eb0e0dbb-cc42-4e6a-9add-63826f0152fc', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('113ea10486622095f92df91d7ad613e3', '100023', '6c4b5812c9770df64b8be3d6612a1787', '2024-05-02 12:27:15', 1, 1, '748e8dc2-d505-499a-97fb-1d8c75e40c7c', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('16304ede0e3c86a5adf9f37219132cef', '100007', '94baf5f320548af0f0ae8e4b66fcd87a', '2024-05-01 15:15:31', 1, 1, 'e02eae7b-3e49-4389-8f83-5ea3d51a9c03', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('1daeb9bae45bbbbbf5ebbc150626c16b', 'admin', NULL, NULL, 1, 1, NULL, NULL, NULL, 0, '张三');
INSERT INTO `tb_user` VALUES ('1f50c8732a9808d4686054f36f6e52e7', '100017', '26fbce4f555302c4a6e56bfdf3843869', '2024-05-02 12:20:55', 1, 1, '3536c4f3-d9e5-4465-b322-cc2cbe66ef9a', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('23a749199411f739a7eb608848403696', '100016', '2b70d50f285ef3ad1da0bb1296b2de7e', '2024-05-02 12:20:55', 1, 1, '157d7627-84d9-45a5-904b-e021f961837a', '13696970225', 0, 1, '张三');
INSERT INTO `tb_user` VALUES ('2858a930e174b7f37c77e8f3a27a9b2a', '100010', 'ad20c4e874c99b4477d5dcde14325d82', '2024-05-01 15:16:17', 1, 1, '7ec4a068-d4b4-46ea-a61d-e3f8cbe8d031', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('330d8a4d07be4f3e99b0b5a9d82c6225', '100012', '0851e9b4f4d5ecc1a61b8d825dea6d31', '2024-05-02 12:20:43', 1, 1, 'd2474a83-1cce-4f55-be92-4d30303fec3b', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('33353f6f04793802af067fc272c90309', '100020', '74080c1a6df0cfdc5d9648d6695ce6b3', '2024-05-02 12:20:55', 1, 1, '07fa800f-1714-4ddf-8af7-3f7679abc9d4', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('340e93724ebef70f1c2684c14d0032ef', '100021', 'fd8fe5615c59a28b0227ecc497c629ea', '2024-05-02 12:20:55', 1, 1, '7f73c795-0423-40ad-9364-82615a620cb2', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('36c9859c14f710737fab4d4f861845ba', '100011', '0f3c24f372148b8704c1b567bacfff21', '2024-05-02 12:20:20', 1, 1, 'a2da57c2-6987-4d06-b36c-6631176e34e1', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('37e571051755d0c180b17df23230fa09', '100010', '1be7e82aba22b89adc66483b1c802c09', '2024-05-01 15:16:17', 1, 1, 'b39e22db-6571-4cdd-9b80-c76b6da6e417', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('44025ca618303f6f26027ee540244696', '100013', '17b062404ad6692a24db38f159d4806e', '2024-05-02 12:20:55', 1, 1, '32146823-e653-44b6-89ff-865f4591ed64', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('585c81a96a0330cdd355712d43681d87', '100030', '9d279d00b6662d2d80372ce993b8b96a', '2024-05-02 12:27:23', 1, 1, '91e4dd74-3993-4a51-8bcb-b1ce85d22ebc', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('6e2934a48271b7419dca4d6c4f54aa0e', '100025', 'c409acf96c434e432fb1e8c57798a5aa', '2024-05-02 12:27:23', 1, 1, '723f7f17-51cf-49e6-a34e-ea6a685d35d9', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('7eef2ee201c62d6fd99383eab3610b5d', '100024', 'ba8dbfb124c5b0d60c23c144f8029dc4', '2024-05-02 12:27:21', 1, 1, '8a8978d0-557d-4d7d-ba39-2cfcd7e893d6', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('80cfec95379cca51bd7d2bcf78f5cbbf', '100034', 'a43c45e7ae8b9d3173915df4ad41c024', '2024-05-02 12:27:23', 1, 1, '3f49e70b-415a-4759-9b28-154c2d3426cc', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('853b7cf6d041b3af1c054cc9a2362426', '100019', 'eba7a04c32e6308684285f4952e21952', '2024-05-02 12:20:55', 1, 1, 'af376dab-0405-4230-8c4e-7d78b16807f6', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('8b027a3836f9b670b7e6aa120e0e72c8', '100009', '6c8974fc5541298f6e0b91ca8aa785e4', '2024-05-01 15:16:09', 1, 1, '2e179d88-71ba-4eaf-a3a3-3ff85be02365', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('901e40915fd7f6cd88f4ffe9f37939cb', '100026', 'b06b1f0cee351472a478682c136c42e5', '2024-05-02 12:27:23', 1, 1, 'eb4bb813-f023-49df-b9de-63113d28beb4', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('9041793e273e21544afa0258538378b5', '100022', 'c922c3fde78a0623698bf32ce61f41b6', '2024-05-02 12:20:55', 1, 1, 'e8fba4bf-9eaf-45ab-9092-dba1d504db16', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('90b5b850e80c0c7dd092dd4b89df47d9', '100008', '49051c6a39c3494b7c8510309433b0ab', '2024-05-01 15:16:06', 1, 1, '4df18d3b-2954-41fd-b832-54c122828424', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('a5f40073b27b35e4cd2ef91fcd3ada95', '100032', '97b8afc080c4fb34fd2f4908bdbdd644', '2024-05-02 12:27:23', 1, 1, 'd2a5cf18-ab1f-41c7-a0f6-66b34fc2cb0c', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('b60f2f333bb76a15381b3856cf7615bb', '100033', 'cd2f63d57e4188f75bc07ad03eb57c22', '2024-05-02 12:27:23', 1, 1, 'bf6625ca-2e7b-4008-901d-97fd5266b69a', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('b9e5d419dc963c5245ba76817908da24', '100015', 'ba6f6c55200b605beff48107bbae073d', '2024-05-02 12:20:55', 1, 1, 'a7997de1-aad8-4aaa-9722-d0aea28ccfc5', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('c58bb522b34344d26b92013959274bef', '100027', 'be9dd598211fa09190c43bf56de83e99', '2024-05-02 12:27:23', 1, 1, 'd01c090f-f45b-4d08-8f8e-6bf3aa8b347b', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('d0eeaf1df4b29de2a53151f015becb8c', '100028', '5a1375c2e591511d0a3f58ec4f1ed662', '2024-05-02 12:27:23', 1, 1, '6c2f3213-50b0-4632-9be1-d284798e800b', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('d72a2c5fbae2a0615e3bdce82f6cdca1', '100009', 'c40ed1a1b37d19800bc36c5b9308b6dd', '2024-05-01 15:16:09', 1, 1, '5e5e94f7-afce-4c97-aa6c-5fee8de7e5b4', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('dfb54faac8358e29ca0bae0a1f426806', '100010', '30ddfbf2001a0cd1d885219a09511a14', '2024-05-01 15:16:17', 1, 1, '50aedb64-3099-4d5c-b461-67b73e2a1163', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('e312032d6785562cb4c13126ab37f03a', '100018', '2b1007603786cf7995e231dbb7b534e0', '2024-05-02 12:20:55', 1, 1, '60ad574c-dea8-4ea3-b17f-16c227acfc93', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('e332412bda95bb274823db5ed25aed64', '100014', 'd714bc45b9dde2178d83334960650f92', '2024-05-02 12:20:55', 1, 1, '2f355c43-fee9-42cc-9fc3-cb72e887b180', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('e448c48bc59b3608506ed26dffdf5959', '100005', '723201f785e5a76ca877c8bc5607d8e7', '2024-05-01 14:41:53', 1, 1, '999c2248-fe89-41f9-87fd-97b799a78bb8', NULL, 1, 1, '张四');
INSERT INTO `tb_user` VALUES ('ea11b92ccbf79ba4a8bd710c01b38cb4', '100029', '9517a58857ab11e907981e7f5ef0e440', '2024-05-02 12:27:23', 1, 1, '6f465702-e0d8-41c1-8536-5baa522a2fb6', NULL, 1, 1, NULL);
INSERT INTO `tb_user` VALUES ('fd8fcb0d526e4a23a86480b99e21dd3a', '100006', 'bca158bc36389bc585fa50fe7b94e586', '2024-05-01 15:05:51', 1, 1, '5f79a875-a64b-4f2c-ad24-48db330f40b5', NULL, 1, 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
