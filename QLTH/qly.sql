-- Tạo cơ sở dữ liệu
create database test_quan_ly_truong_hoc;

-- Tạo bảng giao_vien
use test_quan_ly_truong_hoc;

-- Tạo bảng giao_vien
CREATE TABLE giao_vien (
    ma_gv CHAR(5) PRIMARY KEY,
    ho_ten_gv VARCHAR(255)
);

-- Tạo bảng lop
CREATE TABLE lop (
    ma_lop CHAR(5) PRIMARY KEY,
    ten_lop VARCHAR(255),
    ma_gvcn CHAR(5),
    nam_hoc VARCHAR(50),
    FOREIGN KEY (ma_gvcn) REFERENCES giao_vien(ma_gv)
);

-- Tạo bảng hoc_sinh
CREATE TABLE hoc_sinh (
    ma_hs CHAR(5) PRIMARY KEY,
    ho_ten_hs VARCHAR(255),
    ho_ten_ph VARCHAR(255),
    gioi_tinh VARCHAR(10),
    dia_chi VARCHAR(255),
    ma_lop CHAR(5),
    FOREIGN KEY (ma_lop) REFERENCES lop(ma_lop)
);

-- Tạo bảng mon_hoc
CREATE TABLE mon_hoc (
    ma_mh CHAR(5) PRIMARY KEY,
    ten_mh VARCHAR(255)
);

-- Tạo bảng ket_qua_hoc_tap
CREATE TABLE ket_qua_hoc_tap (
    ma_hs CHAR(5),
    hoc_ky VARCHAR(10),
    ma_mh CHAR(5),
    diem_thi_giua_ky FLOAT,
    diem_thi_cuoi_ky FLOAT,
    ngay_gio_thi_cuoi_ky DATETIME,
    PRIMARY KEY (ma_hs, hoc_ky, ma_mh),
    FOREIGN KEY (ma_hs) REFERENCES hoc_sinh(ma_hs),
    FOREIGN KEY (ma_mh) REFERENCES mon_hoc(ma_mh)
);

-- Tạo bảng phu_trach_bo_mon
CREATE TABLE phu_trach_bo_mon (
    ma_gvpt CHAR(5),
    ma_lop CHAR(5),
    ma_mh CHAR(5),
    hoc_ky VARCHAR(10),
    PRIMARY KEY (ma_gvpt, ma_lop, ma_mh, hoc_ky),
    FOREIGN KEY (ma_gvpt) REFERENCES giao_vien(ma_gv),
    FOREIGN KEY (ma_lop) REFERENCES lop(ma_lop),
    FOREIGN KEY (ma_mh) REFERENCES mon_hoc(ma_mh)
);

---------------------------------------------------------------------------------------------------------------
INSERT INTO giao_vien (ma_gv, ho_ten_gv)
VALUES ('GV001', 'Nguyễn Văn Anh'),
       ('GV002', 'Trần Quốc Bảo'),
       ('GV003', 'Lê Thị Lan'),
       ('GV004', 'Phạm Minh Đức'),
       ('GV005', 'Võ Văn Nghĩa'),
       ('GV006', 'Huỳnh Thị Hoa'),
       ('GV007', 'Nguyễn Hoàng Nam'),
       ('GV008', 'Trần Văn Khánh'),
       ('GV009', 'Lê Thị Mai'),
       ('GV010', 'Hoàng Xuân Thanh');

INSERT INTO lop (ma_lop, ten_lop, ma_gvcn, nam_hoc)
VALUES ('L0001', 'Lớp 1A', 'GV001', '2022-2023'),
       ('L0002', 'Lớp 2A', 'GV003', '2022-2023'),
       ('L0003', 'Lớp 1B', 'GV002', '2022-2023'),
       ('L0004', 'Lớp 2B', 'GV005', '2022-2023'),
       ('L0005', 'Lớp 3A', 'GV004', '2022-2023'),
       ('L0006', 'Lớp 4A', 'GV006', '2022-2023'),
       ('L0007', 'Lớp 3B', 'GV008', '2022-2023'),
       ('L0008', 'Lớp 4B', 'GV010', '2022-2023'),
       ('L0009', 'Lớp 5A', 'GV007', '2022-2023'),
       ('L0010', 'Lớp 5B', 'GV009', '2022-2023');

