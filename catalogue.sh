source ./common.sh
app_name=catalogue

NODEJS

echo Copy Mongo repo
cp $dir_path/mongo.repo /etc/yum.repos.d/mongo.repo &>>$log_file
PRINT_STATUS $?

echo Install Mongod
dnf install mongodb-mongosh -y &>>$log_file
PRINT_STATUS $?

echo Load master Data
mongosh --host mongodb-dev.azdevops.shop </app/db/master-data.js &>>$log_file
PRINT_STATUS $?