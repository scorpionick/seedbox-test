-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 31, 2020 at 09:18 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SeedBoxWeb`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(12, '2016_06_01_000004_create_oauth_clients_table', 2),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(16, '2020_03_28_175854_add_roles_to_users', 3),
(17, '2020_03_28_203421_create_servers_table', 4),
(21, '2020_03_29_192850_add_column_to_server_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0297e33f6c62fed05ef2b76c99b84730516faf47d8c928c6d7fc92c6829d02d2240b3454d0097c51', 1, 1, 'Access Token', '[]', 0, '2020-03-29 02:18:10', '2020-03-29 02:18:10', '2020-03-29 22:18:10'),
('10573d4b2b8d2d1a410f6b34ca2e26d8d5d152b7f89176e91b081383a4c6ce27815f5753ec686a15', 1, 1, 'Access Token', '[]', 0, '2020-03-29 19:44:38', '2020-03-29 19:44:38', '2020-03-30 15:44:38'),
('109d520efb23587bd4ff01be5a79e705c0fb9216776536df379f6f66ede3874461f9316e2c91e067', 1, 1, 'Access Token', '[]', 0, '2020-03-29 19:46:51', '2020-03-29 19:46:51', '2020-03-30 15:46:51'),
('1458b8cf9da1a344fbc9c0f109837d2a88bc74ec2f233c9799c5396527019f15bb8196c81cf5f673', 1, 1, 'Access Token', '[]', 0, '2020-03-28 23:53:23', '2020-03-28 23:53:23', '2020-03-29 19:53:23'),
('179c3da75427a57210272dd280308d692ec35465b676b2d3e66e3c8361c03b647020db4c02ed0225', 1, 1, 'Access Token', '[]', 0, '2020-03-29 19:51:30', '2020-03-29 19:51:30', '2020-03-30 15:51:30'),
('1977f3745598f1e022f7eb0a35bdba7ba56353be1a55d59b52699dfa4f3382df6ba14d3713b7692e', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:38:30', '2020-03-31 23:38:30', '2020-04-01 19:38:30'),
('1c37918f7334778ad15be2b093ed41df199f96199d0d163f270a7fee6af412ffe4bddcded593f07c', 1, 1, 'Access Token', '[]', 0, '2020-03-29 02:17:00', '2020-03-29 02:17:00', '2020-03-29 22:16:57'),
('30665e89a6633ed7b388def0bf883e647199f2ba2291fe79111397f7d1d9607a449f562b7188e9c7', 1, 1, 'Access Token', '[]', 0, '2020-03-31 22:48:20', '2020-03-31 22:48:20', '2020-04-01 18:48:20'),
('3909752d46e02f8b906eb770b1fac223eb598525dc6de285769c3c3b45380085c9e9e3a2a25e0793', 1, 1, 'Access Token', '[]', 0, '2020-03-29 02:21:48', '2020-03-29 02:21:48', '2020-03-29 22:21:43'),
('3a11ea6fbedf3cdc4920b0940617051ab9b834da3438f5d29b5ffd9e6e99f52ad30b06f004d0ca41', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:34:53', '2020-03-31 23:34:53', '2020-04-01 19:34:47'),
('3d333ff345ca39baf6e9049bd8b2f1831ecef44deb9a7b55ba79c0fdb9ea8a4bdd8d4c2f6a8ac86d', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:37:46', '2020-03-31 23:37:46', '2020-04-01 19:37:40'),
('425ce478127836923d21b6bb84a69681aec91ad74b0442a1433dbc504abe33b7cf28e444a99fe51c', 1, 1, 'Access Token', '[]', 0, '2020-03-29 01:43:22', '2020-03-29 01:43:22', '2020-03-29 21:43:22'),
('45e8f8e9eaf8e67da05971b4a473a3e716bbd42abd1742628d0444d551709be5a827d77ac47aa5d8', 1, 1, 'Access Token', '[]', 0, '2020-03-31 22:59:49', '2020-03-31 22:59:49', '2020-04-01 18:59:48'),
('48369c89fc18b42cbbe110f8f0d6722f876e32583529283f9f4a2dcbfb7ec876e22824780ed81f09', 1, 1, 'Access Token', '[]', 0, '2020-03-29 02:20:21', '2020-03-29 02:20:21', '2020-03-29 22:20:21'),
('539259d0e6eeb4f00d24b516613e09634a314a6f8c72e2ecead9264bacd3ac50ad7f425037b03eb6', 1, 1, 'Access Token', '[]', 0, '2020-03-31 22:57:04', '2020-03-31 22:57:04', '2020-04-01 18:57:04'),
('54ae86081b54a51df22626acdc2b11f713b3852b0f56c27d3f2b208a66adb2a0fa19aa5685de7bcd', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:55:19', '2020-03-31 23:55:19', '2020-04-01 19:55:17'),
('62bb42caa2a19032e1f6553323f4699ed2bc8c66820754e1c9e7ee67020ac72bd108263f62d51384', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:29:06', '2020-03-31 23:29:06', '2020-04-01 19:28:34'),
('63296d2bd89f93645076c002286c6664dba27db68f6be95eaf37276992334cac68568d42b2687920', 1, 1, 'Access Token', '[]', 0, '2020-03-29 20:27:54', '2020-03-29 20:27:54', '2020-03-30 16:27:52'),
('64037a0496ba134d5facdbd57818834c8d991c0260b49c1a3e8909a76770914f7785582806e70b1a', 1, 1, 'Access Token', '[]', 0, '2020-03-30 21:18:50', '2020-03-30 21:18:50', '2020-03-31 17:18:49'),
('664543594c4feba472001bddf415fdf7a7b779635d31c7f95f78e3b2fa3e7657429c356b574df715', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:52:09', '2020-03-31 23:52:09', '2020-04-01 19:52:07'),
('6daf8c5d0cc1c5aa0319b436b403a0c83d8822860ec8bd9b4e9d65a3da3ea2dbd4b5e2b87a56457c', 1, 1, 'Access Token', '[]', 0, '2020-03-29 02:19:18', '2020-03-29 02:19:18', '2020-03-29 22:19:17'),
('6fd7132441e474668a4814c77b4fe0caa3d61793e79398fdc5b71efddb0496f88cfd002762c1f897', 1, 1, 'Access Token', '[]', 0, '2020-03-29 22:46:05', '2020-03-29 22:46:05', '2020-03-30 18:45:59'),
('75531368df43dbd148d14b90db57ec0524c6323a4af53279aa530436b4d000a36b56ea0d6bdc061f', 1, 1, 'Access Token', '[]', 0, '2020-03-29 19:32:21', '2020-03-29 19:32:21', '2020-03-30 15:32:04'),
('7681072483ca0ac75beb8edf20f117ceb488a05fac7cb574865fbb4eac7d6c578e4b4fac58cc3208', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:43:06', '2020-03-31 23:43:06', '2020-04-01 19:43:03'),
('7e6f51568633cf579fe716c7974500fc532ad37d69c5fb7de8ddf1063e63a960fd22995b137c50f2', 1, 1, 'Access Token', '[]', 0, '2020-03-31 22:25:05', '2020-03-31 22:25:05', '2020-04-01 18:25:05'),
('8d490917b764af0dda44b2d17a91bf64d1517f68d8cb4ce7084f43034ef405b8133d8fdb31d27a87', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:28:25', '2020-03-31 23:28:25', '2020-04-01 19:28:21'),
('91ac909ac5763502d13618370ce49bb0f3ab240f393ea8e9fe6b6b0709ae4c3289bbdf079ad1066b', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:27:23', '2020-03-31 23:27:23', '2020-04-01 19:27:15'),
('933ddbf4afb7f1b3b6dcf5f03e5a26c1c6e4231688e43bb58ed7db37e29b37d95061e3ea46863d2f', 1, 1, 'Access Token', '[]', 0, '2020-03-28 23:48:48', '2020-03-28 23:48:48', '2020-03-29 19:48:48'),
('c1d44110f8b12cd862fba25f09fd93efb18b201748e3d22f52c8ca69f456ea05521b06c9a503a150', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:27:02', '2020-03-31 23:27:02', '2020-04-01 19:26:56'),
('c562642219e972a59b2e7225cb1fd88a99470e1073a23c45640abdf4fc696598f2a931c11a8ad26a', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:37:55', '2020-03-31 23:37:55', '2020-04-01 19:37:52'),
('c956183d919fefaed07535668513584008b56e0bcb814ea64cd0681f4191b527dafad70fbf8a332c', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:34:53', '2020-03-31 23:34:53', '2020-04-01 19:34:47'),
('ca18ed9079f4b8c601cbd774f452b0600c4738e36cba1a894655b7a07e72b6b5a04cfd3e255917c5', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:00:37', '2020-03-31 23:00:37', '2020-04-01 19:00:37'),
('d721c69428f56ffceeb322a04e14d5327a395548d8a45c753e4f0cd1572808a6725a9f21e58be7c8', 1, 1, 'Access Token', '[]', 0, '2020-03-30 18:18:00', '2020-03-30 18:18:00', '2020-03-31 14:18:00'),
('e49c93835986bd131d2d8290f1f1d4019f35005242282998bec160ee5a6c25c2425e719dd848f30d', 1, 1, 'Access Token', '[]', 0, '2020-03-31 22:26:47', '2020-03-31 22:26:47', '2020-04-01 18:26:47'),
('f33f5e250503c90d65da2ff1290c596665cc9191764ed85f58367ac120ac4d3a63f1fe626b01452c', 1, 1, 'Access Token', '[]', 0, '2020-03-31 23:46:16', '2020-03-31 23:46:16', '2020-04-01 19:46:16'),
('f7e50fbe854541f15231a9be3f6e574ea30d663621617299090cfcce185cc8fa518409eeacc4f890', 1, 1, 'Access Token', '[]', 0, '2020-03-28 23:34:59', '2020-03-28 23:34:59', '2020-03-29 19:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'SeedBox Technical Test Personal Access Client', 'hR5qbnjxccoNsYq7rqaVo8Aks7MiUOnJlLBuCpdu', 'http://localhost', 1, 0, 0, '2020-03-28 22:46:57', '2020-03-28 22:46:57'),
(2, NULL, 'SeedBox Technical Test Password Grant Client', 'pmsBmG1OSJ3nZ7RXouMAcOMsHO9RRDC13sUMuRiA', 'http://localhost', 0, 1, 0, '2020-03-28 22:46:57', '2020-03-28 22:46:57'),
(3, 1, 'ServerApi', '6dxFm7xy6BZnChKt6LWI0r1Lf118gQLa7RB0Lxxq', 'http://seedboxtest.develop/admin', 0, 0, 0, '2020-03-31 23:42:23', '2020-03-31 23:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-03-28 22:46:57', '2020-03-28 22:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '["USER"]',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `roles`, `created_at`, `updated_at`) VALUES
(1, 'User', 'user@seedbox.com', '2020-03-28 22:25:41', '$2y$10$e7wj3nRqVFKYlCK2xy2XmOt09q8x1W4nWAdGKERD2RYAKGu.DkfZC', NULL, '["USER"]', '2020-03-28 22:28:44', '2020-03-28 22:28:44'),
(2, 'Admin', 'admin@seedbox.com', '2020-03-28 22:31:47', '$2y$10$8TI4i20dO78m1VNlCuegKumjI4JOM0CnSycq18Fj3qz3/rLKJ9OXG', NULL, '["USER","ADMIN"]', '2020-03-28 22:31:57', '2020-03-28 22:31:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
