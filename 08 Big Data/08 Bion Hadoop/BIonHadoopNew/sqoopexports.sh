echo "sqoop export to mysql"
sqoop job --delete export_all
sqoop job --delete export_aggr_1
sqoop job --delete export_aggr_2

sqoop job \
--create export_all \
-- export \
--connect jdbc:mysql://$1/insofe_results \
--username insofeadmin \
--P \
--table active_emp_details \
--export-dir /user/thomasj/results/active_employees_data/ \
--batch \
--input-fields-terminated-by ',' \
--input-lines-terminated-by '\n' \
--update-key emp_no \
--update-mode allowinsert \
-m 1

sqoop job \
--create export_aggr_1 \
-- export \
--connect jdbc:mysql://$1/insofe_results \
--username insofeadmin \
--P \
--table dept_aggr_by_gender \
--export-dir /user/thomasj/results/dept_aggr_by_gender/ \
--batch \
--input-fields-terminated-by ',' \
--input-lines-terminated-by '\n' \
--update-key dept_no,gender \
--update-mode allowinsert \
-m 1

sqoop job \
--create export_aggr_2 \
-- export \
--connect jdbc:mysql://$1/insofe_results \
--username insofeadmin \
--P \
--table dept_aggr \
--export-dir /user/thomasj/results/dept_aggr/ \
--batch \
--input-fields-terminated-by ',' \
--input-lines-terminated-by '\n' \
--update-key dept_no \
--update-mode allowinsert \
-m 1

sqoop job --exec export_all
sqoop job --exec export_aggr_1
sqoop job --exec export_aggr_2
