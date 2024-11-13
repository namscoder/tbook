-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 19, 2023 lúc 06:28 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlysach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_name` varchar(191) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `authors`
--

INSERT INTO `authors` (`id`, `author_name`, `gender`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Fujiko F Fujio', 1, '2023-11-18 11:31:30', '2023-11-18 11:31:30', NULL),
(2, 'Mugiwara Shintaro', 1, '2023-11-18 13:40:54', '2023-11-18 13:40:54', NULL),
(3, 'Miêu Công Tử', 1, '2023-11-18 14:02:08', '2023-11-18 14:02:08', NULL),
(4, 'Nguyễn Ngọc Tư', 0, '2023-11-18 14:18:38', '2023-11-18 14:18:38', NULL),
(5, 'Tô Hoài', 1, '2023-11-18 14:24:51', '2023-11-18 14:24:51', NULL),
(6, 'Nguyễn Nhật Ánh', 1, '2023-11-18 14:34:08', '2023-11-18 14:34:08', NULL),
(7, 'Nguyễn Việt Hà', 1, '2023-11-18 14:47:43', '2023-11-18 14:47:43', NULL),
(8, 'Trần Đăng Khoa', 1, '2023-11-18 15:02:37', '2023-11-18 15:02:37', NULL),
(9, 'Đoàn Giỏi', 1, '2023-11-18 15:55:05', '2023-11-18 15:55:05', NULL),
(10, 'Lê Thư', 0, '2023-11-18 16:01:13', '2023-11-18 16:01:13', NULL),
(11, 'Nguyễn Đình  Tài', 1, '2023-11-18 16:03:02', '2023-11-18 16:03:02', NULL),
(12, 'Edogawa Ranpo', 1, '2023-11-18 16:09:45', '2023-11-18 16:09:45', NULL),
(13, 'Đồng Lan', 0, '2023-11-18 16:13:42', '2023-11-18 16:13:42', NULL),
(14, 'Bát Nguyệt Trường An', 0, '2023-11-18 16:20:33', '2023-11-18 16:20:33', NULL),
(15, 'James Altucher', 1, '2023-11-18 16:31:49', '2023-11-18 16:31:49', NULL),
(16, 'Robert T.Kiyosaki', 1, '2023-11-18 16:36:27', '2023-11-18 16:36:27', NULL),
(17, 'Miles J Unger', 1, '2023-11-18 16:40:27', '2023-11-18 16:40:27', NULL),
(18, 'Ray H Garrison', 1, '2023-11-18 16:48:48', '2023-11-18 16:48:48', NULL),
(19, 'Eric W Noreen', 1, '2023-11-18 16:49:25', '2023-11-18 16:49:25', NULL),
(20, 'Peter C Brewer', 1, '2023-11-18 16:49:30', '2023-11-18 16:49:30', NULL),
(21, 'Jeffrey Bussgang', 1, '2023-11-18 16:53:58', '2023-11-18 16:53:58', NULL),
(22, 'Gerard Do', 1, '2023-11-18 16:58:18', '2023-11-18 16:58:18', NULL),
(23, 'Huy Hải', 1, '2023-11-19 06:37:15', '2023-11-19 06:37:15', NULL),
(24, 'Trần Đức Tiến', 1, '2023-11-19 06:39:29', '2023-11-19 06:39:29', NULL),
(25, 'Tạ Huy Long', 1, '2023-11-19 06:39:44', '2023-11-19 06:39:44', NULL),
(26, 'Phùng Duy Tùng', 1, '2023-11-19 06:42:20', '2023-11-19 06:42:20', NULL),
(27, 'Thu Ngân', 0, '2023-11-19 06:42:26', '2023-11-19 06:42:26', NULL),
(28, 'Lê Tất Điều', 1, '2023-11-19 06:47:27', '2023-11-19 06:47:27', NULL),
(29, 'Chu Tước Vi Hạ', 0, '2023-11-19 06:51:14', '2023-11-19 06:51:14', NULL),
(30, 'Don Norman', 1, '2023-11-19 06:56:31', '2023-11-19 06:56:31', NULL),
(31, 'Nhật Tuyết', 0, '2023-11-19 06:59:30', '2023-11-19 06:59:30', NULL),
(32, 'Michael D. Sedler', 1, '2023-11-19 07:01:20', '2023-11-19 07:01:20', NULL),
(33, 'Hạ Manh', 0, '2023-11-19 07:04:15', '2023-11-19 07:04:15', NULL),
(34, 'Anthony William', 1, '2023-11-19 07:06:51', '2023-11-19 07:06:51', NULL),
(35, 'Nguyễn Thủy', 0, '2023-11-19 07:11:50', '2023-11-19 07:11:50', NULL),
(36, 'Khương Lệ Bình', 0, '2023-11-19 07:15:23', '2023-11-19 07:15:23', NULL),
(37, 'Trần Văn Thắng', 1, '2023-11-19 07:19:40', '2023-11-19 07:19:40', NULL),
(38, 'Khải Hoàn', 1, '2023-11-19 07:23:36', '2023-11-19 07:23:36', NULL),
(39, 'Trần Văn Hiếu', 1, '2023-11-19 07:28:08', '2023-11-19 07:28:08', NULL),
(40, 'Jane (J.M) Bedell', 1, '2023-11-19 07:30:38', '2023-11-19 07:30:38', NULL),
(41, 'Charles Wyke - Smith', 1, '2023-11-19 07:34:15', '2023-11-19 07:34:15', NULL),
(42, 'ThS. Lê Huy Khoa', 1, '2023-11-19 07:37:17', '2023-11-19 07:37:17', NULL),
(43, 'ThS. Võ Thụy Nhật Minh', 1, '2023-11-19 07:37:28', '2023-11-19 07:37:28', NULL),
(44, 'Hoàn Tuấn Công', 1, '2023-11-19 07:40:54', '2023-11-19 07:40:54', NULL),
(45, 'Jon Richards', 1, '2023-11-19 07:43:18', '2023-11-19 07:43:18', NULL),
(46, 'Đỗ  Minh Triết', 1, '2023-11-19 08:39:50', '2023-11-19 08:39:50', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_title` varchar(191) NOT NULL,
  `price` int(11) NOT NULL,
  `promotion_price` int(11) DEFAULT NULL,
  `publishing_year` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `cate_id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`id`, `book_title`, `price`, `promotion_price`, `publishing_year`, `quantity`, `image`, `sold`, `views`, `description`, `cate_id`, `publisher_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Doraemon - Chú Mèo Máy Đến Từ Tương Lai Tập 34 [Tái Bản 2023]', 30000, 22000, 2023, 1000, 'image/1700332479b29f4f339ff601bab807929db0afc777.jpg', 0, 0, 'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 1, 1, '2023-11-18 11:34:39', '2023-11-18 11:34:39', NULL),
