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

#### 5) Выполнил vagrant ssh nfss для подключения к ВМ nfss (NFS-сервер)

#### 6) Выполнил sudo -i для авторизации пользователем root для продолжения дальнейших действий по настройке ВМ nfss (NFS-сервер)

#### 7) Выполнил yum install nfs-utils для установки дополнительных утилит на ВМ nfss (NFS-сервер)
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
#### 8) Выполнил включение демона Firewall на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# systemctl enable firewalld --now
Created symlink from /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service to /usr/lib/systemd/system/firewalld.service.
Created symlink from /etc/systemd/system/multi-user.target.wants/firewalld.service to /usr/lib/systemd/system/firewalld.service.
```
#### 9) Проверил статус демона Firewall на ВМ nfss (NFS-сервер)
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
#### 10) Добавил Firewall правило для сервера NFS на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# firewall-cmd --add-service="nfs3" \
> --add-service="rpc-bind" \
> --add-service="mountd" \
> --permanent
success
```
#### 11) Перечитал конфигурацию Firewall для включения правила для сервера NFS на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# firewall-cmd --reload
success
```
#### 12) Включил демона NFS на ВМ nfss (NFS-сервер)
```
[root@nfss ~]# systemctl enable nfs --now
Created symlink from /etc/systemd/system/multi-user.target.wants/nfs-server.service to /usr/lib/systemd/system/nfs-server.service.
```
#### 13) Проверил порты 2049/udp, 2049/tcp, 20048/udp, 20048/tcp, 111/udp, 111/tcp - все порты слушаются
```
[root@nfss ~]# ss -tnplu | grep 2049
udp    UNCONN     0      0         *:2049                  *:*
udp    UNCONN     0      0      [::]:2049               [::]:*
tcp    LISTEN     0      64        *:2049                  *:*
tcp    LISTEN     0      64     [::]:2049               [::]:*
[root@nfss ~]# ss -tnplu | grep 20048
udp    UNCONN     0      0         *:20048                 *:*                   users:(("rpc.mountd",pid=3370,fd=7))
udp    UNCONN     0      0      [::]:20048              [::]:*                   users:(("rpc.mountd",pid=3370,fd=9))
tcp    LISTEN     0      128       *:20048                 *:*                   users:(("rpc.mountd",pid=3370,fd=8))
tcp    LISTEN     0      128    [::]:20048              [::]:*                   users:(("rpc.mountd",pid=3370,fd=10))
[root@nfss ~]# ss -tnplu | grep 111
udp    UNCONN     0      0         *:111                   *:*                   users:(("rpcbind",pid=338,fd=6))
udp    UNCONN     0      0      [::]:111                [::]:*                   users:(("rpcbind",pid=338,fd=9))
tcp    LISTEN     0      128       *:111                   *:*                   users:(("rpcbind",pid=338,fd=8))
tcp    LISTEN     0      128    [::]:111                [::]:*                   users:(("rpcbind",pid=338,fd=11))
```
#### 13) Создал директорию по пути /srv/NFS_share/upload
```
[root@nfss ~]# mkdir -p /srv/NFS_share/upload
```
#### 14) Настроил владельца созданной директории 
```
[root@nfss ~]# chown -R nfsnobody:nfsnobody /srv/NFS_share/
```
#### 15) Настроил права 0777 (чтение\запись\запуск для всех) для созданной директории 
```
[root@nfss ~]# chmod 0777 /srv/NFS_share/upload/
```
#### 16) Проверил наличие файла /etc/exports 
```
[root@nfss ~]# ls -l /etc | grep exports
-rw-r--r--.  1 root root        0 Jun  7  2013 exports
drwxr-xr-x.  2 root root        6 Oct 14 12:29 exports.d
```
#### 17) Создал запись в файле /etc/exports для экспорта директории. Добавил строку в файл /etc/exports при помощи редактора vi, затем проверил, что изменения сохранились 
```
[root@nfss ~]# cat /etc/exports
/srv/NFS_share 192.168.50.11/32(rw,sync,root_squash)
```
#### 18) Выполнил непосредственный экспорт директории и проверил, что экспорт выполнился
```
[root@nfss ~]# exportfs -r
[root@nfss ~]# exportfs -s
/srv/NFS_share  192.168.50.11/32(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,root_squash,no_all_squash)
```
#### 19) Выполнил vagrant ssh nfsc для подключения к ВМ nfsc (NFS-клиент)

#### 20) Выполнил sudo -i для авторизации пользователем root для продолжения дальнейших действий по настройке ВМ nfsc (NFS-клиента)

#### 21) По аналогии с NFS-сервером выполнил установку yum install nfs-utils дополнительных утилит на ВМ nfsc (NFS-клиент)

#### 22) По аналогии с NFS-сервером выполнил включение демона Firewall на ВМ nfsc (NFS-клиент) и проверил его статус

#### 23) Исходно проверил монтирование директории с NFS-сервера в ручном режиме - все работает:
```
[root@nfsc /]# mount 192.168.50.10:/srv/NFS_share/ /mnt/NFS_share/
[root@nfsc /]# ls -l /mnt/NFS_share/
total 0
drwxrwxrwx. 2 nfsnobody nfsnobody 6 Jan 24 19:02 upload
```
#### 24) Размонтировал директорию с NFS-сервера
```
[root@nfsc /]# umount /mnt/NFS_share
[root@nfsc /]# ls -l /mnt/NFS_share/
total 0
```
#### 25) Создал запись в файле /etc/fstab для автоматического монтирования директории с NFS-сервера при загрузке ОС. Добавил строку в файл /etc/fstab при помощи редактора vi, затем проверил, что изменения сохранились 
```
[root@nfsc ~]# cat /etc/fstab

