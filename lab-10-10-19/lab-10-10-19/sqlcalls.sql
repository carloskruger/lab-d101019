CREATE DATABASE Employee19;

create table Employee(ssn_emp VARCHAR(255) PRIMARY KEY NOT NULL, First VARCHAR(255), Last VARCHAR(255), yearOfBirth INT, city VARCHAR(255));

create table Job(ssn_job VARCHAR(255) PRIMARY KEY NOT NULL, Company VARCHAR(255), Salary INT, Experience INT, FOREIGN KEY (ssn_job) references Employee(ssn_emp));

COPY Employee(SSN_emp,First,Last,year_of_birth,city) FROM '/Users/carloskruger/lab-10-10-19/employees.csv' DELIMITER ',' CSV HEADER;

COPY Job(SSN_job,Company,Salary,Experience) FROM '/Users/carloskruger/lab-10-10-19/jobs.csv' DELIMITER ',' CSV HEADER;


select First, Last from Employee inner join job on  Employee.ssn_emp = job.ssn_job and job.Company like '%Macy%';

select First, Last from Employee where Employee.ssn_emp IN (select job.ssn_job from job where Company like '%Macy%');



select company from job where ssn_job IN (select ssn_emp from Employee where city = 'Boston');



 select first, last from employee where ssn_emp in (select (ssn_job) from job where salary in (select max(salary) from job));

 

 