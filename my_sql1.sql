-- create , drop, update, use of constraints ( keys ,not , null ), on database and tables
-- basic DDL, DML operations

create database if not exists my_sql;


use my_sql;

-- show databases;

-- drop database KPIT;

-- show databases;

create table students(
	roll_no tinyInt unsigned,
    name varchar(25),
    age tinyint unsigned
);

show tables;

-- desc students;

-- drop table students;
-- show tables;

-- insert into students values
-- (1, "Omkesh", 18),
-- (2, "Pravin", 20);

-- insert into students(name, roll_no) values
-- ("Param", 3);


-- select * from students;


-- KEYS-----------------------------------------------

create table city(
	id int unsigned primary key,
    city_name varchar(25)
);


create table student(
	id int unsigned primary key,
    name varchar(25) not null,
    city_id int unsigned,
    city varchar(25),
    foreign key(city_id) references city(id)
);

desc city;
desc student;

insert into city values
(442, "pune"),
(443, "mumbai")
;

-- insert into student values
-- (56, "Omkesh", 9, "beed"); ---> will throw error

insert into student values
(56, "Omkesh", 442, "pune"),
(27, "pravin", 443, "mumbaiiii");

select * from student;
select * from city;

drop table student, city;
show tables;

CREATE TABLE city (
    id INT PRIMARY KEY,
    city VARCHAR(50),
    age INT,
    CONSTRAINT age_check CHECK (age >= 18 And city="Delhi")
);

INSERT INTO city (id, city, age) VALUES (1, 'Delhi', 20);  -- ✅ Valid (age >= 18 and city = 'Delhi')
INSERT INTO city (id, city, age) VALUES (2, 'Mumbai', 25); -- ❌ Invalid (city is not 'Delhi')
INSERT INTO city (id, city, age) VALUES (3, 'Delhi', 17);  -- ❌ Invalid (age < 18)

CREATE TABLE newTab (
    age INT CHECK (age >= 18)
);

INSERT INTO newTab (age) VALUES (18);  -- ✅ Valid (age >= 18)
INSERT INTO newTab (age) VALUES (25);  -- ✅ Valid (age >= 18)
INSERT INTO newTab (age) VALUES (30);  -- ✅ Valid (age >= 18)
INSERT INTO newTab (age) VALUES (17);  -- ❌ Invalid (age < 18) - This will fail!
INSERT INTO newTab (age) VALUES (16);  -- ❌ Invalid (age < 18) - This will fail!


drop table city, newTab;

