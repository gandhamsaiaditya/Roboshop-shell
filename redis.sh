source ./common.sh
app_name=redis

echo Disable
dnf module disable $app_name -y &>>$log_file
PRINT_STATUS $?

echo Enable
dnf module enable $app_name -y &>>$log_file
PRINT_STATUS $?

echo Install
dnf install $app_name -y &>>$log_file
PRINT_STATUS $?

echo search and replace
sed -i -e 's|127.0.0.1|0.0.0.0|' -e '/protected-mode/ c protected-mode no' /etc/$app_name/$app_name.conf &>>$log_file
PRINT_STATUS $?

echo enable
systemctl enable $app_name &>>$log_file
PRINT_STATUS $?

echo Restart
systemctl restart $app_name &>>$log_file
PRINT_STATUS $?