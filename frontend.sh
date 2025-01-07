	echo Disable nginx
dnf module disable nginx -y &>>$log_file
PRINT_STATUS $?

echo Enable nginx
dnf module enable nginx:1.24 -y &>>$log_file
PRINT_STATUS $?

echo Install nginx
dnf install nginx -y &>>$log_file
PRINT_STATUS $?

echo Copy file
cp nginx.conf /etc/nginx/nginx.conf &>>$log_file
PRINT_STATUS $?

  echo Enable nginx
  systemctl enable nginx &>>$log_file
  PRINT_STATUS $?

  echo Start nginx
  systemctl start nginx &>>$log_file
  PRINT_STATUS $?

  echo Remove File
  rm -rf /usr/share/nginx/html/* &>>$log_file
  PRINT_STATUS $?

  echo Remove zip file
  rm -f /temp/frontend.zip &>>$log_file
  PRINT_STATUS $?

  echo Download zip file
  curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>>$log_file
  PRINT_STATUS $?

  echo Navigate to dir
  cd /usr/share/nginx/html &>>$log_file
  PRINT_STATUS $?

  echo unzip the file
  unzip /tmp/frontend.zip &>>$log_file
  PRINT_STATUS $?

  echo Restart nginx
  systemctl restart nginx &>>$log_file
  PRINT_STATUS $?