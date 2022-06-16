create database library;

show databases;

create table authors (authornumber int(11),
	     authorname varchar(50),
             city varchar(50),
             primary key (authornumber));

insert into authors
values (1,'antónio','porto');

insert into authors
values (2,'pedro','lisboa');

update authors
set city ='lisbon'
where authornumber=2;

alter table authors add salary int (11);

alter table authors add age int (11);

show columns in authors;

update authors
set salary = 800
where authornumber=1;

update authors
set salary = 1500
where authornumber=2;

update authors
set age = 20
where authornumber=1;

update authors
set age = 21
where authornumber=2;

update authors
set salary = 1000
where authornumber=1;

select*
from authors
limit 1;

select*
from authors
where city='porto';

select*
from authors
order by salary desc
limit 2;

select authorname
from authors
where salary>=1100;

select authorname
from authors
where salary>=1100 and age>25;

select authorname
from authors
where city='porto' and authorname like 'a%' and age>=18;

select min(salary) as min_salary,
       max(salary) as max_salary,
       avg(salary)  as avg_salary
       from authors

select count(*) as nr_antonios
from authors
where authorname='antonio';

select sum(salary) as total_in_salary
from authors;

select city,
avg(salary)
from authors
group by city;


