echo " Sqoop to import all tables "
sqoop job --delete $1

sqoop job \
--create $1 \
-- import-all-tables \
--connect jdbc:mysql://$2/$3 \
--username insofeadmin \
--P \
--warehouse-dir $4 \
-m 1

sqoop job --exec $1
