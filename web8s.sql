-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2025 at 11:20 AM
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
-- Database: `web8s`
--

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`setting_key`, `setting_value`) VALUES
('activity_banner', ''),
('activity_content', ''),
('activity_title', ''),
('bg_duc_banner', ''),
('bg_han_banner', ''),
('bg_nhat_banner', ''),
('contact_address', ''),
('contact_map', ''),
('contact_page_banner', ''),
('contact_page_content', ''),
('contact_page_title', ''),
('email', 'sàdsadad'),
('home_banner_desc', 'Nhanh thật! Đã 15 năm trôi qua kể từ khi tôi nói lời tạm biệt quê hương để bước chân ra phố thị. Quê hương tôi là một làng quê thanh bình và yên ả. Ngôi làng gắn với biết bao kỷ niệm về quê hương, gia đình, bạn bè. Những ngày thơ ấu, tôi vẫn cùng lũ trẻ trong làng đi chăn trâu, cắt cỏ, đi tắm sông. Đó còn là những trưa hè nóng bức không ngủ trưa mà trốn bố mẹ đi chơi, rồi những lần hái khế, hái sung mang đến lớp chấm muối ăn. Những món ăn tuổi học trò luôn khiến chúng tôi nhớ về mỗi khi nhắc lại chuyện xưa. Giờ đây, mỗi đứa một nơi nhưng mỗi lần có dịp về quê đoàn tụ, chúng tôi vẫn như quay về thời thơ ấu, vẫn vô tư đùa vui, như chính những gì đang diễn ra thời thơ ấu vậy. Thật đáng quý, đáng trân trọng biết bao!\n\nCâu đặc biệt:\n\n- Nhanh thật!\n\n- Thật đáng quý, đáng trân trọng biết bao!\nQuê hương của em là một thành phố nhỏ bên cạnh bờ biển. Nơi đây đem đến cho em một cảm giác bình yên khó tả. Cả thành phố chạy dọc theo bờ biển, gần nhau đến mức có thể dễ dàng nghe được tiếng sóng biển vỗ rì rào. Những tòa nhà cao tầng ở đây cũng mọc cạnh nhau, san sát. Nhưng chúng cũng không cao chọc trời, mà thoai thoải, ngang với những hàng dừa cao vút. Những con đường ở nơi đây rộng và thoáng đãng, với rất nhiều hoa cỏ. Ai ai cũng yêu quý và mong muốn sống gần gũi với thiên nhiên. Vậy nên, đến với quê hương em, ai cũng sẽ được tận hưởng một thành phố nhỏ bình yên và thân thuộc. Thật là tuyệt vời!'),
('home_banner_img', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRHi_VmXB530XGVgIFP5eDC3SjFxXbHRAT1w&s'),
('home_banner_title', 'Tuấn anh belt'),
('home_banner2_desc', 'blhjhg'),
('home_banner2_title', 'xuất khẩu lao dộngggggggg'),
('home_banner3_desc', 'ựa ựa ựa'),
('home_banner3_title', 'mệt qué'),
('hotline', ''),
('main_banner_heading', 'bhhhjj'),
('page_duc_content', ''),
('page_duc_title', ''),
('page_han_content', ''),
('page_han_title', ''),
('page_nhat_content', ''),
('page_nhat_title', ''),
('site_title', 'ICOGroup - Du học và XKLĐ'),
('slider_small_1', 'https://img.freepik.com/free-vector/study-abroad-concept-illustration_114360-6644.jpg'),
('slider_small_2', 'https://img.freepik.com/free-vector/travel-concept-with-landmarks_1057-4873.jpg'),
('slider_small_3', 'https://img.freepik.com/free-vector/flat-world-tourism-day-background_23-2149053229.jpg'),
('xkld_eu_banner', ''),
('xkld_eu_content', ''),
('xkld_eu_desc', ''),
('xkld_eu_title', 'BỰa'),
('xkld_jp_banner', ''),
('xkld_jp_content', 'addddd'),
('xkld_jp_desc', 'wjpu chat luong cao'),
('xkld_jp_title', 'ádasdada'),
('xkld_kr_banner', ''),
('xkld_kr_content', 'sadsada'),
('xkld_kr_desc', 'Đại bàng'),
('xkld_kr_title', 'dad'),
('xkld_tw_banner', 'ádadad'),
('xkld_tw_content', ''),
('xkld_tw_desc', 'dễ chơi dễ nổ hũ'),
('xkld_tw_title', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`setting_key`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
