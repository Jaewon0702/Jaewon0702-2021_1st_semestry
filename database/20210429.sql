/* 과제 5
(1)시험문제랑 비슷한 문제
(2)sales 3개의 기본 키, 
inner join 쓰는 거

B. 
(1) orders 이거도 시험 문제! 

Exists S
S가 공집합이면 False
Except는 mysql에서 지원 X!
join 개념은 exists 개념을 포함한다!
모든 전산학과목을 수강한 학생들의 학번과 이름?
{a,b,c} - {a,b,c,d,e,h} = 공집합
ppt 17, 18 division 관련 문제는 시험에 안 나와!
unique도 mysql에서 지원하지 않아!
not vice versa 반대의 경우는 존재하지 않는다!
from절의 중첩 질의 : 가상테이블 생성!alter
Restrict/ Cascade는 mysql에서 
문법은 지원하나 작동은 안 해! 
*/
use pubs;
select count(*) from titles;
select distinct t.title from titles t 
join sales s on t.title_id = s.title_id;
-- 위와 아래는 같은 내용!
select t.title from titles t
where exists(select * from 
sales s where t.title_id = s.title_id);

use 학사DB;
show create table student;
Alter table Student Add ssn char(13);
Alter table Student Alter address drop default;
Alter table Student Alter gpa set default 0.0;
Alter Table Student Drop
foreign key FK_Student_Department; 