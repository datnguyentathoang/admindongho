-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2025 at 08:35 AM
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
-- Database: `quanlydongho`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `ma_chi_tiet` int(11) NOT NULL,
  `ma_don_hang` int(11) NOT NULL,
  `ma_san_pham` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `don_gia` decimal(10,2) NOT NULL,
  `thanh_tien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `ma_danh_muc` int(11) NOT NULL,
  `ten_danh_muc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mo_ta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`ma_danh_muc`, `ten_danh_muc`, `mo_ta`) VALUES
(1, 'Đồng hồ điện tử', 'Các mẫu đồng hồ điện tử hiện đại'),
(2, 'Đồng hồ cơ', 'Các mẫu đồng hồ cơ truyền thống'),
(3, 'Đồng hồ thể thao', 'Đồng hồ chuyên dụng cho thể thao');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `ma_don_hang` int(11) NOT NULL,
  `ma_khach_hang` int(11) NOT NULL,
  `trang_thai` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'chờ xác nhận'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`ma_don_hang`, `ma_khach_hang`, `trang_thai`) VALUES
(1, 1, 'chờ xác nhận'),
(2, 2, 'đang xử lý'),
(3, 3, 'đã giao');

-- --------------------------------------------------------

--
-- Table structure for table `giohang`
--

