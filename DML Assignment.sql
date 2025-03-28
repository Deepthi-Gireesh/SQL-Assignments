create database Employees;
use Employees;
create table Manager(
Manager_Id int,
First_Name Varchar(35),
Last_Name varchar(35),
DOB date,
Age int check (Age>=18 and Age<=55),
Gender Varchar(10),
Department varchar(25),
Salary int NOT NULL);
select* from Manager;

insert into Manager
values (1 ,"Alice","Francis",'1984-12-05',37,"Female","Accounts",35000),
(2,"Ann","Mary",'1991-02-13',33,"Female","Administration",45000),
(3,"Arun","James",'1992-05-24',32,"Male","Testing",25000),
(4,"Rahul","Davis",'1985-09-10',31,"Male","Software Development",35000),
(5,"Arvind","Karthik",'1990-08-23',34,"Male","Accounts",30000),
(6,"Sam","Xavier",'1998-10-10',33,"Male","Accounts",28000),
(7,"Anju","Zachria",'1984-06-16',39,"female","Administration",40000),
(8,"Basil","Joseph",'1985-10-15',40,"Male","Accounts",45000),
(9,"Kiran","Dev",'1991-12-12',33,"Male","Administration",40000),
(10,"Anuja","Sharma",'1984-06-18',40,"Female","Testing",35000);
select* from	Manager;
Select First_Name,Last_Name,DOB
from Manager
Where Manager_Id = 1;
Select First_Name,(Salary *12)as Annual_Salary
From Manager;
select* From Manager
where not First_Name = "Aaliya"; 
select * 
from Manager
where Department ='Software Development' and salary <=25000;
select *
from Manager
where salary between 10000 and 35000;

