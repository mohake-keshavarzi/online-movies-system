-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2023 at 12:17 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinemovies`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `username` varchar(40) NOT NULL,
  `passwords` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `joined_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `membership` bit(1) DEFAULT b'0',
  `membreship_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `passwords`, `email`, `joined_date`, `membership`, `membreship_time`) VALUES
('GHOST', '12375845ss', 'allo@gmail.com', '2022-12-30 12:50:43', b'0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_comment_status`
--

CREATE TABLE `account_comment_status` (
  `account_username` varchar(40) NOT NULL,
  `ban` bit(1) DEFAULT b'0',
  `ban_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `account_movie_grade`
--

CREATE TABLE `account_movie_grade` (
  `account_username` varchar(40) NOT NULL,
  `movie_name` varchar(40) NOT NULL,
  `grade` int(1) NOT NULL CHECK (`grade` between 1 and 5),
  `grade_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_movie_grade`
--

INSERT INTO `account_movie_grade` (`account_username`, `movie_name`, `grade`, `grade_date`) VALUES
('GHOST', 'lost in the wood', 5, '2023-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `account_movie_like`
--

CREATE TABLE `account_movie_like` (
  `account_username` varchar(40) NOT NULL,
  `movie_name` varchar(40) NOT NULL,
  `likes` bit(1) NOT NULL,
  `likes_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `personal_id` char(10) NOT NULL,
  `fist_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age` int(3) GENERATED ALWAYS AS (date_format(from_days(to_days(current_timestamp()) - to_days(`birth_date`)),'%Y')) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`personal_id`, `fist_name`, `last_name`, `birth_date`) VALUES
('1234567895', 'saeed', 'mozafari', '2013-02-08');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text` varchar(200) NOT NULL,
  `account_username` varchar(40) NOT NULL,
  `movie_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `text`, `account_username`, `movie_name`) VALUES
(1, 'very good ', 'GHOST', 'lost in the wood');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `personal_id` char(10) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `age` int(3) GENERATED ALWAYS AS (date_format(from_days(to_days(current_timestamp()) - to_days(`birth_date`)),'%Y')) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`personal_id`, `first_name`, `last_name`, `birth_date`) VALUES
('1234567896', 'Alfred', 'Hichkak', '2000-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre`) VALUES
('Action'),
('Adventure'),
('Animation'),
('Biography'),
('Comedy'),
('Crime'),
('Drama'),
('Family'),
('Fantasy'),
('History'),
('Horrror'),
('Music'),
('Musical'),
('Mystery'),
('Romance'),
('Sci-Fi'),
('Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_name` varchar(40) NOT NULL,
  `release_date` date DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_name`, `release_date`, `url`) VALUES
('lost in the wood', '2016-12-17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_actors`
--

CREATE TABLE `movie_actors` (
  `movie_name` varchar(40) NOT NULL,
  `actor_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `movie_directors`
--

CREATE TABLE `movie_directors` (
  `movie_name` varchar(40) NOT NULL,
  `director_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `movie_genres`
--

CREATE TABLE `movie_genres` (
  `movie_name` varchar(40) NOT NULL,
  `genre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_genres`
--

INSERT INTO `movie_genres` (`movie_name`, `genre`) VALUES
('lost in the wood', 'Action'),
('lost in the wood', 'Animation'),
('lost in the wood', 'Horrror');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `account_comment_status`
--
ALTER TABLE `account_comment_status`
  ADD PRIMARY KEY (`account_username`);

--
-- Indexes for table `account_movie_grade`
--
ALTER TABLE `account_movie_grade`
  ADD PRIMARY KEY (`account_username`,`movie_name`),
  ADD KEY `movie_name` (`movie_name`);

--
-- Indexes for table `account_movie_like`
--
ALTER TABLE `account_movie_like`
  ADD PRIMARY KEY (`account_username`,`movie_name`),
  ADD KEY `movie_name` (`movie_name`);

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`personal_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_username` (`account_username`),
  ADD KEY `movie_name` (`movie_name`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`personal_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_name`);

--
-- Indexes for table `movie_actors`
--
ALTER TABLE `movie_actors`
  ADD PRIMARY KEY (`movie_name`,`actor_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Indexes for table `movie_directors`
--
ALTER TABLE `movie_directors`
  ADD PRIMARY KEY (`movie_name`,`director_id`),
  ADD KEY `director_id` (`director_id`);

--
-- Indexes for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`movie_name`,`genre`),
  ADD KEY `genre` (`genre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_comment_status`
--
ALTER TABLE `account_comment_status`
  ADD CONSTRAINT `account_comment_status_ibfk_1` FOREIGN KEY (`account_username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_movie_grade`
--
ALTER TABLE `account_movie_grade`
  ADD CONSTRAINT `account_movie_grade_ibfk_1` FOREIGN KEY (`account_username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_movie_grade_ibfk_2` FOREIGN KEY (`movie_name`) REFERENCES `movie` (`movie_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_movie_like`
--
ALTER TABLE `account_movie_like`
  ADD CONSTRAINT `account_movie_like_ibfk_1` FOREIGN KEY (`account_username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_movie_like_ibfk_2` FOREIGN KEY (`movie_name`) REFERENCES `movie` (`movie_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`account_username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`movie_name`) REFERENCES `movie` (`movie_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_actors`
--
ALTER TABLE `movie_actors`
  ADD CONSTRAINT `movie_actors_ibfk_1` FOREIGN KEY (`movie_name`) REFERENCES `movie` (`movie_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_actors_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`personal_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_directors`
--
ALTER TABLE `movie_directors`
  ADD CONSTRAINT `movie_directors_ibfk_1` FOREIGN KEY (`movie_name`) REFERENCES `movie` (`movie_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_directors_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `director` (`personal_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movie_name`) REFERENCES `movie` (`movie_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genre`) REFERENCES `genres` (`genre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
