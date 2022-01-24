# NFS - Создание автоматизированного Vagrantfile

### Было сделано для выполнения домашнего задания:
#### 1) Создал Vagrantfile для запуска ВМ NFS-сервера и клиента, использовал конструкцию nfss.vm.provision "shell", path: "scripts_path" для указания скриптов для автоматизации установки и настройки серверой и клиентской частей
#### 2) Разместил файлы в репозитории https://github.com/andmisha/nfs/tree/main/finally
#### 3) Провел тестирование

#### 1) Выполнил команду vagrant up для создания и запуска ВМ из нового Vagrantfile
```
PS C:\OTUS\nfs\finally> vagrant up
Bringing machine 'nfss' up with 'virtualbox' provider...
Bringing machine 'nfsc' up with 'virtualbox' provider...
==> nfss: Importing base box 'centos/7'...
==> nfss: Matching MAC address for NAT networking...
==> nfss: Checking if box 'centos/7' version '2004.01' is up to date...
==> nfss: Setting the name of the VM: finally_nfss_1643059605226_77306
==> nfss: Clearing any previously set network interfaces...
==> nfss: Preparing network interfaces based on configuration...
    nfss: Adapter 1: nat
    nfss: Adapter 2: intnet
==> nfss: Forwarding ports...
    nfss: 22 (guest) => 2222 (host) (adapter 1)
==> nfss: Running 'pre-boot' VM customizations...
==> nfss: Booting VM...
==> nfss: Waiting for machine to boot. This may take a few minutes...
    nfss: SSH address: 127.0.0.1:2222
    nfss: SSH username: vagrant
    nfss: SSH auth method: private key
    nfss:
    nfss: Vagrant insecure key detected. Vagrant will automatically replace
    nfss: this with a newly generated keypair for better security.
    nfss:
    nfss: Inserting generated public key within guest...
==> nfss: Machine booted and ready!
==> nfss: Checking for guest additions in VM...
    nfss: No guest additions were detected on the base box for this VM! Guest
    nfss: additions are required for forwarded ports, shared folders, host only
    nfss: networking, and more. If SSH fails on this machine, please install
    nfss: the guest additions and repackage the box to continue.
    nfss:
    nfss: This is not an error message; everything may continue to work properly,
    nfss: in which case you may ignore this message.
==> nfss: Setting hostname...
==> nfss: Configuring and enabling network interfaces...
==> nfss: Rsyncing folder: /cygdrive/c/OTUS/nfs/finally/ => /vagrant
==> nfss: Running provisioner: shell...
    nfss: Running: C:/Users/MC31A~1.AND/AppData/Local/Temp/vagrant-shell20220125-18328-y9pt1s.sh
    nfss: Loaded plugins: fastestmirror
    nfss: Determining fastest mirrors
    nfss:  * base: mirror.reconn.ru
    nfss:  * extras: mirror.reconn.ru
    nfss:  * updates: mirror.reconn.ru
    nfss: Resolving Dependencies
    nfss: --> Running transaction check
    nfss: ---> Package nfs-utils.x86_64 1:1.3.0-0.66.el7 will be updated
    nfss: ---> Package nfs-utils.x86_64 1:1.3.0-0.68.el7.2 will be an update
    nfss: --> Finished Dependency Resolution
    nfss:
    nfss: Dependencies Resolved
    nfss:
    nfss: ================================================================================
    nfss:  Package          Arch          Version                    Repository      Size
    nfss: ================================================================================
    nfss: Updating:
    nfss:  nfs-utils        x86_64        1:1.3.0-0.68.el7.2         updates        413 k
    nfss:
    nfss: Transaction Summary
    nfss: ================================================================================
    nfss: Upgrade  1 Package
    nfss:
    nfss: Total download size: 413 k
    nfss: Downloading packages:
    nfss: No Presto metadata available for updates
    nfss: Public key for nfs-utils-1.3.0-0.68.el7.2.x86_64.rpm is not installed
    nfss: warning: /var/cache/yum/x86_64/7/updates/packages/nfs-utils-1.3.0-0.68.el7.2.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
    nfss: Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    nfss: Importing GPG key 0xF4A80EB5:
    nfss:  Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
    nfss:  Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
    nfss:  Package    : centos-release-7-8.2003.0.el7.centos.x86_64 (@anaconda)
    nfss:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    nfss: Running transaction check
    nfss: Running transaction test
    nfss: Transaction test succeeded
    nfss: Running transaction
    nfss:   Updating   : 1:nfs-utils-1.3.0-0.68.el7.2.x86_64                          1/2
    nfss:
    nfss:   Cleanup    : 1:nfs-utils-1.3.0-0.66.el7.x86_64                            2/2
    nfss:
    nfss:   Verifying  : 1:nfs-utils-1.3.0-0.68.el7.2.x86_64                          1/2
    nfss:
    nfss:   Verifying  : 1:nfs-utils-1.3.0-0.66.el7.x86_64                            2/2
    nfss:
    nfss:
    nfss: Updated:
    nfss:   nfs-utils.x86_64 1:1.3.0-0.68.el7.2
    nfss:
    nfss: Complete!
    nfss: Created symlink from /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service to /usr/lib/systemd/system/firewalld.service.
    nfss: Created symlink from /etc/systemd/system/multi-user.target.wants/firewalld.service to /usr/lib/systemd/system/firewalld.service.
    nfss: success
    nfss: success
    nfss: Created symlink from /etc/systemd/system/multi-user.target.wants/nfs-server.service to /usr/lib/systemd/system/nfs-server.service.
    nfss: Success server configuration!
==> nfsc: Importing base box 'centos/7'...
==> nfsc: Matching MAC address for NAT networking...
==> nfsc: Checking if box 'centos/7' version '2004.01' is up to date...
==> nfsc: Setting the name of the VM: finally_nfsc_1643059695437_4761
==> nfsc: Fixed port collision for 22 => 2222. Now on port 2200.
==> nfsc: Clearing any previously set network interfaces...
==> nfsc: Preparing network interfaces based on configuration...
    nfsc: Adapter 1: nat
    nfsc: Adapter 2: intnet
==> nfsc: Forwarding ports...
    nfsc: 22 (guest) => 2200 (host) (adapter 1)
==> nfsc: Running 'pre-boot' VM customizations...
==> nfsc: Booting VM...
==> nfsc: Waiting for machine to boot. This may take a few minutes...
    nfsc: SSH address: 127.0.0.1:2200
    nfsc: SSH username: vagrant
    nfsc: SSH auth method: private key
    nfsc:
    nfsc: Vagrant insecure key detected. Vagrant will automatically replace
    nfsc: this with a newly generated keypair for better security.
    nfsc:
    nfsc: Inserting generated public key within guest...
==> nfsc: Machine booted and ready!
==> nfsc: Checking for guest additions in VM...
    nfsc: No guest additions were detected on the base box for this VM! Guest
    nfsc: additions are required for forwarded ports, shared folders, host only
    nfsc: networking, and more. If SSH fails on this machine, please install
    nfsc: the guest additions and repackage the box to continue.
    nfsc:
    nfsc: This is not an error message; everything may continue to work properly,
    nfsc: in which case you may ignore this message.
==> nfsc: Setting hostname...
==> nfsc: Configuring and enabling network interfaces...
==> nfsc: Rsyncing folder: /cygdrive/c/OTUS/nfs/finally/ => /vagrant
==> nfsc: Running provisioner: shell...
    nfsc: Running: C:/Users/MC31A~1.AND/AppData/Local/Temp/vagrant-shell20220125-18328-1ah1ay2.sh
    nfsc: Loaded plugins: fastestmirror
    nfsc: Determining fastest mirrors
    nfsc:  * base: mirror.sale-dedic.com
    nfsc:  * extras: mirror.sale-dedic.com
    nfsc:  * updates: mirror.reconn.ru
    nfsc: Resolving Dependencies
    nfsc: --> Running transaction check
    nfsc: ---> Package nfs-utils.x86_64 1:1.3.0-0.66.el7 will be updated
    nfsc: ---> Package nfs-utils.x86_64 1:1.3.0-0.68.el7.2 will be an update
    nfsc: --> Finished Dependency Resolution
    nfsc:
    nfsc: Dependencies Resolved
    nfsc:
    nfsc: ================================================================================
    nfsc:  Package          Arch          Version                    Repository      Size
    nfsc: ================================================================================
    nfsc: Updating:
    nfsc:  nfs-utils        x86_64        1:1.3.0-0.68.el7.2         updates        413 k
    nfsc:
    nfsc: Transaction Summary
    nfsc: ================================================================================
    nfsc: Upgrade  1 Package
    nfsc:
    nfsc: Total download size: 413 k
    nfsc: Downloading packages:
    nfsc: No Presto metadata available for updates
    nfsc: Public key for nfs-utils-1.3.0-0.68.el7.2.x86_64.rpm is not installed
    nfsc: warning: /var/cache/yum/x86_64/7/updates/packages/nfs-utils-1.3.0-0.68.el7.2.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
    nfsc: Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    nfsc: Importing GPG key 0xF4A80EB5:
    nfsc:  Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
    nfsc:  Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
    nfsc:  Package    : centos-release-7-8.2003.0.el7.centos.x86_64 (@anaconda)
    nfsc:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    nfsc: Running transaction check
    nfsc: Running transaction test
    nfsc: Transaction test succeeded
    nfsc: Running transaction
    nfsc:   Updating   : 1:nfs-utils-1.3.0-0.68.el7.2.x86_64                          1/2
    nfsc:
    nfsc:   Cleanup    : 1:nfs-utils-1.3.0-0.66.el7.x86_64                            2/2
    nfsc:
    nfsc:   Verifying  : 1:nfs-utils-1.3.0-0.68.el7.2.x86_64                          1/2
    nfsc:
    nfsc:   Verifying  : 1:nfs-utils-1.3.0-0.66.el7.x86_64                            2/2
    nfsc:
    nfsc:
    nfsc: Updated:
    nfsc:   nfs-utils.x86_64 1:1.3.0-0.68.el7.2
    nfsc:
    nfsc: Complete!
    nfsc: Created symlink from /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service to /usr/lib/systemd/system/firewalld.service.
    nfsc: Created symlink from /etc/systemd/system/multi-user.target.wants/firewalld.service to /usr/lib/systemd/system/firewalld.service.
    nfsc: Success client configuration!
```
#### 2) Выполнил команду vagrant status для проверки корректного запуска ВМ
```
PS C:\OTUS\nfs\finally> vagrant status
Current machine states:

nfss                      running (virtualbox)
nfsc                      running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```
#### 3) Подкключился по SSH на клиента и проверил автоматическое монтирование папки и вывел на экран текущее содержимое директории, подключенной по NFS
```
PS C:\OTUS\nfs\finally> vagrant ssh nfsc
[vagrant@nfsc ~]$ sudo -i
[root@nfsc ~]# mount | grep NFSA
[root@nfsc ~]# mount | grep NFS
systemd-1 on /mnt/NFS_share type autofs (rw,relatime,fd=49,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=26520)
[root@nfsc ~]# ls -l /mnt/NFS_share/upload
total 0
[root@nfsc ~]# exit
logout
[vagrant@nfsc ~]$ exit
logout
Connection to 127.0.0.1 closed.
```
#### 4) Подкключился по SSH на NFS-сервер и проверил автоматический запуск демонов NFS и Firewall, создал тестовый файл
```
PS C:\OTUS\nfs\finally> vagrant ssh nfss
[vagrant@nfss ~]$ touch /srv/NFS_share/upload/test_file.txt
[vagrant@nfss ~]$ exit
logout
Connection to 127.0.0.1 closed.
```
#### 5) Подкключился по SSH на клиента и вывел на экран текущее содержимое директории, подключенной по NFS - созданный файл появился
```
PS C:\OTUS\nfs\finally> vagrant ssh nfsc
Last login: Mon Jan 24 21:29:52 2022 from 10.0.2.2
[vagrant@nfsc ~]$ sudo -i
[root@nfsc ~]# ls -l /mnt/NFS_share/upload
total 0
-rw-rw-r--. 1 vagrant vagrant 0 Jan 24 21:31 test_file.txt
[root@nfsc ~]#
```
