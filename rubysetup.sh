logfile="install.log"

#install some python utils for apt help
echo "installing python apt utils"
sudo apt-get -y install python-software-properties >> $logfile

#update all of the package
echo "updating packages"
sudo add-apt-repository ppa:pitti/postgresql >> $logfile #postgres package
sudo apt-get update >> $logfile

echo "upgrading packages"
sudo apt-get upgrade -y  >> $logfile

#git
echo "installing git"
sudo apt-get install git-core -y >> $logfile 


#build tools
echo "installing build tools"
sudo apt-get -y install \
    wget curl build-essential \
    bison openssl zlib1g \
    libxslt1.1 libssl-dev libxslt1-dev \
    libxml2 libffi-dev libyaml-dev \
    libxslt-dev autoconf libc6-dev \
    libreadline6-dev zlib1g-dev libcurl4-openssl-dev >> $logfile

#make sure bash is here
echo "bashing..."
touch $HOME/.bashrc && touch $HOME/.bash_profile


#install postgres
echo "installing postgres"
sudo apt-get -y install postgresql-9.0 libpq-dev >> $logfile

#install postgres admin tool
echo "installing postgres admin"
sudo apt-get -y install pgadmin3 >> $logfile


#ruby version manager
echo "installing ruby version manager"
curl -O -L http://rvm.beginrescueend.com/releases/rvm-install-head  >> $logfile

#make file runnable
chmod +x rvm-install-head


"$PWD/rvm-install-head" >> $logfile 
[[ -f rvm-install-head ]] && rm -f rvm-install-head

echo "$PWD/rvm-install-head" >> $logfile
echo  '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*' >> ~/.bash_profile

source $HOME/.rvm/scripts/rvm
source $HOME/.bashrc
source $HOME/.bash_profile

echo "installing ruby"
rvm install 1.9.2

echo "loading bash shell again"
source $HOME/.rvm/scripts/rvm
source $HOME/.bashrc
source $HOME/.bash_profile


echo "using ruby 1.9.2"
rvm  use 1.9.2

echo "install rails"
gem install bundler passenger rails --no-ri --no-rdoc >> $logfile 

echo "install postgres driver"
gem install pg --no-ri --no-rdoc >> $logfile
