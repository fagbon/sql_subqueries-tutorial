#find employees who are senior to recently hired employee and work under KAYLING
#Return all
SELECT 
    *
FROM
    employee 
WHERE hire_date < 
(select max(hire_date) from employee
where manager_id =
(select emp_id from employee
where emp_name = 'kayling'));


#--find those employees who work as same designation of frank
select * from employee
where job_name = 
(select job_name from employee
where emp_name = 'frank');

#find those managers whose salary is more than the average salary of his employees
select * from employee m
where m.emp_id IN 
(SELECT manager_id from employee)
and m.salary >
(select avg(salary) from employee e
where e.manager_id = m.emp_id);

#find those employees whose salary is more than the salary of Jonas.
select * from employee
where salary > 
(select salary from employee
where emp_name = 'Jonas');

#all managers and numbers of employee
select e.manager_id, count(*) as '# of employees' from employee e
group by manager_id;

#employees whose managers name is 'Jonas'
select * from employee m,
			employee e
where m.manager_id = e.emp_id
and e.emp_name = 'jonas';

  
  

