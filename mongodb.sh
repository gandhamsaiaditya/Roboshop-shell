source ./common.sh
echo Copy repo file
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>$log_file
PRINT_STATUS $?

echo Install mongodb
dnf install mongodb-org -y &>>$log_file
PRINT_STATUS $?

echo Enable Mongod
systemctl enable mongod &>>$log_file
PRINT_STATUS $?

echo Strat Mongod
systemctl start mongod &>>$log_file
PRINT_STATUS $?

echo Search and replace
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$log_file
PRINT_STATUS $?

echo Restart mongo
systemctl restart mongod &>>$log_file
PRINT_STATUS $?

echo Status
netstat -lntp