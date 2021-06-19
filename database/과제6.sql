-- 1. 다음의 요구사항대로 명령문을 작성하고 이를 실행 후 결과를 보이시오.
use 학사DB;
select * from student;
select * from course_taken;
select * from course;
select * from instructor;
-- (a) Student의 gpa를 모두 0.0으로 수정하시오.
update Student
set gpa = 0.0;
-- (b) 현재 course_taken의 내용을 기반으로 각 학생의 gpa를 계산 후 수정하는 update문을 쓰시오. 
create view avg_grade -- 각 학생의 gpa를 계산한 view 생성!
as (select sid, avg(grade) as aver from course_taken group by sid);

update student s join avg_grade a
on s.id = a.sid
set s.gpa = a.aver;

-- 2. 학생 테이블에 Instructor에 대한 외래키인 advisor라는 속성을 추가하고자 한다.
-- (a) 위의 내용을 추가하는 명령문들을 쓰시오.

alter table student drop advisor;
alter table student add column advisor char(10) null; 
-- student에 advisor 속성 추가

alter table student drop
foreign key FK_STUDENT_INSTRUCTOR;

alter table student add
constraint FK_STUDENT_INSTRUCTOR
foreign key(advisor) references instructor(pid)
on delete set null on update cascade;
-- advisor를 instructor의 외래키로 설정!
-- (b) 같은 학과 교수로 advisor(지도교수)를 배정하는데 이는 임의 순서로 처리하고, 전공이 미정인 학생들의 지도교수는 null로 표현하시오. 이를 위한 명령문을 쓰고 처리 결과를 보이시오.
drop view rand_inst;
create view rand_inst 
as (select pid, dept from instructor order by rand());
select * from rand_inst;

 update student s join rand_inst ri on ri.dept = s.major
 set advisor = ri.pid
 where s.major is not null;

-- 3. 과목번호는 종종 교육과정의 변화에 따라 수정되며, 그리고 외부 강사는 수급에 따라 수시로 변경된다. 이를 전제로 다음 문제에 답하시오.
-- (a) 과목번호의 수정 시 다른 테이블에 자동 반영되도록, 그리고 강사가 삭제되었을 때 과목 테이블에서 강사번호에 대한 외래키를 NULL로 설정될 수 있도록 외래키 제약조건들을 수정하시오. 
alter table course drop
foreign key fk_Prerequisite_Course;

alter table course add -- course(id)의 update가 prerequisite에 반영되도록
CONSTRAINT fk_Prerequisite_Course 
foreign key(prerequisite) references course(id) 
on delete no action
on update cascade;

alter table course_taken drop
foreign key fk_CourseTaken_Course;

alter table course_taken add -- course(id)의 update가 course_taken에 반영되도록
CONSTRAINT fk_CourseTaken_Course foreign key(cid) references course(id)
on delete set null
on update cascade;

alter table course drop
foreign key fk_Course_Instructor;

alter table course add -- instructor pid가 삭제되면 course의 instructor는 null로 바뀐다.
Constraint fk_Course_Instructor 
foreign key(instructor) references instructor(pid)
on delete set null;
-- (b) 위의 내용이 제대로 처리되는 경우의 예를 보이시오.
-- course의 id가 변경되는 경우
select * from course_taken;
select * from course;
update course
set id = 'cs_이재원'
where name = '기초전산';
select * from course_taken;
select * from course;

-- instructor의 pid가 삭제되는 경우
select * from instructor;
select * from course;

delete from instructor where pid = 'cs10';

select * from instructor;
select * from course;



-- (c) 위의 내용이 제대로 처리되지 않는 경우도 존재한다. 어떤 경우인지 설명하시오. 
select * from course_taken;
select * from course;
update course
set id = 'cs_이재원'
where name = '자료구조론';
select * from course_taken;
select * from course;


-- 4. 학생들의 성적 조회 용 뷰를 생성하고 이를 통해 자신의 수강 과목들의 성적을 조회하려고 한다. 뷰의 정의는 courseRecord(student_id, student_name, course_name, course_grade)으로 이루어진다. 
-- (a) view를 생성하는 명령문을 보이시오.
drop view courseRecord;

create algorithm=merge view courseRecord(student_id, student_name, course_name, course_grade) as
select s.id, s.name, c.name, ct.grade
from student s, course c, course_taken ct 
where ct.sid = s.id and ct.cid = c.id
with check option;

select * from courseRecord;


select * from student;
select * from course;
select * from course_taken;
-- (b) 이를 통해 특정 학생의 수강 과목들의 성적을 조회하는 예제와 실행 결과를 보이시오. 
select * from courseRecord where student_id = '930405';
-- (c) courseRecord에 insert문이 실행가능한지 여부를 적고 불가능하면 이유를 쓰고 가능하면 실행예제를 보이시오.
insert into courseRecord(student_id, student_name, course_name, course_grade) values
('32193430', '이재원', '데이터베이스', '4');

/*It's Impossible. Because for a multiple-table updatalble view, INSERT can work if it inserts into single table.
 */
-- (d) courseRecord에 delete문이 실행가능한지 여부를 적고 불가능하면 이유를 쓰고 가능하면 실행예제를 보이시오.
delete from courseRecord
where student_name = '이재원';
/*It's Impossible. Because Join views not allowed.
*/
-- (e) courseRecord의 각 속성에 대해 update문을 적용하려고 한다. 어떤 속성인 경우 가능한지를 쓰고 예를 보이고 불가능한 속성인 경우는 그 이유를 쓰시오.
/*
각 속성이 updatable하면 update문을 적용할 수 있다.
속성이 다음의 요소를 포함하면 update문을 적용할 수 없다.
1) Aggregate functions such as min, max, avg and count
2) distinct
3) group by
4) having
5) union
6) left join or outer join
7) Subquery in the select or where
8) non-updatable view in the From clause.
9) Reference only to literal values
10) Multiple references to any column of the base table.
*/
select table_name, is_updatable
from information_schema.views
where table_schema = '학사DB';

update courseRecord
set student_name = '이재원'
where student_id = '930405';
select * from courseRecord;