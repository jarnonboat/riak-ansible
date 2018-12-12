# RIAK Ansible Playbook
Ansible Playbook to setup 3 nodes+ RIAK cluster

## Prerequisite
- At least 3 machines with up and running Linux-based system
- SSH connectivity between RIAK machines and Control machines
- Ansible modules on the controller machine

## Quick start
1. Edit configuration `cluster_setup/hosts` file to match your environment
2. On the controller machine 
```bash
# Check the connectivity with RIAK machines
ansible -m ping all

# If ping command is run successfully, run the ansible playbook
# It will prompt for sudo password on the RIAK machines
ansible-playbook -K playbook.yaml
```