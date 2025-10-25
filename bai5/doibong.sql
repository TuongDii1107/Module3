CREATE DATABASE doi_bong;
USE doi_bong;

CREATE TABLE huan_luyen_vien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(100),
    ngay_sinh DATE
);

CREATE TABLE doi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_doi VARCHAR(100),
    hlv_id INT UNIQUE,
    FOREIGN KEY (hlv_id) REFERENCES huan_luyen_vien(id)
);

CREATE TABLE cau_thu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(100),
    ngay_sinh DATE,
    doi_id INT,
    FOREIGN KEY (doi_id) REFERENCES doi(id)
);

CREATE TABLE vi_tri_cau_thu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vi_tri VARCHAR(50)
);

CREATE TABLE cau_thu_vi_tri (
    cau_thu_id INT,
    vi_tri_id INT,
    PRIMARY KEY (cau_thu_id, vi_tri_id),
    FOREIGN KEY (cau_thu_id) REFERENCES cau_thu(id),
    FOREIGN KEY (vi_tri_id) REFERENCES vi_tri_cau_thu(id)
);

CREATE TABLE tran_dau (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doi_a INT,
    doi_b INT,
    ngay_gio_dau DATETIME,
    CONSTRAINT fk_doi_a FOREIGN KEY (doi_a) REFERENCES doi(id),
    CONSTRAINT fk_doi_b FOREIGN KEY (doi_b) REFERENCES doi(id)
);

CREATE TABLE tran_dau_cau_thu (
    tran_dau_id INT,
    cau_thu_id INT,
    PRIMARY KEY (tran_dau_id, cau_thu_id),
    FOREIGN KEY (tran_dau_id) REFERENCES tran_dau(id),
    FOREIGN KEY (cau_thu_id) REFERENCES cau_thu(id)
);
