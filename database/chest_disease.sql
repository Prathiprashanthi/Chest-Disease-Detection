-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 06, 2023 at 09:50 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chest_disease`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

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
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add manage_users_model', 8, 'add_manage_users_model'),
(30, 'Can change manage_users_model', 8, 'change_manage_users_model'),
(31, 'Can delete manage_users_model', 8, 'delete_manage_users_model'),
(32, 'Can view manage_users_model', 8, 'view_manage_users_model'),
(33, 'Can add dataset', 9, 'add_dataset'),
(34, 'Can change dataset', 9, 'change_dataset'),
(35, 'Can delete dataset', 9, 'delete_dataset'),
(36, 'Can view dataset', 9, 'view_dataset'),
(37, 'Can add feedback', 10, 'add_feedback'),
(38, 'Can change feedback', 10, 'change_feedback'),
(39, 'Can delete feedback', 10, 'delete_feedback'),
(40, 'Can view feedback', 10, 'view_feedback');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'mainapp', 'user'),
(8, 'adminapp', 'manage_users_model'),
(9, 'userapp', 'dataset'),
(10, 'userapp', 'feedback');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-04 06:09:41.691567'),
(2, 'auth', '0001_initial', '2023-10-04 06:09:42.258409'),
(3, 'admin', '0001_initial', '2023-10-04 06:09:42.405390'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-10-04 06:09:42.405390'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-04 06:09:42.425281'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-10-04 06:09:42.506887'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-10-04 06:09:42.549617'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-10-04 06:09:42.620757'),
(9, 'auth', '0004_alter_user_username_opts', '2023-10-04 06:09:42.636197'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-10-04 06:09:42.708470'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-10-04 06:09:42.708470'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-04 06:09:42.716469'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-10-04 06:09:42.759793'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-04 06:09:42.815909'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-10-04 06:09:42.869749'),
(16, 'auth', '0011_update_proxy_permissions', '2023-10-04 06:09:42.882507'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-04 06:09:42.936858'),
(18, 'mainapp', '0001_initial', '2023-10-04 06:09:42.963332'),
(19, 'sessions', '0001_initial', '2023-10-04 06:09:43.019817'),
(20, 'mainapp', '0002_user_date_time_user_image_user_last_login_date_and_more', '2023-10-04 06:15:10.426817'),
(21, 'adminapp', '0001_initial', '2023-10-05 10:17:36.594158'),
(22, 'userapp', '0001_initial', '2023-10-05 10:17:36.732270');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5c69numx4uccwv86l2mzvdtyk06nvxjk', 'eyJFbWFpbCI6InBwcmFzaGFudGhpMTY5QGdtYWlsLmNvbSIsIlVzZXJfaWQiOjJ9:1qoHqE:wRC6U1pTVsFFu39JAmezu3tdf7SLK4www4V9tp75ygU', '2023-10-19 06:28:10.060320'),
('xmrtx12dqcybvf9vokfehlamuyz25qo1', 'eyJVc2VyX2lkIjoyLCJyZXN1bHQiOiJsYXJnZS1jZWxsIGNhcmNpbm9tYSIsInVwbG9hZGVkX2ltYWdlX3VybCI6Ii9tZWRpYS8zX1VIbEdJODgucG5nIn0:1qoN8w:ZjA6gnkRUSwtak4TDuB8LsOKgLp_yNfSVMiOiBU9-2k', '2023-10-19 12:07:50.781051'),
('unief9gszpadsrl2y8y7bg8daeoe1k39', 'eyJVc2VyX2lkIjoyLCJyZXN1bHQiOiJsYXJnZS1jZWxsLWNhcmNpbm9tYSIsInVwbG9hZGVkX2ltYWdlX3VybCI6Ii9tZWRpYS84X2pLcDUySTEucG5nIn0:1qogMz:4hUovriR2s_3j_-smK3giSUxkYI3oJMiNiQKEG8ttDA', '2023-10-20 08:39:37.455187');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_details`
--

