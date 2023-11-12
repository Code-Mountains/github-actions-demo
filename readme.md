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
./config.sh remove --token $TOKEN

# Runner removal



√ Runner removed successfully
√ Removed .credentials
√ Removed .runner


# Configure Github Action Runner to run as service using official instructions 
./config.sh --url https://github.com/Code-Mountains --token $TOKEN

## OUTPUT 

./config.sh --url https://github.com/Code-Mountains --token $TOKEN

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


# Check size of folder in linux filesystem
du -hs ../actions-runner/

## OUTPUT 
2.3G    ../actions-runner/


# Identify service name running Github Actions runner service
systemctl list-units | grep actions.runner


# Restart Github Actions Runner service 
sudo systemctl restart actions.runner.Code-Mountains.ub22.service
sudo systemctl status actions.runner.Code-Mountains.ub22.service


# Find detailed logs of github action runner as service using journalctl 
sudo journalctl -b -u actions.runner.Code-Mountains.ub22.service


## OUTPUT 

-- Boot ea3cf100859d453981e96d72889fc956 --
Nov 11 23:49:26 vault.thecodemountains.com systemd[1]: Started GitHub Actions Runner (Code-Mountains.ub22).
Nov 11 23:49:26 vault.thecodemountains.com runsvc.sh[913]: .path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/sysadmin/.dotnet/tools:/opt/mssql-tools/bin:/home/sysadmin/.dotnet/tools:/opt/mssql-tools/bin:/opt/mssql-tools/bin://home/sysadmin/go/bin
Nov 11 23:49:26 vault.thecodemountains.com runsvc.sh[925]: Starting Runner listener with startup type: service
Nov 11 23:49:26 vault.thecodemountains.com runsvc.sh[925]: Started listener process, pid: 1000
Nov 11 23:49:26 vault.thecodemountains.com runsvc.sh[925]: Started running service
Nov 11 23:49:31 vault.thecodemountains.com runsvc.sh[925]: √ Connected to GitHub
Nov 11 23:49:31 vault.thecodemountains.com runsvc.sh[925]: Current runner version: '2.311.0'
Nov 11 23:49:31 vault.thecodemountains.com runsvc.sh[925]: 2023-11-12 05:49:31Z: Listening for Jobs
Nov 11 23:53:39 vault.thecodemountains.com runsvc.sh[925]: 2023-11-12 05:53:39Z: Running job: renew-certs
Nov 11 23:53:44 vault.thecodemountains.com sudo[3198]: pam_unix(sudo:auth): conversation failed
Nov 11 23:53:44 vault.thecodemountains.com sudo[3198]: pam_unix(sudo:auth): auth could not identify password for [sysadmin]
Nov 11 23:53:44 vault.thecodemountains.com sudo[3198]: pam_sss(sudo:auth): authentication failure; logname= uid=1000 euid=0 tty= ruser=sysadmin rhost= user=sysadmin
Nov 11 23:53:44 vault.thecodemountains.com sudo[3198]: pam_sss(sudo:auth): received for user sysadmin: 10 (User not known to the underlying authentication module)
Nov 11 23:53:48 vault.thecodemountains.com runsvc.sh[925]: 2023-11-12 05:53:48Z: Job renew-certs completed with result: Failed
Nov 11 23:54:36 vault.thecodemountains.com runsvc.sh[925]: Shutting down runner listener
Nov 11 23:54:36 vault.thecodemountains.com runsvc.sh[925]: Sending SIGINT to runner listener to stop
Nov 11 23:54:36 vault.thecodemountains.com runsvc.sh[925]: Sending SIGKILL to runner listener
Nov 11 23:54:36 vault.thecodemountains.com runsvc.sh[925]: Exiting...
Nov 11 23:54:36 vault.thecodemountains.com systemd[1]: Stopping GitHub Actions Runner (Code-Mountains.ub22)...
Nov 11 23:55:06 vault.thecodemountains.com runsvc.sh[925]: Runner listener exited with error code null
Nov 11 23:55:06 vault.thecodemountains.com runsvc.sh[925]: Runner listener exit with undefined return code, re-launch runner in 5 seconds.
Nov 11 23:55:06 vault.thecodemountains.com systemd[1]: actions.runner.Code-Mountains.ub22.service: Deactivated successfully.
Nov 11 23:55:06 vault.thecodemountains.com systemd[1]: Stopped GitHub Actions Runner (Code-Mountains.ub22).
Nov 11 23:55:06 vault.thecodemountains.com systemd[1]: actions.runner.Code-Mountains.ub22.service: Consumed 9.654s CPU time.
-- Boot 1f1acb5992d8430bb8a907500d9e03b6 --
Nov 11 23:57:25 vault.thecodemountains.com systemd[1]: Started GitHub Actions Runner (Code-Mountains.ub22).
Nov 11 23:57:25 vault.thecodemountains.com runsvc.sh[944]: .path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/sysadmin/.dotnet/tools:/opt/mssql-tools/bin:/home/sysadmin/.dotnet/tools:/opt/mssql-tools/bin:/opt/mssql-tools/bin://home/sysadmin/go/bin
Nov 11 23:57:26 vault.thecodemountains.com runsvc.sh[961]: Starting Runner listener with startup type: service
Nov 11 23:57:26 vault.thecodemountains.com runsvc.sh[961]: Started listener process, pid: 1059
Nov 11 23:57:26 vault.thecodemountains.com runsvc.sh[961]: Started running service
Nov 11 23:57:33 vault.thecodemountains.com runsvc.sh[961]: √ Connected to GitHub
Nov 11 23:57:33 vault.thecodemountains.com runsvc.sh[961]: Current runner version: '2.311.0'
Nov 11 23:57:33 vault.thecodemountains.com runsvc.sh[961]: 2023-11-12 05:57:33Z: Listening for Jobs
Nov 11 23:58:34 vault.thecodemountains.com runsvc.sh[961]: 2023-11-12 05:58:34Z: Runner connect error: The HTTP request timed out after 00:01:00.. Retrying until reconnected.
Nov 12 00:06:00 vault.thecodemountains.com runsvc.sh[961]: 2023-11-12 06:06:00Z: Runner reconnected.
Nov 12 00:06:00 vault.thecodemountains.com runsvc.sh[961]: 2023-11-12 06:06:00Z: Running job: renew-certs
Nov 12 00:06:07 vault.thecodemountains.com sudo[3421]: pam_unix(sudo:auth): conversation failed
Nov 12 00:06:07 vault.thecodemountains.com sudo[3421]: pam_unix(sudo:auth): auth could not identify password for [sysadmin]
Nov 12 00:06:07 vault.thecodemountains.com sudo[3421]: pam_sss(sudo:auth): authentication failure; logname= uid=1000 euid=0 tty= ruser=sysadmin rhost= user=sysadmin
Nov 12 00:06:07 vault.thecodemountains.com sudo[3421]: pam_sss(sudo:auth): received for user sysadmin: 10 (User not known to the underlying authentication module)
Nov 12 00:06:11 vault.thecodemountains.com runsvc.sh[961]: 2023-11-12 06:06:11Z: Job renew-certs completed with result: Failed




```