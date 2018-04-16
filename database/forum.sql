-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2018 at 12:07 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `user_id`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(1, 'This is my first comment for this post', 1, 1, 'App\\Thread', '2017-12-27 20:00:57', '2017-12-27 20:00:57'),
(2, 'now i have to check out this cmment', 1, 2, 'App\\Thread', '2017-12-28 07:56:05', '2017-12-28 07:56:05'),
(3, 'wow lets check out how this goes', 1, 3, 'App\\Thread', '2017-12-28 08:03:46', '2017-12-28 08:03:46'),
(4, 'this reply to the comment is polymorphic', 1, 3, 'App\\Comment', '2017-12-28 08:16:46', '2017-12-28 08:16:46'),
(5, 'this is probably a good way to start', 4, 5, 'App\\Thread', '2017-12-31 05:37:02', '2017-12-31 05:37:02'),
(6, 'well you need to knw wat u r doing', 4, 7, 'App\\Thread', '2018-01-02 12:18:53', '2018-01-02 12:18:53'),
(7, 'ok then', 4, 7, 'App\\Thread', '2018-01-02 12:21:39', '2018-01-02 12:21:39'),
(8, 'wel i have to cross check some things', 4, 7, 'App\\Thread', '2018-01-05 12:56:45', '2018-01-05 12:56:45');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `likable_id` int(11) NOT NULL,
  `likable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `likable_id`, `likable_type`, `created_at`, `updated_at`) VALUES
(8, 4, 3, 'App\\Comment', '2018-01-02 08:11:56', '2018-01-02 08:11:56'),
(9, 4, 7, 'App\\Comment', '2018-01-02 12:24:30', '2018-01-02 12:24:30'),
(11, 4, 8, 'App\\Comment', '2018-01-05 13:10:33', '2018-01-05 13:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2014_10_12_000000_create_users_table', 1),
(7, '2014_10_12_100000_create_password_resets_table', 1),
(8, '2017_12_24_070217_create_threads_table', 1),
(9, '2017_12_26_051503_add_user_id_to_threads', 1),
(10, '2017_12_27_122829_create_comments_table', 1),
(11, '2017_12_29_145611_add_solution_column_threads_table', 2),
(12, '2017_12_31_064747_create_likes_table', 3),
(13, '2018_01_03_114633_create_notifications_table', 4),
(14, '2018_01_06_154542_create_tags_table', 5),
(15, '2018_01_06_164929_create_tags_thread_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'java', '2018-01-01 06:32:02', '2018-01-02 04:04:04'),
(2, 'php', '2018-01-06 16:54:00', '2018-01-06 07:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `tag_thread`
--

CREATE TABLE `tag_thread` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_thread`
--

INSERT INTO `tag_thread` (`id`, `thread_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 9, 1, NULL, NULL),
(2, 9, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thread` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `solution` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `subject`, `thread`, `type`, `created_at`, `updated_at`, `user_id`, `solution`) VALUES
(2, 'Question', 'this could be frustrating as e no easy for person to dey do all these rubbish', 'threading', '2017-12-28 07:49:24', '2017-12-28 07:49:24', 1, NULL),
(3, 'Java TUTORIAL things', 'this text don tire me to type i must learn database seeders and fakers to be sure i dont stress myself typing', 'tutorial', '2017-12-28 07:50:50', '2017-12-28 07:50:50', 1, NULL),
(4, 'Laravel', 'This thread is used to test for all the necessary things for everyone', 'Discussion', '2017-12-29 14:22:38', '2017-12-29 14:22:38', 3, NULL),
(5, 'Data Structure', 'This datastructure na him every body dey use change am for me for all this side and i dey very tired', 'Algorithms', '2017-12-29 14:26:17', '2017-12-31 05:49:37', 3, 5),
(6, 'Being tired', 'well this life no easy for any man oooo person just dey collect anyhow', 'Observation', '2018-01-02 08:28:57', '2018-01-02 08:28:57', 4, NULL),
(7, 'checkout', 'this information is used to checkout the information necessary', 'This type of things', '2018-01-02 12:17:32', '2018-01-02 12:17:32', 4, NULL),
(8, 'NEWS FEED', 'this is a dummy text that is supposed to be liked by the other post users', 'Entertainment', '2018-01-05 14:11:00', '2018-01-05 14:11:00', 4, NULL),
(9, 'confirm this', 'This thread will be used to confirm somethings that are needed for life', NULL, '2018-01-06 18:13:25', '2018-01-06 18:13:25', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'mfon', 'mfon@me.com', '$2y$10$TAenJfirc8fDjw2sJyb5VOA4SJRF51eRxqKYq.bxlUh7WMpibhdOK', NULL, '2017-12-27 19:59:09', '2017-12-27 19:59:09'),
(2, 'Adebolu Adeyiwunmi', 'adeboludeyi@gmail.com', '$2y$10$2WpYkkQmj/me7AJiO/GCxeAy8pwPS2AT9T23CBsWUEIP7Qu3477eO', 'LkKBNbIC6uKn253ov3HYWSEN3RYB9MPL52eoA9MnLypOGBm7BE8Lj5BX8ufx', '2017-12-28 17:23:18', '2017-12-28 17:23:18'),
(3, 'Imoh Simon', 'imohsis@gmail.com', '$2y$10$abnXwDeNCUBGZEfXo1Hia.1gRYZJ37NgT4rIjKpt00Lep1QE1ULn6', NULL, '2017-12-29 14:20:27', '2017-12-29 14:20:27'),
(4, 'ppppp', 'ppp@pp.com', '$2y$10$zpcQ7y9qzjUKQ6q9anFSkOk2SnxVQP0.wJIA/kl7CUuAdgjtAbgHe', NULL, '2017-12-31 05:30:25', '2017-12-31 05:30:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_thread`
--
ALTER TABLE `tag_thread`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tag_thread`
--
ALTER TABLE `tag_thread`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
