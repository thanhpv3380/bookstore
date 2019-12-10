-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `author` (
  `id_author` int(11) NOT NULL AUTO_INCREMENT,
  `name_author` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'MixFlavor'),(2,'Thạch Lam, Nguyễn Hữu Nhật'),(3,'The Book Worm'),(4,'Gari'),(6,'Hoa Dương'),(8,'Urako Kanamori'),(9,'Paulo Coelho'),(10,'Tony Hsieh'),(18,'Thomas Harris'),(19,'Stephen Hawking'),(21,'	Từ Lỗi Tuyên'),(22,'Nguyễn Nhật Ánh'),(23,'Thomas L Friedman'),(24,'Jim Collins'),(25,'Paul Kalanithi'),(26,'TS Lê Thẩm Dương'),(27,'Nhiều Tác Giả'),(28,'	Tây Mông'),(29,'Tony Buổi Sáng'),(30,'David J Lieberman'),(31,'Minh Niệm'),(32,'Hà Nhân'),(33,'Minh Long'),(34,'Phạm Duy');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,20),(3,21),(4,22);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartprod`
--

DROP TABLE IF EXISTS `cartprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cartprod` (
  `id_product` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_cart`),
  KEY `id_cart_idx` (`id_cart`),
  CONSTRAINT `id_cart` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id_cart`),
  CONSTRAINT `id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartprod`
--

LOCK TABLES `cartprod` WRITE;
/*!40000 ALTER TABLE `cartprod` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartprod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_prod`
--

