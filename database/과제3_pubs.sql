-- C. pubs 데이터베이스에 대한 질의문들이다. 이를 각각 SQL로 표현하시오.
use pubs;
-- (1) 'Binnet & Hardley' 명칭의 출판사에서 출판한 책 이름을 구하시오.
select t.title
from titles t, publishers p
where p.pub_name = 'Binnet & Hardley' and p.pub_id = t.pub_id;

select t.title
from titles t join publishers p 
on p.pub_name = 'Binnet & Hardley' and p.pub_id = t.pub_id;
/* (2) pubs 데이터베이스에서 날짜는 date으로 표현되며 date 타입의 데이터는 
다양한 함수들을 통해 연, 월, 일, 시간 등의 정보를 각각 추출할 수 있다. 
1990년과 1991년에 고용된 직원들에 대해 직원 명을 성과 이름과 맡은 직책을 반환하시오. 
 단 직원 명은 fname과 lname 순으로 하나의 문자열(string)로 반환하시오 */
 select e.lname, e.fname, j.job_desc
 from employee e join jobs j
 on year(e.hire_date) between 1990 and 1991 and e.job_id = j.job_id;
 
 select
select * from authors;
 select * from publishers;
 select * from titles;
 select * from employee;
 select * from jobs;