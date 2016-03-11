### 使用mount指令

现在我们知道了Linux中可用的几种文件系统，是时候来看看怎样使用它们了。要想向一个文件系统写数据，这个文件系统必须首先被挂载。要挂载文件系统，我们可以使用`mount(8)`。我们首先要做的是决定文件系统挂载到哪儿。再次强调，Linux世界中没有驱动器号。而是所有的文件系统都挂载在目录上。在你安装的Slackware上基本文件系统总是位于`/`且其它的东西总是位于`/`的子目录中。`/mnt/hd`是一个常用来挂载分区的地方，我们把它用在第一个例子中。要挂在一个文件系统，我们必须告诉`mount`文件系统的类型，要挂载的位置以及其他特殊的选项。  

```plain
darkstar:~# mount -t ext3 /dev/hda3 /mnt/hd -o ro
```  

我们来解读一下。我们有一个ext3文件系统在IDE设备的第三个分区，我们想把它挂载到`/mnt/hd`。此外，我们把它挂载为只读，这样就不会改变它的内容了。`[-t ext3]`参数告诉`mount`我们用的文件系统是什么类型，在本例中是`ext3`。这将告诉内核该使用那个驱动。通常`mount`会自行检查文件系统类型，但是最好还是显式的声明我们的分区类型。第二参数告诉`mount`我们想挂载的的位置，本例中是`/mnt/hd`。最后，我们必须决定要使用的参数，这些参数以`[-o]`开始声明。下面是最常用选项的简短列表。  

表11.2 常用的挂载选项  

|选项|描述|
|:--|:--|
|ro| 只读|
|rw| 读写（默认值）|
|uid| 拥有此文件系统内容的用户|
|gid| 拥有此文件系统内容的组|
|noexec| 阻止执行此文件系统上的任何文件|
|defaults| 大多数文件系统通用的默认值|  

如果这是你第一次安装Linux，你只需要关心`[ro]`和`[rw]`选项。有个例外是当你要处理不具有Linux权限机制的文件系统时，比如`vfat`或者`NTFS`，你需要使用`[uid]`或`[gid]`选项来确保非root用户能够访问这些文件系统的内容。  
```plain
darkstar:~# mount -t vfat /dev/hda4 /mnt/hd -o uid=alan
```  
但是我们不想每次加载CD时都告诉`mount`是什么文件系统，用什么选项，这会很烦。幸好有个简单的办法，`/etc/fstab`这个文件包含了安装器为你设置的所有文件系统的信息，你也可以向里面添加东西。`fstab(5)`看起来是一个包含了设备、文件系统以及可选参数的简单表格。我们来看看。  
```plain
darkstar:~# cat /etc/fstab
/dev/hda1        /                reiserfs    defaults               1   1
/dev/hda2        /home            reiserfs    defaults               1   2
/dev/hda3        swap             swap        defaults               0   0
/dev/cdrom       /mnt/cdrom       auto        noauto,owner,ro,users  0   0
/dev/fd0         /mnt/floppy      auto        noauto,owner           0   0
devpts           /dev/pts         devpts      gid=5,mode=620         0   0
proc             /proc            proc        defaults               0   0
```  
如果在`fstab`中有你的文件系统入口的话，你只需要告诉`mount`设备节点或者挂载位置就行了。  
```plain
darkstar:~# mount /dev/cdrom
darkstar:~# mount /home
```  
关于`mount`需要最后告诉你的是，你只需要运行`mount`而不加任何参数就能看到已经挂载的文件系统了。
