Simple setup to test salt stack.

#Contains
* Vagrant `master` precise64
 	* salt-master
 	* [halite](https://github.com/saltstack/halite)
 	* 192.168.250.2
* Vagrant `minion` precise64
	* 192.168.250.3
* Vagrant `minion2` win7
	* 192.168.250.4
	

# Usage
* `vagrant up` → `grab a coffee`
* [http://192.168.250.2:8080/app](http://192.168.250.2:8080/app) → `vagrant:vagrant`

## Prepare Minion 2
 * Install Chocolatey
 * Install Python
 * Install Salt
 * Alter hosts-file

`master`contains states in base and srv-folder.
@see master.conf

* `vagrant ssh master`
	* Maybe it's necessary to restart salt-minion on minion/minion2
* `sudo salt 'minion' state.highstate`
* `sudo salt 'minion' state.sls vim`



## Misc

* Reset master `vagrant destroy master && vagrant up master`
* Redo provisioning `vagrant provision master`
* Reset minion `vagrant destroy minion && vagrant up minion`
* Redo provisioning `vagrant provision minion`


## Special THX to
* [https://github.com/tzehon/vagrant-windows/](tzehon/vagrant-windows)