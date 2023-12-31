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

delete from student_table where rowid not in (select min(rowid) from student_table group by roll_no);


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

-- question 4
    
create table batsman( 
    player_name varchar(20) 
);

create table bowler( 
    player_name varchar(20) 
);

insert into batsman values('sachin');
insert into batsman values('Dhoni');
insert into batsman values('Dhoni');
insert into batsman values('Sehwag');
insert into batsman values('Virat');
insert into batsman values('Virat');
insert into batsman values('sachin');
insert into batsman values('Gambhir');
insert into batsman values('Suresh');
insert into batsman values('Suresh');
insert into batsman values('Yuvraj');
insert into batsman values('Rohit');

delete from batsman where player_name = 'sachin';

select * from batsman;


insert into bowler values('Zaheer');
insert into bowler values('Sreesanth');
insert into bowler values('Yuvraj');
insert into bowler values('Harbhajan');
insert into bowler values('Ashish');
insert into bowler values('Zaheer');
insert into bowler values('Irfan');
insert into bowler values('Zaheer');
insert into bowler values('Yuvraj');
insert into bowler values('Suresh');

select * from bowler;

-- ans
insert into indian_cricket_team  (select player_name from Batsman UNION SELECT player_name FROM bowler);




-- question 5

select student_name, subject_name from student_table st
join
subject_table sj ON st.subject_id = sj.student_id
join
grade_table gt ON gt.grade = st.grade 
where
gt.remarks = 'average';



-- question 6

select player_name, skill,
case skill
when 'Bat' then 'batsman'
when 'Bowl' then 'bowler'
when 'All' then 'AllRounder'
end as 
proper_skill
from player_table;

-- question 7

select * from employee_table where project_id = 'Project_2';


-- question 8

create table customer_table(
    customer_id number(20),
    customer_name varchar2(30),
    pan_number varchar2(30),
    branch_name varchar2(30),
    primary key(customer_id)
);

CREATE table Customer_transaction_table(
Customer_id NUMBER NOT NULL,
Customer_transaction_date  date default sysdate,
Transaction_amnt number,
Transaction_mode varchar2(20),
FOREIGN KEY(Customer_id) REFERENCES Customer_table(Customer_id));


create SEQUENCE sqn START with 1 ;

CREATE table transaction_mode_table(
transaction_id number default sqn.nextval ,
transaction_mode varchar2(20)

    );











-- question 9
select id, employee_name, concat(employee_name,'@',maildomain) as email_id from employee_table;



-- question 10
SELECT abs(data_of_joining-Date'2023-07-24') AS DateDiff FROM employee_table;















