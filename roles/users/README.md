# Deploy

1. Config for new servers:

    ```ansible-playbook -i hosts user.yml --tags=servers
    ```

- Edit config ssh and add the first sudoer user to servers

    ```ansible-playbook -i hosts user.yml --tags=users
    ```

2. Add user for servers:

- Add public-key to `./roles/users/files/public_keys/<user>.pub`
- Add "name" to `roles/user/vars/main.yaml`
- Add IP server to `roles/user/vars/main.yml`
    
    ```ansible-playbook -i after_hosts user.yml --limit='web-server' -u root -k --tags=users
    ```

    ```ansible-playbook -i after_hosts user.yml --limit='web-server' -u hoanpv -k --ask-become-pass --tags=users
    ```
    
- option `-k` if use password to login server
- option `--ask-become-pass` if normal user become sudoer
    
- hosts: New host ( default ssh port: 22)
- after_hosts: Host is deployed ( SSH port: 1102)
- --tags="users": Execute task with this tags
- --untagged="install_sudo": Not execute task with this tags
- --limit="web-server": Limit group host in inventory run this task
- -u: User have sudo previledge

Note: The same "name" anywhere
