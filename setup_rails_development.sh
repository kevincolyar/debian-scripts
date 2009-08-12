#!/usr/bin/env bash
set -e 

PACKAGES='build-essential sqlite3 libsqlite3-dev libsqlite3-ruby imagemagick libmagickwand-dev ruby ruby1.8-dev libyaml-ruby libzlib-ruby rdoc vim git-core subversion rsync freetds-dev tdsodbc unixodbc unixodbc-dev libdbd-odbc-ruby libaio1'

echo "Installing apt packages"
sudo apt-get update
sudo apt-get install $PACKAGES

echo "Installing rubygems"
wget http://rubyforge.org/frs/download.php/45905/rubygems-1.3.1.tgz 
tar zxfv rubygems-1.3.1.tgz
cd rubygems-1.3.1
sudo ruby setup.rb
if [! -L /usr/bin/gem]; then
  sudo ln -s /usr/bin/gem1.8 /usr/bin/gem
fi 
cd ..

echo "Add github to rubygem sources"
sudo gem sources -a http://gems.github.com

sudo gem update
sudo gem install rubygems-update

echo "Install gems"
GEMS='rails cgi_multipart_eof_fix cucumber daemons diff-lcs faker fastthread gem_plugin hoe memcache-client mongrel mongrel_cluster net-ping net-sftp net-ssh passenger polyglot populator rack rake randexp rmagick rspec rspec-rails ruby-net-ldap rubyforge rubygems-update sqlite3-ruby term-ansicolor treetop ZenTest'

echo "Install activerecord-sqlserver-adapter"
sudo gem install activerecord-sqlserver-adapter 
#--source=http://gems.rubyonrails.org

sudo gem install $GEMS
