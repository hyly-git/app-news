-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2017 at 12:19 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_news`
--

-- --------------------------------------------------------

--
-- Table structure for table `mxbx_news`
--

CREATE TABLE `mxbx_news` (
  `ID` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text NOT NULL,
  `news_keywords` text,
  `meta_descriptions` text,
  `images` text NOT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `featured_popular` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mxbx_news_authors`
--

CREATE TABLE `mxbx_news_authors` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `social_links` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `google_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mxbx_news_counter`
--

CREATE TABLE `mxbx_news_counter` (
  `news_id` int(11) NOT NULL,
  `views_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mxbx_taxonomy`
--

CREATE TABLE `mxbx_taxonomy` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxonomy_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `term_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) NOT NULL,
  `body_type` int(10) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order` int(11) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mxbx_taxonomy_news`
--

CREATE TABLE `mxbx_taxonomy_news` (
  `news_id` int(11) NOT NULL,
  `taxonomy_id` int(11) NOT NULL,
  `taxonomy_type` varchar(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mxbx_trending_news`
--

CREATE TABLE `mxbx_trending_news` (
  `ID` int(11) NOT NULL,
  `news_id` int(10) DEFAULT NULL,
  `date_view` datetime NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mxbx_users`
--

CREATE TABLE `mxbx_users` (
  `ID` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ar` varchar(500) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `city` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `register_type` varchar(30) NOT NULL,
  `verifyCode` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `permissions` text,
  `image` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mxbx_user_meta`
--

CREATE TABLE `mxbx_user_meta` (
  `user_id` int(11) NOT NULL,
  `meta_key` enum('saved_vehicles','saved_searches') DEFAULT NULL,
  `meta_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mxbx_news`
--
ALTER TABLE `mxbx_news`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mxbx_news_authors`
--
ALTER TABLE `mxbx_news_authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `mxbx_news_counter`
--
ALTER TABLE `mxbx_news_counter`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `mxbx_taxonomy`
--
ALTER TABLE `mxbx_taxonomy`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mxbx_trending_news`
--
ALTER TABLE `mxbx_trending_news`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mxbx_users`
--
ALTER TABLE `mxbx_users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mxbx_news`
--
ALTER TABLE `mxbx_news`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mxbx_news_authors`
--
ALTER TABLE `mxbx_news_authors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mxbx_taxonomy`
--
ALTER TABLE `mxbx_taxonomy`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mxbx_trending_news`
--
ALTER TABLE `mxbx_trending_news`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mxbx_users`
--
ALTER TABLE `mxbx_users`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
