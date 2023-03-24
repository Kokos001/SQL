create table employees (id serial primary key, 
						employee_name varchar(50) not null);

insert into employees (employee_name) 
			values ('John Smith'), ('Mary Johnson'),
('William Davis'), ('Emily Wilson'),
('Daniel Lee'), ('Jessica Brown'),
('David Garcia'), ('Olivia Miller'),
('Matthew Johnson'), ('Sophia Clark'),
('Michael Williams'), ('Emma Davis'),
('Christopher Perez'), ('Isabella Hernandez'),
('Joseph Taylor'), ('Ava Mitchell'),
('Kevin Martinez'), ('Mia Anderson'),
('Andrew Lopez'), ('Abigail Gonzalez'),
('Nicholas Baker'), ('Madison Parker'),
('Anthony Rodriguez'), ('Charlotte Davis'),
('Robert Perez'), ('Chloe Wilson'),
('Brian Adams'), ('Ella Thomas'),
('John Nguyen'), ('Natalie Lee'),
('Thomas Jackson'), ('Grace Turner'),
('David Hernandez'), ('Lily Parker'),
('Steven Wilson'), ('Avery Roberts'),
('Richard Martin'), ('Victoria Ramirez'),
('Charles Hall'), ('Hannah Wood'),
('Timothy Taylor'), ('Aaliyah Clark'),
('Paul Thompson'), ('Addison Scott'),
('Mark Allen'), ('Audrey Hill'),
('James Wright'), ('Evelyn Garcia'),
('Benjamin Walker'), ('Aria Adams'),
('George Young'), ('Lillian Mitchell'),
('Frank Baker'), ('Brooklyn Phillips'),
('Henry Wright'), ('Elizabeth Hernandez'),
('Jackson Davis'), ('Sofia Turner'),
('Peter Evans'), ('Leah Anderson'),
('Lucas Martinez'), ('Stella White'),
('Scott Green'), ('Katherine Lewis'),
('Erica Wilson'), ('Samuel King'),
('Aaliyah Ramirez'), ('Zachary Hill'),
('Bella Flores'), ('Jared Scott'),
('Alyssa Cooper'), ('Connor Nelson'),
('Makayla Brown'), ('Gavin Davis'),
('Samantha Adams');
					
create table salary (id serial primary key, 
					monthly_salary int not null);

insert into salary (monthly_salary) 
			values (1000), (1100), (1200),
					(1300), (1400), (1500),
					(1600), (1700), (1800),
					(1900), (2000), (2100),
					(2200), (2300), (2400);
				
create table employee_salary (id serial primary key, 
				employee_id int not null unique,
				salary_id int not null);	
insert into employee_salary (employee_id, salary_id) 
			values (71, 1), (72, 2), (73, 3), (74, 4), (75, 5),
					(76, 6), (77, 7), (78, 8), (79, 9), (80, 10),
					(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
					(16, 1), (17, 2), (18, 3), (19, 4), (20, 5),
					(21, 6), (22, 7), (23, 8), (24, 9), (25, 10),
					(26, 11), (27, 12), (28, 13), (29, 14), (30, 15),
					(31, 1), (32, 2), (33, 3), (34, 4), (35, 5),
					(36, 6), (37, 7), (38, 8), (39, 9), (40, 10);

create table roles (id serial primary key, 
				role_name varchar(50) not null unique);
alter table roles alter column role_name type varchar(30);

insert into roles (role_name) 
			values ('Junior Python developer'), ('Middle Python developer'), 
					('Senior Python developer'), ('Junior Java developer'),
					('Middle Java developer'), ('Senior Java developer'), 
					('Junior JavaScript developer'), ('Middle JavaScript developer'),
					('Senior JavaScript developer'), ('Junior Manual QA engineer'), 
					('Middle Manual QA engineer'), ('Senior Manual QA engineer'),
					('Project Manager'), ('Designer'),
					('HR'), ('CEO'),
					('Sales manager'), ('Junior Automation QA engineer'),
					('Middle Automation QA engineer'), ('Senior Automation QA engineer');

create table roles_employee (id serial primary key, 
				employee_id int not null unique references employees(id),
				role_id int not null references roles(id));
			
insert into roles_employee (employee_id, role_id) 
			values (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
					(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
					(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
					(16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
					(21, 1), (22, 2), (23, 3), (24, 4), (25, 5),
					(26, 6), (27, 7), (28, 8), (29, 9), (30, 10),
					(31, 11), (32, 12), (33, 13), (34, 14), (35, 15),
					(36, 16), (37, 17), (38, 18), (39, 19), (40, 20);			
			
select * from roles_employee;				
select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;