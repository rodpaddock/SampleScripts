
sudo apt-get update 

#install some python utils for apt help
echo "installing python apt utils"
sudo apt-get -y install python-software-properties 

#update all of the package
echo "updating packages"
sudo add-apt-repository ppa:pitti/postgresql
sudo apt-get update 

echo "upgrading packages this takes a HECK OF A LONG TIME go get some coffee. Get me a cup too"
sudo apt-get upgrade -y  


echo "Package update complete!"