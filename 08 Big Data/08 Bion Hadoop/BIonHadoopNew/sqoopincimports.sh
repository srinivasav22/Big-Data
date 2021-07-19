echo " Sqoop to incremental import to all tables "
sqoop job --delete inc_imp_emp_thomasj
sqoop job --delete inc_imp_dept_thomasj
sqoop job --delete inc_imp_deptemp_thomasj
sqoop job --delete inc_imp_deptmgr_thomasj
sqoop job --delete inc_imp_sal_thomasj
sqoop job --delete inc_imp_titles_thomasj


sqoop job \
--create inc_imp_emp_thomasj \
-- import \
--connect jdbc:mysql://$1/$2 \
--username insofeadmin \
--password insofe_password \
--table employees \
--incremental append \
--check-column emp_no \
--last-value 300024 \
--target-dir '/user/thomasj/employeesDB/employees/' \
-m 1

sqoop job --exec inc_imp_emp_thomasj



sqoop job \
--create inc_imp_dept_thomasj \
-- import \
--connect jdbc:mysql://$1/$2 \
--username insofeadmin \
--password insofe_password \
--table departments \
--incremental lastmodified \
--check-column last_modified \
--last-value "2018-11-04 06:50:00" \
--target-dir '/user/thomasj/employeesDB/departments/' \
-m 1 \
--merge-key dept_no

sqoop job --exec inc_imp_dept_thomasj



sqoop job \
--create inc_imp_deptemp_thomasj \
-- import \
--connect jdbc:mysql://$1/$2 \
--username insofeadmin \
--password insofe_password \
--table dept_emp \
--incremental lastmodified \
--check-column last_modified \
--last-value "2018-11-04 06:50:00" \
--target-dir '/user/thomasj/employeesDB/dept_emp/' \
--merge-key seq_no \
--split-by seq_no

sqoop job --exec inc_imp_deptemp_thomasj

sqoop job \
--create inc_imp_deptmgr_thomasj \
-- import \
--connect jdbc:mysql://$1/$2 \
--username insofeadmin \
--password insofe_password \
--table dept_manager \
--incremental lastmodified \
--check-column last_modified \
--last-value "2018-11-04 06:50:00" \
--target-dir '/user/thomasj/employeesDB/dept_manager/' \
--merge-key seq_no \
--split-by seq_no

sqoop job --exec inc_imp_deptmgr_thomasj


sqoop job \
--create inc_imp_sal_thomasj \
-- import \
--connect jdbc:mysql://$1/$2 \
--username insofeadmin \
--password insofe_password \
--table salaries \
--incremental lastmodified \
--check-column last_modified \
--last-value "2018-11-04 06:50:00" \
--target-dir '/user/thomasj/employeesDB/salaries/' \
--merge-key seq_no \
--split-by seq_no

sqoop job --exec inc_imp_sal_thomasj


sqoop job \
--create inc_imp_titles_thomasj \
-- import \
--connect jdbc:mysql://$1/$2 \
--username insofeadmin \
--password insofe_password \
--table titles \
--incremental lastmodified \
--check-column last_modified \
--last-value "2018-11-04 06:50:00" \
--target-dir '/user/thomasj/employeesDB/titles/' \
--merge-key seq_no \
--split-by seq_no

sqoop job --exec inc_imp_titles_thomasj
