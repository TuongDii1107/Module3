create database store_management;

use store_management;

create table product (
		id int primary key auto_increment,
        name varchar(50) not null,
        description varchar(100) null,
        price double null,
        stock int null
);

INSERT INTO product
VALUES (NULL, 'Laptop Dell', 'Ultra cao cấp', 20000000, 5);

INSERT INTO product (name, description, price, stock)
VALUES ('Airpod Pro 2', 'airpod chính hãng', 3000000, 40);

INSERT INTO product (name)
VALUES ('Tai nghe Sony WH-1000XM5');

SELECT * FROM product;

SELECT id, name, price FROM product;

SELECT id, name, price
FROM product
WHERE price < 10000000;

SET sql_safe_updates = 0;
UPDATE product
SET stock = 50;
SET sql_safe_updates = 1;

SET sql_safe_updates = 0;
UPDATE product
SET price = 2700000
WHERE name = 'Chuột Logitech MX Master 3';
SET sql_safe_updates = 1;

ALTER TABLE product
ADD COLUMN barcode VARCHAR(50) NULL;

ALTER TABLE product
ADD COLUMN warranty VARCHAR(20) DEFAULT '6 tháng';

DELETE FROM product
WHERE id = 2;

DELETE FROM product;