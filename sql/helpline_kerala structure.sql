-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 27, 2021 at 10:33 AM
-- Server version: 5.7.34
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpline_kerala`
--

-- --------------------------------------------------------

--
-- Table structure for table `localbodies`
--

CREATE TABLE `localbodies` (
  `id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8,
  `post_date` varchar(100) NOT NULL,
  `post_time` varchar(100) NOT NULL,
  `latitude` varchar(200) DEFAULT NULL,
  `longitude` varchar(200) DEFAULT NULL,
  `all_user` tinyint(1) NOT NULL DEFAULT '0',
  `common_citizen` tinyint(1) NOT NULL DEFAULT '0',
  `police` tinyint(1) NOT NULL DEFAULT '0',
  `fire_force` tinyint(1) NOT NULL DEFAULT '0',
  `rapid_force` tinyint(1) NOT NULL DEFAULT '0',
  `medical` tinyint(1) NOT NULL DEFAULT '0',
  `finance` tinyint(1) NOT NULL DEFAULT '0',
  `gov_authority` tinyint(1) NOT NULL DEFAULT '0',
  `verified_user_id` int(11) DEFAULT NULL,
  `deleted_at` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_assets`
--

CREATE TABLE `post_assets` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `image_video` varchar(5000) NOT NULL,
  `path` varchar(200) NOT NULL DEFAULT 'http://api.helplinekerala.com/assets/'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `localbody` int(11) NOT NULL,
  `area` varchar(100) NOT NULL,
  `blood_group` varchar(11) NOT NULL,
  `profile_pic` varchar(200) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `localbodies`
--
ALTER TABLE `localbodies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_assets`
--
ALTER TABLE `post_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `localbodies`
--
ALTER TABLE `localbodies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_assets`
--
ALTER TABLE `post_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