DROP TABLE IF EXISTS `feedback_details`;
CREATE TABLE IF NOT EXISTS `feedback_details` (
  `Feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `Rating` varchar(100) DEFAULT NULL,
  `Review` varchar(225) DEFAULT NULL,
  `Sentiment` varchar(100) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `Reviewer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Feed_id`),
  KEY `feedback_details_Reviewer_id_13cf49be` (`Reviewer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback_details`
--

INSERT INTO `feedback_details` (`Feed_id`, `Rating`, `Review`, `Sentiment`, `datetime`, `Reviewer_id`) VALUES
(11, '2', 'bad', 'very negative', '2023-10-06 07:37:55.186414', 2),
(10, '4', 'Good', 'positive', '2023-10-06 07:37:50.543464', 2),
(9, '3', 'average', 'neutral', '2023-10-06 07:37:45.788612', 2),
(8, '3', 'ok', 'positive', '2023-10-06 07:37:37.246402', 2),
(7, '5', 'very very good', 'very positive', '2023-10-06 07:37:29.982073', 2),
(12, '1', 'very very bad', 'very negative', '2023-10-06 07:38:03.549642', 2);

-- --------------------------------------------------------

--
-- Table structure for table `manage_users`
--

DROP TABLE IF EXISTS `manage_users`;
CREATE TABLE IF NOT EXISTS `manage_users` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_Profile` varchar(100) NOT NULL,
  `User_Email` varchar(50) NOT NULL,
  `User_Status` varchar(10) NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

DROP TABLE IF EXISTS `upload`;
CREATE TABLE IF NOT EXISTS `upload` (
  `Data_id` int(11) NOT NULL AUTO_INCREMENT,
  `Image` varchar(100) NOT NULL,
  PRIMARY KEY (`Data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload`
--

INSERT INTO `upload` (`Data_id`, `Image`) VALUES
(1, 'media/1.png'),
(2, 'media/2.png'),
(3, 'media/8.png'),
(4, 'media/8_ii3AHdK.png'),
(5, 'media/3.png'),
(6, 'media/3_WNuknTT.png'),
(7, 'media/8_fATTO2Q.png'),
(8, 'media/2_PrKmyJY.png'),
(9, 'media/8_XTW03ze.png'),
(10, 'media/9.png'),
(11, 'media/8_z2dxLQ8.png'),
(12, 'media/3_SK2llm9.png'),
(13, 'media/4.png'),
(14, 'media/8_k6n01iy.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` longtext DEFAULT NULL,
  `Address` longtext DEFAULT NULL,
  `Phone` longtext DEFAULT NULL,
  `Date_Time` datetime(6) DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `Last_Login_Date` date DEFAULT NULL,
  `Last_Login_Time` time(6) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `No_Of_Times_Login` int(11) DEFAULT NULL,
  `Otp_Num` int(11) DEFAULT NULL,
  `Otp_Status` longtext DEFAULT NULL,
  `User_Status` longtext DEFAULT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `Name`, `Age`, `Email`, `Password`, `Address`, `Phone`, `Date_Time`, `Image`, `Last_Login_Date`, `Last_Login_Time`, `Message`, `No_Of_Times_Login`, `Otp_Num`, `Otp_Status`, `User_Status`) VALUES
(2, 'prashanthiii', 27, 'pprashanthi169@gmail.com', 'Amma@123', '8-3-232/b/50/c/6 , venkatagiri, yousufguda , hyderabad', '9949803766', '2023-10-06 08:41:18.695573', 'images/rose_Z54BpLg.jpg', '2023-10-06', '14:11:18.000000', NULL, 29, 1983, 'verified', 'accepted'),
(3, 'Prashanthi', 26, 'pprashanthi3766@gmail.com', 'Kutty@123', '8-3-232/b/50/c/6 , venkatagiri, yousufguda , hyderabad', '9949803766', '2023-10-05 06:43:01.197731', 'images/IMG-20230501-WA0005.jpg', '2023-10-05', NULL, NULL, 0, 5216, 'verified', 'accepted');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
