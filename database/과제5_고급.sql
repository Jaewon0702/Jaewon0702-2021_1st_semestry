-- A. pubs 데이터베이스에 대한 질의문들이다. 이를 각각 SQL로 표현하시오.
use pubs;
-- (1) 현재 직원(employee)는 출판사에 관계없이 하나의 테이블에 저장되어 있다. 각 출판사 명 별 직원 수를 구하시오. 단 출판사 이름은 유일하지 않다고 가정합니다.
select p.pub_name, count(e.emp_id) as '직원 수'
from employee e left outer join publishers p -- 출판사에 소속되어있지 않은 직원도 고려한다.
on p.pub_id = e.pub_id
group by p.pub_id, p.pub_name; -- 출판사 이름이 유일하지 않을 수 있기 때문에 p.pub_id를 포함한다.
-- order by p.pub_name;
-- (2) 책에 대해 pubs의 서점들에 의해 1993년도에 주문된 총 판매된 수량, 총 주문 금액을 구하려 한다. 이때 책 이름 별 판매수량 및 주문금액은 sales 테이블의 데이터로부터 계산합니다.
 -- (i) 주문된 적이 있는 경우에 한해 위의 질의 내용을 구하라.
select t.title as '제목', sum(s.qty) as '판매수량', sum(s.qty * t.price) as '주문금액', 
year(s.ord_date) as '주문날짜'
from sales s join titles t on t.title_id = s.title_id 
-- 데이터가 sales에 존재하는 경우만 포함한다.
where year(s.ord_date) = 1993
group by s.title_id, t.title;
 -- (ii) 주문된 적이 없는 경우도 포함하도록 질의 내용을 구하라. 
select t.title as '제목', sum(s.qty) as '판매수량', sum(s.qty * t.price) as '주문금액'
from titles t left outer join sales s on t.title_id = s.title_id 
-- titles에는 있지만, sales에는 없는 경우도 포함한다.
where year(s.ord_date) = 1993
group by s.title_id, t.title;
-- 위 방법으로는 뭔가 반영이 안 되!
-- Union을 이용해!
select t.title as '제목', sum(s.qty) as '판매수량', sum(s.qty * t.price) as '주문금액'
from sales s join titles t on t.title_id = s.title_id 
-- 데이터가 sales에 존재하는 경우만 포함한다.
where year(s.ord_date) = 1993
group by s.title_id, t.title
union
select t.title, 0 as '주문수량', 0 as '주문금액'
from titles t
where t.title_id not in
(select s.title_id from sales s where year(s.ord_date) = 1993);

-- (4) 단독 저자에 의해 저술된 책 이름을 구하시오.
select t.title, count(ta.au_id) as '저자 수'
from titles t join titleauthor ta on ta.title_id = t.title_id
group by ta.title_id
having count(ta.au_id) = 1;
-- 이 경우 저자가 표시되지 않은 책들로 포함된다!
select title
from titles
where title_id not in(
select ta.title_id
from titleauthor ta
where ta.au_ord >= 2
);
-- (5) 가장 많은 책을 저술한 저자의 이름('first name last name'의 형태)을 구하시오.
-- 5월 6일 강의 영상 참고!
-- 저자 별 책의 수를 구하자.
select concat(a.au_fname, ' ', a.au_lname) as '저자의 이름', count(t.title_id) as '책의 수'
from (authors a join titleauthor ta on ta.au_id = a.au_id) 
join titles t on ta.title_id = t.title_id 
group by ta.au_id
having count(t.title_id) = (select count(t.title_id) as '책의 수'
from titleauthor ta join titles t on ta.title_id = t.title_id 
group by ta.au_id
order by 1 desc
limit 1
);
-- 괄호 안의 부분을 set으로 변수 선언해서 사용할 수 있어!
 
select concat(a.au_fname, ' ', a.au_lname) as '저자의 이름', count(t.title_id) as '책의 수'
from (authors a join titleauthor ta on ta.au_id = a.au_id) 
join titles t on ta.title_id = t.title_id 
group by ta.au_id
having count(t.title_id) =
(select max(temp.NoOfBooks)
from (select count(*) as NoOfBooks
from titleauthor
group by au_id) temp )
;
select * from authors;
select * from publishers;
select * from titles;
select * from titleauthor;
select * from employee;
select * from jobs;
select * from sales;
-- B. 다음은 classicmodels 데이터베이스에 대한 질의문들이다. 이를 각각 SQL로 표현하시오.
use classicmodels;
-- (1) 2004년도 매출 실적을 월별로 계산하려고 한다. 이를 구하는 SQL문을 쓰시오. 매출을 계산할 때 날짜는 주문 날짜를 기준으로 계산한다.
select year(o.orderDate) as '년', month(orderDate) as '월', sum(quantityOrdered * priceEach) as '매출실적'
from orders o join orderdetails od on o.orderNumber = od.orderNumber
where year(o.orderDate) = 2004 and o.status ='Shipped'
group by month(orderDate)
order by 2;
-- (2) 고객 회사들에 대해 매출 성향을 분석하려고 한다. 각 고객 회사에 대해 회사명, 주문 회수, 평균 주문 금액, 최대 주문 금액을 구하시오. 
-- 주문횟수가 다르게 나오는데?
select c.customerName, 
count(o.orderNumber) as 주문횟수,
round(avg(temp.orderAmount, 2)) as 평균주문금액,
max(temp.orderAmount) as 최대주문금액
from customers c join (orders o join (select orderNumber, sum(quantityOrdered * priceEach) as orderAmount -- 주문번호별 주문금액
from orderdetails group by orderNumber) temp on o.orderNumber = temp.orderNumber) on o.customerNumber = c.customerNumber
group by c.customerNumber;
-- (3) 가장 많은 주문 금액의 주문의 고객회사 명, 주문 날짜, 주문금액을 구하시오.
-- 이거도 결과가 다른데? 아 sum을 안했네.... 101행에서
select c.customerName, o.orderDate, sum(od.quantityOrdered * od.priceEach) as '주문금액' -- sum을 안해서 틀렸어!
from (customers c join orders o on c.customerNumber = o.customerNumber)
join orderdetails od on od.orderNumber = o.orderNumber
group by o.orderNumber
order by 3 desc
limit 1;

select * from products;
select * from customers;
select * from employees;
select * from orders;
select * from orderdetails;