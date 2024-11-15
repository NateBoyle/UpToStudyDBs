-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2024 at 07:47 AM
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
  `due_date` date DEFAULT NULL,
  `grade` decimal(5,2) DEFAULT NULL,
  `points` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_name` varchar(100) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
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
  `course_color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `user_id`, `course_name`, `subject`, `professor`, `total_points`, `start_time`, `end_time`, `start_date`, `end_date`, `grade`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `course_color`) VALUES
(2, 12, 'History 407', 'HIST', 'Dr. Jones', 135.00, '09:00:00', '11:00:00', '2025-01-01', '2025-05-15', NULL, 1, 0, 1, 0, 0, 0, 0, '#E52222'),
(8, 12, 'Math 102', 'MAT', 'Feynman', 222.00, '09:00:00', '11:00:00', '2025-01-01', '2025-05-01', NULL, 0, 0, 0, 0, 0, 1, 0, '#E5BA22'),
(10, 20, 'History 101', 'HIST', 'Dr. Jones', 220.00, '09:00:00', '10:00:00', '2025-01-12', '2025-05-15', NULL, 0, 1, 0, 1, 0, 0, 0, '#E5BA22'),
(13, 19, 'History 407', 'HIST', 'Dr. Jones', 350.00, '09:00:00', '10:00:00', '2025-01-12', '2025-05-15', NULL, 0, 1, 0, 1, 0, 0, 0, '#E52222'),
(14, 12, 'Cybersecurity 770', 'CSEC', 'Dr. Moody', 770.00, '17:30:00', '18:45:00', '2025-01-15', '2025-05-15', NULL, 0, 1, 0, 0, 1, 0, 0, '#FF8C00');

-- --------------------------------------------------------

--
-- Table structure for table `flashcards`
--

