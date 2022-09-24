-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 24, 2022 at 11:35 PM
-- Server version: 10.3.34-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `analytics`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add products', 7, 'add_products'),
(26, 'Can change products', 7, 'change_products'),
(27, 'Can delete products', 7, 'delete_products'),
(28, 'Can view products', 7, 'view_products'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category');

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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(8, 'inventory', 'category'),
(7, 'inventory', 'products'),
(5, 'sessions', 'session'),
(6, 'users', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'users', '0001_initial', '2022-09-24 14:42:01.627195'),
(2, 'contenttypes', '0001_initial', '2022-09-24 14:42:01.640183'),
(3, 'admin', '0001_initial', '2022-09-24 14:42:01.673907'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-09-24 14:42:01.678584'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-09-24 14:42:01.682469'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-09-24 14:42:01.709562'),
(7, 'auth', '0001_initial', '2022-09-24 14:42:01.774788'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-09-24 14:42:01.789245'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-09-24 14:42:01.794514'),
(10, 'auth', '0004_alter_user_username_opts', '2022-09-24 14:42:01.800796'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-09-24 14:42:01.805520'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-09-24 14:42:01.808491'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-09-24 14:42:01.814272'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-09-24 14:42:01.819589'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-09-24 14:42:01.825324'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-09-24 14:42:01.834885'),
(17, 'auth', '0011_update_proxy_permissions', '2022-09-24 14:42:01.841800'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-09-24 14:42:01.849404'),
(19, 'inventory', '0001_initial', '2022-09-24 14:42:01.873181'),
(20, 'sessions', '0001_initial', '2022-09-24 14:42:01.884736'),
(21, 'inventory', '0002_alter_category_cat_id', '2022-09-24 14:42:59.593154'),
(22, 'inventory', '0003_rename_cat_id_category_cat_alter_category_name', '2022-09-24 14:57:02.952971'),
(23, 'inventory', '0004_alter_category_cat', '2022-09-24 15:00:42.187724'),
(24, 'inventory', '0005_remove_category_cat_category_cat', '2022-09-24 15:03:48.374908'),
(25, 'inventory', '0006_rename_cat_category_self_category', '2022-09-24 19:42:25.711367');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_category`
--

CREATE TABLE `inventory_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_category`
--

INSERT INTO `inventory_category` (`id`, `name`) VALUES
(2, 'cricket'),
(16, 'hockey'),
(1, 'sports'),
(17, 'sports swimming'),
(4, 'updated basketball');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_category_self_category`
--

CREATE TABLE `inventory_category_self_category` (
  `id` bigint(20) NOT NULL,
  `from_category_id` bigint(20) NOT NULL,
  `to_category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_category_self_category`
--

INSERT INTO `inventory_category_self_category` (`id`, `from_category_id`, `to_category_id`) VALUES
(1, 1, 2),
(34, 1, 16),
(3, 2, 1),
(35, 2, 16),
(43, 4, 17),
(32, 16, 1),
(33, 16, 2),
(42, 16, 17),
(41, 17, 4),
(40, 17, 16);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_products`
--

CREATE TABLE `inventory_products` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory_products`
--

INSERT INTO `inventory_products` (`id`, `name`, `price`) VALUES
(1, 'updated saredon', NULL),
(2, 'glucouse', 40),
(6, 'updated vicks', 20);

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `id` bigint(20) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `password` varchar(1024) NOT NULL,
  `registered_on` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`id`, `last_login`, `name`, `email`, `phone`, `password`, `registered_on`, `is_active`, `is_deleted`) VALUES
(1, NULL, 'shan', 'sample@gmail.com', '9123456789', 'pbkdf2_sha256$390000$TIykYmeoDcZxqxQ1NI1klc$pZD1RF74JdM0Ny8BTjvx3DDFnq1u+BTUqdgvVeV2i4A=', '2022-09-24 20:00:51.800468', 1, 0),
(2, NULL, 'shan', 'shanker@gmail.com', '9123456789', 'pbkdf2_sha256$390000$L0ZjOaYWh65ty4dWsYvQPu$zMRn7mjThdA/5DXuMlTIrwzF4KgGkqQ2tJmd9lGsgGg=', '2022-09-24 20:08:11.189435', 1, 0),
(3, NULL, 'shan', 'shan@gmail.com', '9123456789', 'pbkdf2_sha256$390000$FCWRUaOBNKS5QThOMzGGmH$6/5UUpeHmwW9ON36gS0hUmdvSPZAW0sRC/4wiwKJ7mg=', '2022-09-24 22:29:16.074773', 1, 0),
(4, NULL, 'shan', 'abc1@gmail.com', '9012345678', 'pbkdf2_sha256$390000$UKn06wGdH6VzxrcgXJ5ezi$aY9FyHq8/tpDHtBKAtPNt+xCRI1giHTIUvvwPDsa9fU=', '2022-09-24 23:32:42.995951', 1, 0);

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
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`);

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
-- Indexes for table `inventory_category`
--
ALTER TABLE `inventory_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_category_name_c89a8bc0_uniq` (`name`);

--
-- Indexes for table `inventory_category_self_category`
--
ALTER TABLE `inventory_category_self_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_category_cat_from_category_id_to_cate_6699b056_uniq` (`from_category_id`,`to_category_id`),
  ADD KEY `inventory_category_c_to_category_id_73e701fc_fk_inventory` (`to_category_id`);

--
-- Indexes for table `inventory_products`
--
ALTER TABLE `inventory_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `inventory_category`
--
ALTER TABLE `inventory_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `inventory_category_self_category`
--
ALTER TABLE `inventory_category_self_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `inventory_products`
--
ALTER TABLE `inventory_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users_user`
--
ALTER TABLE `users_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `inventory_category_self_category`
--
ALTER TABLE `inventory_category_self_category`
  ADD CONSTRAINT `inventory_category_c_from_category_id_0ad87a2c_fk_inventory` FOREIGN KEY (`from_category_id`) REFERENCES `inventory_category` (`id`),
  ADD CONSTRAINT `inventory_category_c_to_category_id_73e701fc_fk_inventory` FOREIGN KEY (`to_category_id`) REFERENCES `inventory_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
