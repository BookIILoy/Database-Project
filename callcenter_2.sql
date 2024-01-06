-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 08:23 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `callcenter`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
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
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$mHKAkEHFmtaLmu2sDc05bR$3pL8IBBs1wyVwdBUW6YFEYjsblf28o44iRNtM76vshg=', '2023-05-29 08:40:08.731471', 1, 'admin', '', '', '', 1, 1, '2023-05-25 14:02:05.661555'),
(4, 'pbkdf2_sha256$600000$baPZlsQJo04m4e0DsSDUlg$diSzw+RI7KUU5rh2F/MD/i9mIW5kvIpoXRnPF5ArOo4=', '2023-05-30 06:03:32.725112', 0, '0005Book', '', '', '', 0, 1, '2023-05-29 08:41:12.714737');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_address` text NOT NULL,
  `branch_contact_tel_no` varchar(10) NOT NULL,
  `branch_contact_manager_tel_no` varchar(10) NOT NULL,
  `Manager_staff_ID` int(11) NOT NULL,
  `branch_contact_email` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `province` varchar(64) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `country` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_address`, `branch_contact_tel_no`, `branch_contact_manager_tel_no`, `Manager_staff_ID`, `branch_contact_email`, `city`, `province`, `zipcode`, `country`) VALUES
(1, 'Prachautit 43', '0123456789', '0123456780', 1, 'pizza_renger.prachautit@mail.com', 'bangmod', 'bangkok', '12345', 'Thailand');

-- --------------------------------------------------------

--
-- Table structure for table `call`
--

