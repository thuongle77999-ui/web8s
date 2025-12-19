-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2025 at 11:34 AM
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
-- Database: `db_nhanluc`
--

-- --------------------------------------------------------

--
-- Table structure for table `content_pages`
--

CREATE TABLE `content_pages` (
  `id` int(11) NOT NULL,
  `section_key` varchar(100) NOT NULL COMMENT 'Khoá nội dung: hero_title, about_text',
  `content_value` text DEFAULT NULL COMMENT 'Giá trị nội dung, văn bản, hoặc URL',
  `last_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ghi_chu` varchar(255) DEFAULT NULL,
  `ID` int(11) UNSIGNED NOT NULL COMMENT 'mã định danh(tự động tăng)',
  `ngay_nhan` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ho_ten` varchar(255) NOT NULL COMMENT 'họ tên user',
  `nam_sinh` int(4) NOT NULL COMMENT 'năm sinh ',
  `dia_chi` varchar(255) NOT NULL COMMENT 'nơi ở user',
  `chuong_trinh` varchar(255) NOT NULL COMMENT 'chương trình đã lựa chọn',
  `quoc_gia` varchar(255) NOT NULL COMMENT 'chương trình ở nước nào',
  `sdt` varchar(20) NOT NULL COMMENT 'số điện thoại có zalo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='bảng lưu trữ thông tin khách hàng đăng ký';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ghi_chu`, `ID`, `ngay_nhan`, `ho_ten`, `nam_sinh`, `dia_chi`, `chuong_trinh`, `quoc_gia`, `sdt`) VALUES
('null', 3, '2025-12-11 09:59:58', 'g', 3432, 'fdsfsdfd', 'Xuất khẩu lao động', 'Nhật Bản', 'e6e6535265'),
('null', 4, '2025-12-11 10:04:21', 'g', 3432, 'fdsfsdfdssssdad', 'Đào tạo ngoại ngữ', 'Hàn Quốc', '0928454744'),
('ádad', 12, '2025-12-19 14:37:12', 'trần thị ngọc trâm', 6754, 'fdsfsdfd', '', 'Nhật Bản', '0928454744'),
(NULL, 13, '2025-12-19 17:31:56', 'G', 1900, 'fdsfsdfd', 'Du học', 'Nhật Bản', '0123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `content_pages`
--
ALTER TABLE `content_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `section_key` (`section_key`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `content_pages`
--
ALTER TABLE `content_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'mã định danh(tự động tăng)', AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
