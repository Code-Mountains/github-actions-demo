# For github actions pipeline to run sudo without password, add this to /etc/sudoers file
sudo vim /etc/sudoers
sysadmin ALL=(ALL) NOPASSWD: /usr/bin/certbot