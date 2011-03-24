logfile="install.log"
ruby_version="1.9.2"
ruby_version_string="1.9.2p180"
ruby_source_url="ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.2-p180.tar.gz"
ruby_source_tar_name="ruby-1.9.2-p180.tar.gz"
ruby_source_dir_name="ruby-1.9.2-p180"

#git
echo "installing git"
sudo apt-get install git-core -y >> $logfile 


echo "installing sqlite 3"
sudo apt-get install sqlite3 libsqlite3-dev -y >> $logfile


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

echo "install ruby sqlite 3 driver"
gem install sqlite3-ruby --no-ri --no-rdoc >> $logfile

echo "install rspec"
gem install rspec --no-ri --no-rdoc >> $logfile


echo "install haml"
gem install haml --no-ri --no-rdoc >> $logfile
gem install haml-rails --no-ri --no-rdoc >> $logfile

echo "install jquery for rails"
gem install jquery-rails --no-ri --no-rdoc >> $logfile




echo "INSTALLATION COMPLETE"
echo "If you have problems running RVM from the command shell "
echo "Change your ubuntu terminal settings to create a login shell. "
echo "to do this: open a terminal. From the menu Edit->Profiles->Default->Edit"
echo "Select the Run Command As Login Shell"
echo "Close and repoen your terminal"
