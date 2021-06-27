-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 27, 2021 at 10:34 AM
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

--
-- Dumping data for table `localbodies`
--

INSERT INTO `localbodies` (`id`, `district_id`, `label`, `name`) VALUES
(1, 1, 'PANJAYTH', 'CHEMMARUTHI'),
(2, 1, 'MUNCIPALITY', 'ATTINGAL'),
(3, 1, 'MUNCIPALITY', 'NEYYATTINKARA'),
(4, 2, 'PANJAYTH', 'ALAPAD'),
(5, 2, 'PANJAYTH', 'ANCHAL'),
(6, 2, 'MUNCIPALITY', 'PUNALUR'),
(7, 2, 'MUNCIPALITY', 'PARAVOOR'),
(8, 3, 'PANJAYTH', 'ARUVAPPULAM'),
(9, 3, 'PANJAYTH', 'AYROOR'),
(10, 3, 'PANJAYTH', 'CHERUKOLE'),
(11, 3, 'MUNCIPALITY', 'THIRUVALLA'),
(12, 3, 'MUNCIPALITY', 'PANDALAM'),
(13, 4, 'PANJAYTH', 'ARANMULA'),
(14, 4, 'PANJAYTH', 'AROOR'),
(15, 4, 'MUNCIPALITY', 'CHENGANNUR'),
(16, 4, 'MUNCIPALITY', 'CHERTHALA'),
(17, 5, 'PANJAYTH', 'ERUMELI'),
(18, 5, 'PANJAYTH', 'ELIKULAM'),
(19, 5, 'PANJAYTH', 'KADANAD'),
(20, 5, 'MUNCIPALITY', 'PALAI'),
(21, 5, 'MUNCIPALITY', 'VAIKOM'),
(22, 6, 'PANJAYTH', 'ADIMALY'),
(23, 6, 'PANJAYTH', 'ALAKODE'),
(24, 6, 'PANJAYTH', 'ARAKULAM'),
(25, 6, 'PANJAYATH', 'BISNOVALLEY'),
(26, 6, 'PANJAYTH', 'DEVIKULAM'),
(27, 6, 'MUNCIPALITY', 'THODUPUZHA'),
(28, 6, 'MUNCIPALITY', 'KATTAPPANA'),
(29, 7, 'PANJAYTH', 'AIKKARANDU'),
(30, 7, 'PANJAYTH', 'AVOLI'),
(31, 7, 'PANJAYTH', 'AYAVANA'),
(32, 7, 'PANJAYTH', 'AYYAMPUZHA'),
(33, 7, 'PANJAYTH', 'CHELLANAM'),
(34, 7, 'MUNCIPALITY', 'ALUVA'),
(35, 7, 'MUNCIPALITY', 'KALAMASSERY'),
(36, 8, 'PANJAYTH', 'ADAT'),
(37, 8, 'PANJAYTH', 'ALOOR'),
(38, 8, 'PANJAYTH', 'ANNAMNADA'),
(39, 8, 'PANJAYTH', 'ANTHIKKADE'),
(40, 8, 'PANJAYTH', 'ARIMPUR'),
(41, 8, 'MUNCIPALITY', 'CHALAKKUDY'),
(42, 8, 'MUNCIPALITY', 'KODUNGALLUR'),
(43, 9, 'PANJAYTH', 'AGALI'),
(44, 9, 'PANJAYTH', 'AKATHEHTARA'),
(45, 9, 'PANJAYTH', 'ALANALLUR'),
(46, 9, 'PANJAYTH', 'ALATHUR'),
(47, 9, 'PANJAYTH', 'AMBALAPARA'),
(48, 9, 'MUNCIPALITY', 'SOHRNUR'),
(49, 9, 'MUNCIPALITY', 'PATTAMBI'),
(50, 10, 'PANJAYTH', 'A.R.NAGAR'),
(51, 10, 'PANJAYTH', 'ALAMKODE'),
(52, 10, 'PANJAYTH', 'ALIPARAMBU'),
(53, 10, 'PANJAYTH', 'AMARAMBALAM'),
(54, 10, 'PANJAYTH', 'ANAKKAYAM'),
(55, 10, 'MUNCIPALITY', 'PONNANI'),
(56, 10, 'MUNCIPALITY', 'TIRUR'),
(57, 11, 'PANJAYTH', 'ARRIKKULAM'),
(58, 11, 'PANJAYTH', 'ATHOLY'),
(59, 11, 'PANJAYTH', 'AYANCHERI'),
(60, 11, 'PANJAYTH', 'AZHIYUR'),
(61, 11, 'PANJAYTH', 'BALUSSERI'),
(62, 11, 'PANJAYTH', 'CHAKKITTAPPARA'),
(63, 11, 'PANJAYTH', 'CHANGAROTH'),
(64, 11, 'PANJAYTH', 'CHATHAMANGALAM'),
(65, 11, 'MUNCIPALITY', 'KOYILANDY'),
(66, 11, 'MUNCIPALITY', 'VADAKARA'),
(67, 12, 'PANJAYTH', 'AMBALAVAYAL'),
(68, 12, 'PANJAYTH', 'EDAVAKA'),
(69, 12, 'PANJAYTH', 'KANIYAMBETTA'),
(70, 12, 'PANJAYTH', 'KOTTATHARA'),
(71, 12, 'PANJAYTH', 'MEENANGADI'),
(72, 12, 'PANJAYTH', 'MEPPADI'),
(73, 12, 'PANJAYTH', 'MULLANKOLLY'),
(74, 12, 'PANJAYTH', 'MUPPAINADU'),
(75, 12, 'MUNCIPALITY', 'MANANTHAVADY'),
(76, 12, 'MUNCIPALITY', 'SULTHAN BATHERY'),
(77, 13, 'PANJAYTH', 'ALAKKODE'),
(78, 13, 'PANJAYTH', 'ANJARAKKANDI'),
(79, 13, 'PANJAYTH', 'ARALAM'),
(80, 13, 'PANJAYTH', 'AYYANKKUNNU'),
(81, 13, 'PANJAYTH', 'AZHIKKODE'),
(82, 13, 'PANJAYTH', 'CHAPPARAPPADAVU'),
(83, 13, 'PANJAYTH', 'CHEMBILODE'),
(84, 13, 'PANJAYTH', 'CHENGALAI'),
(85, 13, 'PANJAYTH', 'CHERUKUNNU'),
(86, 13, 'PANJAYTH', 'CHERUPUZHA'),
(87, 13, 'PANJAYTH', 'CHIRAKKAL'),
(88, 13, 'PANJAYTH', 'CHOKLI'),
(89, 13, 'MUNCIPALITY', 'KOOTHPARAMBU'),
(90, 13, 'MUNCIPALITY', 'PAYYANUR'),
(91, 13, 'MUNCIPALITY', 'IRITTY'),
(92, 14, 'PANJAYATH', 'AJANUR'),
(93, 14, 'PANJAYATH', 'BADIADKA'),
(94, 14, 'PANJAYATH', 'BALAL'),
(95, 14, 'PANJAYTH', 'BEDADKA'),
(96, 14, 'PANJAYTH', 'BELLOOR'),
(97, 14, 'PANJAYTH', 'CHEMNAD'),
(98, 14, 'PANJAYTH', 'CHENGALA '),
(99, 14, 'PANJAYTH', 'CHERUVATHUR'),
(100, 14, 'PANJAYTH', 'DELAMPADY'),
(101, 14, 'PANJAYTH', 'EAST ELERI'),
(102, 14, 'PANJAYTH', 'ENMAKAJE'),
(103, 14, 'PANJAYTH', 'KALLAR'),
(104, 14, 'PANJAYTH', 'KARADKA'),
(105, 14, 'PANJAYTH', 'KODOM BELUR'),
(106, 14, 'PANJAYTH', 'KAYYUR CHEEMENI'),
(107, 14, 'PANJAYTH', 'KINANOOR KARINTHALAM'),
(108, 14, 'PANJAYTH', 'KUMBDAJE'),
(109, 14, 'PANJAYTH', 'KUMBALA'),
(110, 14, 'PANJAYTH', 'KUTTIKOL'),
(111, 14, 'PANJAYTH', 'MADHUR'),
(112, 14, 'PANJAYTH', 'MADIKAI'),
(113, 14, 'PANJAYTH', 'MANGALPADY'),
(114, 14, 'PANJAYTH', 'MANJESHWAR'),
(115, 14, 'PANJAYTH', 'MEENJA'),
(116, 14, 'PANJAYTH', 'MOGRAL PUTUR'),
(117, 14, 'PANJAYTH', 'MULIYAR'),
(118, 14, 'PANJAYTH', 'PADNE'),
(119, 14, 'PANJAYTH', 'PAIVALIKE'),
(120, 14, 'PANJAYTH', 'PALLIKKARE'),
(121, 14, 'PANJAYTH', 'PANATHADY'),
(122, 14, 'PANJAYTH', 'PILICODE'),
(123, 14, 'PANJAYTH', 'PULLUR PERIYA'),
(124, 14, 'PANJAYTH', 'PUTHIGE'),
(125, 14, 'PANJAYTH', 'TRIKARIPUR'),
(126, 14, 'PANJAYTH', 'VALIYAPARAMBA'),
(127, 14, 'PANJAYTH', 'VORKADI'),
(128, 14, 'PANJAYTH', 'WEST ELERI'),
(129, 14, 'MUNCIPALITY', 'KASARAGOD'),
(130, 14, 'MUNCIPALITY', 'KANHANGAD'),
(131, 14, 'MUNCIPALITY', 'NILESHWARAM');

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

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `user_id`, `message`, `post_date`, `post_time`, `latitude`, `longitude`, `all_user`, `common_citizen`, `police`, `fire_force`, `rapid_force`, `medical`, `finance`, `gov_authority`, `verified_user_id`, `deleted_at`, `status`) VALUES
(1, 1, 'Everyone has a compassionate heart, Helpline Kerala tries to find a solution with the help of technology to create a platform that connects the needy, their needs, campaigns for a cause to like-minded people who are near to them. We expect people to like you can create more impact than technology.', '24-05-2021', '12:47:06 pm', '12.728108', '74.944168', 1, 1, 1, 1, 1, 1, 0, 1, 2, '', 1),
(2, 1, 'हर किसी का दिल दयालु होता है, हेल्पलाइन केरल तकनीक की मदद से एक ऐसा मंच बनाने की कोशिश करता है जो जरूरतमंदों, उनकी जरूरतों को जोड़ता है, समान विचारधारा वाले लोगों के लिए अभियान चलाता है जो उनके करीब हैं। हम उम्मीद करते हैं कि लोग आपको पसंद करेंगे, तकनीक से ज्यादा प्रभाव पैदा कर सकते हैं।', '24-05-2021', '2:44:06 pm', '12.728108', '74.944168', 1, 1, 1, 1, 1, 1, 0, 1, 1, '', 1),
(3, 1, 'ಪ್ರತಿಯೊಬ್ಬರೂ ಸಹಾನುಭೂತಿಯುಳ್ಳ ಹೃದಯವನ್ನು ಹೊಂದಿದ್ದಾರೆ, ಸಹಾಯಕರ ಕೇರಳವು ತಂತ್ರಜ್ಞಾನದ ಸಹಾಯದಿಂದ ಅಗತ್ಯವಿರುವವರನ್ನು, ಅವರ ಅಗತ್ಯಗಳನ್ನು, ತಮ್ಮ ಹತ್ತಿರವಿರುವ ಸಮಾನ ಮನಸ್ಕ ಜನರಿಗೆ ಒಂದು ಕಾರಣಕ್ಕಾಗಿ ಅಭಿಯಾನಗಳನ್ನು ಸಂಪರ್ಕಿಸುವ ವೇದಿಕೆಯನ್ನು ರಚಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತದೆ. ಜನರು ನಿಮ್ಮನ್ನು ಇಷ್ಟಪಡುತ್ತಾರೆ ಎಂದು ನಾವು ನಿರೀಕ್ಷಿಸುತ್ತೇವೆ ತಂತ್ರಜ್ಞಾನಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ಪ್ರಭಾವವನ್ನು ಉಂಟುಮಾಡಬಹುದು.\n', '24-05-2021', '02:50:53 pm', '12.728108', '74.944168', 0, 1, 1, 0, 1, 0, 0, 1, 2, '', 1),
(4, 1, 'എല്ലാവർക്കും അനുകമ്പയുള്ള ഹൃദയമുണ്ട്, ആവശ്യക്കാരെ, അവരുടെ ആവശ്യങ്ങൾ, തങ്ങൾക്ക് സമീപമുള്ള സമാന ചിന്താഗതിക്കാരായ ആളുകൾക്ക് ഒരു ലക്ഷ്യത്തിനായി പ്രചാരണങ്ങൾ എന്നിവയുമായി ബന്ധിപ്പിക്കുന്ന ഒരു പ്ലാറ്റ്ഫോം സൃഷ്ടിക്കുന്നതിന് സാങ്കേതികവിദ്യയുടെ സഹായത്തോടെ ഒരു പരിഹാരം കണ്ടെത്താൻ ഹെൽപ്പ്ലൈൻ കേരളം ശ്രമിക്കുന്നു. സാങ്കേതികവിദ്യയേക്കാൾ കൂടുതൽ സ്വാധീനം സൃഷ്ടിക്കാൻ ആളുകൾക്ക് നിങ്ങളെ ഇഷ്ടപ്പെടുമെന്ന് ഞങ്ങൾ പ്രതീക്ഷിക്കുന്നു.\r\n', '24-05-2021', '03:45:38 pm', '12.728108', '74.944168', 1, 1, 1, 1, 1, 1, 0, 1, 2, '', 1),
(5, 2, 'Hello', '24-05-2021', '08:41:34 pm', '12.728108', '74.944168', 1, 1, 1, 1, 1, 1, 0, 1, 2, '', 2),
(7, 1, '', '30-05-2021', '04:46:01 pm', '12.728108', '74.944168', 1, 0, 1, 1, 0, 0, 0, 1, 1, '', 1),
(8, 1, 'Hello Friends ', '04-06-2021', '10:35:23 am', '12.728108', '74.944168', 1, 1, 1, 1, 1, 1, 0, 1, NULL, '', 0),
(9, 4, 'helpme', '04-06-2021', '11:53:42 am', '12.728108', '74.944168', 1, 1, 1, 1, 1, 1, 0, 1, 2, '', 1),
(10, 4, 'helpme', '04-06-2021', '11:53:43 am', '12.728108', '74.944168', 1, 1, 1, 1, 1, 1, 0, 1, 2, '', 1),
(11, 2, 'Hello HelpLine', '04-06-2021', '12:59:45 pm', '12.728108', '74.944168', 1, 1, 1, 1, 1, 1, 0, 1, 2, '', 1),
(12, 11, '50000/- for house plan ', '04-06-2021', '11:36:49 pm', '12.728108', '74.944168', 0, 1, 0, 0, 0, 0, 1, 1, 2, '', 2),
(13, 3, 'hi', '05-06-2021', '01:34:39 pm', '10.8505159', '76.2710833', 0, 0, 1, 0, 0, 0, 0, 0, NULL, '', 0),
(14, 11, 'I give 100000 for housing develop', '05-06-2021', '03:25:58 pm', '10.8505159', '76.2710833', 0, 1, 0, 0, 0, 0, 0, 0, NULL, '', 0),
(15, 3, 'help me iam in trouble', '05-06-2021', '03:55:44 pm', '10.8505159', '76.2710833', 0, 0, 0, 0, 1, 0, 0, 0, NULL, '', 0),
(16, 1, 'Hello Friends Test message.', '05-06-2021', '04:51:51 pm', '10.8505159', '76.2710833', 1, 1, 1, 1, 1, 1, 1, 1, 2, '', 1);

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

