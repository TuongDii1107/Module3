create database java05_sqc;

use java05_sqc;

create table student (
	id int primary key auto_increment,
    name varchar(50) not null,
    score double
);

insert into student (name, score) values ('Lợi', 2);
insert into student (name, score) values ('Linh', 3);


select name, score from student;
select id, name, score from student;
select * from student;

select * from  student where id = 2;
delete from student where id = 1;

insert into student (name, score) values ('Vy', 8);
insert into student (name, score) values ('Hoàng', 3);
insert into student (name, score) values ('Linh', 6);

update student
set score = 9 
where id = 3;

update student
set score = 8
where id = 5;

alter  table student
add adress varchar (50);