DROP TABLE IF EXISTS `category_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category_prod` (
  `id_categoryprod` int(11) NOT NULL AUTO_INCREMENT,
  `name_category` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_categoryprod`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_prod`
--

LOCK TABLES `category_prod` WRITE;
/*!40000 ALTER TABLE `category_prod` DISABLE KEYS */;
INSERT INTO `category_prod` VALUES (2,'Văn học'),(25,'Hồi kí'),(26,'Sách tham khảo'),(27,'Sách giáo khoa'),(32,'Khoa học'),(35,'Kỹ năng sống'),(37,'Trinh thám'),(38,'Tâm lí'),(39,'Khoa học vũ trụ'),(43,'Lịch sử');
/*!40000 ALTER TABLE `category_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  `date_receive` datetime DEFAULT NULL,
  `money` float DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `id_user1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (9,'thanh','5456565','hà nội','2019-12-10 08:46:22',NULL,345.6,20);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci,
  `amount` int(11) NOT NULL,
  `dimension` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `id_author` int(11) DEFAULT NULL,
  `id_publisher` int(11) DEFAULT NULL,
  `id_categoryprod` int(11) NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `id_publisher_idx` (`id_publisher`),
  KEY `id_categoryprod_idx` (`id_categoryprod`),
  KEY `id_author_idx` (`id_author`),
  CONSTRAINT `id_author` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`),
  CONSTRAINT `id_categoryprod` FOREIGN KEY (`id_categoryprod`) REFERENCES `category_prod` (`id_categoryprod`),
  CONSTRAINT `id_publisher` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id_publisher`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (32,' CHƯA MỘT LẦN ĐAU SAO LÀ TUỔI TRẺ','image_195509_1_16509.jpg',92,'TUỔI TRẺ LÀ CHUYẾN HÀNH TRÌNH MỘT CHIỀU  Trên chuyến hành trình này, dù những chuyện bạn gặp phải là nắng dịu gió nhẹ hay bão táp mưa sa, những điều bạn trải qua là thuận buồm xuôi gió hay gập ghềnh trắc trở, thì những trải nghiệm suốt dọc đường đi đều sẽ lưu lại dấu vết trong lòng bạn. Có thể nó sẽ là một dấu ấn tuyệt đẹp, cũng có thể nó lại là một vết thương mãi mãi lưu sẹo.  Cho dù háo hức thoát khỏi vỏ ốc của bản thân đến thế nào đi chăng nữa thì chúng ta của những năm tháng thiếu niên ấy, hành trang mang theo chỉ có lòng dũng cảm, chỉ biết dùng những cách mà chúng ta cho rằng có thể bảo vệ bản thân để đối mặt với những mối nguy cơ ở thế giới bên ngoài. Và trên hành trình này, những nỗi ưu phiền xoay quanh vấn đề học tập, tình bạn, tình yêu, các mối quan hệ trong gia đình, nhà trường và ngoài xã hội thật khó để mở lời giãi bày cùng thầy cô, bố mẹ hay bạn bè, mà chỉ có thể tự mình dò dẫm đi tìm đáp án.  Nếu có thể làm cho bản thân mình trở nên kiên cường và hiểu biết hơn thì những vấp ngã kia có sá gì? Chỉ cần bên cạnh bạn có những đôi tay sẵn sàng chìa ra nâng đỡ, có những bờ vai cho bạn tựa vào, có những cái ôm động viên khích lệ, vậy thì quá trình trưởng thành của bạn vĩnh viễn không hoài phí, mà còn nhận được nhiều hơn. Cuốn sách này gồm 45 câu chuyện về những nỗi ưu phiền thời thanh xuân của bất kì ai trong chúng ta, hãy mang theo nó và lòng can đảm tiến về phía trước để có những trải nghiệm, cảm nhận và tìm ra lời giải cho những nỗi đau đớn mà bạn đang ôm giữ trong lòng…  Đừng lo lắng, bởi vì đó chính là tuổi trẻ.',20,'14.5 x 20.5',360,2019,21,11,35),(33,'7 MẮT BIẾC (TÁI BẢN 2019) - TẶNG KÈM POSTCARD + SỐ TAY (SỐ LƯỢNG CÓ HẠN)','vv1111111.jpg',84.7,'Mắt biếc là một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn Nguyễn Nhật Ánh. Tác phẩm này cũng đã được dịch giả Kato Sakae dịch sang tiếng Nhật để giới thiệu với độc giả Nhật Bản.  “Tôi gửi tình yêu cho mùa hè, nhưng mùa hè không giữ nổi. Mùa hè chỉ biết ra hoa, phượng đỏ sân trường và tiếng ve nỉ non trong lá. Mùa hè ngây ngô, giống như tôi vậy. Nó chẳng làm được những điều tôi ký thác. Nó để Hà Lan đốt tôi, đốt rụi. Trái tim tôi cháy thành tro, rơi vãi trên đường về.”  … Bởi sự trong sáng của một tình cảm, bởi cái kết thúc buồn, rất buồn khi xuyên suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn… ',20,'	13 x 20',300,2019,22,10,2),(34,'THẾ GIỚI PHẲNG - TÓM LƯỢC LỊCH SỬ THẾ GIỚI THẾ KỶ XXI (BẢN CẬP NHẬT VÀ BỔ SUNG HAI CHƯƠNG MỚI NHẤT - 2018)','image_180164_1_43_1_57_1_4_1_2_1_210_1_29_1_98_1_25_1_21_1_5_1_3_1_18_1_18_1_45_1_26_1_32_1_14_1_2216.jpg',244.9,'Trong xu thế toàn cầu hóa, việc tiếp cận và tham khảo những tri thức đương đại từ những nước đã phát triển về sự chuyển động của thế giới (đang ở bước ngoặt từ “tròn” sang “phẳng”, như cách nói của tác giả) có lẽ sẽ giúp chúng ta có thêm những thông tin bổ ích để có sự chủ động trong quá trình hội nhập. Với mục đích cung cấp và cập nhật những thông tin đang là sự kiện dẫn đầu có giá trị tham khảo, Nhà xuất bản Trẻ đã mua bản quyền và nay xin giới thiệu tới bạn đọc bản dịch Việt ngữ của THE WORLD IS FLAT - tác phẩm được xếp vào danh mục sách bán chạy nhất ở Mỹ (kể từ lần xuất bản đầu tiên tháng 4/ 2005 cho đến nay). Đây là bản dịch từ bản sách gốc mới nhất được sửa chữa, cập nhật và bổ sung hai chương mới nhất bởi chính tác giả. Xin trân trọng giới thiệu cùng bạn đọc.',5,'15.5 x 23',750,2019,23,10,43),(35,' TỪ TỐT ĐẾN VĨ ĐẠI - JIM COLLINS (TÁI BẢN 2017)','image_120835.jpg',81.5,'Từ Tốt Đến Vĩ Đại  Jim Collins cùng nhóm nghiên cứu đã miệt mài nghiên cứu những công ty có bước nhảy vọt và bền vững để rút ra những kết luận sát sườn, những yếu tố cần kíp để đưa công ty từ tốt đến vĩ đại. Đó là những yếu tố khả năng lãnh đạo, con người, văn hóa, kỷ luật, công nghệ… Những yếu tố này được nhóm nghiên cứu xem xét tỉ mỉ và kiểm chứng cụ thể qua 11 công ty nhảy vọt lên vĩ đại. Mỗi kết luận của nhóm nghiên cứu đều hữu ích, vượt thời gian, ý nghĩa vô cùng to lớn đối với mọi lãnh đạo và quản lý ở mọi loại hình công ty (từ công ty có nền tảng và xuất phát tốt đến những công ty mới khởi nghiệp), và mọi lĩnh vực ngành nghề. Đây là cuốn sách nên đọc đối với bất kỳ lãnh đạo hay quản lý nào!',150,'14.5 x 20.5',450,2019,24,10,26),(37,'CẢM XÚC LÀ KẺ THÙ SỐ MỘT CỦA THÀNH CÔNG 2 - TẶNG KÈM CHỮ KÝ TÁC GIẢ + SỔ TAY + 2 BƯU THIẾP LỊCH NĂM CANH TÝ 2020 CÓ CHỮ KÝ TẶNG CỦA TS LÊ THẨM DƯƠNG (SỐ LƯỢNG CÓ HẠN)','fffffffffffffff_1_3.jpg',175,'Cảm Xúc Là Kẻ Thù Số Một Của Thành Công 2  Làm thế nào để có nhiều tiền?; Phụ nữ cần được yêu, đàn ông cần được hiểu; Thắng được mình thì hết kẻ thù; Đường đến Thành Công.  Quà Tặng Bao Gồm:  - Sách Kèm Chữ Ký Tác Giả  - Sổ Tay có hình ảnh và trích dẫn một số câu nói của TS Lê Thẩm Dương  - 2 Bưu Thiếp Lịch Năm Canh Tý 2020 có chữ ký tặng của TS Lê Thẩm Dương  (Hà Nội, 22/10/2019) Hiện tượng xuất bản “Cảm xúc là kẻ thù số một của thành công”- cuốn sách được bán nhiều nhất của TS Lê Thẩm Dương - sẽ có phần 2 vào trung tuần tháng 11/2019.  Theo TS Lê Thẩm Dương, “Cảm xúc là kẻ thù số một của thành công 2” sẽ là một cuốn sách đặc biệt. Về nội dung, đây là cuốn sách được ông viết nốt những điều tâm đắc nhưng chưa được xuất hiện trong các cuốn sách trước đây, ví dụ như tài chính cá nhân, quản trị bản thân, khởi nghiệp 4.0, kỹ năng lãnh đạo, kỹ năng giao tiếp, yêu và ghen thế nào cho đúng... Tiếp theo, TS Lê Thẩm Dương quy nạp những kiến thức đã từng viết trong những cuốn sách trước đây thành những bài học rất dễ áp dụng, trong đó có một bài học mà ai cũng muốn biết và thực hành là con đường để đến được THÀNH CÔNG... Về hình thức, đây là cuốn sách đầu tiên có các hình ảnh TS Lê Thẩm Dương được chụp trong studio chuyên nghiệp. Những hình ảnh ông cầm mic mà bạn đọc thường thấy trong các cuốn sách trước đây của ông sẽ không xuất hiện trong cuốn sách này. Theo yêu cầu của đông đảo bạn đọc, số lượng chữ trong mỗi trang sách cũng sẽ ít hơn và được trình bày ấn tượng hơn. Cuốn sách được in màu toàn bộ trên giấy chất lượng cao để đem lại trải nghiệm tốt nhất cho bạn đọc về mặt thị giác. Về kênh phát hành, để bạn đọc không phải mua nhầm sách giả, TS Lê Thẩm Dương chỉ chọn một đơn vị phát hành độc quyền cuốn sách này là hệ thống nhà sách FAHASA và trang thương mại điện tử FAHASA.COM. Với kinh nghiệm và uy tín phát hành sách lâu năm của đối tác này, ông hy vọng bạn đọc sẽ được phục vụ tốt nhất.  Nội dung sách “Cảm xúc là kẻ thù số một của thành công 2” gồm 4 phần chính: Làm thế nào để có nhiều tiền?; Phụ nữ cần được yêu, đàn ông cần được hiểu; Thắng được mình thì hết kẻ thù; Đường đến Thành Công.  Ngoài ra, khách hàng đặt mua sách trong tháng đầu tiên kể từ ngày ra mắt sách tại hệ thống nhà sách của FAHASA và trang thương mại điện tử FAHASA.COM sẽ được tặng 1 cuốn sổ tay có hình ảnh và trích dẫn một số câu nói nổi tiếng của TS Lê Thẩm Dương.  Nhà báo Nguyễn Tuấn Anh – Thư ký Toà soạn báo Sinh Viên Việt Nam, Trưởng ban biên soạn các cuốn sách của TS Lê Thẩm Dương - vẫn là người chấp bút cuốn sách này.  Theo dự kiến, TS Lê Thẩm Dương sẽ có các buổi ký tặng sách cho người hâm mộ tại Hà Nội và TP.HCM sau khi sách được phát hành.  Sách “Cảm xúc là kẻ thù số một của thành công 2” có giá bìa 250.000 đồng, gồm hơn 250 trang ruột màu, bìa cứng, bìa áo, dự kiến được phát hành vào trung tuần tháng 11/2019 tại hệ thống nhà sách FAHASA trên toàn quốc và trang thương mại điện tử FAHASA.COM.',100,'14.5 x 20.5',300,2019,26,1,35),(38,'HẠT GIỐNG TÂM HỒN - TẬP 8 (TÁI BẢN 2016)','image_115809.jpg',31.5,'Trong cuộc sống chúng ta ai cũng có một uớc mơ cho một ngày mai thật đẹp, dù bình dị hay phi thường - đó có thể là ước mơ của một cậu bé mồ côi mong có ngày được chăm sóc trong vòng tay người mẹ, đó là ước mơ rất đỗi giản dị của một chú bé tật nguyền được bước đi bình thường như bao người khác, ước mơ nhìn thấy ánh sáng của một người không còn nhìn thấy được, ước mơ tìm được việc làm mà mình yêu thích của một chàng trai thất nghiệp, ước mơ tìm được một tình yêu đẹp, được sống yên vui hạnh phúc, hoặc có thể là những ước mơ chinh phục, vượt qua những thử thách, vươn lên khẳng định mình và trở thành những gì mà mình từng ao ước. Những ước mơ đáng quý, đáng trân trọng đó luôn là niềm hy vọng, là nguồn động lực và niềm tin lớn nhất cho mỗi người để sống, để cảm nhận và hướng đến ngày mai.  Nhưng cuộc sống luôn tìm ẩn những trở ngại, khó khăn, và thử thách bất ngờ - con đường đi đến những ước mơ ấy không hề bằng phẳng. Bao khó khăn, trở ngại và cả bất hạnh có thể xảy ra vào những lúc không mong chờ nhất như để thử thách lòng dũng cảm của con người. Đó có thể là những trở ngại nhỏ ta vấp phải vào một thời điểm nào đó trước khi tự đứng thẳng trên đôi chân của mình. Có thể nó như những đám mây đen kịt báo hiệu cơn dông, khiến ngay cả những tâm hồn dũng cảm nhất cũng phải tìm kiếm chở che. Cũng có thể do khách quan hay là những ngục tù mà chính ta tự đưa mình vào..... khiến ta tổn thương, mất niềm tin, và có lúc tưởng như không còn điểm tựa hay nghị lực để vượt qua. Trước những khó khăn thử thách ấy, mỗi người sẽ tự chọn cho mình cách đón nhận, đối đầu để có một hướng đi riêng. Có những phó thác cho số phận, có người trốn chạy để tìm nơi trú ẩn, có người tự thay đổi để thích nghi với hoàn cảnh mới, cũng có người chìm vào biển tự thương thân, trách phận để rồi ngã gục trong cơn giông tố cuộc đời.....  Thế nhưng, bất kể là ai, tự đáy lòng của mỗi con người đều tồn tại một khát vọng mãnh liệt - đó chính là khát vọng sống - và được luôn là chính mình. Chính khát vọng ấy đã khiến bao trái tim trăn trở, thao thức tìm cho mình một cách nghĩ, một sức mạnh tinh thần, một hướng đi để theo đuổi những hoài bão, ước mơ của mình.  Cuốn sách \'Những câu chuyện cuộc sống\' sẽ là người bạn đồng hành cùng độc giả vượt qua những khó khăn thử thách trong cuộc sống thường ngày như nỗi mất mát, nỗi đau tổn thương tinh thần, tình cảm, niềm tin, bệnh tật, những thăng trầm trên bước đường theo đuổi ước mơ của cuộc đời hay vươn lên cho cuộc sống tốt đẹp hơn.',50,'20.5 x 13',250,2016,27,3,35),(39,'TRÍ TUỆ LÀM GIÀU CỦA NGƯỜI DO THÁI - TẠI SAO HỌ LẠI GIÀU CÓ VÀ GIỎI ĐẾN VẬY','image_195509_1_16857.jpg',88,'Một nửa số doanh nhân giàu có trên thế giới là người Do Thái, 1/3 số tỷ phú thế giới là người Do Thái, 18 trong 40 người Mỹ có ảnh hưởng nhất theo xếp hạng của Forbes là người Do Thái, trong 200 người nổi tiếng có ảnh hưởng nhất trên thế giời người Do Thái chiếm một nửa, hơn 20% người đoạt giải Nobel là người Do Thái, 1/3 số giáo sư đại học nổi tiếng thế giới, 60% các nhà văn giỏi nhất cũng là người Do Thái...  Tại sao Israel lại giàu có và trù phú đến vậy đến vậy? Tại sao trí tuệ của người Do Thái lại được lưu truyền nhiều thế hệ như di truyền vậy?   Lý giải về sự giàu có của người Do Thái có rất nhiều nguyên nhân như:   1. Người Do Thái thường có quan điểm đúng đắn về tiền bạc.   2. Họ rất giỏi trong quản lý tài chính và tiếp thị.   3. Người Do Thái giỏi nắm bắt bất kỳ cơ hội kinh doanh nào.   4. Người Do Thái tuân thủ hợp đồng và đáng tin cậy.   5. Người Do Thái chú ý đến từ thiện.     Nhưng lý giải về sự xuất sắc của người Do Thái chỉ có một nguyên nhân duy nhất: Người Do Thái rất coi trọng giáo dục và học tập. Do đó, từ thời thơ ấu cha mẹ Do Thái đã chú trọng nuôi dạy con cái, tôn trọng trí tuệ và coi trọng việc nuôi dưỡng tư duy và tài năng của trẻ.      Trí tuệ làm giàu là cuốn sách trình bày các khía cạnh của sự khôn ngoan mà dân tộc Do Thái sở hữu. Hãy cùng suy ngẫm về sự giàu có và trí thông minh của họ. Cuốn sách có thể được coi là tóm lược về các công cụ tích lũy tài sản và các công cụ tư duy được những người Do Thái nổi tiếng toàn cầu như gia tộc Rothschild, Rockefeller, Buffett, Bill Gates và Soros sử dụng hàng bao năm qua.',100,'14.5 x 20.5',450,2019,28,13,35),(40,'TRÊN ĐƯỜNG BĂNG (TÁI BẢN 2017)','trenduongbang.jpg',61.6,'TRÊN ĐƯỜNG BĂNG là cuốn sách tập hợp những bài viết truyền cảm hứng và hướng dẫn kỹ năng cho các bạn trẻ khi chuẩn bị bước vào đời.  Cuốn Trên Đường Băng được chia làm 3 phần: “Chuẩn bị hành trang”, “Trong phòng chờ sân bay” và “Lên máy bay”, tương ứng với những quá trình một bạn trẻ phải trải qua trước khi “cất cánh” trên đường băng cuộc đời, bay vào bầu trời cao rộng.  Xuất phát từ cái tâm trong sáng của người đi trước dày dặn kinh nghiệm, kiến thức, Tony Buổi Sáng mang đến đọc giả những bài viết hài ước, tinh tế, sinh động và đầy thiết thực. Cuốn Trên Đường Băng với những bài viết về thái độ với sự học và kiến thức nói chung, cách ứng phó với những trắc trở thử thách khi đi làm, cách sống hào sảng nghĩa tình văn minh… truyền cảm hứng cho các bạn trẻ sống hết mình, trọn vẹn từng phút giây và sẵn sàng cho hành trang cuộc sống.  Trên Đường Băng của Tony Buổi Sáng tuy hướng đến những đọc giả là những người trẻ nhưng những người lớn hơn vẫn để hiểu hơn, và có cách nhìn nhận cũng như giáo dục con em mình tốt nhất thay vì bảo vệ con quá kĩ trở nên yếu ớt và thiếu tự lập. Và để yêu thương “khoa học” nhất. Đây cũng là cuốn sách mà những người đi làm nên sở hữu để nhìn lại chặng đường mình đã đi qua, suy ngẫm và thay đổi vì chưa bao giờ là quá muộn.  Một cuốn sách với nhiều điều để bạn học hỏi, suy ngẫm và chuẩn bị tốt nhất cho hành trang trên con đường tuổi trẻ của chính mình.',50,'13 x 20',350,2019,29,10,35),(41,'NGUYỄN NHẬT ÁNH VÀ TÔI','nguyen-nhat-anh-va-toi.jpg',54.5,'42 bài viết in trong cuốn sách là những bài viết vào chung khảo trong cuộc thi viết “Nguyễn Nhật Ánh và tôi” do Nhà xuất bản Trẻ tổ chức năm 2013. Những bài viết mộc mạc đầy cảm xúc chân thật, kể về kỷ niệm với những tác phẩm của Nguyễn Nhật Ánh, và với chính nhà văn. Đọc cuốn sách này mới thấy Sách và nhân vật của nhà văn Nguyễn Nhật Ánh đã làm được nhiều điều mà không phải ai cũng biết: nó thay đổi cả số phận người, thay đổi một lối sống, cách suy nghĩ, ngoài việc muôn thuở của sách là “nuôi dưỡng tâm hồn”. Có được điều này quả thật là một hạnh phúc lớn nhà văn của Nguyễn Nhật Ánh.',150,'13 x 20',400,2019,22,10,2),(42,'ĐỌC VỊ BẤT KỲ AI - ĐỂ KHÔNG BỊ LỪA DỐI VÀ LỢI DỤNG (TÁI BẢN 2018)','8936117740374_2.jpg',57.8,'Bạn băn khoăn không biết người ngồi đối diện đang nghĩ gì? Họ có đang nói dối bạn không? Đối tác đang ngồi đối diện với bạn trên bàn đàm phán đang nghĩ gì và nói gì tiếp theo?  ĐỌC người khác là một trong những công cụ quan trọng, có giá trị nhất, giúp ích cho bạn trong mọi khía cạnh của cuộc sống. ĐỌC VỊ người khác để:  Hãy chiếm thế thượng phong trong việc chủ động nhận biết điều cần tìm kiếm - ở bất kỳ ai bằng cách “thâm nhập vào suy nghĩ” của người khác. ĐỌC VỊ BẤT KỲ AI là cẩm nang dạy bạn cách thâm nhập vào tâm trí của người khác để biết điều người ta đang nghĩ. Cuốn sách này sẽ không giúp bạn rút ra các kết luận chung về một ai đó dựa vào cảm tính hay sự võ đoán. Những nguyên tắc được chia sẻ trong cuốn sách này không đơn thuần là những lý thuyết hay mẹo vặt chỉ đúng trong một số trường hợp hoặc với những đối tượng nhất định. Các kết quả nghiên cứu trong cuốn sách này được đưa ra dựa trên phương pháp S.N.A.P - cách thức phân tích và tìm hiểu tính cách một cách bài bản trong phạm vi cho phép mà không làm mếch lòng đối tượng được phân tích. Phương pháp này dựa trên những phân tích về tâm lý, chứ không chỉ đơn thuần dựa trên ngôn ngữ cử chỉ, trực giác hay võ đoán.  Cuốn sách được chia làm hai phần và 15 chương:  Phần 1: Bảy câu hỏi cơ bản: Học cách phát hiện ra điều người khác nghĩ hay cảm nhận một cách dễ dàng và nhanh chóng trong bất kỳ hoàn cảnh nào.  Phần 2: Những kế hoạch chi tiết cho hoạt động trí óc - hiểu được quá trình ra quyết định. Vượt ra ngoài việc đọc các suy nghĩ và cảm giác đơn thuần: Hãy học cách người khác suy nghĩ để có thể nắm bắt bất kỳ ai, phán đoán hành xử và hiểu được họ còn hơn chính bản thân họ.  Trích đoạn sách hay:  Một giám đốc phụ trách bán hàng nghi ngờ một trong những nhân viên kinh doanh của mình đang biển thủ công quỹ. Nếu hỏi trực tiếp “Có phải cô đang lấy trộm đồ của công ty?” sẽ khiến người bị nghi ngờ phòng bị ngay lập tức, việc muốn tìm ra chân tướng sự việc càng trở nên khó khăn hơn. Nếu cô ta không làm việc đó, dĩ nhiên cô ta sẽ nói với người giám đốc mình không lấy trộm. Ngược lại, dù có lấy trộm đi chăng nữa, cô ta cũng sẽ nói dối mình không hề làm vậy. Thay vào việc hỏi trực diện, người giám đốc khôn ngoan nên nói một điều gì đó tưởng chừng vô hại, như “Jill, không biết cô có giúp được tôi việc này không. Có vẻ như dạo này có người trong phòng đang lấy đồ của công ty về nhà phục vụ cho tư lợi cá nhân. Cô có hướng giải quyết nào cho việc này không?” rồi bình tĩnh quan sát phản ứng của người nhân viên.  Nếu cô ta hỏi lại và có vẻ hứng thú với đề tài này, anh ta có thể tạm an tâm rằng cô ta không lấy trộm, còn nếu cô ta đột nhiên trở nên không thoải mái và tìm cách thay đổi đề tài thì rõ ràng cô ta có động cơ không trong sáng.  Người giám đốc khi đó sẽ nhận ra sự chuyển hướng đột ngột trong thái độ và hành vi của người nhân viên. Nếu cô gái đó hoàn toàn trong sạch, có lẽ cô ta sẽ đưa ra hướng giải quyết của mình và vui vẻ khi sếp hỏi ý kiến của mình. Ngược lại, cô ta sẽ có biểu hiện không thoải mái rõ ràng và có lẽ sẽ cố cam đoan với sếp rằng cô không đời nào làm việc như vậy. Không có lí do gì để cô ta phải thanh minh như vậy, trừ phi cô là người có cảm giác tội lỗi…',400,'20.5 x 13',240,2018,30,14,35),(43,'ĐỌC ĐỂ TRƯỞNG THÀNH - TUYỂN CHỌN NHỮNG CUỐN SÁCH HAY DÀNH CHO BẠN TRẺ (HỘP 5 CUỐN) - TẶNG KÈM SỔ ĐỘC QUYỀN FAHASA (SỐ LƯỢNG CÓ HẠN)','8936067601794-qt_1.jpg',345.6,'Thế giới này không đợi bạn trưởng thành, cũng chẳng có ai trưởng thành thay bạn , bạn chỉ có thể vượt qua gian khổ, tự nỗ lực để trưởng thành . Không lãng phí một phút giây nào để trưởng thành, thì thành công sẽ không còn xa nữa . Mời các độc giả tìm đọc 5 cuốn sách giúp bản thân trở nên hoàn thiện và nổi bật trước đám đông nhé   1 . Khi bạn đang mơ thì người khác đang nỗ lực 2 . Mỗi lần vấp ngã là một lần trưởng thành 3 . Đại học không lạc hướng 4 . Hài hước một chút , thế giới sẽ khác đi  5 . Nói thế nào để được chào đón làm thế nào để được ghi nhận',100,'14.5 x 20.5',300,2019,27,15,35),(44,'HIỂU VỀ TRÁI TIM (TÁI BẢN 2019)','image_195509_1_14922.jpg',110.4,'“Hiểu về trái tim” là một cuốn sách đặc biệt được viết bởi thiền sư Minh Niệm. Với phong thái và lối hành văn gần gũi với những sinh hoạt của người Việt, thầy Minh Niệm đã thật sự thổi hồn Việt vào cuốn sách nhỏ này.  Xuất bản lần đầu tiên vào năm 2011, Hiểu Về Trái Tim trình làng cũng lúc với kỷ lục: cuốn sách có số lượng in lần đầu lớn nhất: 100.000 bản. Trung tâm sách kỷ lục Việt Nam công nhận kỳ tích ấy nhưng đến nay, con số phát hành của Hiểu về trái tim vẫn chưa có dấu hiệu chậm lại.  Là tác phẩm đầu tay của nhà sư Minh Niệm, người sáng lập dòng thiền hiểu biết (Understanding Meditation), kết hợp giữa tư tưởng Phật giáo Đại thừa và Thiền nguyên thủy Vipassana, nhưng Hiểu Về Trái Tim không phải tác phẩm thuyết giáo về Phật pháp. Cuốn sách rất “đời” với những ưu tư của một người tu nhìn về cõi thế. Ở đó, có hạnh phúc, có đau khổ, có tình yêu, có cô đơn, có tuyệt vọng, có lười biếng, có yếu đuối, có buông xả… Nhưng, tất cả những hỉ nộ ái ố ấy đều được khoác lên tấm áo mới, một tấm áo tinh khiết và xuyên suốt, khiến người đọc khi nhìn vào, đều thấy mọi sự như nhẹ nhàng hơn…  Trong dòng chảy tất bật của cuộc sống, có bao giờ chúng ta dừng lại và tự hỏi: Tại sao ta giận? Tại sao ta buồn? Tại sao ta hạnh phúc? Tại sao ta cô đơn?... Tất cả những hiện tượng tâm lý ấy không ngừng biến hóa trong ta và tác động lên đời sống của ta, nhưng ta lại biết rất ít về nguồn gốc và sự vận hành của nó. Chỉ cần một cơn giận, hay một ý niệm nghi ngờ, cũng có thể quét sạch năng lượng bình yên trong ta và khiến ta nhìn mọi thứ đều sai lệch. Từ thất bại này đến đổ vỡ khác mà ta không lý giải nổi, chỉ biết dùng ý chí để tự nhắc nhở mình cố gắng tiến bộ hơn. Cho nên, hiểu về trái tim chính là nhu cầu căn bản nhất của con người.  Hiểu về trái tim là thái độ trở về tiếp nhận và làm mới lại tâm hồn mình. Bởi hiểu được chính mình, ta sẽ dễ dàng hiểu được người khác, để ta có thể thương nhau chân thật.  Xuyên suốt cuốn sách, tác giả đã đưa ra 50 khái niệm trong cuộc sống, 50 bài viết tâm lý trị liệu, được trình bày rất chân phương, dễ hiểu, thực tế,  vốn dĩ rất đời thường nhưng nếu suy ngẫm một chút chúng ta sẽ thấy thật sâu sắc như Khổ đau, Hạnh phúc, Tình yêu, Tức giận, Ghen tuông, Ích kỷ, Tham vọng, Thành thật, Nghi ngờ, Lo lắng, Do dự, Buông xả, Thảnh thơi, Bình yên, Cô đơn, Ái ngữ, Lắng nghe… Đúng như tựa đề sách, sách sẽ giúp ta hiểu về trái tim, hiểu về những tâm trạng, tính cách sâu thẳm trong trái tim ta.  Lúc sinh thời cố Giáo sư, Tiến sĩ Trần Văn Khuê, có dịp tiếp cận với Hiểu Về Trái Tim. Ông nhận xét, như một cuốn sách đầu tiên thuộc chủ đề Hạt Giống Tâm Hồn do một tác giả Việt Nam viết, cuốn sách sẽ giúp người đọc hiểu được cảm xúc của tâm hồn, trái tim của chính mình và của người khác. Để, tận cùng là loại bỏ nỗi buồn, tổn thương và tìm được hạnh phúc trong cuộc sống. Có lẽ, vì điều này mà hơn 10 năm qua, Hiểu về trái tim vẫn là cuốn sách liên tục được tái bản và chưa có dấu hiệu “hạ nhiệt”, nhiều năm trời liên tục nằm trong top sách bán chạy nhất tại Việt Nam.  Đáng quý hơn, tòan bộ lợi nhuận thu được từ việc phát hành cuốn sách này đều được chuyển về quỹ từ thiện cùng tên “Hiểu về trái tim” để giúp đỡ trẻ em có hoàn cảnh khó khăn, bất hạnh tại Việt Nam. Và đây cũng chính là niềm hạnh phúc cũng như ý nghĩa nhân ái lớn nhất mà cuốn sách đã mang lại, đặc biệt là khi tất cả hành trình này còn có sự đồng hành và góp sức của hàng trăm nghìn bản đọc trên khắp cả nước Việt Nam.  Người nổi tiếng nói về cuốn sách:  “Để chữa lành những tổn thương và nổi đau, cách tốt nhứt và hữu hiệu nhất là cần hiểu rõ được trái tim, tâm hồn của mình, và của người khác, cuốn sách Hiểu về Trái Tim chính là cuốn sách giúp bạn đọc làm được điều đó: Hiểu rõ và chữa lành trái tim, tâm hồn của mình và của những người xung quanh, để mọi người cùng được sống trong hạnh phúc và yêu thương. Với cuốn sách này, chúc bạn đọc sẽ luôn hạnh phúc và không bao giờ phải sống với một trái tim tan vỡ hay một tâm hồn tổn thương”  - Giáo sư – Tiến sĩ Trần Văn Khê  \"Cuốn sách Hiểu về trái tim được viết ra với những trải nghiệm sâu sắc, nhằm giúp con người hiểu rõ và lý giải những cảm xúc của chính mình để tìm được sự bình an và hạnh phúc thật sự”. - Anh hùng Lao động, Thầy thuốc nhân dân, GS Bác sĩ Nguyễn Thị Ngọc Phượng  \"Đây chính là con đường của đạo Tâm, với những nguyên tắc sống hạnh phúc – một thứ “an lạc hạnh” – từ những sẻ chia chân thành của tác giả. Con đường hạnh phúc đó đòi hỏi sự khổ luyện, chứng nghiệm qua quán chiếu bản thân, từ đó thấy biết bản chất của khổ đau, phiền não, và, vượt thoát…” - Bác sĩ Đỗ Hồng Ngọc. Nguyên Giám Đốc Trung Tâm Truyền Thông – Giáo Dục Sức Khoẻ TP.HCM  \"Một cuốn sách hay, thực tế và rất hữu ích cho mọi người, đặc biệt đối với thanh thiếu niên và các bạn trẻ. Nếu rèn luyện được theo những điều hay như thế thì cuộc sống sẽ tốt đẹp hơn rất nhiều\". - Tạ Bích Loan, Trưởng Ban Thanh thiếu niên Đài truyền hình Việt Nam  \"Đây là một cuốn sách đặc biệt, có tính giáo dục, tự nhận thức cao, được viết từ trái tim để chữa lành những trái tim. Một cuốn sách rất ý nghĩa!”. - Nhà báo Trần Tử Văn, Phó Tổng biên tập Báo Công an TP.HCM  \"Hiểu về trái tim là cuốn sách thứ 180 của Tủ sách Hạt giống tâm hồn mà First News đã xuất bản, nhưng đây là cuốn sách của một tác giả Việt Nam đã để lại trong tôi những cảm xúc đặc biệt nhất. Với những trải nghiệm sâu sắc và tâm huyết mà tác giả đã viết trong 8 năm chắc chắn sẽ mang đến cho bạn đọc những khám phá mới mẻ và thú vị. Một cánh cửa rộng mở đang chờ đón bạn”. - Nguyễn Văn Phước, Giám đốc First News - Trí Việt  Báo chí nói gì về “Hiểu về trái tim”:  “\'Hiểu về trái tim\' là một cuốn sách đặc biệt, được viết nên từ tâm huyết của một nhà thiền sư mang tên Minh Niệm. Đã bao giờ giữa cuộc đời hối hả, bạn chợt dừng lại và tự hỏi mình rằng \' hạnh phúc là gì?\' , \'\' khổ đau là gì?\' hay chưa? Vâng, cuốn sách này sẽ giải đáp cho bạn tất cả những băn khoăn đó.” – baomoi.vn  Về tác giả:  Sinh tại Châu Thành, Tiền Giang, xuất gia tại Phật Học Viện Huệ Nghiêm – Sài Gòn, Minh Niệm từng thọ giáo thiền sư Thích Nhất Hạnh tại Pháp và thiền sư Tejaniya tại Mỹ. Kết quả sau quá trình tu tập, lĩnh hội kiến thức… Ông quyết định chọn con đường hướng dẫn thiền và khai triển tâm lý trị liệu cho giới trẻ làm Phật sự của mình. Tiếp cận với nhiều người trẻ, lắng nghe thế giới quan của họ và quan sát những đổi thay trong đời sống hiện đại, ông phát hiện có rất nhiều vấn đề của cuộc sống. Nhưng, tất cả, chỉ xuất phát từ một nguyên nhân: Chúng ta chưa hiểu, và chưa hiểu đúng về trái tim mình là chưa cơ chế vận động của những hỉ, nộ, ái, ố trong mỗi con người.  “Tôi đã từng quyết lòng ra đi tìm hạnh phúc chân thật. Dù thời điểm ấy, ý niệm về hạnh phúc chân thật trong tôi rất mơ hồ nhưng tôi vẫn tin rằng nó có thật và luôn hiện hữu trong thực tại. Hơn mười năm sau, tôi mới thấy con đường. Và cũng chừng ấy năm nữa, tôi mới tự tin đặt bút viết về những điều mình đã khám phá và trải nghiệm…”, tác giả chia sẻ.',100,'13 x 20.5',500,2019,31,3,35),(45,'CÀ PHÊ CÙNG TONY (TÁI BẢN 2017)','ca_phe_cung_tony_tai_ban_2017_1_2018_11_16_11_02_35.jfif',63,'Cà Phê Cùng Tony  Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi Sáng. Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của chính mình hay bạn bè mình trong đó: Từ chuyện lớn như định vị bản thân giữa bạn bè quốc tế, cho đến chuyện nhỏ như nên chú ý những phép tắc xã giao thông thường.  Chúng tôi tin rằng những người trẻ tuổi luôn mang trong mình khát khao vươn lên và tấm lòng hướng thiện, và có nhiều cách để động viên họ biến điều đó thành hành động. Nếu như tập sách nhỏ này có thể khơi gợi trong lòng bạn đọc trẻ một cảm hứng tốt đẹp, như tách cà phê thơm vào đầu ngày nắng mới, thì đó là niềm vui lớn của tác giả Tony Buổi Sáng.  Tony Buổi Sáng cũng là tác giả của Trên đường băng, tác phẩm hiện đã bán hơn 200.000 bản.  ***  Trích đoạn:  ... Thật ra Tony hiểu vì sao các bác giáo sư tiến sĩ soạn sách đã phải đưa vào nhiều nội dung như vậy. Rất là tâm huyết và đáng trân trọng. Vì ngày xưa, kiến thức rất khó tìm. Nhiều điều hữu ích chỉ nằm trong sách, trong thư viện các thành phố lớn, các trường các viện đại học lớn và người ta phải nhớ mọi thứ, nên phải cộng điểm cho học sinh nông thôn vì ít cơ hội tiếp cận kiến thức. Nhưng, bây giờ kiến thức nằm hết trên mạng, trong file máy tính, truy cập là ra ngay, nên các nước đã phải thay đổi chương trình học phổ thông sau khi máy tính và internet ra đời. Học sinh chỉ cần nhớ những gì cốt lõi, và PHƯƠNG PHÁP tìm kiếm tài liệu. Vì chữ nghĩa rồi cũng sẽ rụng rơi theo thời gian, kiến thức mới lại bổ sung liên tục, nên phương pháp tìm kiếm thông tin tốt sẽ giúp ích cho các bạn trong cuộc sống sau này. Làm ngành nghề gì cũng phải cập nhật cái mới...',1000,'13 x 20',240,2017,29,10,2),(46,'BAY XUYÊN NHỮNG TẦNG MÂY','bayxuyennhungtangmay.jpg',47.7,'Bay Xuyên Những Tầng Mây Bay Xuyên Qua Những Tầng Mây là một trong bộ ba cuốn tập hợp những bài viết hay nhất được tuyển chọn trong gần 500 bài được viết suốt 8 năm của chuyên mục \"Trò chuyện đầu tuần\" trên báo Hoa Học Trò của tác giả Hà Nhân. Anh chính là nhà báo Lê Thanh Hà, phó Tổng biên tập báo Hoa Học Trò, Sinh viên Việt Nam.  Bộ sách gồm 3 tập:  Tập 1: Ngày trong sương mù  Tập 2: Bay xuyên những tầng mây  Tập 3: Sống như cây rừng  Những bài viết trong 3 tập sách này đôi khi đề cập đến những chủ đề rất quen, đôi khi lại nói về những vấn đề thời sự vừa xảy ra trong cuộc sống nhưng được thể hiện dưới một góc suy tưởng khác, và được chuyển tải bằng những ngôn từ thú vị và chân thành của tác giả Hà Nhân, đã trở thành nguồn cảm hứng động viên các bạn trẻ ấp ủ giấc mơ, lên kế hoạch để từng bước hoàn thiện mình trong hiện tại và tích luỹ sức bật đón đợi tương lai đang chờ phía trước.  8 năm qua, các bài viết trong chuyên mục \"Trò chuyện đầu tuần\" của Hà Nhân đã trở thành người bạn gần gũi cùng đi qua những tháng ngày trẻ dại của giới học trò, cùng sẻ chia, gợi hướng cho các bạn về biết bao điều chưa biết và được các bạn hào hứng đón đợi hàng tuần.  Trích đoạn  Trong mỗi chú bé đều âm ỉ giấc mơ bay lên… Nhưng khi lớn lên, đôi khi những tầng mây thâm thấp thôi cũng khiến ta như bị che khuất tầm nhìn. Tệ hơn, những tầng mây sũng nước thậm chí có thể che khuất cả những giấc mơ, đè nén khát vọng của mỗi người. Một ngày mây mù có thể khiến ta yếu ớt bi lụy. Một chút thất bại cũng giống như mây mù kéo đến, có thể làm em rút vào tổ kén u uất, bi quan. Ai đó nói rằng cách tốt nhất để hóa giải khó khăn là đi xuyên qua nó. Đi xuyên qua mây mù bằng giấc mơ phi công giữ gìn từ thơ bé. Đi qua gian khó bằng lòng lạc quan. Đi xuyên qua u mê bằng khao khát hướng đến trí tuệ, thông sáng. Đi xuyên qua thất bại bằng sự điềm đạm, trưởng thành…',10,'13 x 20',240,2016,32,15,2),(47,'SỐNG NHƯ CÂY RỪNG','songnhucayrung_1.jpg',46.5,'Sống Như Cây Rừng Sống Như Cây Rừng là một trong bộ ba cuốn tập hợp những bài viết hay nhất được tuyển chọn trong gần 500 bài được viết suốt 8 năm của chuyên mục \"Trò chuyện đầu tuần\" trên báo Hoa Học Trò của tác giả Hà Nhân. Anh chính là nhà báo Lê Thanh Hà, phó Tổng biên tập báo Hoa Học Trò, Sinh viên Việt Nam.  Bộ sách gồm 3 tập:  Tập 1: Ngày trong sương mù  Tập 2: Bay xuyên những tầng mây  Tập 3: Sống như cây rừng  Những bài viết trong 3 tập sách này đôi khi đề cập đến những chủ đề rất quen, đôi khi lại nói về những vấn đề thời sự vừa xảy ra trong cuộc sống nhưng được thể hiện dưới một góc suy tưởng khác, và được chuyển tải bằng những ngôn từ thú vị và chân thành của tác giả Hà Nhân, đã trở thành nguồn cảm hứng động viên các bạn trẻ ấp ủ giấc mơ, lên kế hoạch để từng bước hoàn thiện mình trong hiện tại và tích luỹ sức bật đón đợi tương lai đang chờ phía trước.  8 năm qua, các bài viết trong chuyên mục \"Trò chuyện đầu tuần\" của Hà Nhân đã trở thành người bạn gần gũi cùng đi qua những tháng ngày trẻ dại của giới học trò, cùng sẻ chia, gợi hướng cho các bạn về biết bao điều chưa biết và được các bạn hào hứng đón đợi hàng tuần.  Trích đoạn  Trong mỗi chú bé đều âm ỉ giấc mơ bay lên… Nhưng khi lớn lên, đôi khi những tầng mây thâm thấp thôi cũng khiến ta như bị che khuất tầm nhìn. Tệ hơn, những tầng mây sũng nước thậm chí có thể che khuất cả những giấc mơ, đè nén khát vọng của mỗi người. Một ngày mây mù có thể khiến ta yếu ớt bi lụy. Một chút thất bại cũng giống như mây mù kéo đến, có thể làm em rút vào tổ kén u uất, bi quan. Ai đó nói rằng cách tốt nhất để hóa giải khó khăn là đi xuyên qua nó. Đi xuyên qua mây mù bằng giấc mơ phi công giữ gìn từ thơ bé. Đi qua gian khó bằng lòng lạc quan. Đi xuyên qua u mê bằng khao khát hướng đến trí tuệ, thông sáng. Đi xuyên qua thất bại bằng sự điềm đạm, trưởng thành…',50,'13 x 20',249,2016,32,15,2),(48,'HÀI HƯỚC MỘT CHÚT THẾ GIỚI SẼ KHÁC ĐI','8936067596632_1.jpg',43.2,'Cuộc đời này không thể thiếu sự hài hước, hài hước cũng là một nét đẹp, một gia vị khiến cuộc sống thú vị hơn. Hầu như không ai là không thích hài hước, dí dỏm, hơn nữa hài hước còn gắn bó mật thiết với sự thành bại của cuộc đời mỗi người.  Trong cuộc sống gia đình, hài hước có thể  khiến các thành viên trong gia đình hòa thuận và hạnh phúc hơn. Sự dí dỏm có thể hòa giải được rất nhiều mâu thuẫn và tranh cãi giữa vợ chồng, giải tỏa những hiểu lầm, bất đồng hay xóa nhòa khoảng cách, thắt chặt tình cảm cả gia đình sống trong không khí đầm ấm.  Trong giao tiếp xã hội, hài hước giúp chúng ta thiết lập được mạng lưới quan hệ rộng rãi. Người hài hước thường là những người tràn đầy nhiệt huyết với cuộc sống, với thế giới. Có ai lại nỡ từ chối giao tiếp với những người như vậy cơ chứ?  Hài hước có thể giúp bạn tự tạo ra môi trường thuận lợi “như cá gặp nước” trong các hoạt động xã giao. Hài hước không chỉ có lợi cho việc đàm phán mà còn như một cánh tay tiếp them sức mạnh cho công việc của bạn, giúp bạn nhanh chóng đạt được thành công, chuyển bại thành thắng.  Hài hước một chút, thế giới sẽ khác đi – cuốn sách với nội dung phong phú mà sâu sắc này sẽ giúp các bạn có được cái nhìn rõ nét hơn về tầm quan trọng của tính hài hước dưới các góc độ, phương diện đánh giá khác nhau, cũng như có thêm những kĩ năng vận dụng sự hài hước vào trong cuộc sống. Hi vọng sau khi đọc xong cuốn sách này, bạn có thể biến mình thành một người biết nói chuyện, khéo léo vận dụng những ngôn từ hài hước, “gãi đúng chỗ ngứa” của đối phương để mở ra con đường dẫn tới thành công, được mọi người yêu mến.  Biết cách hài hước đúng mực sẽ giúp bạn thành công. Hãy cùng tìm hiểu  về nghệ thuật hài hước! Nó có thể giúp bạn đạt được những thành tựu rực rỡ cũng như nắm được bí quyết sử dụng thời gian một cách hữu hiệu trên  đường đời.',50,'14.5 x 20.5',228,2016,33,1,38),(49,'Chính trị','8935235213746.jpg',52.5,'Cuộc đời này không thể thiếu sự hài hước, hài hước cũng là một nét đẹp, một gia vị khiến cuộc sống thú vị hơn. Hầu như không ai là không thích hài hước, dí dỏm, hơn nữa hài hước còn gắn bó mật thiết với sự thành bại của cuộc đời mỗi người.  Trong cuộc sống gia đình, hài hước có thể  khiến các thành viên trong gia đình hòa thuận và hạnh phúc hơn. Sự dí dỏm có thể hòa giải được rất nhiều mâu thuẫn và tranh cãi giữa vợ chồng, giải tỏa những hiểu lầm, bất đồng hay xóa nhòa khoảng cách, thắt chặt tình cảm cả gia đình sống trong không khí đầm ấm.  Trong giao tiếp xã hội, hài hước giúp chúng ta thiết lập được mạng lưới quan hệ rộng rãi. Người hài hước thường là những người tràn đầy nhiệt huyết với cuộc sống, với thế giới. Có ai lại nỡ từ chối giao tiếp với những người như vậy cơ chứ?  Hài hước có thể giúp bạn tự tạo ra môi trường thuận lợi “như cá gặp nước” trong các hoạt động xã giao. Hài hước không chỉ có lợi cho việc đàm phán mà còn như một cánh tay tiếp them sức mạnh cho công việc của bạn, giúp bạn nhanh chóng đ',100,'14.5 x 20.5',360,2019,34,1,2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `publisher` (
  `id_publisher` int(11) NOT NULL AUTO_INCREMENT,
  `name_publisher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_publisher`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'NXB Thanh Niên'),(2,'NXB Hồng Đức'),(3,'	NXB Tổng Hợp TP.HCM'),(4,'Văn Hoá Thông Tin'),(5,'NXB Lao Động - Xã Hội'),(9,'NXB Hội Nhà Văn'),(10,'NXB Trẻ'),(11,'	NXB Phụ Nữ'),(12,'NXB Lao Động'),(13,'NXB Dân Trí'),(14,'Đại Học Kinh Tế Quốc Dân'),(15,'	NXB Văn Học');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (20,'hihi','4e4d6c332b6fe62a63afe56171fd3725','thanhpv3380@gmail.com','1999-12-11','hanoi','0386577672',2),(21,'admin','21232f297a57a5a743894a0e4a801fc3','kgjkdfjg@gmail.com','2019-12-09','ninhbinh','6658932966',1),(22,'thongdeptrai123','202cb962ac59075b964b07152d234b70','obirin3010@gmail.com','1999-09-11','bla','151313215135',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-10 12:03:49