#
# /etc/fstab
# Created by anaconda on Thu Apr 30 22:04:55 2020
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
UUID=1c419d6c-5064-4a2b-953c-05b2c67edb15 /                       xfs     defaults        0 0
/swapfile none swap defaults 0 0
#VAGRANT-BEGIN
# The contents below are automatically generated by Vagrant. Do not modify.
#VAGRANT-END
192.168.50.10:/srv/NFS_share/ /mnt/NFS_share/ nfs vers=3,proto=udp,noauto,xsystemd.automount 0 0
```
#### 24) Перечитал изменения в конфигурационных файлах демонов при помощи команды systemctl daemon-reload

#### 25) Перезапустил демона remote-fs.target при помощи команды systemctl restart remote-fs.target

#### 26) Выполнил переход в директорию /mnt/NFS_share и проверил факт монтирования директории с NFS-сервера:
```
[root@nfsc generator]# cd /mnt/NFS_share/
[root@nfsc NFS_share]# ls -l
total 0
drwxrwxrwx. 2 nfsnobody nfsnobody 6 Jan 24 19:02 upload
[root@nfsc NFS_share]# mount | grep NFS
systemd-1 on /mnt/NFS_share type autofs (rw,relatime,fd=23,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=47047)
192.168.50.10:/srv/NFS_share/ on /mnt/NFS_share type nfs (rw,relatime,vers=3,rsize=32768,wsize=32768,namlen=255,hard,proto=udp,timeo=11,retrans=3,sec=sys,mountaddr=192.168.50.10,mountvers=3,mountport=20048,mountproto=udp,local_lock=none,addr=192.168.50.10)
```
#### 27) Для тестирования создал файл test_file.txt на NFS-сервере по пути /srv/NFS_share/upload/:
```
[root@nfss ~]# touch /srv/NFS_share/upload/test_file.txt
[root@nfss ~]# ls -l /srv/NFS_share/upload/
total 0
-rw-r--r--. 1 root root 0 Jan 24 19:53 test_file.txt
```
#### 28) На NFS-клиенте по пути /mnt/NFS_share/upload/ проверил наличие файла созданного файла:
```
[root@nfsc upload]# cd /mnt/NFS_share/upload/
[root@nfsc upload]# ls -l
total 0
-rw-r--r--. 1 root root 0 Jan 24 19:53 test_file.txt
[root@nfsc upload]#
```
#### 29) На NFS-клиенте по пути /mnt/NFS_share/upload/ создал еще один файл test_file_client.txt:
```
[root@nfsc upload]# touch ./test_file_client.txt
[root@nfsc upload]# ls -l
total 0
-rw-r--r--. 1 nfsnobody nfsnobody 0 Jan 24 19:56 test_file_client.txt
-rw-r--r--. 1 root      root      0 Jan 24 19:53 test_file.txt
```
#### 30) На NFS-сервере по пути /srv/NFS_share/upload/ проверил наличие файла test_file_client.txt:
```
[root@nfss ~]# ls -l /srv/NFS_share/upload/
total 0
-rw-r--r--. 1 nfsnobody nfsnobody 0 Jan 24 19:56 test_file_client.txt
-rw-r--r--. 1 root      root      0 Jan 24 19:53 test_file.txt
[root@nfss ~]#
```
#### 31) Провел финальную проверку, выполнив перезагрузку клиента и проверив автоматическое монтирование директории с NFS-сервера - все работает:
```
[root@nfsc upload]# reboot
Connection to 127.0.0.1 closed by remote host.
Connection to 127.0.0.1 closed.
PS C:\OTUS\nfs> vagrant ssh nfsc
Last login: Mon Jan 24 19:15:33 2022 from 10.0.2.2
[vagrant@nfsc ~]$ uptime
 20:02:08 up 0 min,  1 user,  load average: 2.24, 0.70, 0.24
