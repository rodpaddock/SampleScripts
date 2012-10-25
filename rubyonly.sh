logfile="install.log"
ruby_version="1.9.3"
ruby_version_string="1.9.3-p286"
ruby_source_url="http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.gz"
ruby_source_tar_name="ruby-1.9.3-p286.tar.gz"
ruby_source_dir_name="ruby-1.9.3-p286"

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


echo "installing ruby"


echo "loading bash shell again"
wget $ruby_source_url
tar -xzf $ruby_source_tar_name >> $logfile
cd  $ruby_source_dir_name && ./configure --prefix=/usr/local >> $logfile && make >> $logfile  && sudo make install >> $logfile


echo "install rails"
sudo gem install rails --no-ri --no-rdoc >> $logfile
sudo gem install bundler passenger  --no-ri --no-rdoc >> $logfile 

echo "install ruby sqlite 3 driver"
sudo gem install sqlite3-ruby >> $logfile

echo "install rspec"
sudo gem install rspec >> $logfile


echo "install haml"
sudo gem install haml >> $logfile
sudo gem install haml-rails >> $logfile

echo "install jquery for rails"
sudo gem install jquery-rails

echo "installing odbc"
sudo apt-get install unixodbc -y >> $logfile
sudo apt-get install unixodbc-dev -y >> $logfile
sudo apt-get install freetds-dev freetds-bin tdsodbc -y >> $logfile


echo "INSTALLATION COMPLETE"
echo "If you have problems running RVM from the command shell "
echo "Change your ubuntu terminal settings to create a login shell. "
echo "to do this: open a terminal. From the menu Edit->Profiles->Default->Edit"
echo "Select the Run Command As Login Shell"
echo "Close and repoen your terminal"
