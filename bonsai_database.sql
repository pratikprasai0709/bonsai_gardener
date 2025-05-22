-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 08:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bonsai_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`) VALUES
(1, 8),
(2, 26),
(3, 30),
(4, 47);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 16),
(2, 1, 2, 1),
(3, 2, 1, 1),
(4, 3, 1, 1),
(5, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `contact_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `total_amount`, `status`) VALUES
(3, 8, '2025-05-17', 25.50, 'Pending'),
(4, 8, '2025-05-17', 25.50, 'Pending'),
(5, 1, '2025-05-17', 25.50, 'Pending'),
(6, 8, '2025-05-17', 25.50, 'Pending'),
(7, 8, '2025-05-17', 25.50, 'Pending'),
(8, 1, '2025-05-17', 25.50, 'Pending'),
(9, 8, '2025-05-17', 25.50, 'Pending'),
(10, 10, '2025-05-17', 25.50, 'Pending'),
(11, 10, '2025-05-17', 25.50, 'Pending'),
(12, 14, '2025-05-17', 25.50, 'Pending'),
(13, 8, '2025-05-17', 25.50, 'Pending'),
(14, 10, '2025-05-17', 51.00, 'Pending'),
(15, 8, '2025-05-18', 25.50, 'Pending'),
(16, 8, '2025-05-18', 25.50, 'Pending'),
(17, 8, '2025-05-19', 25.50, 'Pending'),
(18, 8, '2025-05-19', 25.50, 'Pending'),
(19, 8, '2025-05-19', 25.50, 'Pending'),
(20, 8, '2025-05-20', 51.00, 'Pending'),
(21, 8, '2025-05-20', 127.50, 'Pending'),
(22, 26, '2025-05-21', 25.50, 'Pending'),
(23, 25, '2025-05-21', 51.00, 'Pending'),
(24, 8, '2025-05-22', 25.50, 'Pending'),
(25, 8, '2025-05-22', 51.00, 'Pending'),
(26, 8, '2025-05-22', 25.50, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT NULL,
  `is_latest` tinyint(1) DEFAULT NULL,
  `stock` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `description`, `price`, `image`, `is_featured`, `is_latest`, `stock`) VALUES
