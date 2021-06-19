use pubs;
select * from titles;
select * from publishers;
select * from sales;
delimiter //
-- titles 테이블에 대한 insert_titme 포로시저 구현
drop procedure if exists Insert_title;
create procedure Insert_title(
in ptitle_id char(6), in ptitle varchar(80), in pgenre char(12), in pprice decimal(10,0))
begin
insert into titles(title_id, title, genre, price, pubdate) values
(ptitle_id, ptitle, pgenre, pprice, date(now()));
end //
delimiter ;

delimiter $$
create procedure Insert_title2(
in ptitle_id char(6), in ptitle varchar(80), in pgenre char(12), 
in pprice decimal(10,0), in ppub_name varchar(40))
begin
declare p_id char(6);
set p_id = 
(select pub_id from publishers where pub_name = ppub_name);

insert into titles(title_id, title, genre, pub_id, price, pubdate) values
(ptitle_id, ptitle, pgenre, p_id, pprice, date(now()));
end $$
delimiter ;

select * from sales;
drop procedure insert_sales_record;
delimiter //
create procedure insert_sales_record(
in ptitle varchar(80), in pstor_name varchar(40), 
in pord_num varchar(20), in pqty smallint, in ppayterms varchar(12))
begin
declare pstor_id char(4);
declare ptitle_id varchar(20);
set pstor_id = 
(select stor_id from stores where stor_name = pstor_name);
set ptitle_id = 
(select title_id from titles where title = ptitle);

insert into sales(stor_id, ord_num, ord_date, qty, payterms, title_id) values
(pstor_id, pord_num, date(now()), pqty, ppayterms, ptitle_id);
end //
delimiter ;
select * from sales;
select * from titles;
select * from stores;
show tables;
call insert_sales_record("The Busy Executive's Database Guide",'Eric the Read Books', '1234', 1,'Net 60');

