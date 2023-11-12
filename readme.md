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


# Remove github action runner

## OUTPUT 
./config.sh remove --token BDPP23KI7VWLEIENQYJTQSLFKBZNY

# Runner removal



√ Runner removed successfully
√ Removed .credentials
√ Removed .runner


# Configure Github Action Runner to run as service using official instructions 
./config.sh --url https://github.com/Code-Mountains --token BDPP23IG6IRJ5SNUTPVYCADFKBZSK

## OUTPUT 

./config.sh --url https://github.com/Code-Mountains --token BDPP23IG6IRJ5SNUTPVYCADFKBZSK

--------------------------------------------------------------------------------
|        ____ _ _   _   _       _          _        _   _                      |
|       / ___(_) |_| | | |_   _| |__      / \   ___| |_(_) ___  _ __  ___      |
|      | |  _| | __| |_| | | | | '_ \    / _ \ / __| __| |/ _ \| '_ \/ __|     |
|      | |_| | | |_|  _  | |_| | |_) |  / ___ \ (__| |_| | (_) | | | \__ \     |
|       \____|_|\__|_| |_|\__,_|_.__/  /_/   \_\___|\__|_|\___/|_| |_|___/     |
|                                                                              |
|                       Self-hosted runner registration                        |
|                                                                              |
--------------------------------------------------------------------------------

# Authentication


√ Connected to GitHub

# Runner Registration

Enter the name of the runner group to add this runner to: [press Enter for Default] 

Enter the name of runner: [press Enter for vault] ub22

This runner will have the following labels: 'self-hosted', 'Linux', 'X64' 
Enter any additional labels (ex. label-1,label-2): [press Enter to skip] self-hosted,ub22,linux  

√ Runner successfully added
√ Runner connection is good

# Runner settings

Enter name of work folder: [press Enter for _work] 

√ Settings Saved.



# Install the service
sudo ./svc.sh install

## OUTPUT 

Creating launch runner in /etc/systemd/system/actions.runner.Code-Mountains.ub22.service
Run as user: sysadmin
Run as uid: 1000
gid: 1000
Created symlink /etc/systemd/system/multi-user.target.wants/actions.runner.Code-Mountains.ub22.service → /etc/systemd/system/actions.runner.Code-Mountains.ub22.service.


# Start the service
sudo ./svc.sh start

## OUTPUT 

sudo ./svc.sh start

/etc/systemd/system/actions.runner.Code-Mountains.ub22.service
● actions.runner.Code-Mountains.ub22.service - GitHub Actions Runner (Code-Mountains.ub22)
     Loaded: loaded (/etc/systemd/system/actions.runner.Code-Mountains.ub22.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2023-11-11 23:43:00 CST; 15ms ago
   Main PID: 6856 (runsvc.sh)
      Tasks: 2 (limit: 11792)
     Memory: 1.1M
        CPU: 8ms
     CGroup: /system.slice/actions.runner.Code-Mountains.ub22.service
             ├─6856 /bin/bash /home/sysadmin/actions-runner/runsvc.sh
             └─6858 ./externals/node16/bin/node ./bin/RunnerService.js

Nov 11 23:43:00 vault.thecodemountains.com systemd[1]: Started GitHub Actions Runner (Code-Mountains.ub22).
Nov 11 23:43:00 vault.thecodemountains.com runsvc.sh[6856]: .path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/s…go/bin
Hint: Some lines were ellipsized, use -l to show in full.



# Check Service Status
sudo ./svc.sh status

## OUTPUT 

$ sudo ./svc.sh status

/etc/systemd/system/actions.runner.Code-Mountains.ub22.service
● actions.runner.Code-Mountains.ub22.service - GitHub Actions Runner (Code-Mountains.ub22)
     Loaded: loaded (/etc/systemd/system/actions.runner.Code-Mountains.ub22.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2023-11-11 23:43:00 CST; 19s ago
   Main PID: 6856 (runsvc.sh)
      Tasks: 22 (limit: 11792)
     Memory: 41.4M
        CPU: 2.107s
     CGroup: /system.slice/actions.runner.Code-Mountains.ub22.service
             ├─6856 /bin/bash /home/sysadmin/actions-runner/runsvc.sh
             ├─6858 ./externals/node16/bin/node ./bin/RunnerService.js
             └─6870 /home/sysadmin/actions-runner/bin/Runner.Listener run --startuptype service

Nov 11 23:43:00 vault.thecodemountains.com systemd[1]: Started GitHub Actions Runner (Code-Mountains.ub22).
Nov 11 23:43:00 vault.thecodemountains.com runsvc.sh[6856]: .path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/s…go/bin
Nov 11 23:43:00 vault.thecodemountains.com runsvc.sh[6858]: Starting Runner listener with startup type: service
Nov 11 23:43:00 vault.thecodemountains.com runsvc.sh[6858]: Started listener process, pid: 6870
Nov 11 23:43:00 vault.thecodemountains.com runsvc.sh[6858]: Started running service
Nov 11 23:43:02 vault.thecodemountains.com runsvc.sh[6858]: √ Connected to GitHub
Nov 11 23:43:02 vault.thecodemountains.com runsvc.sh[6858]: Current runner version: '2.311.0'
Nov 11 23:43:02 vault.thecodemountains.com runsvc.sh[6858]: 2023-11-12 05:43:02Z: Listening for Jobs
Hint: Some lines were ellipsized, use -l to show in full.

# Uninstall service
sudo ./svc.sh uninstall


```