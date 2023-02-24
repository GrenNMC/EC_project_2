/*
 Navicat Premium Data Transfer

 Source Server         : EC
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : 34.87.14.0:3306
 Source Schema         : recauction_db

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 23/12/2022 20:39:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for VerificationToken
-- ----------------------------
DROP TABLE IF EXISTS `VerificationToken`;
CREATE TABLE `VerificationToken`  (
  `id` bigint NOT NULL,
  `expiryDate` date NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9e6flhs6kkmh4vl7b5m5o4nxc`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FK9e6flhs6kkmh4vl7b5m5o4nxc` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of VerificationToken
-- ----------------------------
INSERT INTO `VerificationToken` VALUES (15, '2022-12-24', '89c5ba2f-6433-45e6-b88e-cf14cb29b307', 17);
INSERT INTO `VerificationToken` VALUES (16, '2022-12-24', 'b72cb164-7df9-4378-9ad2-21b8d43c234d', 18);
INSERT INTO `VerificationToken` VALUES (17, '2022-12-24', '960197ba-febb-4911-9067-733661fa0261', 6);
INSERT INTO `VerificationToken` VALUES (18, '2022-12-24', '8ebf868d-aa06-4d8a-ae99-24ed42f88a9c', 20);
INSERT INTO `VerificationToken` VALUES (19, '2022-12-24', '9c8ca305-23fd-4617-9d72-a30a880fe1ae', 21);
INSERT INTO `VerificationToken` VALUES (20, '2022-12-24', '08a72291-82eb-4293-9494-f2c25b858f99', 22);
INSERT INTO `VerificationToken` VALUES (22, '2022-12-24', '2582d65c-643c-4bef-8a60-35b38d548419', 24);
INSERT INTO `VerificationToken` VALUES (23, '2022-12-24', 'a37e476c-30d5-43ee-87d1-0fdc4de1f420', 25);
INSERT INTO `VerificationToken` VALUES (24, '2022-12-24', '1bd74f68-a167-434a-9a57-89e14a75a6d3', 26);

-- ----------------------------
-- Table structure for auct_sess_join
-- ----------------------------
DROP TABLE IF EXISTS `auct_sess_join`;
CREATE TABLE `auct_sess_join`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `auction_sess_id` int NOT NULL,
  `price` double NOT NULL,
  `status` int NOT NULL,
  `time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auction_sess_id`(`auction_sess_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `auct_sess_join_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auct_sess_join_ibfk_2` FOREIGN KEY (`auction_sess_id`) REFERENCES `auction_session` (`auction_sess_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auct_sess_join
-- ----------------------------
INSERT INTO `auct_sess_join` VALUES (3, 1, 9, 240000, 4, '2022-12-22 04:07:08.000000');
INSERT INTO `auct_sess_join` VALUES (4, 2, 13, 1100000, 4, '2022-12-22 22:40:09.000000');
INSERT INTO `auct_sess_join` VALUES (5, 3, 10, 3200000, 4, '2022-12-23 06:41:02.350000');
INSERT INTO `auct_sess_join` VALUES (6, 6, 17, 2450000, 3, '2022-12-23 16:51:23.127000');
INSERT INTO `auct_sess_join` VALUES (7, 7, 17, 2250000, 3, '2022-12-23 16:57:54.384000');
INSERT INTO `auct_sess_join` VALUES (9, 9, 17, 1800000, 4, '2022-12-23 18:14:50.187000');

-- ----------------------------
-- Table structure for auction_img
-- ----------------------------
DROP TABLE IF EXISTS `auction_img`;
CREATE TABLE `auction_img`  (
  `imageId` bigint NOT NULL AUTO_INCREMENT,
  `image_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `auction_session_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`imageId`) USING BTREE,
  INDEX `FKkvhwe7jijt6thcav5v489cnyy`(`auction_session_id` ASC) USING BTREE,
  CONSTRAINT `FKkvhwe7jijt6thcav5v489cnyy` FOREIGN KEY (`auction_session_id`) REFERENCES `auction_session` (`auction_sess_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auction_img
-- ----------------------------

-- ----------------------------
-- Table structure for auction_session
-- ----------------------------
DROP TABLE IF EXISTS `auction_session`;
CREATE TABLE `auction_session`  (
  `auction_sess_id` int NOT NULL AUTO_INCREMENT,
  `closing_price` double NULL DEFAULT NULL,
  `createDate` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `isComplete` bit(1) NOT NULL,
  `product_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category_id` int NOT NULL,
  `reserve_price` double NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `product_tag_str` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`auction_sess_id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `auction_session_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auction_session_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auction_session
-- ----------------------------
INSERT INTO `auction_session` VALUES (9, NULL, '2022-12-22 04:05:47.449000', '2022-12-22 04:25:47.000000', b'1', 'Iphone 14 New', 1, 250000, '2022-12-22 04:05:47.000000', 6, '#iphone14', 'Điện thoại tốt');
INSERT INTO `auction_session` VALUES (10, NULL, '2022-12-22 13:10:31.693000', '2022-12-24 01:10:31.000000', b'0', 'Điện thoại Xiaomi Redmi Note 11 (6GB/128GB) Cũ', 1, 3590000, '2022-12-22 01:10:31.000000', 6, '#xiaomi', 'Điện thoại tốt');
INSERT INTO `auction_session` VALUES (13, NULL, '2022-12-22 22:37:21.510000', '2022-12-22 10:40:21.000000', b'1', 'Giày Nike Dunk Low \'Coast\'  Màu Xanh', 2, 1250000, '2022-12-22 10:37:21.000000', 6, '#giaynike', 'Giày đẹp');
INSERT INTO `auction_session` VALUES (16, NULL, '2022-12-23 16:36:19.204000', '2022-12-25 04:36:19.000000', b'0', 'Iphone XS Likenew 98%', 1, 8490000, '2022-12-23 04:36:19.000000', 20, '#apple', 'Điện thoại tốt');
INSERT INTO `auction_session` VALUES (17, NULL, '2022-12-23 16:41:43.176000', '2022-12-23 05:41:43.000000', b'1', 'Xiaomi Redmi 9 New', 1, 2800000, '2022-12-23 04:41:43.000000', 20, '#xiaomi', 'Điện thoại tốt');
INSERT INTO `auction_session` VALUES (18, NULL, '2022-12-23 16:43:22.591000', '2022-12-25 04:43:22.000000', b'0', 'Áo phông nam Louis Vuitton ', 1, 640000, '2022-12-23 04:43:22.000000', 20, '#ao', 'Điện thoại tốt');
INSERT INTO `auction_session` VALUES (19, NULL, '2022-12-23 17:13:32.487000', '2022-12-25 05:13:32.000000', b'0', 'Iphong 14 promax', 3, 28000, '2022-12-23 05:13:32.000000', 5, '#apple', 'iPad mini 6 chiếc iPad có hiệu năng mạnh mẽ');
INSERT INTO `auction_session` VALUES (20, NULL, '2022-12-23 17:17:28.272000', '2022-12-25 05:17:28.000000', b'0', 'Máy tính bảng iPad mini 6 WiFi Cellular 64GB ', 1, 14990000, '2022-12-23 05:17:28.000000', 5, '#apple', 'iPad mini 6 chiếc iPad có hiệu năng mạnh mẽ\n\n');
INSERT INTO `auction_session` VALUES (22, NULL, '2022-12-23 17:34:29.014000', '2022-12-26 05:34:29.000000', b'0', 'Iphong 14 promax', 3, 2800000, '2022-12-24 05:34:29.000000', 5, '#iphone14', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Điện thoại', 'Khi khoa học kỹ thuật liên tục được cải tiến và công nghệ phát triển không ngừng thì đó cũng là lúc chiếc điện thoại di động trở nên quan trọng hơn bao giờ hết. Thật vậy, chúng ta có thể làm được rất nhiều việc: gọi điện, nhắn tin, gửi mail, soạn tài liệu (Word, Excel), chụp ảnh – quay video, xem phim hay chơi game với thiết bị có kích thước chỉ bằng một bàn tay.\n\\nChính vì vậy, thị trường di động luôn chứng kiến sự cạnh tranh vô cùng khốc liệt giữa các nhà sản xuất. Họ sẵn sàng đầu tư nghiên cứu để liên tục cho ra đời những chiếc điện thoại mới nhất chất lượng, từ giá rẻ, tầm trung, cận cao cấp cho đến cao cấp để đáp ứng tối đa nhu cầu của mọi đối tượng người dùng.', 'smart-phone\n');
INSERT INTO `category` VALUES (2, 'Thời Trang', 'Nhu cầu làm đẹp của cá nhân ngày càng tăng cao cho nên việc sơ hữu việc nhiều quần áo la nhu cầu cần thiết', 'fashion.png');
INSERT INTO `category` VALUES (3, 'Khác', 'Các sản phẩm khác', 'assets.png');

-- ----------------------------
-- Table structure for commission
-- ----------------------------
DROP TABLE IF EXISTS `commission`;
CREATE TABLE `commission`  (
  `order_id` int NOT NULL,
  `amount_from_buyer` float NOT NULL,
  `amount_from_supplier` float NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commission
-- ----------------------------

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery`  (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `discount` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`delivery_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES (1, 15000, 'Viettel Post');

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (25);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `createDate` datetime(6) NOT NULL,
  `delivery_id` int NULL DEFAULT NULL,
  `address_id` int NULL DEFAULT NULL,
  `shipping_price` float NULL DEFAULT NULL,
  `status` int NOT NULL,
  `total_price` double NOT NULL,
  `updateDate` date NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  `win_auct_id` bigint NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `delivery_id`(`delivery_id` ASC) USING BTREE,
  INDEX `FK4trdox2wiutge5kyr6ijig7r`(`address_id` ASC) USING BTREE,
  INDEX `FK787ibr3guwp6xobrpbofnv7le`(`product_id` ASC) USING BTREE,
  INDEX `FKel9kyl84ego2otj2accfd8mr7`(`user_id` ASC) USING BTREE,
  INDEX `FKgs2r4yuubcdf6sm65io49sod9`(`win_auct_id` ASC) USING BTREE,
  CONSTRAINT `FK4trdox2wiutge5kyr6ijig7r` FOREIGN KEY (`address_id`) REFERENCES `user_address` (`address_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK787ibr3guwp6xobrpbofnv7le` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKgs2r4yuubcdf6sm65io49sod9` FOREIGN KEY (`win_auct_id`) REFERENCES `auct_sess_join` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, '2022-12-22 12:09:28.752000', 1, 3, 22500, 4, 240000, '2022-12-22', 1, 6, 3);
INSERT INTO `orders` VALUES (5, '2022-12-22 23:12:48.346000', 1, 2, 22500, 4, 1100000, '2022-12-22', 2, 6, 4);
INSERT INTO `orders` VALUES (6, '2022-12-23 18:36:09.768000', 1, 10, 22500, 2, 1800000, '2022-12-23', 9, 20, 9);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int NOT NULL,
  `default_price` float NOT NULL,
  `min_price` float NOT NULL,
  `supplier_id` int NOT NULL,
  `isDeleted` bit(1) NULL DEFAULT NULL,
  `product_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  INDEX `supplier_id`(`supplier_id` ASC) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, 'iPhone 14 Pro Max là mẫu flagship nổi bật nhất của Apple trong lần trở lại năm 2022 với nhiều cải tiến về công nghệ cũng như vẻ ngoài cao cấp, sang chảnh hợp với gu thẩm mỹ đại chúng. Những chiếc điện thoại đến từ nhà Táo Khuyết nhận được rất nhiều sự kỳ vọng của thị trường ngay từ khi chưa ra mắt. Vậy liệu những chiếc flagship đến từ công ty công nghệ hàng đầu thế giới này có làm bạn thất vọng? Cùng khám phá những điều thú vị về iPhone 14 Pro Max ở bài viết dưới đây nhé.\r\nChỉ trong ngày đầu mở bán, lượng khách hàng đặt mua iPhone 14 Pro Max tăng đột biến. Trong đó, phiên bản iPhone 14 Pro Max bản 128GB chỉ trong thời gian ngắn nhanh chóng hết hàng, chỉ còn lại các bản 256GB, 512GB và 1TB. Nhiều khách hàng đăng ký sau phải chờ đến đợt giao hàng tiếp theo. Dự kiến tại Việt Nam sẽ xảy ra tình trạng khan hiếm hàng trong tuần đầu trả hàng. Tại CellphoneS, bạn hoàn toàn có thể nhận được ưu đãi cực khủng khi tham gia chương trình thu cũ đổi mới và nhận hoàn tiền từ các đối tác liên kết.\r\n', ' iPhone 14 Pro Max 128GB | Chính hãng VN/A (99%)', 1, 1000000000, 0, 1, b'0', '#iphone14');
INSERT INTO `product` VALUES (2, 2, 'Giày Nike Dunk Low \'Coast\' DD1503-100 Màu Xanh Size 37.5 - Mua ngay sản phẩm Giay Nike Dunk Low \'Coast\' DD1503-100 Mau Xanh Size 37.5 thương hiệu Nike ...', 'Giày Nike Dunk Low \'Coast\'  Màu Xanh F1', 1, 1590000, 1000000, 3, b'0', '#giaynike');
INSERT INTO `product` VALUES (3, 1, 'Thiết kế bo cong đậm chất Xiaomi\r\nXiaomi Redmi Note 11 xuất hiện với màu sắc trẻ trung, tất cả đều rất thời trang, sang trọng, đẹp mắt. Thiết kế cạnh bo cong mềm mại, hiện đại cho tổng thể điện thoại, nổi bật ở cụm camera sau được đặt trong mô-đun lớn.', 'Xiaomi Redmi Note 10 80%', 1, 2990000, 2590000, 1, b'0', '#xiaomi');
INSERT INTO `product` VALUES (4, 1, 'Cảm nhận đầu tiên của mình khi trên tay chiếc OPPO Reno8 Z 5G là máy có thiết kế rất đẹp, từ màu sắc cho đến cách tạo hình đều làm mình hài lòng. Trong lần ra mắt lần này thì máy có 2 phiên bản màu sắc đó là vàng đồng và đen, trên tay mình đây đang là bản màu vàng đồng.', 'Điện thoại OPPO Reno8 Z 5G', 1, 8500000, 8000000, 1, b'0', '#oppo');
INSERT INTO `product` VALUES (5, 1, 'phone đã dùng cũ', 'Iphone', 1, 20000000, 15000000, 6, b'0', '');
INSERT INTO `product` VALUES (6, 1, 'Xiao hủy diệt phân khúc', 'Xiaomi Redmi 9', 1, 2450000, 2050000, 8, b'0', '#xiaomi');
INSERT INTO `product` VALUES (7, 1, 'Điện thoại xiaomi tím mộng mơ', 'Xiaomi Redmi 9 Tím Còn Mới', 1, 2500000, 1900000, 9, b'0', '#xiaomi');
INSERT INTO `product` VALUES (9, 1, 'Sản phẩm tốt còn mới', 'Xiaomi Redmi 9 Chính Hãng', 1, 2400000, 1800000, 10, b'0', '#xiaomi');

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `img_name` varchar(2555) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`img_id`) USING BTREE,
  INDEX `dk_product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `dk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES (1, 1, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671269302/srx5trf9bww3qxiky2og.webp');
INSERT INTO `product_img` VALUES (2, 1, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671269304/yyc7yrtxjndzxa8fsics.webp');
INSERT INTO `product_img` VALUES (3, 2, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671722732/exyugyhzuv5qyhwgeoig.jpg');
INSERT INTO `product_img` VALUES (4, 2, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671722735/lumwxn9djjoweaitapnv.jpg');
INSERT INTO `product_img` VALUES (5, 3, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671731497/zctuoirwmjltx9mkz1zz.jpg');
INSERT INTO `product_img` VALUES (6, 2, '');
INSERT INTO `product_img` VALUES (7, 2, '');
INSERT INTO `product_img` VALUES (8, 1, '');
INSERT INTO `product_img` VALUES (9, 4, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671754454/qajhhkiddm1gkogilbwh.jpg');
INSERT INTO `product_img` VALUES (10, 5, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671785648/pdikr8jmlahwvdemaswr.png');
INSERT INTO `product_img` VALUES (11, 6, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671788912/nxsp2vrus9gygwcjyfbd.jpg');
INSERT INTO `product_img` VALUES (12, 7, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671789385/hgkjukutf60sqw9gn0di.jpg');
INSERT INTO `product_img` VALUES (14, 9, 'https://res.cloudinary.com/dddb8btv0/image/upload/v1671794050/xictxsrxs5gjpdaqqmgr.jpg');

-- ----------------------------
-- Table structure for product_tag
-- ----------------------------
DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag`  (
  `ptag_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ptag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_tag
-- ----------------------------
INSERT INTO `product_tag` VALUES (1, '#iphone14', 'Dòng sản phẩm iphone 14');
INSERT INTO `product_tag` VALUES (2, '#samsungS22', 'Điện thoại s22');
INSERT INTO `product_tag` VALUES (3, '#donghowd', 'Đồng hồ hãng WD');
INSERT INTO `product_tag` VALUES (4, '#xiaomi', 'Điện thoại xiaomi');
INSERT INTO `product_tag` VALUES (5, '#giaynike', 'Giày Nike');
INSERT INTO `product_tag` VALUES (6, '#nokia', 'Điện thoại nokia');
INSERT INTO `product_tag` VALUES (7, '#apple', 'Điện thoại apple');
INSERT INTO `product_tag` VALUES (8, '#quan', 'Quần');
INSERT INTO `product_tag` VALUES (9, '#ao', 'Áo');
INSERT INTO `product_tag` VALUES (10, '#casio', 'Đồng hồ');
INSERT INTO `product_tag` VALUES (11, '#maytinhbang', 'Máy tính bảng');
INSERT INTO `product_tag` VALUES (12, '#laptop', 'Laptop');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, NULL, 'ROLE_ADMIN');
INSERT INTO `role` VALUES (2, NULL, 'ROLE_SUPPLIER');
INSERT INTO `role` VALUES (3, NULL, 'ROLE_USER\n');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `createDate` date NOT NULL,
  `isActive` bit(1) NOT NULL,
  `level_supp` int NOT NULL,
  `owner_id` int NOT NULL,
  `rating` int NOT NULL,
  `location` int NOT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE,
  UNIQUE INDEX `owner_id`(`owner_id` ASC) USING BTREE,
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '2022-12-17', b'1', 1, 5, 5, 0);
INSERT INTO `supplier` VALUES (2, '2022-12-22', b'1', 1, 8, 0, 1);
INSERT INTO `supplier` VALUES (3, '2022-12-22', b'1', 1, 9, 0, 11);
INSERT INTO `supplier` VALUES (4, '2022-12-23', b'1', 1, 7, 0, 3);
INSERT INTO `supplier` VALUES (5, '2022-12-23', b'1', 1, 17, 0, 1);
INSERT INTO `supplier` VALUES (6, '2022-12-23', b'1', 1, 18, 0, 12);
INSERT INTO `supplier` VALUES (7, '2022-12-23', b'1', 1, 20, 0, 1);
INSERT INTO `supplier` VALUES (8, '2022-12-23', b'1', 1, 21, 0, 15);
INSERT INTO `supplier` VALUES (9, '2022-12-23', b'1', 1, 22, 0, 13);
INSERT INTO `supplier` VALUES (10, '2022-12-23', b'1', 1, 23, 0, 20);
INSERT INTO `supplier` VALUES (11, '2022-12-23', b'1', 1, 26, 0, 9);

-- ----------------------------
-- Table structure for tag_match_product
-- ----------------------------
DROP TABLE IF EXISTS `tag_match_product`;
CREATE TABLE `tag_match_product`  (
  `tag_id` bigint NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`tag_id`, `product_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `tag_match_product_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `product_tag` (`ptag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tag_match_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_match_product
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createDate` date NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isActive` bit(1) NOT NULL,
  `lastName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `level_user` int NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  INDEX `fk_role_id`(`role_id` ASC) USING BTREE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, NULL, '2022-12-17', 'thuanhoatruong23@gmail.com', 'Thuan Hoa', b'1', 'Truong', 1, '$2a$10$vb5G3.RXgRykMXkEik6nEemJCkF22bffwZip8q895bNRKugs2ssYO', '123456', 3, NULL);
INSERT INTO `user` VALUES (4, NULL, '2022-12-17', 'truongthuanhoa23@gmail.com', 'Thuan Hoa', b'1', 'Truong', 1, '$2a$10$r1URs7nMwV1nIjw2PubcN.3djC4OOwTCNUwMX9rGGYAtYc4zzyIoK', '1234676', 1, NULL);
INSERT INTO `user` VALUES (5, NULL, '2022-12-17', 'tdat.it2k2@gmail.com', 'Dat', b'0', 'Tester', 1, '$2a$10$qxP6ul08NQRxT0Y1zNdVEujUN9uwt2cPKLFYh/Sgx1Ei8hbPhRIgS', '0393546167', 2, NULL);
INSERT INTO `user` VALUES (6, NULL, '2022-12-21', 'buyer123@gmail.com', 'USER TEST', b'1', 'BUYER', 1, '$2a$10$4IZknacaFctgNyxEVKhfVuUFyij/3L2JAA9A0DLAy9iY/RvLlEor2', '0393546999', 3, NULL);
INSERT INTO `user` VALUES (7, NULL, '2022-12-21', '20110463@student.hcmute.edu.vn', 'Văn Giang', b'0', 'Nguyễn', 1, '$2a$10$Sm1UD3AzMvNB4u/h2hDBTeyzR5mxotQr2y00lPnCqOqe.9Uj/rn8a', '0393508078', 2, NULL);
INSERT INTO `user` VALUES (8, NULL, '2022-12-22', 'supplier@recauction.com', 'SUPPILER', b'0', 'TEST ACCOUNT', 1, '$2a$10$IQYDIZ/q62Ci3WazZhXVGOII50OeqEnoNsitF1hZe2WqhOWXRLBO.', '0986755237', 2, NULL);
INSERT INTO `user` VALUES (9, NULL, '2022-12-22', '20110485@student.hcmute.edu.vn', 'Hòa', b'1', 'Trương', 1, '$2a$10$vQQkxkWXxM6vE5LXUvaUc.QQ8StKrR4Y73xffwc7RCPrC0B7j152a', '0393546888', 2, NULL);
INSERT INTO `user` VALUES (16, NULL, '2022-12-23', 'admin@recauction.com', 'ADMIN', b'1', 'ACCOUNT', 1, '$2a$10$NPX6KIzRiH/iGS1AbZaIYu6qNa9Q6HlYJUUdtp3S.zRG3R.zToV6m', '0393589215', 1, NULL);
INSERT INTO `user` VALUES (17, NULL, '2022-12-23', '20110132@student.hcmute.edu.vn', 'Cuong', b'1', 'Nguyen', 1, '$2a$10$yM7M7NSsea15zfogDTeJ4.W1eeufNPQb6WcRQYryGc9egFqOYEzhq', '123456789', 2, NULL);
INSERT INTO `user` VALUES (18, NULL, '2022-12-23', 'nmc0401@gmail.com', 'Đạt', b'0', 'Trần Tiến', 1, '$2a$10$cOFeNfbe2aMFuCHnzXHh/OI4RyWl1wmUm6afeep8klLTlUax6qvRa', '1234556789', 2, NULL);
INSERT INTO `user` VALUES (20, NULL, '2022-12-23', 'dat@gmail.com', 'Dat', b'1', 'Tran', 1, '$2a$10$6syOXO2aAqAFJPWpJ0zLgOdqXrukB6lTg/.8bixk/KoDkfCfi2R/6', '5665322522', 2, NULL);
INSERT INTO `user` VALUES (21, NULL, '2022-12-23', 'sup1@gmail.com', 'Người  bán', b'1', 'TEST', 1, '$2a$10$QNM4XXOUQuwKzRYkr6ixtub4Ir6Bacm2PkgZr.g4b6QyunSEDCPue', '049347562', 2, NULL);
INSERT INTO `user` VALUES (22, NULL, '2022-12-23', 'sup2@gmail.com', 'Người  bán', b'1', 'TEST 2', 1, '$2a$10$yRrj1SwNHHrxa1i0APwDEewg1qwKts.BW9sDgiiTZx41tstW5j/CO', '0987462535', 2, NULL);
INSERT INTO `user` VALUES (23, NULL, '2022-12-23', 'aibiet2098@gmail.com', 'Dat', b'1', 'Tran', 1, '$2a$10$HP8gQDoZPt0Rucb.yINzyeppSC8fy6jbNWkgj.RzLJc4htYjXiVja', '0393546167', 2, NULL);
INSERT INTO `user` VALUES (24, NULL, '2022-12-23', 'scallet6554@gmail.com', 'Dat', b'0', 'Tran Tien', 1, '$2a$10$wJitgqGj9oBj/RMwiPi5iOdE8v7o4yIbDZkX8dLn4D9AMDhmqdnCS', '098653242', 3, NULL);
INSERT INTO `user` VALUES (25, NULL, '2022-12-23', 'scallet123@gmail.com', 'Dat', b'0', 'Tran', 1, '$2a$10$dXGl7w/AYr.ZY0KQxoWXF.xc080U1E.M4y4OJ8isJG4i5j.fa9qQC', '12345567', 3, NULL);
INSERT INTO `user` VALUES (26, NULL, '2022-12-23', 'scallet@gmail.com', 'Dat', b'0', 'Tran Tien', 1, '$2a$10$ccQRMfGTI9aomCM4o6mJ1edlPhzEM0URTNyc.bK6MY9Mxqduu./Hq', '1234556789', 2, NULL);

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int NOT NULL,
  `address_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `district` int NOT NULL,
  PRIMARY KEY (`address_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (1, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 5, '145/1 Hoàng Diệu 2', 9);
INSERT INTO `user_address` VALUES (2, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 6, 'Số 1 Võ Văn Ngân', 9);
INSERT INTO `user_address` VALUES (3, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 6, '141 Hai Bà Trưng', 1);
INSERT INTO `user_address` VALUES (4, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 9, '174 Hoàng Diệu ', 11);
INSERT INTO `user_address` VALUES (5, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 18, '134, ', 1);
INSERT INTO `user_address` VALUES (6, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 18, '134, Nguyễn Ảnh Thủ', 22);
INSERT INTO `user_address` VALUES (7, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 24, 'số 1, VVN', 9);
INSERT INTO `user_address` VALUES (8, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 26, 'số 1, Võ Văn Ngân', 9);
INSERT INTO `user_address` VALUES (9, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 23, '145/1 Hoàng Diệu 2, Linh Trung', 9);
INSERT INTO `user_address` VALUES (10, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 20, '828 Sư Vạn Hạnh, Phường 12', 1);
INSERT INTO `user_address` VALUES (11, 'Thành Phố Hồ Chí Minh', 'Việt Nam', 20, 'Võ Văn Ngân', 9);

-- ----------------------------
-- Table structure for verificationtoken
-- ----------------------------
DROP TABLE IF EXISTS `verificationtoken`;
CREATE TABLE `verificationtoken`  (
  `id` bigint NOT NULL,
  `expiryDate` datetime(6) NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `verificationtoken_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of verificationtoken
-- ----------------------------

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet`  (
  `wallet_id` int NOT NULL AUTO_INCREMENT,
  `account_balance` double NOT NULL,
  `isActive` bit(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`wallet_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wallet
-- ----------------------------
INSERT INTO `wallet` VALUES (1, 5779830, b'1', 5);
INSERT INTO `wallet` VALUES (2, 5778926, b'1', 6);
INSERT INTO `wallet` VALUES (3, 1999914, b'1', 9);
INSERT INTO `wallet` VALUES (4, 5049882, b'1', 20);
INSERT INTO `wallet` VALUES (5, 120, b'1', 21);
INSERT INTO `wallet` VALUES (6, 0, b'1', 22);
INSERT INTO `wallet` VALUES (7, 0, b'1', 23);

-- ----------------------------
-- Table structure for wallet_history
-- ----------------------------
DROP TABLE IF EXISTS `wallet_history`;
CREATE TABLE `wallet_history`  (
  `no_history` int NOT NULL AUTO_INCREMENT,
  `createDate` datetime NOT NULL,
  `type` bit(1) NOT NULL,
  `value` double NOT NULL,
  `wallet_id` int NOT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`no_history`) USING BTREE,
  INDEX `wallet_id`(`wallet_id` ASC) USING BTREE,
  CONSTRAINT `wallet_history_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`wallet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wallet_history
-- ----------------------------
INSERT INTO `wallet_history` VALUES (1, '2022-12-22 03:36:24', b'1', 285600, 2, 'PAYID-MORW4NQ5K8062996N933200V');
INSERT INTO `wallet_history` VALUES (2, '2022-12-22 03:38:59', b'1', 119000, 2, 'PAYID-MORW5WA46755034EX075114U');
INSERT INTO `wallet_history` VALUES (3, '2022-12-22 03:57:11', b'1', 2380000, 1, 'PAYID-MORXGHA6HD8346615863673C');
INSERT INTO `wallet_history` VALUES (4, '2022-12-22 11:39:19', b'1', 99960, 1, 'PAYID-MOR56YY6FM80021Y3005811Y');
INSERT INTO `wallet_history` VALUES (5, '2022-12-22 11:40:09', b'1', 1199996, 1, 'PAYID-MOR57GY6E687756RY556070S');
INSERT INTO `wallet_history` VALUES (6, '2022-12-22 13:06:59', b'1', 1999914, 2, 'PAYID-MOR7H2I97180584078827346');
INSERT INTO `wallet_history` VALUES (7, '2022-12-22 20:44:04', b'0', 240000, 2, 'CHARGE ORDER');
INSERT INTO `wallet_history` VALUES (8, '2022-12-22 22:19:52', b'1', 1999914, 3, 'PAYID-MOSHK7I0KL493220W5009514');
INSERT INTO `wallet_history` VALUES (9, '2022-12-22 23:14:40', b'0', 1100000, 2, 'CHARGE ORDER');
INSERT INTO `wallet_history` VALUES (11, '2022-12-23 16:33:49', b'1', 5499942, 4, 'PAYID-MOSXLOI24590758GU2656258');
INSERT INTO `wallet_history` VALUES (12, '2022-12-23 17:11:53', b'1', 99960, 1, 'PAYID-MOSX5QQ89F32491SL693542M');
INSERT INTO `wallet_history` VALUES (13, '2022-12-23 17:12:48', b'1', 1999914, 1, 'PAYID-MOSX5UY6CL19338WN785270R');
INSERT INTO `wallet_history` VALUES (14, '2022-12-23 18:48:33', b'0', 1800000, 4, 'CHARGE ORDER');
INSERT INTO `wallet_history` VALUES (15, '2022-12-23 18:49:26', b'1', 149940, 4, 'PAYID-MOSZLLQ0MW86112WT920104R');

SET FOREIGN_KEY_CHECKS = 1;