(2, 'Doraemon - Chú Mèo Máy Đến Từ Tương Lai Tập 35 [Tái Bản 2023]', 30000, 22000, 2023, 499, 'image/1700336006ff9e37e0c251a6c4158d3bed59f1966c.jpg', 1, 0, 'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 1, 1, '2023-11-18 12:33:26', '2023-11-19 10:25:23', NULL),
(3, 'Doraemon - Chú Mèo Máy Đến Từ Tương Lai Tập 41 [Tái Bản 2023]', 30000, 22000, 2023, 400, 'image/1700337796486c0e0e3fa93aa3edb797a023788d67.jpg', 0, 0, 'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 1, 1, '2023-11-18 13:03:16', '2023-11-18 13:03:16', NULL),
(4, 'Đội Quân Doraemon Đặc Biệt - Tập 7 (Tái Bản 2023)', 22000, 0, 2023, 100, 'image/1700338457486c0e0e3fa93aa3edb797a023788d67.jpg', 0, 0, '\"Con tàu Titanic xấu số bị đắm dưới Đại Tây Dương khi xưa hóa ra là ẩn chứa một bí mật khủng khiếp! Xin mời các em hãy cùng nhóm bạn Doraemon khám phá qua chương truyện “Con tàu truyền thuyết”! Ngoài ra còn có 8 câu chuyện li kì khác đang chờ đón các em đấy!', 1, 1, '2023-11-18 13:14:17', '2023-11-18 13:14:17', NULL),
(5, 'Doraemon Chọn Lọc - 45 Chương Mở Đầu Bộ Truyện Ngắn Doraemon Tập 1 [Tái Bản 2023]', 55000, 0, 2023, 200, 'image/1700338703486c0e0e3fa93aa3edb797a023788d67.jpg', 0, 0, 'Nguyên mẫu Doreamon gồm 826 truyện ngắn do chính tác giả Fujiko F Fujio chọn lọc. Dù đọc bao nhiêu lần ta vẫn thấy xúc động và cười thtaaj sảng khoái.', 1, 1, '2023-11-18 13:18:23', '2023-11-18 13:18:23', NULL),
(6, 'Doraemon Chọn Lọc - 45 Chương Mở Đầu Bộ Truyện Ngắn Doraemon Tập 2 [Tái Bản 2023]', 55000, 0, 2023, 150, 'image/1700338829486c0e0e3fa93aa3edb797a023788d67.jpg', 0, 0, 'Nguyên mẫu Doraemon gồm 826 truyện ngắn do chính tác giả Fujiko F Fujio chọn lọc. Dù đọc bao nhiêu lần ta vẫn thấy xúc động và cười thật sảng khoái.', 1, 1, '2023-11-18 13:20:29', '2023-11-18 13:20:29', NULL),
(7, 'Doraemon Bóng Chày - Truyền Kì Về Bóng Chày Siêu Cấp - Tập 8', 22000, 0, 2022, 200, 'image/1700340244486c0e0e3fa93aa3edb797a023788d67.jpg', 0, 0, 'Vậy là trận chung kết giải đấu bóng chày tranh Cúp Con bọ hung đã bắt đầu. Kuroemon đã hóa giải cú ném \"con chuồn chuồn ớt\" của Amoll bằng cú đánh \"lỗ đen sát thủ\". Nhưng một lần nữa, đội Akane Flyers đã lấy lại tinh thần và vươn lên dẫn trước tỉ số. Ở hiệp đấu cuối cùng, chính Mikeemon, cầu thủ \"tép riu\" chỉ được nhặt bóng khi còn là thành viên của đội Flyers đã bất ngờ hạ gục Amoll một cách ngoạn mục!', 1, 1, '2023-11-18 13:44:04', '2023-11-18 13:44:04', NULL),
(8, 'Doraemon Bóng Chày - Truyền Kì Về Bóng Chày Siêu Cấp - Tập 11', 22000, 0, 2022, 148, 'image/170034036411_b8c00c8ada3e4b1c9c1289b110e84891_master.jpg', 2, 0, 'Đội Doras đã bị loại sớm khỏi giải đấu Big Dome Cup. Vài ngày sau, cả đội đã lấy lại tinh thần, tiếp tục đợt tập luyện mới. Nhưng đã có một việc xảy ra ngoài ý muốn nên họ buộc phải thi đấu với đội Boros do Retsu – bạn của Hiroshi làm đội trưởng. Cú ném của robot Borosuke (được làm từ máy ném bóng hỏng) rất mạnh khiến bóng đi nhanh và xoáy, nhưng vẫn bị Kuro hóa giải một cách dễ dàng bằng một cú đánh đẹp mắt.', 1, 1, '2023-11-18 13:46:04', '2023-11-19 10:25:23', NULL),
(9, 'Doraemon Bóng Chày - Truyền Kì Về Bóng Chày Siêu Cấp - Tập 22', 22000, 0, 2022, 100, 'image/170034045711_b8c00c8ada3e4b1c9c1289b110e84891_master.jpg', 0, 0, 'Giải vô địch bóng chày toàn Nhật Bản đã đi tới cao trào. Trong trận đấu lại không chính thức với đội Great Doras trước đó từng hãm hại mình để giành chiến thắng mà không cần thi đấu, các tuyển thủ Doras đã gặp vô vàn khó khăn. Nhưng cuối cùng, họ vẫn giành chiến thắng và tìm lại được thứ bóng chày của riêng mình. Trong trận chung kết, Arakawa Whiters đã đánh bại đội chùa Yamaokuyama để giành chức vô địch. Ngay sau đó, ban tổ chức đột ngột công bố thông tin về trận đấu của các ngôi sao xuất sắc trong giải đấu!', 1, 1, '2023-11-18 13:47:37', '2023-11-18 13:47:37', NULL),
(10, 'Doraemon Bóng Chày - Truyền Kì Về Bóng Chày Siêu Cấp - Tập 2 (Tái Bản 2023)', 22000, 0, 2023, 300, 'image/170034056211_b8c00c8ada3e4b1c9c1289b110e84891_master.jpg', 0, 0, 'Đội Doras do Kuroemon dẫn đầu đã quyết định tham gia giải đấu bóng chày nghiệp dư của thế kỉ 22, giải Big Dome Cup. Nhưng, liệu họ có thể vượt qua các đối thủ đáng gờm như Pokoemon biết sử dụng phép thuật khi ném bóng và Dorae Ichiro có tỉ lệ phát bóng 10/10? Và họ có đạt được điều mình mong muốn đó là trở thành đối thủ của Shiroemon?', 1, 1, '2023-11-18 13:49:22', '2023-11-18 13:49:22', NULL),
(11, '999 Lá Thư Gửi Cho Chính Mình - Song Ngữ Trung-Việt Có Phiên Âm (Toàn Tập)', 350000, 295000, 2020, 150, 'image/170034225511_b8c00c8ada3e4b1c9c1289b110e84891_master.jpg', 0, 0, 'Ra mắt lần đầu năm 2018 với sứ mệnh mang đến cảm hứng sống tích cực và nguồn năng lượng tươi mát đến các độc giả, “999 lá thư gửi cho chính mình” của tác giả Miêu Công Tử đã nhận được sự chào đón vô cùng nhiệt tình bới những lá thư mang thông điệp và ý nghĩa hết sức sâu sắc, tiếp sức giúp mọi người ngày một nỗ lực hơn để có thể vững bước trên con đường thành công và khẳng định bản thân.\r\n\r\nGiờ đây, nhằm đáp ứng nhu cầu của những độc giả có niềm yêu thích ngôn ngữ Trung Quốc, Vanvietbooks hân hạnh ra mắt “999 lá thư gửi cho chính mình” – Phiên bản Song ngữ toàn tập với đầy đủ 999 lá thư chỉ trong 1 cuốn sách duy nhất! Được lấy cảm hứng từ chiếc tủ sách – tượng trưng cho nguồn kiến thức dồi dào, mới lạ đang chờ đón bạn khai phá - từng trang sách chính là từng ô tủ chứa đựng những lá thư thân quen không chỉ mang tính truyền cảm hứng sống mà còn “đính kèm” cả Hán tự và phiên âm được trình bày khoa học, hợp lý và đẹp mắt, là một công cụ rất tốt để giúp bạn đọc rèn luyện và nâng cao khả năng ngoại ngữ, trau dồi kiến thức, đúng với tiêu chí giúp bạn trở thành phiên bản hoàn hảo nhất của chính mình.Ra mắt lần đầu năm 2018 với sứ mệnh mang đến cảm hứng sống tích cực và nguồn năng lượng tươi mát đến các độc giả, “999 lá thư gửi cho chính mình” của tác giả Miêu Công Tử đã nhận được sự chào đón vô cùng nhiệt tình bới những lá thư mang thông điệp và ý nghĩa hết sức sâu sắc, tiếp sức giúp mọi người ngày một nỗ lực hơn để có thể vững bước trên con đường thành công và khẳng định bản thân.\r\n\r\nGiờ đây, nhằm đáp ứng nhu cầu của những độc giả có niềm yêu thích ngôn ngữ Trung Quốc, Vanvietbooks hân hạnh ra mắt “999 lá thư gửi cho chính mình” – Phiên bản Song ngữ toàn tập với đầy đủ 999 lá thư chỉ trong 1 cuốn sách duy nhất! Được lấy cảm hứng từ chiếc tủ sách – tượng trưng cho nguồn kiến thức dồi dào, mới lạ đang chờ đón bạn khai phá - từng trang sách chính là từng ô tủ chứa đựng những lá thư thân quen không chỉ mang tính truyền cảm hứng sống mà còn “đính kèm” cả Hán tự và phiên âm được trình bày khoa học, hợp lý và đẹp mắt, là một công cụ rất tốt để giúp bạn đọc rèn luyện và nâng cao khả năng ngoại ngữ, trau dồi kiến thức, đúng với tiêu chí giúp bạn trở thành phiên bản hoàn hảo nhất của chính mình.', 14, 1, '2023-11-18 14:17:35', '2023-11-18 14:17:35', NULL),
(12, 'Trôi', 100000, 85000, 2022, 100, 'image/170034264511_b8c00c8ada3e4b1c9c1289b110e84891_master.jpg', 0, 0, '“Em thà trôi một mình. Nhưng những gì còn sót lại của một cù lao phân rã chẳng là bao. Vài ba mái nhà lấp ló trên mặt nước, một vài cái lu, những rẻo đất đủ rộng cho một người ngồi thì cũng có, lại trôi đờ đẫn đằng xa. Mãi mới có mảnh đất trôi gần, đúng lúc nó rùng mình nứt làm hai.\r\n\r\nTrong mê lộ của nước, mình chẳng biết trôi được đến đâu. Không bãi bờ gì để định vị. Ngó đâu cũng chỉ thấy nước và bọt nước, cùng những vật chất nổi nênh.\r\n\r\nGiờ thì mạnh ai nấy trôi.” - Trích tác phẩm.\r\n---\r\nHọ nổi trôi, nhưng mắc kẹt lại đâu đó, cùng lúc. Họ tháo nhưng cũng là buộc. Họ tìm kiếm tự do, buông mình khỏi những nơi chốn, khỏi hiện thực nghiệt ngã, khỏi những vui buồn, nhưng làm sao mà thoát khỏi vòng vây của chân trời.  \r\n\r\nVới “Trôi”, Nguyễn Ngọc Tư, bằng tài năng kể chuyện hiếm có, đã mở ra một thế giới bất định với những con người cố níu lấy thứ gì đó, đồng thời cũng muốn thoát khỏi nó, trong hành trình trôi nổi dường như vô tận của mình. Độc giả dễ dàng tìm thấy sự đồng cảm nơi mỗi nhân vật, như thể họ là từng phần trong mỗi con người chúng ta - và con người ấy, được mô tả như vật thể lang thang vô định - luôn ở trong trạng thái loay hoay lý giải, làm sáng tỏ về điều mà họ đã mất đi. Và trong hành trình dạt trôi theo quỹ đạo của riêng mình, những vật thể này sượt qua nhau bất giác làm vẩn lên hơi ấm con người, gợi cảm giác cái đẹp được cầm trên tay, thường trực sẵn một nguy cơ tan rã. Sau rốt, liệu rằng các nối kết giữa người với người có đủ bền chặt để mỗi tâm hồn thôi là sự nổi trôi vĩnh viễn?', 14, 2, '2023-11-18 14:24:05', '2023-11-18 14:24:05', NULL),
(13, 'Những Ngày Đầu', 65000, 55000, 2020, 250, 'image/1700342857nhung-ngay-dau.jpg', 0, 0, '“Từ những ngày đầu cách mạng, rồi đi qua chiến tranh, hay về với thời bình, Tô Hoài không ngừng đi và viết. Cho đến khi ở độ tuổi gần 90, ngòi bút và tâm hồn ông vẫn luôn mở rộng đón những điều mới mẻ từ cuộc sống chứ không chỉ có hoài niệm về một thời đã qua.” - Chi Mai', 14, 1, '2023-11-18 14:27:37', '2023-11-18 14:27:37', NULL),
(14, 'Mùa Hè Không Tên - Bìa Cứng', 250000, 192000, 2022, 99, 'image/1700343541tải xuống.jpg', 1, 0, 'Mùa hè không tên” là truyện dài mới nhất của nhà văn Nguyễn Nhật Ánh, với những câu chuyện tuổi thơ với vô số trò tinh nghịch, những thoáng thinh thích hồi hộp cùng vô vàn kỷ niệm. Để rồi khi những tháng ngày trong sáng của tình bạn dần qua, bọn nhỏ trong mỗi gia đình bình dị lớn lên cùng chứng kiến những giây phút cảm động của câu chuyện tình thân, nỗi khát khao hạnh phúc êm đềm, cùng bỡ ngỡ bước vào tuổi lớn nhiều yêu thương mang cả màu va vấp.\r\n\r\nMùa hè năm ấy của cậu bé Khang không chỉ toàn chuyện leo cây hái trái và qua lại với con Nhàn hồn hậu đáng yêu ưa nuôi bọn cá dị tật, mà có Tí, có Chỉnh, rồi Túc, Đính… phải đối mặt với những thử thách của số phận. Nhưng vì sao là “mùa hè không tên”?\r\n\r\n“Đó là mùa hè thật đặc biệt với tôi. Sau mùa hè đó, cuộc sống của tôi đã thay đổi mãi mãi.\r\n\r\nVì vậy tôi muốn đặt cho nó một cái tên để nó không giống với những mùa hè khác trong đời tôi mỗi khi tôi nhớ về. Tôi định gọi nó là mùa hè chia tay, mùa hè ưu tư, mùa hè định mệnh, hay sến sẩm một chút là mùa hè có mây tím bay nhưng rồi tôi thấy không cái tên nào thật sự phù hợp. Cuối cùng, tôi nghĩ nếu cần phải có một cái tên thì tôi sẽ đặt tên cho nó là mùa hè không tên. Ờ, mùa hè đặc biệt của tôi cần gì phải khoác một cái tên riêng khi mà mỗi lần đầu óc tôi quay ngược về thời kỳ đó, tôi luôn thấy lòng đầy xáo trộn. Nó đã khắc lên số phận tôi những dấu vết không thể phai mờ - như vết chàm mà con người ta phải mang theo cho đến tận cuối đời.” (Trích)\r\n\r\nNhà văn Nguyễn Nhật Ánh vốn nổi tiếng qua nhiều thế hệ bạn đọc với nhiều tác phẩm đi vào lòng người. Với tác phẩm này, ông vẫn luôn giữ thông điệp khơi dậy khao khát sống đẹp, sống tử tế nơi người đọc.\r\n\r\nSách gồm 25 tranh minh họa lớn và nhiều minh họa nhỏ xinh xắn từ họa sĩ Đỗ Hoàng Tường.', 15, 2, '2023-11-18 14:39:01', '2023-11-19 09:33:03', NULL),
(15, 'Tuyệt Không Dấu Vết', 150000, 130000, 2020, 200, 'image/1700344916f022a8f71e85da08c752a7ba46176cc0.jpg', 0, 0, 'Hai sự vụ mà thám tử Tuấn của văn phòng “Tam Tuấn” thụ lý, được ghi vào hai folder “Mission 12 - thiếu phụ 7” và “Mission 14 - thiếu phụ 9” thoạt nghe chẳng có gì đặc biệt. Giống như đa phần các vụ án đồng dạng trước đây đều “nửa nhì nhằng ích kỷ, nửa thảm thiết tàn bạo, lẫn lộn cả hận lẫn yêu”, khiến thám tử “vừa chán vừa bải hoải”. Theo đó, chồng của thiếu phụ 7 - Diệu Phong, được gọi với danh xưng “Hà Thành lãng tử” là mối tình đầu của thiếu phụ 9 - Sơn Linh. Tục lụy ái tình vẫn đeo đẳng trong những giấc mơ của “số 9”. Thói giang hồ, bà ăn nem thì đương nhiên ông sẽ ăn chả, thứ trưởng phu quân của thiếu phụ 9 cũng công khai quan hệ bất chính với thiếu phụ 7. Xuất phát từ những động cơ khác nhau, cả hai cùng hoang mang đi tìm chồng và đến cậy nhờ Thám tử...\r\nĐáng lưu ý là ngay từ đầu, thám tử đã nhận thấy ở vụ này “có một cái gì sâu kín cũ kỹ quen thuộc hoang mang tới mức không thể nhớ”; và rồi “rùng mình” khi: “Cách đây chưa lâu, khi vô tình thấy giờ sinh bên lề tờ khai sinh gốc của người mất tích [Lãng tử], thám tử đã lập tay lá số tử vi cho anh ta với bát tự là giờ Bính Ngọ, ngày Nhâm Ngọ, tháng Quý Hợi, năm Mậu Ngọ. Chúa ơi, nó trùng khít với 12h ngày 16 tháng 11 năm 1978, giống y thời gian sinh ra mình.” Những chỉ dấu song trùng xuất hiện không chỉ một lần, chắc hẳn đẩy không ít hoài nghi về phía độc giả.', 15, 2, '2023-11-18 15:01:56', '2023-11-18 15:01:56', NULL),
(16, 'Góc Sân Và Khoảng Trời - Tinh Tuyển (Tái Bản 2023)', 70000, 62000, 2023, 100, 'image/17003478972023_06_27_15_57_30_6-390x510.jpg', 0, 0, '\"Tôi tự coi đây là tuyển tập với những dấu ấn thật khó quên của tuổi thơ tôi, trong những năm tháng đánh giặc gian khổ và hào hùng. Làng tôi là một trạm nghỉ chân trên đường đi B của các trung đoàn đồng bằng Bắc Bộ, trong suốt thời kì huấn luyện ở núi rừng Yên Tử. Hàng ngàn chú bộ đội đã lần lượt rải chiếu ngủ trên nền đất nhà tôi. Các chú nghe thơ tôi, chép thơ tôi vào sổ tay và mang nó ra mặt trận. Sự tiếp xúc có phần ngẫu nhiên đó đã dạy tôi một cách nghiêm túc phải viết như thế nào.\"', 16, 3, '2023-11-18 15:51:37', '2023-11-18 15:51:37', NULL),
(17, 'Tuyển thơ Trần Đăng Khoa', 100000, 0, 2020, 197, 'image/17003480251.jpg', 3, 0, 'Tập tuyển này chọn lọc những tác phẩm tiêu biểu nhất trong cả ba tập thơ của Trần Đăng Khoa. Đặc biệt, cùng với thơ còn có những mảng kí ức, những trang hồi kí, những cuộc trao đổi của nhà thơ xung quanh”chuyện bếp núc” trong nghề. Nhiều bí mật lần đầu tiên hé mở. Tập sách hấp dẫn, thích hợp với nhiều đối tượng bạn đọc, từ những người làm công tác nghiên cứu đến các em học sinh, sinh viên và nhất là với những em đang học làm thơ bởi tập sách này sẽ cho các em nhiều kinh nghiệm thú vị.', 16, 1, '2023-11-18 15:53:45', '2023-11-19 10:25:23', NULL),
(18, 'Đất Rừng Phương Nam - Phiên Bản Điện Ảnh', 200000, 180000, 2023, 100, 'image/1700348272dat-rung-phuong-nam_ban-dien-anh_bia_f9a6cf4cbf0b4d28a36e7ff7a37be67a_grande.jpg', 0, 0, 'Được viết bằng trái tim nhạy cảm, tài quan sát tinh tế, hiểu biết sâu sắc và vốn sống dồi dào, Đất rừng phương Nam là một trong những tác phẩm viết về Nam bộ xuất sắc nhất, làm nổi bật trọn vẹn vẻ đẹp con người và thiên nhiên nơi đây. Mỗi lần đọc là mỗi lần tình yêu xứ sở được khơi gợi đến nao lòng…\r\n\r\n“Càng về sau, Đất rừng phương Nam càng có vị trí vững chắc trong số tác phẩm thiếu nhi hay nhất của Việt Nam. Và người lớn đọc nó cũng vô cùng thích thú.” – Nhà văn ANH ĐỨC\r\n\r\nRa mắt lần đầu chỉ khoảng 100 trang sách và chia làm 2 tập vào đúng năm thành lập Nhà xuất bản Kim Đồng (năm 1957), Đất rừng phương Nam ngay lập tức được bạn đọc yêu thích. Về sau, cứ mỗi dịp sách tái bản, nhà văn Đoàn Giỏi lại chỉnh sửa, bổ sung để tác phẩm đầy đặn thêm và hoàn thiện lần cuối vào năm 1982.\r\n\r\nĐược đánh giá là một trong những tác phẩm hay nhất viết cho thiếu nhi, Đất rừng phương Nam được tái bản hàng năm, đã được dịch ra một số ngôn ngữ như Nga, Trung Quốc, Đức, Ba Lan, Tây Ban Nha… và trở thành nguồn cảm hứng cho điện ảnh…', 17, 1, '2023-11-18 15:57:52', '2023-11-18 15:57:52', NULL),
(19, 'Limited Boxset Kính Vạn Hoa (45 Tập)', 1500000, 1350000, 2020, 30, 'image/1700348433limited-boxset-kinh-van-hoa-45-tap-_114023_1.jpg', 0, 0, 'Nhân dịp kỉ niệm 25 năm ra mắt tập đầu tiên trong series Kính Vạn Hoa, Nhà xuất bản Kim Đồng ra mắt độc giả bộ ấn phẩm Kính Vạn Hoa 45 tập theo phiên bản in lần đầu tiên, minh họa của họa sĩ Đỗ Hoàng Tường.\r\n\r\nSách in bìa cứng trang trọng.\r\n\r\nBộ sách 45 tập được đóng boxset, số lượng in giới hạn 1000 bộ.\r\n\r\nĐiểm đặc biệt, là Tập 1 – Nhà ảo thuật của bộ ấn phẩm này sẽ có chữ ký viết tay trực tiếp của nhà văn Nguyễn Nhật Ánh.\r\n\r\nBộ sách Kính Vạn Hoa là series truyện thiếu nhi gắn liền với tên tuổi của nhà văn  Nguyễn Nhật Ánh. Bộ sách là sự hợp tác dài hơi, bền bỉ, với nhiều tâm huyết của nhà văn Nguyễn Nhật Ánh, nhà văn thiếu nhi đương đại hàng đầu Việt Nam và Nhà xuất bản Kim Đồng.\r\n\r\nBộ sách ra mắt tập đầu tiên năm 1995, ra đều đặn trong suốt 7 năm cho tới khi kết thúc ở tập thứ 45 vào năm 2002.\r\n\r\nBộ truyện Kính Vạn Hoa có ý nghĩa đặc biệt, khơi một luồng gió mới cho nền văn học thiếu nhi Việt Nam thời đổi mới.\r\n\r\nBộ sách đã chinh phục nhiều thế hệ bạn đọc, và vẫn tiếp tục khẳng định sức sống qua năm tháng, với niềm yêu mến nhà văn Nguyễn Nhật Ánh của đội ngũ đông đảo bạn đọc nhiều lứa tuổi.\r\n\r\n\"Với một giọng kể chân chất hồn hậu, khi dí dỏm khi ngọt ngào, cả tếu táo và nghịch ngợm nữa, mỗi cuốn sách của Nguyễn Nhật Ánh giống như một ống kính vạn hoa. Với các em, chỉ cần xoay khẽ một chút các em sẽ thấy biết bao quen thân và lạ lẫm để rồi ngồi cười khúc khích với nhau, hoặc lặng đi, nhìn nhau rưng rưng tiếc thương một cái gì đã mất. Còn với tôi, mỗi lần xoay khẽ kính vạn hoa kia, cả tuổi thơ lộng lẫy và đau đớn tưởng đã chìm sâu khuất lấp vào lãng quên bỗng rực lên trước mắt tôi, làm cho tôi lắm khi khó cầm được nước mắt. \"Ðược tắm mình trong dòng sông trong trẻo của tuổi thơ sẽ giúp bạn gột rửa những bụi bặm của thế giới người lớn một cách diệu kỳ\", Nguyễn Nhật Ánh đã nói vậy và anh đã đúng.\" (Nhà văn Nguyễn Quang Lập)', 17, 1, '2023-11-18 16:00:33', '2023-11-18 16:00:33', NULL),
(20, 'Mèo Đuổi Chuột', 50000, 0, 2023, 100, 'image/17003485538934974185055.jpg', 0, 0, 'Truyện dài kỳ về Mèo - tập 2. Các bạn mèo nhà mình tiếp tục dẫn các bạn nhỏ vào thế giới của các bài đồng dao và trò chơi dân gian vui nhộn, để cả góc sân vang rộn tiếng cười.', 18, 1, '2023-11-18 16:02:33', '2023-11-18 16:02:33', NULL),
(21, 'Những Đường Cong Mềm Mại', 55000, 46000, 2016, 100, 'image/1700348719P69626M001.jpg', 0, 0, 'Những đường cong mềm mại là tập truyện hài ngắn đặc sắc của tác giả Nguyễn Đình Tài. Hơn hai mươi truyện ngắn xoay quanh những đề tài mang tính thời sự, những bất công vẫn còn tồn tại trong xã hội hay những tình huống “dở khóc dở cười” của một bộ phận những cán bộ viên chức thuộc bộ máy nhà nước. Với văn phong châm biếm, đả kích, Những đường cong mềm mại mang lại cho người đọc tiếng cười nhẹ nhàng mà sâu cay, khiến người đọc không khỏi nghĩ suy về những thực trạng gợi lên trong truyện cả sau khi trang sách đã gấp lại.', 18, 4, '2023-11-18 16:05:19', '2023-11-18 16:05:19', NULL),
(22, 'Dấu Vết Của Quỷ - Bản Đặc Biệt - Bìa Cứng', 199000, 169000, 2023, 100, 'image/1700349112dau-vet-cua-quy-ban-dac-biet-bia-cung_123764_1.jpg', 0, 0, 'QUẢ THẬT LÀ MỘT DẤU VÂN TAY KỲ LẠ!\r\n\r\nDị thường ở chỗ có tận ba xoắn ốc trên một dấu tay: hai xoắn nhỏ ở phía trên tựa đôi mắt, một xoắn to bên dưới như cái miệng đang cười ngoác ra.\r\n\r\nCơn ác mộng bắt đầu với cái chết của một trợ lý thám tử, người bị giết khi theo dấu kẻ đe dọa nhà Kawate. Đó như một lời cảnh báo cho bi kịch sắp phủ lên gia đình họ. Một kẻ thích tra tấn tinh thần nạn nhân trước khi xâu xé con mồi. Một ảo thuật gia phô trương luôn mở màn bằng lá thư thách thức, kế đến là những thủ thuật không tưởng qua mặt cảnh sát rồi phô bày phần còn sót lại của kẻ xấu số. Hành tung của hắn khôn lường, chỉ để lại một manh mối duy nhất, một tạo tác đáng lẽ không thể tồn tại trên thế gian này - thứ giống như DẤU VẾT CỦA QUỶ.', 19, 5, '2023-11-18 16:11:52', '2023-11-18 16:11:52', NULL),
(23, 'Vân Trung Ca tập 1 (Bìa Cứng)', 145000, 122000, 2014, 200, 'image/1700349321van-trung-ca-tạp-1-(bìa-cúng)_34153_1.jpg', 0, 0, 'Đại Hán tình duyên - Vân Trung Ca” là câu chuyện lấy bối cảnh thời Tây Hán, Hán Chiêu Đế Lưu Phất Lăng khi đó mới 8 tuổi, trong lúc bị truy bức đến tận vùng hoang mạc xa xôi đã bất ngờ được cô bé Vân Ca…\r\nQua những bộ phim đã và đang làm mưa làm gió trên truyền hình như Bộ bộ kinh tâm, Thời gian tươi đẹp hay mới đây nhất là bộ phim truyền hình ăn khách Kỳ duyên trong gió được chuyển thể từ bộ tiểu thuyết Đại Hán tình duyên – Đại Mạc Dao thì tên tuổi của nữ tác giả Đồng Hoa trở nên vô cùng quen thuộc với cả độc giả lẫn khán giả Việt Nam.\r\n\r\nVốn không phải học chuyên về văn học, nữ tác giả sinh năm 1982 này đã tốt nghiệp Đại học Bắc Kinh khoa Quản trị kinh doanh, sau lại làm phân tích tài chính và hiện đang học Thạc sĩ về kinh tế - tài chính ở Mĩ, tuy nhiên, Đồng Hoa lại được biết đến như một trong những nữ tác giả nổi tiếng nhất trong mảng văn học mạng của Trung Quốc. Bắt đầu được độc giả chú ý từ năm 2006, khi tiểu thuyết Bộ bộ kinh tâm của chị được xuất bản và sau đó là một loạt tác phẩm ra đời đã đưa cái tên Đồng Hoa trở thành một “thương hiệu”được đảm bảo trong lòng người đọc.\r\n\r\nBộ phim dự định được ra mắt công chúng vào tháng 2/2015 và thật trùng hợp với độc giả Việt Nam khi đồng thời cả tiểu thuyết Đại Hán tình duyên – Vân Trung Ca cũng đã được Dinhtibooks mua bản quyền và sẽ phát hành tại Việt Nam trong thời gian này.', 19, 5, '2023-11-18 16:15:21', '2023-11-18 16:15:21', NULL),
(24, 'Đã Nhiều Năm Như Thế - Tập 1', 160000, 136000, 2023, 50, 'image/1700349751da-nhieu-nam-nhu-the-tap-1-mockup-02.jpg', 0, 0, 'Kiến Hạ là một cô gái ngoại thành, lớn lên trong một gia đình mà cả bố và mẹ đều thiên vị em trai, cô chẳng có gì để níu lấy sự quan tâm của họ ngoài thành tích học tập. Nhiều đêm, khi mọi người trong nhà đều đã say giấc, Kiến Hạ vẫn cặm cụi bên chiếc bàn nhỏ luyện đề, bởi cô biết chỉ khi học thật giỏi thì cô mới có thể rời khỏi vùng quê này. Cuối cùng, những nỗ lực của Kiến Hạ đã được đền đáp khi cô đỗ thủ khoa trong kỳ thi chuyển cấp ở huyện và được Trung học Chấn Hoa đặc cách tuyển.\r\n\r\nNgày khai giảng, do nhịn ăn sáng mà Kiến Hạ bị ngất trong lúc học quân sự, rồi được lớp trưởng đưa tới phòng y tế. Cũng tại đây, cô đã gặp Lý Nhiên - cậu bạn có mái tóc hung đỏ và khuôn mặt bê bết máu.\r\n\r\nẤn tượng ban đầu về đối phương, chính là họ hoàn toàn thuộc về hai thế giới khác nhau. Trong mắt Kiến Hạ lúc ấy, Lý Nhiên là học sinh cá biệt, bề ngoài trông giống côn đồ, chẳng biết trên dưới, luôn cả gan làm loạn. Còn trong mắt Lý Nhiên, ban đầu Kiến Hạ giống với những học sinh giỏi khác, hay khóc, lúc nào cũng giả vờ yếu kém, giả vờ khiêm tốn, song sau khi trò chuyện thì cậu cũng thấy cô bạn này khá thú vị.\r\n\r\nKiến Hạ vốn tự tin với thành tích học tập hồi cấp 2 của mình, nhưng khi tới Chấn Hoa, được nghe kể về các học sinh xuất sắc khác, việc không hòa nhập được cộng thêm lo lắng về thành tích khiến cô thu mình lại, trở nên nhút nhát và tự ti. Song cũng nhờ gặp gỡ Lý Nhiên - cậu bạn tuy có thành tích học tập không nổi bật nhưng lại biết cách nói chuyện và an ủi người khác, mà những ngày tháng ở Chấn Hoa của Kiến Hạ trở nên vui vẻ hơn. Lý Nhiên cũng là người ở bên Kiến Hạ khi cô bất lực nhất, nhìn thấy cô lúc cô yếu đuối nhất.\r\n\r\nCả hai đã cùng nhau bước qua những năm tháng thanh xuân ở Chấn Hoa, với những rung động dần lớn lên trong lòng mỗi người.', 20, 6, '2023-11-18 16:22:31', '2023-11-18 16:22:31', NULL),
(25, 'Đã Nhiều Năm Như Thế - Tập 2', 165000, 140000, 2023, 100, 'image/1700349809da-nhieu-nam-nhu-the-tap-2-3.jpg', 0, 0, 'Những ngày tháng tại trường Trung học Chấn Hoa cứ thế vội vã qua đi, cùng với đó là tình cảm của Kiến Hạ và Lý Nhiên ngày một lớn. Nhờ có Lý Nhiên, Kiến Hạ từ một cô bé nhút nhát đến từ ngoại thành dần trở nên tự tin, mạnh dạn. Nhờ có Lý Nhiên, Kiến Hạ đã mở lòng hơn, được đắm chìm trong cuộc sống nhiều trải nghiệm và ngập tràn màu sắc hơn. Thế nhưng, những tháng ngày hạnh phúc trong trẻo ấy chẳng kéo dài lâu, khi chỉ còn nửa năm nữa là bước vào kì thi đại học, Lý Nhiên và Kiến Hạ bị cô chủ nhiệm và gia đình phát hiện yêu sớm.\r\n\r\nKiến Hạ bị mẹ bắt quay lại Trường Trung học Số 1 ở huyện, cương quyết không cho cô trở lại Chấn Hoa, dù kỳ thi đại học đang đến gần. Quay về nơi mình một lòng muốn rời đi, tâm trạng Kiến Hạ rối bời và vô cùng đau khổ. Cô bỏ bê bản thân, ăn uống cho có lệ, tóc tai cũng không buồn chăm chút, chỉ biết tựa đầu vào cửa khóc đến mệt lả.\r\n\r\nThế nhưng nhớ tới những ngày tháng hạnh phúc bên cạnh Lý Nhiên, nhớ không khí tại Chấn Hoa và cả tương lai phía trước, Kiến Hạ đã cố gắng xốc lại tinh thần, hạ quyết tâm thương lượng với bố, rằng nếu cô đứng nhất toàn trường trong kỳ thi tháng tới, thì phải cho cô quay lại học ở Chấn Hoa. Vì chỉ ở Chấn Hoa, cô mới nhìn thấy một Kiến Hạ quyết tâm theo đuổi ước mơ, một Kiến Hạ mạnh mẽ và dám bộc lộ cảm xúc thật của mình. Cũng ở Chấn Hoa, nơi đã chứng kiến lời hứa cùng nhau đến Nam Kinh học đại học của cô và Lý Nhiên.\r\n\r\nThế nhưng, tương lai là điều không thể nói trước. Dù chỉ vài tháng ngắn ngủi là kỳ thi đại học sẽ diễn ra, nhưng vài tháng ấy đã có rất nhiều điều thay đổi. Liệu Kiến Hạ và Lý Nhiên có thực hiện được lời hứa của mình hay không? Tình cảm của cô và Lý Nhiên sẽ đi về đâu? Hãy cùng đón đọc Tập 2 của “Đã nhiều năm như thế”, dõi theo câu chuyện của Kiến Hạ và Lý Nhiên qua giọng văn nhẹ nhàng, tình tiết truyện lôi cuốn từ tác giả Bát Nguyệt Trường An nhé.', 20, 6, '2023-11-18 16:23:29', '2023-11-18 16:23:29', NULL),
(26, 'Người Thành Công Có Lối Đi Riêng', 198000, 168000, 2023, 100, 'image/17003505368eaee5d028bf08e578b2b5fd0f149d21.jpg', 0, 0, 'Linh hoạt thay đổi là điều rất quan trọng\r\n\r\nMột đại dịch khủng khiếp đã khiến cả hành tinh hoàn toàn bị tắt ngúm. Bốn mươi triệu người lao động ở Mỹ nộp đơn xin trợ cấp thất nghiệp. Thế giới tưởng như đã đi đến đường cùng. Tình hình bắt đầu hỗn loạn. Biểu tình diễn ra ở khắp mọi nơi. Và rồi nền kinh tế mở cửa trở lại, màn sương bắt đầu mờ dần đi và hậu quả là thứ mà chúng ta có thể nhìn thấy. Nhiều doanh nghiệp phá sản. Nhiều ngành công nghiệp bị thay đổi hoàn toàn. Và nhiều người trở nên lạc lối trong thế giới mới.', 21, 7, '2023-11-18 16:35:36', '2023-11-18 16:35:36', NULL),
(27, 'Lợi Thế Bất Công - Sức Mạnh Của Giáo Dục Tài Chính', 135000, 114000, 2023, 125, 'image/1700350691d0ef795e3cf5ac905dd553c8108417f4.jpg', 0, 0, 'Độc giả Việt Nam đã biết đến tác giả Robert T. Kiyosaki thông qua bộ sách Dạy Con Làm Giàu. Bộ sách đó đã giúp độc giả thay đổi suy nghĩ tư duy về đồng tiền, cũng như tăng cường kiến thức về tài chính và tự tạo lập sự nghiệp thành công. Và bộ sách đó cũng dự đoán những cuộc khủng hoảng không thể tránh khỏi trong thập niên 2001-2010 ở Mỹ và trên thế giới.\r\n\r\nTrong cuốn sách mới này, tác giả tiếp tục có những dự đoán cho thập niên đến năm 2020. Và điều quan trọng, để sống tốt và tự do tài chính trong thập niên mới này, bản thân mỗi người cần phải tăng cường kiến thức tài chính. Đó chính là con đường tạo ra cuộc sống mình mong muốn cho chính bản thân và gia đình mình. Robert khuyến khích bạn thay đổi chỉ một nhân tố: chính bạn.\r\n\r\nQuyển sách viết về sức mạnh của giáo dục tài chính, và năm lợi thế bất công mà giáo dục tài chính mang lại. Đây là dạng lợi thế mà chính bản thân mình, nếu có kiến thức về tài chính bên ngoài trường học, sẽ có mà người khác không có.\r\n\r\nVới cách viết đi thẳng vào vấn đề, thách thức độc giả với hai quan điểm khác nhau, và độc giả phải tự trải nghiệm để hiểu hết sức mạnh của giáo dục tài chính, quyển sách chắc chắn sẽ thu hút nhiều độc giả như bộ sách Dạy Con Làm Giàu.', 21, 2, '2023-11-18 16:38:11', '2023-11-18 16:38:11', NULL),
(28, 'Picasso Và Bức Tranh Khiến Thế Giới Sửng Sốt', 399000, 339000, 2022, 150, 'image/17003509780e3967dfb300a8f1d11c12fbfe5213d2.jpg', 0, 0, 'Picasso thường được biết đến như một thiên tài, một bậc thầy sáng tạo của thế kỷ 20 vì tên tuổi ông gắn liền với sự ra đời của trường phái Lập thể – bước chuyển đột phá trong dòng chảy nghệ thuật nói chung và Nghệ thuật Hiện đại nói riêng. Chủ nghĩa Lập thể phá vỡ nguyên tắc tạo hình truyền thống của hội họa từ hàng thế kỷ trước, khiến những hình khối, mảnh ghép và góc cạnh của đối tượng được trưng bày dưới lăng kính không-thời gian trên mặt phẳng tranh, mà bức tranh Những cô nàng ở Avignon đầy táo bạo đã đánh dấu thời khắc ấy.\r\n\r\nNgười ta thường biết đến một Picasso đầy tài năng và có phần kiêu ngạo – người hiểu rõ sức mạnh nghệ thuật và sự quyến rũ của bản thân; nhưng có lẽ ít ai hiểu rõ những khía cạnh nhạy cảm, phức tạp, những góc tối ẩn giấu sâu trong tâm hồn ông. Để đến được với Những cô nàng ở Avignon, cuốn sách dẫn ta quay ngược thời gian khám phá cuộc sống luôn nằm giữa hai thái cực và những mâu thuẫn của người họa sĩ – tuổi thơ bao bọc bên gia đình nhưng trưởng thành sớm vì áp lực; đời sống lãng tử thỏa mãn tinh thần mà túng thiếu về vật chất; luôn quan sát ít nói nhưng ánh mắt toát ra năng lượng thu hút lôi cuốn; tình bạn song hành với sự cạnh tranh cùng những tài năng đương thời; thờ ơ trước danh tiếng nhưng luôn tin sứ mệnh của mình là người dẫn đầu làn sóng Tiên phong; sức kiến tạo tột bậc bung ra khi lật đổ và hủy diệt các quy tắc nền tảng – rồi từ đó trả lời được câu hỏi rằng liệu sự thỏa hiệp của một thiên tài – liệu một Picasso khác – có mang lại điều gì sửng sốt hay không?\r\n\r\nĐÁNH GIÁ/NHẬN XÉT CHUYÊN GIA\r\n\r\n“Sự ra đời của chủ nghĩa Hiện đại một thế kỷ trước là một trong những thời khắc lịch sử vĩ đại nhất của quá trình phân nhánh sáng tạo, cũng như vật lý của Einstein, âm nhạc của Stravinsky, và các văn phẩm của Joyce và Proust. Một điểm sáng lớn là bức tranh đáng kinh ngạc của Picasso, và Miles Unger thể hiện đồng thời sự kịch tính và vẻ rực rỡ của sáng tạo đó trong cuốn sách ly kỳ này.”\r\n\r\n– Walter Isaacson, tác giả cuốn sách Leonardo da Vinci\r\n\r\n“Mê mải... Cuốn sách tâm huyết này là một ghi chép chân thực và nhiệt thành về một bức tranh có ảnh hưởng lâu dài tới thế giới nghệ thuật ngày nay.”\r\n\r\n– Publishers Weekly', 21, 8, '2023-11-18 16:42:58', '2023-11-18 16:42:58', NULL),
(29, 'Kế Toán Quản Trị', 599000, 509000, 2020, 50, 'image/1700351517999eb6c010b6b8e10db0e43b15ff4297.jpg', 0, 0, 'Giống như ngọn hải đăng cần mẫn dẫn đường cho người thủy thủ, Kế toán quản trị đã dẫn dắt hàng triệu người đọc dấn thân khám phá “vùng biển” kế toán quản trị. Tổng hợp 12 chủ điểm quan trọng cùng cách truyền đạt súc tích, dễ hiểu, cuốn sách sẽ đem đến cho người đọc một góc nhìn vừa bao quát, vừa chi tiết nhưng cũng rất thực tế về kế toán quản trị. Các chương trong sách bao gồm:\r\n\r\n1.    Tổng quan chung về kế toán quản trị và khái niệm chi phí;\r\n2.    Chi phí theo đơn hàng và tính chi phí đơn vị sản phẩm;\r\n3.    Hệ thống hạch toán chi phí theo đơn hàng;\r\n4.    Hạch toán chi phí theo quá trình;\r\n5.    Mối quan hệ chi phí - khối lượng - lợi nhuận;\r\n6.    Chi phí biến đổi và báo cáo bộ phận;\r\n7.    Hạch toán chi phí theo hoạt động;\r\n8.    Dự toán chủ đạo;\r\n9.    Dự toán linh hoạt và phân tích hiệu suất;\r\n10.    Chi phí tiêu chuẩn và phân tích chênh lệch;\r\n11.    Đo lường hiệu suất trong các tổ chức phân quyền;\r\n12.    Phân tích gia tăng.\r\n\r\n+TÁC GIẢ: \r\nRay H. Garrison là Giáo sư Kế toán của Đại học Brigham. Ông cũng là cố vấn quản trị của nhiều công ty kế toán trong khu vực và toàn liên bang Hoa Kỳ.\r\nEric W. Noreen hiện đang giảng dạy tại khoa Kế toán, Trường Kinh doanh Fox thuộc Đại học Temple. Ông là tác giả của nhiều bài báo về kế toán quản trị được đăng trên các tạp chí quốc tế có uy tín.\r\nPeter C. Brewer hiện là giảng viên khoa Kế toán, Trường Đại học Wake Forest. Ông đã có 19 năm là Giáo sư Kế toán của Trường Đại học Miami và có hơn 40 bài báo trong lĩnh vực kế toán quản trị trên các tạp chí quốc tế.', 22, 9, '2023-11-18 16:51:57', '2023-11-18 16:51:57', NULL),
(30, 'Định Vị Bản Thân', 179000, 150000, 2023, 70, 'image/170035182286c1868fb30d7ee7417422f9a31236cf.jpg', 0, 0, 'Nếu nhìn từ bên ngoài, khởi nghiệp là một cái gì đó rất hoang mang và không rõ ràng. Nó hỗn loạn – tới mức không theo bất kì một kế hoạch cụ thể nào. Vì không theo kế hoạch, rất khó để tìm ra cách tốt nhất để tiếp cận Vùng đất khởi nghiệp, nhận biết khi nào thì những công việc được hoàn thành, trái ngược với việc kinh doanh theo kiểu truyền thống vô cùng bài bản và có tổ chức, với một bề dày lịch sử trải dài hàng thế kỷ của các tổ chức lâu đời cùng với những cơ hội nghề nghiệp đã được hoạch định sẵn.\r\n \r\nĐịnh vị bản thân hướng dẫn từng bước thực tế, cung cấp phân tích của người trong cuộc về các vai trò và trách nhiệm khác nhau trong công ty khởi nghiệp - bao gồm quản lý sản phẩm, tiếp thị, tăng trưởng và bán hàng - để giúp bạn biết liệu bạn có muốn tham gia công ty khởi nghiệp không và những gì đáng mong đợi nếu bạn gia nhập. Bạn sẽ hiểu rõ hơn về cách các công ty khởi nghiệp thành công hoạt động và học cách đánh giá những người bạn có thể muốn trở thành - hoặc phấn đấu.\r\n \r\nCuốn sách trợ giúp chúng ta:\r\n \r\n- Định vị và xác định được điểm mạnh, điểm yếu của bản thân, từ đó giúp người đọc đưa ra định hướng về nghề nghiệp, vị trí để có được lựa chọn đúng đắn trong công việc.\r\n \r\n- Phân tích cấu trúc của một công ty startup và cung cấp các kỹ năng và tư duy cần thiết ở từng bộ phận.\r\n \r\n- Hiểu rõ hơn về cách các công ty khởi nghiệp thành công hoạt động và học cách đánh giá những người bạn có thể muốn trở thành - hoặc phấn đấu.\r\n \r\nVề tác giả\r\n \r\nJeffrey Bussgang là một nhà đầu tư mạo hiểm, doanh nhân và giáo sư kinh doanh tại Trường Kinh doanh Harvard (HBS). Hiện tại, Jeffrey đang tham gia tích cực tại quỹ đầu tư mạo hiểm Flybridge Capital Partners – Vốn hóa hơn 600 triệu đô la Mỹ. Công ty này hiện đang đầu tư và hỗ trợ quản lý cho hơn 120 doanh nghiệp, chủ yếu về lĩnh vực công nghệ. Tiêu biểu như Bowery Farming, Chief, Codecademy và MongoDB. Tại HBS, Jeffrey dạy Khởi động công nghệ mạo hiểm. Lớp học phổ biến dành cho sinh viên MBA đang thành lập các công ty hoặcl àm trong các công ty khởi nghiệp.\r\n \r\nNếu nhìn từ bên ngoài, khởi nghiệp là một cái gì đó rất hoang mang và không rõ ràng. Nó hỗn loạn – tới mức không theo bất kì một kế hoạch cụ thể nào. Vì không theo kế hoạch, rất khó để tìm ra cách tốt nhất để tiếp cận Vùng đất khởi nghiệp, nhận biết khi nào thì những công việc được hoàn thành,trái ngược với việc kinh doanh theo kiểu truyền thống vô cùng bài bản và có tổ chức, với một bề dày lịch sử trải dài hàng thế kỷ của các tổ chức lâu đời cùng với những cơ hội nghề nghiệp đã được hoạch định sẵn.\r\n \r\nĐịnh vị bản thân hướng dẫn từng bước thực tế, cung cấp phân tích của người trong cuộc về các vai trò và trách nhiệm khác nhau trong công ty khởi nghiệp - bao gồm quản lý sản phẩm, tiếp thị, tăng trưởng và bán hàng - để giúp bạn biết liệu bạn có muốn tham gia công ty khởi nghiệp không và những gì đáng mong đợi nếu bạn gia nhập. Bạn sẽ hiểu rõ hơn về cách các công ty khởi nghiệp thành công hoạt động và học cách đánh giá những người bạn có thể muốn trở thành - hoặc phấn đấu.\r\n \r\nCuốn sách trợ giúp chúng ta:\r\n \r\n- Định vị và xác định được điểm mạnh, điểm yếu của bản thân, từ đó giúp người đọc đưa ra định hướng về nghề nghiệp, vị trí để có được lựa chọn đúng đắn trong công việc.\r\n\r\n- Phân tích cấu trúc của một công ty startup và cung cấp các kỹ năng và tư duy cần thiết ở từng bộ phận.\r\n- Hiểu rõ hơn về cách các công ty khởi nghiệp thành công hoạt động và học cách đánh giá những người bạn có thể muốn trở thành - hoặc phấn đấu.\r\n \r\nVề tác giả\r\n\r\nJeffrey Bussgang là một nhà đầu tư mạo hiểm, doanh nhân và giáo sư kinh doanh tại Trường Kinh doanh Harvard (HBS). Hiện tại, Jeffrey đang tham gia tích cực tại quỹ đầu tư mạo hiểm Flybridge Capital Partners – Vốn hóa hơn 600 triệu đô la Mỹ. Công ty này hiện đang đầu tư và hỗ trợ quản lý cho hơn 120 doanh nghiệp, chủ yếu về lĩnh vực công nghệ. Tiêu biểu như Bowery Farming, Chief, Codecademy và MongoDB. Tại HBS, Jeffrey dạy Khởi động công nghệ mạo hiểm. Lớp học phổ biến dành cho sinh viên MBA đang thành lập các công ty hoặc làm trong các công ty khởi nghiệp.', 23, 10, '2023-11-18 16:57:02', '2023-11-18 16:57:02', NULL),
(31, 'Nguyên Tắc Cơ Bản Trong Đầu Tư', 199000, 169000, 2023, 100, 'image/1700351990c_t_nguy_n-t_c-trong-_u-t_.jpg', 0, 0, 'Chào mừng bạn đến với cuốn sách \"Nguyên tắc cơ bản trong đầu tư\" của tác giả Gerard Do! Bạn muốn hiểu rõ hơn về cách thị trường hoạt động? Cuốn sách này sẽ giải đáp những câu hỏi đó cho bạn. Từ những phương pháp đầu tư hiệu quả đến các yếu tố rủi ro và biến động, bạn sẽ tìm thấy thông tin quý giá để đưa ra quyết định đầu tư thông minh.\r\n\r\nVới 12 phần chuyên sâu, cuốn sách đưa bạn vào hành trình khám phá về tư duy độc lập, sự bất định và cách tận dụng sức mạnh của lãi kép. Bạn sẽ hiểu rõ hơn về cách xác định kỹ năng đầu tư và những nguyên tắc quan trọng trong đầu tư giống như chơi poker để học cách tấn công và phòng thủ đúng lúc.\r\n\r\nTuyệt vời hơn, cuốn sách còn tận mắt chứng kiến cách Phố Wall đã tạo nên khủng hoảng tài chính 2008-2009 và cách thao túng giá trên thị trường chứng khoán Việt Nam.\r\n\r\nDành thời gian đọc cuốn sách này để trở thành nhà đầu tư thông thái và tự tin hơn trong việc định hướng tài chính của bạn. Hãy sẵn sàng tạo ra những quyết định đầu tư thành công và đạt được mục tiêu tài chính của mình. Đặt mua ngay để khám phá và trau dồi kiến thức đầu tư bạn nhé!\r\n\r\nTác giả: Gerad Do Là chuyên gia trong lĩnh vực khởi nghiệp và phát triển doanh nghiệp, Gerard Do sẵn sàng chia sẻ những kiến thức và giải pháp đầu tư căn bản và tối ưu nhất cho những người mới chập chững bước vào con đường tìm hiểu thị trường chứng khoán.\r\n\r\nTốt nghiệp cử nhân Thương mại tại Đại học Sydney, Gerard Do từng là Quản lý của Hệ sinh thái Khởi nghiệp đổi mới tại Trung tâm Hỗ trợ khởi nghiệp sáng tạo Quốc gia, và là Quản lý Hệ sinh thái Khởi nghiệp tại Songhan Incubator.\r\n\r\nVới sự kiến thức sâu rộng về kinh tế, đầu tư và tiếp thị, anh đã hỗ trợ, tư vấn và cung cấp sự hỗ trợ đúng lúc và chính xác cho các doanh nghiệp khởi nghiệp. Đồng thời, anh cũng đã xây dựng và phát triển hệ sinh thái khởi nghiệp kết nối với các tổ chức và cộng đồng khởi nghiệp với nhau.', 24, 8, '2023-11-18 16:59:50', '2023-11-18 16:59:50', NULL),
(32, 'Đôi Mắt Biết Nói', 85000, 72000, 2023, 100, 'image/1700401135doi-mat-biet-noi.jpg', 0, 0, 'Ông nội của Mía nói rằng đôi mắt là cửa sổ của tâm hồn. Nhìn vào mắt một người, ta có thể biết được tâm tư sâu kín của họ. Tin lời ông, mỗi ngày Mía nhìn sâu vào mắt từng thành viên gia đình, là ông bà đáng kính, là bố mẹ yêu thương, là người chú ế vợ mê sách và cả em trai “không thể thương nổi”. Nhờ đó, Mía “nghe” được rất nhiều điều bí mật về gia đình mình.\r\n\r\nNhư tập nhật kí trẻ thơ đáng yêu, vui nhộn, sáng trong, Đôi mắt biết nói mang đến cho các bạn nhỏ nhiều bài học quí giá, để bạn hiểu rằng dẫu không có gia đình hoàn hảo trên đời, tình yêu thương vẫn luôn trọn vẹn.', 25, 1, '2023-11-19 06:38:55', '2023-11-19 06:38:55', NULL),
(33, 'Làm Mèo', 125000, 106000, 2023, 140, 'image/1700401277lam-meo.jpg', 0, 0, 'Câu chuyện về cuộc sống đầy biến động của chú mèo CHÁU ÔNG.\r\nBất ngờ, hấp dẫn, cảm động…\r\nLàm một chú mèo chân chính, đàng hoàng, tử tế thật không dễ dàng gì.\r\nCuốn sách chắc chắn sẽ gợi cho bạn đọc những liên tưởng thú vị và sâu sắc.', 25, 1, '2023-11-19 06:41:17', '2023-11-19 06:41:17', NULL),
(34, 'Bí Ẩn Thế Giới Loài Vật: Cá', 40000, 33000, 2023, 100, 'image/1700401428bi-an-the-gioi-loai-vat_ca_7ecad19d46fe43939c5593961f78f4a7_master.jpg', 0, 0, 'Các thông tin hết sức bất ngờ và vô cùng thú vị về toàn bộ thế giới loài cá đều được “bật mí” trong cuốn sách này.', 26, 1, '2023-11-19 06:43:48', '2023-11-19 06:43:48', NULL),
(35, 'Bí Ẩn Thế Giới Loài Vật: Thân Mềm Và Giáp Sát', 40000, 33000, 2023, 100, 'image/1700401483tải xuống (4).jpg', 0, 0, 'Các thông tin hết sức bất ngờ và vô cùng thú vị về toàn bộ thế giới loài thân mềm và giáp xác đều được “bật mí” trong cuốn sách này.', 26, 1, '2023-11-19 06:44:43', '2023-11-19 06:44:43', NULL),
(36, 'Quán Gò Đi Lên (Tái Bản 2022)', 120000, 108000, 2022, 130, 'image/170040160900a77ed3b80548084b6923cf3c541741.jpg', 0, 0, 'Chuyện diễn ra ở quán Đo Đo, quán ăn do tác giả sáng lập để nhớ quê nhà, nơi có chợ Đo Đo - chỗ Quán Gò đi lên ấy. Bởi thế, trong câu truyện tràn ngập những nỗi nhớ, nhớ món ăn, nhớ giọng nói, nhớ thói quen, nhớ kỉ niệm… Dẫu là câu chuyện ngập tràn nỗi nhớ, vẫn nghe trong đó những tiếng cười rất vui.', 27, 2, '2023-11-19 06:46:49', '2023-11-19 06:46:49', NULL),
(37, 'Đêm Dài Một Đời', 140000, 120000, 2021, 100, 'image/1700401748tải xuống (5).jpg', 0, 0, 'Những đứa trẻ mù do nghịch cảnh đưa đẩy, đã gặp gỡ nhau trong một trường khiếm thị chật chội, thiếu thốn. Chúng mò mẫm nhận ra nhau, chấp nhận nhau, tìm kiếm và nương nhờ tình thân để tự chữa lành, rồi biết cách đem trái tim thổn thức, giai điệu yêu thương đến cho cuộc đời.\r\n\r\nBóng đêm tàn khốc của cuộc chiến, những tổn thương nghiệt ngã của đời riêng đã được xua tan trên trang văn Lê Tất Điều bằng một lối văn tinh tế, nhẹ nhàng và đầy xúc động.\r\n\r\nNếu phải tìm kiếm cho độc giả nhỏ tuổi hôm nay một tác phẩm văn chương nuôi dưỡng lòng nhân ái, tinh thần bao dung, thì Đêm dài một đời là một chọn lựa hoàn hảo.', 27, 4, '2023-11-19 06:49:08', '2023-11-19 06:49:08', NULL),
(38, 'Hành Trình Trưởng Thành - 32 Quy Tắc Phát Triển Dành Cho Con Gái Tuổi Dậy Thì', 152000, 129000, 2023, 150, 'image/170040200929af87f0cb2b63a7e306b6a02ea43d5d.png', 0, 0, 'Con gái ở tuổi dậy thì sẽ có những khác biệt gì, trăn trở gì?\r\n\r\nNhiều bạn nữ cảm thấy có chút lo lắng, ngại ngùng khi bước vào tuổi dậy thì vì có nhiều thay đổi về mặt tâm lý và sinh lý. Ở độ tuổi này các bạn có những dấu hiệu bất thường trong cơ thể và sẽ có nhiều điều muốn biết, cần biết nhưng ngại ngùng hỏi người lớn.\r\n\r\nCuốn sách này sẽ trang bị những kỹ năng sống, những kiến thức để các bạn hiểu rõ hơn về cơ thể trong độ tuổi dậy thì.\r\n\r\nCó hiểu biết chắc chắn bạn sẽ chăm sóc bản thân tốt hơn.\r\n\r\nNội dung cuốn sách gồm 7 chương sách:\r\n\r\nChương 1: Xin chào nhé, tuổi dậy thì\r\n\r\nChương 2: Tại sao tuổi dậy thì lại nhiều nỗi muộn phiền như vậy?\r\n\r\nChương 3: Những bạn nữ ham học thường có sức hút hơn\r\n\r\nChương 4: Những nguyên tắc sử dụng mạng an toàn không thể không biết\r\n\r\nChương 5: Bạn bè thân nhất ở bên cạnh\r\n\r\nChương 6: Có bạn trai thì sẽ hạnh phúc ư?\r\n\r\nChương 7: Cuộc đối thoại giữa hai “hành tinh”', 28, 11, '2023-11-19 06:53:29', '2023-11-19 06:53:29', NULL),
(39, 'Hành Trình Trưởng Thành 30 Quy Tắc Phát Triển Dành Cho Con Trai Tuổi Dậy Thì', 148000, 125000, 2023, 150, 'image/1700402087d5aa0c69dbebc3c457059e24294057e9.jpg', 0, 0, 'Hành Trình Trưởng Thành - 30 Quy Tắc Phát Triển Dành Cho Con Trai Tuổi Dậy Thì\r\n\r\nGiáo dục giới tính, tâm sinh lý tuổi dậy thì rất quan trọng.\r\n\r\nCuốn sách “Hành trình trưởng thành - 30 quy tắc phát triển dành cho con trai ở tuổi dậy thì” dành cho những chàng trai đang ở độ tuổi “khó ở” nhất và những bậc phụ huynh muốn hiểu rõ con cái của mình.\r\n\r\nCuốn sách trang bị những kỹ năng cần thiết trong độ tuổi dậy thì thông qua những bài học đơn giản và dễ hiểu về tất cả các vấn đề từ phát triển cơ thể đến thay đổi tâm tính, từ gia đình, bạn bè đến học tập, cuộc sống.\r\n\r\nĐặc biệt, cuốn sách có phần giới thiệu một cách gần gũi thông qua xây dựng câu chuyện của các nhân vật một cách sinh động, nhằm gợi mở những vấn đề và phương pháp để giải quyết những vấn đề đó.\r\n\r\nCái tuổi dậy thì là cái tuổi khiến người ta đau đầu nhất, không còn nhỏ để dựa dẫm nhưng cũng chưa đủ lớn để quyết định mọi việc như một người trưởng thành. Tâm sinh lý đều thay đổi. Sự nổi loạn của những cậu con trai biểu hiện rõ ràng hơn bao giờ hết, anh ta không hiểu nổi chính mình, cha mẹ không hiểu được con cái. Nhưng thay vì tìm hiểu gốc rễ của vấn đề, tìm hiểu những kiến thức dậy thì của con trai thì họ lại hành động một cách bản năng để mọi việc đi xa hơn.\r\n\r\nNội dung cuốn sách:\r\n\r\nTrang bị những kiến thức về sinh lý\r\n\r\nSự thay đổi dễ thấy nhất ở các chàng trai trong tuổi dậy thì chính là ngoại hình. Tại sao chỉ trong một mùa hè, chiều cao đã tăng vọt như vậy? Tại sao giọng mình lại như thế này? Tại sao mình lại có hiện tượng bất thường ở cơ quan sinh dục… Sự thay đổi là bình thường, đừng né tránh nó! Khi dậy thì các chàng trai có thể phát triển về một số mặt như: \r\n\r\nChiều cao: Dậy thì là giai đoạn con trai cao lên nhanh nhất, có thể cao lên 28 – 31 cm.\r\n\r\nLông: Cơ thể bắt đầu tiết ra nội tiết tố nam, dẫn đến xuất hiện lông trên mặt, chân tay, bộ phận sinh dục, nách...', 28, 11, '2023-11-19 06:54:47', '2023-11-19 06:54:47', NULL),
(40, 'Design - Tư Duy Thiết Kế Lấy Người Dùng Làm Trung Tâm', 199000, 169000, 2023, 149, 'image/1700402336174edc3afae1d55b3b49832794287ef6.jpg', 1, 0, 'Dù không theo nghề thiết kế chuyên nghiệp, hằng ngày, chúng ta vẫn phải tự thiết kế cuộc sống, sắp xếp chỗ ở hay tổ chức cách làm việc khoa học.\r\nVì thế, cuốn sách tuyệt vời này không chỉ dành cho các nhà thiết kế, các chuyên gia kỹ thuật mà phù hợp với tất cả mọi người.\r\nCuốn sách giúp độc giả trở thành các nhà quan sát sắc sảo trước những thiết kế kém cỏi và ngớ ngẩn đang gây ra rắc rối cho cuộc sống của con người, đặc biệt là những sản phẩm liên quan tới công nghệ hiện đại. Don Norman sẽ khiến bạn phải gật gù tâm đắc khi phân tích thiết kế của các vật dụng thường ngày, từ bồn rửa tay, cánh cửa, ghế ngồi cho tới điện thoại hay giao diện phần mềm. Không chỉ vậy, Norman còn chỉ ra các nguyên tắc dựa trên tâm lý học nhận thức để thiết kế mọi thứ đúng đắn, khoa học. Bộ đôi này đã trở thành công cụ đầy sức mạnh để khiến cuộc sống của chúng ta trở nên thú vị, thoải mái và nhiều niềm vui hơn.Dù không theo nghề thiết kế chuyên nghiệp, hằng ngày, chúng ta vẫn phải tự thiết kế cuộc sống, sắp xếp chỗ ở hay tổ chức cách làm việc khoa học.\r\nVì thế, cuốn sách tuyệt vời này không chỉ dành cho các nhà thiết kế, các chuyên gia kỹ thuật mà phù hợp với tất cả mọi người.\r\nCuốn sách giúp độc giả trở thành các nhà quan sát sắc sảo trước những thiết kế kém cỏi và ngớ ngẩn đang gây ra rắc rối cho cuộc sống của con người, đặc biệt là những sản phẩm liên quan tới công nghệ hiện đại. Don Norman sẽ khiến bạn phải gật gù tâm đắc khi phân tích thiết kế của các vật dụng thường ngày, từ bồn rửa tay, cánh cửa, ghế ngồi cho tới điện thoại hay giao diện phần mềm. Không chỉ vậy, Norman còn chỉ ra các nguyên tắc dựa trên tâm lý học nhận thức để thiết kế mọi thứ đúng đắn, khoa học. Bộ đôi này đã trở thành công cụ đầy sức mạnh để khiến cuộc sống của chúng ta trở nên thú vị, thoải mái và nhiều niềm vui hơn.', 8, 10, '2023-11-19 06:58:56', '2023-11-19 09:16:32', NULL),
(41, 'Phụ Nữ Tự Do, Tình Yêu Và Hạnh Phúc', 119000, 101000, 2023, 150, 'image/1700402457f632c4e646fe9d1d32f377c82274244c.jpg', 0, 0, 'Xin chân thành cảm ơn quý độc giả đã quan tâm và yêu mến Phụ nữ tự do, tình yêu và hạnh phúc. Đây là cuốn sách đầu tay mà tôi dành nhiều tâm huyết. Cũng là nữ giới nên như bao người, không ít lần tôi được nghe những lời khuyên: “Phụ nữ không cần phải học nhiều, không cần phải kiếm tiền giỏi, chỉ cần đảm đang, ngoan hiền, biết chăm sóc chồng con, vun vén hạnh phúc gia đình là đủ”.\r\n \r\nQuan niệm về một cuộc đời hạnh phúc, viên mãn của phụ nữ từ trước đến nay thường được gói gọn trong một chu trình đơn giản: lớn lên, tìm kiếm một tình yêu, rồi lấy chồng, sinh con, ở nhà nội trợ, chăm sóc gia đình, làm chỗ dựa cho đàn ông phát triển sự nghiệp.\r\n \r\nTục ngữ Việt Nam có câu “Đàn ông xây nhà, đàn bà xây tổ ấm” cũng với hàm ý: vai trò của đàn ông là tập trung phát triển sự nghiệp, làm những chuyện đại sự và là trụ cột gia đình; còn phụ nữ là phái yếu, chỉ cần lo các việc nhỏ như nấu nướng, dọn dẹp; quán xuyến việc nhà; chăm sóc con cái. Để có một tình yêu đẹp hay một gia đình hạnh phúc, đa số phụ nữ thường phải chấp nhận hy sinh, lùi lại phía sau, làm hậu phương cho chồng. Tuy nhiên, trong xã hội hiện đại ngày nay, nam nữ đều bình đẳng trên mọi phương diện. Ta không thể ràng buộc nữ giới trong những tiêu chuẩn “phụ nữ gia đình” một cách gò bó, cứng nhắc. Bất kể là nam hay nữ, ai cũng đều xứng đáng được sống một cuộc đời rực rỡ theo cách riêng của mình. Ngoài vai trò làm vợ, làm mẹ, nhiều phụ nữ ngày nay cũng có những khao khát lớn hơn trong cuộc sống. Họ cũng có những ước mơ, đam mê cháy bỏng và mong muốn được làm việc, cống hiến, theo đuổi con đường sự nghiệp riêng của mình. Song, chính những định kiến về vai trò của giới trong xã hội đã tạo nên nhiều áp lực, rào cản và thách thức cho nữ giới trên hành trình chinh phục ước mơ. Bên cạnh đó, không phải cô gái nào cũng may mắn tìm được một người đàn ông đủ bao dung, thấu hiểu và sẵn sàng đồng hành, ủng hộ mình, nên đôi khi, trắc trở trong chuyện tình cảm cũng là một “hậu quả” thường thấy ở các cô nàng mang nhiều hoài bão. Việc cân bằng giữa công việc, sự nghiệp và vẹn toàn gìn giữ tình yêu, hạnh phúc trong hôn nhân luôn là mối bận tâm hàng đầu của phụ nữ ngày nay. Hy vọng rằng, các độc giả nữ sẽ tìm thấy sự đồng cảm và câu chuyện của chính mình trong cuốn sách này.', 8, 10, '2023-11-19 07:00:57', '2023-11-19 07:00:57', NULL);
INSERT INTO `books` (`id`, `book_title`, `price`, `promotion_price`, `publishing_year`, `quantity`, `image`, `sold`, `views`, `description`, `cate_id`, `publisher_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(42, 'Giao Tiếp Thông Minh - Lên Tiếng Đúng Nơi, Im Lặng Đúng Lúc', 148000, 125000, 2023, 150, 'image/17004026058935246939758.jpg', 0, 0, 'Bạn đã từng hối hận vì những lời bạn nói ra? Hoặc đã từng có thời khắc nào mà bạn nên nói thẳng ra nhưng bạn lại không nói chưa? Con người ta chỉ mất 2 năm để học nói nhưng mất cả đời để học cách im lặng. Người khôn ngoan luôn biết khi nào nên lên tiếng và khi nào nên im lặng. Im lặng để không bị cuốn vào những cuộc tranh cãi vô nghĩa. Im lặng để không nói ra điều gì sai thời điểm, khiến tình hình trở nên tệ hơn. Im lặng để không còn bị làm phiền bởi những điều vốn không phải là vấn đề của bạn. \r\n\r\nHầu hết mọi người đều từng rơi vào tình huống không biết nên nói ra suy nghĩ của mình hay tự “nuốt” quan điểm vào bên trong. Khi nào im lặng là vàng, và khi nào thì tốt hơn hết là phải lên tiếng? Giao tiếp thông minh - Lên tiếng đúng nơi, im lặng đúng lúc đưa ra những hướng dẫn thiết thực cho những người muốn cải thiện kỹ năng giao tiếp của mình thông qua 10 chương\r\n\r\nCuốn sách này đưa ra những hướng dẫn thiết thực cho những người muốn cải thiện kỹ năng giao tiếp của mình. Nó sẽ giúp độc giả khám phá chi phí và mục đích của sự im lặng, cách đặt câu hỏi hay, cách vượt qua áp lực khi phải giữ im lặng … Sử dụng các ví dụ trong thời hiện đại, cuốn sách này chia sẻ các chiến lược quan trọng để nhận và xây dựng khả năng giao tiếp tốt hơn tại nơi làm việc, tại không gian công cộng, và tại ngôi nhà của chính bạn. \r\n\r\nChúng ta sẽ đào sâu hơn và điều tra xem một lời nói không đúng thời điểm, một thái độ tồi tệ hoặc sự ngạo mạn về mặt tâm linh có thể tạo ra một mấu chốt cũng như gây ra rào cản đối với kế hoạch hoàn hảo của Chúa như thế nào. Chỉ bởi vì một từ được sử dụng sai cách mà số phận đã bị lạc lối, sự chia rẽ đã thay thế cho sự đoàn kết, các quốc gia bị phá hủy. Cuộc sống của chúng ta, cả về mặt thể chất và tâm hồn, phụ thuộc vào khả năng và sự sẵn sàng cho chúng ta để lên tiếng vào thời điểm thích hợp. Và ngược lại, sự im lặng có thể mang đến đau khổ, sự hủy diệt và sự tấn công không thể tránh khỏi của tội lỗi. \r\n\r\nTrong cuốn sách, tác giả cũng chia sẻ thời điểm thích hợp để im lặng. Làm sao để biết được chúng ta nên nói ra hay im lặng. Làm sao để biết được chúng ta nên nói ra hay giữ im lặng trong một tình huống. Mọi người thường lầm tưởng 1 người giỏi giao tiếp là phải nói nhiều, hoạt bát, hay chia sẻ…Tuy nhiên, đôi khi chúng ta cần những “nốt lặng”. Giống như 1 bài hát thì có đoạn cao trào, nhưng cũng sẽ có những đoạn êm nhẹ lại hơn thì mới tạo được sức hút cho người nghe được.\r\n\r\nKhông quan trọng là bạn nói gì và nói như thế nào… quan trọng là người nghe hiểu và đọng lại được gì sau khi nghe mình nói.', 8, 11, '2023-11-19 07:03:25', '2023-11-19 07:03:25', NULL),
(43, 'Bộ Sách Ăn Chuẩn Ít Bệnh (Bộ 2 Cuốn)', 398000, 338000, 2023, 150, 'image/1700402739combo-_n-chu_n-_t-b_nh.jpg', 0, 0, 'Ăn chuẩn ít bệnh là tác phẩm tổng kết của nguyên trưởng khoa dinh dưỡng bệnh viện An Trinh từ kinh nghiệm mắc bệnh của bản thân tác giả và hơn 100.000 ca bệnh lâm sàng trong quá trình công tác tại bệnh viện.\r\n\r\nCác bệnh nhân mắc huyết áp cao, mỡ máu cao, tiểu đường, tắc động mạch vành... đều từng lầm tưởng rằng kiếp này chỉ có thể uống thuốc suốt đời hoặc phải trải qua phẫu thuật mới mong hồi phục, mà quên mất việc thay đổi phương thức sống – chú trọng dinh dưỡng trong từng bữa ăn, mới thực sự giúp chúng ta hồi phục sức khỏe.', 9, 5, '2023-11-19 07:05:39', '2023-11-19 07:05:39', NULL),
(44, 'Cơ Thể Tự Chữa Lành - Phác Đồ Thanh Lọc Và Công Thức Giải Cứu Não', 320000, 272000, 2023, 150, 'image/170040289211fda51ee6b60e32bcd33064a9a4c48c.jpg', 0, 0, 'Là một nửa song hành với cuốn Cơ thể tự chữa lành 7 - Giải cứu não, cuốn sách này tóm lược các vấn đề, triệu chứng và bệnh trạng liên quan đến não vốn đã được trình bày chi tiết trong cuốn Giải cứu não để độc giả có thể tham khảo thuận tiện và dễ dàng hơn. Không chỉ thế, tác giả còn cung cấp rất nhiều hướng dẫn khả dụng, cũng như các phác đồ và công thức chế', 9, 5, '2023-11-19 07:08:12', '2023-11-19 07:08:12', NULL),
(45, 'Cơ Thể Tự Chữa Lành - Giải Cứu Não', 390000, 330000, 2023, 100, 'image/1700402993bia_co_the_tu_chua_lanh_7_-_xuat_in-b1.jpg', 0, 0, 'Cuốn sách đi sâu vào các vấn đề liên quan đến não bộ - từ các loại virus, vi khuẩn gây hại cho não, tới kim loại nặng độc hại, dược phẩm lưu cữu, các chất gây ô nhiễm, thậm chí cả phóng xạ/bức xạ hiện rất phổ biến trong cuộc sống hiện đại. Không chỉ thế, tác giả còn căn cứ vào các vấn đề nêu trên để lý giải nhiều vấn đề, triệu chứng và bệnh trạng tâm thần hiện đang khiến nhiều y bác sĩ bối rối và hàng ngàn người bệnh khốn khổ. Cuốn sách đi sâu vào các vấn đề liên quan đến não bộ - từ các loại virus, vi khuẩn gây hại cho não, tới kim loại nặng độc hại, dược phẩm lưu cữu, các chất gây ô nhiễm, thậm chí cả phóng xạ/bức xạ hiện rất phổ biến trong cuộc sống hiện đại. Không chỉ thế, tác giả còn căn cứ vào các vấn đề nêu trên để lý giải nhiều vấn đề, triệu chứng và bệnh trạng tâm thần hiện đang khiến nhiều y bác sĩ bối rối và hàng ngàn người bệnh khốn khổ.', 9, 5, '2023-11-19 07:09:53', '2023-11-19 07:09:53', NULL),
(46, 'Giáo Trình Tiếng Nhật Sơ Cấp (Tập 2) - SHIN NIHONGO NO KISO II', 142000, 120000, 2019, 200, 'image/1700403213giao-trinh-tieng-nhat_1_1.jpg', 0, 0, 'Học tiếng Nhật là một xu hướng rất phát triển hiện nay, học tiếng Nhật không chỉ để đi du học hay nghiên cứu mà còn để nâng cao cơ hội có việc làm. Nhưng có một thực trạng là số người học tiếng Nhật vẫn bị hạn chế vì một số lí do\r\n\r\nDù bộ giáo trình Minna no nihongo phổ biến nhất hiện nay nhưng đối tượng học vẫn bị giới hạn. MCBooks – chuyên sách ngoại ngữ – xin gửi đến các bạn học viên bộ giáo trình cũng hay được sử dụng hiện nay đó là bộ Giáo trình Shin Nihongo no Kiso để mở rộng đối tượng học tiếng Nhật, đặc biệt là trong ngành kỹ thuật.\r\n\r\nGiáo trình này rất tiện cho việc thực hành giao tiếp theo các tình huống trực tiếp trong công ty, việc làm. Vì vậy học theo giáo trình này sẽ đáp ứng được 4 kỹ năng: Nghe, Nói, Đọc, Viết và nhanh chóng đạt được kết quả tốt. Các cơ sở đào tạo tiếng Nhật tại Việt Nam có thể sử dụng bộ giáo trình này là bộ giáo trình chính khi giảng dạy và cũng có thể kết hợp với các giáo trình phụ trợ khác, ngược lại sử dụng bộ giáo trình này hỗ trợ cho giáo trình khác để nâng cao chất lượng đào tạo.\r\n\r\nCuốn sách Giáo trình Shin Nihongo no Kiso II – nguyên bản, dành riêng cho các trường chuyên ngoại ngữ và Trung tâm tiếng Nhật, là cuốn sách thứ hai trong bộ giáo trình, dành cho trình đô Trung cấp – trình độ có tính chất học thuật cao hơn Sơ cấp\r\n\r\nCấu trúc Bộ giáo trình học tiếng Nhật ngữ sơ cấp Shin Nihongo no Kiso II gồm 3 phần như sau:\r\n\r\n1) Phát âm tiếng Nhật.\r\n\r\n2) Những câu thường dùng trong lớp học.\r\n\r\n3) Bài khóa gồm các phần: Mẫu câu – Thí dụ – Hội thoại – Luyện tập – Bài tập – Ôn tập – Tóm tắt ngữ pháp về động từ, trợ từ, liên từ… – Bảng tra từ mới.\r\n\r\nCuốn sách học tiếng Nhật này được biên soạn dễ hiểu và khoa học có giải nghĩa tiếng Việt để một người dù không có kiến thức cơ bản cũng có thể theo học. Các bài học được sắp xếp theo trình tự có chủ ý để người học nắm bắt từng thành phần của tiếng Nhật qua đó giúp việc tiếp thu kiến thức nhanh và hiệu quả hơn.\r\n\r\nBộ giáo trình học tiếng Nhật ngữ sơ cấp Shin Nihongo no Kiso II được in đẹp, rõ ràng, tiện lợi cho việc dạy và học tiếng nhật. Bộ giáo trình được 3A Corporation (Nhật Bản) ủy quyền phát hành độc quyền tại thị trường Việt Nam cho công ty cổ phần sách MCBooks – chuyên sách ngoại ngữ – nên chất lượng và nội dung chắc chắn không phải bàn cãi.\r\n\r\nHy vọng rằng bộ Giáo trình này sẽ thắp sáng ước mơ Nhật Bản cho mọi người học tiếng tại Việt Nam.', 10, 11, '2023-11-19 07:13:33', '2023-11-19 07:13:33', NULL),
(47, 'Giáo Trình Tiếng Nhật Sơ Cấp - Tập 1', 142000, 120000, 2014, 200, 'image/1700403295tải xuống (7).jpg', 0, 0, 'Cuốn sách này là cuốn giải thích văn phạm cho cuốn Shin Nihongo no Kiso II. Cuốn sách này được soạn để giải thích những điểm văn phạm một cách ngắn gọn, dễ hiểu vì vậy các tác giả cố gắng tránh không sử dụng nhiều các thuật ngữ chuyên môn về văn phạm.\r\n\r\nỞ các mẫu câu và các biểu hiện đều có kèm theo nhiều câu thí dụ và phần phiên dịch bằng tiếng Việt. Phần phiên dịch chỉ để cho tiện trong việc học chứ không  phải nhờ đó mà hiểu được tất cả ý nghĩa và cách sử dụng tiếng Nhật.\r\n\r\nKhi học các mẫu câu và các biểu hiện trong hai cuốn Shin Nihongo no Kiso I và Shin Nihongo no Kiso II chúng ta se tìm thấy nhiều sự trùng hợp nhưng ý nghĩa và cách sử dụng chúng có hơi khác nhau một chút.\r\n\r\nHãy đọc thật kỹ cuốn giải thích văn phạm này để hiểu cho thật rõ các mẫu câu, ý nghĩa của các biểu hiện và cách sử dụng chúng để có thể sử dụng đúng tiếng Nhật.', 10, 11, '2023-11-19 07:14:55', '2023-11-19 07:14:55', NULL),
(48, 'Giáo Trình Chuẩn HSK 1 (Tái Bản 2023)', 198000, 168000, 2023, 250, 'image/1700403410a094a89ce9dc2a2684239848943d5a53.jpg', 0, 0, 'Được chia thành 6 cấp độ với tổng cộng 18 cuốn, Giáo trình chuẩn HSK có những đặc điểm nổi bật sau:\r\n\r\n• Kết hợp thi cử và giảng dạy: Được biên soạn phù hợp với nội dung, hình thức cũng như các cấp độ của đề thi HSK thật, bộ sách này có thể được sử dụng đồng thời cho cả hai mục đích là giảng dạy tiếng Trung Quốc và luyện thi HSK. • Bố cục chặt chẽ và khoa học: Các điểm ngữ pháp được giải thích cặn kẽ, phần ngữ âm và chữ Hán được trình bày từ đơn giản đến phức tạp theo từng cấp độ.\r\n\r\n• Đề tài quen thuộc, nhiều tình huống thực tế: Bài học được thiết kế không quá dài và đề cập đến nhiều tình huống (có file MP3 kèm theo), giúp bạn rèn luyện các kỹ năng ngôn ngữ và tránh cảm giác căng thẳng trong lúc học. • Cách viết thú vị: Bằng cách viết sinh động kèm nhiều hình ảnh minh họa, tác giả bộ sách chỉ cho bạn thấy học tiếng Trung Quốc không hề khô khan, nhàm chán.\r\n\r\nVới nhiều ưu điểm nổi bật như vừa nêu, Giáo trình chuẩn HSK không chỉ là tài liệu giảng dạy hữu ích ở các trung tâm dạy tiếng Trung Quốc mà còn rất thích hợp với những người muốn tự học ngôn ngữ này.', 10, 12, '2023-11-19 07:16:50', '2023-11-19 07:16:50', NULL),
(49, 'Tin Học Cho Người Mới Bắt Đầu', 75000, 50000, 2014, 200, 'image/1700403764tin-hoc-cho-nguoi-moi-bat-dau.jpg', 0, 0, 'Cuốn sách được cập nhật những kiến thức tin học mới nhất do tác giả Trần Văn Thắng biên soạn nhằm giúp cho những người mới bắt đầu học và sử dụng máy vi tính.\r\n\r\nNội dung cuốn sách giới thiệu quá trình hình thành và phát triển của thế giới tin học, những khái niệm căn bản liên quan đến phần cứng và phần mềm. Ngoài ra, để trang bị cho bạn những công cụ chuyên sâu làm việc trên máy vi tính. Cuốn sách cũng giới thiệu về hiệu điều hành Windows XP, vài nét về Windows Vista và Windows 7, chương trình soạn thảo văn bản Winword 2007 và Excel 2007 dùng để tính toán, lập bảng biểu và trình duyệt Internet Explorer.\r\n\r\nTập sách được chia làm 3 phần và 6 chương.\r\n\r\nMục lục:\r\n\r\nPhần 1. Tin học căn bản\r\nPhần 2. Hệ điều hành Windows\r\nPhần 3. Các ứng dụng căn bản', 29, 11, '2023-11-19 07:22:44', '2023-11-19 07:22:44', NULL),
(50, 'Hướng Dẫn Thực Hành Adobe Illustrator CS6', 97000, 75000, 2015, 200, 'image/1700403905huong-dan-thuc-hanh-adobe-illustrator-cs6_15975_14009.jpg', 0, 0, 'Adobe Illustrator là một phần mềm đồ họa khá phổ biến, nó chủ yếu thao tác trên các đồ họa vector, cho phép bạn tạo và chỉnh sửa các vector chứ không phải ảnh bitmap như Photoshop. Do đó, bạn có thể tạo một file kích thước nhỏ nhưng in với một kích thước to hơn gấp nhiều lần mà không gặp vấn đề gì cả. Với khả năng tạo và chỉnh sửa các đối tượng dễ dàng, nó thực sự phù hợp cho các nhà thiết kế đồ họa.\r\n\r\nVới những hướng dẫn chi tiết và cụ thể trong sách, bạn sẽ dễ dàng thực hành ngay.\r\n\r\nĐây là cuốn tài liệu hữu ích cho những ai quan tâm đến lĩnh vực Thiết kế - Đồ họa.', 30, 2, '2023-11-19 07:25:05', '2023-11-19 07:25:05', NULL),
(51, 'Tự Động Hóa PLC S7-1200 Với Tia Portal', 368000, 300000, 2019, 50, 'image/17004042046ab392eb12177bea55d34b3b9c7ef2ba.jpg', 0, 0, 'Trong lần tái bản mới này, tác giả dành nhiều thời gian chỉnh sửa lỗi chính tả, một số sai sót khác và bổ sung thêm nội dung như: Recipe, Data log, những cập nhật thông tin mới cho dòng sản phẩm PLC S7 - 1200 với Firmware CPU và phần mềm TIA Portal mới nhất, cách chuyển đổi chương trình từ PLC S7 - 200 lên PLC S7 - 1200.', 32, 14, '2023-11-19 07:30:04', '2023-11-19 07:30:04', NULL),
(52, 'Lập Trình Viên - Phù Thủy Thế Giới Mạng', 100000, 81000, 2019, 199, 'image/1700404339xfxd_100315_1.jpg', 1, 0, '\"...Khi viết mã, thích nhất là ta có thể nắm thế kiểm soát. Máy tính sẽ làm mọi điều ta yêu cầu, dĩ nhiên là ta phải biết cách. Đó là cảm giác rất quyền lực vì ta có thể tạo ra bất cứ thứ gì mình muốn...\"\r\n\r\n\"...Khi nghĩ về nghề lập trình, có thể bạn sẽ nghĩ tới chuyện thiết kế một video game (trò chơi điện tử) ngập tràn hành động với đủ loại chiến binh, anh hùng, quái vật hay người khổng lồ; hoặc chế tạo rô-bốt có khả năng dắt chó đi dạo và đem rác đi đổ; hay phát triển các cổ máy đưa con người lên sao Hỏa... Bất cứ ước mơ nào kể trên cũng nằm trong tầm tay bạn nếu bạn quyết định chọn lập trình làm nghề nghiệp sau này...\"', 32, 7, '2023-11-19 07:32:19', '2023-11-19 09:33:03', NULL),
(53, 'Định Kiểu Web Với CSS', 120000, 90000, 2014, 75, 'image/170040457855751.jpg', 0, 0, 'CSS là một cơ chế mạnh mẽ trong việc áp kiểu trình bày cho trang web. Hiểu biết sâu sắc về cách thức vận hành của CSS sẽ giúp bạn - nhà thiết kế - cơ hội tốt nhất để xây dựng các trang web hoạt động đúng và chuẩn xác trên nhiều trình duyệt.\r\n\r\nCuốn sách Định kiểu Web với CSS sẽ hướng dẫn bạn những kỹ thuật hữu ích nhất để thiết kế các trang web đáp ứng tốt nhất các yêu cầu về tính năng và trình bày giao diện. Những kỹ thuật quan trọng được đề cập tới bao gồm cách thức sử dụng các thuộc tính căn vị trí, thuộc tính hiển thị, các kỹ thuật tạo hiệu ứng nổi (floating), hủy bỏ hiệu ứng nổi (clearing) để thiết kế những trang web có tính linh hoạt cao...', 33, 13, '2023-11-19 07:36:18', '2023-11-19 07:36:18', NULL),
(54, '6000 Từ Vựng Chuyên Ngành Du Lịch Khách Sạn', 200000, 160000, 2023, 199, 'image/170040481514eb9d8dbf4f47a2168ef1ad1ffac4bc.jpg', 1, 0, 'updating...', 12, 15, '2023-11-19 07:40:15', '2023-11-19 09:35:51', NULL),
(55, 'Từ Điển Tiếng Việt Của GS Nguyễn Lân - Phê Bình Và Khảo Cứu', 290000, 245000, 2017, 50, 'image/170040495073e760b6fe52b2628150de107432cbf2.jpg', 0, 0, 'Từ cuối năm 2013, trên trang Blog Tuấn Công Thư Phòng, Hoàng Tuấn Công đã bắt đầu công bố những bài viết chỉ ra những sai sót trong các tác phẩm của giáo sư Nguyễn Lân. Những bài viết này gây ra nhiều luồng dư luận khác nhau trong giới chuyên môn và cả trong độc giả. Có những người bất bình bởi giáo sư Nguyễn Lân là một tên tuổi lớn có nhiều đóng góp cho giáo dục Việt Nam, trong khi Hoàng Tuấn Công là một nhà nghiên cứu trẻ chưa được nhiều độc giả biết tới.\r\n\r\nGs. Nguyễn Lân đã dành toàn bộ cuộc đời mình từ sau khi về hưu để biên soạn từ điển và nghiên cứu nhằm gìn giữ phát triển tiếng Việt. Tuy nhiên một số tác phẩm Từ điển do ông biên soạn có nhiều nhà nghiên cứu chỉ ra những sai sót. Hoàng Tuấn Công không phải là người đầu tiên viết về những sai sót này, nhưng có lẽ sẽ là người cuối cùng căn bản khép lại những vấn đề đã kéo dài hàng chục năm qua với nhiều tranh cãi.\r\n\r\nTừ Điển Tiếng Việt Của GS. Nguyễn Lân - Phê Bình Và Khảo Cứu là những phê bình và khảo cứu về việc giải nghĩa tiếng Việt, gồm có 5 phần:\r\n\r\n- Phần 1: Phê bình, khảo cứu “Từ điển thành ngữ và tục ngữ Việt Nam”\r\n\r\n- Phần 2: Phê bình, khảo cứu “Từ điển từ và ngữ Hán Việt”, chỉ ra những sai sót khi giải nghĩa từ ngữ Hán Việt, yếu tố Hán Việt (chưa từng được công bố trên Blog Tuấn Công thư phòng)\r\n\r\n- Phần 3: Phê bình, khảo cứu “Từ điển từ và ngữ Việt Nam”\r\n\r\n- Phần 4: Chính tả trong từ điển tiếng Việt của Gs. Nguyễn Lân; chỉ ra những lỗi chính tả do phát âm sai, x và s, ch và tr...\r\n\r\n- Phần 5: Thử lý giải những sai lầm khó hiểu của nhà biên soạn từ điển – Gs. Nguyễn Lân', 12, 4, '2023-11-19 07:42:30', '2023-11-19 07:42:30', NULL),
(56, 'Từ Điển Steam Song Ngữ - Kĩ Thuật', 45000, 0, 2023, 200, 'image/1700408140images.jpg', 0, 0, 'Chìa khóa để thành công trong bất kì môn học nào là hiểu rõ các thuật ngữ được sử dụng. Bộ sách Từ Điển STEAM Song Ngữ giải thích các từ vựng chính thường được sử dụng trong các lĩnh vực khoa học, công nghệ, kĩ thuật, toán học và nghệ thuật. Với chú giải rõ ràng, ngắn gọn và đơn giản, đi kèm với hình ảnh hoặc minh họa trực quan, Từ Điển STEAM Song Ngữ giúp ghi nhớ các từ vựng, thuật ngữ khoa học dễ dàng và sâu sắc hơn.\r\n\r\nTìm đọc trọn bộ Từ Điển STEAM Song Ngữ (5 cuốn):\r\n\r\n- Từ Điển STEAM Song Ngữ - Khoa Học\r\n\r\n- Từ Điển STEAM Song Ngữ - Công Nghệ\r\n\r\n- Từ Điển STEAM Song Ngữ - Kĩ Thuật\r\n\r\n- Từ Điển STEAM Song Ngữ - Nghệ Thuật\r\n\r\n- Từ Điển STEAM Song Ngữ - Toán Học', 13, 1, '2023-11-19 08:35:40', '2023-11-19 08:35:40', NULL),
(57, 'Từ Điển Steam Song Ngữ - Nghệ Thuật', 45000, 0, 2023, 99, 'image/1700408250tu-dien-steam-song-ngu_nghe-thuat_d95d0baa0a044669a4e910d103cf03d1_master.jpg', 1, 0, 'Chìa khóa để thành công trong bất kì môn học nào là hiểu rõ các thuật ngữ được sử dụng. Bộ sách Từ Điển STEAM Song Ngữ giải thích các từ vựng chính thường được sử dụng trong các lĩnh vực khoa học, công nghệ, kĩ thuật, toán học và nghệ thuật. Với chú giải rõ ràng, ngắn gọn và đơn giản, đi kèm với hình ảnh hoặc minh họa trực quan, Từ Điển STEAM Song Ngữ giúp ghi nhớ các từ vựng, thuật ngữ khoa học dễ dàng và sâu sắc hơn.\r\n\r\nTìm đọc trọn bộ Từ Điển STEAM Song Ngữ (5 cuốn):\r\n\r\n- Từ Điển STEAM Song Ngữ - Khoa Học\r\n\r\n- Từ Điển STEAM Song Ngữ - Công Nghệ\r\n\r\n- Từ Điển STEAM Song Ngữ - Kĩ Thuật\r\n\r\n- Từ Điển STEAM Song Ngữ - Nghệ Thuật\r\n\r\n- Từ Điển STEAM Song Ngữ - Toán Học', 13, 1, '2023-11-19 08:37:30', '2023-11-19 09:35:51', NULL),
(58, 'Từ Điển Steam Song Ngữ - Công Nghệ', 45000, 0, 2023, 100, 'image/1700408335tu_dien_steam_song_ngu_cong_nghe.jpg', 0, 0, 'Chìa khóa để thành công trong bất kì môn học nào là hiểu rõ các thuật ngữ được sử dụng. Bộ sách Từ Điển STEAM Song Ngữ giải thích các từ vựng chính thường được sử dụng trong các lĩnh vực khoa học, công nghệ, kĩ thuật, toán học và nghệ thuật. Với chú giải rõ ràng, ngắn gọn và đơn giản, đi kèm với hình ảnh hoặc minh họa trực quan, Từ Điển STEAM Song Ngữ giúp ghi nhớ các từ vựng, thuật ngữ khoa học dễ dàng và sâu sắc hơn.\r\n\r\nTìm đọc trọn bộ Từ Điển STEAM Song Ngữ (5 cuốn):\r\n\r\n- Từ Điển STEAM Song Ngữ - Khoa Học\r\n\r\n- Từ Điển STEAM Song Ngữ - Công Nghệ\r\n\r\n- Từ Điển STEAM Song Ngữ - Kĩ Thuật\r\n\r\n- Từ Điển STEAM Song Ngữ - Nghệ Thuật\r\n\r\n- Từ Điển STEAM Song Ngữ - Toán Học', 13, 1, '2023-11-19 08:38:55', '2023-11-19 08:38:55', NULL),
(59, 'Tóm Tắt Kiến Thức Toán Phổ Thông', 145000, 0, 2021, 200, 'image/1700408475image_238099.jpg', 0, 0, 'Đúng như tên gọi, Tóm tắt kiến thức toán phổ thông tổng hợp những kiến thức mà học sinh cần có trong quá trình học tập môn Toán ở hai bậc học Trung học cơ sở và Trung học phổ thông. Đó là những kiến thức căn bản không chỉ giúp học sinh giải quyết các bài tập, các yêu cầu học và thi trong nhà trường, mà còn giúp các em hình thành một nền tảng tư duy toán học có thể áp dụng vào thực tiễn đời sống.\r\n\r\nĐiểm độc đáo là cuốn sách được thiết kế theo phong cách ghi chép sổ tay bullet journal. Thay vì những gạch đầu dòng nhàm chán, các kiến thức được tổng hợp luôn gắn với những ký hiệu sinh động, những tranh ảnh minh họa bắt mắt. Sẽ thật thú vị khi bạn phát hiện ra việc gắn kết số nguyên tố với hình ảnh những chú ve sầu không phải là ngẫu nhiên, hay như hình vẽ hyperbol lại được gợi lên qua những rặng san hô xinh đẹp.\r\n\r\nViệc học tập môn Toán ở nhà trường phổ thông có thể không dễ dàng. Nhưng với cuốn sách này trong tay, việc học toán chắc chắn sẽ vui vẻ và thú vị hơn rất nhiều.', 13, 7, '2023-11-19 08:41:15', '2023-11-19 08:41:15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `cate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `description`, `cate_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Truyện Tranh', 'Truyện tranh là một hình thức nghệ thuật sử dụng hình ảnh và văn bản để diễn đạt ý tưởng, kể chuyện hoặc truyền đạt thông tin. Truyện tranh có thể có nhiều dạng và thể loại khác nhau, từ comic strip, truyện tranh chính trị, truyện tranh hài hước, đến sách truyện tranh, tiểu thuyết đồ họa, truyện tranh trực tuyến… Truyện tranh có nguồn gốc từ nhiều nền văn hóa khác nhau, nhưng phát triển mạnh mẽ nhất ở Hoa Kỳ, Tây Âu (đặc biệt là Pháp và Bỉ) và Nhật Bản. Truyện tranh cũng là một phương tiện giải trí, giáo dục và truyền cảm hứng cho nhiều người trên thế giới.', NULL, '2023-11-17 01:18:47', '2023-11-17 01:18:47', NULL),
(2, 'Văn Học', 'Văn học là một khái niệm rộng lớn, bao gồm nhiều loại hình, thể loại và phong cách khác nhau. Văn học có thể được coi là hồ sơ bằng văn bản, cho dù bản thân văn học là thực tế hay hư cấu, vẫn hoàn toàn có thể giải mã các sự kiện thông qua những thứ như hành động và lời nói của nhân vật hoặc phong cách viết của tác giả và hàm ý đằng sau các từ ngữ.', NULL, '2023-11-17 01:21:04', '2023-11-17 01:21:04', NULL),
(3, 'Văn Học Việt Nam', 'Văn học Việt Nam là một lĩnh vực rộng lớn và phong phú, bao gồm nhiều loại hình, thể loại và phong cách khác nhau. Văn học Việt Nam có nguồn gốc từ văn học dân gian, là nền tảng của văn học viết, là chặng đầu của nền văn học dân tộc', 2, '2023-11-17 01:24:03', '2023-11-17 01:24:03', NULL),
(4, 'Văn Học Nước Ngoài', 'Văn học nước ngoài là một khái niệm chung để chỉ những tác phẩm văn học được sáng tác bởi những tác giả không phải người Việt Nam, hoặc được viết bằng những ngôn ngữ khác tiếng Việt. Văn học nước ngoài có thể được chia thành nhiều nhóm theo quốc gia, vùng lãnh thổ, ngôn ngữ, văn hóa, thời kỳ, thể loại, phong cách… Văn học nước ngoài là một nguồn tài nguyên quý giá cho người đọc, giúp mở rộng tầm nhìn, hiểu biết, tinh thần và trí tưởng tượng.', 2, '2023-11-17 01:25:37', '2023-11-17 01:25:37', NULL),
(5, 'Kinh tế', 'Sách về lĩnh vực kinh tế là những cuốn sách giúp bạn hiểu rõ hơn về các khái niệm, nguyên lý, mô hình, chính sách và sự kiện liên quan đến hoạt động kinh tế của cá nhân, doanh nghiệp, quốc gia và thế giới.', NULL, '2023-11-17 01:28:37', '2023-11-17 01:28:37', NULL),
(6, 'Sách - Truyện thiếu nhi', 'Sách - truyện thiếu nhi là kho tàng kiến thức phong phú cung cấp cho trẻ những kiến thức rộng lớn từ thế giới xung quanh giúp trẻ khám phá, học hỏi, góp phần quan trọng trong quá trình hình thành và phát triển nhân cách. Trong mục sách – truyện thiếu nhi tại nhà sách online Bookbuy quy tụ rất nhiều đầu sách văn học, kỹ năng cho trẻ như: Tuyển Truyện Hay Dành Cho Thiếu Nhi, Truyện Cổ tích Việt Nam, tủ sách Sống Đẹp Mỗi Ngày, Cẩm nang sinh hoạt bằng tranh cho bé,…', NULL, '2023-11-17 01:30:11', '2023-11-17 01:30:11', NULL),
(7, 'Sách Teen', 'Sách teen là những cuốn sách dành cho độc giả ở độ tuổi thiếu niên, thường từ 13 đến 18 tuổi. Sách teen có thể thuộc nhiều thể loại khác nhau, như tiểu thuyết, truyện ngắn, truyện tranh, sách phi hư cấu, sách hướng dẫn… Sách teen thường xoay quanh những vấn đề mà tuổi teen quan tâm, như tình bạn, tình yêu, gia đình, học tập, ước mơ, xã hội, giới tính, nhận thức bản thân… Sách teen cũng có thể mang lại những giá trị giáo dục, giải trí, cảm hứng và động lực cho độc giả.', NULL, '2023-11-17 01:34:57', '2023-11-17 01:34:57', NULL),
(8, 'Kỹ năng sống', 'Sách kỹ năng sống là những cuốn sách giúp bạn học cách đối mặt, giải quyết và vượt qua những khó khăn, thách thức và cơ hội trong cuộc sống.', NULL, '2023-11-17 01:39:41', '2023-11-17 01:39:41', NULL),
(9, 'Y học - Sức khỏe', 'Sách y học - sức khỏe là những cuốn sách giúp bạn nâng cao kiến thức, kỹ năng và thái độ liên quan đến việc bảo vệ, duy trì và cải thiện sức khỏe của bản thân và cộng đồng.', NULL, '2023-11-17 01:43:34', '2023-11-17 01:43:34', NULL),
(10, 'Ngoại ngữ', 'Sách ngoại ngữ là những cuốn sách giúp bạn học và nâng cao ngoại ngữ, bao gồm nghe, nói, đọc, viết và ngữ pháp.', NULL, '2023-11-17 01:46:22', '2023-11-17 01:46:22', NULL),
(11, 'Tin học', 'Sách tin học là những cuốn sách giúp bạn học và nâng cao các kiến thức, kỹ năng và ứng dụng của tin học trong các lĩnh vực khác nhau, như văn phòng, thiết kế, lập trình, an ninh, mạng, trí tuệ nhân tạo…', NULL, '2023-11-17 01:47:39', '2023-11-17 01:47:39', NULL),
(12, 'Từ điển', 'Từ điển là một loại sách hoặc văn bản điện tử giúp bạn tìm kiếm các từ có nghĩa tương tự hoặc giải thích ý nghĩa của các từ ngữ trong một hoặc nhiều ngôn ngữ khác nhau. Từ điển có thể cung cấp thêm các thông tin về cách phát âm, ngữ pháp, từ nguyên, cách sử dụng và các ví dụ của các từ ngữ. Từ điển có thể được sắp xếp theo thứ tự chữ cái, bộ, số nét, âm tiết, vần hoặc theo các tiêu chí khác tùy thuộc vào ngôn ngữ và loại từ điển. Từ điển là một công cụ hữu ích để học tập, nghiên cứu, giao tiếp và văn hóa.', NULL, '2023-11-17 01:54:40', '2023-11-17 01:54:40', NULL),
(13, 'Sách giáo khoa - Sách tham khảo', 'Sách giáo khoa là loại sách chuẩn cho một ngành học, nhằm cung cấp kiến thức và được phân theo đối tượng sử dụng hay chủ đề môn học. Tất cả các kiến thức trong sách giáo khoa đều được tổng hợp theo hệ thống kiến thức khoa học, chính xác, phù hợp với trình độ của từng cấp lớp. Tủ sách giáo khoa của Bookbuy.vn hứa hẹn sẽ cung cấp đầy đủ cho bạn đọc tất cả sách giáo khoa từ cấp 1 đến cấp 3, cùng với những bộ sách bài tập song song do Nhà xuất bản Giáo Dục ấn hành.', NULL, '2023-11-17 01:55:19', '2023-11-17 01:55:19', NULL),
(14, 'Truyện Ngắn', 'Truyện ngắn Việt Nam là một thể loại văn học phát triển mạnh mẽ ở Việt Nam từ đầu thế kỷ XX đến nay.', 3, '2023-11-17 02:01:02', '2023-11-17 02:01:02', NULL),
(15, 'Tiểu thuyết, truyện dài', 'Theo nghĩa hiện đại, tiểu thuyết là một loại hình văn xuôi dài, có cốt truyện, nhân vật và kết thúc, phản ánh bức tranh xã hội và cuộc sống con người qua góc nhìn của tác giả. Truyện dài là một khái niệm không chính thức để chỉ những tác phẩm văn xuôi có độ dài lớn hơn truyện ngắn nhưng nhỏ hơn tiểu thuyết. Truyện dài thường có một cốt truyện đơn giản, một vài nhân vật chính và một số nhân vật phụ, một không gian và thời gian tương đối hạn chế', 3, '2023-11-17 02:11:34', '2023-11-17 02:11:34', NULL),
(16, 'Thơ ca', 'Thơ ca là một loại hình nghệ thuật sử dụng ngôn ngữ để tạo ra những hiệu ứng âm thanh, nhịp điệu, hình ảnh và cảm xúc.', 3, '2023-11-17 02:13:07', '2023-11-17 02:13:07', NULL),
(17, 'Tác phẩm kinh điển', 'Tác phẩm kinh điển là những tác phẩm văn học hay nghệ thuật có giá trị bất hủ, tiêu biểu và ảnh hưởng cho các tác phẩm khác cùng thể loại. Tác phẩm kinh điển thường phản ánh đa dạng và sâu sắc về cuộc sống, tâm lý, tư tưởng, văn hóa, lịch sử, xã hội của con người qua góc nhìn của tác giả.', 3, '2023-11-17 02:16:28', '2023-11-17 02:16:28', NULL),
(18, 'Truyện cười', 'Truyện cười là một loại hình văn học dân gian, có tác dụng gây cười, khen chê và giải trí cho người đọc. Truyện cười có nhiều dạng và thể loại khác nhau, từ truyện khôi hài, truyện tiếu lâm, truyện trào phúng, truyện châm biếm, truyện đả kích, truyện Trạng… Truyện cười phản ánh đa dạng và sâu sắc về cuộc sống, tâm lý, tư tưởng, văn hóa, lịch sử, xã hội của người Việt Nam qua các giai đoạn khác nhau. Truyện cười sử dụng ngôn ngữ giàu biểu cảm, sáng tạo, phong phú, có tính địa phương và dân tộc.', 3, '2023-11-17 02:18:48', '2023-11-17 02:18:48', NULL),
(19, 'Kiếm hiệp - Võ hiệp', 'Kiếm hiệp, võ hiệp là một thể loại văn hóa đại chúng Hoa ngữ nói về những cuộc phiêu du của những hiệp khách (cao thủ, kiếm khách) trên giang hồ. Những hiệp khách này thường tuân theo quy tắc làm điều đúng, đấu tranh cho lẽ phải, xóa bỏ đàn áp, sửa chữa cái sai và khắc phục những lỗi lầm trong quá khứ.', 4, '2023-11-17 02:35:48', '2023-11-17 02:35:48', NULL),
(20, 'Truyện ngôn tình', 'Truyện ngôn tình là một thể loại tiểu thuyết tình cảm bắt nguồn từ Trung Quốc, nói về những mối quan hệ tình yêu giữa nam và nữ1. Thể loại này thường có nội dung lãng mạn, sến súa, hài hước, nhẹ nhàng, nhưng cũng có thể có những yếu tố phiêu lưu, huyền huyễn, cổ trang, hiện đại, xuyên không, trọng sinh', 4, '2023-11-17 02:38:10', '2023-11-17 02:38:10', NULL),
(21, 'Nhân vật & bài học kinh doanh', 'Sách Nhân vật & bài học kinh doanh là một thể loại sách giúp bạn đọc hiểu được những câu chuyện thành công, thất bại, khó khăn và cách giải quyết của những nhân vật nổi tiếng trong lĩnh vực kinh doanh.', 5, '2023-11-17 09:14:18', '2023-11-17 09:14:18', NULL),
(22, 'Kế toán', 'Sách kế toán là một loại sách cung cấp kiến thức, kỹ năng, kinh nghiệm và tư duy về lĩnh vực kế toán. Sách kế toán có thể giúp bạn đọc nắm bắt các nguyên lý, quy định, thủ tục và ứng dụng của kế toán trong thực tế. Sách kế toán cũng có thể giúp bạn đọc nâng cao năng lực quản trị, tư vấn và phân tích tài chính. Sách kế toán có nhiều thể loại khác nhau, phù hợp với nhu cầu và mục đích của từng đối tượng đọc.', 5, '2023-11-17 09:19:22', '2023-11-17 09:19:22', NULL),
(23, 'Khởi nghiệp & làm giàu', 'Sách khởi nghiệp & làm giàu là một loại sách cung cấp những kiến thức, kinh nghiệm, bí quyết và cảm hứng về việc khởi nghiệp, kinh doanh và tạo ra sự giàu có. Sách khởi nghiệp & làm giàu có thể giúp bạn đọc hình thành tư duy sáng tạo, chiến lược, quản lý và lãnh đạo, cũng như đối mặt với những thách thức, rủi ro và thất bại trong con đường khởi nghiệp.', 5, '2023-11-17 09:21:14', '2023-11-17 09:21:14', NULL),
(24, 'Chứng  khoán, đầu tư, bất động sản', 'Sách chứng khoán, đầu tư, bất động sản là một loại sách cung cấp những kiến thức, kinh nghiệm, chiến lược và bí quyết về việc đầu tư vào các lĩnh vực liên quan đến tài chính, thị trường và bất động sản.', 5, '2023-11-17 09:26:38', '2023-11-17 09:26:38', NULL),
(25, 'Văn học thiếu nhi', 'Sách văn học thiếu nhi là một loại sách dành cho độc giả nhỏ tuổi, thường có nội dung giáo dục, giải trí, khơi gợi trí tưởng tượng và tình cảm. Sách văn học thiếu nhi có thể bao gồm nhiều thể loại như truyện cổ tích, truyện phiêu lưu, truyện hài hước, truyện kỳ ảo, truyện lịch sử, truyện thơ, truyện tranh, v.v. Sách văn học thiếu nhi có thể được viết bởi các tác giả trong nước hoặc nước ngoài, có thể được dịch thuật hoặc sáng tác.', 6, '2023-11-17 09:50:35', '2023-11-17 09:50:35', NULL),
(26, 'Tranh truyện', 'Tranh truyện thiếu nhi là một dạng truyện kết hợp giữa hình ảnh và chữ viết để kể một câu chuyện hoặc truyền đạt một thông điệp cho độc giả nhỏ tuổi. Tranh truyện thiếu nhi có thể có nhiều thể loại, phong cách và nguồn gốc khác nhau, nhưng thường được phân loại theo xuất xứ của tác giả hoặc thị trường mục tiêu, ví dụ như manga (Nhật Bản), manhwa (Hàn Quốc), manhua (Trung Quốc), comic (Mỹ), v.v.', 6, '2023-11-17 10:06:09', '2023-11-17 10:06:09', NULL),
(27, 'Văn học  teen', 'Sách văn học teen là một loại sách dành cho độc giả ở độ tuổi mới lớn, thường có nội dung xoay quanh những vấn đề, tình huống, cảm xúc và mối quan hệ của tuổi teen. Sách văn học teen có thể có nhiều thể loại khác nhau, như tình cảm, hài hước, phiêu lưu, kỳ ảo, trinh thám, v.v. Sách văn học teen có thể giúp độc giả giải trí, học hỏi, thư giãn, cũng như thấu hiểu và đối diện với những thách thức, khó khăn và thay đổi của tuổi dậy thì.', 7, '2023-11-17 10:14:59', '2023-11-17 10:14:59', NULL),
(28, 'Tâm lý tuổi teen', 'Sách tâm lý tuổi teen là một loại sách giúp độc giả ở độ tuổi mới lớn hiểu được những biến đổi, khó khăn, cảm xúc và mối quan hệ của mình và người khác. Sách tâm lý tuổi teen có thể có nhiều thể loại, phong cách và tác giả khác nhau, nhưng thường được viết bởi những chuyên gia, nhà văn hoặc người có kinh nghiệm trong lĩnh vực tâm lý, giáo dục hoặc văn học. Sách tâm lý tuổi teen có thể giúp độc giả giải trí, học hỏi, thư giãn, cũng như thấu hiểu và đối diện với những thách thức, rủi ro và cơ hội của tuổi dậy thì.', 7, '2023-11-17 10:17:45', '2023-11-17 10:17:45', NULL),
(29, 'Cơ bản', 'Sách tin học cơ bản là một loại sách cung cấp những kiến thức, kỹ năng và kinh nghiệm về lĩnh vực tin học, bao gồm các chủ đề như: cơ sở dữ liệu, mạng máy tính, lập trình, thiết kế đồ họa, văn phòng, internet, v.v. Sách tin học cơ bản có thể giúp bạn đọc nắm bắt được các khái niệm, nguyên lý, phương pháp và ứng dụng của tin học trong thực tế.', 11, '2023-11-17 12:06:22', '2023-11-17 12:06:22', NULL),
(30, 'Đồ Họa', 'Một cuốn sách đồ họa là một loại sách chuyên về thiết kế đồ họa, một lĩnh vực nghệ thuật sử dụng các kỹ thuật hình ảnh, chữ viết, màu sắc, hình dạng, biểu tượng, bố cục và phông chữ để truyền đạt thông điệp, ý tưởng, cảm xúc hoặc thương hiệu.', 11, '2023-11-18 11:18:54', '2023-11-18 11:18:54', NULL),
(31, 'Cơ sở dữ liệu', 'Một cuốn sách cơ sở dữ liệu là một loại sách nói về các khái niệm, nguyên lý, phương pháp, công cụ và ứng dụng liên quan đến việc lưu trữ, truy vấn, xử lý và phân tích dữ liệu trong các hệ thống máy tính.', 11, '2023-11-18 11:21:01', '2023-11-18 11:21:01', NULL),
(32, 'Lập trình & phần mềm ứng dụng', 'Lập trình và phần mềm ứng dụng là hai khái niệm có liên quan chặt chẽ với nhau. Lập trình là công việc sử dụng các ngôn ngữ lập trình để viết ra các đoạn mã lệnh (code) theo một trình tự nhất định, nhằm tạo ra các chương trình, phần mềm, ứng dụng, trang web, hoặc các sản phẩm khác chạy trên máy tính, điện thoại, hay các thiết bị thông minh khác. Phần mềm ứng dụng là một loại phần mềm được thiết kế để đáp ứng một nhu cầu cụ thể của người dùng, như giải trí, học tập, làm việc, giao tiếp, hay quản lý dữ liệu.', 11, '2023-11-18 11:22:55', '2023-11-18 11:22:55', NULL),
(33, 'Lập trình web', 'Một cuốn sách lập trình web là một loại sách nói về các khái niệm, kỹ năng, công nghệ và ứng dụng liên quan đến việc tạo ra các trang web trên internet. Có nhiều loại sách lập trình web khác nhau, tùy thuộc vào mục đích, đối tượng, nội dung và phương pháp trình bày của chúng.', 11, '2023-11-18 11:24:33', '2023-11-18 11:24:33', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_images`
--

CREATE TABLE `list_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `list_images`
--

INSERT INTO `list_images` (`id`, `image`, `book_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'image/1700332479b29f4f339ff601bab807929db0afc777.jpg', 1, '2023-11-18 11:34:39', '2023-11-18 11:34:39', NULL),
(2, 'image/1700336006ff9e37e0c251a6c4158d3bed59f1966c.jpg', 2, '2023-11-18 12:33:26', '2023-11-18 12:33:26', NULL),
(3, 'image/1700342645troi-nguyen-ngoc-tu-5.jpg', 12, '2023-11-18 14:24:05', '2023-11-18 14:24:05', NULL),
(4, 'image/1700343541tải xuống (1).jpg', 14, '2023-11-18 14:39:01', '2023-11-18 14:39:01', NULL),
(5, 'image/17003435416119aa49f78fcaf7238be932cfb72d9a.jpg_720x720q80.jpg', 14, '2023-11-18 14:39:01', '2023-11-18 14:39:01', NULL),
(6, 'image/1700347897goc_san_va_khoang_troi_ok-b4_fd5e787dce074ff283118e2f391f048e.jpg', 16, '2023-11-18 15:51:37', '2023-11-18 15:51:37', NULL),
(7, 'image/1700347897goc-san-va-khoang-troi-tinh-tuyen-full.jpg', 16, '2023-11-18 15:51:37', '2023-11-18 15:51:37', NULL),
(8, 'image/1700348272dat-rung-phuong-nam-phien-ban-dien-anh-2.jpg', 18, '2023-11-18 15:57:52', '2023-11-18 15:57:52', NULL),
(9, 'image/1700348272dat-rung-phuong-nam-phien-ban-dien-anh-4.jpg', 18, '2023-11-18 15:57:52', '2023-11-18 15:57:52', NULL),
(10, 'image/17003484337c87698740bf5e9a6a0ef0a2bf1aaeac.jpg', 19, '2023-11-18 16:00:33', '2023-11-18 16:00:33', NULL),
(11, 'image/1700348433d5af241a3514bce54ebfdfd6e063792c.jpg', 19, '2023-11-18 16:00:33', '2023-11-18 16:00:33', NULL),
(12, 'image/1700349112tải xuống (2).jpg', 22, '2023-11-18 16:11:52', '2023-11-18 16:11:52', NULL),
(13, 'image/1700349112b_a-4-d_u-v_t_1.jpg', 22, '2023-11-18 16:11:52', '2023-11-18 16:11:52', NULL),
(14, 'image/1700349112b_a-c_ng.jpg', 22, '2023-11-18 16:11:52', '2023-11-18 16:11:52', NULL),
(15, 'image/17003509781956540d8988b07763f61d0b0c4ccf82.jpg', 28, '2023-11-18 16:42:58', '2023-11-18 16:42:58', NULL),
(16, 'image/1700350978tải xuống (3).jpg', 28, '2023-11-18 16:42:58', '2023-11-18 16:42:58', NULL),
(17, 'image/1700351990nguyen-tac-co-ban-trong-dau-tu-6_a204438de97a4024885196690aa89d1a_master.png', 31, '2023-11-18 16:59:50', '2023-11-18 16:59:50', NULL),
(18, 'image/1700401748l_185453ec-1fd5-4ee3-9eb4-327da3258f97.jpg', 37, '2023-11-19 06:49:08', '2023-11-19 06:49:08', NULL),
(19, 'image/1700402087hanh-trinh-truong-thanh-30-quy-tac-phat-trien-danh-cho-con-trai-tuoi-day-thi-5.jpg', 39, '2023-11-19 06:54:47', '2023-11-19 06:54:47', NULL),
(20, 'image/1700402336915c26e4f42487079f24bc59054f98b5.jpg', 40, '2023-11-19 06:58:56', '2023-11-19 06:58:56', NULL),
(21, 'image/1700402605giao-tiep-thong-minh-len-tieng-dung-noi-im-lang-dung-luc-2.jpg', 42, '2023-11-19 07:03:25', '2023-11-19 07:03:25', NULL),
(22, 'image/1700402739bia_an_chuan_it_benh_b1.jpg', 43, '2023-11-19 07:05:39', '2023-11-19 07:05:39', NULL),
(23, 'image/1700402739tải xuống (6).jpg', 43, '2023-11-19 07:05:39', '2023-11-19 07:05:39', NULL),
(24, 'image/1700402892co-the-tu-chua-lanh-phac-do-thanh-loc-cong-thuc-giai-cuu-nao-full.jpg', 44, '2023-11-19 07:08:12', '2023-11-19 07:08:12', NULL),
(25, 'image/17004043392021_07_27_11_27_53_8-390x510.jpg', 52, '2023-11-19 07:32:19', '2023-11-19 07:32:19', NULL),
(26, 'image/1700408475tom-tat-kien-thuc-toan-pho-thong-02.jpg', 59, '2023-11-19 08:41:15', '2023-11-19 08:41:15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '2023_09_21_155027_create_categories_table', 1),
(21, '2023_09_21_160950_create_publishers_table', 1),
(22, '2023_09_21_161458_create_books_table', 1),
(23, '2023_09_21_162343_create_reviews_table', 1),
(24, '2023_09_21_162557_create_authors_table', 1),
(25, '2023_09_21_163216_create_participates_table', 1),
(26, '2023_09_21_163750_create_list_images_table', 1),
(27, '2023_09_21_164017_create_promotions_table', 1),
(28, '2023_09_21_164409_create_orders_table', 1),
(29, '2023_09_21_164810_create_order_details_table', 1),
(30, '2023_10_04_165859_create_carts_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_money` int(11) NOT NULL,
  `transport_fee` int(11) NOT NULL,
  `discount_code` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `delivery` tinyint(4) NOT NULL,
  `recipient_name` varchar(191) DEFAULT NULL,
  `recipient_phone_number` varchar(191) DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `payment_method` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_money`, `transport_fee`, `discount_code`, `status`, `delivery`, `recipient_name`, `recipient_phone_number`, `delivery_address`, `payment_method`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 269000, 30000, '', 1, 0, 'Tạ Hải Nam', '0987654321', 'Khánh Hội, Yên Khánh, Ninh Bình', 1, '2023-11-19 09:15:36', '2023-11-19 09:16:32', NULL),
(2, 3, 144000, 30000, '', 2, 4, 'Vũ Anh Tú', '0989654321', 'Khánh Thiện, Yên Khánh, Ninh Bình', 1, '2023-11-19 09:31:30', '2023-11-19 09:32:07', NULL),
(3, 3, 395000, 30000, '', 1, 3, 'Vũ Anh Tú', '0989654321', 'Khánh Thiện, Yên Khánh, Ninh Bình', 0, '2023-11-19 09:33:03', '2023-11-19 09:47:19', NULL),
(4, 3, 205000, 30000, '', 1, 2, 'Vũ Anh Tú', '0989654321', 'Khánh Thiện, Yên Khánh, Ninh Bình', 1, '2023-11-19 09:35:10', '2023-11-19 10:28:05', NULL),
(5, 4, 72000, 30000, 'Black_Friday_50', 1, 3, 'Phạm Trung Kiên', '0987656321', 'Khánh Hồng, Yên Khánh, Ninh Bình', 1, '2023-11-19 10:25:01', '2023-11-19 10:28:02', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `book_id`, `quantity`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 17, 1, 100000, '2023-11-19 09:15:36', '2023-11-19 09:15:36', NULL),
(2, 1, 40, 1, 199000, '2023-11-19 09:15:36', '2023-11-19 09:15:36', NULL),
(3, 2, 17, 1, 100000, '2023-11-19 09:31:30', '2023-11-19 09:31:30', NULL),
(4, 2, 8, 2, 22000, '2023-11-19 09:31:30', '2023-11-19 09:31:30', NULL),
(5, 3, 17, 1, 100000, '2023-11-19 09:33:03', '2023-11-19 09:33:03', NULL),
(6, 3, 8, 1, 22000, '2023-11-19 09:33:03', '2023-11-19 09:33:03', NULL),
(7, 3, 14, 1, 250000, '2023-11-19 09:33:03', '2023-11-19 09:33:03', NULL),
(8, 3, 52, 1, 100000, '2023-11-19 09:33:03', '2023-11-19 09:33:03', NULL),
(9, 4, 57, 1, 45000, '2023-11-19 09:35:10', '2023-11-19 09:35:10', NULL),
(10, 4, 54, 1, 200000, '2023-11-19 09:35:10', '2023-11-19 09:35:10', NULL),
(11, 5, 17, 1, 100000, '2023-11-19 10:25:01', '2023-11-19 10:25:01', NULL),
(12, 5, 2, 1, 30000, '2023-11-19 10:25:01', '2023-11-19 10:25:01', NULL),
(13, 5, 8, 1, 22000, '2023-11-19 10:25:01', '2023-11-19 10:25:01', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `participates`
--

CREATE TABLE `participates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `participates`
--

INSERT INTO `participates` (`id`, `author_id`, `book_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 1, '2023-11-18 12:10:10', '2023-11-18 12:10:10', NULL),
(3, 1, 2, '2023-11-18 12:33:26', '2023-11-18 12:33:26', NULL),
(4, 1, 3, '2023-11-18 13:10:47', '2023-11-18 13:10:47', NULL),
(5, 1, 4, '2023-11-18 13:14:17', '2023-11-18 13:14:17', NULL),
(6, 1, 5, '2023-11-18 13:18:23', '2023-11-18 13:18:23', NULL),
(7, 1, 6, '2023-11-18 13:20:29', '2023-11-18 13:20:29', NULL),
(8, 1, 7, '2023-11-18 13:44:04', '2023-11-18 13:44:04', NULL),
(9, 2, 7, '2023-11-18 13:44:04', '2023-11-18 13:44:04', NULL),
(10, 1, 8, '2023-11-18 13:46:04', '2023-11-18 13:46:04', NULL),
(11, 2, 8, '2023-11-18 13:46:04', '2023-11-18 13:46:04', NULL),
(12, 1, 9, '2023-11-18 13:47:37', '2023-11-18 13:47:37', NULL),
(13, 2, 9, '2023-11-18 13:47:37', '2023-11-18 13:47:37', NULL),
(14, 1, 10, '2023-11-18 13:49:22', '2023-11-18 13:49:22', NULL),
(15, 2, 10, '2023-11-18 13:49:22', '2023-11-18 13:49:22', NULL),
(16, 3, 11, '2023-11-18 14:17:35', '2023-11-18 14:17:35', NULL),
(17, 4, 12, '2023-11-18 14:24:05', '2023-11-18 14:24:05', NULL),
(18, 5, 13, '2023-11-18 14:27:37', '2023-11-18 14:27:37', NULL),
(19, 6, 14, '2023-11-18 14:39:01', '2023-11-18 14:39:01', NULL),
(20, 7, 15, '2023-11-18 15:01:56', '2023-11-18 15:01:56', NULL),
(21, 8, 16, '2023-11-18 15:51:37', '2023-11-18 15:51:37', NULL),
(22, 8, 17, '2023-11-18 15:53:45', '2023-11-18 15:53:45', NULL),
(23, 9, 18, '2023-11-18 15:57:52', '2023-11-18 15:57:52', NULL),
(24, 6, 19, '2023-11-18 16:00:33', '2023-11-18 16:00:33', NULL),
(25, 10, 20, '2023-11-18 16:02:33', '2023-11-18 16:02:33', NULL),
(26, 11, 21, '2023-11-18 16:05:19', '2023-11-18 16:05:19', NULL),
(27, 12, 22, '2023-11-18 16:11:52', '2023-11-18 16:11:52', NULL),
(28, 13, 23, '2023-11-18 16:15:21', '2023-11-18 16:15:21', NULL),
(29, 14, 24, '2023-11-18 16:22:31', '2023-11-18 16:22:31', NULL),
(30, 14, 25, '2023-11-18 16:23:29', '2023-11-18 16:23:29', NULL),
(31, 15, 26, '2023-11-18 16:35:36', '2023-11-18 16:35:36', NULL),
(32, 16, 27, '2023-11-18 16:38:11', '2023-11-18 16:38:11', NULL),
(33, 17, 28, '2023-11-18 16:42:58', '2023-11-18 16:42:58', NULL),
(34, 18, 29, '2023-11-18 16:51:57', '2023-11-18 16:51:57', NULL),
(35, 19, 29, '2023-11-18 16:51:57', '2023-11-18 16:51:57', NULL),
(36, 20, 29, '2023-11-18 16:51:57', '2023-11-18 16:51:57', NULL),
(37, 21, 30, '2023-11-18 16:57:02', '2023-11-18 16:57:02', NULL),
(39, 22, 31, '2023-11-18 17:00:35', '2023-11-18 17:00:35', NULL),
(40, 23, 32, '2023-11-19 06:38:55', '2023-11-19 06:38:55', NULL),
(41, 24, 33, '2023-11-19 06:41:18', '2023-11-19 06:41:18', NULL),
(42, 25, 33, '2023-11-19 06:41:18', '2023-11-19 06:41:18', NULL),
(43, 26, 34, '2023-11-19 06:43:48', '2023-11-19 06:43:48', NULL),
(44, 27, 34, '2023-11-19 06:43:48', '2023-11-19 06:43:48', NULL),
(45, 26, 35, '2023-11-19 06:44:43', '2023-11-19 06:44:43', NULL),
(46, 27, 35, '2023-11-19 06:44:43', '2023-11-19 06:44:43', NULL),
(47, 6, 36, '2023-11-19 06:46:49', '2023-11-19 06:46:49', NULL),
(48, 28, 37, '2023-11-19 06:49:08', '2023-11-19 06:49:08', NULL),
(49, 29, 38, '2023-11-19 06:53:29', '2023-11-19 06:53:29', NULL),
(50, 29, 39, '2023-11-19 06:54:47', '2023-11-19 06:54:47', NULL),
(51, 30, 40, '2023-11-19 06:58:56', '2023-11-19 06:58:56', NULL),
(52, 31, 41, '2023-11-19 07:00:57', '2023-11-19 07:00:57', NULL),
(53, 32, 42, '2023-11-19 07:03:25', '2023-11-19 07:03:25', NULL),
(54, 33, 43, '2023-11-19 07:05:39', '2023-11-19 07:05:39', NULL),
(55, 34, 44, '2023-11-19 07:08:12', '2023-11-19 07:08:12', NULL),
(56, 34, 45, '2023-11-19 07:09:53', '2023-11-19 07:09:53', NULL),
(57, 35, 46, '2023-11-19 07:13:33', '2023-11-19 07:13:33', NULL),
(58, 35, 47, '2023-11-19 07:14:55', '2023-11-19 07:14:55', NULL),
(59, 36, 48, '2023-11-19 07:16:50', '2023-11-19 07:16:50', NULL),
(60, 37, 49, '2023-11-19 07:22:44', '2023-11-19 07:22:44', NULL),
(61, 38, 50, '2023-11-19 07:25:05', '2023-11-19 07:25:05', NULL),
(62, 39, 51, '2023-11-19 07:30:04', '2023-11-19 07:30:04', NULL),
(63, 40, 52, '2023-11-19 07:32:19', '2023-11-19 07:32:19', NULL),
(64, 41, 53, '2023-11-19 07:36:18', '2023-11-19 07:36:18', NULL),
(65, 42, 54, '2023-11-19 07:40:15', '2023-11-19 07:40:15', NULL),
(66, 43, 54, '2023-11-19 07:40:15', '2023-11-19 07:40:15', NULL),
(67, 44, 55, '2023-11-19 07:42:30', '2023-11-19 07:42:30', NULL),
(68, 45, 56, '2023-11-19 08:35:40', '2023-11-19 08:35:40', NULL),
(69, 45, 57, '2023-11-19 08:37:30', '2023-11-19 08:37:30', NULL),
(70, 45, 58, '2023-11-19 08:38:55', '2023-11-19 08:38:55', NULL),
(71, 46, 59, '2023-11-19 08:41:15', '2023-11-19 08:41:15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_code` varchar(191) NOT NULL,
  `event` varchar(191) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `discount_percent` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `promotions`
--

INSERT INTO `promotions` (`id`, `discount_code`, `event`, `start`, `end`, `discount_percent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Black_Friday_50', 'Black Friday', '2023-11-20', '2023-11-30', 50, '2023-11-19 09:53:57', '2023-11-19 09:53:57', NULL),
(2, 'Teacher_20', 'Mừng ngày nhà giáo Việt Nam 20-11', '2023-11-20', '2023-11-25', 20, '2023-11-19 09:54:39', '2023-11-19 09:54:39', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publisher_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `publishers`
--

INSERT INTO `publishers` (`id`, `publisher_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nhà xuất bản Kim Đồng', '2023-11-18 11:26:52', '2023-11-18 11:26:52', NULL),
(2, 'Nhà xuất bản Trẻ', '2023-11-18 14:19:18', '2023-11-18 14:19:18', NULL),
(3, 'Nhà xuất bản Văn học', '2023-11-18 15:03:05', '2023-11-18 15:03:05', NULL),
(4, 'Nhà xuất bản Hội nhà văn', '2023-11-18 16:04:15', '2023-11-18 16:04:15', NULL),
(5, 'Nhà xuất bản Thanh niên', '2023-11-18 16:10:28', '2023-11-18 16:10:28', NULL),
(6, 'Nhà xuất bản Phụ nữ Việt Nam', '2023-11-18 16:21:06', '2023-11-18 16:21:06', NULL),
(7, 'Nhà xuất bản Thế giới', '2023-11-18 16:32:22', '2023-11-18 16:32:22', NULL),
(8, 'Nhầ xuất bản Dân trí', '2023-11-18 16:41:43', '2023-11-18 16:41:43', NULL),
(9, 'Nhầ xuất bản Tài chính', '2023-11-18 16:48:37', '2023-11-18 16:48:37', NULL),
(10, 'Nhà xuất bản Công thương', '2023-11-18 16:54:20', '2023-11-18 16:54:20', NULL),
(11, 'Nhà xuất bản Hồng Đức', '2023-11-19 06:52:08', '2023-11-19 06:52:08', NULL),
(12, 'Tổng Hợp Thành Phố Hồ Chí Minh', '2023-11-19 07:15:50', '2023-11-19 07:15:50', NULL),
(13, 'Nhà xuất bản Khoa học', '2023-11-19 07:28:33', '2023-11-19 07:28:33', NULL),
(14, 'Nhà xuất bản Khoa Học Kỹ Thuật', '2023-11-19 07:28:54', '2023-11-19 07:28:54', NULL),
(15, 'Nhà xuất bản tổng hợp TPHCM', '2023-11-19 07:38:09', '2023-11-19 07:38:09', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `book_id`, `user_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 17, 2, 5, 'Sách này rất hay nha mọi người,  phù hợp cho những người thích thơ ca', '2023-11-19 08:48:03', '2023-11-19 08:48:03'),
(2, 2, 2, 5, 'Truyện tuổi thơ của nhiều người rất hay', '2023-11-19 08:48:58', '2023-11-19 08:48:58'),
(3, 10, 2, 5, 'Lâu lắm rồi mới thấy lại tập truyện này đợt đó thấy hay quá mà giờ mới tìm thấy chỗ bán', '2023-11-19 09:01:51', '2023-11-19 09:01:51'),
(4, 58, 2, 4, 'AE nào thích đọc từ điển song ngữ về công nghệ thì nên mua quyển này nha. Rất hay', '2023-11-19 09:02:36', '2023-11-19 09:02:36'),
(5, 59, 2, 5, 'Sách này rất phù hợp cho các bạn đang cần  học lại kiến thức để thi đại học', '2023-11-19 09:03:29', '2023-11-19 09:03:29'),
(6, 24, 2, 5, 'Ai thích đọc truyện ngôn tình thì nên đọc qua quyển này 1 lần nha', '2023-11-19 09:08:24', '2023-11-19 09:08:24'),
(7, 21, 2, 4, 'Nên đọc nha mọi người', '2023-11-19 09:09:59', '2023-11-19 09:09:59'),
(8, 36, 2, 4, 'Tác phẩm rất hay và ý nghĩa', '2023-11-19 09:10:48', '2023-11-19 09:10:48'),
(9, 31, 2, 4, 'Học được những nguyên tắc này sẽ đầu tư tốt hơn nhé', '2023-11-19 09:15:18', '2023-11-19 09:15:18'),
(10, 59, 3, 4, 'Nên mua thử nha mọi người', '2023-11-19 09:27:23', '2023-11-19 09:27:23'),
(11, 58, 3, 4, 'Đã đọc thử, cảm nhận cũng được', '2023-11-19 09:27:45', '2023-11-19 09:27:45'),
(12, 40, 3, 4, 'Học tư duy để phát triển bản thân hơn qua cuốn sách này nha mọi người', '2023-11-19 09:28:54', '2023-11-19 09:28:54'),
(13, 8, 4, 5, 'Truyện này hay nha', '2023-11-19 09:58:01', '2023-11-19 09:58:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `birthday` date NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `password`, `address`, `birthday`, `gender`, `role`, `image`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Phạm Văn Tài', 'Ptai14032003@gmail.com', '0923896715', '$2y$10$cmnjn91IrW3Be4M4t3PTTeRt.gUf1C/ncTECJYDQ7KL0Ot8BJerGK', 'Yên Khánh, Ninh Bình', '2003-03-14', 1, 1, 'image/1700408610ace6d77042c7210658c290a11d9706f8.jpg', NULL, '2023-11-17 01:14:56', '2023-11-17 01:14:56', NULL),
(2, 'Tạ Hải Nam', 'hainam@gmail.com', '0987654321', '$2y$10$cmnjn91IrW3Be4M4t3PTTeRt.gUf1C/ncTECJYDQ7KL0Ot8BJerGK', 'Khánh Hội, Yên Khánh, Ninh Bình', '2003-06-16', 1, 0, 'image/17004087504a93ae0e9fbf96e68a84b4fad16ef748.jpg', NULL, '2023-11-19 08:45:50', '2023-11-19 08:45:50', NULL),
(3, 'Vũ Anh Tú', 'tuvu2801@gmail.com', '0989654321', '$2y$10$6kzZSAeRQUhG34Z8u6bcnOlmRVwYNiGI0d.dRjqXhykF3uStjh6oW', 'Khánh Thiện, Yên Khánh, Ninh Bình', '2003-01-28', 1, 0, 'image/1700411192f064d73ebec1795cde17035f3004ca09.jpg', NULL, '2023-11-19 09:26:32', '2023-11-19 09:26:32', NULL),
(4, 'Phạm Trung Kiên', 'kien0405@gmail.com', '0987656321', '$2y$10$FYIIvd4bqW4xdz1iGpVxa.j/aKMriarKCUdriYszv.cQweaUUIUOC', 'Khánh Hồng, Yên Khánh, Ninh Bình', '2003-05-04', 1, 0, 'image/1700412618b4d8af3ff8adf05f7bcf919f2867806e.jpg', NULL, '2023-11-19 09:50:18', '2023-11-19 09:50:18', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `books_book_title_unique` (`book_title`),
  ADD KEY `books_cate_id_foreign` (`cate_id`),
  ADD KEY `books_publisher_id_foreign` (`publisher_id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_book_id_foreign` (`book_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`),
  ADD KEY `categories_cate_id_foreign` (`cate_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `list_images`
--
ALTER TABLE `list_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_images_book_id_foreign` (`book_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_book_id_foreign` (`book_id`);

--
-- Chỉ mục cho bảng `participates`
--
ALTER TABLE `participates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participates_author_id_foreign` (`author_id`),
  ADD KEY `participates_book_id_foreign` (`book_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `publishers_publisher_name_unique` (`publisher_name`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_book_id_foreign` (`book_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `list_images`
--
ALTER TABLE `list_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `participates`
--
ALTER TABLE `participates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `books_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`);

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `list_images`
--
ALTER TABLE `list_images`
  ADD CONSTRAINT `list_images_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `participates`
--
ALTER TABLE `participates`
  ADD CONSTRAINT `participates_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `participates_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
