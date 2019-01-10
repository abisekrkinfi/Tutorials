function say_green
{
	echo -e '\E[00;32m'"\033[1m$@\033[0m"
}
function say_red
{
	echo -e '\E[47;31m'"\033[1m$@\033[0m"
}

function apt_get_stuff
{
	say_red "Installing necessary packages"
	sudo apt-get update
	sudo apt-get --yes --force-yes -f install \
	wget curl build-essential clang \
	bison openssl zlib1g \
	libxslt1.1 libssl-dev libxslt1-dev \
	libxml2 libffi-dev libyaml-dev \
	libxslt-dev autoconf libc6-dev \
	libreadline6-dev zlib1g-dev libcurl4-openssl-dev \
	libtool git-core subversion libsqlite3-0 sqlite3 \
	libsqlite3-dev libmysqlclient-dev \
	git-core memcached subversion libxml2-dev \
	htop vim aptitude libmagickwand-dev libxslt-dev \
	unzip openssh-server apache2-dev \
	libapr1-dev libaprutil1-dev \
	libmagickwand-dev \
	jpegoptim optipng libxslt-dev \
	unzip zip nfs-common sysstat

	say_green "Installed necessary packages"
}

function ssh_keys
{
	ssh-keygen -A -t rsa
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
}

function install_java
{
	say_red "Installing Java"
	sudo mkdir -p /usr/lib/jvm
	cd /usr/lib/jvm
	arch=`/bin/uname -m`
	if [ $arch = "x86_64" ] ;then
		sudo wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz
		sudo tar -xvf jdk-7u55-linux-x64.tar.gz
	else
		sudo wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-i586.tar.gz
		sudo tar -xvf jdk-7u55-linux-i586.tar.gz
	fi
	touch ~/.bashrc
	echo "JAVA_HOME=/usr/lib/jvm/jdk1.7.0_55" >> ~/.bashrc
	echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc
	source ~/.bashrc
	say_green "Java Installation Done" 
}


function install_rvm
{
  say_red "Installing systemwide RVM"
  sudo gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -L https://get.rvm.io | sudo bash -s stable
  echo '
  source /etc/profile.d/rvm.sh
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
  ' >> ~/.bashrc
  source /etc/profile.d/rvm.sh
  source ~/.bashrc
  sudo chown -R `whoami`:`whoami` /usr/local/rvm
  say_green "RVM installed"
  say_red "Installing ruby"
  rvm install ree
  rvm --default use ree
  say_green "Installed Ruby"
  say_red "Configuring environment"
  export CFLAGS='-O2 -fno-tree-dce -fno-optimize-sibling-calls'
  export CC='/usr/bin/gcc'
  rvm rubygems 1.5.3 --force
}


function rails_setup
{
	say_red "Installing required gems"
	gem update --system 1.5.0 -V
	gem install --version 0.9.6 rake --no-rdoc --no-ri
	gem install --version 2.3.8 rails --no-rdoc --no-ri
	gem install --version 2.8.1 mysql --no-rdoc --no-ri
	gem install --version 1.2.2 bundler --no-rdoc --no-ri
	gem install --version 1.6.4 rack --no-rdoc --no-ri
	gem install --version 1.6.20 highline --no-rdoc --no-ri
	gem install --version 2.9.2 net-ssh --no-rdoc --no-ri
	gem install --version 1.2.0 net-ssh-gateway --no-rdoc --no-ri
	gem install --version 2.15.4 capistrano --no-rdoc --no-ri
	gem install --version 3.0.17 passenger --no-rdoc --no-ri
	gem install --version 0.4.1 i18n --no-rdoc --no-ri
	gem install capistrano-log_with_awesome --no-rdoc --no-ri
	gem install capistrano_colors --no-rdoc --no-ri
	say_green "Gems installed"
	echo "export RAILS_ENV=development" >> ~/.bashrc
	source ~/.bashrc
	source /etc/apache2/envvars
	passenger-install-apache2-module --auto
	sudo echo "LoadModule passenger_module /usr/local/rvm/gems/ree-1.8.7-2012.02/gems/passenger-3.0.17/ext/apache2/mod_passenger.so
		PassengerRoot /usr/local/rvm/gems/ree-1.8.7-2012.02/gems/passenger-3.0.17
		PassengerRuby /usr/local/rvm/wrappers/ree-1.8.7-2012.02/ruby" > /etc/apache2/apache2.conf
}


