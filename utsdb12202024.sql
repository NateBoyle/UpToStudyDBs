-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2024 at 05:24 AM
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
-- Database: `utsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date NOT NULL,
  `due_time` time DEFAULT NULL,
  `grade` decimal(6,2) DEFAULT NULL,
  `points` decimal(6,2) DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignment_id`, `user_id`, `course_id`, `title`, `description`, `due_date`, `due_time`, `grade`, `points`, `is_completed`, `color`) VALUES
(2, 12, 18, 'Splunk Power-User Exam', '', '2024-12-12', '14:00:00', NULL, 65.00, 1, '#4B90D0');

--
-- Triggers `assignments`
--
DELIMITER $$
CREATE TRIGGER `before_insert_assignment` BEFORE INSERT ON `assignments` FOR EACH ROW BEGIN
    -- Check if the course_id is not NULL
    IF NEW.course_id IS NOT NULL THEN
        -- Retrieve the course color and set it to the color column
        SET NEW.color = (SELECT course_color 
                         FROM courses 
                         WHERE course_id = NEW.course_id);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_name` varchar(100) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `course_number` varchar(20) DEFAULT NULL,
  `professor` varchar(100) DEFAULT NULL,
  `total_points` decimal(6,2) DEFAULT 0.00,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `grade` decimal(3,2) DEFAULT 4.00,
  `monday` tinyint(1) DEFAULT 0,
  `tuesday` tinyint(1) DEFAULT 0,
  `wednesday` tinyint(1) DEFAULT 0,
  `thursday` tinyint(1) DEFAULT 0,
  `friday` tinyint(1) DEFAULT 0,
  `saturday` tinyint(1) DEFAULT 0,
  `sunday` tinyint(1) DEFAULT 0,
  `course_color` varchar(7) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `user_id`, `course_name`, `subject`, `prefix`, `course_number`, `professor`, `total_points`, `start_time`, `end_time`, `start_date`, `end_date`, `grade`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `course_color`, `semester_id`) VALUES
(2, 12, 'Archaeology', 'History', 'HIST', '407', 'Dr. Jones', 135.00, '09:00:00', '11:00:00', '2025-01-01', '2025-05-15', NULL, 1, 0, 1, 0, 0, 0, 0, '#E52222', 1),
(8, 12, 'Math 102', 'MAT', 'MAT', '102', 'Feynman', 222.00, '09:00:00', '11:00:00', '2025-01-01', '2025-05-01', NULL, 0, 0, 0, 0, 0, 1, 0, '#E5BA22', 3),
(10, 20, 'History 101', 'HIST', NULL, NULL, 'Dr. Jones', 220.00, '09:00:00', '10:00:00', '2025-01-12', '2025-05-15', NULL, 0, 1, 0, 1, 0, 0, 0, '#E5BA22', NULL),
(13, 19, 'History 407', 'HIST', NULL, NULL, 'Dr. Jones', 350.00, '09:00:00', '10:00:00', '2025-01-12', '2025-05-15', NULL, 0, 1, 0, 1, 0, 0, 0, '#E52222', NULL),
(14, 12, 'Cybersecurity Foundations', 'CSEC', 'CSEC', '770', 'Dr. Moody', 770.00, '17:30:00', '18:45:00', '2025-01-15', '2025-05-15', NULL, 0, 1, 0, 0, 1, 0, 0, '#FF8C00', 3),
(18, 12, 'Cybersecurity Data Analytics', 'Cybersecurity', 'CSEC', '702', 'Jason Griffin', 625.00, '17:30:00', '18:45:00', NULL, NULL, 4.00, 1, 0, 1, 0, 0, 0, 0, '#4B90D0', 3);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date NOT NULL,
  `end_time` time DEFAULT NULL,
  `all_day` tinyint(1) DEFAULT 0,
  `color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `user_id`, `course_id`, `title`, `description`, `start_date`, `start_time`, `end_date`, `end_time`, `all_day`, `color`) VALUES
(3, 12, NULL, 'Up2Study Meeting', 'Catchup with UpToStudy team', '2024-12-14', '20:30:00', '2024-12-14', '21:30:00', 0, NULL),
(4, 12, NULL, 'Christmas', '', '2024-12-25', '08:53:00', '2024-12-25', '20:53:00', 0, NULL),
(5, 12, NULL, 'UpToStudy Meeting', '', '2024-12-21', '20:30:00', '2024-12-21', '21:30:00', 0, NULL);

--
-- Triggers `events`
--
DELIMITER $$
CREATE TRIGGER `before_insert_event` BEFORE INSERT ON `events` FOR EACH ROW BEGIN
    IF NEW.course_id IS NOT NULL THEN
        SET NEW.color = (SELECT course_color 
                         FROM courses 
                         WHERE course_id = NEW.course_id);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flashcards`
--

CREATE TABLE `flashcards` (
  `flashcard_id` int(11) NOT NULL,
  `set_id` int(11) DEFAULT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_mastered` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flashcards`
--

INSERT INTO `flashcards` (`flashcard_id`, `set_id`, `question`, `answer`, `date_created`, `is_mastered`) VALUES
(1, 6, 'Testing Question1', 'Test Answer', '2024-11-07 05:35:25', 0),
(5, 6, 'What special operations group did Commander Shepard become a part of?', 'The Spectres', '2024-11-07 23:49:07', 1),
(6, 6, 'Who blew up the first Death Star', 'Luke Skywalker', '2024-11-07 23:55:11', 0),
(7, 6, 'Who blew up the second Death Star?', 'Lando Calrissian', '2024-11-07 23:56:45', 1),
(18, 7, 'pi', '314', '2024-11-11 08:14:54', 0),
(571, 31, 'During an IS audit, the auditor observes that some system controls are not functioning as intended. What should the auditor do next?', 'Gather additional evidence to support the finding.', '2024-11-23 03:01:04', 1),
(572, 31, 'What is the primary purpose of conducting an audit risk assessment?', 'To identify areas of high risk for focused audit efforts.', '2024-11-23 03:01:04', 0),
(573, 31, 'Which of the following best describes IT governance?', 'The framework for ensuring IT supports business goals.', '2024-11-23 03:01:04', 0),
(574, 31, 'Which key performance indicator (KPI) would be most relevant to assess the effectiveness of an IT governance framework?', 'Alignment of IT initiatives with business objectives.', '2024-11-23 03:01:04', 0),
(575, 31, 'During the system development life cycle (SDLC), when should an IS auditor be involved?', 'During system design to review control requirements.', '2024-11-23 03:01:04', 0),
(576, 31, 'Which of the following is the BEST way to ensure a new application meets security requirements?', 'Including security requirements in the design phase.', '2024-11-23 03:01:04', 0),
(577, 31, 'What is the most effective way to ensure that backup data can be restored successfully?', 'Conducting periodic restoration testing.', '2024-11-23 03:01:04', 0),
(578, 31, 'Which of the following is the primary objective of a disaster recovery plan (DRP)?', 'To recover business operations in the event of a disaster.', '2024-11-23 03:01:04', 0),
(579, 31, 'What is the first step in establishing an information security program?', 'Conducting a risk assessment.', '2024-11-23 03:01:04', 0),
(580, 31, 'Which of the following would be the BEST way to protect sensitive customer data stored in a database?', 'Encrypting the data at rest and in transit.', '2024-11-23 03:01:04', 0),
(581, 31, 'What is the primary purpose of control self-assessments (CSAs)?', 'To empower business units to evaluate and manage their own risks.', '2024-11-23 03:01:04', 0),
(582, 31, 'Which of the following is the MOST effective way to ensure compliance with IT policies?', 'Conducting regular audits and reviews.', '2024-11-23 03:01:04', 0),
(583, 31, 'What is a key benefit of implementing a centralized log management system?', 'Facilitating efficient monitoring and forensic investigations.', '2024-11-23 03:01:04', 0),
(584, 31, 'Which of the following should an IS auditor review when evaluating the effectiveness of access controls?', 'Audit logs and user activity reports.', '2024-11-23 03:01:04', 0),
(585, 31, 'What is the primary focus of a vulnerability assessment?', 'Identifying potential weaknesses in systems and applications.', '2024-11-23 03:01:04', 0),
(586, 31, 'When performing an audit of a change management process, what should the auditor verify first?', 'That all changes are authorized and documented.', '2024-11-23 03:01:04', 0),
(587, 31, 'What is the primary purpose of implementing a service-level agreement (SLA)?', 'To define performance expectations between service providers and customers.', '2024-11-23 03:01:04', 0),
(588, 31, 'What is a key advantage of conducting penetration testing?', 'Identifying vulnerabilities that could be exploited by attackers.', '2024-11-23 03:01:04', 0),
(589, 31, 'Which of the following is a critical component of incident response planning?', 'Defining roles and responsibilities for incident handling.', '2024-11-23 03:01:04', 0),
(590, 31, 'What should be the first step in developing a business continuity plan (BCP)?', 'Conducting a business impact analysis (BIA).', '2024-11-23 03:01:04', 0),
(591, 31, 'What is the main objective of IT governance?', 'Aligning IT goals with business objectives.', '2024-11-23 03:01:04', 0),
(592, 31, 'Which of the following is the MOST effective method for preventing unauthorized database access?', 'Implementing role-based access control (RBAC).', '2024-11-23 03:01:04', 0),
(593, 31, 'What is the primary goal of encryption?', 'To protect data confidentiality.', '2024-11-23 03:01:04', 0),
(594, 31, 'Which of the following is an example of a preventive control?', 'Installing a firewall to block malicious traffic.', '2024-11-23 03:01:04', 0),
(595, 31, 'What is the purpose of digital signatures?', 'To verify the authenticity and integrity of electronic messages.', '2024-11-23 03:01:04', 0),
(596, 31, 'Which of the following is the BEST way to protect sensitive information during transmission?', 'Using secure protocols like HTTPS or TLS.', '2024-11-23 03:01:04', 0),
(597, 31, 'What is the main purpose of a forensic investigation?', 'To collect and analyze evidence related to a security incident.', '2024-11-23 03:01:04', 0),
(598, 31, 'What is a primary benefit of using multi-factor authentication (MFA)?', 'Enhancing user authentication security by requiring multiple forms of verification.', '2024-11-23 03:01:04', 0),
(599, 31, 'Which of the following is a key component of a patch management process?', 'Regularly applying software updates to address vulnerabilities.', '2024-11-23 03:01:04', 0),
(600, 31, 'What is the objective of performing a post-implementation review?', 'To evaluate whether project objectives were met and identify lessons learned.', '2024-11-23 03:01:04', 0),
(601, 31, 'Which of the following is a key focus of configuration management?', 'Ensuring that system settings comply with organizational policies.', '2024-11-23 03:01:04', 0),
(602, 31, 'What is a common risk associated with shadow IT?', 'Lack of visibility and control over unauthorized applications.', '2024-11-23 03:01:04', 0),
(603, 31, 'When should a risk assessment be performed during the project lifecycle?', 'At the start of the project and periodically throughout its duration.', '2024-11-23 03:01:04', 0),
(604, 31, 'What is the primary purpose of a firewall?', 'To control and monitor incoming and outgoing network traffic.', '2024-11-23 03:01:04', 0),
(605, 31, 'Which of the following is a key consideration in selecting a cloud service provider?', 'Ensuring compliance with data protection regulations.', '2024-11-23 03:01:04', 0),
(606, 31, 'What is the role of an intrusion detection system (IDS)?', 'To monitor network traffic for suspicious activity and potential threats.', '2024-11-23 03:01:04', 0),
(607, 31, 'Which of the following is a characteristic of an effective access control policy?', 'Clearly defining user roles and permissions.', '2024-11-23 03:01:04', 0),
(608, 31, 'What is the main goal of security awareness training?', 'To educate employees on recognizing and mitigating security threats.', '2024-11-23 03:01:04', 0),
(609, 31, 'What is the purpose of a risk register?', 'To document identified risks and their mitigation strategies.', '2024-11-23 03:01:04', 0),
(610, 31, 'Which of the following is a key principle of data minimization?', 'Collecting only the data necessary to fulfill a specific purpose.', '2024-11-23 03:01:04', 0),
(611, 31, 'What is a potential consequence of weak password policies?', 'Increased risk of unauthorized access to systems.', '2024-11-23 03:01:04', 0),
(612, 31, 'Which of the following is a key benefit of network segmentation?', 'Limiting the spread of malware within the network.', '2024-11-23 03:01:04', 0),
(613, 31, 'What is the primary objective of a root cause analysis?', 'To identify the underlying cause of an issue or incident.', '2024-11-23 03:01:04', 0),
(614, 31, 'When auditing a cloud environment, what should the IS auditor prioritize?', 'Reviewing the provider\'s security controls and certifications.', '2024-11-23 03:01:04', 0),
(615, 31, 'What is the main purpose of a data retention policy?', 'To define how long data should be stored and when it should be deleted.', '2024-11-23 03:01:04', 0),
(616, 31, 'What is the primary risk associated with outdated software?', 'Increased vulnerability to security threats.', '2024-11-23 03:01:04', 0),
(617, 31, 'Which of the following is a key feature of a SIEM (Security Information and Event Management) system?', 'Centralized collection and analysis of security logs.', '2024-11-23 03:01:04', 0),
(618, 31, 'What is the main purpose of role-based access control (RBAC)?', 'To restrict access based on users\' job responsibilities.', '2024-11-23 03:01:04', 0),
(619, 31, 'What is the primary objective of a penetration test?', 'To simulate real-world attacks and identify exploitable vulnerabilities.', '2024-11-23 03:01:04', 0),
(620, 31, 'What is the purpose of a data classification policy?', 'To categorize information based on its sensitivity and required level of protection.', '2024-11-23 03:01:04', 0),
(621, 31, 'Which of the following is a characteristic of a strong incident response plan?', 'Clearly defined escalation procedures.', '2024-11-23 03:01:04', 0),
(622, 31, 'What is the purpose of a service catalog in IT governance?', 'To provide a list of IT services available to the organization.', '2024-11-23 03:01:04', 0),
(623, 31, 'What is the main goal of data integrity controls?', 'To ensure data accuracy and consistency.', '2024-11-23 03:01:04', 0),
(624, 31, 'Which of the following is a benefit of using virtualization?', 'Enhancing resource utilization and scalability.', '2024-11-23 03:01:04', 0),
(625, 31, 'What is a key consideration in disaster recovery planning?', 'Ensuring regular testing of the recovery plan.', '2024-11-23 03:01:04', 0),
(626, 31, 'What is the purpose of log management?', 'To collect and analyze logs for identifying security events.', '2024-11-23 03:01:04', 0),
(627, 31, 'What is the main function of a proxy server?', 'To act as an intermediary between users and external networks.', '2024-11-23 03:01:04', 0),
(628, 31, 'What is the primary purpose of a digital certificate?', 'To verify the identity of an entity in online communications.', '2024-11-23 03:01:04', 0),
(629, 31, 'Which of the following is a best practice for securing mobile devices?', 'Enforcing device encryption and remote wipe capabilities.', '2024-11-23 03:01:04', 0),
(630, 31, 'What is the goal of implementing least privilege?', 'To minimize access rights to only what is necessary for users\' roles.', '2024-11-23 03:01:04', 0),
(631, 31, 'Which of the following is an example of a detective control?', 'Monitoring logs for suspicious activity.', '2024-11-23 03:01:04', 0),
(632, 31, 'What is the purpose of a baseline configuration?', 'To establish a secure starting point for systems.', '2024-11-23 03:01:04', 0),
(633, 31, 'What is a primary benefit of using threat intelligence?', 'Improving proactive defense against emerging threats.', '2024-11-23 03:01:04', 0),
(634, 31, 'What is a critical step in managing third-party risks?', 'Conducting due diligence and security assessments.', '2024-11-23 03:01:04', 0),
(635, 31, 'What is the role of a data owner in information security?', 'Defining access and protection requirements for their data.', '2024-11-23 03:01:04', 0),
(636, 31, 'What is the objective of a business impact analysis (BIA)?', 'To assess the impact of disruptions on business operations.', '2024-11-23 03:01:04', 0),
(637, 31, 'What is a potential risk of Bring Your Own Device (BYOD) policies?', 'Increased risk of data leakage.', '2024-11-23 03:01:04', 0),
(638, 31, 'Which of the following is a key focus of supply chain security?', 'Verifying the integrity of components and software.', '2024-11-23 03:01:04', 0),
(639, 31, 'What is the purpose of implementing data masking?', 'To protect sensitive information by obfuscating it.', '2024-11-23 03:01:04', 0);

--
-- Triggers `flashcards`
--
DELIMITER $$
CREATE TRIGGER `after_flashcard_delete` AFTER DELETE ON `flashcards` FOR EACH ROW BEGIN
    UPDATE flashcard_sets
    SET num_cards = num_cards - 1
    WHERE set_id = OLD.set_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_flashcard_insert` AFTER INSERT ON `flashcards` FOR EACH ROW BEGIN
    UPDATE flashcard_sets
    SET num_cards = num_cards + 1
    WHERE set_id = NEW.set_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_flashcard_mastered_delete` AFTER DELETE ON `flashcards` FOR EACH ROW BEGIN
    IF OLD.is_mastered = 1 THEN
        UPDATE flashcard_sets
        SET cards_mastered = (
            SELECT COUNT(*)
            FROM flashcards
            WHERE set_id = OLD.set_id AND is_mastered = 1
        )
        WHERE set_id = OLD.set_id;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_cards_mastered` AFTER UPDATE ON `flashcards` FOR EACH ROW BEGIN
    IF NEW.is_mastered = TRUE AND OLD.is_mastered = FALSE THEN
        -- Increment the cards_mastered count
        UPDATE flashcard_sets
        SET cards_mastered = cards_mastered + 1
        WHERE set_id = NEW.set_id;
    ELSEIF NEW.is_mastered = FALSE AND OLD.is_mastered = TRUE THEN
        -- Decrement the cards_mastered count
        UPDATE flashcard_sets
        SET cards_mastered = cards_mastered - 1
        WHERE set_id = NEW.set_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flashcard_sets`
--

CREATE TABLE `flashcard_sets` (
  `set_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `set_name` varchar(255) DEFAULT NULL,
  `num_cards` int(11) DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `course_id` int(11) DEFAULT NULL,
  `cards_mastered` int(11) DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flashcard_sets`
--

INSERT INTO `flashcard_sets` (`set_id`, `user_id`, `set_name`, `num_cards`, `date_created`, `course_id`, `cards_mastered`, `updated_at`) VALUES
(6, 12, 'History 1', 4, '2024-11-07 00:19:48', 2, 2, '2024-12-15 07:04:39'),
(7, 12, 'Math cards', 1, '2024-11-07 06:49:44', 8, 0, '2024-12-15 07:04:39'),
(31, 12, 'CISA', 69, '2024-11-23 03:01:03', 14, 1, '2024-12-15 07:04:39');

--
-- Triggers `flashcard_sets`
--
DELIMITER $$
CREATE TRIGGER `after_flashcard_set_delete` AFTER DELETE ON `flashcard_sets` FOR EACH ROW BEGIN
    DELETE FROM flashcards WHERE set_id = OLD.set_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` int(11) NOT NULL,
  `goal_set_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `due_date` date DEFAULT NULL,
  `color` varchar(7) DEFAULT '#4BC940'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `goal_set_id`, `title`, `description`, `is_completed`, `created_at`, `updated_at`, `due_date`, `color`) VALUES
(1, 4, 'Pass splunk exam', NULL, 1, '2024-12-20 16:30:14', '2024-12-21 02:47:44', NULL, NULL),
(2, 4, 'Pass AI-900 exam', NULL, 0, '2024-12-21 11:17:52', '2024-12-21 02:17:52', NULL, NULL),
(3, 5, 'Go to Rush Week', NULL, 1, '2024-12-21 12:33:20', '2024-12-21 03:34:17', NULL, '#9A4BB3'),
(4, 5, 'Attend Introduction Meeting', NULL, 1, '2024-12-21 12:33:40', '2024-12-21 03:34:22', NULL, '#9A4BB3'),
(5, 5, 'Do 100 hours of volunteer work', NULL, 1, '2024-12-21 12:34:04', '2024-12-21 03:34:09', NULL, '#9A4BB3'),
(6, 6, 'Attend 1 Nursing Activity', NULL, 1, '2024-12-21 12:38:33', '2024-12-21 03:46:42', NULL, '#E52222'),
(7, 6, 'Go on 1 LLC Field Trip', NULL, 1, '2024-12-21 12:39:31', '2024-12-21 03:46:47', NULL, '#E52222'),
(8, 6, 'Write Finishing Club Essay', NULL, 0, '2024-12-21 12:46:33', '2024-12-21 03:46:33', NULL, '#E52222');

--
-- Triggers `goals`
--
DELIMITER $$
CREATE TRIGGER `set_goal_color` BEFORE INSERT ON `goals` FOR EACH ROW BEGIN
    -- Set the goal's color to the color of the associated goal_set
    DECLARE goalSetColor VARCHAR(7);
    
    -- Retrieve the color of the associated goal_set
    SELECT color INTO goalSetColor
    FROM goal_sets
    WHERE id = NEW.goal_set_id;

    -- Assign the retrieved color to the new goal
    SET NEW.color = goalSetColor;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_goal_counts` AFTER INSERT ON `goals` FOR EACH ROW BEGIN
    UPDATE goal_sets
    SET number_of_goals = number_of_goals + 1
    WHERE id = NEW.goal_set_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_goals_completed` AFTER UPDATE ON `goals` FOR EACH ROW BEGIN
    IF NEW.is_completed <> OLD.is_completed THEN
        UPDATE goal_sets
        SET goals_completed = goals_completed + 
            CASE 
                WHEN NEW.is_completed THEN 1 
                ELSE -1 
            END
        WHERE id = NEW.goal_set_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `goal_sets`
--

CREATE TABLE `goal_sets` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `number_of_goals` int(11) DEFAULT 0,
  `goals_completed` int(11) DEFAULT 0,
  `color` varchar(7) DEFAULT '#2C2C2C',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `container` tinyint(1) DEFAULT NULL
) ;

--
-- Dumping data for table `goal_sets`
--

INSERT INTO `goal_sets` (`id`, `title`, `description`, `number_of_goals`, `goals_completed`, `color`, `created_at`, `updated_at`, `user_id`, `course_id`, `container`) VALUES
(4, 'Get course certificates', NULL, 2, 1, NULL, '2024-12-20 01:41:27', '2024-12-21 02:47:44', 12, NULL, 1),
(5, 'Become a member of a Sorority', NULL, 3, 3, '#9A4BB3', '2024-12-21 03:15:48', '2024-12-21 03:34:22', 12, NULL, 2),
(6, 'Earn Nursing LLC Badge', NULL, 3, 2, '#E52222', '2024-12-21 03:35:05', '2024-12-21 03:46:47', 12, NULL, 3);

--
-- Triggers `goal_sets`
--
DELIMITER $$
CREATE TRIGGER `set_goal_set_color` BEFORE INSERT ON `goal_sets` FOR EACH ROW BEGIN
    -- Check if the color is NULL
    IF NEW.color IS NULL THEN
        -- Directly set the NEW.color value using SELECT
        SET NEW.color = (
            SELECT course_color
            FROM courses
            WHERE course_id = NEW.course_id
        );
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logged_time`
--

