source ./common.sh
echo Copy repo file
cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo &>>$log_file
PRINT_STATUS $?

echo install rabbitmq
dnf install rabbitmq-server -y &>>$log_file
PRINT_STATUS $?

echo Enable
systemctl enable rabbitmq-server &>>$log_file
PRINT_STATUS $?

echo Start
systemctl start rabbitmq-server &>>$log_file
PRINT_STATUS $?

echo Add User
sudo rabbitmqctl add_user roboshop roboshop123 &>>$log_file

echo set premission
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>$log_file
PRINT_STATUS $?