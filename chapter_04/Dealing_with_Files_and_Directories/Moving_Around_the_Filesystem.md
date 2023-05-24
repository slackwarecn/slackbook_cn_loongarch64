#### 在文件系统中移动

`cd` 是用来改变当前目录的命令。不像其他命令那样，`cd` 实际上不是独立程序而是 shell 的内建命令（built-in）。基本上，那也就意味着 `cd` 没有自己的手册页。你得查看你 shell 的文档来查看 `cd` 的详细情况。大部分情况下，它们是一样的。

> 译者注：但是你可以通过 `help cd` 指令来查看 `cd` 内建命令的手册。

```
darkstar:~$ cd /
darkstar:/$ls
bin/   dev/  home/  lost+found/  mnt/  proc/  sbin/  sys/  usr/
boot/  etc/  lib/   media/       opt/  root/  srv/   tmp/  var/
darkstar:/$cd /usr/local
darkstar:/usr/local$
```

注意到改变目录时提示符的变化了吗？默认情况下 Slackware shell 将其用作一个查看当前目录的快速，简单的方式，但这实际上不是 `cd` 的功能。如果你的 shell 不像这样显示，你也能用 `pwd(1)` 轻易地获取你当前工作目录。（大多数 UNIX shell 能配置出这个显示目录的功能。实际上，这是另一个 Slackware 做出的小改进。）

```
darkstar:~$ pwd
/usr/local
```
