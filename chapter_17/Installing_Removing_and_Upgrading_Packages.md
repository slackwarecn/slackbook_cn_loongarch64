### 软件包的安装、移除和升级

`pkgtool` 很方便，但 `installpkg(8)` 更合适处理一些不常做的事，比如要安装一个单独的包，或者要安装一整个硬盘的包，又或者想用脚本控制安装过程等等。像所有的 Slackware 包管理工具一样， `installpkg` 不会自作聪明，只会乖乖的照吩咐办事。来看看 `installpkg` 最基本的用法：告诉 `installpkg` 要安装哪些包，它就会毫不犹豫地安装这些包。

```
darkstar:~# installpkg blackbox-0.70.1-i486-2.txz
Verifying package blackbox-0.70.1-i486-2.txz.
Installing package blackbox-0.70.1-i486-2.txz:
PACKAGE DESCRIPTION:
# blackbox (Blackbox window manager)
#
# Blackbox is that fast, light window manager you have been looking for
# without all those annoying library dependencies.
#
# Also included in this package is the bbkeys utility for controlling
# keyboard shortcut commands from within Blackbox.
#
# The Blackbox home page is http://blackboxwm.sourceforge.net
#
Package blackbox-0.70.1-i486-2.txz installed.
```

借助于 shell 通配符，还可以一下子安装很多个包。要从一个已挂载的光盘中安装所有 N 系列的包，只需要这么做：

```
darkstar:~# installpkg /mnt/cdrom/slackware/n/*.txz
```

不论何时，都可以查看 `/var/log/packages` 目录来了解当前系统中安装了哪些包和它们的版本。用 `cat` 命令可以显示一个包的内容，包括它的大小，它是做什么的，它在哪里安装了哪些文件：

```
darkstar:~# cat /var/log/packages/foo-1.0-x86_64.txz
```

移除包和安装包一样简单。也许和你想的一样，移除包的命令是 `removepkg(8)` 。告诉 `removepkg` 要移除哪些包，它会在软件包数据库中检查这些包的内容，给出一个警告，然后移除这些包中所有的文件和目录。如果要移除的文件属于多个包共同拥有，该文件不会被删除，如果一个目录中有其他文件，这个目录不会被删除。因此，移除一个包会比安装它更费时间。

```
darkstar:~# removepkg blackbox-0.70.1-i486-2.txz
```

最后，升级包也是那么简单，你一定猜到了，用 `upgradepkg(8)` 。 `upgradepkg` 先安装新软件包，再移除旧软件包留下的所有文件和目录。要注意的是 `upgradepkg` 不会检查已安装包的版本是不是比“新”软件包的版本还要高，有了这一点，`upgradepkg` 也可以用来降级软件包。

```
darkstar:~# upgradepkg blackbox-0.70.1-i486-2.txz

+==============================================================================
| Upgrading blackbox-0.65.0-x86_64-4 package using
./blackbox-0.70.1-i486-2.txz
+==============================================================================

Pre-installing package blackbox-0.70.1-i486-2...

Removing package
/var/log/packages/blackbox-0.65.0-x86_64-4-upgraded-2010-02-23,16:50:51...
  --> Deleting symlink /usr/share/blackbox/nls/POSIX
  --> Deleting symlink /usr/share/blackbox/nls/US_ASCII
  --> Deleting symlink /usr/share/blackbox/nls/de
  --> Deleting symlink /usr/share/blackbox/nls/en
  --> Deleting symlink /usr/share/blackbox/nls/en_GB
...
Package blackbox-0.65.0-x86_64-4 upgraded with new package
./blackbox-0.70.1-i486-2.txz.
```

以上所有工具都可以添加很多有用的参数。比如，向 `installpkg` 添加 `--root` 参数可以把包安装在任何目录中。 `--dry-run` 参数可以命令 `upgradepkg` 在不对系统做任何改变的情况下显示它要做的事。更多细节请参考 man 手册。