--
-- Dumping data for table `post_assets`
--

INSERT INTO `post_assets` (`id`, `post_id`, `type`, `image_video`, `path`) VALUES
(1, 7, 'image/png', '1_7_1.png', 'https://api.helplinekerala.com/assets/1_7_1.png'),
(2, 11, 'image/png', '2_11_2.png', 'https://api.helplinekerala.com/assets/2_11_2.png'),
(3, 16, 'image/jpeg', '1_16_3.png', 'https://api.helplinekerala.com/assets/1_16_3.png');

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `mobile`, `status`, `type`) VALUES
(1, 'Arun Jojo', '828d49eae6a4111904b9fa382dc319ee', '9400247717', 1, 'Common Citizen'),
(2, 'A J Creation', 'c6a5b7c15704a520cef2ee9da60690f0', '9495143027', 1, 'Government Authority'),
(3, 'ravikiran', 'f3221ade5edadf72a263f371f10ea5c2', '9633287064', 1, 'Common Citizen'),
(4, 'malavika', 'd13036778502f8605ce4dc68ca530455', '9656982897', 1, 'Common Citizen'),
(5, 'Dev AJ', 'bce1b79eade9b4755b5232531cf20824', '9495653005', 1, 'Police'),
(6, 'prajeesh', '168c1c1539e65af99ad1112e94a54758', '9947656154', 1, 'Police'),
(11, 'Abel', '464c0b76008d257812a5bac3ea9b2d8b', '9567672643', 1, 'Finance Related'),
(12, 'Shine', 'a02d386c142963a3305f3e416261268b', '9497233295', 1, 'Police'),
(13, 'kiran', 'e807f1fcf82d132f9bb018ca6738a19f', '9562324452', 1, 'Police'),
(14, 'Murali', 'ae2eb3a82aa8c5a706691b7fe9903421', '8136998663', 1, 'Common Citizen'),
(15, 'Dev AJ', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', 1, 'Rapid Force');

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
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `district`, `localbody`, `area`, `blood_group`, `profile_pic`, `is_verified`) VALUES
(1, 14, 129, 'Battipadavu', 'O+', NULL, 0),
(2, 13, 129, 'Manakkadavu', 'B+', NULL, 0),
(3, 14, 129, 'nirchal', 'O+', NULL, 0),
(4, 14, 99, 'achamthuruthi', 'AB+', NULL, 0),
(5, 14, 129, 'Kumbala', 'AB+', NULL, 0),
(6, 14, 99, 'achamthuruthi', 'AB+', NULL, 0),
(11, 13, 77, 'Manakkadavu', 'B+', NULL, 0),
(12, 14, 99, 'Nileswar', 'B+', NULL, 0),
(13, 14, 93, 'nirchal', 'O+', NULL, 0),
(14, 7, 31, 'Ernakulam', 'O+', NULL, 0),
(15, 14, 109, 'Kumbala', 'O+', NULL, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `post_assets`
--
ALTER TABLE `post_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
