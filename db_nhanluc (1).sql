-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2025 at 10:57 AM
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
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `category` varchar(50) DEFAULT 'tin-tuc',
  `is_featured` tinyint(4) DEFAULT 0,
  `status` varchar(20) DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `excerpt`, `content`, `image_url`, `category`, `is_featured`, `status`, `created_at`) VALUES
(2, 'ICOGroup có chuyến thăm và bàn hợp tác toàn diện với EHLE Institute Group', 'adf', '', 'Trong ngày công tác thứ 2 tại Nhật Bản, đoàn lãnh đạo ICOGroup với trưởng đoàn là chủ tịch Nguyễn Quang Tuấn đã có chuyến thăm và làm việc tại EHLE Institute Group – đối tác thân thiết trong hơn 10 năm qua của tập đoàn.\n\nTại buổi làm việc, ICOGroup đã chia sẻ về câu chuyện xây dựng hệ thống trường nghề và nhận được sự ủng hộ và sẵn sàng chia sẻ, hỗ trợ về công nghệ đào tạo những ngành nghề mà EHLE Group đã đang có kinh nghiệm đào tạo như IT, Nhà hàng khách sạn,…\nHọc viện EHLE đề xuất sẽ đồng hành trong công tác đào tạo tiếng Nhật, luyện thi EJU,… cho 40 Học sinh khoá đầu tiên của trường ICOShool để giúp các em học sinh ICOSchool trang bị tốt nhất hành trang đến Nhật học tập và làm việc sau khi tốt nghiệp THPT.\nNgoài ra, phía học viện cũng mong muốn hợp tác sâu rộng hơn với ICOGroup trong lĩnh vực tuyển dụng lao động Kỹ năng đặc định cho khu vực Kansai, Nhật Bản. Đây là một cơ hội hấp dẫn và mở ra nhiều định hướng việc làm cho người lao động Việt Nam nói chung và học viên ICOGroup nói riêng.\n\nCuối buổi làm việc, trong không khí vui vẻ ấm cúng, ICOGroup tự hào và hãnh diện nhận được thông tin về các em học sinh ICO đang theo học tại Học viện EHLE. Hầu hết các em đều được đánh giá là có sự cố gắng và chăm chỉ học tập, nhiều học sinh đã đỗ vào trường chuyên môn, Đại học nổi tiếng và có những cơ hội học tập, làm việc hấp dẫn tại Nhật.\n', 'https://duhocnhatico.edu.vn/wp-content/uploads/2024/12/5-600x600.png', 'tin-tuc', 1, 'published', '2025-12-17 02:23:02'),
(3, 'TIỄN ĐOÀN DU HỌC SINH NHẬT BẢN ICOGROUP KỲ THÁNG 4/2024', 'tien-doan-du-hoc-sinh-nhat-ban-icogroup-ky-thang-42024', '', 'Tháng 4 vừa qua, ICOGroup đã tổ chức chia tay và tiễn xuất cảnh cho hơn 240 học sinh lên đường sang Nhật Bản học tập và làm việc. Cùng có mặt tại sân bay để tiễn các bạn du học sinh lên đường sang Nhật, ngoài các thầy cô ICOGroup phụ trách hướng dẫn thủ tục xuất cảnh còn có người thân trong gia đình và bạn bè của các em. Sau khi đặt chân đến Nhật Bản, đại diện phía trường sẽ có mặt tại sân bay để đưa đón các em về chỗ ở, giúp làm quen với môi trường học tập và làm việc.\n\nTại sân bay, hành lý và thủ tục xuất cảnh của từng học viên được hỗ trợ tận tình và hết sức nhanh chóng, khẩn trương, giúp các em có được bước khởi hành hoàn hảo nhất. Vậy là hành trình học tập và rèn luyện tại Việt Nam của các bạn học viên ICOGroup đã kết thúc, mở ra một tương lai đầy hứa hẹn tại đất nước Mặt trời mọc.\n\nNhững buổi chiay tay học sinh của ICOGroup luôn có cả nụ cười và nước mắt, nụ cười của sự tin tưởng, động viên, nước mắt của bao lo lắng và bịn rịn chia xa…. Thấu hiểu nỗi lòng của các em học viên, các bậc phụ huynh, ICOGroup đã, đang và sẽ luôn đồng hành, động viên, giúp các em vững tin trên con đường các em đã lựa chọn.\n\nKhởi đầu hành trình mới, trên gương mặt bạn nào cũng đầy ắp những kỳ vọng về một tương lai tươi sáng, giúp thay đổi bản thân, gia đình và quê hương. Đó là động lực để các bạn học viên thêm mạnh mẽ và trưởng thành hơn trong tương lai, ICOGroup chúc các em thành công và thật nhiều sức khoẻ!', 'https://duhocnhatico.edu.vn/wp-content/uploads/2024/05/image-1024x683.png', 'tin-tuc', 0, 'published', '2025-12-17 02:32:38'),
(4, 'Đại hội Công đoàn Công ty CP Quốc tế ICO nhiệm kỳ 2025 - 2030', 'dai-hoi-cong-doan-cong-ty-cp-quoc-te-ico-nhiem-ky-2025-2030', '', 'Vừa qua, Công đoàn Công ty CP Quốc tế ICO đã tổ chức Đại hội Công đoàn lần thứ IV, nhiệm kỳ 2025 - 2030 trong không khí thân tình và cởi mở. Đại hội là dịp để nhìn lại những nỗ lực của nhiệm kỳ trước, đồng thời cùng nhau thống nhất định hướng hoạt động cho chặng đường mới.\n\nTrong suốt chương trình, các đại biểu đã dành thời gian trao đổi thẳng thắn về báo cáo tổng kết, chia sẻ những kết quả nổi bật cũng như những điểm còn cần cải thiện. Nhiều ý kiến tham luận được trình bày từ chính trải nghiệm thực tế của đoàn viên, mang lại góc nhìn chân thật và rất “đời sống”, đúng tinh thần Công đoàn đồng hành với người lao động.\nMột số hình ảnh tại Đại hội Công đoàn Công ty CP Quốc tế ICO lần thứ IV\n\nVới tinh thần dân chủ, trách nhiệm và sự thống nhất cao, Đại hội đã bầu Ban Chấp hành Công đoàn khóa IV, nhiệm kỳ 2025 – 2030 gồm 05 đồng chí, đảm bảo đủ phẩm chất, năng lực và uy tín để lãnh đạo phong trào công đoàn trong thời gian tới.\n\nĐại hội lần thứ IV khép lại trong không khí vui tươi và phấn khởi. Đây không chỉ là một cuộc họp tổng kết đơn thuần mà thực sự là dịp để đoàn viên Công đoàn ICO nhìn lại hành trình đã qua, tiếp thêm động lực cho chặng đường mới, cùng nhau xây dựng môi trường làm việc tích cực và đóng góp vào sự phát triển bền vững của Công ty.', 'https://icogroup.vn/vnt_upload/news/12_2025/dai_hoi_cong_doan_cong_ty_co_phan_quoc_te_ico_1.png', 'tin-tuc', 0, 'published', '2025-12-17 02:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL,
  `stat_key` varchar(100) DEFAULT NULL,
  `stat_value` int(11) DEFAULT 0,
  `stat_label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`id`, `stat_key`, `stat_value`, `stat_label`) VALUES
(1, 'du_hoc_sinh', 17000, 'Du học sinh'),
(2, 'lao_dong', 38000, 'Lao động quốc tế'),
(3, 'doi_tac', 600, 'Đối tác doanh nghiệp'),
(4, 'truong_lien_ket', 300, 'Trường liên kết');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `ngay_nhan` timestamp NOT NULL DEFAULT current_timestamp(),
  `ho_ten` varchar(255) NOT NULL,
  `nam_sinh` varchar(10) DEFAULT NULL,
  `dia_chi` varchar(500) DEFAULT NULL,
  `chuong_trinh` varchar(255) DEFAULT NULL,
  `quoc_gia` varchar(255) DEFAULT NULL,
  `sdt` varchar(20) DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `ngay_nhan`, `ho_ten`, `nam_sinh`, `dia_chi`, `chuong_trinh`, `quoc_gia`, `sdt`, `ghi_chu`) VALUES
(5, '2025-12-17 02:57:25', 'andrew', '2005', 'thais', 'Du học', 'Nhật Bản', '2341213124', NULL),
(6, '2025-12-17 07:09:12', 'naruto', '1234', 'thái nguyên', 'Xuất khẩu lao động', 'Hàn Quốc', '0192922222', NULL),
(7, '2025-12-17 07:09:13', 'naruto', '1234', 'thái nguyên', 'Xuất khẩu lao động', 'Hàn Quốc', '0192922222', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
