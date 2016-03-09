### 分区

和其他大多数的Linux发行版本不同，Slackware没有一个专门的图形化分区工具，而是使用传统的Linux分区工具。传统情况下，分区是用`fdisk`或者`cfdisk`进行的，这两个都是命令行的工具。大多数人们倾向于使用`cfdisk`，因为它是基于菜单的而且同样工作的很好。除此以外，Slackware还包含`sfdisk`和`gdisk`命令行工具。`gdisk`被用于GUID的分区表。在这本书中，我们主要讲`fdisk`，其他的工具用法相似。你可以在网上或是手册中找到其他工具的使用方法。

为了对硬盘进行分区，你首先要先知道如何识别它。在Linux中，所有的硬件都被识别成设备文件。这些文件位于`/dev`目录中。今天几乎所有的硬盘都被内核识别为SCSI硬盘，同时它们被分配为诸如`/dev/sda`的设备文件（曾经有一段时间每个硬盘类型都有它自己独有的识别，像是`/dev/hda`表示第一块IDE盘。几年后，内核的SCSI子系统演变成了通用的驱动接入系统被用于所有的硬盘和光驱而不论它们是如何接入你的计算机的。如果你对此感到困惑，想象一下如果你有一个接入了SCSI硬盘，SATA光驱和USB的系统，所有的都是独特的子系统识别身份。而现在的系统不仅干净而且工作得更好）

如果你不知道你的硬盘被分配了那个设备文件，fdisk可以帮助你。

```
root@slackware:/# fdisk -l

Disk /dev/sda: 72.7 GB, 72725037056 bytes
255 heads, 63 sectors/track, 8841 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
```

这里你可以看到我的系统有一块位于`/dev/sda`的72.7GB硬盘。你可以看到一些额外的信息。`-l`参数用来显示硬盘和分区信息，但是不会作出修改，为了进行分区需要告诉fdisk要对哪块硬盘进行操作。

```
root@slackware:/# fdisk /dev/sda

The number of cylinders for this disk is set to 8841.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help):
```

现在我们告诉`fdisk`我们希望分区。1024柱面限制并不是问题，Slackware引导大于此的硬盘也没有问题。输入`m`来获取帮助。

```
Command (m for help): m
Command action
   a   toggle a bootable flag
   b   edit bsd disklabel
   c   toggle the dos compatibility flag
   d   delete a partition
   l   list known partition types
   m   print this menu
   n   add a new partition
   o   create a new empty DOS partition table
   p   print the partition table
   q   quit without saving changes
   s   create a new empty Sun disklabel
   t   change a partition's system id
   u   change display/entry units
   v   verify the partition table
   w   write table to disk and exit
   x   extra functionality (experts only)
```

在最小情况下，你需要一个`/`分区以及一个swap分区。你可能也像单独分出`/home`分区用来存放用户文件（这对于之后升级和安装不同的Linux操作系统而要保持用户文件很容易）。创建一个新的分区可以输入`n`。

```
Command: (m for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 1
First cylinder (1-8841, default 1): 1
Last cylinder or +size or +sizeM or +sizeK (1-8841, default 8841): +8G

Command (m for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 2
First cylinder (975-8841, default 975): 975
Last cylinder or +size or +sizeM or +sizeK (975-8841, default 8841): +1G
```

这里我们创建了两个分区，一个8GB，一个1GB，可以输入`p`来查看。

```
 Command (m for help): p

Disk /dev/sda: 72.7 GB, 72725037056 bytes
255 heads, 63 sectors/track, 8841 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot       Start      End          Blocks   Id  System
/dev/sda1                1      974         7823623+  83  Linux
/dev/sda2              975     1097          987997+  83  Linux
```

这两个分区类型都是Linux文件系统。我们需要改变`/dev/sda2`为swap（id为82）。

```
Command (m for help): t
Partition number (1-4): 2
Hex code (type L to list codes): 82

Command (me for help): p

Disk /dev/sda: 72.7 GB, 72725037056 bytes
255 heads, 63 sectors/track, 8841 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot       Start      End          Blocks   Id  System
/dev/sda1                1      974         7823623+  83  Linux
/dev/sda2              975     1097          987997+  82  Linux swap
```

swap分区是一个被Linxu内核用于虚拟内存的特殊的分区。如果RAM不够使用就会将一部分的内容移到swap分区中，以此来避免崩溃。swap分区的大小取决于你自己。对于应该分配多大很多人都有争论，但是一个好的建议是分配内存大小的两倍。分配更多的空间没有任何损害。如果你要使用挂起功能，你应该至少分配和你的RAM大小相同的swap分区大小。

现在我们可以将修改写入，不过我要再分一个分区给`/home`。

```
Command: (me for help): n
Command action
   e   extended
   p   primary partition (1-4)
p
Partition number (1-4): 3
First cylinder (1098-8841, default 1098): 1098
Last cylinder or +size or +sizeM or +sizeK (1098-8841, default 8841): 8841
```

现在我们可以将修改写入。

```
Command: (me for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
root@slackware:/#
```

现在我们已经完成了分区，可以进入安装了。如果你创建了扩展分区，你可能希望重启来确保它们可以被内核读取。

