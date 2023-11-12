```

## For github actions pipeline to run sudo without password, add this to /etc/sudoers file
sudo vim /etc/sudoers
sysadmin ALL=(ALL) NOPASSWD: /usr/bin/certbot


# Configure Github Action to Run as Service
TOKEN=secret-token
OWNER=Code-Mountains
REPO=github-actions-demo

./config.sh --url https://github.com/$OWNER/$REPO --token $TOKEN

# Install the service
sudo ./svc.sh install

# Start the service
sudo ./svc.sh start

# Check Service Status
sudo ./svc.sh status

# Uninstall service
sudo ./svc.sh uninstall


```