# NAGIOS-ANSIBLE-REMOTE
- This Ansible playbook configures Nagios Plugins and NRPE on a **Remote Machine** which is to be monitored by a Nagios Monitoring Server.

**Note**:
If you will like to configure a Monitoring server, there is a [repository](https://github.com/andela-ayusuf/nagios-ansible) that helps with with that.

**Requirements**

- Before running this Ansible playbook, you must have Ansible installed locally. You can find out about how to install Ansible [here](http://docs.ansible.com/ansible/intro_installation.html).
- The private key to the VM which is to be configured is also a requirement.

**Clone This Project**
```
git clone https://github.com/andela-ayusuf/nagios-ansible-remote.git
```

**Variables**

You will need to update the variables files i.e. **vars.yml** and **vars.rb** files with the appropriate variables. Currently there are only dummy variables in the variable files and this will not work. The **inventory.ini** file also has to be updated with the public IP address of the VM which is about to be configured.


**Running The Project**

From your terminal, cd into this project directory:

```
$ cd nagios-ansible-remote
```
Run the playbook:
```
$ ansible-playbook playbook.remote-nagios.yml -i inventory.ini --private-key=path/to/private/key
```
With that done you have set up a remote host which would is ready to be monitored by a Nagios Monitoring Server.

**Issues**

If you happen to run into any problems while using this playbook or you would like to make contributions to it, please endeavour to open an issue [here](https://github.com/andela-ayusuf/nagios-ansible/issues).

Best regards :)