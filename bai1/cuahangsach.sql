CREATE DATABASE cuahangsach;

USE cuahangsach;

CREATE TABLE tac_gia (
    id_tacgia INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(200) NOT NULL
);

CREATE TABLE nhan_vien (
    id_nhanvien INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(200) NOT NULL,
    diachi TEXT NOT NULL
);

CREATE TABLE sach (
    id_sach INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(200) NOT NULL,
    gia DOUBLE NOT NULL,
    id_nhanvien INT,
    FOREIGN KEY (id_nhanvien) REFERENCES nhanvien(id_nhanvien)
);

CREATE TABLE tacgia_sach (
    id_tacgia INT,
    id_sach INT,
    PRIMARY KEY (id_tacgia, id_sach),
    FOREIGN KEY (id_tacgia) REFERENCES tacgia(id_tacgia),
    FOREIGN KEY (id_sach) REFERENCES sach(id_sach)
);
