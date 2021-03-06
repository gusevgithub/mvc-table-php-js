-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 27 2020 г., 21:48
-- Версия сервера: 5.7.16
-- Версия PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `table_data`
--

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name_product` varchar(255) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `distance` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `date`, `name_product`, `quantity`, `distance`) VALUES
(1, '2020-06-27 18:26:00', 'Арбуз', 1000, 650),
(2, '2020-06-27 18:26:55', 'Дыня', 1500, 900),
(3, '2020-06-27 18:26:55', 'Апельсин', 10000, 1200),
(4, '2020-06-27 18:27:44', 'Мандарин', 20000, 1500),
(5, '2020-06-27 18:27:44', 'Капуста', 750, 550),
(6, '2020-06-27 18:28:48', 'Картофель', 1200, 300),
(7, '2020-06-27 18:28:48', 'Помидор', 2500, 350),
(8, '2020-06-27 18:29:42', 'Лук', 3600, 330),
(9, '2020-06-27 18:29:42', 'Морковь', 5734, 458),
(10, '2020-06-27 18:26:00', 'Арбуз', 1000, 650),
(11, '2020-06-27 18:26:55', 'Дыня', 1500, 900),
(12, '2020-06-27 18:26:55', 'Апельсин', 10000, 1200),
(13, '2020-06-27 18:27:44', 'Мандарин', 20000, 1500),
(14, '2020-06-27 18:27:44', 'Капуста', 750, 550),
(15, '2020-06-27 18:28:48', 'Картофель', 1200, 300),
(16, '2020-06-27 18:28:48', 'Помидор', 2500, 350),
(17, '2020-06-27 18:29:42', 'Лук', 3600, 330),
(18, '2020-06-27 18:29:42', 'Морковь', 5734, 458),
(19, '2020-06-27 18:26:00', 'Арбуз', 1000, 650),
(20, '2020-06-27 18:26:55', 'Дыня', 1500, 900),
(21, '2020-06-27 18:26:55', 'Апельсин', 10000, 1200),
(22, '2020-06-27 18:27:44', 'Мандарин', 20000, 1500),
(23, '2020-06-27 18:27:44', 'Капуста', 750, 550),
(24, '2020-06-27 18:28:48', 'Картофель', 1200, 300),
(25, '2020-06-27 18:28:48', 'Помидор', 2500, 350),
(26, '2020-06-27 18:29:42', 'Лук', 3600, 330),
(27, '2020-06-27 18:29:42', 'Морковь', 5734, 458),
(28, '2020-06-27 18:26:00', 'Арбуз', 1000, 650),
(29, '2020-06-27 18:26:55', 'Дыня', 1500, 900),
(30, '2020-06-27 18:26:55', 'Апельсин', 10000, 1200),
(31, '2020-06-27 18:27:44', 'Мандарин', 20000, 1500),
(32, '2020-06-27 18:27:44', 'Капуста', 750, 550),
(33, '2020-06-27 18:28:48', 'Картофель', 1200, 300),
(34, '2020-06-27 18:28:48', 'Помидор', 2500, 350),
(35, '2020-06-27 18:29:42', 'Лук', 3600, 330),
(36, '2020-06-27 18:29:42', 'Морковь', 5734, 458),
(37, '2020-06-27 18:26:00', 'Арбуз', 1000, 650),
(38, '2020-06-27 18:26:55', 'Дыня', 1500, 900),
(39, '2020-06-27 18:26:55', 'Апельсин', 10000, 1200),
(40, '2020-06-27 18:27:44', 'Мандарин', 20000, 1500),
(41, '2020-06-27 18:27:44', 'Капуста', 750, 550),
(42, '2020-06-27 18:28:48', 'Картофель', 1200, 300),
(43, '2020-06-27 18:28:48', 'Помидор', 2500, 350),
(44, '2020-06-27 18:29:42', 'Лук', 3600, 330),
(45, '2020-06-27 18:29:42', 'Морковь', 5734, 458),
(46, '2020-06-27 18:26:00', 'Арбуз', 1000, 650),
(47, '2020-06-27 18:26:55', 'Дыня', 1500, 900),
(48, '2020-06-27 18:26:55', 'Апельсин', 10000, 1200),
(49, '2020-06-27 18:27:44', 'Мандарин', 20000, 1500),
(50, '2020-06-27 18:27:44', 'Капуста', 750, 550),
(51, '2020-06-27 18:28:48', 'Картофель', 1200, 300),
(52, '2020-06-27 18:28:48', 'Помидор', 2500, 350),
(53, '2020-06-27 18:29:42', 'Лук', 3600, 330),
(54, '2020-06-27 18:29:42', 'Морковь', 5734, 458),
(55, '2020-06-27 18:27:44', 'Капуста', 750, 550),
(56, '2020-06-27 18:28:48', 'Картофель', 1200, 300),
(57, '2020-06-27 18:28:48', 'Помидор', 2500, 350),
(58, '2020-06-27 18:29:42', 'Лук', 3600, 330),
(59, '2020-06-27 18:29:42', 'Морковь', 5734, 458),
(60, '2020-06-27 18:26:00', 'Арбуз', 1000, 650),
(61, '2020-06-27 18:26:55', 'Дыня', 1500, 900),
(62, '2020-06-27 18:26:55', 'Апельсин', 10000, 1200),
(63, '2020-06-27 18:27:44', 'Мандарин', 20000, 1500),
(64, '2020-06-27 18:27:44', 'Капуста', 750, 550),
(65, '2020-06-27 18:28:48', 'Картофель', 1200, 300),
(66, '2020-06-27 18:28:48', 'Помидор', 2500, 350),
(67, '2020-06-27 18:29:42', 'Лук', 3600, 330),
(68, '2020-06-27 18:29:42', 'Морковь', 5734, 458),
(69, '2020-06-27 18:26:00', 'Арбуз', 1000, 650),
(70, '2020-06-27 18:26:55', 'Дыня', 1500, 900),
(71, '2020-06-27 18:26:55', 'Апельсин', 10000, 1200),
(72, '2020-06-27 18:27:44', 'Мандарин', 20000, 1500),
(73, '2020-06-27 18:27:44', 'Капуста', 750, 550);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
