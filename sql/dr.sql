SET NAMES UTF8;
DROP DATABASE IF EXISTS dr;
CREATE DATABASE dr CHARSET=UTF8;
USE dr;


/**首饰系列名**/
CREATE TABLE dr_series(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  sname VARCHAR(32)
);

/**首饰商品总体参数**/
CREATE TABLE dr_jewellry(
  jid INT PRIMARY KEY AUTO_INCREMENT, #商品编号
  series_id INT,              #所属系列编号
  title VARCHAR(128),         #主标题 商品名称
  price DECIMAL(10,2),        #价格
  pic VARCHAR(128),            #图片路径
  sale_count INT(8),	      #近期售出
  comment_count INT(8),       #评价数量
  j_weight VARCHAR(8),	      #主钻重量
  j_color VARCHAR(8),         #钻石颜色
  j_clarity VARCHAR(8),       #钻石净度
  j_cut VARCHAR(8)	      #钻石切工
);

/**商品详情数据**/
CREATE TABLE dr_jewellry_detail(
 did INT PRIMARY KEY AUTO_INCREMENT, 
 jewellry_id INT,  #商品编号
 series_id INT,              #所属系列编号

 class VARCHAR(12),          #商品分类
 No VARCHAR(12),	     #产品编号
 ring_m VARCHAR(12),	     #戒托材质
 mainring_m VARCHAR(12),     #主石材质
 mainring_s VARCHAR(12),     #主石大小
 mainring_c TINYINT(5),     #主石数量
 mainring_w VARCHAR(12),     #主石总重
 vicering_m VARCHAR(12),     #副石材质
 vicering_c TINYINT(5),     #副石数量
 vicering_w VARCHAR(12),     #副石总重
 vicering_s VARCHAR(12),     #副石形状
 shape VARCHAR(12)           #形状
);

/*商品图片**/
CREATE TABLE dr_jewellry_picsm(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  jewellry_id INT,            #商品编号
  sm VARCHAR(128)             #图片路径

);
/*门店信息**/
CREATE TABLE dr_shops(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  s_city VARCHAR(8),            #城市
  s_lon DECIMAL	(7,3),            #城市经度
  s_lat DECIMAL	(7,3),           #城市纬度
  s_name VARCHAR(16),           #店名
  s_location VARCHAR(64),       #具体位置
  s_time   VARCHAR(32),         #营业时间
  s_tel   VARCHAR(16),         #预约电话
  s_pic VARCHAR(128)             #图片路径
);


CREATE TABLE dr_jewellry_piclg(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  jewellry_id INT,            #商品编号
  lg VARCHAR(128)             #图片路径

);

/**用户信息**/
CREATE TABLE dr_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，真实姓名
  gender INT,                 #性别  0-女  1-男
  marred INT		      #婚姻状况 0-已婚 1-未婚 2-恋爱 3-单身
);

/**收货地址信息**/
CREATE TABLE dr_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE dr_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,				#用户编号
  jewellry_id INT,			#商品编号
  count INT,				#购买数量
  is_checked BOOLEAN			#是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE dr_order(
  oid INT PRIMARY KEY AUTO_INCREMENT, #订单编号
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE dr_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  jewellry_id INT,        #产品编号
  count INT               #购买数量
);

/****导航部分图片展示****/
CREATE TABLE dr_nav_gifts(
  gid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  img VARCHAR(128)
);

INSERT INTO dr_nav_gifts VALUES
(NULL,'对戒','imgs/index/1477451815.jpg'),
(NULL,'男戒','imgs/index/1477451411.jpg'),
(NULL,'吊坠','imgs/index/1477451433.jpg'),
(NULL,'手链/手镯','imgs/index/1477451532.jpg'),
(NULL,'耳钉/耳环','imgs/index/1477451745.jpg'),
(NULL,'十二星座吊坠','imgs/index/1477451664.jpg'),
(NULL,'纪念日礼物','imgs/index/1477450853.jpg'),
(NULL,'生日礼物','imgs/index/1477451776.jpg'),
(NULL,'节日礼物','imgs/index/1477451612.jpg');


/*******************/
/******数据导入******/
/*******************/
/**商品系列名称**/
INSERT INTO dr_series VALUES
(NULL,'MY HEART 系列'),
(NULL,'LOCK FOREVER系列'),
(NULL,'FOREVER 系列'),
(NULL,'BELIEVE 系列'),
(NULL,'LOVE LINE 系列'),
(NULL,'TRUE LOVE 系列'),
(NULL,'JUST YOU 系列'),
(NULL,'WITH YOU 系列'),
(NULL,'PRINCESS 系列'),
(NULL,'I SWEAR 系列');


/**商品总体参数**/
INSERT INTO dr_jewellry VALUES
(NULL,1,'My Heart 系列 奢华款 100分 F色',81899,'imgs/jewellery/1501497979.jpg',249,87,'100分','F色','SI1',NULL),
(NULL,1,'My Heart 系列 简奢款 35分 H色',16549,'imgs/jewellery/1481182302.jpg',1367,234,'35分','H色','SI1',NULL),
(NULL,1,'My Heart 系列 守护款 50分 H色',22999,'imgs/jewellery/1501641799.jpg',93,15,'50分','H色','SI1',NULL),
(NULL,1,'My Heart 系列 简奢款 50分 D色',29979,'imgs/jewellery/1468316291.jpg',15874,234,'50分','D色','VS2',NULL),

