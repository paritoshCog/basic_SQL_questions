-- ques 1
select e.name, st.salary from employee e join salary_table st on st.id = e.id
where st.salary < (select max(salary) from salary_table)
order by st.salary desc
fetch first 1 rows only;

-- or

with abc as (SELECT name,dense_rank() over(ORDER by salary desc) as rank FROM employee e JOIN salary_table s ON e.id=s.id
)
SELECT name FROM abc where rank=2;





