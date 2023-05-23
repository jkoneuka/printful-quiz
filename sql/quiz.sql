-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2023 at 10:27 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(10) NOT NULL,
  `q_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `q_id`, `title`, `correct`) VALUES
(1, 1, 'Personal Hypertext Processor', 0),
(2, 1, 'Private Home Page', 0),
(3, 1, 'PHP: Hypertext Preprocessor', 1),
(4, 2, 'Request.Form;', 0),
(5, 2, '$_GET[];', 1),
(6, 2, 'Request.QueryString;', 0),
(8, 3, 'echo \"Hello World\";', 1),
(9, 3, '\"Hello World\";', 0),
(10, 3, 'Document.Write(\"Hello World\");', 0),
(11, 4, '&', 0),
(12, 4, '$', 1),
(13, 4, '!', 0),
(14, 5, 'False', 1),
(15, 5, 'True', 0),
(18, 6, 'VBScript', 0),
(19, 6, 'JavaScript', 0),
(20, 6, 'Perl and C', 1),
(22, 20, 'echo \"Hello World\"\r\n', 0),
(23, 20, 'print(\"Hello World\")', 1),
(24, 20, 'echo(\"Hello World\");', 0),
(25, 20, 'p(\"Hello World\")', 0),
(26, 21, '/*This is a comment*/', 0),
(27, 21, '#This is a comment', 1),
(28, 21, '//This is a comment', 0),
(29, 22, 'Myvar', 0),
(30, 22, 'my_var', 0),
(31, 22, 'my-var', 1),
(32, 22, '_myvar', 0),
(33, 23, 'x = 5', 0),
(34, 23, 'x = int(5)', 0),
(35, 23, 'Both the other answers are correct', 1),
(36, 7, 'if (i == 5)', 1),
(37, 7, 'if i = 5', 0),
(38, 7, 'if i = 5 then', 0),
(39, 7, 'if i == 5 then', 0),
(40, 8, 'True', 1),
(41, 8, 'False', 0),
(44, 9, 'The &lt;head&gt; section', 0),
(45, 9, 'Both the &lt;head&gt; section and the &lt;body&gt; section are correct', 1),
(46, 9, 'The &lt;body&gt; section', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) NOT NULL,
  `t_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `t_id`, `title`) VALUES
(1, 1, 'What does PHP stand for?'),
(2, 1, 'How do you get information from a form that is submitted using the \"get\" method?'),
(3, 1, 'How do you write \"Hello World\" in PHP?'),
(4, 1, 'All variables in PHP start with which symbol?'),
(5, 1, 'When using the POST method, variables are displayed in the URL:'),
(6, 1, 'The PHP syntax is most similar to:'),
(7, 2, 'How to write an IF statement in JavaScript?'),
(8, 2, 'The external JavaScript file must contain the &lt;/script&gt; tag.'),
(9, 2, 'Where is the correct place to insert a JavaScript?'),
(20, 3, 'What is a correct syntax to output \"Hello World\" in Python?'),
(21, 3, 'How do you insert COMMENTS in Python code?'),
(22, 3, 'Which one is NOT a legal variable name?'),
(23, 3, 'How do you create a variable with the numeric value 5?');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(10) NOT NULL,
  `t_id` int(10) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `answers` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `title`) VALUES
(1, 'PHP Quiz'),
(2, 'JavaScript Quiz'),
(3, 'Python Quiz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
