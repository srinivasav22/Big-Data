use insofe_empdb;
SELECT 'LOADING departments' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/new_inserts/load_departments_added.dump ;

SELECT 'LOADING employees' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/new_inserts/load_employees_added.dump ;

SELECT 'LOADING dept_emp' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/new_inserts/load_dept_emp_added.dump ;


SELECT 'LOADING dept_manager' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/new_inserts/load_dept_manager_added.dump;

SELECT 'LOADING titles' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/new_inserts/load_titles_added.dump ;

SELECT 'LOADING salaries' as 'INFO';
source /home/thomasj/BIonHadoop/MySQL/new_inserts/load_salaries_added.dump ;

select count(*) from employees;
select count(*) from departments;
select count(*) from dept_emp;
select count(*) from dept_manager;
select count(*) from salaries;
select count(*) from titles;

