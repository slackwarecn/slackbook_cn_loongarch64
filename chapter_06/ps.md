### ps

管理进程的第一步是找出当前正在运行的进程。最常用最强大的工具是`ps(1)`。没有任何参数时，`ps`不会告诉你太多信息。默认情况下，它仅仅会告诉你当前激活的终端里正在运行的进程。如果你想要更多信息，我们需要更加深入。

```
darkstar:~$ ps
  PID TTY          TIME CMD
12220 pts/4    00:00:00 bash
12236 pts/4    00:00:00 ps
```

你可以看到当前终端下所有运行的程序，而且只包括一部分信息。`PID`是进程ID；每一个进程都被标识了一个唯一的数字。`TTY`告诉你进程所连接的终端。`CMD`是运行的命令。你可能会对`TIME`有点困惑，因为它看起来变得太慢。这并不是进程已经运行的时间，而是进程消耗的**CPU时间**。事实上空闲进程不使用CPU时间，所以这个值不会增长得太快。

只看我们自己的进程没什么意思，所以让我们用`-e`参数查看系统上所有的进程。

```
darkstar:~$ ps -e
  PID TTY          TIME CMD
    1 ?        00:00:00 init
    2 ?        00:00:00 kthreadd
    3 ?        00:00:00 migration/0
    4 ?        00:00:00 ksoftirqd/0
    7 ?        00:00:11 events/0
    9 ?        00:00:01 work_on_cpu/0
   11 ?        00:00:00 khelper
  102 ?        00:00:02 kblockd/0
  105 ?        00:01:19 kacpid
  106 ?        00:00:01 kacpi_notify
... many more lines omitted ...
```

上面的例子使用了标准的ps语法，但是如果使用BSD语法会发现更多信息。我们可以使用`aux`参数达成目的。

> #### 注意
>
> 这与`-aux`参数是不同的，但是大多数情况下两者是等价的。这是很老的遗留问题。更多信息可以参考`ps`的man页面。

```
darkstar:~$ ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0   3928   632 ?        Ss   Apr05   0:00 init [3]
root         2  0.0  0.0      0     0 ?        S    Apr05   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S    Apr05   0:00 [migration/0]
root         4  0.0  0.0      0     0 ?        S    Apr05   0:00 [ksoftirqd/0]
root         7  0.0  0.0      0     0 ?        S    Apr05   0:11 [events/0]
root         9  0.0  0.0      0     0 ?        S    Apr05   0:01 [work_on_cpu/0]
root        11  0.0  0.0      0     0 ?        S    Apr05   0:00 [khelper]
... many more lines omitted ....
```

可以看到，BSD语法提供了更多的信息，包括哪个用户在控制进程以及当运行ps时进程的内存和CPU占用率。

为了完成这些，`ps`允许在进程的基础上提供一个或多个进程PID作为参数，且使用`-o`参数显示这些进程的特定属性。

```
darkstar:~$ ps -o cmd -o etime $$
CMD                             ELAPSED
/bin/bash                         12:22
```

这里显示的是进程的命令名称（cmd），和它的消逝的时间（etime）。这个例子中的 PID，是一个 shell 变量，是当前 shell 的 PID。所以你可以看到，在这个例子中，shell 进程存活了 12 分钟 22 秒。

使用 pgrep(1) 命令，可以更自动化的得到这些信息。

```
darkstar:~$ ps -o cmd -o rss -o vsz $(pgrep httpd)
CMD                           RSS    VSZ
/usr/sbin/httpd -k restart  33456  84816
/usr/sbin/httpd -k restart  33460  84716
/usr/sbin/httpd -k restart  33588  84472
/usr/sbin/httpd -k restart  30424  81608
/usr/sbin/httpd -k restart  33104  84900
/usr/sbin/httpd -k restart  33268  85112
/usr/sbin/httpd -k restart  30640  82724
/usr/sbin/httpd -k restart  15168  67396
/usr/sbin/httpd -k restart  33180  84416
/usr/sbin/httpd -k restart  33396  84592
/usr/sbin/httpd -k restart  32804  84232
```

在这个例子中，使用 grep 的子语句返回命令名包含 httpd 的所有进程。然后 ps 显示命令名，常驻内存大小和虚拟内存大小。

最后，ps 也可以创建进程树。这可以显示哪些进程有子进程。结束一个子进程的父进程也会结束这个子进程。我们可以使用 `[-ejH]` 做这些。

```
darkstar:~$ ps -ejH
... many lines omitted ...
 3660  3660  3660 tty1     00:00:00   bash
29947 29947  3660 tty1     00:00:00     startx
29963 29947  3660 tty1     00:00:00       xinit
29964 29964 29964 tty7     00:27:11         X
29972 29972  3660 tty1     00:00:00         sh
29977 29972  3660 tty1     00:00:05           xscreensaver
29988 29972  3660 tty1     00:00:04           xfce4-session
29997 29972  3660 tty1     00:00:16             xfwm4
29999 29972  3660 tty1     00:00:02             Thunar
... many more lines omitted ...
```

你可以看到，ps(1) 是很强大的工具，不仅仅能查看正在运行的进程，也能获取它们的一些重要的信息。

正如许多应用的情况，通常提供了一些工具做这项工作。与 `ps -ehH` 的输出相似，但是更精炼的是 pstree(1)。它更形象化地显示进程树。

```
darkstar:~$ pstree
init-+-atd
     |-crond
     |-dbus-daemon
     |-httpd---10*[httpd]
     |-inetd
     |-klogd
     |-mysqld_safe---mysqld---8*[{mysqld}]
     |-screen-+-4*[bash]
     |        |-bash---pstree
     |        |-2*[bash---ssh]
     |        `-bash---irssi
     |-2*[sendmail]
     |-ssh-agent
     |-sshd---sshd---sshd---bash---screen
     `-syslogd
```