CREATE TABLE `giohang` (
  `ma_gio_hang` int(11) NOT NULL,
  `ma_khach_hang` int(11) NOT NULL,
  `ma_san_pham` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `giohang`
--

INSERT INTO `giohang` (`ma_gio_hang`, `ma_khach_hang`, `ma_san_pham`, `so_luong`) VALUES
(1, 1, 2, 1),
(2, 2, 3, 2),
(3, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `ma_khach_hang` int(11) NOT NULL,
  `ma_nguoi_dung` int(11) NOT NULL,
  `ten_khach_hang` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gioi_tinh` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`ma_khach_hang`, `ma_nguoi_dung`, `ten_khach_hang`, `gioi_tinh`, `ngay_sinh`) VALUES
(1, 1, 'Trần Nguyễn D', 'nam', '1990-05-15'),
(2, 2, 'Trần Thị E', 'nữ', '2005-08-22'),
(3, 3, 'Lê Văn F', 'nam', '1997-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `ID` int(11) NOT NULL,
  `Menu` varchar(150) NOT NULL,
  `url` varchar(100) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`ID`, `Menu`, `url`, `status`) VALUES
(1, 'Sản phẩm', 'sanpham.php', '1'),
(2, 'Nhân viên', 'nhanvien.php', '1'),
(3, 'Người dùng', 'nguoidung.php', '1'),
(4, 'Khách hàng', 'khachhang.php', '1');

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `ma_nguoi_dung` int(11) NOT NULL,
  `ho_ten` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tendangnhap` varchar(200) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mat_khau` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  `vai_tro` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'khách hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`ma_nguoi_dung`, `ho_ten`, `tendangnhap`, `email`, `mat_khau`, `so_dien_thoai`, `vai_tro`) VALUES
(1, 'Nguyễn Văn dat', 'admin', 'nguyenvana@gmail.com', '111', '0987654321', 'khách hàng'),
(2, 'Trần Thị B', 'nhanvien', 'tranthib@gmail.com', '222', '0912345678', 'nhân viên'),
(3, 'Lê Văn C', 'khach', 'levanc@gmail.com', '333', '0901122334', 'quản trị');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `ma_nhan_vien` int(11) NOT NULL,
  `ma_nguoi_dung` int(11) NOT NULL,
  `ten_nhan_vien` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chuc_vu` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ngay_vao_lam` date NOT NULL,
  `luong` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`ma_nhan_vien`, `ma_nguoi_dung`, `ten_nhan_vien`, `chuc_vu`, `ngay_vao_lam`, `luong`) VALUES
(1, 1, 'Hoàng Minh D', 'Bán hàng', '2023-12-15', 11000000.00),
(2, 2, 'Trần Thị B', 'bán hàng', '2024-01-10', 12000000.00),
(3, 3, 'Lê Văn C', 'quản trị', '2024-01-05', 25000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `ma_san_pham` int(11) NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `ma_thuong_hieu` int(11) DEFAULT NULL,
  `ma_danh_muc` int(11) DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL,
  `mo_ta` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`ma_san_pham`, `ten_san_pham`, `ma_thuong_hieu`, `ma_danh_muc`, `gia`, `mo_ta`) VALUES
(1, 'Đồng hồ Casio', 1, 1, 1500000.00, 'Chống nước, dây da'),
(2, 'Đồng hồ Movado', 2, 2, 99999999.99, 'Máy cơ, kính sapphire'),
(3, 'Đồng hồ Tissot', 3, 1, 99999999.99, 'Năng lượng mặt trời');

-- --------------------------------------------------------

--
-- Table structure for table `thuonghieu`
--

CREATE TABLE `thuonghieu` (
  `ma_thuong_hieu` int(11) NOT NULL,
  `ten_thuong_hieu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thuonghieu`
--

INSERT INTO `thuonghieu` (`ma_thuong_hieu`, `ten_thuong_hieu`) VALUES
(1, 'Casio'),
(2, 'Movado'),
(3, 'Tissot');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`ma_chi_tiet`),
  ADD KEY `ma_don_hang` (`ma_don_hang`),
  ADD KEY `ma_san_pham` (`ma_san_pham`);

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`ma_danh_muc`),
  ADD UNIQUE KEY `ten_danh_muc` (`ten_danh_muc`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`ma_don_hang`),
  ADD KEY `ma_khach_hang` (`ma_khach_hang`);

--
-- Indexes for table `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`ma_gio_hang`),
  ADD KEY `ma_khach_hang` (`ma_khach_hang`),
  ADD KEY `ma_san_pham` (`ma_san_pham`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`ma_khach_hang`),
  ADD UNIQUE KEY `ma_nguoi_dung` (`ma_nguoi_dung`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`ma_nguoi_dung`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `so_dien_thoai` (`so_dien_thoai`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`ma_nhan_vien`),
  ADD UNIQUE KEY `ma_nguoi_dung` (`ma_nguoi_dung`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`ma_san_pham`),
  ADD KEY `ma_thuong_hieu` (`ma_thuong_hieu`),
  ADD KEY `ma_danh_muc` (`ma_danh_muc`);

--
-- Indexes for table `thuonghieu`
--
ALTER TABLE `thuonghieu`
  ADD PRIMARY KEY (`ma_thuong_hieu`),
  ADD UNIQUE KEY `ten_thuong_hieu` (`ten_thuong_hieu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `ma_chi_tiet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `ma_danh_muc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `ma_don_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `giohang`
--
ALTER TABLE `giohang`
  MODIFY `ma_gio_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `ma_khach_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `ma_nguoi_dung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `ma_nhan_vien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `ma_san_pham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `thuonghieu`
--
ALTER TABLE `thuonghieu`
  MODIFY `ma_thuong_hieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`ma_don_hang`) REFERENCES `donhang` (`ma_don_hang`) ON DELETE CASCADE,
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`ma_san_pham`) REFERENCES `sanpham` (`ma_san_pham`) ON DELETE CASCADE;

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`ma_khach_hang`) REFERENCES `khachhang` (`ma_khach_hang`) ON DELETE CASCADE;

--
-- Constraints for table `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`ma_khach_hang`) REFERENCES `khachhang` (`ma_khach_hang`) ON DELETE CASCADE,
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`ma_san_pham`) REFERENCES `sanpham` (`ma_san_pham`) ON DELETE CASCADE;

--
-- Constraints for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoidung` (`ma_nguoi_dung`) ON DELETE CASCADE;

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoidung` (`ma_nguoi_dung`) ON DELETE CASCADE;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`ma_thuong_hieu`) REFERENCES `thuonghieu` (`ma_thuong_hieu`) ON DELETE SET NULL,
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`ma_danh_muc`) REFERENCES `danhmuc` (`ma_danh_muc`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
