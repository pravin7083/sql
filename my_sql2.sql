use my_sql;

-- START TRANSACTION;

show tables;

savepoint beginning;

create table student(
rollno int primary key,
name varchar(25),
marks int not null,
grade varchar(1),
city varchar(20)
);


insert into student values
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "Pravin", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

savepoint inserted;

-- select Query -----------------------

select * from student;

select name, marks from student;

-- Where clause
Select * from student where marks > 94;

Select * from student where city = "mumbai";

-- Where with Operators-------------

Select * from student where city = "Delhi" AND marks > 80;
Select * from student where city = "Delhi" OR marks > 80;


-- Operators ----------------- IN, BETWEEN, LIKE, NOT...

select * from student where marks Between 80 AND 90;
select * from student where city IN("Delhi", "Mumbai");
select * from student where city NOT IN("Delhi", "Mumbai");

-- Limit clause-----------------
select marks, name from student limit 3;

describe student;

-- order by clause------
select * from student order by marks ;
select * from student order by marks asc;
select * from student order by marks desc;

-- AGGREGATE FUNCTION------------
select max(marks)  from student;
select name from student where marks = (select max(marks) from student);

insert into student values
(107,null,80,null,null);

select * from student;

select COUNT(grade)  from student;
select COUNT(rollno)  from student;

select min(marks)  from student;
select sum(marks)  from student;
select sum(grade)  from student;  -- returns 0 bcz no int-----
select avg(marks)  from student;


-- GROUP BY CLAUSE-------

SELECT city, COUNT(rollno) AS student_count
FROM student
GROUP BY city;

select grade, count(marks) -- as student_marks
from student
group by grade order by grade ASC;

select * from student;

select city,sum(marks) AS Total
from student group by city
order by total ASC;

select city,sum(marks) AS Total
from student 
group by city
having sum(marks) > 80
order by total ASC;

select city,sum(marks) AS Total
from student 
group by city
having sum(marks) >= 80 and sum(marks) < 180
order by total ASC;

select city,sum(marks) AS Total
from student 
group by city
having sum(marks) between 80 and 180
order by total ASC;


select name,city, count(rollno) from student
group by city HAVING max(marks) >80;

SELECT city, COUNT(rollno), MAX(marks)
FROM student
GROUP BY city
HAVING MAX(marks) > 80;

-- Table  related queries------------

start transaction;
savepoint tableRelated;

select * from student;

SET SQL_SAFE_UPDATES = 0;  -- disable safe mode temp

update student
set grade = "E"
where grade is null;

update student 
set marks = 69
where name = "bhumika";

delete from student
where marks< 28;

rollback to tableRelated;


-- update related queries alter table----------------- (To change the schema)

alter table student 
add column new_column int not null;

alter table student 
add column new_column2 varchar(25) not null;

select * from student;

alter table student
drop column new_column2 ;

alter table student
drop column new_column;

alter table student 
rename to student_data;
show tables;

savepoint student_data;

alter table student_data
change column grade grades varchar(25) not null;

ALTER TABLE student_data  
CHANGE COLUMN grade grades VARCHAR(25) ;

alter table student_data
modify column grades varchar(26);

-- truncate table------------

truncate table student_data;

select * from student_info;

rollback to student_data;

alter table student_data
rename to student_info;

insert into student_info values
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "Pravin", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");