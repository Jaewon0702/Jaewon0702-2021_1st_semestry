/*
6장
무결성 제약 조건
이 부분 중요!
1. 도메인 제약 조건
check constraint
- 각 열에 대한 제약
- 테이블에 대한 제약
2. 외래키 제약 조건
유지 정책
set default는 mysql에서 지원 X
ex1. 없는 부서 번호로 직원을 삽입하는 경우
insert into employee values
(5000, 'test, 'test', 5, 50000000000) -- 오류!

-- ex 2 : 부모 테이블의 행의 삭제(1번 부서 삭제)
delete from department where deptNo = 1; -- 오류!




*/