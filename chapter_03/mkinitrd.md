### mkinitrd

在我们更深入之前，尚需要对 Linux 内核做出一些讨论。Slackware Linux 包含至少两种（有时更多）不同的内核。尽管它们是由同一份源代码编译而来，因此你可能认为它们是“相同的”，然而并不是。根据你的架构和 Slackware 版本，安装程序可能已经加载了系统和几个内核。有针对单处理器系统的内核和多处理器系统（在 32 位的 Slackware 上）的内核。在过去，有许多种内核，分别安装在许多不同类型的硬盘驱动控制器上。对我们的讨论很重要的一点就是，它们分为“巨型”内核和“通用”内核。

查看一下你的 `/boot` 目录，就会发现安装在你系统上的各种各样的内核。

```
darkstar:~# ls -1 /boot/vmlinuz*
/boot/vmlinuz-huge-2.6.29.4
/boot/vmlinuz-generic-2.6.29.4
```

如上你可以看见安装了两种内核，`vmlinuz-huge-2.6.29.4` 和 `vmlinuz-generic-2.6.29.4` 。每个 Slackware 公开发行版都会包含多个版本的内核，有时在文件名上稍有差异，所以如果你看到的的输出和上面的不同时不必惊慌。

巨型内核正如其名。但这**并不**意味着它们含有所有可用的驱动程序并把这些驱动编译进入内核。相反，这些内核是为了能够启动（并运行）在所有 Slackware 能支持的电脑上而设计的（虽然仍有一部分电脑无法正常启动/运行）。它们大多包含一些针对你机器上没有的硬件（以后也不会有）的支持，但这不是重点。出于各种原因我们附带上了这些内核，其中最重要的原因就是——它们是 Slackware 安装介质使用的内核。如果你选择让安装程序为您自动配置 bootloader 的话，它会使用这些内核来为数不尽的硬件提供支持。与之相反，通用内核不使用外部模块的话只能驱动很少一部分的硬件。如果你想使用通用内核的话，你就会用上 initrd，它是 `mkinitrd(8)` 工具生成的。

那么，为什么要使用通用内核呢？目前出于各种原因，Slackware 的开发团队建议使用通用内核。也许最显然的原因是文件大小。在未压缩并未加载到内存之前，巨型内核是通用内核的约两倍大小。如果您运行的是旧机器，或内存很小的机器，你会明白通用内核缩减大小的好处。其他原因就较为难以量化。巨型内核包含的驱动程序之间时不时就会发生冲突。一般来讲，巨型内核性能不如通用内核。此外，使用通用内核的话，就分别能给硬件驱动传递特殊的参数，而不需要在内核命令行上传递。如果你的内核使用的是外部模块形式的驱动程序，而不是静态地把他们构建进内核的时候，一些 Slackware 上的工具的性能会更高。如果你不是很懂，也不要惊慌：只要记得“巨型内核意味着好，通用内核意味着更好”。

不幸的是，使用通用内核不如使用巨型内核那么简单。为了使通用内核来引导你的系统，你还必须在 initrd 上加载几个基本模块。模块是编译好的内核代码段，可插入内核或从运行的内核去掉（最好使用 `modprobe(8)`，这使得系统只是增加了一点点的复杂性的基础上变得更加灵活。至少在这个部分，模块会让你联想到设备驱动程序。通常情况下，安装时不管你的根分区是什么文件系统都要加载对应的模块，如果你的根分区位于 SCSI 硬盘或者 RAID 控制器上也要加载模块。最后，如果你使用软件 RAID，硬盘加密，或 LVM，你还需要创建一个 initrd，无论你是否使用通用内核。

initrd 是一个 `cpio(1)` 文档，所以创建起来不是那么简单。还好，Slackware 为你提供了一个使这一过程简单化的工具：`mkinitrd`. 真要详细讨论 `mkinitrd` 的话就超出了本书的讨论范围，在此只展示重点。更详细的解释请看手册页或使用 `mkinitrd` 的 `--help` 参数。

```
darkstar:~# mkinitrd --help
mkinitrd creates an initial ramdisk (actually an initramfs cpio+gzip
archive) used to load kernel modules that are needed to mount the
root filesystem, or other modules that might be needed before the
root filesystem is available.  Other binaries may be added to the
initrd, and the script is easy to modify.  Be creative.  :-)
.... many more lines deleted ....
```

使用 `mkinitrd` 时，你需要掌握如下几个信息：你的根分区、根分区文件系统、你所使用的所有硬盘控制器、是否在使用 LVM，软件 RAID，硬盘加密。除非你在用某种 SCSI 控制器（并且根分区位于其上），你只需要知道根分区的文件系统和分区类型。现在假设你使用巨型内核启动进入了 Slackware 安装环境，此时只需使用 `mount` 命令查看 `/proc/mount` 的内容就能轻易地知道。

```
darkstar:~# mount
/dev/sda1 on / type ext4 (rw,barrier=1,data=ordered)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
usbfs on /proc/bus/usb type usbfs (rw)
/dev/sda2 on /home type jfs (rw)
tmpfs on /dev/shm type tmpfs (rw)
```

在上面的这个例子中，能知道你的根分区位于 `/dev/sda1` 并且是一个 ext4 分区类型。如果想为这个系统创建 initrd，只需将这些信息告知 `mkinitrd`.

```
darkstar:~# mkinitrd -f ext4 -r /dev/sda1
```

值得注意的是 `mkinitrd` 在大多数情况下能够自行确定这些信息，但自己手动指定的话又不会有什么坏处。既然我们创建了 initrd，我们就要告诉 LILO 去哪能找到它。这些将在下一章节详细描述。

看看这些 `mkinitrd` 的选项就头疼，更别说记下它们了，尤其是你还想尝试各种不同内核的时候。Slackware 开发团队也觉得很不爽，所以他们制作了一个简单的配置文件，`mkinitrd.conf(5)` 。你能在 `/etc/mkinitrd.conf.sample` 找到样板文件并自己定制。拿我自己的举例：

```
darkstar:~# cat /etc/mkinitrd.conf.sample
# See "man mkinitrd.conf" for details on the syntax of this file
#
SOURCE_TREE="/boot/initrd-tree"
CLEAR_TREE="0"
OUTPUT_IMAGE="/boot/initrd.gz"
KERNEL_VERSION="$(uname -r)"
#KEYMAP="us"
MODULE_LIST="ext3:ext4:jfs"
#LUKSDEV="/dev/hda1"
ROOTDEV="/dev/sda1
ROOTFS="ext4"
#RESUMEDEV="/dev/hda2"
#RAID="0"
LVM="1"
#WAIT="1"
```

若想详细了解这里每一行干了什么，请参见 `mkinitrd.conf` 的手册页面。将该样板复制为 `/etc/mkinitrd.conf` 并做出你自己的定制化修改。成功配置后，只需以 `-F` 参数运行 `mkinitrd`, 这样就能得到正确的 initrd 文件而不用去记忆那些繁之又繁的参数。

如果你不确定如何确定配置文件选项或命令行参数，以下是最终选择：Slackware 提供了一个小工具（`/usr/share/mkinitrd/mkinitrd_command_generator.sh`），能告知你当前运行内核所需的选项值。运行这个脚本后就能输出对应你当前电脑的 `mkinitrd` 命令，不过你最好还是在运行前检查一遍。

```
darkstar:~# /usr/share/mkinitrd/mkinitrd_command_generator.sh
mkinitrd -c -k 2.6.33.4 -f ext3 -r /dev/sda3 -m \
  usbhid:ehci-hcd:uhci-hcd:ext3 -o /boot/initrd.gz
```
