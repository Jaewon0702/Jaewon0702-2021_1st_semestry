drop database if exists BachelorDB;
create database BachelorDB;
use BachelorDB;

create table student(
Id int,
StdName char(10),
Major char(20),
primary key(Id)

);

create table course(
CourseNo int,
CsName char(20),
Instructor char(10),
primary key(CourseNo)
);

create table course_taken(
CNo mediumint not null auto_increment,
Id int,
CourseNo int,
Grade char(3),
foreign key(Id) references student(Id),
foreign key(CourseNo) references course(CourseNo),
primary key(CNo)
);

insert into Student
values (32193430, '이재원', '산업공학과'), (32191111, '돈키호테', '사학과'), (32202222, '노이만', '소프트웨어학과');

insert into Course
values (452660, '데이터베이스기초', '이석균'), (339170, '멀티미디어시스템', '박규식'), (527790, '객체지향프로그래밍', '이계성');

insert into Course_taken (Id, CourseNo, Grade)
values (32193430, 452660, 'A'), (32193430, 339170, 'A'), (32191111, 452660,'B'), (32191111, 527790, 'C'), (32202222, 452660, 'B');
 
Select * from student;
Select * from course;
Select * from course_taken;

Select student.stdName, course.CsName, course_taken.grade
From student, course, course_taken
Where student.Id = course_taken.Id and course.CourseNo = course_taken.CourseNo;



