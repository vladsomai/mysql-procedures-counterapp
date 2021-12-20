/*
RUN FIRST TIME YOU INSTALL DB

create database counterdb;
SET GLOBAL log_bin_trust_function_creators = 1;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '3ng1n33r';
flush privileges;

*/

#USE THE BELOW COMMAND TO CREATE THE PROCEDURES AFTER FIRST TIME INSTALL
#SET SQL_SAFE_UPDATES = 0;


#TEST DB
#select * from projects;