(1, 'Chinese Elm Bonsai', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/Chinese-Elm-Bonsai-Care-2.jpg', 1, 0, 0),
(2, 'Focus', 'changed', 33.00, '/images/Ficus Ginseng.jpg', 1, 0, 4),
(3, 'Japanese Maple Acer Palmatum', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/japanese maple acer palmatum.jpg', 1, 0, 0),
(4, 'Japanese Maple Acer Palmatum', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/japanese maple acer palmatum.jpg', 1, 0, 0),
(5, 'Japanese Maple Acer Palmatum', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/japanese maple acer palmatum.jpg', 1, 0, 0),
(6, 'Japanese Maple Acer Palmatum', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/japanese maple acer palmatum.jpg', 1, 0, 0),
(7, 'Chinese Elm Bonsai', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/Chinese-Elm-Bonsai-Care-2.jpg', 0, 1, 0),
(8, 'Fiscus Ginseng', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/Ficus Ginseng.jpg', 0, 1, 0),
(9, 'Japanese Maple Acer Palmatum', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/japanese maple acer palmatum.jpg', 0, 1, 0),
(10, 'Japanese Maple Acer Palmatum', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/japanese maple acer palmatum.jpg', 0, 1, 0),
(11, 'Japanese Maple Acer Palmatum', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/japanese maple acer palmatum.jpg', 0, 1, 0),
(12, 'Japanese Maple Acer Palmatum', 'Beautiful and low-maintainance Bonsai tree', 25.50, '/images/japanese maple acer palmatum.jpg', 0, 1, 0),
(17, 'Fern', 'Beautiful fern plant', 33.00, '/images/products/1a95786d-cebc-400e-82c4-78d86554f2f6_ferns-3378058_640.jpg', 1, 0, 4),
(18, 'ppp', 'ppp', 55.00, '/images/products/f3977e1c-3826-45c2-a8ad-234bc2d4c706_jackprofile.jpg', 1, 0, 33),
(19, 'nweee', 'wwww', 22.00, '/images/products/7682c990-8795-4c45-9c2e-f06445cef89b_jackprofile.jpg', 1, 0, 22),
(20, 'newproduct', 'best of the best', 43.00, '/images/products/9652eec3-2ccb-454c-9b3a-12ff55b73ae7_android-1690987_640.png', 1, 0, 2),
(21, 'appletree', 'asddff', 22.00, '/images/products/99326e88-cbc2-4d2c-b27d-3eb96675d56c_ferns-3378058_640.jpg', 1, 0, 3),
(22, 'bikivai', 'dfgh', 22.00, '/images/products/2a690c59-290d-410f-a94c-bffb068ceb73_jackprofile.jpg', 1, 0, 3),
(23, 'hacker', 'hacked', 45.00, '/images/products/342c4523-a1b0-4b24-9457-9b08279cec4c_jackprofile.jpg', 1, 0, 2),
(24, 'newfern', 'best newfern', 33.00, '/images/products/9d3f21c9-61f3-4dba-848a-e547e49c0c63_ferns-3378058_640.jpg', 1, 0, 8),
(25, 'korean plant', 'imported from korea', 22.00, '/images/products/8642a35c-7cc0-41a4-95eb-f9081d290cc9_ferns-3378058_640.jpg', 1, 0, 3),
(26, 'Mini Jade Bonsai XL', 'A larger indoor bonsai ', 65.00, '/images/products/a3c9d9d0-473a-4b1f-9706-517562388d91_Ficus Ginseng.jpg', 1, 0, 33);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'customer'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Phone` int(10) NOT NULL,
  `image_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `role_id`, `username`, `email`, `password`, `Location`, `Phone`, `image_url`) VALUES
(1, 1, 'prasaipratik', 'pratikprasai667@gmail.com', 'asdfghj123456', '', 0, ''),
(2, 1, 'bhusanbohara', 'bhusandada@gmail.com', 'bhusandada', '', 0, ''),
(3, 1, 'bikkivaii', 'pratikprasai667@gmail.com', 'bikkidon13', '', 0, ''),
(4, 1, 'hacker', 'pratikprasai667@gmail.com', 'asdfghj1234', '', 0, ''),
(5, 1, 'prakash', 'pratikprasai667@gmail.com', '12345678qa', '', 0, ''),
(6, 2, 'subh', 'pratikprasai667@gmail.com', '12345678qw', '', 0, ''),
(7, 2, 'bhusandon', 'pratikprasai667@gmail.com', 'asdxcvb123', '', 0, ''),
(8, 1, 'rabina', 'rabina@gmail.com', 'rabina123', '', 0, '/images/userprofileimages/361e66d9-d263-40b2-afc7-f7ccee4a7046_jackprofile.jpg'),
(9, 1, 'rabina', 'rabina@gmail.com', 'rabina123', '', 0, ''),
(10, 1, 'hero', 'hero@123', 'rabina123', 'gothatar', 876665, ''),
(11, 2, 'nischal', 'pratikprasai667@gmail.com', 'rabina123', 'gothatar', 1234567890, ''),
(12, 2, 'abcdxyz', 'abcdxyz@gmail.com', 'abcd123', 'nakkhu', 123456789, ''),
(14, 1, 'pasmina', 'Pashmina123@gmail.com', 'rabina123', 'hattidada', 876665, ''),
(15, 1, 'omg', 'Pashmina123@gmail.com', 'rabina123', 'hattidada', 876665, ''),
(16, 1, 'mynameisjack', 'jack@gmail.com', 'rabina123', 'jackjiiii', 123456789, '/userprofileimages/user_mynameisjack_1747750494475.jpg'),
(17, 1, 'mynameisjack', 'jack@gmail.com', 'rabina123', 'jackjiiii', 123456789, 'userprofileimages/user_mynameisjack_1747751067494.jpg'),
(18, 1, 'miketike', 'mike@gmail.com', 'rabina123', 'bikeasd', 12345678, 'userprofileimages/user_miketike_1747751133545.jpg'),
(19, 1, 'mummaa', 'mumma@gmail.com', 'rabina123', 'nepal', 12345678, 'userprofileimages/user_mummaa_1747751631660.jpg'),
(20, 1, 'kkkkkkk', 'kk@gmail.com', 'rabina123', 'fffff', 12345678, 'userprofileimages/user_kkkkkkk_1747752427947.jpg'),
(21, 1, 'zzzzzz', 'zz@gmail.com', 'rabina123', 'sssss', 12345678, 'userprofileimages/user_zzzzzz_1747752779268.jpg'),
(22, 1, 'subhadra', 'subhadra@gmail.com', 'rabina123', 'hatttt', 12345678, '/images/userprofileimages/user_subhadra_1747758498385.jpg'),
(23, 1, 'soniyadd', 'sonya@gmail.com', 'rabina123', 'sarrrr', 123456, 'userprofileimages/user_soniyadd_1747760256299.jpg'),
(24, 1, 'soniya', 'sonya@gmail.com', 'rabina123', 'sarrrr', 123456, '/images/userprofileimages/361e66d9-d263-40b2-afc7-f7ccee4a7046_jackprofile.jpg'),
(25, 1, 'rabina', 'suprava@gmail.com', 'rabina123', 'abcd', 1234567, '/images/userprofileimages/e5e71006-1c7a-4ae9-8635-2f797d211199_icon-1971133_640.png'),
(26, 1, 'hekka', 'hekka@gmail.com', 'rabina123', 'edrtyu', 1242345, '/images/userprofileimages/60fb90d7-641e-43b7-8e75-92800fc1da2b_jackprofile.jpg'),
(27, 1, 'bipinkarki', 'bipin@gmail.com', 'Samir123', 'kathmandu', 12345678, '/images/userprofileimages/94c8b750-4b5b-4d84-b176-3195d4b319a2_jackprofile.jpg'),
(28, 1, 'bipinkarki', 'bipin@gmail.com', 'bipin123', 'kathmandu', 12345678, '/images/userprofileimages/01a1af07-c50d-4144-8aec-043533ba9d63_jackprofile.jpg'),
(29, 1, 'karkibipin', 'karki@gmail.com', 'rabina123', 'pepsicola', 1234556, '/images/userprofileimages/2a83c279-e566-4e35-adf3-3b423452f3eb_jackprofile.jpg'),
(30, 1, 'bipinkarki', 'bipin@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/c60adb5b-d92b-490f-9185-a769898eaa75_jackprofile.jpg'),
(31, 1, 'rabina', 'bipin@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/1f67f484-25d4-4e4a-af72-a0ed112bdabd_jackprofile.jpg'),
(32, 1, 'vvvvv', 'bipin@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/22594183-72be-467b-a138-4789c95abac1_jackprofile.jpg'),
(33, 1, 'bipinkarki', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/a420a55f-d274-4987-844d-299f4b3a7c29_jackprofile.jpg'),
(34, 1, 'bipinkarki', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/eb5d6d05-c096-452d-97bd-1d8cdd20817c_jackprofile.jpg'),
(35, 1, 'bipinkarki', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/76fa0bad-e1ca-4615-813e-16c704a11bb1_jackprofile.jpg'),
(36, 1, 'bibbs', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/17e67a34-0bf5-4155-8de2-7fe284696044_jackprofile.jpg'),
(37, 1, 'bipinkarki', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/64e92c0b-0c1c-4699-b067-b52a9e216c09_jackprofile.jpg'),
(38, 1, 'bipinkarki', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/5b7343e8-fa2d-4a9e-8d5c-71f444664f20_jackprofile.jpg'),
(39, 1, 'bipinkarki', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/c106b3fb-56a1-4338-91ed-bf893b9c6e6b_jackprofile.jpg'),
(40, 1, 'bipinkarki', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/de76f3d4-8f90-44a6-bb5a-e6391f1be50c_jackprofile.jpg'),
(41, 1, 'bipinkarki', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/540b68aa-7fab-4518-b4e3-ec4ed10e56f1_jackprofile.jpg'),
(42, 1, 'sdddd', 'sddd@gmail.com', 'rabina123', 'ahattidada', 12345, '/images/userprofileimages/553f84ac-999e-4ba7-8024-b2516c9f469a_jackprofile.jpg'),
(43, 1, 'ssssss', 'sddd@gmail.com', 'rabina123', 'ahattidada', 12345, '/images/userprofileimages/1b9f74c2-c357-4dfa-95ba-e076914f18cb_jackprofile.jpg'),
(44, 1, 'werty', 'sddd@gmail.com', 'rabina123', 'ahattidada', 12345, '/images/userprofileimages/11e8daa5-7dd8-4788-9ddf-eb0888a6db33_jackprofile.jpg'),
(45, 1, 'gggqqq', 'asd@ggg', 'rabina123', 'asdfghjk', 123456, '/images/userprofileimages/c3ebb49f-12d9-4244-be81-ba3bfa595b72_ferns-3378058_640.jpg'),
(46, 1, 'bipinkarki', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/97788bdf-69fe-4996-87a5-ff9c1bb01980_jackprofile.jpg'),
(47, 1, 'tarasir', 'bipinkarki@gmail.com', 'rabina123', 'kathmandu', 12345678, '/images/userprofileimages/464a8a94-13f9-4c05-88ca-ea02483a9bd6_jackprofile.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `contactus`
--
ALTER TABLE `contactus`
  ADD CONSTRAINT `contactus_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
