source ./common.sh
echo Install MY SQL
dnf install mysql-server -y &>>$log_file
PRINT_STATUS $?

echo Enable Mysql
systemctl enable mysqld &>>$log_file
PRINT_STATUS $?

echo Strat mysql
systemctl start mysqld &>>$log_file
PRINT_STATUS $?

echo Installation and set username and password
mysql_secure_installation --set-root-pass RoboShop@1 &>>$log_file
PRINT_STATUS $?