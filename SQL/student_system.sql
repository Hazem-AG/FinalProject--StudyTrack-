-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2024 at 03:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


-- Database: `student_system`

-- --------------------------------------------------------

-- Table structure for table `courses`

CREATE TABLE `courses` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `hours` int(50) NOT NULL,
  `department_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table `courses`

INSERT INTO `courses` (`id`, `code`, `name`, `grade`, `hours`, `department_id`) VALUES
(1, 'CS101', 'Introduction to Computer Science', '', 3, 1),
(2, 'CS102', 'Data Structures', '', 4, 1),
(3, 'CS103', 'Algorithms', '', 3, 1),
(4, 'CS104', 'Operating Systems', '', 4, 1),
(5, 'CS105', 'Database Systems', '', 3, 1),
(6, 'CS106', 'Software Engineering', '', 3, 1),
(7, 'CS107', 'Computer Networks', '', 4, 1),
(8, 'CS108', 'Web Development', '', 3, 1),
(9, 'CS109', 'Artificial Intelligence', '', 3, 1),
(10, 'CS110', 'Machine Learning', '', 3, 1),
(11, 'CH101', 'General Chemistry', '', 3, 2),
(12, 'CH102', 'Organic Chemistry', '', 4, 2),
(13, 'CH103', 'Inorganic Chemistry', '', 3, 2),
(14, 'CH104', 'Physical Chemistry', '', 4, 2),
(15, 'CH105', 'Analytical Chemistry', '', 3, 2),
(16, 'CH106', 'Biochemistry', '', 3, 2),
(17, 'CH107', 'Chemical Engineering', '', 4, 2),
(18, 'CH108', 'Environmental Chemistry', '', 3, 2),
(19, 'CH109', 'Industrial Chemistry', '', 3, 2),
(20, 'CH110', 'Medicinal Chemistry', '', 3, 2),
(21, 'CS201', 'Advanced Programming', '', 3, 1),
(22, 'CS202', 'Computer Graphics', '', 3, 1),
(23, 'CS203', 'Human-Computer Interaction', '', 4, 1),
(24, 'CS204', 'Cybersecurity', '', 3, 1),
(25, 'CS205', 'Mobile Development', '', 3, 1),
(26, 'CH201', 'Spectroscopy', '', 3, 2),
(27, 'CH202', 'Chemical Kinetics', '', 4, 2),
(28, 'CH203', 'Quantum Chemistry', '', 3, 2),
(29, 'CH204', 'Theoretical Chemistry', '', 3, 2),
(30, 'CH205', 'Materials Chemistry', '', 4, 2),
(31, 'CS301', 'Cloud Computing', '', 3, 1),
(32, 'CS302', 'Big Data', '', 4, 1),
(33, 'CS303', 'Computer Vision', '', 3, 1),
(34, 'CS304', 'Natural Language Processing', '', 4, 1),
(35, 'CS305', 'Game Development', '', 3, 1),
(36, 'CH301', 'Physical Chemistry II', '', 4, 2),
(37, 'CH302', 'Chemical Thermodynamics', '', 3, 2),
(38, 'CH303', 'Coordination Chemistry', '', 4, 2),
(39, 'CH304', 'Chemical Engineering Thermodynamics', '', 3, 2),
(40, 'CH305', 'Chemistry of Materials', '', 3, 2);

-- --------------------------------------------------------

-- Table structure for table `departments`

CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table `departments`

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'Computer Science'),
(2, 'Chemistry');

-- --------------------------------------------------------

-- Table structure for table `users`

CREATE TABLE `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table `users`

INSERT INTO `users` (`id`, `username`, `password`, `department_id`) VALUES
(1, 'hazem', '$2y$10$jKqHNaROdMY6Wev3A00qwe/XGT90QcbGfv6xPn0PO9mLjc99nZdOW', 1),
(36, 'ahmed', '$2y$10$3Lv0.BcQ.xuYYKbohvVq0u341HLiEeycYlJ7VKzvkD1UKfya/Dv3y', 2),
(37, 'mohamed', '12345', 1);

-- --------------------------------------------------------

-- Table structure for table `user_courses`

CREATE TABLE `user_courses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `Code` varchar(20) NOT NULL,
  `Subject` varchar(100) NOT NULL,
  `Grade` varchar(3) NOT NULL,
  `Hours` int(1) NOT NULL,
  `user_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

COMMIT;

