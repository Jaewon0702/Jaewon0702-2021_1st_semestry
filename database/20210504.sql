/*
1. 데이터의 입력
- 직접 입력
insert into Student(id, name)
values('990909', '임꺽정') */
--  select에 대한 입력
insert into ScholarshipStudent(id, major, gpa)
select S.id, S.major, S.gpa
from Student
Where gpa >= 3.5; 

/* 2. 데이터의 삭제
delete from Student
where gpa <= 0.3;
3. 데이터의 수정
update ScholarshipStudent
set amount = 5000000 --set절의 내용대로 수정한다! amount를 5000000으로 수정!
where gpa > 4.0;*/
-- 4. insert, update 보충
use classicmodels;
-- 주문한 적 없는 고객을 삭제(customers에는 존재하지만 orders에는 존재 X)
select c.customerNumber, c.customerName, o.orderNumber
from customers c left join orders o
on c.customerNumber = o.customerNumber
where o.orderNumber is null;
start transaction;
/*delete c
from customers c left join orders o
on c.customerNumber = o.customerNumber
where o.orderNumber is null;*/
rollback;
-- 판매담당자가 없는 고객에게 임의의 담당자를 배정! 기말고사에 유사한 문제 나올 듯 ppt 6.
-- order by rand() -- 반환내용을 임의의 순서로! update문에 중첩 select문에 빠진 거 추가해!

-- 6. sql 무결성 제약 조건, 뷰, 트리거
-- 외래 키 제약조건 중요!
/*
외래키 제약조건
외래 키 값이 null이거나 null이 아니라면 외래 키의 값과 같은 값을 기본키 값으로 갖는 투플이 부모 테이블에 존재!
외래키 제약조건 위반 경우
DBMS의 정책

table on delete set null;
테이블에서 삭제 시, Student에서 해당 외래 키 값을 null로 설정;
*/

