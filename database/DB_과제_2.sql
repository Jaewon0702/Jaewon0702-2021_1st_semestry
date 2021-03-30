drop database if exists 이재원;
create database 이재원;
use 이재원;

create table 이재원_department(
id char(10) not null,
dname char(20)
);

create table 이재원_student(
id int not null,
Sname char(10),
major char(20),
adress char(20),
gpa float,
bdate char(20),
primary key(Id)
);

create table 이재원_course(
id char(10) not null,
Cname char(20),
instructor char(10),
prerequisite char(10), 
##foreign key(prerequisite) references 이재원_course(id),
primary key(id)
);

create table 이재원_course_taken(
tid int not null auto_increment,
sid int not null,
cid char(10) not null,
grade int,
year int,
foreign key(sid) references 이재원_student(id),
foreign key(cid) references 이재원_course(id),
primary key(tid)
);


create table 이재원_instructor(
pid char(10) not null,
pname char(10),
dept char(10),
primary key(pid)
);
insert into 이재원_student
values (32193430, '이재원', '산업공학과', '대전광역시', 4.45, '2000-07-02'), 
(32191111, '돈키호테', '사학과', '서울특별시', 4.1, '1999-02-01'), 
(32202222, '폰 노이만', '소프트웨어학과', '광주광역시', 3.8, '2001-09-23'),
(32213333, '니체', '철학과', '울산광역시', 4.2, '2001-04-02');

insert into 이재원_course
values (452660, '데이터베이스기초', '이석균', null ), 
(339170, '멀티미디어시스템', '박규식', null), 
(527790, '객체지향프로그래밍', '이계성', 524840),
(524840, '고급프로그래밍', '이계성', null),
(405580, '제조공학', '김경룡', null ),
(493030, '산업제어', '김경룡', 405580),
(343540, '뮬류관리', '장영철', null),
(480500, '공학과 예술', '임아론', null);

insert into 이재원_course_taken (sid, cid, grade, year)
values();
Select * from 이재원_student;
Select * from 이재원_course;
Select * from 이재원_course_taken;
