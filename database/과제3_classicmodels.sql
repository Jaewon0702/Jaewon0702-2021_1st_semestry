use `classicmodels`;
-- D. 다음은 classicmodels 데이터베이스에 대한 질의문들이다. 이를 각각 SQL로 표현하시오.
-- (1) 취소된 주문의 주문번호, 고객 명, 담당 직원 명(last name), 주문 날짜, 그리고 
-- 그 이유(comments)를 구하시오.
select distinct o.orderNumber, c.customerName, e.lastName, o.orderDate,o.comments
from orders o, customers c, employees e, orderdetails od, products p, productlines pl
where o.status = 'Cancelled' and o.orderNumber = od.orderNumber
and od.orderLineNumber = e.officeCode and e.employeeNumber = c.salesRepEmployeeNumber;

-- (2) 주문번호 10100에 의해 주문된 모든 제품 이름을 구하시오.
select p.productName
from orders o, orderdetails od, products p
where o.orderNumber = 10100 and o.orderNumber = od.orderNumber 
and od.productCode = p.productCode;

select * from products;
select * from customers;
select * from employees;
select * from orders;
select * from orderdetails;
select * from payments;
select * from productlines;