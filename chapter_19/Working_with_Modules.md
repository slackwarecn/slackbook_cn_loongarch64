### 设置内核模块

现代 linux 内核的复杂度是惊人的。 内核源码在未压缩的情况下有将近 400MB 大小。有成千上万的开发者为内核贡献代码，内核中有数以百计编译的选项，如果把这些都编译到一起，仅内核的大小都将会很快超过 100MB。为了防止内核容量过大（同时也防止内核所占用的 RAM 过多），大多数内核选项是作为模块（modules）被构建的。你可以把这些模块看做设备驱动程序，它们可以从运行中的内核上被随意添加或移除。但事实上，它们中的许多根本不是驱动程序，但是却包含了诸如网络协议，安全措施，甚至对文件系统的支持等内容。总之，几乎 linux 内核中任何一个部分都可以被构建成一个可加载模块。

我们需要认识到 Slackware 将为您自动处理大多数模块的加载。当您的系统启动时，`udevd` 已经启动并开始查找您的系统硬件。对于找到的每个设备，它都会自动加载适当的内核模块并在 `/dev` 下创建一个设备节点（device node）。这通常意味着你将不需要自己手动加载任何模块就可以使用您的计算机，但是有时候手动加载也是必要的。

那么，我们该如何知道什么模块当前加载我们的计算机上以及我们如何加载和卸载它们？幸运的是我们拥有一套完整的处理这个问题的工具。正如你可能已经猜到的那样，列出模块的工具是 `lsmod` 。

```
root@slackwarecn:~# lsmod
Module                  Size  Used by
cfg80211              458399  0
8021q                  28415  0
garp                    9059  1 8021q
stp                     2997  1 garp
mrp                    11318  1 8021q
llc                     7021  2 stp,garp
rfkill                 27245  1 cfg80211
efivarfs               14057  1
... many more lines ommitted ...
```

除了向您展示哪些模块被加载外，它还展示了每个模块的大小并告诉你有哪些其他模块正在使用这个模块。

我们有两个负责加载模块的应用程序：`insmod` 和 `modprobe` 。它们两个都可以加载模块并且报告任何错误（例如加载了一个系统中不存在的设备的模块），但我们首选 `modprobe`，因为它可以加载任何模块的依赖关系。这两个应用程序中的任何一个都可以被直接使用。

```
root@slackwarecn:~# insmod /lib/modules/6.3.0/kernel/fs/fat/fat.ko
root@slackwarecn:~# modprobe vfat
root@slackwarecn:~# lsmod |grep fat
vfat                   13779  0
fat                    74203  1 vfat
```

移除一个模块是一个棘手的过程，这里我们也有两个工具来移除模块：`rmmod` 和 `modprobe` 。使用 `modprobe` 的 `-r` 参数可以移除一个模块。

```
root@slackwarecn:~# rmmod vfat
root@slackwarecn:~# modprobe -r fat
root@slackwarecn:~# lsmod |grep fat
```
