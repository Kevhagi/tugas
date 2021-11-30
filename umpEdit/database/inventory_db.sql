-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2021 at 04:58 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `kd_admin` int(6) NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `gambar` varchar(225) NOT NULL,
  PRIMARY KEY (`kd_admin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`kd_admin`, `nama`, `username`, `password`, `gambar`) VALUES
(6, 'hendi', 'hendi', 'hendi', '2.jpg'),
(8, 'juan', 'juan', 'juan', '4.jpg'),
(9, 'octa', 'octa', 'octa', '3.jpg'),
(10, 'anstem', 'anstem', 'anstem', '6.jpg'),
(11, 'kepin', 'kepin', 'kepin', '7.png'),
(12, 'surya', 'surya', 'surya', '5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_jual` int(15) NOT NULL,
  `harga_beli` int(15) NOT NULL,
  `stok` int(4) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`kd_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `satuan`, `harga_jual`, `harga_beli`, `stok`, `status`) VALUES
('MSIRTX01', 'MSI RTX 3090', 'UNIT', 31999999, 29000000, 9, '0');

-- --------------------------------------------------------

--
-- Table structure for table `barangp_sementara`
--

CREATE TABLE IF NOT EXISTS `barangp_sementara` (
  `id_barangp` int(6) NOT NULL AUTO_INCREMENT,
  `kd_pembelian` char(8) NOT NULL,
  `nama_barangp` varchar(225) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_barangp` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_barangp`),
  KEY `kd_pembelian` (`kd_pembelian`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_pembelian`
--

CREATE TABLE IF NOT EXISTS `barang_pembelian` (
  `kd_barang_beli` int(6) NOT NULL AUTO_INCREMENT,
  `kd_pembelian` char(8) NOT NULL,
  `nama_barang_beli` varchar(225) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga_beli` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`kd_barang_beli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=110 ;

--
-- Dumping data for table `barang_pembelian`
--

INSERT INTO `barang_pembelian` (`kd_barang_beli`, `kd_pembelian`, `nama_barang_beli`, `satuan`, `harga_beli`, `item`, `total`, `status`) VALUES
(109, 'PEM00001', 'MSI RTX 3090', 'UNIT', 29000000, 10, 290000000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `d_pembelian`
--

CREATE TABLE IF NOT EXISTS `d_pembelian` (
  `id_pembelian` int(6) NOT NULL AUTO_INCREMENT,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang_beli` int(6) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `kd_pembelian` (`kd_pembelian`),
  KEY `kd_pembelian_2` (`kd_pembelian`),
  KEY `kd_barang_beli` (`kd_barang_beli`),
  KEY `kd_barang_beli_2` (`kd_barang_beli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=163 ;

--
-- Dumping data for table `d_pembelian`
--

INSERT INTO `d_pembelian` (`id_pembelian`, `kd_pembelian`, `kd_barang_beli`, `jumlah`, `subtotal`) VALUES
(162, 'PEM00001', 109, 10, 290000000);

-- --------------------------------------------------------

--
-- Table structure for table `d_penjualan`
--

CREATE TABLE IF NOT EXISTS `d_penjualan` (
  `id_penjualan` int(6) NOT NULL AUTO_INCREMENT,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`id_penjualan`),
  KEY `kd_penjualan` (`kd_penjualan`),
  KEY `kd_barang` (`kd_barang`),
  KEY `kd_barang_2` (`kd_barang`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `d_penjualan`
--

INSERT INTO `d_penjualan` (`id_penjualan`, `kd_penjualan`, `kd_barang`, `jumlah`, `subtotal`) VALUES
(66, 'PEN00001', 'MSIRTX01', 1, 31999999);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
  `kd_pembelian` char(8) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `kd_supplier` int(6) NOT NULL,
  `total_pembelian` double NOT NULL,
  PRIMARY KEY (`kd_pembelian`),
  KEY `kd_admin` (`kd_admin`),
  KEY `kd_supplier` (`kd_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`kd_pembelian`, `tgl_pembelian`, `kd_admin`, `kd_supplier`, `total_pembelian`) VALUES
('PEM00001', '2021-11-30', 8, 5, 290000000);

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE IF NOT EXISTS `pengiriman` (
  `kd_penjualan` char(8) CHARACTER SET latin1 NOT NULL,
  `kd_resi` varchar(20) NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `ekspedisi` varchar(20) NOT NULL,
  `tgl_inputresi` date NOT NULL,
  PRIMARY KEY (`kd_penjualan`),
  KEY `kd_admin` (`kd_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`kd_penjualan`, `kd_resi`, `kd_admin`, `ekspedisi`, `tgl_inputresi`) VALUES
('PEN00001', 'jne012345', 8, 'jne', '2021-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `kd_penjualan` char(8) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `dibayar` double NOT NULL,
  `total_penjualan` double NOT NULL,
  PRIMARY KEY (`kd_penjualan`),
  KEY `kd_admin` (`kd_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`kd_penjualan`, `tgl_penjualan`, `kd_admin`, `dibayar`, `total_penjualan`) VALUES
('PEN00001', '2021-11-30', 8, 32000000, 31999999);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_sementara`
--

CREATE TABLE IF NOT EXISTS `penjualan_sementara` (
  `id_penjualan_sementara` int(11) NOT NULL AUTO_INCREMENT,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_penjualan_sementara`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE IF NOT EXISTS `perusahaan` (
  `kd_perusahaan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_perusahaan` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `pemilik` varchar(225) NOT NULL,
  `kota` varchar(225) NOT NULL,
  PRIMARY KEY (`kd_perusahaan`),
  KEY `kd_perusahaan` (`kd_perusahaan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`kd_perusahaan`, `nama_perusahaan`, `alamat`, `pemilik`, `kota`) VALUES
(1, 'JUAN STORE', 'Karawaci, Tangerang', 'Juan Sebastian', 'Tangerang');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `kd_supplier` int(6) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(60) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  PRIMARY KEY (`kd_supplier`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kd_supplier`, `nama_supplier`, `alamat`) VALUES
(5, 'Eternal Asia', 'Mangga Dua Mall Lt. 4 Blok A.11'),
(6, 'Astra Electronics', 'TangCity Mall Blok C.15'),
(7, 'Dimensi Data', 'Victoria Park Office Blok H.69');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `d_pembelian`
--
ALTER TABLE `d_pembelian`
  ADD CONSTRAINT `d_pembelian_ibfk_3` FOREIGN KEY (`kd_pembelian`) REFERENCES `pembelian` (`kd_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `d_pembelian_ibfk_4` FOREIGN KEY (`kd_barang_beli`) REFERENCES `barang_pembelian` (`kd_barang_beli`);

--
-- Constraints for table `d_penjualan`
--
ALTER TABLE `d_penjualan`
  ADD CONSTRAINT `d_penjualan_ibfk_3` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`),
  ADD CONSTRAINT `d_penjualan_ibfk_4` FOREIGN KEY (`kd_penjualan`) REFERENCES `penjualan` (`kd_penjualan`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