(NULL,2,'Forever 系列 经典款 30分 F色',13689,'imgs/jewellery/1468294882.jpg',28589,545,'30分','F色','VS1','VG'),
(NULL,2,'Forever 系列 奢华款 50分 G色',29549,'imgs/jewellery/1505721983.jpg',166,66,'50分','G色','VS2','VG'),
(NULL,2,'Forever 系列 经典款 18分 H色',5999,'imgs/jewellery/1468288539.jpg',186,45,'18分','H色','VS2',NULL),
(NULL,2,'Forever 系列 经典款 28分 F-G色',9479,'imgs/jewellery/1501641799.jpg',140,32,'28分','F-G色','VS2',NULL),

(NULL,3,'Believe 系列 典雅 50分 G色',27349,'imgs/jewellery/1468316291.jpg',349,1420,'50分','G色','VS2','VG'),
(NULL,3,'Believe 系列 典雅 30分 F色',13684,'imgs/jewellery/1502877893.jpg',22158,1845,'30分','F色','VS1','VG'),
(NULL,3,'Believe 系列 典雅 70分 G色',32659,'imgs/jewellery/1492745071.jpg',56,14,'70分','G色','SI1','VG'),
(NULL,3,'Believe 系列 典雅 18分 I-J色',4999,'imgs/jewellery/1487736951.jpg',1026,1648,'18分','I-J色','SI1',NULL),

(NULL,4,'LOCK FOREVER系列 心·锁唯一',33749,'imgs/jewellery/1503574612.jpg',74,4,'50分','G色','VS2','VG'),
(NULL,4,'LOCK FOREVER系列 心·锁唯一',339869,'imgs/jewellery/1486707266.jpg',0,2,'100分','D色','IF','EX'),

(NULL,5,'Love Line 系列 简奢款 50分 H色',30949,'imgs/jewellery/1505720247.jpg',14260,1788,'50分','H色','SI1','VG'),
(NULL,5,'Love Line 系列 经典款 70分 H色',37179,'imgs/jewellery/1487736504.jpg',60,88,'70分','H色','VS2','VG'),
(NULL,5,'Love Line 系列 简奢款 30分 F色',18259,'imgs/jewellery/1468316291.jpg',14460,548,'30分','F色','SI1','VG'),
(NULL,5,'Love Line 系列 简奢款 70分 H色',43679,'imgs/jewellery/1486707266.jpg',14160,1588,'70分','H色','VS2','VG'),

(NULL,6,'True Love 系列 奢华款 100分 J色',81099,'imgs/jewellery/1470290300.jpg',60,88,'100分','J色','VS2','VG'),
(NULL,6,'True Love 系列 典雅 40分 F色',21119,'imgs/jewellery/1492745071.jpg',12360,2388,'40分','F色','VS2','VG'),
(NULL,6,'True Love 系列 典雅 20分 H色',9299,'imgs/jewellery/1468288539.jpg',260,1138,'20分','H色','SI2',NULL),
(NULL,6,'True Love 系列 简奢款 100分 J色',73299,'imgs/jewellery/1490694030.jpg',5,29,'100分','J色','VS2','VG'),

(NULL,7,'Just You 系列 经典款 30分 F色',13989,'imgs/jewellery/1502877893.jpg',1452,4858,'30分','F色','VS1','VG'),
(NULL,7,'Just You 系列 浪漫款 40分 D色',20979,'imgs/jewellery/1503574612.jpg',1452,4858,'40分','D色','VS2','VG'),
(NULL,7,'Just You 系列 耀世 40分 F色',19119,'imgs/jewellery/1505720247.jpg',52,58,'40分','F色','VS2','VG'),
(NULL,7,'Just You 系列 典雅款 50分 F色',30529,'imgs/jewellery/1486707266.jpg',1405,4358,'50分','F色','VS1','VG'),

(NULL,8,'WITH YOU 系列 相拥',45999,'imgs/jewellery/1486707266.jpg',6,0,'30分','D色','IF','EX'),
(NULL,8,'WITH YOU 系列 守护',34999,'imgs/jewellery/1498100086.jpg',6,0,'30分','D色','IF','EX'),
(NULL,8,'WITH YOU 系列 厮守',34699,'imgs/jewellery/1487736951.jpg',6,0,'30分','D色','IF','EX'),
(NULL,8,'WITH YOU 系列 相许',45099,'imgs/jewellery/1502877893.jpg',6,0,'30分','D色','IF','EX'),

(NULL,9,'Princess 系列 爱侣',6199,'imgs/jewellery/1468288539.jpg',633,0,NULL,NULL,NULL,NULL),
(NULL,9,'Princess 系列 花冠',4399,'imgs/jewellery/1505721983.jpg',34,0,NULL,NULL,NULL,NULL),
(NULL,9,'Princess 系列 简爱',3899,'imgs/jewellery/1502877893.jpg',33,3,NULL,NULL,NULL,NULL),
(NULL,9,'Princess 系列 宠爱',3199,'imgs/jewellery/1481182302.jpg',13,4,NULL,NULL,NULL,NULL),

(NULL,10,'I Swear 系列 奢华款 50分 J色',30309,'imgs/jewellery/1495616910.jpg',83,4,'50分','J色','VS2','EX'),
(NULL,10,'I Swear 系列 典雅款 50分 E色',42869,'imgs/jewellery/1490694030.jpg',3,0,'50分','E色','VS2','EX'),
(NULL,10,'I Swear 系列 简奢款 50分 H色',17999,'imgs/jewellery/1487736951.jpg',73,40,'50分','H色','VS2','EX'),
(NULL,10,'I Swear 系列 经典款 40分 F色',18319,'imgs/jewellery/1468288539.jpg',43,20,'40分','F色','VS2','EX');


