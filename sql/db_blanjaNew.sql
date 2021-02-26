-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2021 at 08:07 AM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_blanjaNew`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_customer`
--

CREATE TABLE `address_customer` (
  `id_address` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address_customer`
--

INSERT INTO `address_customer` (`id_address`, `fullname`, `address`, `city`, `region`, `zip_code`, `country`, `id_user`) VALUES
(13, 'Angga', 'Jln. A. Yani Komplek. Yaktapena 1 No 1220 RT 23', 'Palembang', 'Sumatera Selatan', '30264', 'Indonesia', 45);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_photo` varchar(255) NOT NULL,
  `color_hexa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_categories`, `category_name`, `category_photo`, `color_hexa`) VALUES
(4, 'Short', 'https://res.cloudinary.com/devloops7/image/upload/v1605447841/newBlanja/ShortCategory_czom62.png', '#1C3391'),
(5, 'Jacket', 'https://res.cloudinary.com/devloops7/image/upload/v1605447840/newBlanja/JacketCategory_jvjeee.png', '#F67B02'),
(9, 'T-Shirt', 'https://res.cloudinary.com/devloops7/image/upload/v1605447841/newBlanja/TshirtCategory_odymmz.png', '#CC0B04'),
(15, 'shoes', '\r\nhttps://res.cloudinary.com/devloops7/image/upload/v1605447841/newBlanja/ShoesCategory_kd4uah.png', '#57CD9E'),
(16, 'pants', 'https://res.cloudinary.com/devloops7/image/upload/v1605447840/newBlanja/PantsCategory_qz4r9h.png', '#E31F51');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `color_name` varchar(30) NOT NULL,
  `color_hexa` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `color_name`, `color_hexa`) VALUES
(1, 'Blue', '#0000FF'),
(2, 'Red', '#FF0000'),
(3, 'Black', '#000000'),
(4, 'green', '#008000'),
(5, 'white', '#FFFFFF');

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE `conditions` (
  `id` int(11) NOT NULL,
  `conditions` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `conditions`
--

INSERT INTO `conditions` (`id`, `conditions`) VALUES
(1, 'New'),
(2, 'Second');

-- --------------------------------------------------------

--
-- Table structure for table `customer_detail`
--

CREATE TABLE `customer_detail` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(20) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level`) VALUES
(1, 'customer'),
(2, 'seller');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `transaction_code` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `id_address` int(11) NOT NULL,
  `status_order` set('On Process','Delivery','Delivered') NOT NULL DEFAULT 'On Process',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `transaction_code`, `total`, `user_id`, `seller_id`, `id_address`, `status_order`, `created_at`, `updated_at`) VALUES
(81, 85587, 500000, 45, 46, 13, 'On Process', '2021-02-24 14:38:58', '2021-02-24 14:38:58'),
(82, 96829, 200000, 45, 46, 13, 'On Process', '2021-02-26 07:57:42', '2021-02-26 07:57:42');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `sub_total_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `product_qty`, `sub_total_item`) VALUES
(22, 1, 2, 6000),
(22, 2, 3, 15000),
(23, 7, 5, 35000),
(23, 2, 3, 15000),
(23, 10, 3, 30000),
(24, 9, 5, 35000),
(24, 2, 3, 15000),
(25, 44, 1, 550000),
(26, 36, 5, 400000),
(27, 33, 2, 360000),
(28, 30, 1, 150000),
(29, 30, 1, 150000),
(30, 30, 1, 150000),
(31, 30, 1, 150000),
(32, 32, 5, 100000),
(33, 36, 3, 240000),
(34, 36, 3, 240000),
(34, 33, 2, 360000),
(35, 30, 3, 450000),
(36, 36, 1, 80000),
(37, 36, 1, 80000),
(38, 32, 1, 20000),
(39, 36, 2, 160000),
(40, 37, 1, 80000),
(41, 35, 1, 80000),
(42, 31, 2, 240000),
(43, 33, 1, 180000),
(44, 33, 1, 180000),
(45, 42, 4, 400000),
(46, 33, 3, 540000),
(47, 30, 3, 450000),
(48, 35, 2, 160000),
(49, 30, 2, 300000),
(49, 35, 2, 160000),
(50, 43, 2, 400000),
(50, 33, 2, 360000),
(51, 32, 5, 100000),
(51, 35, 3, 240000),
(52, 30, 2, 300000),
(52, 33, 3, 540000),
(53, 44, 3, 1350000),
(54, 33, 5, 900000),
(54, 30, 3, 450000),
(55, 31, 1, 120000),
(56, 36, 3, 240000),
(57, 31, 2, 6000),
(57, 32, 3, 15000),
(58, 31, 2, 6000),
(58, 32, 3, 15000),
(59, 31, 2, 240000),
(59, 37, 3, 240000),
(60, 37, 1, 80000),
(61, 31, 5, 600000),
(61, 37, 3, 240000),
(61, 38, 4, 320000),
(62, 31, 3, 360000),
(63, 1, 2, 6000),
(63, 2, 3, 15000),
(64, 1, 2, 6000),
(64, 2, 3, 15000),
(65, 31, 2, 6000),
(65, 32, 3, 15000),
(66, 31, 2, 6000),
(66, 32, 3, 15000),
(67, 68, 2, 200000),
(67, 31, 1, 120000),
(68, 31, 2, 240000),
(69, 31, 1, 120000),
(70, 70, 1, 1000000),
(71, 91, 3, 4500000),
(72, 92, 3, 450000),
(73, 92, 3, 450000),
(74, 90, 3, 150000),
(75, 94, 2, 700000),
(75, 93, 2, 700000),
(76, 92, 2, 300000),
(77, 91, 3, 4500000),
(78, 96, 3, 955500),
(79, 93, 2, 700000),
(80, 101, 2, 200),
(81, 102, 1, 500000),
(82, 107, 1, 200000);

