Simple setup to test salt stack.

#Contains
* Vagrant `master`
 	* salt-master
 	* [halite](https://github.com/saltstack/halite)
 	* 192.168.250.2
	

* Vagrant `minion`
	* 192.168.250.3
	

# Usage
* `vagrant up`
* [http://192.168.250.2:8080/app](http://192.168.250.2:8080/app)

`master`contains states in base and srv-folder.
@see master.conf

* `vagrant ssh master`
	* Maybe it's necessary to restart salt-minion on minion
* `salt-key -a saltminion`
* `sudo salt 'minion' state.highstate`

* `sudo salt 'minion' state.sls vim`



## Misc

* Reset master `vagrant destroy master && vagrant up master`
* Redo provisioning `vagrant provision master`
* Reset minion `vagrant destroy minion && vagrant up minion`
* Redo provisioning `vagrant provision minion`