[vagrant@nfsc ~]$ mount | grep NFS
systemd-1 on /mnt/NFS_share type autofs (rw,relatime,fd=33,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=11300)
[vagrant@nfsc ~]$ ls -l /mnt/NFS_share/upload/
total 0
-rw-r--r--. 1 nfsnobody nfsnobody 0 Jan 24 19:56 test_file_client.txt
-rw-r--r--. 1 root      root      0 Jan 24 19:53 test_file.txt
[vagrant@nfsc ~]$
```
#### 32) Провел аналогичную финальную проверку, выполнив перезагрузку сервера и проверив автоматический запуск демона NFS и Firewall, затем содержимое файла /etc/exportfs и работу RPC - все работает:
```
[root@nfss ~]# reboot
Connection to 127.0.0.1 closed by remote host.
Connection to 127.0.0.1 closed.
PS C:\OTUS\nfs> vagrant ssh nfss
Last login: Mon Jan 24 20:07:18 2022 from 10.0.2.2
[vagrant@nfss ~]$ uptime
 20:33:59 up 5 min,  1 user,  load average: 0.02, 0.28, 0.19
[vagrant@nfss ~]$ sudo -i
[root@nfss ~]# ls -l /srv/NFS_share/upload/
total 0
-rw-r--r--. 1 nfsnobody nfsnobody 0 Jan 24 19:56 test_file_client.txt
-rw-r--r--. 1 root      root      0 Jan 24 19:53 test_file.txt
[root@nfss ~]# systemctl status nfs
● nfs-server.service - NFS server and services
   Loaded: loaded (/usr/lib/systemd/system/nfs-server.service; enabled; vendor preset: disabled)
  Drop-In: /run/systemd/generator/nfs-server.service.d
           └─order-with-mounts.conf
   Active: active (exited) since Mon 2022-01-24 20:29:13 UTC; 5min ago
  Process: 781 ExecStartPost=/bin/sh -c if systemctl -q is-active gssproxy; then systemctl reload gssproxy ; fi (code=exited, status=0/SUCCESS)
  Process: 760 ExecStart=/usr/sbin/rpc.nfsd $RPCNFSDARGS (code=exited, status=0/SUCCESS)
  Process: 755 ExecStartPre=/usr/sbin/exportfs -r (code=exited, status=0/SUCCESS)
 Main PID: 760 (code=exited, status=0/SUCCESS)
   CGroup: /system.slice/nfs-server.service

Jan 24 20:29:13 nfss systemd[1]: Starting NFS server and services...
Jan 24 20:29:13 nfss systemd[1]: Started NFS server and services.
[root@nfss ~]# systemctl status firewalld
● firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2022-01-24 20:29:08 UTC; 5min ago
     Docs: man:firewalld(1)
 Main PID: 373 (firewalld)
   CGroup: /system.slice/firewalld.service
           └─373 /usr/bin/python2 -Es /usr/sbin/firewalld --nofork --nopid

Jan 24 20:28:17 nfss systemd[1]: Starting firewalld - dynamic firewall daemon...
Jan 24 20:29:08 nfss systemd[1]: Started firewalld - dynamic firewall daemon.
Jan 24 20:29:08 nfss firewalld[373]: WARNING: AllowZoneDrifting is enabled. This is considered an insecure configuration option. It will be removed in a future release. Please consider disabling it now.
[root@nfss ~]# exportfs -s
/srv/NFS_share  192.168.50.11/32(sync,wdelay,hide,no_subtree_check,sec=sys,rw,secure,root_squash,no_all_squash)
[root@nfss ~]# showmount -a 192.168.50.10
All mount points on 192.168.50.10:
192.168.50.11:/srv/NFS_share
[root@nfss ~]#
```
