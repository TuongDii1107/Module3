CREATE DATABASE ngan_hang;

USE ngan_hang;

CREATE TABLE khach_hang (
    id_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255) NOT NULL
);

CREATE TABLE tai_khoan (
    id_tai_khoan INT PRIMARY KEY AUTO_INCREMENT,
    khach_hang_id INT UNIQUE,
    so_du DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (khach_hang_id) REFERENCES khach_hang(id_khach_hang)
);