-- --------------------------------------------------------

--
-- Table structure for table `otp_reset`
--

CREATE TABLE `otp_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_photo` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_product_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `category_id`, `condition_id`, `product_price`, `product_qty`, `product_desc`, `product_photo`, `user_id`, `status_product_id`, `created_at`, `updated_at`) VALUES
(102, 'Sepatu Adidas Sport', 15, 1, 500000, 10, 'Sepatu Sport Adidas yang nyaman digunakan dan tahan lama.', '[\"/image/1614151328136-image.jpeg\",\"/image/1614151328141-image.jpeg\",\"/image/1614151328143-image.jpeg\"]', 46, 3, '2021-02-24 14:22:08', '2021-02-24 14:22:08'),
(103, 'Kaos Polos', 9, 1, 80000, 10, 'Kaos polos yang berbahan katun dan mudah menyerap air.', '[\"/image/1614151409079-image.jpg\",\"/image/1614151409096-image.jpeg\",\"/image/1614151409100-image.png\"]', 46, 3, '2021-02-24 14:23:29', '2021-02-24 14:23:29'),
(104, 'Jaket Hodie', 5, 1, 150000, 5, 'Jaket hoodie tebal yang berbahan katun.', '[\"/image/1614151514400-image.png\",\"/image/1614151514403-image.png\",\"/image/1614151514404-image.png\"]', 46, 3, '2021-02-24 14:25:14', '2021-02-24 14:25:14'),
(105, 'Kaos Tracher', 9, 1, 100000, 5, 'Kaos trasher yang nyaman digunakan ', '[\"/image/1614151627003-image.png\",\"/image/1614151627004-image.png\",\"/image/1614151627022-image.jpg\"]', 46, 3, '2021-02-24 14:27:07', '2021-02-24 14:27:07'),
(106, 'Celana Panjang', 16, 1, 160000, 10, 'Celana Panjang yang memiliki bahan berkualitas.', '[\"/image/1614151745001-image.jpeg\",\"/image/1614151745002-image.png\",\"/image/1614151745004-image.png\"]', 46, 3, '2021-02-24 14:29:05', '2021-02-24 14:29:05'),
(107, 'Celana Dasar Import', 16, 1, 200000, 10, 'Celana dasar Import yang cocok untuk digunakan saat bekerja.', '[\"/image/1614151834502-image.jpg\",\"/image/1614151834503-image.png\",\"/image/1614151834513-image.png\"]', 46, 3, '2021-02-24 14:30:34', '2021-02-24 14:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `product_id`, `color_id`) VALUES
(1, 31, 1),
(2, 31, 2),
(4, 37, 1),
(5, 38, 1),
(6, 39, 1),
(7, 39, 2),
(8, 44, 1),
(9, 44, 2),
(10, 46, 1),
(11, 46, 2),
(12, 50, 1),
(13, 50, 2),
(14, 68, 1),
(15, 68, 2),
(16, 70, 1),
(17, 70, 2),
(18, 71, 1),
(19, 71, 2),
(20, 72, 1),
(21, 72, 2),
(22, 73, 1),
(23, 73, 2),
(52, 85, 3),
(53, 85, 1),
(54, 86, 3),
(55, 86, 1),
(62, 90, 1),
(63, 90, 2),
(64, 91, 1),
(65, 91, 3),
(66, 92, 1),
(67, 92, 5),
(68, 93, 1),
(69, 93, 3),
(70, 93, 4),
(71, 94, 1),
(72, 94, 4),
(73, 95, 1),
(74, 95, 2),
(75, 95, 3),
(76, 96, 1),
(77, 96, 2),
(78, 96, 5),
(94, 97, 1),
(95, 97, 2),
(99, 102, 1),
(100, 102, 2),
(101, 102, 3),
(102, 103, 1),
(103, 103, 3),
(104, 104, 1),
(105, 104, 2),
(106, 104, 3),
(107, 105, 3),
(108, 105, 5),
(109, 106, 3),
(110, 107, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `size_id`) VALUES
(1, 31, 3),
(2, 31, 4),
(4, 37, 4),
(5, 39, 1),
(6, 39, 2),
(7, 38, 2),
(8, 44, 1),
(9, 44, 2),
(10, 46, 1),
(11, 46, 2),
(12, 50, 1),
(13, 50, 2),
(14, 68, 2),
(15, 68, 3),
(16, 68, 4),
(17, 68, 5),
(18, 70, 6),
(19, 70, 7),
(20, 71, 1),
(21, 71, 4),
(22, 71, 5),
(23, 72, 5),
(24, 72, 6),
(25, 73, 1),
(26, 73, 2),
(55, 85, 10),
(56, 85, 11),
(57, 86, 10),
(58, 86, 11),
(65, 90, 1),
(66, 90, 12),
(67, 91, 3),
(68, 91, 4),
(69, 92, 2),
(70, 92, 3),
(71, 93, 11),
(72, 93, 12),
(73, 94, 11),
(74, 94, 12),
(75, 95, 10),
(76, 95, 11),
(77, 95, 12),
(78, 96, 1),
(79, 96, 2),
(80, 96, 3),
(93, 97, 1),
(94, 97, 2),
(98, 102, 18),
(99, 102, 19),
(100, 102, 20),
(101, 102, 21),
(102, 102, 22),
(103, 102, 23),
(104, 103, 3),
(105, 103, 4),
(106, 103, 5),
(107, 104, 3),
(108, 104, 4),
(109, 104, 5),
(110, 105, 2),
(111, 105, 3),
(112, 105, 4),
(113, 105, 5),
(114, 106, 2),
(115, 106, 3),
(116, 106, 4),
(117, 107, 2),
(118, 107, 3),
(119, 107, 4),
(120, 107, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `review`) VALUES
(1, 30, 8, 'Barangnya bagus,, sesuai pesanan'),
(2, 30, 4, 'Barangnya keren, sesuai pesanan'),
(3, 34, 9, 'Barangnya keren, sesuai pesanan'),
(4, 32, 9, 'Barangnya keren, sesuai pesanan'),
(5, 31, 9, 'Barangnya keren, sesuai pesanan'),
(6, 35, 9, 'Barangnya keren, sesuai pesanan'),
(7, 72, 9, 'Barangnya keren, sesuai pesanan'),
(8, 71, 9, 'Barangnya keren, sesuai pesanan');

-- --------------------------------------------------------

--
-- Table structure for table `seller_detail`
--

CREATE TABLE `seller_detail` (
  `id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(20) NOT NULL,
  `store_desc` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `size` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `size`) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'XXL'),
(7, 'XXXL'),
(8, '28'),
(9, '29'),
(10, '30'),
(11, '31'),
(12, '32'),
(13, '33'),
(14, '34'),
(15, '35'),
(16, '36'),
(17, '37'),
(18, '38'),
(19, '39'),
(20, '40'),
(21, '41'),
(22, '42'),
(23, '43'),
(24, '44');

-- --------------------------------------------------------

--
-- Table structure for table `status_history`
--

CREATE TABLE `status_history` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_history`
--

INSERT INTO `status_history` (`id`, `name`) VALUES
(1, 'On Process'),
(2, 'Delivery'),
(3, 'Finish');

-- --------------------------------------------------------

--
-- Table structure for table `status_product`
--

CREATE TABLE `status_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_product`
--

INSERT INTO `status_product` (`id`, `name`) VALUES
(1, 'sold out'),
(2, 'archived'),
(3, 'ready');

-- --------------------------------------------------------

--
-- Table structure for table `token_whitelist`
--

CREATE TABLE `token_whitelist` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token_whitelist`
--

INSERT INTO `token_whitelist` (`id`, `token`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjksImVtYWlsIjoidGhpbmtwYWRAZ21haWwuY29tIiwiaWF0IjoxNjExNjAxOTQ3fQ.QkIwr7zWNA4ppjDPuSHBBsWNTv5Fq1M1u1jDpPheE_k'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjcsImVtYWlsIjoicGVuanVhbEBnbWFpbC5jb20iLCJpYXQiOjE2MTE2MDM4NjZ9.XyDvxcj41llps3x83HEl9SleRQZER2XaufgmVwVB4FM'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjksImVtYWlsIjoidGhpbmtwYWRAZ21haWwuY29tIiwiaWF0IjoxNjExNjA1OTY4fQ.uV_6rS8N1sFTYfg8_mGpTl01v0D4eX9M6BqZSXkt4LY'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjgsImVtYWlsIjoidXNlcmJhcnVAZ21haWwuY29tIiwiaWF0IjoxNjExNjA5ODM3fQ.3q6kl9pNfMPgRA_SAdB3wTT_kTsasHPYybfl_5yXUCw'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjQsImVtYWlsIjoiZGhpeW9kZXY3QGdtYWlsLmNvbSIsImlhdCI6MTYxMTYwOTg3Mn0.7QUKcPJEDWxAJs7L3AnB_EdPuhrxQpE0P-PuCp_-gLE'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjgsImVtYWlsIjoidXNlcmJhcnVAZ21haWwuY29tIiwiaWF0IjoxNjExNzEzNDIzfQ.QfXA7rdT-sLW3KKwNTkKW6pBwmIPu9rv5ujE1k1ectk'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjgsImVtYWlsIjoidXNlcmJhcnVAZ21haWwuY29tIiwiaWF0IjoxNjExNzE5NzA3fQ.iUw9SHyaFNeQiZ9rVdQ-nPPkOzzHgQsnO4eG6hin_6k'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjYsImVtYWlsIjoic2VsbGVyQGdtYWlsLmNvbSIsImlhdCI6MTYxMTc3MjQ3M30.-7yor0w2ZE7gRlXsbtU_4iTLTLhqHp0V12NHS_psNwQ'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjgsImVtYWlsIjoidXNlcmJhcnVAZ21haWwuY29tIiwiaWF0IjoxNjExNzg3MTgzfQ.1tkWYzAevCs2IwIj09uuInznpqToLTGPg9G3nc84XQg'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjgsImVtYWlsIjoidXNlcmJhcnVAZ21haWwuY29tIiwiaWF0IjoxNjExNzk5MjA5fQ.EYUJKvs-KMeK2EkJzzq2y6wgCZPNqirBNDYJdkZvkW0'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjgsImVtYWlsIjoidXNlcmJhcnVAZ21haWwuY29tIiwiaWF0IjoxNjExNzk5NTg2fQ.FoIW8qp_Ye9Id4Uj4BETJzocfaUK47mioVwt-jgpnOA'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjcsImVtYWlsIjoicGVuanVhbEBnbWFpbC5jb20iLCJpYXQiOjE2MTE4MDA1NDh9.V1JnlT3ZR9BYVUeJFUCd8jsSiAyS74XtcyI9lYYQAFE'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjExLCJlbWFpbCI6ImFya2FkZW15QGdtYWlsLmNvbSIsImlhdCI6MTYxMTgxMzY0NX0.TBXW1hA23afqxO9EXGZHYAbEyuaq5ejwiKSKleZaFrY'),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjcsImVtYWlsIjoicGVuanVhbEBnbWFpbC5jb20iLCJpYXQiOjE2MTE4MTczMjJ9.MCLmeduww2iPHx8OGdGExA1nBzZ0FmLPvebvH-BzA8U'),
(45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjQsImVtYWlsIjoiZGhpeW9kZXY3QGdtYWlsLmNvbSIsImlhdCI6MTYxMTg5OTY2NH0.RaER1uxrr8GAl7ECJUkVMzPIfuw_no47QpylFWrb5s4'),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjcsImVtYWlsIjoicGVuanVhbEBnbWFpbC5jb20iLCJpYXQiOjE2MTE5MzEwMjZ9.8bJsT09KRvDTv2jb7IUFpA0NFw85-ch9aWNEYoGh2Z8'),
(47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjEzLCJlbWFpbCI6ImFrYmFyLnp1bDczQGdtYWlsLmNvbSIsImlhdCI6MTYxMjY3MTAyMX0.t2EGpUSzsij-WyG9TG083ZqVkocF-6V1v0y-RapDxsQ'),
(48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjEzLCJlbWFpbCI6ImFrYmFyLnp1bDczQGdtYWlsLmNvbSIsImlhdCI6MTYxMjY3OTgxOH0.IwFSD3A3lv_HB9g2DMp8XHBPPHTh11w6a-Y1Ok_tvFs'),
(49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjEzLCJlbWFpbCI6ImFrYmFyLnp1bDczQGdtYWlsLmNvbSIsImlhdCI6MTYxMjY3OTkyOX0.QHSAzsZqqgIsDNxcO2gI6N9epghntESFO234zcemGus'),
(50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjEzLCJlbWFpbCI6ImFrYmFyLnp1bDczQGdtYWlsLmNvbSIsImlhdCI6MTYxMjc2MzE1OX0.OH5a9ekGcthZJZLpgo8Q5YU94qSohFeTLHbXxvyJ4Sg'),
(51, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjE0LCJlbWFpbCI6ImFrYmFyQGdtYWlsLmNvbSIsImlhdCI6MTYxMjc2NzM2OH0.k28-vWAM6rK5H5y3q9QJdLciQvwcpQlRkkZFVik2CMA'),
(52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjE1LCJlbWFpbCI6ImhhZW1haGUzQGdtYWlsLmNvbSIsImlhdCI6MTYxMjc5MDczMX0.vcRkgVAe-7qDV9DFYdUphT8c1ZW6XIX2Hk-cQhDy8OI'),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjE1LCJlbWFpbCI6ImhhZW1haGUzQGdtYWlsLmNvbSIsImlhdCI6MTYxMjc5MTc4Nn0.1tyg6pn_Eu2gIa3Qfy4ubg4FZVygO0t4BZel8Hdl4Qw'),
(62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjEzLCJlbWFpbCI6ImFrYmFyLnp1bDczQGdtYWlsLmNvbSIsImlhdCI6MTYxMjg4NTYyNH0.JJVHffxgTzMEoty4TyOvX9cslRa3j-yNTDfjXNkSZg4'),
(63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjEzLCJlbWFpbCI6ImFrYmFyLnp1bDczQGdtYWlsLmNvbSIsImlhdCI6MTYxMjg4NTY4NX0.5mKKHxGrVAfVH79DZMG8qQONLzN2RbhhYsCoUh07CIY'),
(65, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjEzLCJlbWFpbCI6ImFrYmFyLnp1bDczQGdtYWlsLmNvbSIsImlhdCI6MTYxMjg4NjUyOX0.bqD60_brbbDu9VhricoDsKCLesG2hS1yOWaIkt2VR0s'),
(66, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjE1LCJlbWFpbCI6ImhhZW1haGUzQGdtYWlsLmNvbSIsImlhdCI6MTYxMjkyNDc1NX0.vLJMEiuq4xb1mmLb1SK8cYGObU0QuwkdBnSqYueTt6Q'),
(84, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjEzLCJlbWFpbCI6ImFrYmFyLnp1bDczQGdtYWlsLmNvbSIsImlhdCI6MTYxMjk1MzM5NX0.lPL_dEiAMRAkQgvRSPS0IxD-PUJpj8G5zEhuHj5etpc'),
(86, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjE1LCJlbWFpbCI6ImhhZW1haGUzQGdtYWlsLmNvbSIsImlhdCI6MTYxMzIwNzI1OX0.Fg_kHH-aDWF6qLA2EauytdMp0SW6CJSlWYzE8X0gBJ0'),
(93, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjE1LCJlbWFpbCI6ImhhZW1haGUzQGdtYWlsLmNvbSIsImlhdCI6MTYxMzIxMjc3N30.8Tjz94k5qp7ZISn_oc4M7ncle18V73mR5lg2LCB_kyc'),
(95, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjE2LCJlbWFpbCI6ImFrYmFyenVsODk2QGdtYWlsLmNvbSIsImlhdCI6MTYxMzIxOTczMn0.bLdpqAwKdyXK4CT-5Ev_uyLKyXGFABUE7u_2qp2nMy8'),
(106, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjQ0LCJlbWFpbCI6ImhhZW1haGU0QGdtYWlsLmNvbSIsImlhdCI6MTYxMzM3NjY2OX0.tjKyZX_yNkbRG_MojUt446DoumBU9BcLPsMN5hILtQw'),
(117, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjQ1LCJlbWFpbCI6Im1hYmRpcG1lQGdtYWlsLmNvbSIsImlhdCI6MTYxNDA3NjY2M30.gy5WLAhAMFO53k9Hw9AZ4Spc5A-swb5bPKCHs-Kdlj0'),
(123, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjQ2LCJlbWFpbCI6ImFiZGlwcml5YW5nZ2FAZ21haWwuY29tIiwiaWF0IjoxNjE0MjI4MjE5fQ.qwrgtzayGxaG0THmKJOnMMTcmG8Hhgo4b3Dh4TUOzHc'),
(126, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjQ1LCJlbWFpbCI6Im1hYmRpcG1lQGdtYWlsLmNvbSIsImlhdCI6MTYxNDI2MDUwM30.qe_7LiGpI0CxlJC-3NDwXDdCIPJ0VvCJVsVGc2G8OFM'),
(127, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MiwiaWQiOjQ2LCJlbWFpbCI6ImFiZGlwcml5YW5nZ2FAZ21haWwuY29tIiwiaWF0IjoxNjE0MzAwODYyfQ.0kum9UbHPZNBBUVJ0cOlt64GqBYmld28c203RtsKpAg'),
(128, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZXZlbF9pZCI6MSwiaWQiOjQ1LCJlbWFpbCI6Im1hYmRpcG1lQGdtYWlsLmNvbSIsImlhdCI6MTYxNDMwMTAyNH0.W7C0zlCUI9bJY8AzHAjXQtT2nUi_v8kUsIhOR0TIXbA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `full_name`, `email`, `password`, `level_id`) VALUES
(45, 'Abdi', 'Priyangga', 'mabdipme@gmail.com', '$2b$10$yZAfOe2UFyO1hHVMy7LS9.wL3S6KjGVg0Oc5KjIgwB0IGu9TZoTEa', 1),
(46, 'Angga', 'Kaze Store', 'abdipriyangga@gmail.com', '$2b$04$f4/ijvFOo0Jv.ozgj7dBJORFEnHQ492LbiUfQpWHeHtZhlByeRE3K', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_customer`
--
ALTER TABLE `address_customer`
  ADD PRIMARY KEY (`id_address`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_detail`
--
ALTER TABLE `customer_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_reset`
--
ALTER TABLE `otp_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_detail`
--
ALTER TABLE `seller_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_history`
--
ALTER TABLE `status_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_product`
--
ALTER TABLE `status_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token_whitelist`
--
ALTER TABLE `token_whitelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_customer`
--
ALTER TABLE `address_customer`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_detail`
--
ALTER TABLE `customer_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `otp_reset`
--
ALTER TABLE `otp_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seller_detail`
--
ALTER TABLE `seller_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `status_history`
--
ALTER TABLE `status_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status_product`
--
ALTER TABLE `status_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `token_whitelist`
--
ALTER TABLE `token_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
