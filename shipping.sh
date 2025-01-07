source ./common.sh
app_name=shipping

JAVA

  echo Install MYSQL
  dnf install mysql -y &>>$log_file
  PRINT_STATUS $?


for file in schema app-user master-data; do

  echo Load $file
  mysql -h mysql-dev.azdevops.shop -uroot -pRoboShop@1 < /app/db/$file.sql &>>$log_file
  PRINT_STATUS $?

done