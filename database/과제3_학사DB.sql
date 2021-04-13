use 학사DB;
-- (1) 이장택 교수가 강의한 과목을 수강한 학생들의 이름과 수강 과목명 그리고 소속 전공 명을 구하라. 전공이 미정인 학생들도 포함하시오.

select s.name as '이름', c.name as '과목명', d.name as '전공명 ', i.name
from instructor i, course c, course_taken ct, student s, department d   
where i.name = '이장택' and i.pid = c.instructor and c.id = ct.cid and ct.sid = s.id
and s.major = d.id;

select s.name as '이름', c.name as '과목명', d.name as '전공명 ', i.name
from (((instructor i join course c on c.instructor = i.pid) 
join course_taken ct on c.id = ct.cid)
join student s on ct.sid = s.id) 
left outer join department d on s.major = d.id    
where i.name = '이장택';

-- (2) 통계 학과에서 개설된 과목(즉, 통계학 과목)을 한 과목도 수강하지 않은 학생의 이름을 구하라.
-- 전체 - 한 번이라도 통계수업 들은 사람
select s.name 
from student s
where s. id not in(
select ct.sid
from course_taken ct, course c, instructor i, department d, student s
where ct.cid = c.id and c.instructor = i.pid and i.dept = d.id and d.id = 'ss');

-- (3) 1997년과 1998년에 한 번도 수강되지 않은 과목번호와 과목명을 구하라. 
select c.id, c.name, ct.year_taken
from course_taken ct, course c
where not (ct.year_taken between 1997 and 1998) and ct.cid = c.id;


-- (4) 기초전산과 데이타베이스를 둘 다 수강한 학생들의 이름을 구하라
select s.name
from student s 
where s.id in 
(select ct.sid from course c, course_taken ct where c.name = '기초전산' and c.id = ct.cid) 
and s.id in 
(select ct.sid from course c, course_taken ct where c.name = '데이타베이스' and c.id = ct.cid); 


select * from course;
select * from course_taken;
select * from department;
select * from instructor;
select * from student;