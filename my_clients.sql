-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 14 2020 г., 03:19
-- Версия сервера: 5.6.41-log
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `my_clients`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `clt_id` int(11) NOT NULL,
  `clt_name` varchar(250) NOT NULL,
  `clt_sname` varchar(250) NOT NULL,
  `clt_date` date NOT NULL,
  `clt_email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`clt_id`, `clt_name`, `clt_sname`, `clt_date`, `clt_email`) VALUES
(1, 'Гена', 'Олегович', '1991-09-01', 'genka@mail.ru'),
(2, 'Ильдар', 'Петрович', '1992-10-02', 'ildar@yandex.ru'),
(3, 'Вася', 'Иванов', '1995-09-19', 'vasiv@mail.ru'),
(4, 'Петя', 'Федоров', '1996-09-26', 'petfed@yandex.ru'),
(5, 'Вова', 'Кузнецов', '1994-09-21', 'vok@mail.ru'),
(6, 'Саша', 'Сидоров', '1993-07-07', 'vvvs@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `clinics`
--

CREATE TABLE `clinics` (
  `cl_id` int(11) NOT NULL,
  `cl_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `clinics`
--

INSERT INTO `clinics` (`cl_id`, `cl_name`) VALUES
(1, 'Фермо Мобайл'),
(2, 'Дентал Империя'),
(3, 'Diadem-Clinic'),
(4, 'ПРОФИТЛАЗЕР');

-- --------------------------------------------------------

--
-- Структура таблицы `visits`
--

CREATE TABLE `visits` (
  `v_id` int(11) NOT NULL,
  `v_clt_id` int(11) NOT NULL,
  `v_cl_id` int(11) NOT NULL,
  `v_date` date NOT NULL,
  `v_pay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `visits`
--

INSERT INTO `visits` (`v_id`, `v_clt_id`, `v_cl_id`, `v_date`, `v_pay`) VALUES
(1, 1, 1, '2020-09-01', 1000),
(2, 1, 2, '2020-09-02', 1500),
(3, 1, 3, '2020-09-03', 500),
(4, 2, 1, '2020-09-04', 700),
(5, 2, 2, '2020-09-05', 600),
(6, 2, 3, '2020-09-06', 400),
(7, 3, 2, '2020-09-07', 500),
(9, 3, 4, '2020-09-09', 500),
(10, 4, 2, '2020-09-10', 700),
(11, 4, 3, '2020-09-11', 500),
(12, 4, 4, '2020-09-16', 1500),
(13, 5, 2, '2020-09-15', 500),
(14, 5, 3, '2020-09-09', 700),
(15, 5, 4, '2020-09-16', 500),
(16, 6, 1, '2020-09-09', 700),
(17, 6, 2, '2020-09-22', 500),
(18, 6, 3, '2020-09-06', 1500),
(19, 6, 4, '2020-09-02', 500),
(20, 2, 1, '2020-09-16', 550);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`clt_id`);

--
-- Индексы таблицы `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`cl_id`);

--
-- Индексы таблицы `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `clt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `clinics`
--
ALTER TABLE `clinics`
  MODIFY `cl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
