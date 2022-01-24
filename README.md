# NFS

### Было сделано для выполнения домашнего задания:

#### 1) Создал новый репозиторий для домашней работы:
- GitHub -https://github.com/andmisha/nfs

#### 2) Склонировал репозиторий к себе
```
git clone https://github.com/andmisha/nfs C:\OTUS\nfs
```
#### 3) Создал в папке C:\OTUS\nfs Vagrantfile со следующим содержимым:
```
Vagrant.configure(2) do |config|
config.vm.box = "centos/7"
config.vm.box_version = "2004.01"
config.vm.provider "virtualbox" do |v|
v.memory = 256
v.cpus = 1
end
config.vm.define "nfss" do |nfss|
nfss.vm.network "private_network", ip: "192.168.50.10",
virtualbox__intnet: "net1"
nfss.vm.hostname = "nfss"
end
config.vm.define "nfsc" do |nfsc|
nfsc.vm.network "private_network", ip: "192.168.50.11",
virtualbox__intnet: "net1"
nfsc.vm.hostname = "nfsc"
end
end
```

#### 4) Выполнил vagrant up для создания и запуска ВМ nfss (NFS-сервер) и nfsc (NFS-клиент) из образа centos/7. Выполнил vagrant status для проверки запуска созданных ВМ.
```
PS C:\OTUS\nfs> vagrant status
Current machine states:

nfss                      running (virtualbox)
nfsc                      running (virtualbox)
```

### 5) Выполнил vagrant ssh nfss для подключения к ВМ nfss (NFS-сервер)

### 6) Выполнил sudo -i для авторизации пользователем root для продолжения дальнейших действий по настройке ВМ nfss (NFS-сервер)

### 7) Выполнил yum install nfs-utils для установки демона NFS-сервера и дополнительных утилит на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# yum install nfs-utils
Loaded plugins: fastestmirror
Determining fastest mirrors
 * base: centos-mirror.rbc.ru
 * extras: centos-mirror.rbc.ru
 * updates: mirror.corbina.net
base                                                                                                                                                                                                                                                    | 3.6 kB  00:00:00
extras                                                                                                                                                                                                                                                  | 2.9 kB  00:00:00
updates                                                                                                                                                                                                                                                 | 2.9 kB  00:00:00
(1/4): base/7/x86_64/group_gz                                                                                                                                                                                                                           | 153 kB  00:00:00
(2/4): extras/7/x86_64/primary_db                                                                                                                                                                                                                       | 243 kB  00:00:00
(3/4): base/7/x86_64/primary_db                                                                                                                                                                                                                         | 6.1 MB  00:00:01
(4/4): updates/7/x86_64/primary_db                                                                                                                                                                                                                      |  13 MB  00:00:02
Resolving Dependencies
--> Running transaction check
---> Package nfs-utils.x86_64 1:1.3.0-0.66.el7 will be updated
---> Package nfs-utils.x86_64 1:1.3.0-0.68.el7.2 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

===============================================================================================================================================================================================================================================================================
 Package                                                          Arch                                                          Version                                                                   Repository                                                      Size
===============================================================================================================================================================================================================================================================================
Updating:
 nfs-utils                                                        x86_64                                                        1:1.3.0-0.68.el7.2                                                        updates                                                        413 k

Transaction Summary
===============================================================================================================================================================================================================================================================================
Upgrade  1 Package

Total download size: 413 k
Is this ok [y/d/N]: y
Downloading packages:
No Presto metadata available for updates
warning: /var/cache/yum/x86_64/7/updates/packages/nfs-utils-1.3.0-0.68.el7.2.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY                                                                                              ]  0.0 B/s |    0 B  --:--:-- ETA
Public key for nfs-utils-1.3.0-0.68.el7.2.x86_64.rpm is not installed
nfs-utils-1.3.0-0.68.el7.2.x86_64.rpm                                                                                                                                                                                                                   | 413 kB  00:00:01
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Importing GPG key 0xF4A80EB5:
 Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
 Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
 Package    : centos-release-7-8.2003.0.el7.centos.x86_64 (@anaconda)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Is this ok [y/N]: y
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Updating   : 1:nfs-utils-1.3.0-0.68.el7.2.x86_64                                                                                                                                                                                                                         1/2
  Cleanup    : 1:nfs-utils-1.3.0-0.66.el7.x86_64                                                                                                                                                                                                                           2/2
  Verifying  : 1:nfs-utils-1.3.0-0.68.el7.2.x86_64                                                                                                                                                                                                                         1/2
  Verifying  : 1:nfs-utils-1.3.0-0.66.el7.x86_64                                                                                                                                                                                                                           2/2

Updated:
  nfs-utils.x86_64 1:1.3.0-0.68.el7.2

Complete!
```
### 8) Выполнил включение демона Firewall на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# systemctl enable firewalld --now
Created symlink from /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service to /usr/lib/systemd/system/firewalld.service.
Created symlink from /etc/systemd/system/multi-user.target.wants/firewalld.service to /usr/lib/systemd/system/firewalld.service.
```
### 9) Проверил статус демона Firewall на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# systemctl status firewalld
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2022-01-24 18:53:35 UTC; 18s ago
     Docs: man:firewalld(1)
 Main PID: 3208 (firewalld)
   CGroup: /system.slice/firewalld.service
           └─3208 /usr/bin/python2 -Es /usr/sbin/firewalld --nofork --nopid

Jan 24 18:53:34 nfss systemd[1]: Starting firewalld - dynamic firewall daemon...
Jan 24 18:53:35 nfss systemd[1]: Started firewalld - dynamic firewall daemon.
Jan 24 18:53:35 nfss firewalld[3208]: WARNING: AllowZoneDrifting is enabled. This is considered an insecure configuration option. It will be removed in a future release. Please consider disabling it now.
```
### 10) Добавил Firewall правило для сервера NFS на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# firewall-cmd --add-service="nfs3" \
> --add-service="rpc-bind" \
> --add-service="mountd" \
> --permanent
success
```
### 11) Перечитал конфигурацию Firewall для включения правила для сервера NFS на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# firewall-cmd --reload
success
```
### 12) Включил демона NFS на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# systemctl enable nfs --now
Created symlink from /etc/systemd/system/multi-user.target.wants/nfs-server.service to /usr/lib/systemd/system/nfs-server.service.
```
### 13) Включил демона NFS на ВМ nfss (NFS-сервер)
