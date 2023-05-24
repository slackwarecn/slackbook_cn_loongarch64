### 设置图形界面登陆

默认情况下，Slackware Linux 启动后显示的是登录提示符和虚拟终端，但这难以满足大多数人的需要。如果你只要运行命令行程序，直接登录就是了。如果你想要运行“X”, 只需运行 `startx`, 但像笔记本用户那样，除图形界面外几乎不使用其他功能呢？让 Slackware 直接把你带到图形界面不是更好吗？幸好，我们能简单地做到这一点。

Slackware 使用 System V 启动系统，它能让管理员启动或跳转进不同的运行级别（runlevel, 就是系统能处于的不同“状态”）。实际上，关机就是改变运行级别的一个例子。运行级别十分复杂，所以如非必要我们不做探讨。

可用 `inittab(5)` 来配置运行级别。最常用的就是 runlevel 3（Slackware 默认）和 runlevel 4（图形界面）。要让 Slackware 启动图形界面，只要用你最喜欢的编辑器（编辑器可参考 `vi` 或 `emacs` 的相关章节）打开 `/etc/inittab`. 在文件开头就能看到相关条目。

```
# These are the default runlevels in Slackware:
#   0 = halt
#   1 = single user mode
#   2 = unused (but configured the same as runlevel 3)
#   3 = multiuser mode (default Slackware runlevel)
#   4 = X11 with KDM/GDM/XDM (session managers)
#   5 = unused (but configured the same as runlevel 3)
#   6 = reboot

# Default runlevel. (Do not set to 0 or 6)
id:3:initdefault:
```

在这个配置文件（其他配置文件也差不多）中，`#` 表示这一行是注释，不被 `init(8)` 读取。如果你不是很了解 `inittab` 的内容的话，不用担心，因为许多老手也不是很了解。现在我们最关注的就是上面例子中的最后一行，把 `3` 改成 `4`, 重启。

```
# These are the default runlevels in Slackware:
#   0 = halt
#   1 = single user mode
#   2 = unused (but configured the same as runlevel 3)
#   3 = multiuser mode (default Slackware runlevel)
#   4 = X11 with KDM/GDM/XDM (session managers)
#   5 = unused (but configured the same as runlevel 3)
#   6 = reboot

# Default runlevel. (Do not set to 0 or 6)
id:4:initdefault:
```

> 译者注：**绝对**不要把运行级别改为**0**或者**6**！
