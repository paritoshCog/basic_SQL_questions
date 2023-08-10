-- ques 1
select e.name, st.salary from employee e join salary_table st on st.id = e.id
where st.salary < (select max(salary) from salary_table)
order by st.salary desc
fetch first 1 rows only;

-- or

with abc as (SELECT name,dense_rank() over(ORDER by salary desc) as rank FROM employee e JOIN salary_table s ON e.id=s.id
)
SELECT name FROM abc where rank=2;

-- ques 2



-- ques 3

-- INNER JOIN
select * from a join b on a.col = b.col

col  col
1     1
1     1
0     0

-- LEFT JOIN
select * from a left join b on a.col = b.col

col  col
1    1
1    1  
0    0
-    -

-- RIGHT JOIN
select * from a right join b on a.col = b.col

col  col
1     1
1     1
0     0
-     -
-     -

-- FULL OUTER JOIN
select * from a outer join b on a.col = b.col

col  col
1     1
1     1
0     0
-     -
-     -
-     -






















