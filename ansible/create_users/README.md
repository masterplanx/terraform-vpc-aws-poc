# create_users

User Settings
------------

- Default Shell = /bin/bash, you can set up any shell in users.yml
- Add the public key in pub_keys dir (username.pub)
- In users.yml specify that user should have the right to sudo or not, users' login name and fullname

Usage
------------
- install ansible
- create keys
- configure client server authorized_keys
- upload repository and change
- run command

```
ansible-playbook -i host.subdomain.domain, --private-key=key.pem playbook.yml
```
