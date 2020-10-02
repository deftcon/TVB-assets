## Cisco - Tetration Sensor Deployment
#### Requirements

* Ansible should be pre-installed on the control machine
* Install required python libraries
	```
	pip install pywinrm
	```
#### Installation Guide

* Navigate to the main repository directory
* Add your hosts to inventory file
* Update playbooks/group_vars/all.yml with following varibles
    ```
    ---
    linux_sensor_file: your-tet-sensor-rpm
    win_sensor_file: your-tet-sensor-zip
    activation_key: your-activation-key
    ```
* Also add username and password for all the hosts i.e. inventory/hosts
	```
	[linux]
	127.0.0.1

	[linux:vars]
	ansible_user=root
	ansible_password=12345678
	ansible_sudo_pass=12345678

	[win]
	127.0.0.1

	[win:vars]
	ansible_user=administrator@domain.com
	ansible_password=12345678
	ansible_connection=winrm
	ansible_winrm_transport=basic | ntlm | kerberos
	ansible_winrm_server_cert_validation=ignore
	validate_certs=false
	```
* Run the following command to install Tetration Sensor
	```
	ansible-playbook playbooks/install.yml -i inventory/hosts
	```
* Run the following command to remove Tetration Sensor
	```
	ansible-playbook playbooks/rollback.yml -i inventory/hosts
	```
