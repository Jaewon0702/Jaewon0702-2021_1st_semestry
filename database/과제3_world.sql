use `world`;
-- (1) China의 도시 수를 계산하시오.
select count(ci.id)
from country co, city ci
where co.name = 'china' and co.code = ci.CountryCode;

-- (2) 가장 적은 인구를 가지고 있는 국가의 이름과 인구수를 구하시오.
select co.name, co.Population
from country co
where Population > 0
order by Population
Limit 1;

-- (3) Caribbean 지역에서 소통되는 모든 언어들을 구하시오.
select distinct cl.Language
from countrylanguage cl, country co
where co.Region = 'Caribbean' and co.code = cl.CountryCode;

-- (4) 소통되는 언어가 명시되지 않은 국가의 코드와 이름을 구하시오.
select c.code, c.name
from countrylanguage cl, country c
where (cl.CountryCode) not in (c.code);

select c.code, c.name
from countrylanguage cl join country c on
(cl.CountryCode) not in (c.code);

select c.code, c.name
from countrylanguage cl, country c
where not (cl.CountryCode = c.code);


-- (5) 다른 도시이지만 동일 명칭의 도시들의 쌍에 대해 각각 ID와 이름을 구하시오.
select ci.id, ci.name
from city ci, city c
where ci.name = c.name and not (ci.id = c.id);




