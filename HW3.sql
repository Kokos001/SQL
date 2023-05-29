-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select f.employee_name, salary.monthly_salary from
(select employees.employee_name, employee_salary.salary_id from employees left join employee_salary 
on employees.id = employee_salary.employee_id) as f inner join salary
on f.salary_id = salary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select f.employee_name, salary.monthly_salary from
(select employees.employee_name, employee_salary.salary_id from employees left join employee_salary 
on employees.id = employee_salary.employee_id) as f inner join salary
on f.salary_id = salary.id where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary from salary left join employee_salary 
on salary.id = employee_salary.salary_id where employee_id is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary from salary left join employee_salary 
on salary.id = employee_salary.salary_id where employee_id is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name from employees left join employee_salary 
on employees.id = employee_salary.employee_id where salary_id is null; 

-- 6. Вывести всех работников с названиями их должности.
select f.employee_name, roles.role_name from
(select employees.employee_name, roles_employee.role_id from employees left join roles_employee 
on employees.id = roles_employee.employee_id) as f left join roles
on f.role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.
select f.employee_name, roles.role_name from
(select employees.employee_name, roles_employee.role_id from employees left join roles_employee 
on employees.id = roles_employee.employee_id) as f left join roles
on f.role_id = roles.id 
where role_name like ('%Java developer%');

-- 8. Вывести имена и должность только Python разработчиков.
select f.employee_name, roles.role_name from
(select employees.employee_name, roles_employee.role_id from employees left join roles_employee 
on employees.id = roles_employee.employee_id) as f left join roles
on f.role_id = roles.id 
where role_name like ('%Python developer%');

-- 9. Вывести имена и должность всех QA инженеров.
select f.employee_name, roles.role_name from
(select employees.employee_name, roles_employee.role_id from employees left join roles_employee 
on employees.id = roles_employee.employee_id) as f left join roles
on f.role_id = roles.id 
where role_name like ('%QA engineer%');

-- 10. Вывести имена и должность ручных QA инженеров.
select f.employee_name, roles.role_name from
(select employees.employee_name, roles_employee.role_id from employees left join roles_employee 
on employees.id = roles_employee.employee_id) as f left join roles
on f.role_id = roles.id 
where role_name like ('% Manual QA%');


-- 11. Вывести имена и должность автоматизаторов QA
select f.employee_name, roles.role_name from
(select employees.employee_name, roles_employee.role_id from employees left join roles_employee 
on employees.id = roles_employee.employee_id) as f left join roles
on f.role_id = roles.id 
where role_name like ('%Automation QA%');

-- 12. Вывести имена и зарплаты Junior специалистов
select a.employee_name, salary.monthly_salary from
	(select b.employee_name, employee_salary.salary_id from
		(select f.employee_name, f.id, roles.role_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Junior%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id; 

-- 13. Вывести имена и зарплаты Middle специалистов
select a.employee_name, salary.monthly_salary from
	(select b.employee_name, employee_salary.salary_id from
		(select f.employee_name, f.id, roles.role_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Middle%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 14. Вывести имена и зарплаты Senior специалистов
select a.employee_name, salary.monthly_salary from
	(select b.employee_name, employee_salary.salary_id from
		(select f.employee_name, f.id, roles.role_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Senior%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 15. Вывести зарплаты Java разработчиков
select a.role_name, salary.monthly_salary from
	(select b.role_name, employee_salary.salary_id from
		(select f.id, role_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Java developer%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 16. Вывести зарплаты Python разработчиков
select a.role_name, salary.monthly_salary from
	(select b.role_name, employee_salary.salary_id from
		(select f.id, role_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Python developer%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select a.employee_name, salary.monthly_salary from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Junior Python%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select a.employee_name, salary.monthly_salary from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Middle JavaScript%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;


-- 19. Вывести имена и зарплаты Senior Java разработчиков
select a.employee_name, salary.monthly_salary from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Senior Java dev%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 20. Вывести зарплаты Junior QA инженеров
select salary.monthly_salary from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Junior%QA%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(salary.monthly_salary) from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%Junior%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 22. Вывести сумму зарплат JS разработчиков
select sum(salary.monthly_salary) from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%JavaScript%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 23. Вывести минимальную ЗП QA инженеров
select min(salary.monthly_salary) from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%QA%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 24. Вывести максимальную ЗП QA инженеров
select max(salary.monthly_salary) from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%QA%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 25. Вывести количество QA инженеров
select count(f.employee_name) from
(select employees.employee_name, roles_employee.role_id from employees left join roles_employee 
on employees.id = roles_employee.employee_id) as f left join roles
on f.role_id = roles.id 
where role_name like ('%QA engineer%');

-- 26. Вывести количество Middle специалистов.
select count(f.employee_name) from
(select employees.employee_name, roles_employee.role_id from employees left join roles_employee 
on employees.id = roles_employee.employee_id) as f left join roles
on f.role_id = roles.id 
where role_name like ('%Middle%');

-- 27. Вывести количество разработчиков
select count(f.employee_name) from
(select employees.employee_name, roles_employee.role_id from employees left join roles_employee 
on employees.id = roles_employee.employee_id) as f left join roles
on f.role_id = roles.id 
where role_name like ('%dev%');

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary) from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees inner join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id 
		where role_name like ('%dev%')) as b
	inner join employee_salary on b.id = employee_salary.employee_id) as a
inner join salary on a.salary_id = salary.id;

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select a.employee_name, a.role_name, salary.monthly_salary from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees left join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id) as b
	left join employee_salary on b.id = employee_salary.employee_id) as a
left join salary on a.salary_id = salary.id
ORDER by monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select a.employee_name, a.role_name, salary.monthly_salary from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees left join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id) as b
	left join employee_salary on b.id = employee_salary.employee_id) as a
left join salary on a.salary_id = salary.id
where monthly_salary between 1700 and 2300
ORDER by monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select a.employee_name, a.role_name, salary.monthly_salary from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees left join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id) as b
	left join employee_salary on b.id = employee_salary.employee_id) as a
left join salary on a.salary_id = salary.id
where monthly_salary < 2300
ORDER by monthly_salary;


-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select a.employee_name, a.role_name, salary.monthly_salary from
	(select b.employee_name, b.role_name, employee_salary.salary_id from
		(select f.id, role_name, f.employee_name from
			(select employees.employee_name, roles_employee.role_id, employees.id from employees left join roles_employee 
			on employees.id = roles_employee.employee_id) as f
		left join roles on f.role_id = roles.id) as b
	left join employee_salary on b.id = employee_salary.employee_id) as a
left join salary on a.salary_id = salary.id
where monthly_salary in ('1100', '1500', '2000')
ORDER by monthly_salary;

