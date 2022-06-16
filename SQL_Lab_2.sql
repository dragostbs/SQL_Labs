create database Company_A;

/* Database tables */
create table Departments (Cod_Dept char(50),				
						  Dept_Name varchar(50),
                          primary key (Cod_Dept));
create table Projects (Num_Proj int(11),
					   Proj_Name varchar(50),
                       primary key (Num_Proj));
create table Employees (Num_Emp int(11),
						Name varchar(50),
						Gender varchar(50),
                        Admission_Date date,
                        Base_Wage int(11),
                        Cod_Dept char(50), 
                        primary key (Num_Emp));
create table Activities (Num_Proj int(11),
						 Num_Emp int(11),
                         Extra_Hours int(11),
                         primary key (Num_Proj, Num_Emp));
                         
/* Input Data */
insert into Departments (Cod_Dept, Dept_Name)
values ('DV', 'Development'),
	   ('OP', 'Operations'),
       ('PL', 'Planning');
insert into Projects (Num_Proj, Proj_Name)
values (03, 'General Accounting'),
	   (07, 'Expert Systems'),
       (12, 'Capital Markets');
insert into Employees (Num_Emp, Name, Gender, Admission_Date, Cod_Dept, Base_Wage)
values (101, 'Ana Pinto', 'F', '1987-01-06', 'DV', 1525),
	   (327, 'Joao Lopes', 'M', '1991-04-15', 'PL', 1450),
       (565, 'Carlos Fino', 'M', '1994-03-30', 'SI', 1650);
insert into Activities (Num_Proj, Num_Emp, Extra_Hours)
values (03, 101, 10),
	   (03, 927, 6),
       (07, 327, 18);
insert into Employees (Num_Emp, Name, Gender, Admission_Date, Cod_Dept, Base_Wage)
values (454, 'John Mice', 'M', '1984-03-05', 'DV', 1510)


/* Ex 1D */        
select count(*) as num_emp_DV
from employees
where cod_dept='DV';

/* Ex 2D */ 
select name, admission_date ,base_wage
from employees
where base_wage>=1500
order by admission_date asc;

/* Ex 3D */ 
select min(base_wage) as min_wage,
	   max(base_wage) as max_wage,
       avg(base_wage) as avg_wage
       from employees;

/* Ex E */ 
select*
from activities
inner join projects
on activities.Num_Proj=projects.Num_Proj
where activities.Num_Proj=3;

select* from activities;


