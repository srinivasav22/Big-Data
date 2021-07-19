echo "No. of rows in departments table" 
hdfs dfs -cat /user/thomasj/employeesDB/departments/* | wc -l
echo "No. of rows in dept_emp table"
hdfs dfs -cat /user/thomasj/employeesDB/dept_emp/* | wc -l
echo "No. of rows in dept_manager table"
hdfs dfs -cat /user/thomasj/employeesDB/dept_manager/* | wc -l
echo "No. of rows in employees table"
hdfs dfs -cat /user/thomasj/employeesDB/employees/* | wc -l
echo "No. of rows in salaries table"
hdfs dfs -cat /user/thomasj/employeesDB/salaries/* | wc -l
echo "No. of rows in titles table"
hdfs dfs -cat /user/thomasj/employeesDB/titles/* | wc -l


