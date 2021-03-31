drop database if exists 이재원;
create database 이재원;
use 이재원;

create table 이재원_department(
id char(10) not null,
dname char(20),
primary key(id)
);

create table 이재원_instructor(
id char(10) not null,
name char(10),
dept char(10),
primary key(id)
);

create table 이재원_student(
id int not null,
Sname char(10),
dept char(10) not null,
adress char(20) default null,
gpa float default null,
bdate char(20) default null,
foreign key(dept) references 이재원_department(id),
primary key(id)
);

create table 이재원_course(
id char(10) not null,
Cname char(20),
instructor char(10) not null,
prerequisite char(10) default null, 
foreign key(instructor) references 이재원_instructor(id),
primary key(id)
);

create table 이재원_course_taken(
id int not null auto_increment,
sid int not null,
cid char(10) not null,
grade int,
year int,
foreign key(sid) references 이재원_student(id),
foreign key(cid) references 이재원_course(id),
primary key(id)
);
insert into 이재원_department values
('ie', '산업공학과'),
('sw', '소프트웨어학과'),
('ht', '사학과'),
('ph', '철학과');

insert into 이재원_instructor values
('sw01', '이계성', '소프트웨어학과'),
('sw02', '이석균', '소프트웨어학과'),
('sw03', '박규식', '소프트웨어학과'),
('ie01', '김경룡','산업공학과'),
('ie02', '장영철','산업공학과'),
('ie03', '임아론','산업공학과');

insert into 이재원_student values 
(32193430, '이재원', 'ie', '대전광역시', 4.45, '2000-07-02'), 
(32191111, '돈키호테', 'ht', '서울특별시', 4.1, '1999-02-01'), 
(32202222, '폰 노이만', 'sw', '광주광역시', 3.8, '2001-09-23'),
(32213333, '니체', 'ph', '울산광역시', 4.2, '2001-04-02');

insert into 이재원_course values
(452660, '데이터베이스기초', 'sw02', null ), 
(339170, '멀티미디어시스템', 'sw03', null), 
(527790, '객체지향프로그래밍', 'sw01', 524840),
(524840, '고급프로그래밍', 'sw01', null),
(405580, '제조공학', 'ie01', null ),
(493030, '산업제어', 'ie01', 405580),
(343540, '물류관리', 'ie02', null),
(480500, '공학과 예술', 'ie03', null);

insert into 이재원_course_taken (sid, cid, grade, year) values
(32193430, 452660, 3, 2020),
(32193430, 339170, 3, 2020),
(32193430, 405580, 3, 2020),
(32193430, 493030, 3, 2020),
(32213333, 339170, 3, 2020),
(32213333, 405580, 3, 2019),
(32213333, 339170, 3, 2020),
(32202222, 524840, 3, 2020),
(32213333, 339170, 3, 2020),
(32191111, 339170, 3, 2020);


Select * from 이재원_student;
Select * from 이재원_course;
Select * from 이재원_course_taken;
select * from 이재원_instructor;
select * from 이재원_department;
