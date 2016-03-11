### wicd

让我来介绍`wicd(8)`，实际生活中笔记本用户的首要有线无线网络连接管理工具，其发音为"wicked"(`/'wɪkɪd/`)。`wicd`能存储任意数量的无线网络连接信息，连接时只需简单的命令或者是点几下鼠标。`wicd`目前不包含在默认Slackware安装内，因为它与配置网络适配器的传统方式格格不入。不过，你仍然能够在你的Slackware安装盘或者偏好Slackware源内的`/extra`目录找到它。`wicd`不仅是一个网络连接守护进程，还可以是一个配置网络的图形化程序。它的命令行版本也并未被人遗忘，因为`wicd-curses(8)`与它传统的图形化前端不相伯仲。要使用`wicd`的话，你首先要禁用`rc.inet1.conf`里配置的任何接口配置。

```fundamental
# rc.inet1.conf
# =============
# Config information for eth0:
IPADDR[0]=""
NETMASK[0]=""
USE_DHCP[0]="no"
DHCP_HOSTNAME[0]=""
# Default gateway IP address:
GATEWAY=""
```

现在可以安装`wicd`了，配置守护进程为开机启动，并从此使用一个更加用户友好的程序。

```Shell
darkstar:~# installpkg /path/to/extra/wicd/wicd-1.6.2.1-1.txz
darkstar:~# chmod +x /etc/rc.d/rc.wicd
darkstar:~# /etc/rc.d/rc.wicd start
```

如果你主要使用控制台的话，只需运行`wicd-curses`。此外，还可以使用由`X`提供的图形化桌面，你可以在那上面用KDE或XFCE菜单启动`wicd`图形化前端。

![ ](http://slackbook.org/beta/img/wicd.png)

此外，你可以通过终端或运行对话框手动运行`wicd-client(1)`。

在图形化前端上，可通过在ESSID列表旁的`Preference`按钮来配置不同的网络。使用终端客户端的话，选中你想使用的ESSID并按下右方向键可有同样效果，都能打开对应网络的配置页面。
