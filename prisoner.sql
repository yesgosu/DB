-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- 호스트: localhost
-- 처리한 시간: 20-11-24 09:26 
-- 서버 버전: 5.1.41
-- PHP 버전: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 데이터베이스: `prisoner`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `new`
--

CREATE TABLE IF NOT EXISTS `new` (
  `name` varchar(6) CHARACTER SET utf8 NOT NULL,
  `id` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `number` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `Phone` varchar(15) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `birthday` (`birthday`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `new`
--

INSERT INTO `new` (`name`, `id`, `password`, `number`, `birthday`, `Phone`) VALUES
('하철진', 'qwer123', 'zx12', 20111011, '1950-10-01', '010-6681-1111'),
('이동진', 'qwe1', 'zxc12', 20111111, '1995-11-10', '010-6683-1111'),
('이철용', 'qwe11', 'zxcv12', 20191112, '1994-10-01', '010-5591-1122');
