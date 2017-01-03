-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-12-29 09:53:55
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- 表的结构 `choose`
--

CREATE TABLE IF NOT EXISTS `choose` (
  `userid` int(30) NOT NULL,
  `eleid` int(30) NOT NULL,
  PRIMARY KEY (`userid`,`eleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `contain`
--

CREATE TABLE IF NOT EXISTS `contain` (
  `foodid` int(30) NOT NULL,
  `eleid` int(30) NOT NULL,
  PRIMARY KEY (`foodid`,`eleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `element`
--

CREATE TABLE IF NOT EXISTS `element` (
  `elename` varchar(10) NOT NULL,
  `eleid` int(30) NOT NULL,
  PRIMARY KEY (`eleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `food`
--

CREATE TABLE IF NOT EXISTS `food` (
  `foodname` varchar(10) CHARACTER SET utf8 NOT NULL,
  `calory` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `food`
--

INSERT INTO `food` (`foodname`, `calory`) VALUES
('牛肉', 1.25),
('猪肉', 1.43);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `signup_taboo` varchar(20) NOT NULL,
  FULLTEXT KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`username`, `password`, `signup_taboo`) VALUES
('wqw', '1', 'w'),
('1', '1', '鸡蛋'),
('2', '2', '鸡蛋,海鲜');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
