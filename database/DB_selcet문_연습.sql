use pubs;
select title from titleauthor, titles where au_id = '172-32-1176' 
and titleauthor.title_id = titles.title_id;

select * from titleauthor;
select * from titles;
select * from authors;
-- 'Prolonged Data Deprivation: Four Case Studies'을 저술한 저자명을 구하시오.
select au_lname , au_fname from titleauthor, titles,authors where title = 'Prolonged Data Deprivation: Four Case Studies' 
and titleauthor.title_id = titles.title_id and titleauthor.au_id = authors.au_id ;