CREATE TABLE `logged_time` (
  `user_id` int(11) NOT NULL,
  `total_time` bigint(20) DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logged_time`
--

INSERT INTO `logged_time` (`user_id`, `total_time`, `last_updated`) VALUES
(1, 302, '2024-12-15 07:51:12'),
(12, 174683, '2024-12-21 04:23:13');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `attempts` int(11) DEFAULT 0,
  `last_attempt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `username`, `attempts`, `last_attempt`) VALUES
(1, 'JohnDoe!', 1, '2024-10-23 06:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_type` enum('login','logout') NOT NULL,
  `event_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`id`, `user_id`, `event_type`, `event_time`, `ip_address`, `session_id`) VALUES
(1, 12, 'login', '2024-11-03 05:10:09', '::1', '2d0qppnjnqunqiiv65qkas59qc'),
(2, 12, 'logout', '2024-11-03 05:19:19', '::1', '2d0qppnjnqunqiiv65qkas59qc'),
(3, 12, 'login', '2024-11-03 05:28:34', '::1', 'sosplrdk6utrl7o3kemn1nrs3d'),
(4, 12, 'login', '2024-11-03 05:36:32', '::1', 'ojegateh5uufu5dqi9bb275jos'),
(5, 12, 'logout', '2024-11-03 05:37:38', '::1', 'ojegateh5uufu5dqi9bb275jos'),
(6, 12, 'login', '2024-11-03 06:04:35', '::1', 'm1c636q6kn71vi9llh0kdtleol'),
(7, 12, 'logout', '2024-11-03 06:04:43', '::1', 'm1c636q6kn71vi9llh0kdtleol'),
(8, 20, 'login', '2024-11-03 23:05:56', '::1', 'j4kmfo9fk1eithhnre8ph0o13f'),
(9, 20, 'logout', '2024-11-03 23:25:19', '::1', 'j4kmfo9fk1eithhnre8ph0o13f'),
(10, 12, 'login', '2024-11-05 07:05:08', '::1', 'nmi1hs2bmfqurbe86cirfjmi1h'),
(11, 12, 'login', '2024-11-06 06:02:49', '::1', '80ota0csagamb9er2minsrmfmj'),
(12, 12, 'login', '2024-11-06 18:47:23', '::1', 'u9opo0slnqhqkif1f5v59qiaui'),
(13, 12, 'login', '2024-11-07 00:18:06', '::1', 'vbern3jm4209bo3ee0bicumkbn'),
(14, 12, 'logout', '2024-11-07 00:21:13', '::1', 'vbern3jm4209bo3ee0bicumkbn'),
(15, 19, 'login', '2024-11-07 00:21:24', '::1', '5cs5l8v4dcvj9p7r0ird2g1lil'),
(16, 12, 'login', '2024-11-07 05:06:47', '::1', 'tbbl54ph4s84d53tlfsaj8f91e'),
(17, 12, 'login', '2024-11-07 05:51:35', '::1', 'mq92od9b51jm6ktumsm3s7t1mt'),
(18, 12, 'login', '2024-11-07 22:17:43', '::1', '2vu1k7psq6t1kpnrkjur7npr8d'),
(19, 12, 'logout', '2024-11-08 04:27:20', '::1', '2vu1k7psq6t1kpnrkjur7npr8d'),
(20, 12, 'login', '2024-11-08 04:30:40', '::1', 'qkvhufrf288sa403j20bjaumcd'),
(21, 12, 'login', '2024-11-08 04:37:23', '::1', 'movdl9431hnhh15t1t1o1chjdr'),
(22, 12, 'login', '2024-11-08 04:40:06', '::1', 'lc40mcbmdi92ot0h5nh9d6aree'),
(23, 12, 'logout', '2024-11-08 04:43:38', '::1', 'lc40mcbmdi92ot0h5nh9d6aree'),
(24, 12, 'login', '2024-11-08 04:45:22', '::1', 'rbkjptg7th7dqftht9ehlec2em'),
(25, 12, 'logout', '2024-11-08 08:34:47', '::1', 'rbkjptg7th7dqftht9ehlec2em'),
(26, 12, 'login', '2024-11-08 08:55:07', '::1', '4hbltj40t8nvok8siouic5ouje'),
(27, 12, 'logout', '2024-11-08 08:55:13', '::1', '4hbltj40t8nvok8siouic5ouje'),
(28, 12, 'login', '2024-11-08 08:56:44', '::1', 'scrd46td45st5gmfhlbsec3q3b'),
(29, 12, 'logout', '2024-11-08 08:57:02', '::1', 'scrd46td45st5gmfhlbsec3q3b'),
(30, 12, 'login', '2024-11-09 06:19:51', '::1', 'ob6t1gmj33na3cktrqeqonhp6a'),
(31, 12, 'logout', '2024-11-09 06:21:15', '::1', 'ob6t1gmj33na3cktrqeqonhp6a'),
(32, 12, 'login', '2024-11-09 06:33:44', '::1', 'upbd2tfkaup18rc0cglh3aqsd3'),
(33, 12, 'logout', '2024-11-09 06:33:51', '::1', 'upbd2tfkaup18rc0cglh3aqsd3'),
(34, 12, 'login', '2024-11-09 07:22:31', '::1', '69qhv59q2gubt1juan7rtlp7cb'),
(35, 12, 'logout', '2024-11-09 07:22:34', '::1', '69qhv59q2gubt1juan7rtlp7cb'),
(36, 12, 'login', '2024-11-09 07:28:33', '::1', 'c8298pnqr1mudn6vd4n9c051ur'),
(37, 12, 'logout', '2024-11-09 07:28:37', '::1', 'c8298pnqr1mudn6vd4n9c051ur'),
(38, 12, 'login', '2024-11-09 08:11:07', '::1', 'nc4bkgahlehbl9fkoqqr10cmk9'),
(39, 12, 'login', '2024-11-09 19:47:52', '::1', 'uf2tn5qo5turvmkg68nbav8qpn'),
(40, 12, 'login', '2024-11-09 21:08:48', '::1', 'odjluqcpl7tkg8md9i805fvsn9'),
(41, 12, 'login', '2024-11-11 08:14:01', '::1', 'njveb3e60e72m9s4ce0vjaiemk'),
(42, 12, 'logout', '2024-11-11 08:59:21', '::1', 'njveb3e60e72m9s4ce0vjaiemk'),
(43, 12, 'login', '2024-11-11 21:59:52', '::1', 'jmi15rr6tp1996a9adqb6qdii0'),
(44, 12, 'login', '2024-11-12 03:39:12', '::1', 'kbk939nnimlu2gv2rjofsft61e'),
(45, 12, 'login', '2024-11-12 08:40:52', '::1', '6l3objfsgv8c3m67j8jn8f4rqs'),
(46, 12, 'login', '2024-11-12 20:09:35', '::1', 'u7offspdftq4roaj1s6miurec1'),
(47, 12, 'login', '2024-11-13 09:19:09', '::1', 'j8bje184gnpi85e94ti6hv0hoi'),
(48, 12, 'logout', '2024-11-13 19:45:49', '::1', 'j8bje184gnpi85e94ti6hv0hoi'),
(49, 12, 'login', '2024-11-13 19:46:55', '::1', '09rrd3ktoup9t91mpqsdpl1tc7'),
(50, 12, 'logout', '2024-11-13 19:47:00', '::1', '09rrd3ktoup9t91mpqsdpl1tc7'),
(51, 12, 'login', '2024-11-13 20:14:36', '::1', 'ad4ftk47stt4h3eln0eer0132u'),
(52, 12, 'logout', '2024-11-13 20:22:15', '::1', 'ad4ftk47stt4h3eln0eer0132u'),
(53, 12, 'login', '2024-11-13 20:54:50', '::1', 'ne5b2ev7ims7qk09t7su1lhi87'),
(54, 12, 'login', '2024-11-14 06:34:15', '::1', '1ndigko7v6cf5jlhojfjh0kq8g'),
(55, 12, 'login', '2024-11-14 10:55:30', '::1', 'dpopccavqdhud6n32gvt2nri8d'),
(56, 12, 'login', '2024-11-14 11:02:21', '::1', '7uu8igtb3j2ff0ii7ub59pmi3b'),
(57, 12, 'login', '2024-11-14 11:05:00', '::1', 'l5pas9pc9kp63ddn3msv1o5m18'),
(58, 12, 'login', '2024-11-14 11:08:19', '::1', 'p92c0lv1ebpfnun4rt25tthi8p'),
(59, 12, 'logout', '2024-11-14 11:10:36', '::1', 'p92c0lv1ebpfnun4rt25tthi8p'),
(60, 12, 'login', '2024-11-14 16:44:02', '::1', 'gghdmsh7gngoqtt07r4thhsln3'),
(61, 12, 'login', '2024-11-14 17:04:41', '::1', '73e9o2lmch2geih4d9dp5rb7en'),
(62, 12, 'login', '2024-11-14 19:01:30', '::1', '3et0uht0ugkmoih9mciro85usl'),
(63, 12, 'login', '2024-11-14 20:22:07', '::1', 'dqs830l53bg2uurtam4ubjrjmv'),
(64, 12, 'login', '2024-11-14 23:17:04', '::1', 'f485g025lm3m8m15m2ngjdbtlg'),
(65, 12, 'login', '2024-11-15 02:34:39', '::1', '6iicklsuspa3pui2saglgfjitj'),
(66, 12, 'logout', '2024-11-15 04:47:34', '::1', '6iicklsuspa3pui2saglgfjitj'),
(67, 12, 'login', '2024-11-15 04:55:30', '::1', 'j7c77g3duuhlquslul724uhahm'),
(68, 12, 'logout', '2024-11-15 04:55:42', '::1', 'j7c77g3duuhlquslul724uhahm'),
(69, 12, 'login', '2024-11-15 04:56:07', '::1', 'lohkqlj790osjv544ve2l0qnrq'),
(70, 12, 'login', '2024-11-19 20:52:48', '::1', '1s13cjfl1nvc0bfc207kue99m0'),
(71, 12, 'login', '2024-11-20 05:13:30', '::1', 'bg6qrf1s0bhhr6isbedu1c2hoh'),
(72, 12, 'login', '2024-11-21 06:53:08', '::1', 'fnmvona5gqiineo86oa6h29jnf'),
(73, 12, 'logout', '2024-11-21 08:06:01', '::1', 'fnmvona5gqiineo86oa6h29jnf'),
(74, 12, 'login', '2024-11-23 02:57:57', '::1', '3ipj2or3lkdjkjikoc05bkgbv9'),
(75, 12, 'logout', '2024-11-23 03:04:30', '::1', '3ipj2or3lkdjkjikoc05bkgbv9'),
(76, 12, 'login', '2024-11-26 07:53:17', '::1', 'gguhjtr9kns7rcjb3m0o36u4b8'),
(77, 12, 'logout', '2024-11-26 08:58:33', '::1', 'gguhjtr9kns7rcjb3m0o36u4b8'),
(78, 12, 'login', '2024-11-27 01:19:48', '::1', 'pr29i2khn6ii0kl94fh761gbm7'),
(79, 12, 'login', '2024-11-27 03:23:13', '::1', '9r2hv20liv160b1itf5dddeh6t'),
(80, 12, 'login', '2024-11-27 06:39:18', '::1', '625rs7rc6a6ip3evm7hvn2p3bo'),
(81, 12, 'login', '2024-11-27 08:40:22', '::1', 'cj7hll3dvqd931qpb9m7no8v5m'),
(82, 12, 'login', '2024-11-28 04:03:15', '::1', 'qvtn54eu5pvsh8ig3cnsq4vhht'),
(83, 12, 'login', '2024-11-28 07:42:30', '::1', '3ufs8fkvqos7cbt4ne3urmk4nk'),
(84, 12, 'login', '2024-11-28 08:50:12', '::1', 'e9bh12bevg7ffpce7s17348jdj'),
(85, 12, 'logout', '2024-11-28 10:01:42', '::1', 'e9bh12bevg7ffpce7s17348jdj'),
(86, 12, 'login', '2024-11-28 19:27:41', '::1', 'mji72kt0gbhsl0svemvksbtn42'),
(87, 12, 'login', '2024-11-29 00:32:31', '::1', '5kjjp718d34m9df1ogtpb9bh75'),
(88, 12, 'login', '2024-11-29 09:09:40', '::1', 'b9jb621o4bg77bub4c52lsqsgm'),
(89, 12, 'logout', '2024-11-29 09:44:56', '::1', 'b9jb621o4bg77bub4c52lsqsgm'),
(90, 12, 'login', '2024-11-29 22:12:58', '::1', 'r9449oa9jourmhmuo0d305pstv'),
(91, 12, 'logout', '2024-11-30 04:10:09', '::1', 'r9449oa9jourmhmuo0d305pstv'),
(92, 12, 'login', '2024-11-30 04:27:40', '::1', '76gsvfvc975ft817s9o9mkjle5'),
(93, 12, 'login', '2024-12-01 02:18:42', '::1', 'tthobmkjjtahtbkgtm2t462gc0'),
(94, 12, 'login', '2024-12-01 05:01:42', '::1', '9ttapjum3mm4napc0al9l7q9ml'),
(95, 12, 'login', '2024-12-03 08:32:54', '::1', 'o3f4bb2sjpn8u0hbbs6mdsh25g'),
(96, 12, 'logout', '2024-12-03 10:41:39', '::1', 'o3f4bb2sjpn8u0hbbs6mdsh25g'),
(97, 12, 'login', '2024-12-04 04:31:00', '::1', 'so607vo62qlmuotcd2j5t8aq80'),
(98, 12, 'login', '2024-12-04 07:07:05', '::1', 'ft4rh18cgcmfv5jkcrkl72krim'),
(99, 12, 'login', '2024-12-04 23:43:28', '::1', 'mc6dn6nc6j0r4voh8mc4lhau1v'),
(100, 12, 'logout', '2024-12-05 00:37:30', '::1', 'mc6dn6nc6j0r4voh8mc4lhau1v'),
(101, 12, 'login', '2024-12-05 03:04:12', '::1', 's9c6qri4c9o9r2nkl8vvp4m04h'),
(102, 12, 'logout', '2024-12-05 03:05:31', '::1', 's9c6qri4c9o9r2nkl8vvp4m04h'),
(103, 12, 'login', '2024-12-05 03:05:40', '::1', 'c0ravrsa6s87f92vkh16b21sj2'),
(104, 12, 'login', '2024-12-05 05:17:16', '::1', 'r6efg7hmpe0hu13iic52jsk0ps'),
(105, 12, 'login', '2024-12-05 08:29:32', '::1', 'q5jkl44p3p3soi17cfuuaj2374'),
(106, 12, 'login', '2024-12-05 19:51:30', '::1', 'ntlnhtaul0g46uv4k1mdmrj6ff'),
(107, 12, 'login', '2024-12-05 20:53:18', '::1', '9o81p9uoo61ucgqlbne1u2qbbt'),
(108, 12, 'login', '2024-12-05 22:01:07', '::1', 'utsh96p1n1kel8fvh9m6a0ue0b'),
(109, 12, 'login', '2024-12-06 02:52:24', '::1', 's5u61s0jhgblc4s9umlflorhh7'),
(110, 12, 'logout', '2024-12-06 10:14:46', '::1', 's5u61s0jhgblc4s9umlflorhh7'),
(111, 12, 'login', '2024-12-07 06:56:08', '::1', 'bbe4kjfbp5k8qikhh64lfk5140'),
(112, 12, 'logout', '2024-12-07 08:54:49', '::1', 'bbe4kjfbp5k8qikhh64lfk5140'),
(113, 12, 'login', '2024-12-07 17:38:53', '::1', '804qsvascee3d9qokn4jli0p10'),
(114, 12, 'login', '2024-12-07 19:45:18', '::1', 'vn1nmboem4on558b7tesbejd2v'),
(115, 12, 'login', '2024-12-08 04:59:44', '::1', '6uut1t10mr985kt0vul4ivng1t'),
(116, 12, 'login', '2024-12-08 08:43:25', '::1', '9682tss3v2u67pbl4otkfu10ic'),
(117, 12, 'logout', '2024-12-08 20:43:21', '::1', '9682tss3v2u67pbl4otkfu10ic'),
(118, 12, 'login', '2024-12-09 01:01:50', '::1', '6n42iho8oo742m6tq29j8gjqje'),
(119, 12, 'login', '2024-12-09 04:51:38', '::1', '2t4sdr8qvt4a9mniq44tdnmq1p'),
(120, 12, 'login', '2024-12-09 08:08:05', '::1', 'uo0qrbt3eeiapsr810863uo29v'),
(121, 12, 'logout', '2024-12-09 10:47:34', '::1', 'uo0qrbt3eeiapsr810863uo29v'),
(122, 12, 'login', '2024-12-09 22:24:42', '::1', 'kfsl316cnj3ri66tc5lnsnqflu'),
(123, 12, 'login', '2024-12-10 00:21:08', '::1', '7860ql2bmeou74gm23ap2q9jm0'),
(124, 12, 'logout', '2024-12-10 09:10:31', '::1', '7860ql2bmeou74gm23ap2q9jm0'),
(125, 12, 'login', '2024-12-10 21:46:39', '::1', 'gnrbl57tt2jbrrpgvp1hg0gs8a'),
(126, 12, 'login', '2024-12-11 01:25:24', '::1', 'djg3f6n0uv6ldrq2igg9emlm5g'),
(127, 12, 'login', '2024-12-11 06:52:09', '::1', 'tflseslg1j7npfrq207srr6d89'),
(128, 12, 'logout', '2024-12-11 11:04:07', '::1', 'tflseslg1j7npfrq207srr6d89'),
(129, 12, 'login', '2024-12-11 22:34:39', '::1', 'c841cp0eqbhpm93jstmuifc5fs'),
(130, 12, 'login', '2024-12-12 03:05:42', '::1', 'mfh93ci0hkt4c1ht6lnqqocl79'),
(131, 12, 'logout', '2024-12-12 09:58:29', '::1', 'mfh93ci0hkt4c1ht6lnqqocl79'),
(132, 12, 'login', '2024-12-12 19:28:55', '::1', 'o5kp7djc8degq0j3aiqr4v34r2'),
(133, 12, 'login', '2024-12-12 20:43:37', '::1', 'cq7mqksrcel4c3a9h7oasdrlrt'),
(134, 12, 'logout', '2024-12-12 21:28:00', '::1', 'cq7mqksrcel4c3a9h7oasdrlrt'),
(135, 12, 'login', '2024-12-13 02:01:53', '::1', 'q2ljlv1agi67cv0le5ivsrjrc5'),
(136, 12, 'login', '2024-12-13 08:10:22', '::1', 'dqpvmhm1a074gr8j76rf4vub8l'),
(137, 12, 'logout', '2024-12-13 09:21:02', '::1', 'dqpvmhm1a074gr8j76rf4vub8l'),
(138, 12, 'login', '2024-12-13 18:48:00', '::1', 'ub7o210q0015jqh0p0upuuk7ab'),
(139, 12, 'logout', '2024-12-14 04:57:47', '::1', 'ub7o210q0015jqh0p0upuuk7ab'),
(140, 12, 'login', '2024-12-14 05:25:50', '::1', '6l9mqkonf6appekfp0ii7g0j9k'),
(141, 12, 'logout', '2024-12-14 08:39:39', '::1', '6l9mqkonf6appekfp0ii7g0j9k'),
(142, 12, 'login', '2024-12-14 22:27:22', '::1', 'u6a7sq53cm8rjek3j305ehtmag'),
(143, 12, 'login', '2024-12-15 00:44:55', '::1', '2058pnrj54cdt1dhac5cp2u972'),
(144, 12, 'logout', '2024-12-15 04:33:35', '::1', '2058pnrj54cdt1dhac5cp2u972'),
(145, 12, 'login', '2024-12-15 04:34:55', '::1', 'umduuta1ic4mqj6nm82svekj3m'),
(146, 12, 'login', '2024-12-15 06:26:50', '::1', 'spv29jhgb1lsmgt2fa1nldl4u8'),
(147, 12, 'logout', '2024-12-15 07:05:45', '::1', 'spv29jhgb1lsmgt2fa1nldl4u8'),
(148, 12, 'login', '2024-12-16 02:41:24', '::1', '3gl29fegte9nbifmuauv170abu');

-- --------------------------------------------------------

--
-- Table structure for table `login_logout_history`
--

CREATE TABLE `login_logout_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout_time` timestamp NULL DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `manual_logout` tinyint(1) DEFAULT 0,
  `session_duration` int(11) GENERATED ALWAYS AS (timestampdiff(SECOND,`login_time`,`logout_time`)) STORED,
  `activity_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_logout_history`
--

INSERT INTO `login_logout_history` (`id`, `user_id`, `session_id`, `ip_address`, `login_time`, `logout_time`, `device`, `last_activity`, `manual_logout`, `activity_count`) VALUES
(1, 1, 'session_abc123', '192.168.0.1', '2024-12-15 07:40:44', '2024-12-15 07:43:37', 'Chrome on Windows', NULL, 0, 0),
(2, 1, 'session_abc456', '192.168.0.1', '2024-12-15 07:46:10', '2024-12-15 07:51:12', 'Chrome on Windows', NULL, 0, 0),
(3, 12, 'f3983l87trkc34vh3pidvqa26g', '::1', '2024-12-16 06:54:03', '2024-12-16 06:55:03', NULL, NULL, 0, 0),
(4, 12, 'tnqn898ha8f3k83h5o2sqkt3i0', '::1', '2024-12-16 08:04:32', '2024-12-16 08:04:40', NULL, NULL, 0, 0),
(5, 12, 'pn5u07vj0k5c9m9tog309q4kqm', '::1', '2024-12-16 08:10:17', '2024-12-16 08:15:17', NULL, NULL, 0, 0),
(6, 12, '9h8b55pahsd1s7eqs4rgkftf3s', '::1', '2024-12-16 08:40:25', '2024-12-16 08:43:09', NULL, NULL, 0, 0),
(7, 12, 'm3g3qqc1kvh03alaerdjmc7dab', '::1', '2024-12-16 08:51:32', '2024-12-16 08:53:57', NULL, NULL, 0, 0),
(8, 12, 'jgqei89hajuvgfv25h7j25ndvt', '::1', '2024-12-16 08:58:26', '2024-12-16 09:06:58', NULL, NULL, 0, 0),
(9, 12, 'o0tio4hri4ltbo7e7bg4f7m62e', '::1', '2024-12-16 09:07:12', '2024-12-16 09:16:32', NULL, NULL, 0, 0),
(10, 12, 'mvp5ec10t0ja4esobpaliagoug', '::1', '2024-12-16 09:17:56', '2024-12-16 09:22:05', NULL, NULL, 0, 0),
(11, 12, 'on630tnhh2mqe9ac5la3ug5jni', '::1', '2024-12-16 09:29:54', '2024-12-16 09:30:00', NULL, NULL, 0, 0),
(12, 12, 'g6f237jms262ch0lip1csoh572', '::1', '2024-12-16 09:31:19', '2024-12-16 09:35:06', NULL, NULL, 0, 0),
(13, 12, 'r0n7hos02numb8o1ni3icl7q69', '::1', '2024-12-16 10:12:28', '2024-12-16 10:13:19', NULL, NULL, 0, 0),
(14, 12, 'd1sjv64skisdprn47rfq99727v', '::1', '2024-12-17 00:18:48', '2024-12-17 00:20:39', NULL, NULL, 0, 0),
(15, 12, '8g3taa6j02t0h428ctspmenrrm', '::1', '2024-12-17 02:17:49', '2024-12-17 02:19:23', NULL, '2024-12-17 11:19:03', 0, 0),
(16, 12, 'fvpu8ena516fhjrihu8o7rseeh', '::1', '2024-12-17 02:37:21', '2024-12-17 02:37:27', NULL, '2024-12-17 11:37:21', 0, 0),
(17, 12, 'dj3p4nsra64t9siqcd42i2na60', '::1', '2024-12-17 02:38:06', '2024-12-17 02:38:13', NULL, '2024-12-17 11:38:06', 1, 0),
(18, 12, '4nrc6sab8cgfaimbv3nuulsemp', '::1', '2024-12-17 03:33:40', '2024-12-17 04:03:15', NULL, '2024-12-17 12:33:40', 0, 0),
(19, 12, '8qhi265a06rquln1r8d899rnqj', '::1', '2024-12-17 04:03:27', '2024-12-17 04:03:27', NULL, '2024-12-17 13:03:27', 0, 0),
(20, 12, 'j97thth6feq3kdkre5grt2ld8u', '::1', '2024-12-17 04:04:24', '2024-12-17 04:04:24', NULL, NULL, 0, 0),
(21, 12, 'pervsguleqgarhlglinjtd5u3s', '::1', '2024-12-17 04:05:55', '2024-12-17 04:07:21', NULL, '2024-12-17 13:05:56', 0, 0),
(22, 12, '3h3f1hoqoec5l1hu4fdani49ph', '::1', '2024-12-17 04:38:48', '2024-12-17 04:38:48', NULL, '2024-12-17 13:38:48', 0, 0),
(23, 12, '4d8vtghmn7ivir4ti7f7l6u4ho', '::1', '2024-12-17 04:39:50', '2024-12-17 04:39:50', NULL, NULL, 0, 0),
(24, 12, '5ja9n78csljheg4smt7ed1dgr7', '::1', '2024-12-17 04:59:31', '2024-12-17 05:01:12', NULL, '2024-12-17 13:59:32', 0, 0),
(25, 12, 'niop8iikevhuqc5ei528qdoil9', '::1', '2024-12-17 05:01:54', '2024-12-17 05:01:55', NULL, '2024-12-17 14:01:55', 0, 0),
(26, 12, 'j53msom9ek485b38nd6qhm51is', '::1', '2024-12-17 05:02:46', '2024-12-17 05:02:46', NULL, NULL, 0, 0),
(27, 12, 'k9hnf1q0o6c18es4otnqkukvt9', '::1', '2024-12-17 05:08:03', '2024-12-17 05:08:03', NULL, '2024-12-17 14:08:03', 0, 0),
(28, 12, 'ehqq2a494fcld1hovd1osmvfgk', '::1', '2024-12-17 05:08:55', '2024-12-17 05:08:55', NULL, NULL, 0, 0),
(29, 12, 'ameg7npbg2qd9930hsqnsln0nh', '::1', '2024-12-17 05:10:29', '2024-12-17 05:10:32', NULL, '2024-12-17 14:10:32', 0, 0),
(30, 12, 'unrmf07apvofr4cfab4ru8o7i9', '::1', '2024-12-17 05:11:20', '2024-12-17 05:11:20', NULL, NULL, 0, 0),
(31, 12, '0m598ocnk0a0o0uu525k40akor', '::1', '2024-12-17 05:15:12', '2024-12-17 05:15:13', NULL, '2024-12-17 14:15:13', 0, 0),
(32, 12, 'jg65pdu35j4lo0sarpkgs151nr', '::1', '2024-12-17 05:18:01', '2024-12-17 05:18:01', NULL, NULL, 0, 0),
(33, 12, '46kfjuilad11ikde5j5al40mjm', '::1', '2024-12-17 05:23:16', '2024-12-17 05:23:16', NULL, '2024-12-17 14:23:16', 0, 0),
(38, 12, 'hvp9v0kfg8dnehikg1mohe2sic', '::1', '2024-12-17 05:29:47', '2024-12-17 05:29:47', NULL, NULL, 0, 0),
(39, 12, '2p0mtvk9et2uago229pp3hg21m', '::1', '2024-12-17 05:38:17', '2024-12-17 05:38:17', NULL, '2024-12-17 14:38:17', 0, 0),
(40, 12, 'ul1a3vltu0sn0toitcp7akuu7u', '::1', '2024-12-17 05:40:52', '2024-12-17 05:40:53', NULL, NULL, 0, 0),
(41, 12, 'lf9u6jq6a8esfmu6mhlrt4qq2r', '::1', '2024-12-17 05:44:58', '2024-12-17 05:44:58', NULL, '2024-12-17 14:44:58', 0, 0),
(42, 12, '75l18ejaeu0i574o15h21pqd5t', '::1', '2024-12-17 05:46:01', '2024-12-17 05:46:01', NULL, NULL, 0, 0),
(43, 12, 'rr8cp0fvi9jll15m60n0jr3slk', '::1', '2024-12-17 05:53:08', '2024-12-17 05:53:08', NULL, '2024-12-17 14:53:08', 0, 0),
(45, 12, 'j4hdedc02ketg9bl5hs5j3lskm', '::1', '2024-12-17 06:02:33', '2024-12-17 06:02:33', NULL, '2024-12-17 15:02:33', 0, 0),
(46, 12, '986gtin0akvdr92nhjh695u4nu', '::1', '2024-12-17 06:04:20', '2024-12-17 06:04:20', NULL, NULL, 0, 0),
(47, 12, '935b6clfb3jqste18gekv0t0d5', '::1', '2024-12-17 06:08:08', '2024-12-17 06:08:08', NULL, '2024-12-17 15:08:08', 0, 0),
(48, 12, 'sro917e96k1n2c6vha716j335l', '::1', '2024-12-17 06:09:31', '2024-12-17 06:09:31', NULL, NULL, 0, 0),
(49, 12, 'ivh34mm8gts2a5akvkk93t4fjb', '::1', '2024-12-17 06:15:24', '2024-12-17 06:15:24', NULL, '2024-12-17 15:15:24', 0, 0),
(50, 12, 's46cjuer82jtbrlahk869c4973', '::1', '2024-12-17 06:16:38', '2024-12-17 06:16:38', NULL, NULL, 0, 0),
(51, 12, '6682r97k78d1k61fci7on3todi', '::1', '2024-12-17 06:22:04', '2024-12-17 06:22:04', NULL, '2024-12-17 15:22:04', 0, 0),
(53, 12, 'gmc5b8s1r87h6bnlblmpni620t', '::1', '2024-12-17 06:28:04', '2024-12-17 06:28:04', NULL, '2024-12-17 15:28:04', 0, 0),
(54, 12, 'n8jmd5k2u2saf30paepu8ui86r', '::1', '2024-12-17 06:28:52', '2024-12-17 06:28:52', NULL, '2024-12-17 15:28:52', 0, 0),
(55, 12, 'rs9q6i3cn6g1qrf6bj63nqgmvc', '::1', '2024-12-17 06:39:12', '2024-12-17 06:39:54', NULL, '2024-12-17 15:39:12', 1, 0),
(56, 12, 'khbohvsuq13nk59j7j5fa21cum', '::1', '2024-12-17 06:40:20', '2024-12-17 06:42:14', NULL, '2024-12-17 15:40:21', 1, 0),
(57, 12, 'qjv119iktfm9s6pqghh09k8lg1', '::1', '2024-12-17 07:01:06', '2024-12-17 07:01:21', NULL, '2024-12-17 16:01:06', 1, 0),
(58, 12, '178ns2lt712lhs7mnpc5mr5o8g', '::1', '2024-12-17 07:01:38', '2024-12-17 07:01:38', NULL, '2024-12-17 16:01:38', 0, 0),
(59, 12, 'pcdol4ugjh1rbmm78hr5r8s5u3', '::1', '2024-12-17 07:02:40', '2024-12-17 07:04:42', NULL, '2024-12-17 16:02:41', 1, 0),
(60, 12, 'j1qqpsk3tq6tjcqtnfkkkkv1sk', '::1', '2024-12-17 09:18:47', '2024-12-17 10:55:34', NULL, '2024-12-17 19:55:05', 1, 0),
(61, 12, 'd8kc7pfm3og5n6c1rr6mfcivbq', '::1', '2024-12-18 03:16:32', '2024-12-18 19:14:59', NULL, '2024-12-19 04:14:59', 0, 37),
(62, 12, 'thgjn84eqf7oe5uk88huck019f', '::1', '2024-12-18 20:26:46', '2024-12-19 10:27:36', NULL, '2024-12-19 19:07:58', 1, 104),
(63, 12, 'ahlp76bqp3qofli952iv1086oe', '::1', '2024-12-19 20:57:30', '2024-12-19 23:20:39', NULL, '2024-12-20 06:50:01', 1, 50),
(64, 12, 'ner5jollhe786i4jg9vkq9akg5', '::1', '2024-12-20 00:36:30', '2024-12-20 09:23:20', NULL, '2024-12-20 18:22:15', 1, 116),
(65, 12, 'vp7qam4jlj80abl3t87as3as5m', '::1', '2024-12-20 20:52:09', '2024-12-20 22:15:19', NULL, '2024-12-21 07:14:48', 1, 42),
(66, 12, 'c34gaii5gd46tjhs0ctnvsqhq9', '::1', '2024-12-21 01:20:24', '2024-12-21 04:23:13', NULL, '2024-12-21 13:17:16', 1, 84);

--
-- Triggers `login_logout_history`
--
DELIMITER $$
CREATE TRIGGER `increment_activity_count` BEFORE UPDATE ON `login_logout_history` FOR EACH ROW BEGIN
    -- Check if the last_activity field is being updated
    IF NEW.last_activity <> OLD.last_activity THEN
        SET NEW.activity_count = OLD.activity_count + 1;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sync_logout_with_last_activity` BEFORE UPDATE ON `login_logout_history` FOR EACH ROW BEGIN
    -- Check if this is an automatic logout (manual_logout = 0 or NULL)
    IF NEW.manual_logout = 0 OR NEW.manual_logout IS NULL THEN
        -- Ensure logout_time does not exceed last_activity
        IF NEW.logout_time > OLD.last_activity THEN
            SET NEW.logout_time = OLD.last_activity;
        END IF;
    END IF;
    -- For manual logouts (manual_logout = 1), do nothing
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_logged_time` AFTER UPDATE ON `login_logout_history` FOR EACH ROW BEGIN
    -- Ensure this trigger runs only when session_duration is updated from NULL to a value
    IF NEW.session_duration IS NOT NULL AND OLD.session_duration IS NULL THEN
        -- Update the total logged time for the user
        INSERT INTO logged_time (user_id, total_time, last_updated)
        VALUES (
            NEW.user_id,
            NEW.session_duration, -- Add the current session duration
            NOW()
        )
        ON DUPLICATE KEY UPDATE 
            total_time = total_time + NEW.session_duration, -- Add the new session_duration
            last_updated = NOW();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mcqs`
--

CREATE TABLE `mcqs` (
  `mcq_id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option_1` text NOT NULL,
  `option_2` text NOT NULL,
  `option_3` text NOT NULL,
  `option_4` text NOT NULL,
  `correct_option` int(11) NOT NULL,
  `is_mastered` tinyint(1) DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mcqs`
--

INSERT INTO `mcqs` (`mcq_id`, `set_id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `correct_option`, `is_mastered`, `date_created`) VALUES
(1, 1, 'Which of the following searches will return all clientip addresses that start with 108?', '... | where (clientip, \"108.%\"', '... | where like(clientip, \"108.%\")', '... | where (clientip=108.%)', '... | search clientip=108', 2, 1, '2024-12-06 07:40:50'),
(2, 1, 'Which of the following knowledge objects can reference field aliases?', 'Calculated fields and event types only.', 'Calculated fields and tags only.', 'Calculated fields, lookups, event types, and tags.', 'Calculated fields, lookups, event types, and extracted fields.', 3, 0, '2024-12-06 07:44:25'),
(3, 1, 'Which of the following searches will return all clientip addresses that start with 108?', '... | where (clientip, \"108.%\"', '... | where like(clientip, \"108.%\")', '... | where (clientip=108.%)', '... | search clientip=108', 3, 0, '2024-12-06 07:51:54'),
(4, 2, 'What is the primary purpose of the eval command in Splunk?', 'To calculate statistics based on fields', 'To create new fields or modify existing fields based on expressions', 'To filter events based on specific conditions', 'To display data in a visual format', 2, 1, '2024-12-06 09:55:24'),
(5, 2, 'Which Splunk feature is used to categorize similar events together for easier identification?', 'Event Types', 'Tags', 'Lookups', 'Field Aliases', 1, 1, '2024-12-06 09:55:24'),
(6, 2, 'When using the Field Extractor (FX), which of the following delimiters will work? (Choose all that apply.)', 'Tabs', 'Pipes', 'Colons', 'Spaces', 1234, 1, '2024-12-06 09:55:24'),
(7, 2, 'Which group of users would most likely use pivots?', 'Users', 'Architects', 'Administrators', 'Knowledge Managers', 1, 1, '2024-12-06 09:55:25'),
(8, 2, 'When multiple event types with different color values are assigned to the same event, what determines the color displayed for the event?', 'Rank', 'Weight', 'Priority', 'Precedence', 3, 1, '2024-12-06 09:55:25'),
(9, 2, 'Which one of the following statements about the search command is true?', 'It does not allow the use of wildcards.', 'It treats field values in a case-sensitive manner.', 'It can only be used at the beginning of the search pipeline.', 'It behaves exactly like search strings before the first pipe.', 4, 1, '2024-12-06 09:55:25'),
(10, 2, 'Which of the following statements would help a user choose between the transaction and stats commands?', 'stats can only group events using IP addresses.', 'The transaction command is faster and more efficient.', 'There is a 1000 event limitation with the transaction command.', 'Use stats when the events need to be viewed as a single correlated event.', 3, 1, '2024-12-06 09:55:25'),
(11, 2, 'What is the correct syntax to find events associated with a tag?', 'tag:<field>=<value>', 'tags=<value>', 'tags:<field>=<value>', 'tag=<value>', 4, 1, '2024-12-06 09:55:25'),
(12, 2, 'Which of the following is true about the Splunk Common Information Model (CIM)?', 'The CIM contains 28 pre-configured datasets.', 'The data models included in the CIM are configured with data model acceleration turned on.', 'The data models included in the CIM are configured with data model acceleration turned off.', 'The CIM is an app that needs to run on the indexer.', 3, 1, '2024-12-06 09:55:25'),
(13, 2, 'Consider the following search run over a time range of last 7 days:\nindex=web sourcetype=access_combined | timechart avg(bytes) by product_name\nWhich option is used to change the default time span so that results are grouped into 12 hour intervals?', 'timespan=12', 'span=12h', 'timespan=12h', 'span=12', 2, 1, '2024-12-06 09:55:25'),
(14, 2, 'When would transaction be used instead of stats?', 'To have a faster and more efficient search.', 'To see results of a calculation.', 'To group events based on start/end values.', 'To group events based on a single field value.', 3, 1, '2024-12-06 09:55:25'),
(15, 2, 'Given the following eval statement:... | eval field1 = if(isnotnull(fieid1),field1,0), field2 = if(isnullWhich of the following is the equivalent using fillnull?', 'There is no equivalent expression using fillnull', '... | fillnull values=(0,\"NO-VALUE\") fields=(field1,field2)', '... | fillnull field1|\' fillnull value=\"NO-VALUE\" field2', '... | fillnull value=0 field1 | fillnull field2', 3, 1, '2024-12-06 09:55:25'),
(16, 2, 'The Splunk Common Information Model (CIM) is a collection of what type of knowledge object?', 'Saved searches', 'Lookups', 'KV Store', 'Data models', 4, 1, '2024-12-06 09:55:25'),
(17, 2, 'How is a Search Workflow Action configured to run at the same time range as the original search?', 'Select the \"Use the same time range as the search that created the field listing\" checkbox.', 'Set the earliest time to match the original search.', 'Select the same time range from the time-range picker.', 'Select the \"Overwrite time range with the original search\" checkbox.', 1, 1, '2024-12-06 09:55:25'),
(18, 2, 'A calculated field is a shortcut for performing repetitive, long, or complex transformations using which of the following commands?', 'transaction', 'eval', 'lookup', 'stats', 2, 1, '2024-12-06 09:55:25'),
(19, 2, 'When using the transaction command, how are evicted transactions identified?', '_txn field is set to 1, or true.', 'open_txn field is set to l, or true.', 'max_txn field is set to 0, or false.', 'closed_txn field is set to 0, or false.', 4, 1, '2024-12-06 09:55:25'),
(20, 2, 'How are arguments defined within the macro search string?', '“arg”', '%arg%', '$arg$', '‘arg’', 3, 1, '2024-12-06 09:55:25'),
(21, 2, 'By default, how is acceleration configured in the Splunk Common Information Model (CIM) add-on?', 'Turned off.', 'Turned on.', 'Determined automatically based on the sourcetype.', 'Determined automatically based on the data source.', 1, 1, '2024-12-06 09:55:25'),
(22, 2, 'Which of the following objects can a calculated field use as a source?', 'An alias of a field.', 'A field added by an automatic lookup.', 'The tag field.', 'The eventtype field.', 1, 1, '2024-12-06 09:55:25'),
(23, 2, 'How are event types different from saved reports?', 'Event types can be shared with Splunk users and added to dashboards.', 'Event types include formatting of the search results.', 'Event types do not include a time range.', 'Event types cannot be used to organize data into categories.', 3, 1, '2024-12-06 09:55:25'),
(24, 2, 'When creating a data model, which root dataset requires at least one constraint?', 'Root event dataset', 'Root transaction dataset', 'Root search dataset', 'Root child dataset', 1, 1, '2024-12-06 09:55:25'),
(25, 2, 'Which search retrieves events with the event type web_errors?', 'tag=web_errors', 'eventtype=web_errors', 'eventtype(web_errors)', 'eventtype \"web_errors\"', 2, 1, '2024-12-06 09:55:25'),
(26, 2, 'When used with the timechart command, which value of the limit argument returns all values?', 'limit=none', 'limit=all', 'limit=0', 'limit=*', 3, 1, '2024-12-06 09:55:25'),
(27, 2, 'Which of the following statements best describes a macro?', 'A macro is a method of categorizing events based on a search.', 'A macro is a knowledge object that enables you to schedule searches for specific events.', 'A macro is a portion of a search that can be reused in multiple places.', 'A macro is a way to associate an additional (new) name with an existing field name.', 3, 1, '2024-12-06 09:55:25'),
(28, 2, 'The macro weekly_sales(2) contains the search string:\nindex=games | eval ProductSales = $Price$ * $AmountSold$\nWhich of the following will return results?', '`weekly_sales(3.99, 10)`', '\'weekly_sales($3.99$, $10$)\'', '\'weekly_sales(3.99, 10)\'', '\'weekly_sales(3)\'', 1, 1, '2024-12-06 09:55:25'),
(29, 2, 'What happens when a user edits the regular expression (regex) field extraction generated in the Field Extractor (FX)?', 'There is a limit to the number of fields that can be extracted.', 'The user is unable to return to the automatic field extraction workflow.', 'The user is unable to preview the extractions.', 'The extraction is added at index time.', 2, 1, '2024-12-06 09:55:25'),
(30, 2, 'What is the correct syntax for the transaction command?', '| transaction(clientip,5m,1m)', '| transaction clientip maxspan=5 pause=1', '| transaction clientip maxspan=5m maxpause=1m', '| transaction(clientip, 5, 1)', 3, 1, '2024-12-06 09:55:25'),
(31, 2, 'Which of the following statements describe the Common Information Model (CIM)? (Choose all that apply.)', 'CIM is a methodology for normalizing data.', 'CIM can correlate data from different sources.', 'The Knowledge Manager uses the CIM to create knowledge objects.', 'CIM is an app that can coexist with other apps on a single Splunk deployment.', 123, 1, '2024-12-06 09:55:25'),
(32, 2, 'What is the Splunk Common Information Model (CIM)?', 'The CIM is a prerequisite that any data source must meet to be successfully onboarded into Splunk.', 'The CIM defines an ecosystem of apps that can be fully supported by Splunk.', 'The CIM provides a methodology to normalize data from different sources and source types.', 'The CIM is a data exchange initiative between software vendors.', 3, 1, '2024-12-06 09:55:25'),
(33, 2, 'For the following search, which field populates the x-axis?index=security sourcetype=linux_secure | timechart count by action', '_time', 'sourcetype', 'action', 'time', 1, 1, '2024-12-06 09:55:25'),
(34, 2, 'Which knowledge object is used to normalize field names to comply with the Splunk Common Information Model (CIM)?', 'Event types', 'Tags', 'Field alias', 'Search workflow action', 3, 1, '2024-12-06 09:55:25'),
(35, 2, 'Which of the following transforming commands can be used with transactions?', 'chart, timechart, stats, eventstats', 'chart, timechart, stats, diff', 'chart, timechart, stats, pivot', 'chart, timechart, datamodel, pivot', 1, 1, '2024-12-06 09:55:25'),
(36, 2, 'What is the correct format for naming a macro with multiple arguments?', 'monthly_sales[3]', 'monthly_sales(3)', 'monthly_sales(argument 1, argument 2, argument 3)', 'monthly_sales[argument 1, argument 2, argument 3]', 2, 1, '2024-12-06 09:55:25'),
(37, 2, 'What are search macros?', 'A method to normalize fields.', 'Lookup definitions in lookup tables.', 'Categories of search results.', 'Reusable pieces of search processing language.', 4, 1, '2024-12-06 09:55:25'),
(38, 2, 'How is a macro referenced in a search?', 'By using the macroname command.', 'By enclosing the macro name in single-quote characters (\').', 'By using the macro command.', 'By enclosing the macro name in backtick characters (\').', 4, 1, '2024-12-06 09:55:25'),
(39, 2, 'Which search string would only return results for an event type called successful_purchases?', 'successful_purchases', 'Event_Type::successful_purchases', 'tag=successful_purchases', 'eventtype=successful_purchases', 4, 1, '2024-12-06 09:55:25'),
(40, 2, 'In the Field Extractor, when would the regular expression method be used?', 'When events contain table-based data.', 'When events contain comma-separated data.', 'When events contain JSON data.', 'When events contain unstructured data.', 4, 1, '2024-12-06 09:55:25'),
(41, 2, 'Which of the following is true about data model attributes?', 'They can only be added into a root search dataset.', 'They cannot be created within the data model.', 'They can be added to a dataset from search time field extractions.', 'They cannot be edited if inherited from a parent dataset.', 3, 1, '2024-12-06 09:55:25'),
(42, 2, 'Which of the following knowledge objects represents the output of an eval expression?', 'Eval fields', 'Calculated fields', 'Field extractions', 'Calculated lookups', 2, 1, '2024-12-06 09:55:25'),
(43, 2, 'How is a variable for a macro defined?', 'Place the variable name inside of percentage signs: %variable name%.', 'Place the variable name inside of curly braces: {variable name}.', 'Place the variable name inside of dollar signs: $variable name$.', 'Place the variable name inside of asterisks: *variable name*.', 3, 1, '2024-12-06 09:55:25'),
(44, 2, 'Which field will be used to populate the productINFO field if the productName and productId fields have values for a given event?\n| eval productINFO=coalesce(productName, productId)', 'The value for the productName field because it appears first.', 'Neither field value will be used and the productINFO field will be assigned a NULL value for the given event.', 'The value for the productID field because it appears second.', 'Both field values will be used and the productINFO field will become a multivalue field for the given event.', 1, 1, '2024-12-06 09:55:25'),
(45, 2, 'Which method in the Field Extractor would extract the port number from the following event? 10/20/2022 - 125.24.20.1 ++++ port 54 - user: admin', 'Delimiter', 'The Field Extractor tool cannot extract regular expressions.', 'Regular expression', 'rex command', 3, 1, '2024-12-06 09:55:25'),
(46, 2, 'Which of the following is a feature of the Pivot tool?', 'Data Models are not required.', 'Creates reports without using SPL.', 'Creates lookups without using SPL.', 'Datasets are not required.', 2, 1, '2024-12-06 09:55:25'),
(47, 2, 'Which type of workflow action sends field values to an external resource (e.g. a ticketing system)?', 'GET', 'Search', 'Format', 'POST', 4, 1, '2024-12-06 09:55:25'),
(48, 2, 'Which of the following is included with the Common Information Model (CIM) add-on?', 'tsidx files', 'Search macros', 'Workflow actions', 'Event category tags', 4, 1, '2024-12-06 09:55:25'),
(49, 2, 'Which of the following searches will return all clientip addresses that start with 108?', '... | where (clientip, \"108.%\"', '... | where like(clientip, \"108.%\")', '... | where (clientip=108.%)', '... | search clientip=108', 2, 1, '2024-12-06 09:55:25'),
(50, 2, 'Which of the following knowledge objects can reference field aliases?', 'Calculated fields and event types only.', 'Calculated fields and tags only.', 'Calculated fields, lookups, event types, and tags.', 'Calculated fields, lookups, event types, and extracted fields.', 3, 1, '2024-12-06 09:55:25'),
(51, 2, 'If a calculated field has the same name as an extracted field, what happens to the extracted field?', 'The calculated field will override the extracted field.', 'The calculated and extracted fields will be combined.', 'The calculated field will duplicate the extracted field.', 'An error will be returned and the search will fail.', 1, 1, '2024-12-06 09:55:25'),
(52, 2, 'What do events in a transaction have in common?', 'All events in a transaction must have the same timestamp.', 'All events in a transaction must have the same sourcetype.', 'All events in a transaction must have the exact same set of fields.', 'All events in a transaction must be related by one or more fields.', 4, 1, '2024-12-06 09:55:25'),
(53, 3, 'Which field extraction method should be selected for comma-separated data?', 'table extraction', 'eval expression', 'Regular expression', 'Delimiters', 4, 1, '2024-12-07 07:15:41'),
(54, 3, 'Which of the following options will define the first event in a transaction?', 'with', 'startswith', 'startingwith', 'firstevent', 2, 1, '2024-12-07 07:15:41'),
(55, 3, 'What approach is recommended when using the Splunk Common Information Model (CIM) add-on to normalize data?', 'Run a search using the authentication command.', 'Consult the CIM event type reference tables.', 'Consult the CIM data model reference tables.', 'Run a search using the correlation command.', 3, 1, '2024-12-07 07:15:41'),
(56, 3, 'What type of command is eval?', 'Distributable streaming', 'Report generating', 'Streaming in some modes', 'Centralized streaming', 1, 1, '2024-12-07 07:15:41'),
(57, 3, 'Which workflow action type performs a secondary search?', 'GET', 'POST', 'Search', 'Drilldown', 3, 1, '2024-12-07 07:15:41'),
(58, 3, 'How can an existing accelerated data model be edited?', 'It cannot be edited. A new data model would need to be created.', 'The data model must be de-accelerated before edits can be made to its structure.', 'An accelerated data model can be edited once its .tsidx file has expired.', 'An accelerated data model can be edited from the Pivot tool.', 2, 1, '2024-12-07 07:15:41'),
(59, 3, 'If there are fields in the data with values that are \"\" or empty but not null, which of the following would add a value?', '| eval notNULL=\"\" | fillnull value=0 notNULL', '| eval notNULL = \"\" | nullfill value=0 notNULL', '| eval notNULL = if(isnull(notNULL), \"0\"', '| eval notNULL = if(isnull(notNULL), \"0\", notNULL)', 1, 1, '2024-12-07 07:15:41'),
(60, 3, 'What commands can be used to group events from one or more data sources?', 'top,rare', 'transaction,stats', 'eval,coalesce', 'stats,format', 2, 1, '2024-12-07 07:15:41'),
(61, 3, 'Which delimiters can the Field Extractor (FX) detect? (Choose all that apply.)', 'Tabs', 'Pipes', 'Spaces', 'Commas', 1234, 1, '2024-12-07 07:15:41'),
(62, 3, 'Which syntax is used to represent an argument in a macro definition?', '%argument%', '\'argument\'', '\"argument\"', '$argument$', 4, 1, '2024-12-07 07:15:41'),
(63, 3, 'Which of the following examples would use a POST workflow action?', 'Use the field values in an HTTP error event to create a new ticket in an external system.', 'Open a web browser to look up an HTTP status code.', 'Launch secondary Splunk searches that use one or more field values from selected events.', 'Perform an external IP lookup based on a domain value found in events.', 124, 1, '2024-12-07 07:15:41'),
(64, 3, 'When creating an event type, which is allowed in the search string?', 'Joins', 'Pipes', 'Subsearches', 'Tags', 1, 1, '2024-12-07 07:15:41'),
(65, 3, 'What are the expected results for a search that contains the command | where A=B?', 'Events where field A contains the string value B.', 'Events that contain the string value A=B.', 'Events where values of field A are equal to values of field B.', 'Events that contain the string value where A=B.', 3, 1, '2024-12-07 07:15:41'),
(66, 3, 'A data model consists of which three types of datasets?', 'Constraint, field, value.', 'Events, searches, transactions.', 'Field extraction, regex, delimited.', 'Transaction, session ID, metadata.', 2, 1, '2024-12-07 07:15:41'),
(67, 3, 'Where are the results of eval commands stored?', 'In a field.', 'In an index.', 'In a KV Store.', 'In a database.', 1, 1, '2024-12-07 07:15:41'),
(68, 3, 'Which of the following statements describe calculated fields? (Choose all that apply.)', 'Calculated fields can be used in the search bar.', 'Calculated fields can be based on an extracted field.', 'Calculated fields can only be applied to host and sourcetype.', 'Calculated fields are shortcuts for performing calculations using the eval command.', 124, 1, '2024-12-07 07:15:41'),
(69, 3, 'Calculated fields can be based on which of the following?', 'Tags', 'Extracted fields', 'Output fields for a lookup', 'Fields generated from a search string', 2, 1, '2024-12-07 07:15:41'),
(70, 3, 'Which of the following actions can the eval command perform?', 'Remove fields from results.', 'Create or replace an existing field.', 'Group transactions by one or more fields.', 'Save SPL commands to be reused in other searches.', 2, 1, '2024-12-07 07:15:41'),
(71, 3, 'When should transaction be used?', 'Only in a large distributed Splunk environment.', 'When calculating results from one or more fields.', 'When event grouping is based on start/end values.', 'When grouping events results in over 1000 events in each group.', 3, 1, '2024-12-07 07:15:41'),
(72, 3, 'When performing a regular expression (regex) field extraction using the Field Extractor (FX), what happens when the require option is used?', 'The regex can no longer be edited.', 'The field being extracted will be required for all future events.', 'The events without the required field will not display in searches.', 'Only events with the required string will be included in the extraction.', 4, 1, '2024-12-07 07:15:41'),
(73, 3, 'When using | timechart by host, which field is represented in the x-axis?', 'date', 'host', 'time', '_time', 4, 1, '2024-12-07 07:15:41'),
(74, 3, 'Which of the following is the correct way to use the datamodel command to search fields in the Web data model within the Web dataset?', '| datamodel Web Web search | fields Web*', '| search datamodel Web Web | fields Web*', '| datamodel Web Web fields | search Web*', 'datamodel=Web | search Web | fields Web*', 1, 1, '2024-12-07 07:15:41'),
(75, 3, 'Which of the following statements describe the command below? (Choose all that apply.) sourcetype=access_combined | transaction JSESSIONID', 'An additional field named maxspan is created.', 'An additional field named duration is created.', 'An additional field named eventcount is created.', 'Events with the same JSESSIONID will be grouped together into a single event.', 234, 1, '2024-12-07 07:15:41'),
(76, 3, 'Which of the following searches will return events containing a tag named Privileged?', 'tag=Priv', 'tag=Priv*', 'tag=priv*', 'tag=privileged', 2, 1, '2024-12-07 07:15:41'),
(77, 3, 'What is required for a macro to accept three arguments?', 'The macro\'s name ends with (3).', 'The macro\'s name starts with (3).', 'The macro\'s argument count setting is 3 or more.', 'Nothing, all macros can accept any number of arguments.', 1, 1, '2024-12-07 07:15:41'),
(78, 3, 'Which workflow action method can be used when the action type is set to link?', 'GET', 'PUT', 'Search', 'UPDATE', 1, 1, '2024-12-07 07:15:41'),
(79, 3, 'Which of the following statements about tags is true? (Choose all that apply.)', 'Tags are case-insensitive.', 'Tags are based on field/value pairs.', 'Tags categorize events based on a search.', 'Tags are designed to make data more understandable.', 24, 1, '2024-12-07 07:15:41'),
(80, 3, 'Which of the following statements about macros is true? (Choose all that apply.)', 'Arguments are defined at execution time.', 'Arguments are defined when the macro is created.', 'Argument values are used to resolve the search string at execution time.', 'Argument values are used to resolve the search string when the macro is created.', 23, 1, '2024-12-07 07:15:41'),
(81, 3, 'Information needed to create a GET workflow action includes which of the following? (Choose all that apply.)', 'A name for the workflow action.', 'A URI where the user will be directed at search time.', 'A label that will appear in the Event Action menu at search time.', 'A name for the URI where the user will be directed at search time.', 123, 1, '2024-12-07 07:15:41'),
(82, 3, 'Which of the following can be used with the eval command tostring function? (Choose all that apply.)', '\"hex\"', '\"commas\"', '\"decimal\"', '\"duration\"', 124, 1, '2024-12-07 07:15:41'),
(83, 3, 'Which of the following searches show a valid use of a macro? (Choose all that apply.)', 'index=main source=mySource oldField=* |\'makeMyField(oldField)\'| table _time newField', 'index=main source=mySource oldField=* | stats if(\'makeMyField(oldField)\') | table _time newField', 'index=main source=mySource oldField=* | eval newField=\'makeMyField(oldField)\'| table _time newField', 'index=main source=mySource oldField=* | \"\'newField(\'makeMyField(oldField)\')\'\" | table _time newField', 13, 1, '2024-12-07 07:15:41'),
(84, 3, 'A user wants to convert numeric field values to strings and also to sort on those values.Which command should be used first, the eval or the sort?', 'It doesn\'t matter whether eval or sort is used first.', 'Convert the numeric to a string with eval first, then sort.', 'Use sort first, then convert the numeric to a string with eval.', 'You cannot use the sort command and the eval command on the same field.', 3, 1, '2024-12-07 07:15:41'),
(85, 3, 'Which Knowledge Object does the Splunk Common Information Model (CIM) use to normalize data, in addition to field aliases, event types, and tags?', 'Macros', 'Lookups', 'Workflow actions', 'Field extractions', 24, 1, '2024-12-07 07:15:41'),
(86, 3, 'Which of the following statements describe data model acceleration? (Choose all that apply.)', 'Root events cannot be accelerated.', 'Accelerated data models cannot be edited.', 'Private data models cannot be accelerated.', 'You must have administrative permissions or the accelerate_datamodel capability to accelerate a data model.', 234, 1, '2024-12-07 07:15:41'),
(87, 3, 'How does a user display a chart in stack mode?', 'By using the stack command.', 'By turning on the Use Trellis Layout option.', 'By changing Stack Mode in the Format menu.', 'You cannot display a chart in stack mode, only a timechart.', 3, 1, '2024-12-07 07:15:41'),
(88, 3, 'What other syntax will produce exactly the same results as | chart count over vendor_action by user?', '| chart count by vendor_action, user', '| chart count over vendor_action, user', '| chart count by vendor_action over user', '| chart count over user by vendor_action', 1, 1, '2024-12-07 07:15:41'),
(89, 3, 'Data models are composed of one or more of which of the following datasets? (Choose all that apply.)', 'Events datasets', 'Search datasets', 'Transaction datasets', 'Any child of event, transaction, and search datasets', 123, 1, '2024-12-07 07:15:41'),
(90, 3, 'What are the two parts of a root event dataset?', 'Fields and variables.', 'Fields and attributes.', 'Constraints and fields.', 'Constraints and lookups.', 3, 1, '2024-12-07 07:15:41'),
(91, 3, 'When using timechart, how many fields can be listed after a by clause?', '0, because timechart doesn\'t support using a by clause.', '1, because _time is already implied as the x-axis.', '2, because one field would represent the x-axis and the other would represent the y-axis.', 'There is no limit specific to timechart.', 2, 1, '2024-12-07 07:15:41'),
(92, 3, 'A field alias has been created based on an original field. A search without any transforming commands is then executed in Smart Mode. Which field name appears in the results?', 'Both will appear in the All Fields list, but only if the alias is specified in the search.', 'Both will appear in the Interesting Fields list, but only if they appear in at least 20 percent of events.', 'The original field only appears in All Fields list and the alias only appears in the Interesting Fields list.', 'The alias only appears in the All Fields list and the original field only appears in the Interesting Fields list.', 2, 1, '2024-12-07 07:15:41'),
(93, 3, 'Which of the following statements describes macros?', 'A macro is a reusable search string that must contain the full search.', 'A macro is a reusable search string that must have a fixed time range.', 'A macro is a reusable search string that may have a flexible time range.', 'A macro is a reusable search string that must contain only a portion of the search.', 3, 1, '2024-12-07 07:15:41'),
(94, 3, 'In what order are the following knowledge objects/configurations applied?', 'Field Aliases, Field Extractions, Lookups', 'Field Extractions, Field Aliases, Lookups', 'Field Extractions, Lookups, Field Aliases', 'Lookups, Field Aliases, Field Extractions', 2, 1, '2024-12-07 07:15:41'),
(95, 3, 'In which of the following scenarios is an event type more effective than a saved search?', 'When a search should always include the same time range.', 'When a search needs to be added to other users\' dashboards.', 'When the search string needs to be used in future searches.', 'When formatting needs to be included with the search string.', 3, 1, '2024-12-07 07:15:41'),
(96, 3, 'When using the transaction command, what does the argument maxspan do?', 'Sets the maximum total time between events in a transaction.', 'Sets the maximum length of all the events within a transaction.', 'Sets the maximum total time between the earliest and latest events in a transaction.', 'Sets the maximum length that any single event can reach to be included in the transaction.', 3, 1, '2024-12-07 07:15:41'),
(97, 3, 'When creating a Search workflow action, which field is required?', 'Search string', 'Data model name', 'Permission setting', 'An eval statement', 1, 1, '2024-12-07 07:15:41'),
(98, 3, 'To identify all of the contributing events within a transaction that contain at least one REJECT event, which syntax is correct?', 'index=main REJECT | transaction sessionid', 'index=main | transaction sessionid | search REJECT', 'index=main | transaction sessionid | where transaction=reject', 'index=main | transaction sessionid | where transaction=\"REJECT*\"', 2, 1, '2024-12-07 07:15:41'),
(99, 3, 'After manually editing a regular expression (regex), which of the following statements is true?', 'Changes made manually can be reverted in the Field Extractor (FX) UI.', 'It is no longer possible to edit the field extraction in the Field Extractor (FX) UI.', 'It is not possible to manually edit a regular expression (regex) that was created using the Field Extractor (FX) UI.', 'The Field Extractor (FX) UI keeps its own version of the field extraction in addition to the one that was manually edited.', 2, 1, '2024-12-07 07:15:41'),
(100, 3, 'When using the Field Extractor (FX), which of the following delimiters will work? (Choose all that apply.)', 'Tabs', 'Pipes', 'Colons', 'Spaces', 1234, 1, '2024-12-07 07:15:41'),
(101, 3, 'Which of the following statements describes POST workflow actions?', 'Configuration of a POST workflow action includes choosing a sourcetype.', 'POST workflow actions can be configured to send email to the URI location.', 'By default, POST workflow actions are shown in both the event and field menus.', 'POST workflow actions can be configured to send POST arguments to the URI location.', 4, 1, '2024-12-07 07:15:41'),
(102, 3, 'Which of the following statements is true, especially in large environments?', 'Use the stats command when you need to group events by two or more fields.', 'The stats command is faster and more efficient than the transaction command.', 'The transaction command is faster and more efficient than the stats command.', 'Use the transaction command when you want to see the results of a calculation.', 2, 1, '2024-12-07 07:15:41'),
(103, 3, 'What does the following search do?\nindex=corndog type= mysterymeat action=eaten | stats count as corndog_count by user', 'Creates a table of the total count of users and split by corndogs.', 'Creates a table of the total count of mysterymeat corndogs split by user.', 'Creates a table with the count of all types of corndogs eaten split by user.', 'Creates a table that groups the total number of users by vegetarian corndogs.', 2, 1, '2024-12-07 07:15:41'),
(104, 3, 'Which of the following statements about event types is true? (Choose all that apply.)', 'Event types can be tagged.', 'Event types must include a time range.', 'Event types categorize events based on a search.', 'Event types can be a useful method for capturing and sharing knowledge.', 2, 1, '2024-12-07 07:15:41');

--
-- Triggers `mcqs`
--
DELIMITER $$
CREATE TRIGGER `after_mcq_delete` AFTER DELETE ON `mcqs` FOR EACH ROW BEGIN
    UPDATE mcq_sets
    SET num_questions = (
        SELECT COUNT(*)
        FROM mcqs
        WHERE set_id = OLD.set_id
    )
    WHERE set_id = OLD.set_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_mcq_insert` AFTER INSERT ON `mcqs` FOR EACH ROW BEGIN
    UPDATE mcq_sets
    SET num_questions = (
        SELECT COUNT(*)
        FROM mcqs
        WHERE set_id = NEW.set_id
    )
    WHERE set_id = NEW.set_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_mcq_mastered_delete` AFTER DELETE ON `mcqs` FOR EACH ROW BEGIN
    UPDATE mcq_sets
    SET questions_mastered = (
        SELECT COUNT(*)
        FROM mcqs
        WHERE set_id = OLD.set_id AND is_mastered = 1
    )
    WHERE set_id = OLD.set_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_mcq_mastered_update` AFTER UPDATE ON `mcqs` FOR EACH ROW BEGIN
    IF NEW.is_mastered = TRUE AND OLD.is_mastered = FALSE THEN
        -- Increment the questions_mastered count
        UPDATE mcq_sets
        SET questions_mastered = questions_mastered + 1
        WHERE set_id = NEW.set_id;
    ELSEIF NEW.is_mastered = FALSE AND OLD.is_mastered = TRUE THEN
        -- Decrement the questions_mastered count
        UPDATE mcq_sets
        SET questions_mastered = questions_mastered - 1
        WHERE set_id = NEW.set_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mcq_sets`
--

CREATE TABLE `mcq_sets` (
  `set_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `num_questions` int(11) DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `course_id` int(11) DEFAULT NULL,
  `questions_mastered` int(11) DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mcq_sets`
--

INSERT INTO `mcq_sets` (`set_id`, `user_id`, `set_name`, `num_questions`, `date_created`, `course_id`, `questions_mastered`, `updated_at`) VALUES
(1, 12, 'CSEC 702 MCQs', 3, '2024-12-06 05:27:43', 14, 1, '2024-12-15 07:04:49'),
(2, 12, 'Splunk 1', 49, '2024-12-06 09:55:22', 18, 49, '2024-12-15 07:04:49'),
(3, 12, 'Splunk 2', 52, '2024-12-07 07:15:39', 18, 52, '2024-12-15 07:04:49');

--
-- Triggers `mcq_sets`
--
DELIMITER $$
CREATE TRIGGER `after_mcq_set_delete` AFTER DELETE ON `mcq_sets` FOR EACH ROW BEGIN
    DELETE FROM mcqs WHERE set_id = OLD.set_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `Quote` varchar(115) DEFAULT NULL,
  `Author` varchar(24) DEFAULT NULL,
  `last_used` datetime DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`Quote`, `Author`, `last_used`, `id`) VALUES
('\"A diamond is just a piece of charcoal that handled stress well.\"', 'Unknown', '2024-12-20 00:00:00', 1),
('\"A goal without a plan is just a wish.\"', 'Antoine de Saint-Exupéry', '2024-12-19 00:00:00', 2),
('\"A leader is one who knows the way, goes the way, and shows the way.\"', 'John C. Maxwell', '2024-12-21 00:00:00', 3),
('\"A lot of people are afraid to say what they want. That\'s why they don\'t get what they want.\" ', 'Madonna', NULL, 4),
('\"A person who never made a mistake never tried anything new.\"', 'Albert Einstein', NULL, 5),
('\"Aim for the moon. If you miss, you may hit a star.\"', 'Unknown', NULL, 6),
('\"All dreams are within reach. All you have to do is keep moving towards them.\"', 'W. Clement Stone', NULL, 7),
('\"All our dreams can come true, if we have the courage to pursue them.\"', 'Viola Davis', NULL, 8),
('\"An investment in knowledge pays the best interest.\"', 'Walt Disney', NULL, 9),
('\"Be so good they can\'t ignore you.\"', 'Benjamin Franklin', NULL, 10),
('\"Be the spark everyone needs to brighten up their day.\"', 'Steve Martin', NULL, 11),
('\"Be yourself; everyone else is already taken.\" ', 'Unknown', NULL, 12),
('\"Behind every successful person, there are a lot of unsuccessful years.\"', 'Oscar Wilde', NULL, 13),
('\"Belief creates the actual fact.\"', 'Unknown', NULL, 14),
('\"Believe in your ability to create change.\"', 'William James', NULL, 15),
('\"Believe you can and you\'re halfway there.\"', 'Unknown', NULL, 16),
('\"Challenges are what make life interesting; overcoming them is what makes life meaningful.\"', 'Theodore Roosevelt', NULL, 17),
('\"Climb mountains not so the world can see you, but so you can see the world.\"', 'Joshua Marine', NULL, 18),
('\"Confidence comes not from always being right but from not fearing to be wrong.\"', 'Unknown', NULL, 19),
('\"Courage is like a muscle. We strengthen it by use.”', 'Unknown', NULL, 20),
('“Develop success from failures.\"', 'Ruth Gordo', NULL, 21),
('\"Discipline is the bridge between goals and accomplishment.\"', 'Dale Carnegie', NULL, 22),
('\"Do one thing every day that scares you.\"', 'Jim Rohn', NULL, 23),
('“Do the best you can. No one can do more than that.”', 'Unknown', NULL, 24),
('“Do what you can, with what you have, where you are.”', 'John Wooden', NULL, 25),
('\"Don’t be afraid to dream big; fear is the enemy of progress.\"', 'Theodore Roosevelt', NULL, 26),
('\"Don’t be discouraged. It’s often the last key in the bunch that opens the lock.\"', 'Unknown', NULL, 27),
('\"Don’t follow the crowd, let the crowd follow you.\"', 'Unknown', NULL, 28),
('\"Don’t just learn to earn; learn to grow.\"', 'Unknown', NULL, 29),
('“Don’t let someone else’s opinion of you become your reality.”', 'Les Brown', NULL, 30),
('\"Don’t let the fear of losing be greater than the excitement of winning.\"', 'Robert Kiyosaki', NULL, 31),
('\"Don’t let what you cannot do interfere with what you can do.\"', 'Unknown', NULL, 32),
('\"Don’t let yesterday take up too much of today.\"', 'John Wooden', NULL, 33),
('\"Don’t limit your challenges, challenge your limits.\"', 'Will Rogers', NULL, 34),
('“Don’t settle for average. Bring your best to the moment.\"', 'Unknown', NULL, 35),
('\"Don\'t sit down and wait for the opportunities to come. Get up and make them.\"', 'Angela Bassett', NULL, 36),
('\"Don’t stop until you’re proud.\"', 'Madam C.J. Walker', NULL, 37),
('\"Don\'t stop when you\'re tired, stop when you\'re done.\"', 'Unknown', NULL, 38),
('\"Don\'t try to lessen yourself for the world; let the world catch up to you.\"', 'David Goggins', NULL, 39),
('\"Don’t wait for the perfect moment, create it.\"', 'Beyoncé', NULL, 40),
('\"Don\'t watch the clock; do what it does. Keep going.\"', 'Unknown', NULL, 41),
('\"Don’t wish it were easier. Wish you were better.\"', 'Sam Levenson', NULL, 42),
('“Don’t worry about failure; you only have to be right once.”', 'Unknown', NULL, 43),
('“Doubt is a killer. You just have to know who you are and what you stand for.”', 'Drew Houston', NULL, 44),
('\"Education is a way to escape the limits of your environment and become anything you want.\"', 'Jennifer Lopez', NULL, 45),
('\"Education is not the learning of facts, but the training of the mind to think.\"', 'Unknown', NULL, 46),
('“Education is the most powerful weapon which you can use to change the world.”', 'Albert Einstein', NULL, 47),
('\"Education is the movement from darkness to light.\"', 'Nelson Mandela', NULL, 48),
('“Education is the passport to the future, for tomorrow belongs to those who prepare for it today.”', 'Allan Bloom', NULL, 49),
('\"Every day is a new opportunity to grow and learn.\"', 'Malcolm X', NULL, 50),
('\"Every setback is an opportunity to fuel your next leap forward.\"', 'Unknown', NULL, 51),
('“Everything you’ve ever wanted is sitting on the other side of fear.”', 'Unknown', NULL, 52),
('“Failure is simply the opportunity to begin again, this time more intelligently.”', 'George Addair', NULL, 53),
('\"Failure will never overtake me if my determination to succeed is strong enough.\"', 'Henry Ford', NULL, 54),
('\"FEAR – Forget Everything And Run… or… Face Everything And Rise. It’s your choice.\"', 'Og Mandino', NULL, 55),
('\"Find something you\'re passionate about and keep tremendously interested in it.\"', 'Unknown', NULL, 56),
('\"Focus on being productive instead of busy.\"', 'Julia Child ', NULL, 57),
('\"Go confidently in the direction of your dreams. Live the life you have imagined.\"', 'Unknown', NULL, 58),
('\"Go until you fail, then keep going.\"', 'Henry David Thoreau', NULL, 59),
('\"Good, better, best. Never let it rest. \'Til your good is better and your better is best.\"', 'Jason Feifer', NULL, 60),
('\"Great leaders don’t set out to be a leader… they set out to make a difference.\"', 'St. Jerome', NULL, 61),
('\"Great things never come from comfort zones.\"', 'Jeremy Bravo', NULL, 62),
('\"Hard things will happen to us. We will recover. We will learn from it. We will grow more resilient because of it.\"', 'Unknown', NULL, 63),
('“I am not a product of my circumstances. I am a product of my decisions.”', 'Taylor Swift', NULL, 64),
('\"I can, therefore I am.\"', 'Stephen R. Covey', NULL, 65),
('\"I didn\'t get there by wishing for it or hoping for it, but by working for it.\"', 'Simone Weil', NULL, 66),
('“I find that the harder I work, the more luck I seem to have.”', 'Estée Lauder ', NULL, 67),
('“I have not failed. I’ve just found 10,000 ways that won’t work.”', 'Thomas Jefferson', NULL, 68),
('\"If it doesn\'t challenge you, it won\'t change you.\"', 'Thomas Edison', NULL, 69),
('“If there is no struggle, there is no progress.” ', 'Unknown', NULL, 70),
('“If you can dream it, you can do it.” ', 'Frederick Douglass', NULL, 71),
('\"If you can’t yet do great things, do small things in a great way.”', 'Walt Disney', NULL, 72),
('\"If you don’t like something, change it. If you can’t change it, change your attitude.\"', 'Napoleon Hill', NULL, 73),
('\"If you don’t like the road you’re walking, start paving another one.”', 'Maya Angelou', NULL, 74),
('\"If you love life do not waste time, for time is what life is made up of.\"', 'Dolly Parton', NULL, 75),
('\"If you prioritize yourself, you are going to save yourself.\"', 'Bruce Lee', NULL, 76),
('“If you really want to do something, you’ll find a way.\"', 'Gabrielle Union', NULL, 77),
('\"If you want to achieve greatness, stop asking for permission.\"', 'Jim Rohn', NULL, 78),
('\"If your dreams don’t scare you, they aren’t big enough.\"', 'Unknown', NULL, 79),
('“Inspiration does exist, but it must find you working.”', 'Muhammad Ali', NULL, 80),
('\"It is during our darkest moments that we must focus to see the light.\"', 'Pablo Picasso', NULL, 81),
('“It is never too late to be what you might have been.”', 'Aristotle', NULL, 82),
('“It’s fine to celebrate success, but it is more important to heed the lessons of failure.”', 'George Eliot', NULL, 83),
('\"It’s not about having time, it’s about making time.\"', 'Bill Gates', NULL, 84),
('\"It’s not the load that breaks you down, it’s the way you carry it.\"', 'Unknown', NULL, 85),
('“Just one small positive thought in the morning can change your whole day.”', 'Lena Horne', NULL, 86),
('“Keep a little fire burning; however small, however hidden.”', 'Dalai Lama', NULL, 87),
('\"Keep going, because you didn’t come this far just to come this far.\"', 'Cormac McCarthy', NULL, 88),
('\"Learn from yesterday. Live for today. Hope for tomorrow.\"', 'Unknown', NULL, 89),
('\"Life is 10% what happens to you and 90% how you react to it.\"', 'Albert Einstein', NULL, 90),
('\"Life is what we make it, always has been, always will be.\"', 'Charles R. Swindoll', NULL, 91),
('\"Life isn’t about finding yourself. Life is about creating yourself.\"', 'Grandma Moses', NULL, 92),
('\"Life isn’t about waiting for the storm to pass, it’s about learning to dance in the rain.\"', 'George Bernard Shaw', NULL, 93),
('\"Love yourself first and everything else falls into line.\"', 'Unknown', NULL, 94),
('\"Luck has nothing to do with it.\"', 'Lucille Ball', NULL, 95),
('\"Mistakes are proof that you are trying.\"', 'Serena Williams ', NULL, 96),
('\"Mistakes are the portals of discovery.\"', 'Unknown', NULL, 97),
('\"More people would learn from their mistakes if they weren’t so busy denying them.\" ', 'James Joyce', NULL, 98),
('\"Motivation gets you started; habit keeps you going.\"', 'Harold J. Smith', NULL, 99),
('“Never give up on a dream just because of the time it will take to accomplish it. The time will pass anyway.”', 'Unknown', NULL, 100),
('\"Never let a stumble in the road be the end of your journey.\"', 'Earl Nightingale', NULL, 101),
('\"No matter what people tell you, words and ideas can change the world.\"', 'Unknown', NULL, 102),
('\"Nobody can go back and start a new beginning, but anyone can start today and make a new ending.\"', 'Robin Williams ', NULL, 103),
('\"Nothing is impossible, the word itself says \'I’m possible!\'\"', 'Maria Robinson', NULL, 104),
('\"Nothing will work unless you do.\"', 'Unknown', NULL, 105),
('\"One day, all your hard work will pay off.\"', 'Maya Angelou', NULL, 106),
('\"Opportunities don\'t happen, you create them.\"', 'Maya Angelou', NULL, 107),
('“Opportunities don’t happen, you create them.”', 'Unknown', NULL, 108),
('\"Optimism is a happiness magnet. If you stay positive, good things and good people will be drawn to you.\"', 'Chris Grosser', NULL, 109),
('“Optimism is the faith that leads to achievement. Nothing can be done without hope and confidence.”', 'Chris Grosser', NULL, 110),
('“Our greatest glory is not in never falling, but in rising every time we fall.”', 'Mary Lou Retton', NULL, 111),
('\"Patience is not about waiting, it’s about how you wait.\"', 'Helen Keller', NULL, 112),
('“Perfection is not attainable. But if we chase perfection we can catch excellence.”', 'Confucius', NULL, 113),
('\"Problems are not stop signs, they are guidelines.\"', 'Unknown', NULL, 114),
('“Procrastination makes easy things hard and hard things harder.”', 'Vince Lombardi', NULL, 115),
('\"Push yourself, because no one else is going to do it for you.\"', 'Robert H. Schuller', NULL, 116),
('\"Remember why you started.\"', 'Mason Cooley', NULL, 117),
('“Resilience is when you address uncertainty with flexibility.”', 'Unknown', NULL, 118),
('“Set your goals high, and don’t stop till you get there.”', 'Bo Jackson', NULL, 119),
('\"Setting goals is the first step in turning the invisible into the visible.”', 'Unknown', NULL, 120),
('\"Small daily improvements over time lead to stunning results.\"', 'Bo Jackson', NULL, 121),
('\"Small progress is still progress.\"', 'Tony Robbins', NULL, 122),
('\"Small steps in the right direction can turn out to be the biggest steps of your life.\"', 'Unknown', NULL, 123),
('\"Spend so much time on the improvement of yourself that you have no time to criticize others.\"', 'Unknown', NULL, 124),
('“Start where you are. Use what you have. Do what you can.”', 'Christian Larson', NULL, 125),
('\"Success is built on the foundation of failures, learning, and resilience.\"', 'Arthur Ashe', NULL, 126),
('“Success is getting what you want; happiness is wanting what you get.”', 'Unknown', NULL, 127),
('“Success is not final; failure is not fatal: It is the courage to continue that counts.”', 'W. P. Kinsella', NULL, 128),
('\"Success is not how high you have climbed, but how you make a positive difference to the world.\"', 'Winston Churchill', NULL, 129),
('\"Success is not in what you have, but who you are.\"', 'Bo Bennett', NULL, 130),
('\"Success is not the key to happiness. Happiness is the key to success.\"', 'Unknown', NULL, 131),
('“Success is stumbling from failure to failure with no loss of enthusiasm.”', 'Winston Churchill', NULL, 132),
('\"Success is the result of preparation, hard work, and learning from failure.\" ', 'Colin Powell', NULL, 133),
('\"Success is the sum of small efforts repeated daily.\"', 'Unknown', NULL, 134),
('\"The bad news is time flies. The good news is you’re the pilot.\"', 'Michael Altshuler', NULL, 135),
('\"The best time to plant a tree was 20 years ago. The second best time is now.\"', 'Unknown', NULL, 136),
('\"The best way to find yourself is to lose yourself in the service of others.\" ', 'Mahatma Gandhi', NULL, 137),
('\"The comeback is always stronger than the setback.\"', 'Unknown', NULL, 138),
('\"The difference between ordinary and extraordinary is that little extra.\"', 'Unknown', NULL, 139),
('\"The distance between dreams and reality is called action.\"', 'Unknown', NULL, 140),
('\"The earlier you start working on something, the earlier you will see results.\"', 'Unknown', NULL, 141),
('“The expert in anything was once a beginner.”', 'Robin Sharma', NULL, 142),
('\"The future belongs to those who believe in the beauty of their dreams.\"', 'Franklin D. Roosevelt ', NULL, 143),
('\"The future starts today, not tomorrow.\"', 'Eleanor Roosevelt', NULL, 144),
('\"The goal is not simply to get more done, but also to have less to do.\"', 'Pope John Paul II', NULL, 145),
('\"The greatest discovery you can make is finding out what you are truly capable of.\"', 'Unknown', NULL, 146),
('\"The harder the battle, the sweeter the victory.\"', 'Unknown', NULL, 147),
('\"The harder you work for something, the greater you’ll feel when you achieve it.\"', 'Unknown', NULL, 148),
('\"The key is in not spending time, but in investing it.\"', 'Unknown', NULL, 149),
('\"The key to success is to focus on goals, not obstacles.\"', 'Stephen R. Covey', NULL, 150),
('\"The key to success is to start before you are ready.\"', 'Unknown', NULL, 151),
('\"The mind is everything. What you think you become.\"', 'Unknown', NULL, 152),
('\"The mind is like a parachute; it only works when open.\"', 'Buddha', NULL, 153),
('\"The mind is not a vessel to be filled, but a fire to be kindled.\" ', 'Frank Zappa', NULL, 154),
('\"The most courageous act is still to think for yourself. Aloud.\"', 'Plutarch', NULL, 155),
('“The most difficult thing is the decision to act; the rest is merely tenacity.”', 'Coco Chanel', NULL, 156),
('\"The only impossible journey is the one you never begin.\"', 'Amelia Earhart', NULL, 157),
('“The only way of discovering the limits of the possible is to venture a little way past them into the impossible.”', 'Tony Robbins', NULL, 158),
('\"The only way to do great work is to love what you do.\"', 'Arthur C. Clarke', NULL, 159),
('\"The purpose of education is to replace an empty mind with an open one.\" ', 'Steve Jobs', NULL, 160),
('\"The road to success is always under construction.\"', 'Malcolm Forbes', NULL, 161),
('\"The roots of education are bitter, but the fruit is sweet.\"', 'Lily Tomlin', NULL, 162),
('\"The secret of getting ahead is getting started.\"', 'Aristotle', NULL, 163),
('“The standard you walk past is the standard you accept.”', 'Mark Twain', NULL, 164),
('\"The true measure of success is how many times you can bounce back from failure.\"', 'David Hurley', NULL, 165),
('\"There are plenty of difficult obstacles in your path. Don\'t allow yourself to become one of them.\"', 'Unknown', NULL, 166),
('\"There is only one thing that makes a dream impossible to achieve: the fear of failure.\"', 'Ralph Marston', NULL, 167),
('\"Time spent learning is never wasted, for it shapes the person you become.\"', 'Paulo Coelho', NULL, 168),
('\"To bring about change, you must not be afraid to take the first step. We will fail when we fail to try.\"', 'Unknown', NULL, 169),
('\"To change your life, you must first change your day.\"', 'Rosa Parks', NULL, 170),
('\"Tough times never last, but tough people do.\"', 'Unknown', NULL, 171),
('\"True success isn’t in never falling, but in always rising stronger.\"', 'Robert H. Shuller', NULL, 172),
('\"Try to be a rainbow in someone\'s cloud.\"', 'Unknown', NULL, 173),
('\"Wake up determined, go to bed satisfied.\"', 'Maya Angelou', NULL, 174),
('\"We all have problems. But it\'s not what happens to us, [it\'s] the choices we make after.\"', 'Dwayne Johnson', NULL, 175),
('\"We generate fears while we sit. We overcome them by action.\"', 'Elizabeth Smart', NULL, 176),
('\"We may encounter many defeats but we must not be defeated.\"', 'Dr. Henry Link', NULL, 177),
('\"Weaknesses are just strengths in the wrong environment.\"', 'Maya Angelou', NULL, 178),
('\"What would life be if we had no courage to attempt anything?\"', 'Marianne Cantwell', NULL, 179),
('\"What you do has far greater impact than what you say.\"', 'Vincent Van Gogh', NULL, 180),
('“What you do makes a difference, and you have to decide what kind of difference you want to make.”', 'Stephen Covey', NULL, 181),
('\"You don’t have to be great to start, but you have to start to be great.\"', 'Zig Ziglar', NULL, 182),
('\"What you do today can improve all your tomorrows.\"', 'Ralph Marston', NULL, 183),
('\"When it rains, look for rainbows. When it’s dark, look for stars.\"', 'Ralph Marston', NULL, 184),
('“When we strive to become better than we are, everything around us becomes better too.”', 'Unknown', NULL, 185),
('\"When you feel like quitting, think about why you started.\"', 'Paulo Coelho', NULL, 186),
('\"When you have a dream, you\'ve got to grab it and never let go.\"', 'Unknown', NULL, 187),
('\"Work hard in silence. Let success make the noise.\"', 'Carol Burnett', NULL, 188),
('“Work until your bank account looks like a phone number.”', 'Unknown', NULL, 189),
('\"You are braver than you believe, stronger than you seem and smarter than you think.\"', 'Unknown', NULL, 190),
('\"You are braver than you believe, stronger than you seem, and smarter than you think.\" ', 'Christopher Robin', NULL, 191),
('\"You are capable of more than you know.\"', 'A.A. Milne', NULL, 192),
('\"You can fall, but you can rise also.\"', 'Unknown', NULL, 193),
('\"You can’t use up creativity. The more you use, the more you have.\"', 'Angelique Kidjo', NULL, 194),
('“You cannot always control what goes on outside. But you can always control what goes on inside.”', 'Maya Angelou', NULL, 195),
('\"You don’t learn to walk by following rules. You learn by doing, and by falling over.\"', 'Wayne Dyer', NULL, 196),
('“You’ll never get bored when you try something new. There’s really no limit to what you can do.” ', 'Richard Branson', NULL, 197),
('“You’ve got to get up every morning with determination if you’re going to go to bed with satisfaction.”', 'Dr. Seuss', NULL, 198),
('\"Your legacy is being written by yourself. Make the right decisions.\"', 'George Lorimer', NULL, 199),
('\"Your self-worth is determined by you. You don\'t have to depend on someone telling you who you are.\"', 'Beyoncé', '2024-12-18 00:00:00', 200);

-- --------------------------------------------------------

--
-- Table structure for table `security_events`
--

CREATE TABLE `security_events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_type` enum('lockout','suspicious_activity') NOT NULL,
  `event_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semester_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_id`, `name`, `start_date`, `end_date`, `user_id`) VALUES
