use pubs;

select title
from titles 
where pub_id not in(
select pub_id
from publishers
where pub_name = "New Moon Books");

select t.title
from titles t natural join publishers p
where p.pubs_name = "New Moon Books";


/*select s.name from student s where s.gpa > (select max(ct.grade))
from course_taken c1 where;*/

select * from authors;
select * from publishers;
select * from titles;
select * from titleauthor;
select * from employee;
select * from jobs;

use 학사DB;
select c.name
from course c
where exists(
select * from course c1
where c.prerequisite = c1.id);
-- 위랑 아래랑 같운 문제에 대한 해답!
select c.name
from course c join course c1 on c.prerequisite = c1.id;
