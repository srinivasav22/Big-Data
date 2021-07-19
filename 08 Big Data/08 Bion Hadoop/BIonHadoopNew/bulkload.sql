use insofe_empdb;
SELECT 'LOADING departments' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/load_departments.dump ;


SELECT 'LOADING employees' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/load_employees.dump ;

SELECT 'LOADING dept_emp' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/load_dept_emp.dump ;


SELECT 'LOADING dept_manager' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/load_dept_manager.dump;

SELECT 'LOADING titles' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/load_titles.dump;

SELECT 'LOADING salaries' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/load_salaries.dump;

select count(*) from employees;
select count(*) from departments;
select count(*) from dept_emp;
select count(*) from dept_manager;
select count(*) from salaries;
select count(*) from titles;