INSERT INTO dr_jewellry_picsm VALUES
(NULL,1,'imgs/jewellery/1501497979.jpg'),
(NULL,1,'imgs/jewellery/1501497984.jpg'),
(NULL,1,'imgs/jewellery/1501497993.jpg'),
(NULL,1,'imgs/jewellery/1501497997.jpg'),
(NULL,2,'imgs/jewellery/1481182302.jpg'),
(NULL,2,'imgs/jewellery/1481182308.jpg'),
(NULL,2,'imgs/jewellery/1481182321.jpg'),
(NULL,2,'imgs/jewellery/1481184001.jpg'),
(NULL,3,'imgs/jewellery/1501641799.jpg'),
(NULL,3,'imgs/jewellery/1501641860.jpg'),
(NULL,3,'imgs/jewellery/1501641872.jpg'),
(NULL,3,'imgs/jewellery/1501641880.jpg'),
(NULL,4,'imgs/jewellery/1481182302.jpg'),
(NULL,4,'imgs/jewellery/1481182308.jpg'),
(NULL,4,'imgs/jewellery/1481182321.jpg'),
(NULL,4,'imgs/jewellery/1489571757.jpg'),
(NULL,5,'imgs/jewellery/1503574612.jpg'),
(NULL,5,'imgs/jewellery/1503574616.jpg'),
(NULL,5,'imgs/jewellery/1507602384.jpg'),
(NULL,5,'imgs/jewellery/1507616536.jpg'),
(NULL,6,'imgs/jewellery/1503574612.jpg'),
(NULL,6,'imgs/jewellery/1503574616.jpg'),
(NULL,6,'imgs/jewellery/1507602384.jpg'),
(NULL,6,'imgs/jewellery/1507616536.jpg'),
(NULL,7,'imgs/jewellery/1468294882.jpg'),
(NULL,7,'imgs/jewellery/1468294891.jpg'),
(NULL,7,'imgs/jewellery/1468294895.jpg'),
(NULL,7,'imgs/jewellery/1489574820.jpg'),
(NULL,8,'imgs/jewellery/1505721983.jpg'),
(NULL,8,'imgs/jewellery/1505721987.jpg'),
(NULL,8,'imgs/jewellery/1505721990.jpg'),
(NULL,8,'imgs/jewellery/1505721994.jpg'),
(NULL,9,'imgs/jewellery/1468294882.jpg'),
(NULL,9,'imgs/jewellery/1468294891.jpg'),
(NULL,9,'imgs/jewellery/1468294895.jpg'),
(NULL,9,'imgs/jewellery/1489574820.jpg'),
(NULL,10,'imgs/jewellery/1468294882.jpg'),
(NULL,10,'imgs/jewellery/1468294891.jpg'),
(NULL,10,'imgs/jewellery/1468294895.jpg'),
(NULL,10,'imgs/jewellery/1489574820.jpg'),
(NULL,11,'imgs/jewellery/1468316291.jpg'),
(NULL,11,'imgs/jewellery/1468316349.jpg'),
(NULL,11,'imgs/jewellery/1468316355.jpg'),
(NULL,11,'imgs/jewellery/1489574876.jpg'),
(NULL,12,'imgs/jewellery/1468316349.jpg'),
(NULL,12,'imgs/jewellery/1468316291.jpg'),
(NULL,12,'imgs/jewellery/1468316355.jpg'),
(NULL,12,'imgs/jewellery/1489574876.jpg'),
(NULL,13,'imgs/jewellery/1468316355.jpg'),
(NULL,13,'imgs/jewellery/1468316349.jpg'),
(NULL,13,'imgs/jewellery/1468316291.jpg'),
(NULL,13,'imgs/jewellery/1489574876.jpg'),
(NULL,14,'imgs/jewellery/1489574876.jpg'),
(NULL,14,'imgs/jewellery/1468316349.jpg'),
(NULL,14,'imgs/jewellery/1468316355.jpg'),
(NULL,14,'imgs/jewellery/1468316291.jpg'),
(NULL,15,'imgs/jewellery/1505720247.jpg'),
(NULL,15,'imgs/jewellery/1468229394.jpg'),
(NULL,15,'imgs/jewellery/1468229425.jpg'),
(NULL,15,'imgs/jewellery/1505720455.jpg'),
(NULL,16,'imgs/jewellery/1487736504.jpg'),
(NULL,16,'imgs/jewellery/1469432067.jpg'),
(NULL,16,'imgs/jewellery/1469432077.jpg'),
(NULL,16,'imgs/jewellery/1469432062.jpg'),
(NULL,17,'imgs/jewellery/1505720247.jpg'),
(NULL,17,'imgs/jewellery/1468229394.jpg'),
(NULL,17,'imgs/jewellery/1468229425.jpg'),
(NULL,17,'imgs/jewellery/1505720455.jpg'),
(NULL,18,'imgs/jewellery/1505720247.jpg'),
(NULL,18,'imgs/jewellery/1468229394.jpg'),
(NULL,18,'imgs/jewellery/1468229425.jpg'),
(NULL,18,'imgs/jewellery/1505720455.jpg'),
(NULL,19,'imgs/jewellery/1470290300.jpg'),
(NULL,19,'imgs/jewellery/1470290363.jpg'),
(NULL,19,'imgs/jewellery/1470290386.jpg'),
(NULL,19,'imgs/jewellery/1470290597.jpg'),
(NULL,20,'imgs/jewellery/1492745071.jpg'),
(NULL,20,'imgs/jewellery/1492745083.jpg'),
(NULL,20,'imgs/jewellery/1492745090.jpg'),
(NULL,20,'imgs/jewellery/1492745100.jpg'),
(NULL,21,'imgs/jewellery/1492745071.jpg'),
(NULL,21,'imgs/jewellery/1492745083.jpg'),
(NULL,21,'imgs/jewellery/1492745090.jpg'),
(NULL,21,'imgs/jewellery/1492745100.jpg'),
(NULL,22,'imgs/jewellery/1492745071.jpg'),
(NULL,22,'imgs/jewellery/1492745083.jpg'),
(NULL,22,'imgs/jewellery/1492745090.jpg'),
(NULL,22,'imgs/jewellery/1492745100.jpg'),
(NULL,23,'imgs/jewellery/1486707266.jpg'),
(NULL,23,'imgs/jewellery/1470291672.jpg'),
(NULL,23,'imgs/jewellery/1470291689.jpg'),
(NULL,23,'imgs/jewellery/1470291695.jpg'),
(NULL,24,'imgs/jewellery/1486707266.jpg'),
(NULL,24,'imgs/jewellery/1470291672.jpg'),
(NULL,24,'imgs/jewellery/1470291689.jpg'),
(NULL,24,'imgs/jewellery/1470291695.jpg'),
(NULL,25,'imgs/jewellery/1486707266.jpg'),
(NULL,25,'imgs/jewellery/1470291672.jpg'),
(NULL,25,'imgs/jewellery/1470291689.jpg'),
(NULL,25,'imgs/jewellery/1470291695.jpg'),
(NULL,26,'imgs/jewellery/1486707266.jpg'),
(NULL,26,'imgs/jewellery/1470291672.jpg'),
(NULL,26,'imgs/jewellery/1470291689.jpg'),
(NULL,26,'imgs/jewellery/1470291695.jpg'),
(NULL,27,'imgs/jewellery/1486707266.jpg'),
(NULL,27,'imgs/jewellery/1498099750.jpg'),
(NULL,27,'imgs/jewellery/1498099757.jpg'),
(NULL,28,'imgs/jewellery/1498100086.jpg'),
(NULL,28,'imgs/jewellery/1498100094.jpg'),
(NULL,28,'imgs/jewellery/1498100101.jpg'),
(NULL,29,'imgs/jewellery/1502877893.jpg'),
(NULL,29,'imgs/jewellery/1502877900.jpg'),
(NULL,29,'imgs/jewellery/1502877908.jpg'),
(NULL,29,'imgs/jewellery/1502877924.jpg'),
(NULL,30,'imgs/jewellery/1502877893.jpg'),
(NULL,30,'imgs/jewellery/1502877900.jpg'),
(NULL,30,'imgs/jewellery/1502877908.jpg'),
(NULL,30,'imgs/jewellery/1502877924.jpg'),
(NULL,31,'imgs/jewellery/1487736951.jpg'),
(NULL,31,'imgs/jewellery/1486533001.jpg'),
(NULL,31,'imgs/jewellery/1486532990.jpg'),
(NULL,31,'imgs/jewellery/1486532981.jpg'),
(NULL,32,'imgs/jewellery/1487736951.jpg'),
(NULL,32,'imgs/jewellery/1486533001.jpg'),
(NULL,32,'imgs/jewellery/1486532990.jpg'),
(NULL,32,'imgs/jewellery/1486532981.jpg'),
(NULL,33,'imgs/jewellery/1487736951.jpg'),
(NULL,33,'imgs/jewellery/1486533001.jpg'),
(NULL,33,'imgs/jewellery/1486532990.jpg'),
(NULL,33,'imgs/jewellery/1486532981.jpg'),
(NULL,34,'imgs/jewellery/1487736951.jpg'),
(NULL,34,'imgs/jewellery/1486533001.jpg'),
(NULL,34,'imgs/jewellery/1486532990.jpg'),
(NULL,34,'imgs/jewellery/1486532981.jpg'),
(NULL,35,'imgs/jewellery/1495616910.jpg'),
(NULL,35,'imgs/jewellery/1495616916.jpg'),
(NULL,35,'imgs/jewellery/1495616922.jpg'),
(NULL,35,'imgs/jewellery/1495616927.jpg'),
(NULL,36,'imgs/jewellery/1490694030.jpg'),
(NULL,36,'imgs/jewellery/1490694038.jpg'),
(NULL,36,'imgs/jewellery/1490694044.jpg'),
(NULL,36,'imgs/jewellery/1490694051.jpg'),
(NULL,37,'imgs/jewellery/1468288539.jpg'),
(NULL,37,'imgs/jewellery/1468288550.jpg'),
(NULL,37,'imgs/jewellery/1468288544.jpg'),
(NULL,37,'imgs/jewellery/1468288556.jpg'),
(NULL,38,'imgs/jewellery/1468288539.jpg'),
(NULL,38,'imgs/jewellery/1468288550.jpg'),
(NULL,38,'imgs/jewellery/1468288544.jpg'),
(NULL,38,'imgs/jewellery/1468288556.jpg');




