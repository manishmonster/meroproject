-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 02, 2018 at 06:14 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bloodlife`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodgroup`
--

CREATE TABLE IF NOT EXISTS `bloodgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_group` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `bloodgroup`
--

INSERT INTO `bloodgroup` (`id`, `blood_group`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'AB+'),
(4, 'AB-'),
(5, 'B+'),
(6, 'B-'),
(7, 'O+'),
(8, 'O-');

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank`
--

CREATE TABLE IF NOT EXISTS `blood_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'if user',
  `fullname` varchar(200) NOT NULL,
  `bloodgroupid` int(11) NOT NULL,
  `dob` date NOT NULL COMMENT 'date of birth',
  `email` text NOT NULL,
  `gender` varchar(10) NOT NULL,
  `currentadd` text NOT NULL,
  `permanentadd` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `bloodgroupid` (`bloodgroupid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `blood_bank`
--

INSERT INTO `blood_bank` (`id`, `uid`, `fullname`, `bloodgroupid`, `dob`, `email`, `gender`, `currentadd`, `permanentadd`, `phone`) VALUES
(1, 2, 'Manish Twayana', 1, '1995-05-05', 'manishtwayana@gmail.com', 'Male', 'Bhaktapur,Suryabinyak,Nepal', 'Bhaktapur,Suryabinyak,Nepal', '9843228906');

-- --------------------------------------------------------

--
-- Table structure for table `case`
--

CREATE TABLE IF NOT EXISTS `case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientname` varchar(200) NOT NULL,
  `bloodgroupid` int(11) NOT NULL,
  `for` text NOT NULL,
  `tid` int(11) NOT NULL COMMENT 'place of treatment',
  `bednumber` varchar(50) NOT NULL,
  `permantadd` text NOT NULL,
  `currentadd` text NOT NULL,
  `dos` datetime NOT NULL COMMENT 'date of case issued ',
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE IF NOT EXISTS `donor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `dold` date NOT NULL COMMENT 'date of last donation',
  `nod` int(11) NOT NULL COMMENT 'number of donation done',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(50) NOT NULL,
  `location` varchar(150) NOT NULL,
  `decp` varchar(5000) NOT NULL,
  `eventdate` date NOT NULL,
  `eventime` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `eventname`, `location`, `decp`, `eventdate`, `eventime`) VALUES
(1, 'First', 'bkt', 'Hi this is event on ', '2017-12-06', '14'),
(4, 'second', 'ktm', 'asdasdasdaada\r\nasdasdl;alsd', '2017-12-06', '14');

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE IF NOT EXISTS `receiver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `doid` int(11) NOT NULL COMMENT 'donor id',
  `dor` date NOT NULL COMMENT 'date of blood received',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `restricted_cause`
--

CREATE TABLE IF NOT EXISTS `restricted_cause` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(50) NOT NULL,
  `symmary` text NOT NULL,
  `redonoation` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `restricted_donor`
--

CREATE TABLE IF NOT EXISTS `restricted_donor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doid` int(11) NOT NULL,
  `rscid` int(11) NOT NULL,
  `dateofuplift` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `treatment_center`
--

CREATE TABLE IF NOT EXISTS `treatment_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `address` text NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `pwd`, `role`) VALUES
(1, 'monster', 'admin123456', 'admin'),
(2, 'manish', '123456', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `userlocation`
--

CREATE TABLE IF NOT EXISTS `userlocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `zoneid` int(11) NOT NULL,
  `districtid` int(11) NOT NULL,
  `vdcid` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `tole` varchar(100) NOT NULL,
  `house_no` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `date_time_session` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_bank`
--
ALTER TABLE `blood_bank`
  ADD CONSTRAINT `blood_bank_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `blood_bank_ibfk_2` FOREIGN KEY (`bloodgroupid`) REFERENCES `bloodgroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
