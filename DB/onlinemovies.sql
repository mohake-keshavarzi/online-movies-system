-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 07:23 PM
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
('1234567895', 'saeed', 'mozafari', '2013-02-08'),
('1245765524', 'Eli', 'Wallach', '1915-12-07'),
('1678567461', 'Marlon Brando', 'Marlon Brando', '1924-04-03'),
('1961111278', 'Henry Fonda', 'Henry Fonda', '1905-05-16'),
('2644292531', 'Al', 'Pacino', '1940-04-25'),
('3367334484', 'Robert', 'De Niro', '1943-08-17'),
('3434599578', 'Martin', 'Balsam', '1919-11-04'),
('4657896754', 'Tim', 'Robbins', '1958-10-16'),
('4759874199', 'Heath', 'Ledger', '1979-04-04'),
('4767524222', 'Viggo', 'Mortensen', '1958-10-20'),
('4776824342', 'Clint', 'Eastwood', '1930-05-31'),
('5124451333', 'Elijah', 'Wood', '1981-01-28'),
('6734792551', 'Christian', 'Bale', '1974-01-30'),
('7779324267', 'Morgan', 'Freeman', '1937-06-01');

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
('1234567896', 'Alfred', 'Hichkak', '2000-10-10'),
('1255292647', 'Christopher', 'Nolan', '1970-07-30'),
('1342561941', 'Sergio', 'Leone', '1929-01-03'),
('3451221245', 'Francis', 'Ford Coppola', '1939-04-07'),
('4569321787', 'Peter', 'Jackson', '1961-10-31'),
('5069291544', 'Frank', 'Darabont', '1959-01-28'),
('8435292578', 'Sidney', 'Lumet', '1924-06-25');

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
('12 Angry Men', '1957-06-25', NULL),
('lost in the wood', '2016-12-17', NULL),
('The Dark Knight', '2008-05-19', NULL),
('The Godfather', '1972-11-25', NULL),
('The Godfather: Part II', '1974-05-17', NULL),
('The Good, the Bad and the Ugly', '1966-04-07', NULL),
('The Lord of the Rings: The Return of the', '2003-01-05', NULL),
('The Shawshank Redemption', '1994-12-17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_actors`
--

CREATE TABLE `movie_actors` (
  `movie_name` varchar(40) NOT NULL,
  `actor_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_actors`
--

INSERT INTO `movie_actors` (`movie_name`, `actor_id`) VALUES
('12 Angry Men', '1961111278'),
('12 Angry Men', '3434599578'),
('The Dark Knight', '4759874199'),
('The Dark Knight', '6734792551'),
('The Godfather', '1678567461'),
('The Godfather', '2644292531'),
('The Godfather: Part II', '2644292531'),
('The Godfather: Part II', '3367334484'),
('The Good, the Bad and the Ugly', '1245765524'),
('The Good, the Bad and the Ugly', '4776824342'),
('The Lord of the Rings: The Return of the', '4767524222'),
('The Lord of the Rings: The Return of the', '5124451333'),
('The Shawshank Redemption', '4657896754'),
('The Shawshank Redemption', '7779324267');

-- --------------------------------------------------------

--
-- Table structure for table `movie_directors`
--

CREATE TABLE `movie_directors` (
  `movie_name` varchar(40) NOT NULL,
  `director_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_directors`
--

INSERT INTO `movie_directors` (`movie_name`, `director_id`) VALUES
('12 Angry Men', '8435292578'),
('The Dark Knight', '1255292647'),
('The Godfather', '3451221245'),
('The Godfather: Part II', '3451221245'),
('The Good, the Bad and the Ugly', '1342561941'),
('The Lord of the Rings: The Return of the', '4569321787'),
('The Shawshank Redemption', '5069291544');

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
('12 Angry Men', 'Crime'),
('12 Angry Men', 'Drama'),
('lost in the wood', 'Action'),
('lost in the wood', 'Animation'),
('lost in the wood', 'Horrror'),
('The Dark Knight', 'Action'),
('The Dark Knight', 'Crime'),
('The Dark Knight', 'Drama'),
('The Godfather', 'Crime'),
('The Godfather', 'Drama'),
('The Godfather: Part II', 'Crime'),
('The Godfather: Part II', 'Drama'),
('The Good, the Bad and the Ugly', 'Adventure'),
('The Lord of the Rings: The Return of the', 'Action'),
('The Lord of the Rings: The Return of the', 'Adventure'),
('The Lord of the Rings: The Return of the', 'Drama'),
('The Shawshank Redemption', 'Drama');

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
