drop database if exists company;
create database company;
use company;

create table department(
DeptNo int,
DeptName char(20),
Floor int,
primary key(DeptNo)
);

insert into department
values (1, '영업', 8), (2, '기획', 10), (3, '개발', 9);
select * from department;

create table Employee(
EmpNo smallint,
EmpName char(10),
Title char(10),
DNo int,
Salary int,
Primary key(EmpNo),
foreign key(DNo) references department(DeptNo)
);

insert into Employee
values (2106, '김창섭', '대리', 2, 200), (3426, '박영권', '과장', 3, 250)
,(2011, '이수민', '부장', 1, 300);

select * from employee;

use Information_schema;
show tables;
select * from tables where table_schema = "company";