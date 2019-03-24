-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 24, 2019 lúc 04:20 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_vnshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` double NOT NULL,
  `payment` varchar(500) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`bill_id`, `user_id`, `total`, `payment`, `address`, `date`) VALUES
(8, 5, 3461, 'Bank transfer', '180 cao lo ', '2019-03-24 04:18:23'),
(9, 5, 1981, 'Bank transfer', '301 su van hanh', '2019-03-24 04:18:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

CREATE TABLE `billdetail` (
  `bill_detail_id` int(20) NOT NULL,
  `bill_id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `billdetail`
--

INSERT INTO `billdetail` (`bill_detail_id`, `bill_id`, `product_id`, `price`, `quantity`) VALUES
(1, 0, 1, 1500, 1),
(2, 0, 2, 1700, 1),
(3, 0, 2, 1700, 1),
(4, 0, 12, 1759, 1),
(5, 0, 12, 1759, 1),
(6, 0, 29, 220, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Converse'),
(4, 'Vans'),
(5, 'Puma'),
(7, 'Gucci');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(500) NOT NULL,
  `product_image` varchar(500) NOT NULL,
  `product_price` double NOT NULL,
  `product_description` varchar(1000) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_image`, `product_price`, `product_description`, `categoryID`) VALUES
(1, ' Nike Lunar Skyelux', 'https://salt.tikicdn.com/cache/w1200/ts/product/cd/d1/54/858a1dd123403cb8f286211298b7b40a.jpg', 1500, 'Giày Chạy Bộ Nam Nike Lunar Skyelux 855808-600 - Cam - Hàng Chính Hãng trọng lượng nhẹ cho việc chạy bộ thoải mái đối với cả buổi tập luyện chạy nhanh và chạy quãng dài hơn.\r\nChất liệu bề mặt vải dệt nhẹ nhàng, mềm mại và thoáng khí.\r\nMũi giày đầy đặn, form dáng chuẩn giúp bảo vệ đầu ngón chân khi hoạt động.\r\nCó lớp lót đệm bên trong êm ái, di chuyển nhiều không bị đau chân.\r\nCổ giày thiết kế đơn giản, vừa vặn giúp bạn di chuyển dễ dàng, thoải mái.\r\nĐế bằng chất liệu cao su êm ái, độ bám tốt, chống trơn trượt.', 1),
(2, 'Nike Ck Racer', 'https://salt.tikicdn.com/cache/w1200/ts/product/51/25/ba/d6c23236a9fd3698f4c45696fd7e85b6.jpg', 1700, 'Giày Thể Thao Nam Nike Ck Racer 916780-002 - Xám Đỏ - Hàng Chính Hãng kiểu dáng năng động, trẻ trung thích hợp mang khi chơi thể thao, du lịch, đi học và đi làm.\r\nChất liệu bề mặt vải dệt nhẹ nhàng, mềm mại và thoáng khí.\r\nMũi giày đầy đặn, form dáng chuẩn giúp bảo vệ đầu ngón chân khi hoạt động.\r\nCó lớp lót đệm bên trong êm ái, bạn sẽ không bị đau chân khi di chuyển nhiều.\r\nCổ giày thiết kế đơn giản, vừa vặn giúp di chuyển dễ dàng, thoải mái.\r\nĐế bằng chất liệu cao su êm ái, độ bám tốt, chống trơn trượt.', 1),
(3, 'Nike Roshe One', 'https://salt.tikicdn.com/cache/w1200/ts/product/60/e3/cc/991bea944c80651a775189cb126ef50b.jpg', 1200, 'Giày Thể Thao Nam Nike Roshe One Hyperfuse BR GPX 859526-400 Màu Xanh Dương - Hàng Chính Hãng được sản xuất từ chất liệu tổng hợp và vải thể thao chuyên dụng kết hợp với các công nghệ tiên tiến, hỗ trợ tối ưu mọi vận động.\r\nLớp lót trong có đệm êm ái kết hợp với công nghệ thoáng khí Air Cooled Memory Foam vừa ngăn mùi, vừa không gây bí chân.\r\nĐế cao su nhẹ bền có độ đàn hồi tốt giúp giảm tối đa chấn thương khi bạn tập luyện hoặc chơi thể thao.', 1),
(10, ' Adidas CF Lite Racer', 'https://salt.tikicdn.com/cache/w1200/ts/product/91/c6/ea/4bb4e50dc8d3338ac5c02dd516b3aed1.jpg', 1679, 'Giày Sneaker Nam Adidas CF Lite Racer DB0592 - Đen là một trong những thiết kế rất được ưa chuộng bởi tính tiện dụng, thiết kế thời trang phong cách trẻ trung, năng động cùng chất liệu cao cấp mang lại sự thoải mái khi di chuyển.\r\nLớp đệm mây cloudfoam cung cấp khả năng hấp thụ sốc khi tác động, cùng lớp lưới phía trên tạo sự thông thoáng cho đôi chân của bạn.\r\nKết cấu nén khí làm chân tiếp đất “êm” hơn, kiểu dáng nổi bật để nhận diện với 3 đường sọc song song.\r\nPhần trên của giày luôn ôm sát vào chân bạn, giữ chân không bị xộc xệch, chống sốc và cân bằng.\r\nLớp đệm mây giảm trọng lượng giày và mang lại cảm giác cực êm, nhẹ tênh như đi trên mây.\r\nBộ đế bằng cao su nhấn nhá và sẻ rãnh để tăng cường ma sát.\r\nĐường may vô cùng tỉ mỉ, chắc chắn giúp bạn hoàn toàn an tâm về chất lượng sản phẩm.\r\nMàu sắc trang nhã, phong cách hiện đại sẽ góp phần khẳng định phong cách thời trang của bạn.', 2),
(11, ' Adidas Questar BYD ', 'https://salt.tikicdn.com/cache/w1200/ts/product/7e/c2/cd/0c5e51b737ede73843cf3d4a8c572005.jpg', 1929, 'Giày Sneaker Nam Adidas Questar BYD DB1539 - Trắng Xám thuộc series thiết kế hoàn toàn mới của brand adidas NEO, mặt giày làm bằng vải thoáng thoát khí dệt 2 lớp. Logo adidas in cách điệu trên thân giày.\r\nPull-tab sau gót chân và lưỡi gà (giúp trang trí và mang giày một cách nhanh chóng bằng cách đưa ngón tay vào 2 pulltab, kéo căng ra để xỏ chân vào, mất chưa đến 3 giây).\r\nMiếng nhựa gắn tại gót chân bằng TPU giúp ổn định gót chân.\r\nLót giày sockliner OrthoLite thoáng khí, chống hôi chân và tăng cường sự linh hoạt khi vận động.\r\nBộ đệm Cloudfoam cho bước chi chuyển thoải mái, nhẹ, êm.\r\nBộ đế bằng cao su nhấn nhá và sẻ rãnh để tăng cường ma sát.\r\nĐường may tỉ mỉ, chắc chắn. Không gây cảm giác đau chân khi mang lâu.\r\nMàu sắc trang nhã, trẻ trung. Dễ dàng kết hợp cùng nhiều phong cách khác nhau.', 2),
(12, 'Adidas Ultimafusion', 'https://salt.tikicdn.com/cache/w1200/ts/product/ab/9e/62/b58646901549f5f7aee820c4e90377f1.jpg', 1759, 'Giày Sneaker Nữ Adidas Ultimafusion B96470 - Đen là một trong những thiết kế rất được ưa chuộng bởi tính tiện dụng, thiết kế thời trang phong cách trẻ trung, năng động cùng chất liệu cao cấp mang lại sự thoải mái khi di chuyển.\r\nLớp đệm mây cloudfoam cung cấp khả năng hấp thụ sốc khi tác động, cùng lớp lưới phía trên tạo sự thông thoáng cho đôi chân của bạn.\r\nKết cấu nén khí làm chân tiếp đất “êm” hơn, kiểu dáng nổi bật để nhận diện với 3 đường sọc song song.\r\nPhần trên của giày luôn ôm sát vào chân bạn, giữ chân không bị xộc xệch, chống sốc và cân bằng.\r\nLớp đệm mây giảm trọng lượng giày và mang lại cảm giác cực êm, nhẹ tênh như đi trên mây.\r\nBộ đế bằng cao su nhấn nhá và sẻ rãnh để tăng cường ma sát.\r\nĐường may vô cùng tỉ mỉ, chắc chắn giúp bạn hoàn toàn an tâm về chất lượng sản phẩm.\r\nMàu sắc trang nhã, phong cách hiện đại sẽ góp phần khẳng định phong cách thời trang của bạn.', 2),
(21, 'Adidas Ultimafusion', 'https://salt.tikicdn.com/cache/w1200/ts/product/ab/9e/62/b58646901549f5f7aee820c4e90377f1.jpg', 175, 'Giày Sneaker Nữ Adidas Ultimafusion B96470 - Đen là một trong những thiết kế rất được ưa chuộng bởi tính tiện dụng, thiết kế thời trang phong cách trẻ trung, năng động cùng chất liệu cao cấp mang lại sự thoải mái khi di chuyển.\r\nLớp đệm mây cloudfoam cung cấp khả năng hấp thụ sốc khi tác động, cùng lớp lưới phía trên tạo sự thông thoáng cho đôi chân của bạn.\r\nKết cấu nén khí làm chân tiếp đất “êm” hơn, kiểu dáng nổi bật để nhận diện với 3 đường sọc song song.\r\nPhần trên của giày luôn ôm sát vào chân bạn, giữ chân không bị xộc xệch, chống sốc và cân bằng.\r\nLớp đệm mây giảm trọng lượng giày và mang lại cảm giác cực êm, nhẹ tênh như đi trên mây.\r\nBộ đế bằng cao su nhấn nhá và sẻ rãnh để tăng cường ma sát.\r\nĐường may vô cùng tỉ mỉ, chắc chắn giúp bạn hoàn toàn an tâm về chất lượng sản phẩm.\r\nMàu sắc trang nhã, phong cách hiện đại sẽ góp phần khẳng định phong cách thời trang của bạn.', 2),
(23, 'Chuck Taylor All Star', 'https://drake.vn/image/cache/catalog/Converse/1970s/untitled%20folder%201/IMG_1635-copy-CHUCK-163299c-650x650.jpg', 1700, 'Vẫn là màu vàng best-seller của nhà Converse, tuy nhiên lần này lại là tone vàng vintage kết hợp với thiết kế cổ điển của dòng Chuck 1970s. Với đế giày cao, trắng ngà và dây giày có phần thanh mảnh hơn, form giày cứng cáp cùng chất liệu vải êm nhẹ, chắc chắn đây là siêu phẩm bạn phải sở hữu.', 3),
(24, 'All Star Madison', 'https://drake.vn/image/cache/catalog/Converse/GI%C3%80Y/563446C-270x270.jpg', 1200, 'Với tone xanh ngọc mướt mắt, nhẹ nhàng và đầy nữ tính, sở hữu một đôi giày với gam màu này bạn không cần lo về việc đôi giày sẽ trở nên lỗi thời. Điểm nhấn trên đôi giày chính là dây giày và những khoen tròn xỏ dây có màu đậm hơn so với thân giày. Hai đường chỉ chạy ngang thân giày, giúp form giày có được vẻ mềm mại hơn cho các bạn nữ.', 3),
(25, 'Chuck 1970s', 'https://drake.vn/image/cache/catalog/Converse/1970s/163299C-270x270.jpg', 1300, 'Tone màu xanh lạ mắt, dễ chịu nhưng không kém phần cá tính, thời trang cùng thiết kế cổ điển của dòng Chuck 1970s với đế giày màu ngà đúng chất vintage. Đặc biệt chất vải Canvas mang đến cho bạn sự êm nhẹ, thoáng khí, vừa đảm bảo tính thời trang, vừa đảm bảo sự thoải mái cho người mang.', 3),
(26, 'All Star High Street', 'https://drake.vn/image/cache/catalog/Converse/GI%C3%80Y/163219C-270x270.jpg', 1600, 'Với 2 tone màu Xanh Navy và Xanh Chàm tươi mát cùng xuất hiện ngay trên đôi giày sẽ giúp bạn có được một sản phẩm không bao giờ lỗi mốt. Đặc biệt với chất liệu bền chắc của vải Canvas và đế giày cao su sẽ giúp sản phẩm giữ mãi \"phong độ\" dù có bao lâu đi chăng nữa.', 3),
(27, 'Vans Classic ComfyCush Authentic', 'https://drake.vn/image/cache/catalog/Vans/VN0A3WM7VNG/IMG_1425%20copy-650x650.jpg', 175, 'Thiết kế cố điển, đơn giản với sắc trắng thanh lịch phù hợp cho bạn diện mọi phong cách\r\nChất vải Canvas truyền thống cho cảm giác êm nhẹ, thoải mái\r\nĐế cao su bền chắc có độ ma sát cao, phía trên có lớp lót bằng xốp nhẹ \r\nMiếng lót đệm giày bên trong chống ẩm tốt, giúp chân không bị hầm hơi\r\nLưỡi gà được cố định chắc chắn theo dạng vòm giúp việc di chuyển trở nên thoải mái hơn\r\nTrọng lượng của giày giảm rõ rệt, từ đó việc di chuyển cũng trở nên nhẹ nhàng hơn', 4),
(28, 'Vans ComfyCush Old Skool', 'https://drake.vn/image/cache/catalog/Vans/VN0A3WMAVNE/IMG_1452%20copy-650x650.jpg', 205, 'Chất vải Canvas mềm nhẹ kết hợp với da lộn dễ dàng vệ sinh\r\nHai đường lượn sóng bên thân dày được làm từ da thật \r\nĐường may được may gấp hai lần cho chất lượng bền và tốt hơn\r\nĐế giày cao su chắc chắn, có độ ma sát cao \r\nPhía dưới đế giày có một lớp lót xốp đảm bảo sự êm ái khi di chuyển\r\nLớp lót bên trong giày có khả năng thấm hút và chống ẩm cao\r\nLưỡi gà được cố định theo dạng vòm hỗ trợ cho việc di chuyển được thoải mái hơn', 4),
(29, 'Vans ComfyCush Era', 'https://drake.vn/image/cache/catalog/Vans/SNEAKER/VN0A3WM9N8K/VN0A3WM9N8K-DRAKE8-650x650.jpg', 220, 'Ứng dụng công nghệ ComfyCush vào đôi giày Vans Era có phần đệm ở cổ chân. Đặc biệt là sự kết hợp của 2 tone màu không bao giờ lỗi trend Trắng - Đen. Vans ComfyCush Era đã mang đến cho người dùng một trải nghiệm khác biệt với trọng lượng vô cùng nhẹ. Đặc biệt là sự cải tiến toàn bộ nội thất bên trong đôi giày, giúp bạn linh hoạt, nhẹ nhàng hơn trong việc di chuyển.', 4),
(30, 'Vans Slip-On Mix Checker', 'https://drake.vn/image/cache/catalog/Vans/SNEAKER/VN0A38F7VK5/VN0A38F7VK5-DRAKE2-650x650.jpg', 145, 'Được phối với tone màu đỏ ngọt ngào cùng thiết kế checkerboard \"bàn cờ\" quen thuộc được trải đều trên khắp phần thân giày', 4),
(31, 'Puma Shoes Men', 'https://www.shopusa24h.com/images/thumbs/0003551_giay-nam-puma-shoes-men.jpeg', 1350, 'Puma là m?t trong nh?ng thi?t k? h?p d?n v?i nh?ng ???ng nét ch?c ch?n, ki?u dáng ??p nam tính, màu s?c hài hòa. M?t s? l?a ch?n hoàn h?o, v?a nh?, v?a êm, v?a th?i trang, có th? dùng ?i ch?i, ph?i h?p th?i trang, vô cùng ti?n l?i cho b?n trong m?i d?p.', 5),
(32, 'Puma White', 'https://tea-3.lozi.vn/v1/images/resized/giay-puma-mui-hong-1517711745-1-5628777-1517711745?w=480&type=o', 850, 'M?u m?i v?a xu?t x??ng. ?? ?úc nguyên kh?i có in logo, lòng ?i c?c êm ?i r?t thích, thi?t k? tinh t?, ??n gi?n mà ch?t. Ph?i ??i Jean c?c ??p.\r\n– Grip ? gót chân GIÀY PUMA SUEDE ch?c ch?n giúp b?o v? bàn chân t?t\r\nLogo Puma ? trên l??i gà, gót giày, d?c 2 bên thân và trong c? lót giày\r\n– B?o hành bong keo 6 tháng', 5),
(33, 'Sneakers PUMA Suede sneaker running', 'https://giayxuatkhauhn.com/wp-content/uploads/2017/09/Gi%C3%A0y-Sneakers-PUMA-Suede-da-l%E1%BB%99n-VNXK-6.jpg', 450, 'a th?t nguyên mi?ng nhé, ?i r?t m?m :)\r\n-M?u m?i v?a xu?t x??ng. ?? ?úc nguyên kh?i có in logo, lòng ?i c?c êm ?i r?t thích, thi?t k? tinh t?, ??n gi?n mà ch?t. Ph?i ??i Jean c?c ??p.\r\n– Grip ? gót chân GIÀY PUMA SUEDE ch?c ch?n giúp b?o v? bàn chân t?t\r\nLogo Puma ? trên l??i gà, gót giày, d?c 2 bên thân và trong c? lót giày\r\n– B?o hành bong keo 6 tháng', 5),
(35, 'PUMA Sneaker Bravery Running Shoe ', 'http://www.elleman.vn/wp-content/uploads/2017/07/07/PUMA-SUEDE_ellevn.jpg', 1856, 'Hi?n nay, Puma ?ang có ?? ph? sóng r?ng rãi ? h?u h?t các qu?c gia trên th? gi?i, trong ?ó có Vi?t Nam. Nh?ng s?n ph?m m?i ??n t? th??ng hi?u này nh? giày t? bu?c dây, giày Netfit, giày sneak… luôn ???c ?ón nh?n và có m?c tiêu th? l?n. Nh?ng ?ôi giày c?a th??ng hi?u này r?t d? dàng ph?i h?p v?i trang ph?c ?? t?o nên phong cách riêng c?ng nh? s? thu hút dành cho b?n trong m?i hoàn c?nh.', 5),
(36, 'Puma seaker blue runnig', 'https://static.fado.vn/thumb/600/uploads/news/2017/12/13/Fado.VN_1513156470.6473.jpg', 1000, 'Puma luôn h??ng ??n nh?ng s?n ph?m có thi?t k? m?nh m?, sang tr?ng, th? hi?n tinh th?n n?ng ??ng nên ???c khá nhi?u khách hàng yêu thích, nh?t là nh?ng ng??i tr? tu?i. V?i công ngh? hi?n ??i, ??c bi?t là PUMA Mobium, nh?ng ?ôi giày Puma luôn chuy?n ??ng nh?p nhàng theo nh?ng bi?n ??i c?a bàn chân khi ch?y, theo t?t c? m?i h??ng. Do ?ó, không ch? b?n, giày Puma còn mang ??n c?m giác nh? nh? mây, vô cùng tho?i mái cho ng??i mang. ?ó chính là lý do Puma luôn ???c nhi?u v?n ??ng viên ? các b? môn khác nhau l?a ch?n trong các cu?c thi ??u th? thao l?n.', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_role` bit(2) NOT NULL COMMENT '1: admin 0:member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`, `user_role`) VALUES
(1, 'hautran@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', b'01'),
(2, 'phongluu@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', b'01'),
(3, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', b'01'),
(5, 'trungtran@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', b'01'),
(6, 'lamthon@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', b'01'),
(7, 'trung123@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', b'00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Chỉ mục cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`bill_detail_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `bill_detail_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
