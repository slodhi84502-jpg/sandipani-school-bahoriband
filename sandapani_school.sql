-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 26, 2025 at 01:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sandapani_school`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `full_name`, `created_at`) VALUES
(1, 'admin', '$2y$10$QanSwm8ZU2N9sdqVZGk0GO1aFaO1Z6LNb2r/fbZ3OKPfJG2aM9J1i', 'Administrator', '2025-11-11 04:11:35');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `attendance_date` date DEFAULT NULL,
  `status` enum('Present','Absent','Leave') NOT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `section` varchar(10) DEFAULT NULL,
  `class_teacher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `section`, `class_teacher_id`) VALUES
(1, '10th', 'A', NULL),
(2, '12th', 'Science', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `received_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Read') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `subject`, `message`, `received_at`, `status`) VALUES
(1, 'sachin', 'slodhi84502@gmail.com', '9770304683', 'chemistry', 'i impressed for you and me', '2025-11-13 01:30:47', 'Read'),
(2, 'sachin lodhi', 'slodhi84502@gmail.com', '9770304683', 'chemistry', 'i have to some defination about cm rise', '2025-11-13 04:18:48', 'Read'),
(3, 'sachin lodhi', 'slodhi84502@gmail.com', '9770304683', 'chemistry', 'hhh', '2025-11-14 15:57:06', 'Read'),
(4, 'sachin', 'slodhi84502@gmail.com', '9770304683', 'chemistry', 'hii i am sachin lodhi amadi', '2025-11-16 03:46:04', 'Pending'),
(5, 'sachin lodhi', 'slodhi84502@gmail.com', '9770304683', 'chemistry', 'cdccscscsc', '2025-11-18 04:25:57', 'Pending'),
(6, 'sachin lodhi', 'slodhi84502@gmail.com', '9770304683', 'chemistry', 'cdccscscsc', '2025-11-18 04:26:03', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_name`, `event_date`, `description`, `image`, `created_at`) VALUES
(1, 'Science Exhibition', '2024-11-30', 'A school-level science exhibition will be organized for classes 6 to 12.', '69245e2abe4f6_sandipani_vidhyalay_bahoriband__2025-09-13T121838.000Z_3.jpg', '2025-11-11 04:11:35'),
(2, 'children day', '2025-11-14', 'very special day for children because future of india', '691536d4abfdc_sandipani_vidhyalay_bahoriband__2025-09-25T122818.000Z.jpg', '2025-11-13 01:39:32'),
(3, 'teacher day', '2025-09-05', 'amazing celebrate teachers day', '691572993440d_principal.jpg', '2025-11-13 05:54:33'),
(4, 'CRISMAS DAY', '2025-12-25', 'hii crismas', '691bdd35c550b_image.jpg', '2025-11-18 02:43:01'),
(5, 'independence day', '2026-01-26', '', '69245a2ea1412_sandipani_vidhyalay_bahoriband__2025-06-29T035313.000Z.jpg', '2025-11-24 13:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `exam_name` varchar(100) DEFAULT NULL,
  `marks_obtained` int(11) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `session_year` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_structure`
--

CREATE TABLE `fee_structure` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `tuition_fee` decimal(10,2) DEFAULT NULL,
  `admission_fee` decimal(10,2) DEFAULT NULL,
  `annual_charges` decimal(10,2) DEFAULT NULL,
  `other_charges` decimal(10,2) DEFAULT NULL,
  `session_year` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fee_structure`
--

INSERT INTO `fee_structure` (`id`, `class_id`, `tuition_fee`, `admission_fee`, `annual_charges`, `other_charges`, `session_year`) VALUES
(1, 1, 5000.00, 10000.00, 2000.00, NULL, '2024-25');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `category`, `image_path`, `upload_date`) VALUES
(23, 'ews', 'Events', 'uploads/gallery/691751b50c388_principal.jpg', '2025-11-14 15:58:45'),
(24, 'sarswati', 'Events', 'uploads/gallery/6918b192c7691_sandipani_vidhyalay_bahoriband__2025-08-14T122518.000Z.jpg', '2025-11-15 17:00:02'),
(25, 'Trival day', 'Events', 'uploads/gallery/6918b1b2624ca_sandipani_vidhyalay_bahoriband__2025-06-29T035313.000Z_1.jpg', '2025-11-15 17:00:34'),
(26, 'assembly', 'Cultural', 'uploads/gallery/6918b1eac8415_sandipani_vidhyalay_bahoriband__2025-08-01T095543.000Z.jpg', '2025-11-15 17:01:30'),
(27, 'assembly', 'Achievements', 'uploads/gallery/6918b262d0a8a_sandipani_vidhyalay_bahoriband__2025-06-29T033520.000Z_1.jpg', '2025-11-15 17:03:30'),
(28, 'assembly', 'Achievements', 'uploads/gallery/6918b292da8c2_sandipani_vidhyalay_bahoriband__2025-09-06T112438.000Z_6 (1).jpg', '2025-11-15 17:04:18'),
(29, 'Classroom', 'Achievements', 'uploads/gallery/6918b3ebbb716_sandipani_vidhyalay_bahoriband__2025-09-13T121838.000Z_9 (1).jpg', '2025-11-15 17:10:03'),
(30, 'playground', 'Infrastructure', 'uploads/gallery/6918b40f91853_sandipani_vidhyalay_bahoriband__2025-08-15T151630.000Z_1.jpg', '2025-11-15 17:10:39'),
(31, 'drowing', 'Cultural', 'uploads/gallery/6918b4303965a_sandipani_vidhyalay_bahoriband__2025-09-13T121838.000Z_1 (1).jpg', '2025-11-15 17:11:12'),
(32, 'Classmate', 'Events', 'uploads/gallery/6918b466c230f_sandipani_vidhyalay_bahoriband__2025-07-31T144708.000Z_9.jpg', '2025-11-15 17:12:06'),
(33, 'school building', 'Infrastructure', 'uploads/gallery/6918b49093c0e_sandipani_vidhyalay_bahoriband__2025-08-13T072427.000Z.jpg', '2025-11-15 17:12:48'),
(34, 'Umang', 'Events', 'uploads/gallery/6918b4af36731_sandipani_vidhyalay_bahoriband__2025-09-13T121838.000Z.jpg', '2025-11-15 17:13:19'),
(35, 'event', 'Events', 'uploads/gallery/6918b4d372397_sandipani_vidhyalay_bahoriband__2025-08-15T151630.000Z_4.jpg', '2025-11-15 17:13:55'),
(36, 'litile girl', 'Achievements', 'uploads/gallery/6918b52a12f80_sandipani_vidhyalay_bahoriband__2025-09-17T104821.000Z.jpg', '2025-11-15 17:15:22'),
(37, 'invitation card', 'Events', 'uploads/gallery/6918b625e52b5_sandipani_vidhyalay_bahoriband__2025-11-13T093639.000Z.jpg', '2025-11-15 17:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `notice_board`
--

CREATE TABLE `notice_board` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notice_board`
--

INSERT INTO `notice_board` (`id`, `title`, `description`, `category`, `notice_date`, `attachment`, `status`, `created_at`) VALUES
(1, 'Annual Sports Day', 'The annual sports day will be held on 20th December 2024. All students are requested to participate.', NULL, '2024-11-15', NULL, 'Active', '2025-11-11 04:11:35'),
(2, 'children day', 'a very special day for schildrens day', 'Important', '2025-11-14', '69152e762d3ab_Screenshot 2025-08-08 185744.png', 'Inactive', '2025-11-13 01:03:50'),
(3, 'exam shedule', 'i  am sachin', 'Exam', '2025-11-30', '69245635b337e_sandipani_vidhyalay_bahoriband__2025-09-13T121838.000Z_9.jpg', 'Active', '2025-11-24 12:57:25'),
(4, 'crismas day', 'hiii i am sachin', 'Exam', '2025-12-12', '692456794f832_sandipani_vidhyalay_bahoriband__2025-08-14T122518.000Z.jpg', 'Active', '2025-11-24 12:58:33'),
(5, 'hii i', '', 'General', '2025-11-24', '692456cd53519_sandipani_vidhyalay_bahoriband__2025-11-02T075523.000Z (1).jpg', 'Active', '2025-11-24 12:59:57'),
(6, 'anual', 'anual day', 'Important', '2025-11-18', '6924576228721_pexels-nout-gons-80280-248159.jpg', 'Inactive', '2025-11-24 13:02:26'),
(7, 'image', 'school assembly', 'Important', '2025-11-29', '6924592f9e8d2_sandipani_vidhyalay_bahoriband__2025-09-01T100123.000Z_1.jpg', 'Inactive', '2025-11-24 13:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_name` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`) VALUES
(1, 'school_phone', '+91-12345-67890'),
(2, 'school_email', 'info@sandapanividyalaya.com'),
(3, 'school_address', 'Bahoriband, Katni, Madhya Pradesh, India'),
(4, 'facebook_link', 'https://facebook.com'),
(5, 'twitter_link', 'https://twitter.com'),
(6, 'instagram_link', 'https://instagram.com');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `admission_no` varchar(50) NOT NULL,
  `roll_number` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `admission_no`, `roll_number`, `full_name`, `class_id`, `section`, `dob`, `father_name`, `mother_name`, `phone`, `email`, `address`, `photo`, `admission_date`, `status`) VALUES
(2, '8585858585', 2147483647, 'Mr.Arjun Patel', 1, NULL, '0000-00-00', 'aanand', NULL, '9770304683', NULL, 'village - amadi post - chadankheda district - katni (m.p.)\r\nvillage - amadi post - chadankheda dist - katni ( m.p.)', '6914b488c70c4_Screenshot 2025-04-13 104231.png', '2025-11-12', 'Active'),
(3, '240123025', 2147483647, 'arvind patel', 1, NULL, '2007-09-06', 'aanand', NULL, '9770304683', NULL, 'village - amadi post - chadankheda district - katni (m.p.)\r\nvillage - amadi post - chadankheda dist - katni ( m.p.)', '6914b4bdb8ce7_Screenshot 2025-07-05 185841.png', '2025-11-12', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `class_id`) VALUES
(1, 'Maths', 1),
(2, 'Science', 1),
(3, 'Physics', 2),
(4, 'Chemistry', 2);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` enum('Active','Resigned') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `full_name`, `qualification`, `experience`, `subject_id`, `phone`, `email`, `joining_date`, `address`, `photo`, `status`) VALUES
(2, 'Mr.Arjun Patel', 'M.sc (Chemistry)', 7, 4, '9770304683', 'slodhi84502@gmail.com', '2005-05-05', 'village - amadi post - chadankheda district - katni (m.p.)\r\nvillage - amadi post - chadankheda dist - katni ( m.p.)', '6914bb116d1df_Screenshot 2025-04-13 213824.png', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_teacher_id` (`class_teacher_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `fee_structure`
--
ALTER TABLE `fee_structure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice_board`
--
ALTER TABLE `notice_board`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_name` (`setting_name`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admission_no` (`admission_no`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `subject_id` (`subject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_structure`
--
ALTER TABLE `fee_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `notice_board`
--
ALTER TABLE `notice_board`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`class_teacher_id`) REFERENCES `teachers` (`id`);

--
-- Constraints for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `exam_results_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `exam_results_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `fee_structure`
--
ALTER TABLE `fee_structure`
  ADD CONSTRAINT `fee_structure_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