INSERT INTO hoc_sinh (ma_hs, ho_ten_hs, ho_ten_ph, gioi_tinh, dia_chi, ma_lop)
VALUES ('HS001', 'Nguyễn Văn Minh', 'Nguyễn Hoàng Linh', 'Nam', 'Thanh Khê', 'L0001'),
       ('HS002', 'Trần Thị Mai', 'Trần Văn Tuyến', 'Nữ', 'Hải Châu', 'L0002'),
       ('HS003', 'Lê Tuấn Anh', 'Lê Văn Tường', 'Nam', 'Thanh Khê', 'L0001'),
       ('HS004', 'Phạm Thị Hoa', 'Phạm Văn Lợi', 'Nữ', 'Sơn Trà', 'L0003'),
       ('HS005', 'Võ Minh Tuấn', 'Võ Văn Đại', 'Nam', 'Liên Chiểu', 'L0004'),
       ('HS006', 'Huỳnh Thị Lan', 'Huỳnh Văn Sơn', 'Nữ', 'Cẩm Lệ', 'L0005'),
       ('HS007', 'Nguyễn Hoàng Nam', 'Nguyễn Văn Quang', 'Nam', 'Hòa Vang', 'L0006'),
       ('HS008', 'Trần Minh Trí', 'Trần Văn Hoàng', 'Nam', 'Hải Châu', 'L0007'),
       ('HS009', 'Lê Thị Thanh', 'Lê Văn Tâm', 'Nữ', 'Thanh Khê', 'L0008'),
       ('HS010', 'Hoàng Quốc Bảo', 'Hoàng Văn Lâm', 'Nam', 'Cẩm Lệ', 'L0009'),
		('HS011', 'Nguyễn Thị Thu', 'Nguyễn Văn Hùng', 'Nữ', 'Thanh Khê', 'L0001'),
		('HS012', 'Trần Minh Hiếu', 'Trần Văn Hoàn', 'Nam', 'Hải Châu', 'L0002'),
		('HS013', 'Lê Thị Bình', 'Lê Văn Tuấn', 'Nữ', 'Thanh Khê', 'L0001'),
		('HS014', 'Phạm Minh Tuấn', 'Phạm Văn Đông', 'Nam', 'Sơn Trà', 'L0003'),
		('HS015', 'Võ Thị Hoài', 'Võ Văn An', 'Nữ', 'Liên Chiểu', 'L0004'),
		('HS016', 'Huỳnh Văn Thanh', 'Huỳnh Thị Trang', 'Nam', 'Cẩm Lệ', 'L0005'),
		('HS017', 'Nguyễn Văn Hải', 'Nguyễn Thị Ngọc', 'Nam', 'Hòa Vang', 'L0006'),
		('HS018', 'Trần Thị Hương', 'Trần Văn Đạo', 'Nữ', 'Hải Châu', 'L0007'),
		('HS019', 'Lê Minh Quân', 'Lê Thị Thảo', 'Nam', 'Thanh Khê', 'L0008'),
		('HS020', 'Hoàng Văn Phú', 'Hoàng Thị Lệ', 'Nam', 'Cẩm Lệ', 'L0009'),
        ('HS021', 'Nguyễn Minh Huy', 'Nguyễn Thị Mai', 'Nam', 'Thanh Khê', 'L0001'),
		('HS022', 'Trần Thị Thảo', 'Trần Văn Tùng', 'Nữ', 'Hải Châu', 'L0002'),
		('HS023', 'Lê Văn Đức', 'Lê Thị Hương', 'Nam', 'Thanh Khê', 'L0001'),
		('HS024', 'Phạm Thị Hoa', 'Phạm Văn Trung', 'Nữ', 'Sơn Trà', 'L0003'),
		('HS025', 'Võ Minh Tuấn', 'Võ Thị Ngọc', 'Nam', 'Liên Chiểu', 'L0004'),
		('HS026', 'Huỳnh Văn Quý', 'Huỳnh Thị Lan', 'Nam', 'Cẩm Lệ', 'L0005'),
		('HS027', 'Nguyễn Thị Tâm', 'Nguyễn Văn Anh', 'Nữ', 'Hòa Vang', 'L0006'),
		('HS028', 'Trần Văn Hoàng', 'Trần Thị Bình', 'Nam', 'Hải Châu', 'L0007'),
		('HS029', 'Lê Minh Tuấn', 'Lê Văn Thanh', 'Nam', 'Thanh Khê', 'L0008'),
		('HS030', 'Hoàng Thị Ngân', 'Hoàng Văn Phương', 'Nữ', 'Cẩm Lệ', 'L0009'),
		('HS031', 'Nguyễn Minh Thuận', 'Nguyễn Thị Hoài', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0001'),
		('HS032', 'Trần Thanh Thảo', 'Trần Văn Quân', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS033', 'Lê Thị Kim', 'Lê Văn Trọng', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS034', 'Phạm Văn Hoàng', 'Phạm Thị Hà', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0004'),
		('HS035', 'Võ Thị Lan', 'Võ Văn Sơn', 'Nữ', 'Ngũ Hành Sơn, Đà Nẵng', 'L0005'),
		('HS036', 'Huỳnh Văn Nam', 'Huỳnh Thị Thanh', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0006'),
		('HS037', 'Nguyễn Thị Hương', 'Nguyễn Văn Huy', 'Nữ', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS038', 'Trần Văn Đức', 'Trần Thị Ngọc', 'Nam', 'Hải Châu, Đà Nẵng', 'L0008'),
		('HS039', 'Lê Văn Quyền', 'Lê Thị Thu', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS040', 'Hoàng Minh Tuấn', 'Hoàng Văn Hoa', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0010'),
		('HS041', 'Trần Văn Hưng', 'Trần Thị Lan', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0001'),
		('HS042', 'Nguyễn Thị Hà', 'Nguyễn Văn Tâm', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS043', 'Lê Minh Hoàng', 'Lê Thị Hoàng', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS044', 'Phạm Thị Quỳnh', 'Phạm Văn Trung', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0004'),
		('HS045', 'Võ Minh Quân', 'Võ Thị Lan', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0005'),
		('HS046', 'Huỳnh Văn Thanh', 'Huỳnh Thị Thảo', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0006'),
		('HS047', 'Nguyễn Văn Hùng', 'Nguyễn Thị Hương', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS048', 'Trần Minh Tuấn', 'Trần Thị Phương', 'Nam', 'Hải Châu, Đà Nẵng', 'L0008'),
		('HS049', 'Lê Thị Bích', 'Lê Văn Trọng', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS050', 'Hoàng Văn Lâm', 'Hoàng Thị Thu', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0010'),
        ('HS051', 'Trần Minh Quang', 'Trần Thị Ánh', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0001'),
		('HS052', 'Nguyễn Văn Khánh', 'Nguyễn Thị Hoa', 'Nam', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS053', 'Lê Thị Thủy', 'Lê Văn Huy', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS054', 'Phạm Minh Trí', 'Phạm Thị Ngọc', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0004'),
		('HS055', 'Võ Thị Trang', 'Võ Văn Đức', 'Nữ', 'Ngũ Hành Sơn, Đà Nẵng', 'L0005'),
		('HS056', 'Huỳnh Minh Hoa', 'Huỳnh Thị Lan', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0006'),
		('HS057', 'Nguyễn Văn Phúc', 'Nguyễn Thị Thu', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS058', 'Trần Thị Thảo', 'Trần Văn Tài', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0008'),
		('HS059', 'Lê Văn Long', 'Lê Thị Ngọc', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS060', 'Hoàng Thị Hương', 'Hoàng Văn Đức', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0010'),
        ('HS061', 'Ngô Thị Kim', 'Ngô Văn Hải', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0001'),
		('HS062', 'Trương Văn Đạt', 'Trương Thị Nga', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0002'),
		('HS063', 'Phan Minh Tuấn', 'Phan Thị Mai', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS064', 'Lâm Thị Lan', 'Lâm Văn Đạt', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0004'),
		('HS065', 'Trần Văn Hậu', 'Trần Thị Tuyết', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0005'),
		('HS066', 'Võ Thị Hoàng', 'Võ Văn Long', 'Nữ', 'Ngũ Hành Sơn, Đà Nẵng', 'L0006'),
		('HS067', 'Huỳnh Minh Tuấn', 'Huỳnh Thị Thảo', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0007'),
		('HS068', 'Lý Thị Hương', 'Lý Văn Hiếu', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0008'),
		('HS069', 'Nguyễn Minh Đức', 'Nguyễn Thị Trang', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS070', 'Hoàng Văn Tùng', 'Hoàng Thị Phương', 'Nam', 'Hải Châu, Đà Nẵng', 'L0010'),
        ('HS071', 'Nguyễn Thị Trang', 'Nguyễn Văn Long', 'Nữ', 'Hòa Vang, Đà Nẵng', 'L0001'),
		('HS072', 'Trần Văn Đạt', 'Trần Thị Nga', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0002'),
		('HS073', 'Lê Minh Tuấn', 'Lê Thị Mai', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0003'),
		('HS074', 'Phạm Văn Thanh', 'Phạm Văn Đạt', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0004'),
		('HS075', 'Lâm Minh Hiếu', 'Lâm Văn Hải', 'Nam', 'Hải Châu, Đà Nẵng', 'L0005'),
		('HS076', 'Trương Minh Tuấn', 'Trương Thị Tuyết', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0006'),
		('HS077', 'Võ Văn Hậu', 'Võ Thị Hoàng', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0007'),
		('HS078', 'Huỳnh Thị Lan', 'Huỳnh Minh Tuấn', 'Nữ', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0008'),
		('HS079', 'Lý Văn Đạt', 'Lý Thị Hương', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0009'),
		('HS080', 'Ngô Minh Trang', 'Ngô Thị Kim', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0010'),
        ('HS081', 'Trần Văn Hùng', 'Trần Thị Lan', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0001'),
		('HS082', 'Lê Thị Thảo', 'Lê Văn Minh', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS083', 'Nguyễn Văn Long', 'Nguyễn Thị Hoài', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0003'),
		('HS084', 'Phạm Thị Hoa', 'Phạm Văn Đức', 'Nữ', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0004'),
		('HS085', 'Lâm Minh Tuấn', 'Lâm Văn Định', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0005'),
		('HS086', 'Trương Thị Hồng', 'Trương Văn Thanh', 'Nữ', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0006'),
		('HS087', 'Võ Minh Hải', 'Võ Thị Thùy', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS088', 'Huỳnh Văn Đạt', 'Huỳnh Thị Thanh', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0008'),
		('HS089', 'Lý Minh Tuấn', 'Lý Thị Lan', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0009'),
		('HS090', 'Ngô Thị Hà', 'Ngô Văn Nam', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0010'),
        ('HS091', 'Nguyễn Thị Trang', 'Nguyễn Văn Lâm', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0001'),
		('HS092', 'Trần Minh Tâm', 'Trần Thị Hoài', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0002'),
		('HS093', 'Lê Thị Thuận', 'Lê Văn Đạt', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS094', 'Phạm Minh Tú', 'Phạm Văn Hưng', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0004'),
		('HS095', 'Lâm Thị Mỹ Duyên', 'Lâm Văn Thảo', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0005'),
		('HS096', 'Trương Minh Thanh', 'Trương Thị Hồng', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0006'),
		('HS097', 'Võ Minh Trí', 'Võ Thị Thảo', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS098', 'Huỳnh Thị Thùy Trang', 'Huỳnh Văn Tùng', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0008'),
		('HS099', 'Lý Văn Trường', 'Lý Thị Lan Anh', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0009'),
		('HS100', 'Ngô Văn Nam', 'Ngô Thị Hà', 'Nam', 'Hải Châu, Đà Nẵng', 'L0010');
        
INSERT INTO mon_hoc (ma_mh, ten_mh)
VALUES 
    ('MH001', 'Toán học'),
    ('MH002', 'Ngữ văn'),
    ('MH003', 'Lịch sử'),
    ('MH004', 'Địa lý'),
    ('MH005', 'Sinh học'),
    ('MH006', 'Vật lí'),
    ('MH007', 'Hóa học'),
    ('MH008', 'Giáo dục công dân'),
    ('MH009', 'Thể dục'),
    ('MH010', 'Âm nhạc');

INSERT INTO ket_qua_hoc_tap (ma_hs, hoc_ky, ma_mh, diem_thi_giua_ky, diem_thi_cuoi_ky, ngay_gio_thi_cuoi_ky)
VALUES 
    ('HS001', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    ('HS002', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
    ('HS003', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    ('HS004', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    ('HS005', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    ('HS006', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    ('HS007', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    ('HS008', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    ('HS009', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
    ('HS010', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
    ('HS011', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
    ('HS012', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
    ('HS013', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
    ('HS014', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
    ('HS015', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    ('HS016', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
    ('HS017', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    ('HS018', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    ('HS019', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    ('HS020', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    ('HS021', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS022 đến HS050)
    ('HS022', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS023 đến HS050)
    ('HS023', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS024 đến HS050)
    ('HS024', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS025 đến HS050)
    ('HS025', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS026 đến HS050)
    ('HS026', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS027 đến HS050)
    ('HS027', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS028 đến HS050)
    ('HS028', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS029 đến HS050)
    ('HS029', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS030 đến HS050)
    ('HS030', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS031 đến HS050)
    ('HS031', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS032 đến HS050)
    ('HS032', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS033 đến HS050)
    ('HS033', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS034 đến HS050)
    ('HS034', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS035 đến HS050)
    ('HS035', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS036 đến HS050)
    ('HS036', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS037 đến HS050)
    ('HS037', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS038 đến HS050)
    ('HS038', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS039 đến HS050)
    ('HS039', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS040 đến HS050)
    ('HS040', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS041 đến HS050)
    ('HS041', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS042 đến HS050)
    ('HS042', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS043 đến HS050)
    ('HS043', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS044 đến HS050)
    ('HS044', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS045 đến HS050)
    ('HS045', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS046 đến HS050)
    ('HS046', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS047 đến HS050)
    ('HS047', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS048 đến HS050)
    ('HS048', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS049 đến HS050)
    ('HS049', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS050)
    ('HS050', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00');

INSERT INTO phu_trach_bo_mon (ma_gvpt, ma_lop, ma_mh, hoc_ky)
VALUES 
    ('GV001', 'L0001', 'MH001', 'Học kỳ 1'),
    ('GV002', 'L0003', 'MH002', 'Học kỳ 1'),
    ('GV003', 'L0002', 'MH003', 'Học kỳ 1'),
    ('GV004', 'L0004', 'MH004', 'Học kỳ 1'),
    ('GV005', 'L0005', 'MH005', 'Học kỳ 1'),
    ('GV006', 'L0006', 'MH006', 'Học kỳ 1'),
    ('GV007', 'L0007', 'MH007', 'Học kỳ 1'),
    ('GV008', 'L0008', 'MH008', 'Học kỳ 1'),
    ('GV009', 'L0009', 'MH009', 'Học kỳ 1'),
    ('GV010', 'L0010', 'MH010', 'Học kỳ 1'),
    ('GV001', 'L0001', 'MH001', 'Học kỳ 2'),
    ('GV002', 'L0003', 'MH002', 'Học kỳ 2'),
    ('GV003', 'L0002', 'MH003', 'Học kỳ 2'),
    ('GV004', 'L0004', 'MH004', 'Học kỳ 2'),
    ('GV005', 'L0005', 'MH005', 'Học kỳ 2'),
    ('GV006', 'L0006', 'MH006', 'Học kỳ 2'),
    ('GV007', 'L0007', 'MH007', 'Học kỳ 2'),
    ('GV008', 'L0008', 'MH008', 'Học kỳ 2'),
    ('GV009', 'L0009', 'MH009', 'Học kỳ 2'),
    ('GV010', 'L0010', 'MH010', 'Học kỳ 2');
-----------------------------------------------------------------------------
-- Câu A --
select * from giao_vien;
-- Câu B --
select hs.ho_ten_hs, hs.gioi_tinh, hs.ho_ten_ph
from hoc_sinh hs;
-- Câu C --
select * From lop;
-------------------------------------------------------------------------------
--   a. Những học sinh có giới tính là Nam.---
select * from hoc_sinh
where gioi_tinh ='Nam';
--   b. Những học sinh chưa có tên của phụ huynh. ---
select * from hoc_sinh
where ho_ten_ph is null;
--  c. Những lớp chưa có giáo viên chủ nhiệm. ---
select * from lop
where ma_gvcn is null;
-- d. Những học sinh chưa được phân lớp. --
select * from hoc_sinh
where ma_lop is null;
-- e. Những học sinh nữ có địa chỉ ở Thanh Khê. --
select * from hoc_sinh
where gioi_tinh = 'Nu' && dia_chi = 'Thanh Khe';
-- f. Những học sinh nam có địa chỉ ở Hải Châu hoặc những học sinh nữ có địa chỉ ở Thanh Khê. -- 
select * from hoc_sinh
where gioi_tinh = 'Nam' && dia_chi = 'Hai Chau' or gioi_tinh = 'Nu' && dia_chi = 'Thanh Khe';
--     g. Những học sinh nam chưa có tên phụ huynh và những học sinh nữ chưa được phân lớp. --
select * from hoc_sinh
where gioi_tinh = 'Nam' && ho_ten_ph is null or gioi_tinh = 'Nu' && ma_lop is null;
-- h. Những học sinh nam chưa được phân lớp và những học sinh nam chưa có tên phụ huynh. --
 select * from hoc_sinh
where gioi_tinh = 'Nam' && ma_lop is null && ho_ten_ph is null;
 --    i. Mã môn học của những môn học được dạy trong học kỳ 2. --
select distinct ma_mh FROM phu_trach_bo_mon WHERE hoc_ky = 'Học kỳ 2';
------------------------------------------------------------------------
-- Hãy liệt kê:
--   a. Những học sinh có họ tên bắt đầu bằng từ Nguyễn.
select * from hoc_sinh
where ho_ten_hs like 'Nguyen%';
--    b. Những học sinh có họ tên kết thúc bằng từ Nở.
select * from hoc_sinh
where ho_ten_hs like '%Nở';
--   c. Những học sinh có họ tên chứa từ Thị.
select * from hoc_sinh
where ho_ten_hs like '%Thị%';
--   d. Những học sinh chứa từ Thị ở giữa (không được chứa ở đầu và ở cuối).
select * from hoc_sinh
where ho_ten_hs like '%Thị%' and ho_ten_hs not like 'Thị%' and ho_ten_hs not like '%Thị';
--    e. Những học sinh có họ tên với độ dài là 30 ký tự (kể cả khoảng trắng).
select * from hoc_sinh
where char_length(ho_ten_hs) = 30;
--    f. Những học sinh có họ tên với độ dài tối đa là 30 ký tự.
select * from hoc_sinh
where char_length(ho_ten_hs) <= 30;
--    g. Những học sinh có họ tên với độ dài tối đa là 30 ký tự và bắt đầu bằng ký tự N.
select * from hoc_sinh
where char_length(ho_ten_hs) <= 30 and ho_ten_hs like 'N%';
--    h. Những học sinh có họ tên bắt đầu bằng các ký tự: N, T, V.
select * from hoc_sinh
where ho_ten_hs like 'N%' or ho_ten_hs like 'T%' or ho_ten_hs like 'V%';
--     i. Những học sinh có họ tên không được bắt đầu bằng các ký tự: N, T, V.
select * from hoc_sinh
where ho_ten_hs not like 'N%' and ho_ten_hs not like 'T&' and ho_ten_hs not like 'V%';
--     j. Những học sinh có họ tên với phần họ có đúng 4 ký tự. --
select * from hoc_sinh
where ho_ten_hs like '____ %';
-------------------------------------------------------------------------
-- Hãy liệt kê
--    a. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh.
select * from hoc_sinh
order by ho_ten_hs asc ;
--    b. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo địa chỉ.
select * from hoc_sinh
order by dia_chi desc ;
--    c. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và giảm dần theo địa chỉ.
select * from hoc_sinh
order by ho_ten_hs asc, dia_chi desc;
--    d. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và tăng dần theo địa chỉ.
select * from hoc_sinh
order by ho_ten_hs asc, dia_chi asc;
--    e. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ.
select * from hoc_sinh
order by ho_ten_hs desc, dia_chi desc;
--    f. Thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ và tăng dần theo họ tên phụ huynh.
select * from hoc_sinh
order by ho_ten_hs desc, dia_chi desc,ho_ten_ph asc;
--    *** Trả lời thêm: Trong 2 từ khóa ASC và DESC, từ nào là không bắt buộc phải ghi rõ trong câu SELECT mà kết quả thực hiện vẫn đảm bảo tính đúng đắn?
-- asc
------------------------------------------------------------------------------------------------------------------------------------------------
-- Hãy liệt kê
--    a. Họ tên của toàn bộ học sinh trong trường, nếu họ tên nào trùng nhau thì chỉ hiển thị 1 lần.
select distinct ho_ten_hs from hoc_sinh;
--    b. Mã lớp của các lớp đã có học sinh học ở lớp đó. Nếu mã lớp nào trùng nhau thì chỉ hiển thị 1 lần.
select distinct ma_lop from hoc_sinh;
--    c. Mã môn học của những môn học đã có ít nhất 1 giáo viên được phân công phụ trách rồi. (*)
select distinct ma_mh
from phu_trach_bo_mon
where ma_mh is not null;
--    d. Mã môn học của những môn học đã từng được tổ chức thi ít nhất 1 lần.
select distinct ma_mh
from ket_qua_hoc_tap;
--    e. Mã giáo viên của những giáo viên đã từng làm chủ nhiệm cho ít nhất 1lớp nào đó.
select distinct ma_gvcn
from lop;
--------------------------------------------------------------------------------------------------------------------------------------------
-- Hãy liệt kê
--    a. Liệt kê ma_học_sinh, ho_ten_hoc_sinh, gioi_tinh, ma_lop, ten_lop, ma_gvcn của tất cả học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, 
       hs.ma_lop, l.ten_lop, l.ma_gvcn
from hoc_sinh hs
left join lop l on hs.ma_lop = l.ma_lop;
--    b. Liệt kê ma_học_sinh, ho_ten_hoc_sinh, hoc_ky, ma_mon_hoc, diem_thi_giua_ky, diem_thi_cuoi_ky của tất cả học sinh và các môn học có kết quả tương ứng với từng học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh,
       kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
from hoc_sinh hs
join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs;
--    c. Liệt kê ma_giao_vien, ho_ten_giao_vien, ma_lop, ma_mon_hoc, hoc_ky của những giáo viên đã được giao phụ trách ít nhất một môn học.
select distinct gv.ma_gv, gv.ho_ten_gv, p.ma_lop, p.ma_mh, p.hoc_ky
from giao_vien gv
join phu_trach_bo_mon p on gv.ma_gv = p.ma_gvpt;
--    d. Suy nghĩ về yêu cầu a ở trên: Nếu học sinh chưa được phân lớp thì liệu có liệt kê được học sinh đó không?
--    e. Suy nghĩ về yêu cầu b ở trên: Nếu học sinh chưa có kết quả thi của môn nào cả thì liệu có liệt kê được học sinh đó không?
--    f. Suy nghĩ về yêu cầu c ở trên: Nếu giáo viên chưa phụ trách một môn nào cả thì liệu có liệt kê được giáo viên đó không?
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Hãy liệt kê
--    a. MaHS, HoTenHS, GioiTinh, MaLop, TenLop, NamHoc, MaGVCN, HoTenGV (chủ nhiệm) của học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, 
       l.ma_lop, l.ten_lop, l.nam_hoc, gv.ma_gv as ma_gvcn, gv.ho_ten_gv as ten_gvcn
from hoc_sinh hs
join lop l on hs.ma_lop = l.ma_lop
join giao_vien gv on l.ma_gvcn = gv.ma_gv;
--    b. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, 
       mh.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
from hoc_sinh hs
join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs
join mon_hoc mh on kq.ma_mh = mh.ma_mh;
--   c. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, mh.ma_mh, mh.ten_mh,
       kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,
       p.ma_lop, gv.ma_gv, gv.ho_ten_gv
from hoc_sinh hs
join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs
join mon_hoc mh on kq.ma_mh = mh.ma_mh
join phu_trach_bo_mon p on kq.ma_mh = p.ma_mh and kq.hoc_ky = p.hoc_ky
join giao_vien gv on p.ma_gvpt = gv.ma_gv;
--    d. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
select kq.ma_hs, hs.ho_ten_hs, hs.ma_lop, lop.ma_gvcn, gv_chu_nhiem.ho_ten_gv as ho_ten_gv_chu_nhiem,
       kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,
       lop.ma_gvcn as ma_gv_phu_trach, gv_phu_trach.ho_ten_gv as ho_ten_gv_phu_trach
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
join giao_vien gv_chu_nhiem on lop.ma_gvcn = gv_chu_nhiem.ma_gv
join mon_hoc mh on kq.ma_mh = mh.ma_mh
left join giao_vien gv_phu_trach on lop.ma_gvcn = gv_phu_trach.ma_gv;
--    e. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của những học sinh nữ với các môn học đã có kết quả thi cuối kỳ hoặc giữa kỳ được 9 điểm trở lên.
select kq.ma_hs, hs.ho_ten_hs, hs.ma_lop, lop.ma_gvcn, gv_chu_nhiem.ho_ten_gv as ho_ten_gv_chu_nhiem,
       kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,
       lop.ma_gvcn as ma_gv_phu_trach, gv_phu_trach.ho_ten_gv as ho_ten_gv_phu_trach
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
join giao_vien gv_chu_nhiem on lop.ma_gvcn = gv_chu_nhiem.ma_gv
join mon_hoc mh on kq.ma_mh = mh.ma_mh
left join giao_vien gv_phu_trach on lop.ma_gvcn = gv_phu_trach.ma_gv
where (kq.diem_thi_cuoi_ky >= 9 or kq.diem_thi_giua_ky >= 9) and hs.gioi_tinh = 'nữ';
--    f. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường. Với điều kiện là chỉ hiển thị những môn học mà giáo viên phụ trách môn đó cũng chính là giáo viên chủ nhiệm của lớp.
select kq.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,
       hs.ma_lop, lop.ma_gvcn, gv_chu_nhiem.ho_ten_gv as ho_ten_gv_chu_nhiem
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
join giao_vien gv_chu_nhiem on lop.ma_gvcn = gv_chu_nhiem.ma_gv
join mon_hoc mh on kq.ma_mh = mh.ma_mh
left join phu_trach_bo_mon ptbm on lop.ma_gvcn = ptbm.ma_gvpt and mh.ma_mh = ptbm.ma_mh and kq.hoc_ky = ptbm.hoc_ky
where ptbm.ma_gvpt is not null;
--    g. MaMH, MaLop, HocKy của những môn học đã được thi cuối kỳ vào năm 2023
select kq.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
where year(kq.ngay_gio_thi_cuoi_ky) = 2023;
--    h. MaMH, MaLop, HocKy của những môn học đã được thi vào tháng 8 năm 2023
select kq.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
where year(kq.ngay_gio_thi_cuoi_ky) = 2023 and month(kq.ngay_gio_thi_cuoi_ky) = 8;
--    i. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023
select kq.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
where kq.ngay_gio_thi_cuoi_ky < '2023-08-20';
--    j. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023 đúng 1 tuần.
select kq.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
where kq.ngay_gio_thi_cuoi_ky >= '2023-08-13' and kq.ngay_gio_thi_cuoi_ky < '2023-08-20';
--    k. MaMH, MaLop, HocKy của những môn học đã được thi sau ngày 20 tháng 8 năm 2023 đúng 21 ngày.
select kq.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
where kq.ngay_gio_thi_cuoi_ky >= '2023-09-10' and kq.ngay_gio_thi_cuoi_ky <= '2023-10-01';
--    l. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ ngày 10 đến ngày 20 tháng 8 năm 2023.
select kq.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
where kq.ngay_gio_thi_cuoi_ky >= '2023-08-10' and kq.ngay_gio_thi_cuoi_ky <= '2023-08-20';
--    m. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ 10 giờ 00 phút ngày 10 đến 20 giờ 30 phút ngày 20 tháng 8 năm 2023.
select kq.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
where kq.ngay_gio_thi_cuoi_ky >= '2023-08-20 10:00:00' and kq.ngay_gio_thi_cuoi_ky <= '2023-08-20 20:30:00';
--------------------------------------------------------------------------------------------------------------------------------------------
-- Hãy liệt kê:
-- a. Liệt kê những địa chỉ khác nhau trong bảng hoc_sinh (bằng 2 cách khác nhau) ()
-- cách 1: distinct
select distinct dia_chi from hoc_sinh;
-- cách 2: group by
select dia_chi
from hoc_sinh
group by dia_chi;
-- b. Liệt kê ho_ten_hs, gioi_tinh của các nhóm được phân nhóm theo ho_ten_hs và gioi_tinh trong bảng hoc_sinh.
select ho_ten_hs, gioi_tinh 
from hoc_sinh
group by ho_ten_hs, gioi_tinh;
-- c. Liệt kê ho_ten_hs của các nhóm được phân nhóm theo ho_ten_hs và gioi_tinh trong bảng hoc_sinh. Chú ý thử giải thích vì sao không liệt kê gioi_tinh mà vẫn không bị lỗi. ()
select ho_ten_hs
from hoc_sinh
group by ho_ten_hs, gioi_tinh;
-- vì 
-- d. Liệt kê ma_mh, ten_mh, diem_thi_cuoi_ky của từng môn học chia theo từng mức điểm thi cuối kỳ. (Gợi ý: chỉ liệt kê những môn đã từng có học sinh thi cuối kỳ). ()
select mh.ma_mh, mh.ten_mh, kq.diem_thi_cuoi_ky
from ket_qua_hoc_tap kq
join mon_hoc mh on mh.ma_mh = kq.ma_mh
where kq.diem_thi_cuoi_ky is not null
group by mh.ma_mh, mh.ten_mh, kq.diem_thi_cuoi_ky;
-- e. Liệt kê ma_gv, ten_gv của những giáo viên đã từng được phân công phụ trách ít nhất 1 môn học. Nếu ma_gv, ten_gv trùng lặp nhiều lần thì chỉ hiển thị ra 1 lần trong kết quả trả về.
select distinct ma_gv, ho_ten_gv from giao_vien join phu_trach_bo_mon on giao_vien.ma_gv = phu_trach_bo_mon.ma_gvpt;
-- f. Liệt kê tháng và năm của những tháng và năm đã có ít nhất 1 học sinh tham gia thi cuối kỳ (đã có diem_thi_cuoi_ky rồi). ()
select month(ket_qua_hoc_tap.ngay_gio_thi_cuoi_ky) as thang, year(ket_qua_hoc_tap.ngay_gio_thi_cuoi_ky) as nam
from ket_qua_hoc_tap
where ket_qua_hoc_tap.diem_thi_cuoi_ky is not null
group by thang, nam;
-- g. Liệt kê họ tên của những học sinh có địa chỉ ở Hải Châu và từng thi (giữa kỳ hoặc cuối kỳ) ít nhất 1 lần. Nếu họ tên trùng lặp thì chỉ hiển thị ra 1 lần trong kết quả trả về. Yêu cầu: Không được sử dụng từ khoá DISTINCT.
select hoc_sinh.ho_ten_hs
from hoc_sinh 
join ket_qua_hoc_tap on hoc_sinh.ma_hs = ket_qua_hoc_tap.ma_hs
where hoc_sinh.dia_chi = 'Hải Châu' and ket_qua_hoc_tap.diem_thi_giua_ky is not null and ket_qua_hoc_tap.diem_thi_cuoi_ky is not null 
group by hoc_sinh.ho_ten_hs;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Hoc sinh chưa từng thi môn nào
select ho_ten_hs
from hoc_sinh
where ma_hs not in (select distinct ma_hs from ket_qua_hoc_tap);
-- b. Giáo viên chưa từng phụ trách môn học nào
select ho_ten_gv
from giao_vien
where ma_gv not in (SELECT DISTINCT ma_gv FROM phu_trach_bo_mon);
-- Câu c Giáo viên chưa từng chủ nhiệm lớp nào --
select ho_ten_gv
from giao_vien
where ma_gv not in (SELECT DISTINCT ma_gvcn FROM lop);
-- Câu D --
select ten_mh
from mon_hoc
where ma_mh not in( select distinct ma_mh from ket_qua_hoc_tap);
-- e. Đếm xem tương ứng với mỗi địa chỉ (của học sinh), số lượng học sinh đang ở mỗi địa chỉ là bao nhiêu em. Chỉ hiển thị kế tqua cho những địa chỉ có ít nhất 5 học sinh đang ở đó
select dia_chi, count(*) AS so_luong
from hoc_sinh
group by dia_chi
having so_luong >= 5;
-- f. Liệt kê điểm thi trung bình của từng môn học (dựa vào điểm thi cuối kỳ mà các học sinh đã từng thi). Chỉ liệt kê những môn có điểm trung bình từ 5 đến 10
select mh.ten_mh, avg(kq.diem_thi_cuoi_ky) as diem_trung_binh
from mon_hoc mh
join ket_qua_hoc_tap kq ON mh.ma_mh = kq.ma_mh
group by mh.ma_mh, mh.ten_mh
having diem_trung_binh between 5 and 10;
-- g. Tính điểm thi trung bình của từng học sinh trong trường. Chỉ tính điểm trung bình cho những học sinh đã từng thi cuối kỳ cho ít nhất 1 môn. Dựa vào cột điểm thi cuối kỳ để tính. Chỉ hiển thị những học sinh có điểm trung bình trên 8
select hs.ma_hs, hs.ho_ten_hs, avg(kq.diem_thi_cuoi_ky) as diem_trung_binh
from hoc_sinh hs
join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs
group by hs.ma_hs, hs.ho_ten_hs
having diem_trung_binh > 8;
----------------------------------------------------------------------------------------------------------------------------
-- ọc sinh nam ở Thanh Khê và học sinh nữ ở Hải Châu (theo 2 cách khác nhau)
SELECT ho_ten_hs, gioi_tinh, dia_chi
FROM hoc_sinh
WHERE gioi_tinh = 'Nam' AND dia_chi LIKE '%Thanh Khê%'
UNION
SELECT ho_ten_hs, gioi_tinh, dia_chi
FROM hoc_sinh
WHERE gioi_tinh = 'Nữ' AND dia_chi LIKE '%Hải Châu%';
---------------------------------------------------------------
SELECT ho_ten_hs, gioi_tinh, dia_chi
FROM hoc_sinh
WHERE (gioi_tinh = 'Nam' AND dia_chi LIKE '%Thanh Khê%')
   OR (gioi_tinh = 'Nữ' AND dia_chi LIKE '%Hải Châu%');

-- b. Họ tên của học sinh và giáo viên trong toàn trường
SELECT ho_ten_hs AS ho_ten, NULL AS nghiep_ngh, NULL AS ho_ten_gv
FROM hoc_sinh
UNION
SELECT NULL AS ho_ten, NULL AS nghiep_ngh, ho_ten_gv
FROM giao_vien;

-- c. Họ tên, nghề nghiệp của học sinh và giáo viên trong toàn trường. (Nghề nghiệp bao gồm: học sinh hoặc giáo viên)
SELECT ho_ten_hs AS ho_ten, 'Học sinh' AS nghe_nghiep
FROM hoc_sinh
UNION ALL
SELECT ho_ten_gv AS ho_ten, 'Giáo viên' AS nghe_nghiep
FROM giao_vien;

-- d. Những học sinh đang học ở năm học 2019-2020 và những học sinh chưa từng thi môn Toán và môn Tiếng Việt 
SELECT DISTINCT hs.ma_hs, hs.ho_ten_hs
FROM hoc_sinh hs
JOIN lop l ON hs.ma_lop = l.ma_lop
WHERE l.nam_hoc = '2019-2020'
  AND hs.ma_hs NOT IN (
      SELECT ma_hs
      FROM ket_qua_hoc_tap kq
      JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
      WHERE mh.ten_mh IN ('Toán', 'Tiếng Việt')
  );

-- e. Thống kê điểm thi trung bình (của tất cả học sinh và tất cả các môn) theo từng tháng (đầy đủ 12 tháng, từ tháng 1 đến tháng 12) trong năm 2019. 
-- Chỉ tính điểm trung bình dựa vào điểm thi cuối kỳ của các môn
-- dùng cột ngày: ngay_gio_thi_cuoi_ky (DATE/DATETIME)
SELECT
  t.thang,
  ROUND(AVG(kq.diem_thi_cuoi_ky),2) AS diem_tb_thang
FROM (
  SELECT 1 AS thang UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
  UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12
) AS t
LEFT JOIN ket_qua_hoc_tap kq
  ON MONTH(kq.ngay_gio_thi_cuoi_ky) = t.thang
  AND YEAR(kq.ngay_gio_thi_cuoi_ky) = 2019
GROUP BY t.thang
ORDER BY t.thang;
------------------------------------------------------------------------------------------------------------------------
-- a. ma_lop, ten_lop, ma_gvcn, ho_ten_gv (chủ nhiệm) của tất cả các lớp trong trường. (Gợi ý: tất cả các lớp nghĩa là kể cả những lớp chưa được phân công GVCN).
SELECT l.ma_lop, l.ten_lop, l.ma_gvcn, gv.ho_ten_gv AS ho_ten_gvcn
FROM lop l
LEFT JOIN giao_vien gv ON l.ma_gvcn = gv.ma_gv;

-- b. ma_hs, ho_ten_hs, hoc_ky, ma_mh, ten_mh, diem_thi_giua_ky, diem_thi_cuoi_ky của tất cả học sinh trong trường.
SELECT hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, mh.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
FROM hoc_sinh hs
LEFT JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
LEFT JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh;

-- c. ma_hs, ho_ten_hs, ma_lop, ten_lop, ma_gvcn, ho_ten_gv (Chủ nhiệm) của tất cả học sinh trong trường. (Chú ý những trường hợp: học sinh chưa được phân lớp và lớp chưa được phân GVCN).
SELECT hs.ma_hs, hs.ho_ten_hs, l.ma_lop, l.ten_lop, l.ma_gvcn, gv.ho_ten_gv AS ho_ten_gvcn
FROM hoc_sinh hs
LEFT JOIN lop l ON hs.ma_lop = l.ma_lop
LEFT JOIN giao_vien gv ON l.ma_gvcn = gv.ma_gv;

-- d. ma_gv, ho_ten_gv, ma_lop, ten_lop, ma_mh, hoc_ky, ten_mh của tất cả giáo viên trong trường.
SELECT gv.ma_gv, gv.ho_ten_gv, l.ma_lop, l.ten_lop,mh.ma_mh, NULL AS hoc_ky, mh.ten_mh
FROM giao_vien gv
LEFT JOIN lop l ON gv.ma_gv = l.ma_gvcn
LEFT JOIN mon_hoc mh ON 1=1  
LIMIT 0, 1000;
-------------------------------------------------------------------------------------------------------------------------------
-- a. Lấy danh sách các học sinh có kết quả thi môn Toán học trong học kỳ 1
select ho_ten_hs
from hoc_sinh
where exists (
    select 1
	from ket_qua_hoc_tap
    where hoc_sinh.ma_hs = ket_qua_hoc_tap.ma_hs
      and ket_qua_hoc_tap.ma_mh = 'MH001'
      and ket_qua_hoc_tap.hoc_ky = 'Học kỳ 1'
);
-- b. Lấy danh sách các giáo viên chủ nhiệm có ít nhất một lớp học
select ho_ten_gv
from giao_vien
where exists (
    select 1
    from lop
    where giao_vien.ma_gv = lop.ma_gvcn
);
-- c. Lấy thông tin các học sinh thuộc lớp 1A hoặc lớp 1B
select ho_ten_hs
from hoc_sinh
where ma_lop in ('L0001', 'L0003');
-- d. Lấy thông tin các học sinh có điểm thi môn Toán học trong học kỳ 1 nằm trong danh sách (8.0, 8.5, 9.0)
select ho_ten_hs
from hoc_sinh
where ma_hs in (
    select ma_hs
    from ket_qua_hoc_tap
    where ma_mh = 'MH001'
      and hoc_ky = 'Học kỳ 1'
      and diem_thi_cuoi_ky in (8.0, 8.5, 9.0)
);	