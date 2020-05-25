--项目涉及到两张表，seckill:秒杀库存表，success_killed:秒杀成功明细表
--seckill:秒杀库存表

CREATE TABLE `seckill`  (
  `seckill_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品库存ID',
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `number` int(11) NOT NULL COMMENT '库存数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '秒杀开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '秒杀结束时间',
  PRIMARY KEY (`seckill_id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀库存表';

--插入数据：
INSERT INTO `seckill` VALUES (1000, '1000元秒杀iphone6', 100, '2018-10-14 22:36:57', '2016-01-01 00:00:00', '2016-01-02 00:00:00');
INSERT INTO `seckill` VALUES (1001, '800元秒杀ipad', 200, '2018-10-14 22:36:57', '2016-01-01 00:00:00', '2016-01-02 00:00:00');
INSERT INTO `seckill` VALUES (1002, '6600元秒杀mac book pro', 300, '2018-10-14 22:36:57', '2016-01-01 00:00:00', '2016-01-02 00:00:00');
INSERT INTO `seckill` VALUES (1003, '7000元秒杀iMac', 400, '2018-10-14 22:36:57', '2016-01-01 00:00:00', '2016-01-02 00:00:00');


--success_killed:秒杀成功明细表
CREATE TABLE `success_killed`  (
  `seckill_id` bigint(20) NOT NULL COMMENT '秒杀商品ID',
  `user_phone` bigint(20) NOT NULL COMMENT '用户手机号',
  `state` tinyint(4) NOT NULL DEFAULT -1 COMMENT '状态标识:-1:无效 0:成功 1:已付款 2:已发货',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`, `user_phone`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀成功明细表';

