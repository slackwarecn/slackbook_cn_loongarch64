### 分区

和其他大多数的 Linux 发行版本不同，Slackware 没有一个专门的图形化分区工具，而是使用传统的 Linux 分区工具。传统情况下，分区是用 `fdisk` 或者 `cfdisk` 进行的，这两个都是命令行的工具。大多数人们倾向于使用 `cfdisk`，因为它是基于菜单的而且同样工作的很好。除此以外，Slackware 还包含 `sfdisk` 和 `gdisk` 命令行工具。 `gdisk` 被用于 GUID 的分区表。在这本书中，我们主要讲 `fdisk`，其他的工具用法相似。你可以在网上或是手册中找到其他工具的使用方法。

为了对硬盘进行分区，你首先要先知道如何识别它。在 Linux 中，所有的硬件都被识别成设备文件。这些文件位于 `/dev` 目录中。今天几乎所有的硬盘都被内核识别为 SCSI 硬盘，同时它们被分配为诸如 `/dev/sda` 的设备文件（曾经有一段时间每个硬盘类型都有它自己独有的识别，像是 `/dev/hda` 表示第一块 IDE 盘。几年后，内核的 SCSI 子系统演变成了通用的驱动接入系统被用于所有的硬盘和光驱而不论它们是如何接入你的计算机的。如果你对此感到困惑，想象一下如果你有一个接入了 SCSI 硬盘，SATA 光驱和 USB 的系统，所有的都是独特的子系统识别身份。而现在的系统不仅干净而且工作得更好）

如果你不知道你的硬盘被分配了那个设备文件，fdisk 可以帮助你。

```
root@slackware:/# fdisk -l

Disk /dev/sda: 119.24 GiB, 128035676160 bytes, 250069680 sectors
Disk model: aigo SSD S500 12
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

这里你可以看到我的系统有一块位于 `/dev/sda` 的 119.24 GB 硬盘。你可以看到一些额外的信息。 `-l` 参数用来显示硬盘和分区信息，但是不会作出修改，为了进行分区需要告诉 fdisk 要对哪块硬盘进行操作。

```
root@slackware:/# fdisk /dev/sda

Welcome to fdisk (util-linux 2.38.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Command (m for help):
```

现在我们告诉 `fdisk` 我们希望分区。输入 `m` 来获取帮助。

```
Command (m for help): m

Help:

  DOS (MBR)
   a   toggle a bootable flag
   b   edit nested BSD disklabel
   c   toggle the dos compatibility flag

  Generic
   d   delete a partition
   F   list free unpartitioned space
   l   list known partition types
   n   add a new partition
   p   print the partition table
   t   change a partition type
   v   verify the partition table
   i   print information about a partition

  Misc
   m   print this menu
   u   change display/entry units
   x   extra functionality (experts only)

  Script
   I   load disk layout from sfdisk script file
   O   dump disk layout to sfdisk script file

  Save & Exit
   w   write table to disk and exit
   q   quit without saving changes

  Create a new label
   g   create a new empty GPT partition table
   G   create a new empty SGI (IRIX) partition table
   o   create a new empty DOS partition table
   s   create a new empty Sun partition table

```

在最小情况下，你需要一个 `/` 分区、 `/boot` 分区、 `/boot/efi` 分区、以及一个 swap 分区。你可能也像单独分出 `/home` 分区用来存放用户文件（这对于之后升级和安装不同的 Linux 操作系统而要保持用户文件很容易）。首先创建 GPT 分区输入 `g`，然后创建一个新的分区可以输入 `n` 。

```
Command (m for help): g

Created a new GPT disklabel (GUID: B88F50AB-2DF8-6A49-BF74-DD28B2BE0E2E).

Command (m for help): n
Partition number (1-128, default 1): 
First sector (2048-250069646, default 2048): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-250069646, default 250068991): +100M

Created a new partition 1 of type 'Linux filesystem' and of size 100 MiB.

Command (m for help): n
Partition number (2-128, default 2): 
First sector (206848-250069646, default 206848): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (206848-250069646, default 250068991): +200M

Created a new partition 2 of type 'Linux filesystem' and of size 200 MiB.

Command (m for help): n
Partition number (3-128, default 3): 
First sector (616448-250069646, default 616448): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (616448-250069646, default 250068991): +8G

Created a new partition 3 of type 'Linux filesystem' and of size 8 GiB.

Command (m for help): n
Partition number (4-128, default 4): 
First sector (17393664-250069646, default 17393664): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (17393664-250069646, default 250068991): +40G

Created a new partition 4 of type 'Linux filesystem' and of size 40 GiB.
```

这里我们创建了四个分区，分别为 100M、200M、8G、40G，可以输入 `p` 来查看。

```
Command (m for help): p
Disk /dev/sda: 119.24 GiB, 128035676160 bytes, 250069680 sectors
Disk model: aigo SSD S500 12
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: B88F50AB-2DF8-6A49-BF74-DD28B2BE0E2E

Device        Start       End  Sectors  Size Type
/dev/sda1      2048    206847   204800  100M Linux filesystem
/dev/sda2    206848    616447   409600  200M Linux filesystem
/dev/sda3    616448  17393663 16777216    8G Linux filesystem
/dev/sda4  17393664 101279743 83886080   40G Linux filesystem
```

这四个分区类型都是 Linux 文件系统。我们需要改变 `/dev/sda1` 为 `EFI System`（id 为 1）,改变 `/dev/sda3` 为 `Linux swap`（id 为 19）。

```
Command (m for help): t
Partition number (1-4, default 4): 1
Partition type or alias (type L to list all): 1

Changed type of partition 'Linux filesystem' to 'EFI System'.

Command (m for help): t
Partition number (1-4, default 4): 3
Partition type or alias (type L to list all): 19

Changed type of partition 'Linux filesystem' to 'Linux swap'.

Command (m for help): p
Disk /dev/sda: 119.24 GiB, 128035676160 bytes, 250069680 sectors
Disk model: aigo SSD S500 12
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: B88F50AB-2DF8-6A49-BF74-DD28B2BE0E2E

Device        Start       End  Sectors  Size Type
/dev/sda1      2048    206847   204800  100M EFI System
/dev/sda2    206848    616447   409600  200M Linux filesystem
/dev/sda3    616448  17393663 16777216    8G Linux swap
/dev/sda4  17393664 101279743 83886080   40G Linux filesystem
```

swap 分区是一个被 Linxu 内核用于虚拟内存的特殊的分区。如果 RAM 不够使用就会将一部分的内容移到 swap 分区中，以此来避免崩溃。swap 分区的大小取决于你自己。对于应该分配多大很多人都有争论，但是一个好的建议是分配内存大小的两倍。分配更多的空间没有任何损害。如果你要使用挂起功能，你应该至少分配和你的 RAM 大小相同的 swap 分区大小。

现在我们可以将修改写入，不过我要再分一个分区给 `/home` 。

```
Command (m for help): n
Partition number (5-128, default 5): 
First sector (101279744-250069646, default 101279744): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (101279744-250069646, default 250068991): +30G

Created a new partition 5 of type 'Linux filesystem' and of size 30 GiB.
```

现在我们可以将修改写入。

```
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
root@slackware:/#
```

现在我们已经完成了分区，可以进入安装了。如果你创建了扩展分区，你可能希望重启来确保它们可以被内核读取。
