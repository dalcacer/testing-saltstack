sudo apt-get update -y -q
sudo apt-get install -y -q curl vim zsh git ruby rake build-essential python python-setuptools python-pip pv htop python-software-properties python-dev gcc libevent-dev python-openssl

sudo add-apt-repository -y ppa:saltstack/salt
sudo apt-get update -y -q
sudo apt-get install -y salt-master
sudo cp /vagrant/master.conf /etc/salt/master
sudo pip install -U halite gevent cherrypy 
