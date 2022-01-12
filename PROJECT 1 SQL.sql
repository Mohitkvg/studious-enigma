use hr;
#1.
select first_name as FirstName, last_name as Lastname from employees;

#2.
select distinct department_id from employees;

#3.
select * from employees
order by first_name desc;

#4.

select concat(first_name,last_name) as 'Name' ,salary, (0.15*salary) as PF from employees;

#5.

select employee_id, concat(first_name,last_name) as 'Names',salary from employees
order by salary asc;

#6.

select sum(salary) from employees;

#7.

select max(salary), min(salary) from employees;

#8.

select avg(salary), count(distinct employee_id) from employees;

#9.

select count(distinct employee_id) as 'no of employees' from employees;

#10.

select count(*) from jobs;

#11.

select upper(first_name) from employees;

#12.

select substr(first_name,1,3) from employees;
#13.

select Trim(first_name) from employees;

#14.

select length(concat(first_name,last_name)) as lenghthofname from employees;

#15.

select first_name from employees
where first_name like '%[^0-9]%';

#16.

select concat(first_name,' ',last_name) as 'name', salary from employees
where salary not between 10000 and 15000;

#17.

select concat(first_name,' ',last_name) as 'name', department_id from employees
where department_id in (30,100)
order by department_id asc;

#18.

select concat(first_name,' ',last_name) as 'name', salary,department_id from employees
where salary not between 10000 and 15000 and department_id in(30,100);

#19.

select concat(first_name,' ',last_name) as 'name', hire_date from employees
where hire_date >= '1987-01-01' and hire_date <= '1987-12-31';

#20.

select first_name from employees
where first_name like '%b%' and first_name like '%c%';

#21.

select last_name,job_title,salary from employees
inner join jobs 
on employees.job_id = jobs.job_id
where job_title like 'Programmer' or job_title like 'shipping clerk' and salary not in (4500,1000,15000);

#22.
select last_name from employees
where length(last_name) = 6;

#23 
select last_name from employees
where last_name like '__e%';

#24.

select jobs.job_id,employees.employee_id
from jobs 
inner join employees
on jobs.job_id = employees.job_id;

#25.

update employees set
phone_number = REPLACE(phone_number,'123','999');

#26.
select first_name from employees
where length(first_name) >=8;

#27.

select concat(email, '@example.com') as email from employees;

#28.

select substr(phone_number,9,4) from employees;

#29.
select substr(street_address,length(street_address),1) from locations;

#30.

select * from locations
where length(street_address) = (select min(length(street_address)) from locations);

#31.

select substr(job_title,1,1) from jobs;


#32.

select length(first_name) from employees
where last_name like '__c%';

#33.

select first_name,length(first_name)as length_of_firstname from employees
where first_name like 'a%' or first_name like 'j%' or first_name like 'm%';

#34.

select first_name,concat('$',salary,'000') as 'SALARY' from employees;

#35

select substr(first_name,1,8) as 'Name' ,concat('$',salary) as 'salary' from employees
order by salary desc;

#36. 

select employee_id,first_name,last_name,hire_date from employees
where day(hire_date) = 7 or month(hire_date) = 7;
