-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 02, 2023 lúc 07:01 AM
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
-- Cơ sở dữ liệu: `db_students`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add class', 7, 'add_class'),
(26, 'Can change class', 7, 'change_class'),
(27, 'Can delete class', 7, 'delete_class'),
(28, 'Can view class', 7, 'view_class'),
(29, 'Can add faculty', 8, 'add_faculty'),
(30, 'Can change faculty', 8, 'change_faculty'),
(31, 'Can delete faculty', 8, 'delete_faculty'),
(32, 'Can view faculty', 8, 'view_faculty'),
(33, 'Can add students', 9, 'add_students'),
(34, 'Can change students', 9, 'change_students'),
(35, 'Can delete students', 9, 'delete_students'),
(36, 'Can view students', 9, 'view_students'),
(37, 'Can add recognition', 10, 'add_recognition'),
(38, 'Can change recognition', 10, 'change_recognition'),
(39, 'Can delete recognition', 10, 'delete_recognition'),
(40, 'Can view recognition', 10, 'view_recognition'),
(41, 'Can add stranger', 11, 'add_stranger'),
(42, 'Can change stranger', 11, 'change_stranger'),
(43, 'Can delete stranger', 11, 'delete_stranger'),
(44, 'Can view stranger', 11, 'view_stranger');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(9, 'pbkdf2_sha256$390000$0MU37e3dfwNuZgadnR4wdB$Va6WTLtVtenuDQfVukcQEWV5AaAhu1YOLwGkiiXWTY4=', '2023-01-02 12:44:55.475690', 0, 'admin', '', '', '', 0, 1, '2022-12-30 23:22:23.409086');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'stream', 'class'),
(8, 'stream', 'faculty'),
(10, 'stream', 'recognition'),
(11, 'stream', 'stranger'),
(9, 'stream', 'students');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-20 07:01:47.002277'),
(2, 'auth', '0001_initial', '2022-12-20 07:01:47.326648'),
(3, 'admin', '0001_initial', '2022-12-20 07:01:47.421905'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-12-20 07:01:47.430884'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-20 07:01:47.440858'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-12-20 07:01:47.503199'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-12-20 07:01:47.546618'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-12-20 07:01:47.610449'),
(9, 'auth', '0004_alter_user_username_opts', '2022-12-20 07:01:47.621419'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-12-20 07:01:47.663818'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-12-20 07:01:47.672793'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-12-20 07:01:47.697726'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-12-20 07:01:47.784065'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-12-20 07:01:47.839920'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-12-20 07:01:47.921227'),
(16, 'auth', '0011_update_proxy_permissions', '2022-12-20 07:01:47.935194'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-12-20 07:01:47.989576'),
(18, 'sessions', '0001_initial', '2022-12-20 07:01:48.025480'),
(19, 'stream', '0001_initial', '2022-12-20 07:01:48.186092'),
(20, 'stream', '0002_stranger_alter_students_birthday', '2022-12-22 08:15:01.275159');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('19aqeh68m4lvmvg9tn2rj64ftxzv0bp0', 'e30:1pAV0K:NTB10AmdiE_O_Hh-V1fLJ9W9TFQOi3uASDo2ARf_A4g', '2023-01-11 18:53:52.690271'),
('3doj0poxtn9pq5lrrq3a0te9uo16w5ia', '.eJxVjEEOgjAURO_StWlaKaV16Z4zkP_7B4uaklBYGe-uJCx0O--9eamBtjUPW8UyTKIuqlGn340pPVB2IHcqt1mnuazLxHpX9EGr7mfB83q4fweZav7WAWS45WASeTIBwYCjZ--iRSdNKxHJn30LwLvknJXOCUZL3Lgxwqr3B_xCOJ0:1pAlLA:BQUDFL5VfnjBhnGLIYbesPPGj4_G0bWn09Wov4xyxuY', '2023-01-12 12:20:28.004815'),
('4k7857s3gaeiab4sopruo1t01zc2rax8', '.eJxVjDsOwyAQBe9CHSHzWQwp0_sMaGEhOIlAMnYV5e6xJRdJ-2bmvZnHbS1-62nxM7Erc-zyuwWMz1QPQA-s98Zjq-syB34o_KSdT43S63a6fwcFe9lr6XR2MoYRFdhshyDICINWWcCkc1QUNAiQAylpMTujdqazIDdaIDDs8wXaHDdb:1pCDd1:pp_JO2ExwGVovy8719Z33V3tkf7gc9gbRCAeSj2cN8o', '2023-01-16 12:44:55.479679'),
('b8c440e5mitygg1usgf95489g9mro44s', '.eJxVjEEOgjAURO_StWlaKaV16Z4zkP_7B4uaklBYGe-uJCx0O--9eamBtjUPW8UyTKIuqlGn340pPVB2IHcqt1mnuazLxHpX9EGr7mfB83q4fweZav7WAWS45WASeTIBwYCjZ--iRSdNKxHJn30LwLvknJXOCUZL3Lgxwqr3B_xCOJ0:1pBHjw:osQ-984Mw7djM1vq1kHy98xorp3-inV_t81pyqvCl60', '2023-01-13 22:56:12.327013'),
('bz2ll18j3ad11bbmpx3m2h5llkv8pefg', '.eJxVjDsOwyAQBe9CHSHzWQwp0_sMaGEhOIlAMnYV5e6xJRdJ-2bmvZnHbS1-62nxM7Erc-zyuwWMz1QPQA-s98Zjq-syB34o_KSdT43S63a6fwcFe9lr6XR2MoYRFdhshyDICINWWcCkc1QUNAiQAylpMTujdqazIDdaIDDs8wXaHDdb:1pCBDn:4sXCQHGtxXAiUQckUYbpPoxaL25akdldWVld2rlGgJQ', '2023-01-16 10:10:43.836824'),
('cgosfs3i33lnmt8lboy8nsfl3n98lc6o', 'e30:1pAV0E:mGndNRk8N4XAdOAEumGOO3XBDwAc6ABqgh3PypV5nDE', '2023-01-11 18:53:46.174542'),
('dyfkw6vd4cblbqdgt4vyoda7jbfi0s2r', 'e30:1pAUzX:a8--eCKZgqI_fNLfh9vVrg9EqnfaJU7rKThIRDr2DtM', '2023-01-11 18:53:03.474174'),
('h9olvn8n16uj0ask3e7z3hkj945mn2sp', '.eJxVjEEOgjAURO_StWlaKaV16Z4zkP_7B4uaklBYGe-uJCx0O--9eamBtjUPW8UyTKIuqlGn340pPVB2IHcqt1mnuazLxHpX9EGr7mfB83q4fweZav7WAWS45WASeTIBwYCjZ--iRSdNKxHJn30LwLvknJXOCUZL3Lgxwqr3B_xCOJ0:1pAVuR:jz-OMTuzIc2fvMlf5Jg8YAdbQReDhFgZiM8Ryo8uD0Q', '2023-01-11 19:51:51.458415'),
('ipjs9fjzrhip9zr4jdvsklt2f6gw1a0a', 'e30:1pAUyh:SWVda_L9ZhFW4IqRvZ6Fsdck0UnF2XjYTjU06NUtvkI', '2023-01-11 18:52:11.461248'),
('k9rcrclek0gzmnn5irn9tg4uty2rokwn', '.eJxVjEEOgjAURO_StWlaKaV16Z4zkP_7B4uaklBYGe-uJCx0O--9eamBtjUPW8UyTKIuqlGn340pPVB2IHcqt1mnuazLxHpX9EGr7mfB83q4fweZav7WAWS45WASeTIBwYCjZ--iRSdNKxHJn30LwLvknJXOCUZL3Lgxwqr3B_xCOJ0:1pAl9C:BF2eDDDTHDoDCP25B3UB2HjVBb4WpCiSVe3dAt0_7K4', '2023-01-12 12:08:06.069814'),
('ncptcyku7yt4hhn4ekl9kaj18mb18be0', 'e30:1pAUv2:n-SqehO5r4OI_kjFUiVwmDLrbA_Hvofz6IBcRCyywyE', '2023-01-11 18:48:24.971636'),
('pc9qzgwpn2xhjktbazy26oo40bcdsbuu', 'e30:1pAV0S:MbvOjeU-IePTGn-HmhrVUpijLmU_QOITPQMQsirIbS4', '2023-01-11 18:54:00.683245'),
('yicwgu9k4nu0vvztat85ies7k4rw3gy8', 'e30:1pAVAW:fmNFRkty0aml9g9-dW6Kr52ZKeElaadcf2fX-4WBjDY', '2023-01-11 19:04:24.972469'),
('yxbvfjtbbnpg7ar3qudrrt2gd7rqah3h', 'e30:1pAUwy:83aAMOqpaIT-LaKSDczdMTu1mUlDDnaJhErqCzkK4Ow', '2023-01-11 18:50:24.092387');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_class`
--

CREATE TABLE `tbl_class` (
  `id_name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `faculty_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_class`
--

INSERT INTO `tbl_class` (`id_name`, `created_at`, `updated_at`, `faculty_id`) VALUES
('20CNTT1A', '2022-12-28 13:03:21', '2022-12-28 13:03:21', 3),
('20CNTT1B', '2022-12-28 13:03:38', '2022-12-28 13:03:38', 3),
('20CNTT1C', '2022-12-28 13:57:15', '2022-12-28 13:57:15', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_faculty`
--

CREATE TABLE `tbl_faculty` (
  `id` bigint(20) NOT NULL,
  `facultyName` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_faculty`
--

INSERT INTO `tbl_faculty` (`id`, `facultyName`, `created_at`, `updated_at`) VALUES
(3, 'Công nghệ thông tin', '2022-12-27 23:35:13', '2022-12-27 23:35:13'),
(4, 'Cơ khí', '2022-12-27 23:35:54', '2022-12-27 23:35:54'),
(6, 'Du lịch', '2022-12-27 23:44:22', '2022-12-27 23:44:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_recognition`
--

CREATE TABLE `tbl_recognition` (
  `id` bigint(20) NOT NULL,
  `date` date DEFAULT current_timestamp(),
  `time` time NOT NULL,
  `students_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_recognition`
--

INSERT INTO `tbl_recognition` (`id`, `date`, `time`, `students_id`) VALUES
(502, '2023-01-02', '12:37:01', '20C0750'),
(503, '2023-01-02', '12:39:02', '20OC5457');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_strangers`
--

CREATE TABLE `tbl_strangers` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `time` time NOT NULL DEFAULT current_timestamp(),
  `imgName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_strangers`
--

INSERT INTO `tbl_strangers` (`id`, `date`, `time`, `imgName`) VALUES
(1317, '2023-01-02', '12:38:42', '02_01_2023_12_38_42_366693.jpg'),
(1318, '2023-01-02', '12:39:47', '02_01_2023_12_39_47_947740.jpg'),
(1319, '2023-01-02', '12:41:06', '02_01_2023_12_41_06_522203.jpg'),
(1320, '2023-01-02', '12:41:28', '02_01_2023_12_41_28_478473.jpg'),
(1321, '2023-01-02', '12:43:13', '02_01_2023_12_43_13_107203.jpg'),
(1322, '2023-01-02', '12:43:15', '02_01_2023_12_43_15_283674.jpg'),
(1323, '2023-01-02', '12:43:16', '02_01_2023_12_43_16_490872.jpg'),
(1324, '2023-01-02', '12:43:38', '02_01_2023_12_43_38_621069.jpg'),
(1325, '2023-01-02', '12:43:47', '02_01_2023_12_43_47_912453.jpg'),
(1326, '2023-01-02', '12:43:49', '02_01_2023_12_43_49_474236.jpg'),
(1327, '2023-01-02', '12:43:51', '02_01_2023_12_43_51_032738.jpg'),
(1328, '2023-01-02', '12:43:52', '02_01_2023_12_43_52_162756.jpg'),
(1329, '2023-01-02', '12:43:53', '02_01_2023_12_43_53_313570.jpg'),
(1330, '2023-01-02', '12:43:57', '02_01_2023_12_43_57_664482.jpg'),
(1331, '2023-01-02', '12:44:49', '02_01_2023_12_44_49_722569.jpg'),
(1332, '2023-01-02', '12:45:28', '02_01_2023_12_45_28_063022.jpg'),
(1333, '2023-01-02', '12:47:29', '02_01_2023_12_47_29_309255.jpg'),
(1334, '2023-01-02', '12:47:30', '02_01_2023_12_47_30_365207.jpg'),
(1335, '2023-01-02', '12:47:37', '02_01_2023_12_47_37_593332.jpg'),
(1336, '2023-01-02', '12:47:38', '02_01_2023_12_47_38_593235.jpg'),
(1337, '2023-01-02', '12:49:14', '02_01_2023_12_49_14_044668.jpg'),
(1338, '2023-01-02', '12:49:45', '02_01_2023_12_49_45_843116.jpg'),
(1339, '2023-01-02', '12:49:52', '02_01_2023_12_49_52_858485.jpg'),
(1340, '2023-01-02', '12:49:54', '02_01_2023_12_49_54_739526.jpg'),
(1341, '2023-01-02', '12:49:56', '02_01_2023_12_49_56_703224.jpg'),
(1342, '2023-01-02', '12:50:00', '02_01_2023_12_50_00_061778.jpg'),
(1343, '2023-01-02', '12:50:08', '02_01_2023_12_50_08_315299.jpg'),
(1344, '2023-01-02', '12:50:11', '02_01_2023_12_50_11_705852.jpg'),
(1345, '2023-01-02', '12:50:51', '02_01_2023_12_50_51_317611.jpg'),
(1346, '2023-01-02', '12:51:19', '02_01_2023_12_51_19_960198.jpg'),
(1347, '2023-01-02', '12:51:25', '02_01_2023_12_51_25_114713.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_students`
--

CREATE TABLE `tbl_students` (
  `id` varchar(100) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `birthday` date NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `classs_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_students`
--

INSERT INTO `tbl_students` (`id`, `fullName`, `address`, `phoneNumber`, `birthday`, `created_at`, `updated_at`, `classs_id`) VALUES
('20C0750', 'Ngô Duy Hưng', 'Quảng Phú, Quảng Điền', '0387469506', '2000-02-03', '2022-12-28 13:06:44', '2023-01-02 12:36:57', '20CNTT1A'),
('20OC10', 'Viet thai', 'Sơn trà,Đà nẳng', '0123456789', '2002-12-12', '2022-12-29 11:17:50', '2022-12-29 11:17:50', '20CNTT1A'),
('20OC14', 'Nguyễn Trọng Thức', 'Cẩm Lệ, Đà Nẵng', '0935392545', '2002-01-03', '2023-01-02 12:48:58', '2023-01-02 12:48:58', '20CNTT1A'),
('20OC5457', 'Lê Lợi', 'Quảng Nam', '0363601406', '2002-12-29', '2022-12-28 13:08:15', '2023-01-02 12:45:54', '20CNTT1A'),
('20OC6532', 'Võ Thanh Nhật', 'Sơn trà,Đà nẳng', '0123654987', '1999-12-12', '2022-12-28 14:27:06', '2022-12-28 14:27:06', '20CNTT1A');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `tbl_class`
--
ALTER TABLE `tbl_class`
  ADD PRIMARY KEY (`id_name`),
  ADD KEY `tbl_class_faculty_id_01d9a857_fk_tbl_faculty_id` (`faculty_id`);

--
-- Chỉ mục cho bảng `tbl_faculty`
--
ALTER TABLE `tbl_faculty`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_recognition`
--
ALTER TABLE `tbl_recognition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_recognition_students_id_a9edc37d_fk_tbl_students_id` (`students_id`);

--
-- Chỉ mục cho bảng `tbl_strangers`
--
ALTER TABLE `tbl_strangers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_students_classs_id_28845610_fk_tbl_class_id_name` (`classs_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tbl_faculty`
--
ALTER TABLE `tbl_faculty`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `tbl_recognition`
--
ALTER TABLE `tbl_recognition`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;

--
-- AUTO_INCREMENT cho bảng `tbl_strangers`
--
ALTER TABLE `tbl_strangers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1348;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `tbl_class`
--
ALTER TABLE `tbl_class`
  ADD CONSTRAINT `tbl_class_faculty_id_01d9a857_fk_tbl_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `tbl_faculty` (`id`);

--
-- Các ràng buộc cho bảng `tbl_recognition`
--
ALTER TABLE `tbl_recognition`
  ADD CONSTRAINT `tbl_recognition_ibfk_1` FOREIGN KEY (`students_id`) REFERENCES `tbl_students` (`id`);

--
-- Các ràng buộc cho bảng `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD CONSTRAINT `tbl_students_classs_id_28845610_fk_tbl_class_id_name` FOREIGN KEY (`classs_id`) REFERENCES `tbl_class` (`id_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