function mysql_setup
{
	say_red "Installing mysql"
	sudo apt-get install mysql-server-5.5 --yes --force-yes -f
	sudo wget "https://s3-ap-southeast-1.amazonaws.com/bab-backup/install_oracle_client.sh"
	echo "export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib" >> ~/.bashrc
	echo "export ORACLE_HOME=/usr/lib/oracle" >> ~/.bashrc
	source ~/.bashrc
    sudo chmod +x install_oracle_client.sh
    sudo ./install_oracle_client.sh
	mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql
}


function apache_setup
{
	say_red "Installing apache2"
	sudo apt-get install apache2 --yes --force-yes -f
	sudo a2dismod -f autoindex.load
}

function directories_setup
{
	say_green "Setting up /runtime "
	me=$(whoami)
	mygrp=$(id --group --name)
	if [ -e /runtime ]
		then
		if [ ! -w /runtime ]
			then
			say_red "/runtime not writable"
			sudo chown -R $me:$mygrp /runtime
			sudo chmod +w /runtime 
		fi
	else
		say_red "/runtime needs to be created"
		sudo mkdir -p /runtime
		sudo chown -R $me:$mygrp /runtime
	fi

	mkdir -p /runtime/images/
	mkdir -p /runtime/ims_staging/
	mkdir -p /runtime/csv_staging/
	mkdir /runtime/local/solr-4.10
	mkdir /runtime/local/solr-4.10/variant_index
	mkdir /runtime/local/solr-4.10/variant_index/conf
}

function setup_solr
{
	export APPS="$PWD/../"

	cp $APPS/tomcat-7.0.53-solr-4.10/solr-conf/* /runtime/local/solr-4.10/variant_index/conf/

	cp $APPS/tomcat-7.0.53-solr-4.10/solr-conf/solr.xml  /runtime/local/solr-4.10/

	mkdir $APPS/tomcat-7.0.53-solr-4.10/logs

	touch $APPS/tomcat-7.0.53-solr-4.10/logs/catalina.out

	$APPS/tomcat-7.0.53-solr-4.10/bin/catalina.sh start

	$APPS/admin/script/solr_bg_control.rb stop
	$APPS/admin/script/push_to_solr_control.rb stop

	$APPS/admin/script/solr_bg_control.rb start
	$APPS/admin/script/push_to_solr_control.rb start
}

 function install_imagemagick
 {
       export CURR="$PWD"
       wget "https://www.imagemagick.org/download/releases/ImageMagick-6.7.7-10.tar.xz"
       sudo mv ImageMagick-6.7.7-10.tar.xz /opt/
       cd /opt/
       sudo tar -zJf ImageMagick-6.7.7-10.tar.xz
       cd ImageMagick-6.7.7-10
       sudo ./configure
       sudo make
       sudo make install
       sudo ldconfig /usr/local/lib
       cd $CURR
 }

function clone_bab_code
{
	say_red "Assuming your Public SSH key is added to unfuddle"
	cd; git clone git@infibeam.unfuddle.com:infibeam/bennu-git2.git infibeam/bennu-git2
}

function gitconfig
{
	say_green "Enter your full name"
	read name
	say_green "Enter your infibeam email address"
	read email
	echo "[core]
    whitespace = nowarn
    pager = less -FRSX
    edito = vim
    editor = vim
[user]
    name = "$name"
    email = "$email"
[color]
    ui = auto
    diff = auto
    status = auto
    branch = auto
[alias]
    spull = !git-svn fetch && git-svn rebase
    spush = !git-svn dcommit
    send = !git spull && git spush
    co = checkout
    ci = commit
    ca = commit -a
    br = branch
    st = status
    lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
    undo = reset --hard
    changes=diff --name-status -r
    diffstat=diff --stat -r
    serve = daemon --reuseaddr --verbose  --base-path=. --export-all ./.git
    whois = \"!sh -c 'git log -i -1 --pretty=\"format:%an <%ae>\n\" --author=\"$1\"' -\"
    whatis = show -s --pretty='tformat:%h (%s, %ad)' --date=short
    edit-unmerged = \"!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; vim \`f\`\"
    add-unmerged = \"!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add \`f\`\"
[giggle]
    main-window-maximized = true
    main-window-geometry = 700x550+66+24
    history-view-vpane-position = 281
    main-window-view = HistoryView
    file-view-vpane-position = 460" > ~/.gitconfig
}


function just_do_it 
{
	say_green "Select 1 to continue or 0 to exit"
	read choice
	if [ $choice -eq 1 ] ; then
		apt_get_stuff
		install_java
		install_rvm
		ssh_keys
		rails_setup
		mysql_setup
		apache_setup
		directories_setup
		setup_solr
		install_imagemagick
		clone_bab_code
		gitconfig
	else
		exit 0
	fi
}