CREATE TABLE `flashcards` (
  `flashcard_id` int(11) NOT NULL,
  `set_id` int(11) DEFAULT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flashcards`
--

INSERT INTO `flashcards` (`flashcard_id`, `set_id`, `question`, `answer`, `date_created`) VALUES
(1, 6, 'Testing Question', 'Test Answer', '2024-11-07 05:35:25'),
(5, 6, 'What special operations group did Commander Shepard become a part of?', 'The Spectres', '2024-11-07 23:49:07'),
(6, 6, 'Who blew up the first Death Star', 'Luke Skywalker', '2024-11-07 23:55:11'),
(7, 6, 'Who blew up the second Death Star?', 'Lando Calrissian', '2024-11-07 23:56:45'),
(8, 9, 'What is a common database attack?', 'SQL injection', '2024-11-08 04:41:21'),
(18, 7, 'pi', '314', '2024-11-11 08:14:54'),
(433, 29, 'During an IS audit, the auditor observes that some system controls are not functioning as intended. What should the auditor do next?', 'Gather additional evidence to support the finding.', '2024-11-15 04:38:35'),
(434, 29, 'What is the primary purpose of conducting an audit risk assessment?', 'To identify areas of high risk for focused audit efforts.', '2024-11-15 04:38:35'),
(435, 29, 'Which of the following best describes IT governance?', 'The framework for ensuring IT supports business goals.', '2024-11-15 04:38:35'),
(436, 29, 'Which key performance indicator (KPI) would be most relevant to assess the effectiveness of an IT governance framework?', 'Alignment of IT initiatives with business objectives.', '2024-11-15 04:38:35'),
(437, 29, 'During the system development life cycle (SDLC), when should an IS auditor be involved?', 'During system design to review control requirements.', '2024-11-15 04:38:35'),
(438, 29, 'Which of the following is the BEST way to ensure a new application meets security requirements?', 'Including security requirements in the design phase.', '2024-11-15 04:38:35'),
(439, 29, 'What is the most effective way to ensure that backup data can be restored successfully?', 'Conducting periodic restoration testing.', '2024-11-15 04:38:35'),
(440, 29, 'Which of the following is the primary objective of a disaster recovery plan (DRP)?', 'To recover business operations in the event of a disaster.', '2024-11-15 04:38:35'),
(441, 29, 'What is the first step in establishing an information security program?', 'Conducting a risk assessment.', '2024-11-15 04:38:35'),
(442, 29, 'Which of the following would be the BEST way to protect sensitive customer data stored in a database?', 'Encrypting the data at rest and in transit.', '2024-11-15 04:38:35'),
(443, 29, 'What is the primary purpose of control self-assessments (CSAs)?', 'To empower business units to evaluate and manage their own risks.', '2024-11-15 04:38:35'),
(444, 29, 'Which of the following is the MOST effective way to ensure compliance with IT policies?', 'Conducting regular audits and reviews.', '2024-11-15 04:38:35'),
(445, 29, 'What is a key benefit of implementing a centralized log management system?', 'Facilitating efficient monitoring and forensic investigations.', '2024-11-15 04:38:35'),
(446, 29, 'Which of the following should an IS auditor review when evaluating the effectiveness of access controls?', 'Audit logs and user activity reports.', '2024-11-15 04:38:35'),
(447, 29, 'What is the primary focus of a vulnerability assessment?', 'Identifying potential weaknesses in systems and applications.', '2024-11-15 04:38:35'),
(448, 29, 'When performing an audit of a change management process, what should the auditor verify first?', 'That all changes are authorized and documented.', '2024-11-15 04:38:35'),
(449, 29, 'What is the primary purpose of implementing a service-level agreement (SLA)?', 'To define performance expectations between service providers and customers.', '2024-11-15 04:38:35'),
(450, 29, 'What is a key advantage of conducting penetration testing?', 'Identifying vulnerabilities that could be exploited by attackers.', '2024-11-15 04:38:35'),
(451, 29, 'Which of the following is a critical component of incident response planning?', 'Defining roles and responsibilities for incident handling.', '2024-11-15 04:38:35'),
(452, 29, 'What should be the first step in developing a business continuity plan (BCP)?', 'Conducting a business impact analysis (BIA).', '2024-11-15 04:38:35'),
(453, 29, 'What is the main objective of IT governance?', 'Aligning IT goals with business objectives.', '2024-11-15 04:38:35'),
(454, 29, 'Which of the following is the MOST effective method for preventing unauthorized database access?', 'Implementing role-based access control (RBAC).', '2024-11-15 04:38:35'),
(455, 29, 'What is the primary goal of encryption?', 'To protect data confidentiality.', '2024-11-15 04:38:35'),
(456, 29, 'Which of the following is an example of a preventive control?', 'Installing a firewall to block malicious traffic.', '2024-11-15 04:38:35'),
(457, 29, 'What is the purpose of digital signatures?', 'To verify the authenticity and integrity of electronic messages.', '2024-11-15 04:38:35'),
(458, 29, 'Which of the following is the BEST way to protect sensitive information during transmission?', 'Using secure protocols like HTTPS or TLS.', '2024-11-15 04:38:35'),
(459, 29, 'What is the main purpose of a forensic investigation?', 'To collect and analyze evidence related to a security incident.', '2024-11-15 04:38:35'),
(460, 29, 'What is a primary benefit of using multi-factor authentication (MFA)?', 'Enhancing user authentication security by requiring multiple forms of verification.', '2024-11-15 04:38:35'),
(461, 29, 'Which of the following is a key component of a patch management process?', 'Regularly applying software updates to address vulnerabilities.', '2024-11-15 04:38:35'),
(462, 29, 'What is the objective of performing a post-implementation review?', 'To evaluate whether project objectives were met and identify lessons learned.', '2024-11-15 04:38:35'),
(463, 29, 'Which of the following is a key focus of configuration management?', 'Ensuring that system settings comply with organizational policies.', '2024-11-15 04:38:35'),
(464, 29, 'What is a common risk associated with shadow IT?', 'Lack of visibility and control over unauthorized applications.', '2024-11-15 04:38:35'),
(465, 29, 'When should a risk assessment be performed during the project lifecycle?', 'At the start of the project and periodically throughout its duration.', '2024-11-15 04:38:35'),
(466, 29, 'What is the primary purpose of a firewall?', 'To control and monitor incoming and outgoing network traffic.', '2024-11-15 04:38:35'),
(467, 29, 'Which of the following is a key consideration in selecting a cloud service provider?', 'Ensuring compliance with data protection regulations.', '2024-11-15 04:38:35'),
(468, 29, 'What is the role of an intrusion detection system (IDS)?', 'To monitor network traffic for suspicious activity and potential threats.', '2024-11-15 04:38:35'),
(469, 29, 'Which of the following is a characteristic of an effective access control policy?', 'Clearly defining user roles and permissions.', '2024-11-15 04:38:35'),
(470, 29, 'What is the main goal of security awareness training?', 'To educate employees on recognizing and mitigating security threats.', '2024-11-15 04:38:35'),
(471, 29, 'What is the purpose of a risk register?', 'To document identified risks and their mitigation strategies.', '2024-11-15 04:38:35'),
(472, 29, 'Which of the following is a key principle of data minimization?', 'Collecting only the data necessary to fulfill a specific purpose.', '2024-11-15 04:38:35'),
(473, 29, 'What is a potential consequence of weak password policies?', 'Increased risk of unauthorized access to systems.', '2024-11-15 04:38:35'),
(474, 29, 'Which of the following is a key benefit of network segmentation?', 'Limiting the spread of malware within the network.', '2024-11-15 04:38:35'),
(475, 29, 'What is the primary objective of a root cause analysis?', 'To identify the underlying cause of an issue or incident.', '2024-11-15 04:38:35'),
(476, 29, 'When auditing a cloud environment, what should the IS auditor prioritize?', 'Reviewing the provider\'s security controls and certifications.', '2024-11-15 04:38:35'),
(477, 29, 'What is the main purpose of a data retention policy?', 'To define how long data should be stored and when it should be deleted.', '2024-11-15 04:38:35'),
(478, 29, 'What is the primary risk associated with outdated software?', 'Increased vulnerability to security threats.', '2024-11-15 04:38:35'),
(479, 29, 'Which of the following is a key feature of a SIEM (Security Information and Event Management) system?', 'Centralized collection and analysis of security logs.', '2024-11-15 04:38:35'),
(480, 29, 'What is the main purpose of role-based access control (RBAC)?', 'To restrict access based on users\' job responsibilities.', '2024-11-15 04:38:35'),
(481, 29, 'What is the primary objective of a penetration test?', 'To simulate real-world attacks and identify exploitable vulnerabilities.', '2024-11-15 04:38:35'),
(482, 29, 'What is the purpose of a data classification policy?', 'To categorize information based on its sensitivity and required level of protection.', '2024-11-15 04:38:35'),
(483, 29, 'Which of the following is a characteristic of a strong incident response plan?', 'Clearly defined escalation procedures.', '2024-11-15 04:38:35'),
(484, 29, 'What is the purpose of a service catalog in IT governance?', 'To provide a list of IT services available to the organization.', '2024-11-15 04:38:35'),
(485, 29, 'What is the main goal of data integrity controls?', 'To ensure data accuracy and consistency.', '2024-11-15 04:38:35'),
(486, 29, 'Which of the following is a benefit of using virtualization?', 'Enhancing resource utilization and scalability.', '2024-11-15 04:38:35'),
(487, 29, 'What is a key consideration in disaster recovery planning?', 'Ensuring regular testing of the recovery plan.', '2024-11-15 04:38:35'),
(488, 29, 'What is the purpose of log management?', 'To collect and analyze logs for identifying security events.', '2024-11-15 04:38:35'),
(489, 29, 'What is the main function of a proxy server?', 'To act as an intermediary between users and external networks.', '2024-11-15 04:38:35'),
(490, 29, 'What is the primary purpose of a digital certificate?', 'To verify the identity of an entity in online communications.', '2024-11-15 04:38:35'),
(491, 29, 'Which of the following is a best practice for securing mobile devices?', 'Enforcing device encryption and remote wipe capabilities.', '2024-11-15 04:38:35'),
(492, 29, 'What is the goal of implementing least privilege?', 'To minimize access rights to only what is necessary for users\' roles.', '2024-11-15 04:38:35'),
(493, 29, 'Which of the following is an example of a detective control?', 'Monitoring logs for suspicious activity.', '2024-11-15 04:38:35'),
(494, 29, 'What is the purpose of a baseline configuration?', 'To establish a secure starting point for systems.', '2024-11-15 04:38:35'),
(495, 29, 'What is a primary benefit of using threat intelligence?', 'Improving proactive defense against emerging threats.', '2024-11-15 04:38:35'),
(496, 29, 'What is a critical step in managing third-party risks?', 'Conducting due diligence and security assessments.', '2024-11-15 04:38:35'),
(497, 29, 'What is the role of a data owner in information security?', 'Defining access and protection requirements for their data.', '2024-11-15 04:38:35'),
(498, 29, 'What is the objective of a business impact analysis (BIA)?', 'To assess the impact of disruptions on business operations.', '2024-11-15 04:38:35'),
(499, 29, 'What is a potential risk of Bring Your Own Device (BYOD) policies?', 'Increased risk of data leakage.', '2024-11-15 04:38:35'),
(500, 29, 'Which of the following is a key focus of supply chain security?', 'Verifying the integrity of components and software.', '2024-11-15 04:38:35'),
(501, 29, 'What is the purpose of implementing data masking?', 'To protect sensitive information by obfuscating it.', '2024-11-15 04:38:35'),
(502, 30, 'During an IS audit, the auditor observes that some system controls are not functioning as intended. What should the auditor do next?', 'Gather additional evidence to support the finding.', '2024-11-15 04:39:56'),
(503, 30, 'What is the primary purpose of conducting an audit risk assessment?', 'To identify areas of high risk for focused audit efforts.', '2024-11-15 04:39:56'),
(504, 30, 'Which of the following best describes IT governance?', 'The framework for ensuring IT supports business goals.', '2024-11-15 04:39:56'),
(505, 30, 'Which key performance indicator (KPI) would be most relevant to assess the effectiveness of an IT governance framework?', 'Alignment of IT initiatives with business objectives.', '2024-11-15 04:39:56'),
(506, 30, 'During the system development life cycle (SDLC), when should an IS auditor be involved?', 'During system design to review control requirements.', '2024-11-15 04:39:56'),
(507, 30, 'Which of the following is the BEST way to ensure a new application meets security requirements?', 'Including security requirements in the design phase.', '2024-11-15 04:39:56'),
(508, 30, 'What is the most effective way to ensure that backup data can be restored successfully?', 'Conducting periodic restoration testing.', '2024-11-15 04:39:56'),
(509, 30, 'Which of the following is the primary objective of a disaster recovery plan (DRP)?', 'To recover business operations in the event of a disaster.', '2024-11-15 04:39:56'),
(510, 30, 'What is the first step in establishing an information security program?', 'Conducting a risk assessment.', '2024-11-15 04:39:56'),
(511, 30, 'Which of the following would be the BEST way to protect sensitive customer data stored in a database?', 'Encrypting the data at rest and in transit.', '2024-11-15 04:39:56'),
(512, 30, 'What is the primary purpose of control self-assessments (CSAs)?', 'To empower business units to evaluate and manage their own risks.', '2024-11-15 04:39:56'),
(513, 30, 'Which of the following is the MOST effective way to ensure compliance with IT policies?', 'Conducting regular audits and reviews.', '2024-11-15 04:39:56'),
(514, 30, 'What is a key benefit of implementing a centralized log management system?', 'Facilitating efficient monitoring and forensic investigations.', '2024-11-15 04:39:56'),
(515, 30, 'Which of the following should an IS auditor review when evaluating the effectiveness of access controls?', 'Audit logs and user activity reports.', '2024-11-15 04:39:56'),
(516, 30, 'What is the primary focus of a vulnerability assessment?', 'Identifying potential weaknesses in systems and applications.', '2024-11-15 04:39:56'),
(517, 30, 'When performing an audit of a change management process, what should the auditor verify first?', 'That all changes are authorized and documented.', '2024-11-15 04:39:56'),
(518, 30, 'What is the primary purpose of implementing a service-level agreement (SLA)?', 'To define performance expectations between service providers and customers.', '2024-11-15 04:39:56'),
(519, 30, 'What is a key advantage of conducting penetration testing?', 'Identifying vulnerabilities that could be exploited by attackers.', '2024-11-15 04:39:56'),
(520, 30, 'Which of the following is a critical component of incident response planning?', 'Defining roles and responsibilities for incident handling.', '2024-11-15 04:39:56'),
(521, 30, 'What should be the first step in developing a business continuity plan (BCP)?', 'Conducting a business impact analysis (BIA).', '2024-11-15 04:39:56'),
(522, 30, 'What is the main objective of IT governance?', 'Aligning IT goals with business objectives.', '2024-11-15 04:39:56'),
(523, 30, 'Which of the following is the MOST effective method for preventing unauthorized database access?', 'Implementing role-based access control (RBAC).', '2024-11-15 04:39:56'),
(524, 30, 'What is the primary goal of encryption?', 'To protect data confidentiality.', '2024-11-15 04:39:56'),
(525, 30, 'Which of the following is an example of a preventive control?', 'Installing a firewall to block malicious traffic.', '2024-11-15 04:39:56'),
(526, 30, 'What is the purpose of digital signatures?', 'To verify the authenticity and integrity of electronic messages.', '2024-11-15 04:39:56'),
(527, 30, 'Which of the following is the BEST way to protect sensitive information during transmission?', 'Using secure protocols like HTTPS or TLS.', '2024-11-15 04:39:56'),
(528, 30, 'What is the main purpose of a forensic investigation?', 'To collect and analyze evidence related to a security incident.', '2024-11-15 04:39:56'),
(529, 30, 'What is a primary benefit of using multi-factor authentication (MFA)?', 'Enhancing user authentication security by requiring multiple forms of verification.', '2024-11-15 04:39:56'),
(530, 30, 'Which of the following is a key component of a patch management process?', 'Regularly applying software updates to address vulnerabilities.', '2024-11-15 04:39:56'),
(531, 30, 'What is the objective of performing a post-implementation review?', 'To evaluate whether project objectives were met and identify lessons learned.', '2024-11-15 04:39:56'),
(532, 30, 'Which of the following is a key focus of configuration management?', 'Ensuring that system settings comply with organizational policies.', '2024-11-15 04:39:56'),
(533, 30, 'What is a common risk associated with shadow IT?', 'Lack of visibility and control over unauthorized applications.', '2024-11-15 04:39:56'),
(534, 30, 'When should a risk assessment be performed during the project lifecycle?', 'At the start of the project and periodically throughout its duration.', '2024-11-15 04:39:56'),
(535, 30, 'What is the primary purpose of a firewall?', 'To control and monitor incoming and outgoing network traffic.', '2024-11-15 04:39:56'),
(536, 30, 'Which of the following is a key consideration in selecting a cloud service provider?', 'Ensuring compliance with data protection regulations.', '2024-11-15 04:39:56'),
(537, 30, 'What is the role of an intrusion detection system (IDS)?', 'To monitor network traffic for suspicious activity and potential threats.', '2024-11-15 04:39:56'),
(538, 30, 'Which of the following is a characteristic of an effective access control policy?', 'Clearly defining user roles and permissions.', '2024-11-15 04:39:56'),
(539, 30, 'What is the main goal of security awareness training?', 'To educate employees on recognizing and mitigating security threats.', '2024-11-15 04:39:56'),
(540, 30, 'What is the purpose of a risk register?', 'To document identified risks and their mitigation strategies.', '2024-11-15 04:39:56'),
(541, 30, 'Which of the following is a key principle of data minimization?', 'Collecting only the data necessary to fulfill a specific purpose.', '2024-11-15 04:39:56'),
(542, 30, 'What is a potential consequence of weak password policies?', 'Increased risk of unauthorized access to systems.', '2024-11-15 04:39:56'),
(543, 30, 'Which of the following is a key benefit of network segmentation?', 'Limiting the spread of malware within the network.', '2024-11-15 04:39:56'),
(544, 30, 'What is the primary objective of a root cause analysis?', 'To identify the underlying cause of an issue or incident.', '2024-11-15 04:39:56'),
(545, 30, 'When auditing a cloud environment, what should the IS auditor prioritize?', 'Reviewing the provider\'s security controls and certifications.', '2024-11-15 04:39:56'),
(546, 30, 'What is the main purpose of a data retention policy?', 'To define how long data should be stored and when it should be deleted.', '2024-11-15 04:39:56'),
(547, 30, 'What is the primary risk associated with outdated software?', 'Increased vulnerability to security threats.', '2024-11-15 04:39:56'),
(548, 30, 'Which of the following is a key feature of a SIEM (Security Information and Event Management) system?', 'Centralized collection and analysis of security logs.', '2024-11-15 04:39:56'),
(549, 30, 'What is the main purpose of role-based access control (RBAC)?', 'To restrict access based on users\' job responsibilities.', '2024-11-15 04:39:56'),
(550, 30, 'What is the primary objective of a penetration test?', 'To simulate real-world attacks and identify exploitable vulnerabilities.', '2024-11-15 04:39:56'),
(551, 30, 'What is the purpose of a data classification policy?', 'To categorize information based on its sensitivity and required level of protection.', '2024-11-15 04:39:56'),
(552, 30, 'Which of the following is a characteristic of a strong incident response plan?', 'Clearly defined escalation procedures.', '2024-11-15 04:39:56'),
(553, 30, 'What is the purpose of a service catalog in IT governance?', 'To provide a list of IT services available to the organization.', '2024-11-15 04:39:56'),
(554, 30, 'What is the main goal of data integrity controls?', 'To ensure data accuracy and consistency.', '2024-11-15 04:39:56'),
(555, 30, 'Which of the following is a benefit of using virtualization?', 'Enhancing resource utilization and scalability.', '2024-11-15 04:39:56'),
(556, 30, 'What is a key consideration in disaster recovery planning?', 'Ensuring regular testing of the recovery plan.', '2024-11-15 04:39:56'),
(557, 30, 'What is the purpose of log management?', 'To collect and analyze logs for identifying security events.', '2024-11-15 04:39:56'),
(558, 30, 'What is the main function of a proxy server?', 'To act as an intermediary between users and external networks.', '2024-11-15 04:39:56'),
(559, 30, 'What is the primary purpose of a digital certificate?', 'To verify the identity of an entity in online communications.', '2024-11-15 04:39:56'),
(560, 30, 'Which of the following is a best practice for securing mobile devices?', 'Enforcing device encryption and remote wipe capabilities.', '2024-11-15 04:39:56'),
(561, 30, 'What is the goal of implementing least privilege?', 'To minimize access rights to only what is necessary for users\' roles.', '2024-11-15 04:39:56'),
(562, 30, 'Which of the following is an example of a detective control?', 'Monitoring logs for suspicious activity.', '2024-11-15 04:39:56'),
(563, 30, 'What is the purpose of a baseline configuration?', 'To establish a secure starting point for systems.', '2024-11-15 04:39:56'),
(564, 30, 'What is a primary benefit of using threat intelligence?', 'Improving proactive defense against emerging threats.', '2024-11-15 04:39:56'),
(565, 30, 'What is a critical step in managing third-party risks?', 'Conducting due diligence and security assessments.', '2024-11-15 04:39:56'),
(566, 30, 'What is the role of a data owner in information security?', 'Defining access and protection requirements for their data.', '2024-11-15 04:39:56'),
(567, 30, 'What is the objective of a business impact analysis (BIA)?', 'To assess the impact of disruptions on business operations.', '2024-11-15 04:39:56'),
(568, 30, 'What is a potential risk of Bring Your Own Device (BYOD) policies?', 'Increased risk of data leakage.', '2024-11-15 04:39:56'),
(569, 30, 'Which of the following is a key focus of supply chain security?', 'Verifying the integrity of components and software.', '2024-11-15 04:39:56'),
(570, 30, 'What is the purpose of implementing data masking?', 'To protect sensitive information by obfuscating it.', '2024-11-15 04:39:56');

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
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flashcard_sets`
--

INSERT INTO `flashcard_sets` (`set_id`, `user_id`, `set_name`, `num_cards`, `date_created`, `course_id`) VALUES
(6, 12, 'History ', 4, '2024-11-07 00:19:48', 2),
(7, 12, 'Math cards', 1, '2024-11-07 06:49:44', 8),
(9, 12, 'Cyber Security ', 1, '2024-11-08 04:40:55', 14),
(29, 12, 'CISA', 69, '2024-11-15 04:38:34', 14),
(30, 12, 'CISA 2', 69, '2024-11-15 04:39:46', 14);

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
(69, 12, 'login', '2024-11-15 04:56:07', '::1', 'lohkqlj790osjv544ve2l0qnrq');

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
  `task_name` varchar(255) NOT NULL,
  `due_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `flashcards`
--
ALTER TABLE `flashcards`
  MODIFY `flashcard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=571;

--
-- AUTO_INCREMENT for table `flashcard_sets`
--
ALTER TABLE `flashcard_sets`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
  MODIFY `to_do_id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

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
-- Constraints for table `login_history`
--
ALTER TABLE `login_history`
  ADD CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

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
