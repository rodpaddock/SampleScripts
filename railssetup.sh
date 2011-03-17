logfile="railsinstall.log"
echo "using ruby 1.9.2"
rvm  use 1.9.2

echo "install rails"
gem install bundler passenger rails --no-ri --no-rdoc >> $logfile 

echo "install postgres driver"
gem install pg --no-ri --no-rdoc >> $logfile