CREATE TABLE `call` (
  `call_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `status` enum('Finished','Oncall','Inqueue','Abandon_Inqueue','Abandon_Oncall') NOT NULL,
  `date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `customer_call_time` time NOT NULL,
  `member_register_id` int(11) DEFAULT NULL,
  `tel_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `call`
--

INSERT INTO `call` (`call_id`, `order_id`, `status`, `date`, `start_time`, `end_time`, `staff_id`, `issue_id`, `customer_call_time`, `member_register_id`, `tel_no`) VALUES
(6, 1, 'Finished', '2023-05-25', '10:20:12', '10:26:13', 3, NULL, '10:20:12', NULL, '0123143123'),
(7, 11, 'Finished', '2023-05-25', '15:50:56', '15:57:32', 2, NULL, '15:50:56', 2, '0847589432'),
(8, 10, 'Finished', '2023-05-25', '15:57:12', '16:01:59', 2, NULL, '15:55:34', 1, '034958643'),
(9, NULL, 'Abandon_Inqueue', '2023-05-25', NULL, NULL, NULL, NULL, '15:56:34', NULL, '0234324422'),
(10, NULL, 'Abandon_Inqueue', '2023-05-25', NULL, NULL, NULL, NULL, '15:58:34', NULL, '0450322341'),
(13, 12, 'Finished', '2023-05-26', '10:23:59', '10:26:12', 3, NULL, '10:23:39', NULL, '0123143123'),
(14, 13, 'Finished', '2023-05-26', '11:58:30', '12:04:19', 3, NULL, '11:58:17', NULL, '034958643'),
(16, NULL, 'Finished', '2023-05-25', '19:34:56', '19:46:19', 4, 1, '19:34:56', NULL, '0123143123'),
(17, NULL, 'Finished', '2023-05-25', '20:12:30', '20:30:44', 4, 2, '20:12:18', NULL, '0349586432'),
(18, NULL, 'Finished', '2023-05-26', '11:05:29', '11:15:29', 3, 3, '11:05:29', NULL, '0123143123'),
(19, 21, 'Finished', '2023-05-26', '13:05:53', '13:09:40', 5, 10, '12:00:16', 6, '0712334321'),
(20, NULL, 'Inqueue', '2023-05-26', NULL, NULL, NULL, NULL, '12:03:19', NULL, '0234848221'),
(22, NULL, 'Inqueue', '2023-05-26', NULL, NULL, NULL, NULL, '12:06:16', NULL, '0574834265');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-05-28 14:24:03.145025', '2', '0001.Omar.Yusoh', 1, '[{\"added\": {}}]', 4, 1),
(2, '2023-05-28 14:26:58.517082', '2', '0001.Omar.Yusoh', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(3, '2023-05-28 14:29:27.307647', '2', '0001.Omar.Yusoh', 3, '', 4, 1),
(4, '2023-05-28 14:30:24.210174', '3', '0001Omar', 1, '[{\"added\": {}}]', 4, 1),
(5, '2023-05-29 08:41:13.076716', '4', '0005Book', 1, '[{\"added\": {}}]', 4, 1),
(6, '2023-05-29 08:41:29.176450', '3', '0001Omar', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(19, 'contenttypes', '0001_initial', '2023-05-29 07:59:28.438368'),
(20, 'auth', '0001_initial', '2023-05-29 07:59:28.443367'),
(21, 'admin', '0001_initial', '2023-05-29 07:59:28.447369'),
(22, 'admin', '0002_logentry_remove_auto_add', '2023-05-29 07:59:28.450494'),
(23, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-29 07:59:28.454495'),
(24, 'contenttypes', '0002_remove_content_type_name', '2023-05-29 07:59:28.457495'),
(25, 'auth', '0002_alter_permission_name_max_length', '2023-05-29 07:59:28.460261'),
(26, 'auth', '0003_alter_user_email_max_length', '2023-05-29 07:59:28.463261'),
(27, 'auth', '0004_alter_user_username_opts', '2023-05-29 07:59:28.467261'),
(28, 'auth', '0005_alter_user_last_login_null', '2023-05-29 07:59:28.470771'),
(29, 'auth', '0006_require_contenttypes_0002', '2023-05-29 07:59:28.473771'),
(30, 'auth', '0007_alter_validators_add_error_messages', '2023-05-29 07:59:28.475770'),
(31, 'auth', '0008_alter_user_username_max_length', '2023-05-29 07:59:28.479545'),
(32, 'auth', '0009_alter_user_last_name_max_length', '2023-05-29 07:59:28.483545'),
(33, 'auth', '0010_alter_group_name_max_length', '2023-05-29 07:59:28.486545'),
(34, 'auth', '0011_update_proxy_permissions', '2023-05-29 07:59:28.489616'),
(35, 'auth', '0012_alter_user_first_name_max_length', '2023-05-29 07:59:28.492616'),
(36, 'sessions', '0001_initial', '2023-05-29 07:59:28.495616');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('77db67flxqlhsa4qefyehgvog62w43h0', '.eJxVjDEOwyAQBP9CHSE4jICU6fMGBNwRnEQgGbuy8vfYkgu73ZnZlfmwzMUvnSY_Iruzgd3OWwzpQ3UH-A711XhqdZ7GyHeFH7TzZ0P6Pg73clBCL1udXE4SIIqULSkUUoN0aAzqwRltKWdQBpwNlrSKhkiRALUZYCXJTOz3B-GmN70:1q3sSC:04pU0Y8FuGdBF5s8y81XBUCLv_Lm4h3SB-DMh7GnchE', '2023-06-13 06:03:32.729896'),
('8ae1r7c41v8udlmbdrvfg2ilky6do970', '.eJxVjEEOwiAQRe_C2hAGy0hduvcMZBgGqRpISrsy3l2bdKHb_977LxVoXUpYu8xhSuqsQB1-t0j8kLqBdKd6a5pbXeYp6k3RO-362pI8L7v7d1Col2-NI0hiEXTIljE7SpYjiMNsBGxGEMz2ZKMfRh6iGGfJRyfGHL0DRPX-AAF0N_8:1q2BXw:p8VjfxQ7HkjWjpz13ApOJQEGJLHzhz9Z264iCFGs-Jw', '2023-06-08 14:02:28.582851');

-- --------------------------------------------------------

--
-- Table structure for table `issue`
--

CREATE TABLE `issue` (
  `issue_id` int(11) NOT NULL,
  `issue_topic` varchar(256) NOT NULL,
  `detail` text NOT NULL,
  `is_handled` tinyint(1) NOT NULL,
  `solution` text DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `category` enum('general','complain','individual') NOT NULL,
  `issuer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issue`
--

INSERT INTO `issue` (`issue_id`, `issue_topic`, `detail`, `is_handled`, `solution`, `priority`, `category`, `issuer`) VALUES
(1, 'Delivery is too slow.', 'Delivery for Order ID 11 is too late.', 1, NULL, 1, 'complain', 2),
(2, 'Suspicious Juice taste weird.', 'Customers complain that Suspicious Juice tastes weird. It was too bitter.', 1, NULL, 1, 'complain', 3),
(3, 'Pizza came without any topping', 'When I open the pizza there is no topping at all just plain bread. How are we supposed to eat!!?!!', 1, '\"Sir, can you flip the box please\"', 1, 'complain', 3),
(10, 'Something', 'Something', 1, 'Something', 1, 'general', 5);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `member_fname` varchar(64) NOT NULL,
  `member_mname` varchar(64) DEFAULT NULL,
  `member_lname` varchar(64) NOT NULL,
  `contact_tel_no` varchar(10) NOT NULL,
  `contact_email` varchar(64) NOT NULL,
  `member_point_used` int(11) NOT NULL DEFAULT 0,
  `member_point_available` int(11) NOT NULL DEFAULT 0,
  `dob` date NOT NULL,
  `register_date` date NOT NULL DEFAULT current_timestamp(),
  `expire_date` date NOT NULL,
  `address` text NOT NULL,
  `city` varchar(64) NOT NULL,
  `province` varchar(64) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  `country` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `member_fname`, `member_mname`, `member_lname`, `contact_tel_no`, `contact_email`, `member_point_used`, `member_point_available`, `dob`, `register_date`, `expire_date`, `address`, `city`, `province`, `zipcode`, `country`) VALUES
(1, 'Leon', 'F', 'Kennedy', '0349586432', 'Leon.Babe@mail.com', 0, 350, '1977-05-16', '2023-05-25', '2028-05-25', 'Phuttabucha 45', 'Bangmod', 'Bangkok', '12045', 'Thailand'),
(2, 'Prayut', NULL, 'Chanocha', '0847589432', 'Too@mail.com', 100, 0, '1976-05-08', '2023-05-26', '2023-05-26', 'Phuttabucha 50', 'Bangmod', 'Bangkok', '12045', 'Thailand'),
(6, 'Omar', 'a', 'Yu', '0123456789', 'O@mail,com', 0, 0, '2018-07-22', '2023-05-30', '2028-05-30', 'Something', 'Yala', 'Yala', '12345', 'Thailand');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(64) NOT NULL,
  `description` varchar(128) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `description`, `price`, `is_available`) VALUES
(1, 'Pepperoni Pizza (S)', 'Pizza with pepperoni on top. Smol size.', 89, 1),
(2, 'Pepperoni pizza (M)', 'Pizza with pepperoni on top. Medium size.', 129, 1),
(3, 'Pepperoni pizza(L)', 'Pizza with pepperoni on top. Beeg size.', 189, 1),
(4, 'Choco mint Pizza(S)', 'Pizza with choco mint on top. Smol size.', 89, 1),
(5, 'Choco mint Pizza(M)\r\n', 'Pizza with choco mint on top. Medium size.', 129, 1),
(6, 'Choco mint Pizza(L)\r\n', 'Pizza with choco mint on top. Beeg size.', 189, 1),
(7, 'Hawaiian Pizza(S)', 'Pizza with sausage and \"PINEAPPLE\" on top. Smol size.', 89, 1),
(8, 'Hawaiian Pizza(M)', 'Pizza with sausage and \"PINEAPPLE\" on top. Medium size.', 129, 1),
(9, 'Hawaiian Pizza(L)', 'Pizza with sausage and \"PINEAPPLE\" on top. Beeg size.', 189, 1),
(10, 'French fries', 'French fries with \"PINEAPPLE\" as topping.', 49, 1),
(11, 'Chicken Wing', '4x Chicken Wing', 79, 1),
(12, 'Spaghetti Bolognese.', 'Regular Spaghetti Bolognese.', 69, 1),
(13, 'Chocomint Ice Cream', 'Chocomint Ice Cream.', 49, 1),
(14, 'O\' Liang', 'O\' Liang. It is coffee. take it or leave it.', 39, 1),
(15, 'Suspicious Juice.', 'Suspicious Juice.', 49, 1),
(16, 'Vanilla Ice Cream', 'Vanilla Ice Cream', 49, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_and_package`
--

CREATE TABLE `menu_and_package` (
  `Menu_and_package_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_and_package`
--

INSERT INTO `menu_and_package` (`Menu_and_package_id`, `package_id`, `menu_id`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, NULL),
(5, 5, NULL),
(6, 6, NULL),
(7, NULL, 1),
(8, NULL, 2),
(9, NULL, 3),
(10, NULL, 4),
(11, NULL, 5),
(12, NULL, 6),
(13, NULL, 7),
(14, NULL, 8),
(15, NULL, 9),
(16, NULL, 10),
(17, NULL, 11),
(18, NULL, 12),
(19, NULL, 13),
(20, NULL, 14),
(21, NULL, 15),
(22, NULL, 16);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(128) NOT NULL,
  `tel_no` varchar(10) NOT NULL,
  `status` enum('cancel','pending','delivering','success') NOT NULL,
  `order_time` time NOT NULL,
  `arriving_time` time DEFAULT NULL,
  `date` date NOT NULL,
  `delivering_time` time DEFAULT NULL,
  `member_point_gain_or_used` int(11) DEFAULT 0,
  `side_note` text DEFAULT NULL,
  `detail_address` text NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `promotion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `customer_name`, `tel_no`, `status`, `order_time`, `arriving_time`, `date`, `delivering_time`, `member_point_gain_or_used`, `side_note`, `detail_address`, `member_id`, `branch_id`, `promotion_id`) VALUES
(1, 'Mac', '0123143123', 'success', '10:26:13', '10:53:12', '2023-05-25', '10:30:12', NULL, 'Gimme more sauce!', 'Chutamas 2, Phuttabucha 47, Bangmod.', NULL, 1, NULL),
(10, 'Leon', '0349586432', 'success', '16:01:59', '16:45:11', '2023-05-25', '15:58:43', 200, 'Woohoo!', '404 Phuttabucha 45, Bangmod', 1, 1, NULL),
(11, 'Too', '0847589432', 'success', '15:57:32', '16:40:00', '2023-05-25', '15:58:43', -100, NULL, '303 Phuttabucha 50, Bangmod', 2, 1, 1),
(12, 'Mac', '0123143123', 'success', '10:26:12', '11:00:13', '2023-05-26', '10:45:12', 0, 'Gimme more sauce!', 'Chutamas 2, Phuttabucha 47, Bangmod.', NULL, 1, NULL),
(13, 'Leon', '0349586432', 'delivering', '12:04:19', NULL, '2023-05-26', '12:20:12', 50, 'Woohoo!', '404 Phuttabucha 45, Bangmod', 1, 1, NULL),
(21, 'Omar', '0123458890', 'pending', '13:06:38', NULL, '2023-05-30', NULL, 0, '', 'Siroros', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `Menu_and_package_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_id`, `Menu_and_package_id`, `count`) VALUES
(1, 1, 1),
(10, 2, 1),
(10, 3, 1),
(10, 12, 1),
(11, 10, 2),
(12, 3, 1),
(13, 3, 2),
(21, 1, 2),
(21, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_name` varchar(64) NOT NULL,
  `description` varchar(128) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `package_name`, `description`, `price`, `is_available`) VALUES
(1, 'Suspicious Choco Mint Package.', 'Choco Mint Pizza(M) + Choco Mint Ice Cream + Suspicious Juice.', 249, 1),
(2, 'Pepperoni Pizza Spaghetti Package', 'Medium Pepperoni pizza + Spaghetti + O\' liang.', 249, 1),
(3, 'Choco Mint Pizza Spaghetti Package', 'Medium Choco Mint pizza + Spaghetti + O\' liang.', 249, 1),
(4, 'Hawaiian Pizza Spaghetti Package', 'Medium Hawaiian pizza + Spaghetti + O\' liang.', 249, 1),
(5, 'Suspicious Party package.', 'Large Pepperoni Pizza + French fries + Chicken wings + 2x Suspicious Juice.', 289, 1),
(6, 'O\'liang Party package.', 'Large Pepperoni Pizza + French fries + Chicken wings + 2x O\'liang.', 289, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_detail`
--

CREATE TABLE `package_detail` (
  `package_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_detail`
--

INSERT INTO `package_detail` (`package_id`, `menu_id`, `count`) VALUES
(1, 5, 1),
(1, 13, 1),
(1, 15, 1),
(2, 2, 1),
(2, 12, 1),
(2, 14, 1),
(3, 5, 1),
(3, 12, 1),
(3, 14, 1),
(4, 8, 1),
(4, 12, 1),
(4, 14, 1),
(5, 3, 1),
(5, 10, 1),
(5, 11, 1),
(5, 15, 2),
(6, 3, 1),
(6, 10, 1),
(6, 11, 1),
(6, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_id` int(11) NOT NULL,
  `promotion_name` varchar(64) NOT NULL,
  `member_point_need` int(11) NOT NULL,
  `promotion_detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotion_id`, `promotion_name`, `member_point_need`, `promotion_detail`) VALUES
(0, 'None', 0, 'None'),
(1, '10% discount', 100, '10% discount on price.'),
(2, '20% discount', 200, '20% discount on price.'),
(3, '30% discount', 300, '30% discount on price.');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `staff_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `shift` enum('Noon','Afternoon','Evening','Night') NOT NULL,
  `date` date NOT NULL,
  `check_in_shift_time` time NOT NULL DEFAULT current_timestamp(),
  `check_out_shift_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`staff_id`, `branch_id`, `shift`, `date`, `check_in_shift_time`, `check_out_shift_time`) VALUES