(1, 'UNLV Spring 2025', '2025-01-21', '2025-05-17', 12),
(3, 'UNLV Fall 2024', '2024-08-26', '2024-12-14', 12);

-- --------------------------------------------------------

--
-- Table structure for table `to_do`
--

CREATE TABLE `to_do` (
  `to_do_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `due_date` date DEFAULT NULL,
  `due_time` time DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `to_do`
--

INSERT INTO `to_do` (`to_do_id`, `user_id`, `course_id`, `title`, `due_date`, `due_time`, `description`, `is_completed`, `color`) VALUES
(1, 12, 18, 'Study for SPU exam', '2024-12-11', '19:00:00', 'Study for the Splunk PowerUser exam.', 1, '#4B90D0');

--
-- Triggers `to_do`
--
DELIMITER $$
CREATE TRIGGER `before_insert_todo` BEFORE INSERT ON `to_do` FOR EACH ROW BEGIN
    IF NEW.course_id IS NOT NULL THEN
        SET NEW.color = (SELECT course_color 
                         FROM courses 
                         WHERE course_id = NEW.course_id);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `full_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `user_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`full_name`, `username`, `password`, `email`, `phone_number`, `user_id`) VALUES
('full_name', 'username2', 'password2', 'email', '0', 1),
('John Cena', 'youcantseeme', '$2y$10$zuIMIsLm9s9hq', 'johncena@wwe.com', '8054482546', 10),
('John Doe', 'JohnDoe!!', '$2y$10$UOHAJigdpYKkSusU1JXq5O4IP7SI0MBYnjzFLeMYdny6rmrDvR0tG', 'JohnDoe@gmail.com', '8054482546', 12),
('Nate Boyle', 'N8CBoyle', '$2y$10$TL8H2aARWwmVVR7xAqFc0Oo1jGldLWRcLN8uoEPju3DuAbt8eKKLK', 'n8cboyle@gmail.com', '8054482546', 19),
('James B Boyle', 'jbboyle7901', '$2y$10$OfYmy/zT0mCuEE/gtXQDCOM7OijMyFGzcQ6P3UsVJV46NbKv4FatC', 'jbboyle7901@gmail.com', '8055881483', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_semester` (`semester_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `flashcards`
--
ALTER TABLE `flashcards`
  ADD PRIMARY KEY (`flashcard_id`),
  ADD KEY `set_id` (`set_id`);

--
-- Indexes for table `flashcard_sets`
--
ALTER TABLE `flashcard_sets`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_flashcard_sets_courses` (`course_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goal_set_id` (`goal_set_id`);

--
-- Indexes for table `goal_sets`
--
ALTER TABLE `goal_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_course_id` (`course_id`);

--
-- Indexes for table `logged_time`
--
ALTER TABLE `logged_time`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `login_logout_history`
--
ALTER TABLE `login_logout_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `mcqs`
--
ALTER TABLE `mcqs`
  ADD PRIMARY KEY (`mcq_id`),
  ADD KEY `set_id` (`set_id`);

--
-- Indexes for table `mcq_sets`
--
ALTER TABLE `mcq_sets`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `security_events`
--
ALTER TABLE `security_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `to_do`
--
ALTER TABLE `to_do`
  ADD PRIMARY KEY (`to_do_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flashcards`
--
ALTER TABLE `flashcards`
  MODIFY `flashcard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=640;

--
-- AUTO_INCREMENT for table `flashcard_sets`
--
ALTER TABLE `flashcard_sets`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `goal_sets`
--
ALTER TABLE `goal_sets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `login_logout_history`
--
ALTER TABLE `login_logout_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `mcqs`
--
ALTER TABLE `mcqs`
  MODIFY `mcq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `mcq_sets`
--
ALTER TABLE `mcq_sets`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `security_events`
--
ALTER TABLE `security_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `to_do`
--
ALTER TABLE `to_do`
  MODIFY `to_do_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_semester` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`) ON DELETE SET NULL;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE SET NULL;

--
-- Constraints for table `flashcards`
--
ALTER TABLE `flashcards`
  ADD CONSTRAINT `flashcards_ibfk_1` FOREIGN KEY (`set_id`) REFERENCES `flashcard_sets` (`set_id`) ON DELETE CASCADE;

--
-- Constraints for table `flashcard_sets`
--
ALTER TABLE `flashcard_sets`
  ADD CONSTRAINT `fk_flashcard_sets_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `flashcard_sets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`goal_set_id`) REFERENCES `goal_sets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `goal_sets`
--
ALTER TABLE `goal_sets`
  ADD CONSTRAINT `fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `goal_sets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `logged_time`
--
ALTER TABLE `logged_time`
  ADD CONSTRAINT `logged_time_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `login_history`
--
ALTER TABLE `login_history`
  ADD CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `login_logout_history`
--
ALTER TABLE `login_logout_history`
  ADD CONSTRAINT `login_logout_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `mcqs`
--
ALTER TABLE `mcqs`
  ADD CONSTRAINT `mcqs_ibfk_1` FOREIGN KEY (`set_id`) REFERENCES `mcq_sets` (`set_id`) ON DELETE CASCADE;

--
-- Constraints for table `mcq_sets`
--
ALTER TABLE `mcq_sets`
  ADD CONSTRAINT `mcq_sets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `mcq_sets_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `security_events`
--
ALTER TABLE `security_events`
  ADD CONSTRAINT `security_events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `to_do`
--
ALTER TABLE `to_do`
  ADD CONSTRAINT `to_do_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `to_do_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
