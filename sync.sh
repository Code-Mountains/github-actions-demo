sudo cp /etc/systemd/system/actions.runner.Code-Mountains.ub22.service etc/systemd/system/
sudo chown -R sysadmin:sysadmin /home/sysadmin/Documents/code/actions/github-actions-demo/
cp /home/sysadmin/actions-runner/runsvc.sh /home/sysadmin/Documents/code/actions/github-actions-demo/

sudo cp /etc/pam.d/sudo /home/sysadmin/Documents/code/actions/github-actions-demo/etc/pam.d/sudo

mkdir -p /home/sysadmin/Documents/code/actions/github-actions-demo/var/log/letsencrypt

sudo cp /var/log/letsencrypt/letsencrypt.log /home/sysadmin/Documents/code/actions/github-actions-demo/var/log/letsencrypt/