(2, 1, 'Afternoon', '2023-05-25', '11:53:01', '16:03:31'),
(3, 1, 'Noon', '2023-05-25', '07:53:00', '12:02:23'),
(3, 1, 'Noon', '2023-05-26', '07:59:01', NULL),
(4, 1, 'Evening', '2023-05-25', '15:59:59', '20:01:11'),
(5, 1, 'Night', '2023-05-25', '19:53:11', '00:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_fname` varchar(64) NOT NULL,
  `staff_mname` varchar(64) DEFAULT NULL,
  `staff_lname` varchar(64) NOT NULL,
  `bio_gender` enum('Male','Female') NOT NULL,
  `religious` varchar(32) DEFAULT NULL,
  `dob` date NOT NULL,
  `contact_tel_no` varchar(10) NOT NULL,
  `contact_email` varchar(64) DEFAULT NULL,
  `salary` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` enum('Onduty','Ready','Unavailable') NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_fname`, `staff_mname`, `staff_lname`, `bio_gender`, `religious`, `dob`, `contact_tel_no`, `contact_email`, `salary`, `role`, `status`, `branch_id`) VALUES
(1, 'Parit', 'Yusoh', 'Kingkeaw', 'Female', 'Islam', '1977-05-15', '0129348412', 'Parit.Y.K@mail.com', 0, 'Manager', 'Ready', 1),
(2, 'Peerawat', NULL, 'Sakulsongsuk', 'Male', 'Sikhism', '2023-05-26', '0458455332', 'GNOG@mail.com', 23449, 'Call_Agent', 'Ready', 1),
(3, 'Omar', NULL, 'Yusoh', 'Male', 'Islam', '1995-05-24', '0129348434', 'Omar@mail.com', 20000, 'Call_Agent', 'Onduty', 1),
(4, 'Tanuthum', NULL, 'Kingkeaw', 'Male', 'Atheist', '1998-05-21', '0847589412', 'Poon@mail.com', 23009, 'Call_agent', 'Ready', 1),
(5, 'Tukdanai', NULL, 'Urumporn', 'Male', 'PineApple', '2001-05-04', '0458455333', 'Book@mail.com', 23459, 'Call_Agent', 'Ready', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `branch_ibfk_1` (`Manager_staff_ID`);

--
-- Indexes for table `call`
--
ALTER TABLE `call`
  ADD PRIMARY KEY (`call_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `issue_id` (`issue_id`),
  ADD KEY `call_ibfk4` (`member_register_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `issue`
--
ALTER TABLE `issue`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `issue_ibfk_1` (`issuer`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_and_package`
--
ALTER TABLE `menu_and_package`
  ADD PRIMARY KEY (`Menu_and_package_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `promotion_id` (`promotion_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_id`,`Menu_and_package_id`),
  ADD KEY `Menu_and_package_id` (`Menu_and_package_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `package_detail`
--
ALTER TABLE `package_detail`
  ADD PRIMARY KEY (`package_id`,`menu_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`staff_id`,`shift`,`branch_id`,`date`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `call`
--
ALTER TABLE `call`
  MODIFY `call_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `issue`
--
ALTER TABLE `issue`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `menu_and_package`
--
ALTER TABLE `menu_and_package`
  MODIFY `Menu_and_package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_detail`
--
ALTER TABLE `package_detail`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`Manager_staff_ID`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `call`
--
ALTER TABLE `call`
  ADD CONSTRAINT `call_ibfk4` FOREIGN KEY (`member_register_id`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `call_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `call_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `call_ibfk_3` FOREIGN KEY (`issue_id`) REFERENCES `issue` (`issue_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`issuer`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `menu_and_package`
--
ALTER TABLE `menu_and_package`
  ADD CONSTRAINT `menu_and_package_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `menu_and_package_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`Menu_and_package_id`) REFERENCES `menu_and_package` (`Menu_and_package_id`);

--
-- Constraints for table `package_detail`
--
ALTER TABLE `package_detail`
  ADD CONSTRAINT `package_detail_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `package_detail_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `shift_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
