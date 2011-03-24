After the program has installed we need to do more work to get postgres installed
for development. 

#run the postgres utility to create a new user in this image the user will be RAILSDEV
sudo -u postgres createuser --superuser $USER

#use this command to open the postgres shell
sudo -u postgres psql

#run this command:  
\password RAILSDEV

#set the password to 123456

#now create a database for RAILSDEV from the psql window
create database RAILSDEV

#logout and activate psql from the command window
psql

now run these commands
  create database windermere_development
  create database windermere_production
  create database windermere_test
  
  