INSERT INTO dr_jewellry_detail VALUES
(NULL,1,1,'求婚钻戒','A03003','白18K金','钻石','100',1,'100分','钻石',74,'77-83.8分','圆形','心形'),
(NULL,2,1,'求婚钻戒','A03002','白18K金','钻石','35',1,'35分','钻石',26,'25-28分','圆形','心形'),
(NULL,3,1,'求婚钻戒','A16019','白18K金','钻石','50',1,'50分','钻石',38,'18分','圆形','心形'),
(NULL,4,1,'求婚钻戒','A03002','白18K金','钻石','50',1,'50分','钻石',26,'32-37分','圆形','心形'),
(NULL,5,2,'求婚钻戒','J10091','白18K金','钻石','50',1,'50分','钻石',13,'12-17分','圆形','圆形'),
(NULL,6,2,'求婚钻戒','J10091','白18K金','钻石','100',1,'100分','钻石',13,'10-17分','圆形','圆形'),
(NULL,7,3,'求婚钻戒','A02001','白18K金','钻石','30',1,'30分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,8,3,'求婚钻戒','A02003','白18K金','钻石','50',1,'50分','钻石',28,'8-12分','圆形','圆形'),
(NULL,9,3,'求婚钻戒','A02005','白18K金','钻石','18',1,'18分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,10,3,'求婚钻戒','A02005','白18K金','钻石','28',1,'28分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,11,4,'求婚钻戒','A07001','白18K金','钻石','50',1,'50分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,12,4,'求婚钻戒','A07001','白18K金','钻石','30',1,'30分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,13,4,'求婚钻戒','A07001','白18K金','钻石','70',1,'70分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,14,4,'求婚钻戒','A07001','白18K金','钻石','18',1,'18分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,15,5,'求婚钻戒','A16001','白18K金','钻石','50',1,'50分','钻石',90,'22-27分','圆形','圆形'),
(NULL,16,5,'求婚钻戒','A16003','白18K金','钻石','70',1,'70分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,17,5,'求婚钻戒','A16001','白18K金','钻石','30',1,'30分','钻石',90,'22-27分','圆形','圆形'),
(NULL,18,5,'求婚钻戒','A16001','白18K金','钻石','70',1,'70分','钻石',90,'32-37分','圆形','圆形'),
(NULL,19,6,'求婚钻戒','A06003','白18K金','钻石','100',1,'100分','钻石',68,'56-58分','圆形','圆形'),
(NULL,20,6,'求婚钻戒','A06004','白18K金','钻石','40',1,'40分','钻石',24,'24-29分','圆形','圆形'),
(NULL,21,6,'求婚钻戒','A06005','白18K金','钻石','40',1,'40分','钻石',24,'24-29分','圆形','圆形'),
(NULL,22,6,'求婚钻戒','A06002','白18K金','钻石','100',1,'100分','钻石',16,'17-18分','圆形','圆形'),
(NULL,23,7,'求婚钻戒','A05001','白18K金','钻石','30',1,'30分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,24,7,'求婚钻戒','A05002','白18K金','钻石','40',1,'40分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,25,7,'求婚钻戒','A05003','白18K金','钻石','30',1,'30分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,26,7,'求婚钻戒','A05001','白18K金','钻石','70',1,'70分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,27,8,'求婚钻戒','J10085','PT950','钻石','30',1,'30分','钻石',2,'6分','圆形','圆形'),
(NULL,28,8,'求婚钻戒','J10086','PT950','钻石','30',1,'30分','钻石',2,'3分','圆形','圆形'),
(NULL,29,8,'求婚钻戒','J10092','PT950','钻石','30',1,'30分','钻石',1,'3分','圆形','圆形'),
(NULL,30,8,'求婚钻戒','J10093','PT950','钻石','30',1,'30分','钻石',2,'3分','圆形','圆形'),
(NULL,31,9,'求婚钻戒','J10033','白18K金',NULL,NULL,NULL,NULL,'钻石',12,'33分','圆形','圆形'),
(NULL,32,9,'求婚钻戒','A10083','白18K金',NULL,NULL,NULL,NULL,'钻石',7,'22分','圆形','圆形'),
(NULL,33,9,'求婚钻戒','A10085','白18K金',NULL,NULL,NULL,NULL,'钻石',9,'17分','圆形','圆形'),
(NULL,34,9,'求婚钻戒','A10083','白18K金',NULL,NULL,NULL,NULL,'钻石',11,'11分','圆形','圆形'),
(NULL,35,10,'求婚钻戒','A04003','白18K金','钻石','50',1,'50分','钻石',12,'12-24分','圆形','圆形'),
(NULL,36,10,'求婚钻戒','J10048','白18K金','钻石','50',1,'50分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,37,10,'求婚钻戒','A04002','白18K金','钻石','50',1,'50分',NULL,NULL,NULL,NULL,'圆形'),
(NULL,38,10,'求婚钻戒','A04001','白18K金','钻石','40',1,'40分',NULL,NULL,NULL,NULL,'圆形');

/**用户信息**/
INSERT INTO dr_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1','1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1','0'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1','2'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0','1');


INSERT INTO dr_shops VALUES
(NULL,'香港','114.168','22.282','香港-铜锣湾店-中国','香港特别行政区铜锣湾白沙道15号（铜锣湾地铁站 F1 出口）','10:30-21:00（节假日照常接待）','（+852）2152 3288','imgs/dr_std/150461121059ae8b8a3af54.jpg'),
(NULL,'香港','114.168','22.282','香港-尖沙咀店-港澳台','香港九龙尖沙咀弥敦道63号 i SQUARE 国际广场地铁H出口6B号店铺','10:30-21:00（节假日照常接待）','（+852）2367 7389','imgs/dr_std/150468990459afbef0d6fdb.jpg'),
(NULL,'上海','121.477','31.237','上海-淮海中路店-中国','上海市黄浦区淮海中路806号1楼','10:30-21:00（节假日照常接待）','021-5401 8520','imgs/dr_std/150483706559b1fdc95a36f.jpg'),
(NULL,'上海','121.477','31.237','上海-瑞虹天地店-中国','上海市虹口区瑞虹路188号瑞虹天地月亮湾一层09室','10:30-21:00（节假日照常接待）','021-65057520','imgs/dr_std/150656353659cc55d064e39.jpg'),
(NULL,'上海','121.477','31.237','上海-来福士广场店-中国','上海市长宁路1123号长宁来福士广场1层中庭','10:30-21:00（节假日照常接待）','021-5401 8520','imgs/dr_std/150651180959cb8bc1c179f.jpg'),
(NULL,'上海','121.477','31.237','上海-香港广场店-中国','上海市黄浦区淮海中路282号香港广场商场北座NL1-09B室','10:30-21:00（节假日照常接待）','021-6314 0533','imgs/dr_std/150770302459ddb8f0e4a07.jpg'),
(NULL,'上海','121.477','31.237','上海-浦东正大广场店-中国','上海市浦东新区陆家嘴西路168号正大广场1楼GF10号','10:30-21:00（节假日照常接待）','021-50913520','imgs/dr_std/1503477920599d40a0a62d1.jpg'),
(NULL,'广东','113.279','23.136','深圳-来福士广场店-中国','深圳市南山区南海大道2163号来福士广场01层14号','10:30-21:00（节假日照常接待）','0755-2692 2265','imgs/dr_std/150466737759af66f1a25d4.jpg'),
(NULL,'广东','113.279','23.136','深圳-世界之窗店-中国','广东省深圳市南山区 华侨城世界之窗 欧陆风情街8号楼（世界之窗地铁站I出口 靠左边前行400米）','10:30-21:00（节假日照常接待）','0755-8662 1782','imgs/dr_std/150466733759af66c9a6008.jpg'),
(NULL,'广东','113.279','23.136','广州-中信广场店-中国','广东省广州市天河区天河北路233号中信广场中天购物城商场134-135单元（林和西地铁站 D出口）','10:30-21:00（节假日照常接待）','020-3883 6315','imgs/dr_std/150466745859af67421450d.jpg'),
(NULL,'广东','113.279','23.136','深圳-壹方城店-中国','深圳市宝安区创业二路与新湖路交汇西南处壹方城L1层022号','10:30-21:00（节假日照常接待）','400-01-13520','imgs/dr_std/150466742559af672109df3.jpg'),
(NULL,'广东','113.279','23.136','东莞-长安万科广场店-中国','东莞市长安镇长安万科广场一楼L1-034号铺','10:30-21:00（节假日照常接待）','0769-22888676','imgs/dr_std/150529219159b8ef9f84af3.jpg'),
(NULL,'广东','113.279','23.136','惠州-华贸天地店-中国','惠州市江北区文昌一路9号华贸天地一层1125B号铺位','10:30-21:00（节假日照常接待）','0752-2522520','imgs/dr_std/150580523859c0c3b6de9de.jpg'),
(NULL,'广东','113.279','23.136','东莞-汇一城店-中国','广东省东莞市南城区鸿福路200号第一国际汇一城1号裙一层B1120A','10:30-21:00（节假日照常接待）','0769-2288 6520','imgs/dr_std/150485557859b2461a45977.jpg'),
(NULL,'广东','113.279','23.136','佛山-万科广场店-中国','广东省佛山市南海区桂澜中路万科广场一层中庭M-106-1号','10:30-21:00（节假日照常接待）','0757-8626 4003','imgs/dr_std/150485599259b247b899a0c.jpg'),
(NULL,'北京','116.404','39.915','北京-世贸天阶店-中国','北京市朝阳区光华路9号世贸天阶南街一层L136','10:30-21:00（节假日照常接待）','010-5206 1062','imgs/dr_std/150466728759af66978a92f.jpg'),
(NULL,'北京','116.404','39.915','北京-银泰in88店-中国','北京市东城区王府井大街88号银泰百货in88 1幢地上二层L211号商铺','10:30-21:00（节假日照常接待）','010-5978 5521','imgs/dr_std/150580569959c0c583c6967.jpg'),
(NULL,'北京','116.404','39.915','北京-SOHO店-中国','北京市东二环 朝阳门桥银河SOHO中心负一层B-2109（朝阳门地铁站G出口)','10:30-21:00（节假日照常接待）','010-5957 6758','imgs/dr_std/150466885259af6cb412e16.jpg'),
(NULL,'北京','116.404','39.915','北京-东方新天地店-中国','北京市东城区东长安街1号北京东方广场东方新天地商场UG层A106A&B店铺','10:30-21:00（节假日照常接待）','010-85181890','imgs/dr_std/150466707559af65c3a7672.jpg'),
(NULL,'北京','116.404','39.915','北京-银泰in01店-中国','北京市朝阳区建国门外大街2号北京银泰中心地下一层B54号','10:30-21:00（节假日照常接待）','010-85172520','imgs/dr_std/150598572359c384bbaf66b.jpg'),
(NULL,'四川','104.076','30.656','成都-晶融汇广场店-中国','四川省成都市 东大街99号晶融汇广场一层114单元','10:30-21:00（节假日照常接待）','028-8147 4520','imgs/dr_std/150483735859b1feee400cc.jpg'),
(NULL,'四川','104.076','30.656','成都-银泰IN99店-中国','四川省成都市高新区天府大道北段1199号成都银泰中心第二层L210号','10:30-21:00（节假日照常接待）','028-8514 2778','imgs/dr_std/150483742059b1ff2ce55dc.jpg'),
(NULL,'四川','104.076','30.656','成都-仁恒置地店-中国','四川省成都市人民南路二段1号仁恒置地广场购物中心三层322A-322B号单元','10:30-21:00（节假日照常接待）','028-6186 7010','imgs/dr_std/150483738759b1ff0be2b34.jpg'),
(NULL,'四川','104.076','30.656','武汉-凯德西城店-中国','武汉市硚口区解放大道18号凯德西城01-02B','10:30-21:00（节假日照常接待）','027-8375 5520','imgs/dr_std/150483752159b1ff9190ab0.jpg'),
(NULL,'四川','104.076','30.656','武汉-风情街店-中国','武汉市洪山区 光谷意大利风情街5号楼一层51021号','10:30-21:00（节假日照常接待）','027-8768 8895','imgs/dr_std/150483746859b1ff5c34cfe.jpg'),
(NULL,'四川','104.076','30.656','武汉-壹方购物中心店-中国','武汉市江岸区中山大道1515号壹方购物中心2层商40单元（2-40）','10:30-21:00（节假日照常接待）','027-8291 3520','imgs/dr_std/150483749459b1ff76ef7da.jpg'),
(NULL,'四川','104.076','30.656','宜昌-大洋百货店-中国','宜昌市西陵区夷陵大道56号宜昌大洋百货','10:30-21:00（节假日照常接待）','0717-6378 124','imgs/dr_std/150483755859b1ffb6a5c40.jpg'),
(NULL,'江苏','118.795','32.063','南京-建邺万达广场店-中国','南京市建邺区江东中路98号万达广场室内步行街一层128号商铺','10:30-21:00（节假日照常接待）','0717-6378 124','imgs/dr_std/150483755859b1ffb6a5c40.jpg'),
(NULL,'江苏','118.795','32.063','南京-景枫kingmo店-中国','南京市江宁区双龙大道1698号F1-D2','10:30-21:00（节假日照常接待）','025-52713520','imgs/dr_std/150483779159b2009fe6cbd.jpg'),
(NULL,'江苏','118.795','32.063','南京-1912店-中国','江苏省南京市 长江路288号1912街区A17号楼一层','10:30-21:00（节假日照常接待）','025-8361 3520','imgs/dr_std/150483768059b20030eb634.jpg'),
(NULL,'江苏','118.795','32.063','南京-金茂汇店-中国','江苏省南京市鼓楼区中央路201号金茂汇购物中心1层L115A-L115B铺','10:30-21:00（节假日照常接待）','025-8441 3520','imgs/dr_std/150483771959b2005706e4e.jpg'),
(NULL,'江苏','118.795','32.063','无锡-恒隆广场店-中国','江苏省无锡市崇安区 人民中路139号无锡恒隆广场商场2楼207号店铺','10:30-21:00（节假日照常接待）','0510-8101 3520','imgs/dr_std/150483794959b2013d92580.jpg'),
(NULL,'江苏','118.795','32.063','无锡-宜家荟聚店-中国','无锡市锡山区团结中路3号宜家荟聚购物中心L2-109（CK旁边）','10:30-21:00（节假日照常接待）','0510-88258520','imgs/dr_std/150483797959b2015bd4edf.jpg'),
(NULL,'江苏','118.795','32.063','常州-吾悦国际广场店-中国','江苏省常州市钟楼区延陵西路123号吾悦国际广场A座一楼5-130','10:30-21:00（节假日照常接待）','0519-8681 3520','imgs/dr_std/150483829959b2029b94f3e.jpg'),
(NULL,'江苏','118.795','32.063','盐城-万达广场店-中国','盐城市盐都区西环路与腾飞路交叉口东南角盐城万达广场','10:30-21:00（节假日照常接待）','0515-8991 3520','imgs/dr_std/150483838359b202efdc906.jpg'),
(NULL,'江苏','118.795','32.063','苏州-美罗百货店-中国','江苏省苏州市观前街245号美罗百货南负一楼15号铺（乐桥地铁站7出口）','10:30-21:00（节假日照常接待）','0512-6841 3520','imgs/dr_std/150483825059b2026a5d290.jpg'),
(NULL,'江苏','118.795','32.063','南通-圆融广场店-中国','江苏省南通市崇川区工农南路57号圆融广场一层108号铺','10:30-21:00（节假日照常接待）','0513-8911 3520','imgs/dr_std/150483841359b2030d831f2.jpg'),
(NULL,'江苏','118.795','32.063','宜兴-万达广场店-中国','宜兴市东虹东路550号1059号','10:30-21:00（节假日照常接待）','0510-87331521','imgs/dr_std/150483845059b203323df6f.jpg'),
(NULL,'江苏','118.795','32.063','无锡-海岸城店-中国','无锡市滨湖区太湖新城立信大道海岸城1楼155号铺位','10:30-21:00（节假日照常接待）','0510-68509520','imgs/dr_std/150587270459c1cb4089e85.jpg'),
(NULL,'江苏','118.795','32.063','苏州-狮山天街店-中国','江苏省苏州市高新区塔园路181号SZSSTJ-A-1F-09','10:30-21:00（节假日照常接待）','0512-67244520','imgs/dr_std/150483818459b202280221b.jpg'),
(NULL,'江苏','118.795','32.063','南京-印象汇店-中国','南京市浦口区大桥北路58号南京印象汇 01-07B铺位','10:30-21:00（节假日照常接待）','025-58213520','imgs/dr_std/150483764359b2000b52bf4.jpg'),
(NULL,'江苏','118.795','32.063','徐州-云龙万达广场店-中国','徐州市云龙区和平大道58号徐州云龙万达广场一层步行街区域1003铺位','10:30-21:00（节假日照常接待）','0516-83662997','imgs/dr_std/150529219159b8ef9f84af3.jpg'),
(NULL,'江苏','118.795','32.063','海口-东方广场店-中国','海南省海口市龙华一横路99号东方广场A1','10:30-21:00（节假日照常接待）','0898-6577 8521','imgs/dr_std/150483856559b203a567593.jpg'),
(NULL,'浙江','120.208','30.252','绍兴-上虞万达广场店-中国','浙江省绍兴市上虞区称山北路399号上虞万达广场1056铺位','10:30-21:00（节假日照常接待）','400-01-13520','imgs/dr_std/150485614859b248542d93b.jpg'),
(NULL,'浙江','120.208','30.252','温州-龙湾万达店-中国','温州龙湾区永中街道永定路1188号1062铺位','10:30-21:00（节假日照常接待）','0577-8613 5209','imgs/dr_std/150485653159b249d379e58.jpg'),
(NULL,'浙江','120.208','30.252','杭州-龙湖金沙天街店-中国','杭州经济开发区金沙大道560号龙湖金沙天街购物中心1F-09','10:30-21:00（节假日照常接待）','0571-86982520','imgs/dr_std/150485645259b249849b516.jpg'),
(NULL,'浙江','120.208','30.252','杭州-利星名品广场店-中国','浙江省杭州市平海路124号利星名品广场1楼','10:30-21:00（节假日照常接待）','0571-8656 9520','imgs/dr_std/150485641159b2495b77f9a.jpg'),
(NULL,'浙江','120.208','30.252','杭州-星光大道店-中国','浙江省杭州市滨江区滨盛路1766号星光大道二期一层L146','10:30-21:00（节假日照常接待）','0571-8696 1076','imgs/dr_std/150485638359b2493f6b8d7.jpg'),
(NULL,'浙江','120.208','30.252','台州-万达广场店-中国','台州市椒江区开发大道799号台州经开万达广场1003铺','10:30-21:00（节假日照常接待）','0510-88258520','imgs/dr_std/150485657859b24a02546a9.jpg'),
(NULL,'浙江','120.208','30.252','宁波-和义大道店-中国','浙江省宁波市海曙区 和义路78号和义大道购物中心C区一层1048c号商铺','10:30-21:00（节假日照常接待）','0574-8701 3520','imgs/dr_std/150483752159b1ff9190ab0.jpg'),
(NULL,'浙江','120.208','30.252','温州-财富购物中心店-中国','浙江省温州市鹿城区车站大道路577号财富购物中心负一楼','10:30-21:00（节假日照常接待）','0577-8800 7661','imgs/dr_std/150485649059b249aa6dc5c.jpg'),
(NULL,'浙江','120.208','30.252','金华-万达广场店-中国','浙江省金华市李渔路300号万达广场室内步行街一层1032号商铺','10:30-21:00（节假日照常接待）','0579-8215 6075','imgs/dr_std/150485677659b24ac8647f5.jpg'),
(NULL,'浙江','120.208','30.252','嘉兴-万达广场店-中国','浙江省嘉兴市南湖区广益路1108号万达广场1025号铺','10:30-21:00（节假日照常接待）','0573-83525202','imgs/dr_std/150485692259b24b5ae8658.jpg'),
(NULL,'湖南','112.993','28.121','长沙-万达广场店-中国','湖南省长沙市开福区中山路589号开福万达广场一层2号门','10:30-21:00（节假日照常接待）','0731-8411 3520','imgs/dr_std/150485708359b24bfb85b44.jpg'),
(NULL,'湖南','112.993','28.121','衡阳-万达广场店-中国','衡阳市蒸湘区联合街道幸福路22号','10:30-21:00（节假日照常接待）','0734-2918520','imgs/dr_std/150485712359b24c231aad6.jpg'),
(NULL,'湖南','112.993','28.121','长沙-保利MALL店-中国','长沙市雨花区劳动东路268号保利MALL 1F1001#','10:30-21:00（节假日照常接待）','0731-84418520','imgs/dr_std/150485703759b24bcdc49cc.jpg'),
(NULL,'湖南','112.993','28.121','湘潭-万达广场店-中国','湖南省湘潭市高新区万达广场1楼1061号','10:30-21:00（节假日照常接待）','0731-58393520','imgs/dr_std/150529375259b8f5b81b78e.jpg'),
(NULL,'湖南','112.993','28.121','长沙-天心国金街店-中国','长沙市天心区国金街地下A层A058号商铺','10:30-21:00（节假日照常接待）','0731-84392520','imgs/dr_std/150529375259b8f5b81b78e.jpg'),
(NULL,'黑龙江','126.548','45.809','哈尔滨-金太阳店-中国','黑龙江省哈尔滨市 道里区地段街128号金太阳索菲亚精品城一层B区18号（7号门）','10:30-21:00（节假日照常接待）','0451-8681 3520','imgs/dr_std/15009616495976db710625f.jpg'),
(NULL,'黑龙江','126.548','45.809','大庆-新玛特店-中国','大庆市萨尔图区东风新村纬二路39号新玛特购物休闲广场 Darry ring珠宝','10:30-21:00（节假日照常接待）','0459-6150520','imgs/dr_std/150485757159b24de3e43e1.jpg')
