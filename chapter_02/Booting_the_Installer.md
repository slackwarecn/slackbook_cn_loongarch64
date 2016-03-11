### 从安装介质启动

从安装介质启动意味着将Slackware的光盘放入光驱中然后启动。你可能需要进入BIOS然后选择从光驱启动。一些厂商允许你在启动界面按特殊的按键进入启动选项的选择（例如`F12`）。因为不同的厂商这个特殊的按键是不一样的，所以在这里没有办法统一说明，但是方法都是一样的。

一旦你的电脑从光驱启动，你会看到屏幕上会让你输入一些特殊的内核参数。这里是允许你进入急救模式的。某些系统可能需要特殊的内核参数才能引导，不过这是极少数的情况。大部分的用户可以直接输入回车键进入引导。

```
Welcome to Slackware version 14.0 (Linux kernel 3.2.27)!

If you need to pass extra parameters to the kernel, enter them at the prompt
below after the name of the kernel to boot (huge.s etc).

In a pinch, you can boot your system from here with a command like:

boot: huge.s root=/dev/sda1 rdinit= ro

In the example above, /dev/sda1 is the / Linux partition.

To test your memory with memtest86+, enter memtest on the boot line below.

This prompt is just for entering extra parameters.  If you don't need to enter any parameters, hit ENTER to boot the default kernel "huge.s" or press [F2] for a listing of more kernel choices.
```

在输入回车键后可以看到一大段的信息，不要紧张这是正常现象。这些文本是引导时由内核生成的，用来发现计算机的硬件以及载入安装程序。如果你感兴趣你可以在之后通过`dmesg`命令查看。这些信息对排查可能有的硬件问题很重要。一旦内核完成了硬件发现过程，这些信息就会停下来，然后你会在屏幕上看到载入非英式键盘的选项：

```
<OPTION TO LOAD SUPPORT FOR NON-US KEYBOARD>

If you are not using a US keyboard, you may need to load a different keyboard map.  To select a different keyboard map, please enter 1 now.  To continue using the US map, just hit enter.
Enter 1 to select a keyboard map: _
```

输入`1`然后按回车键会获得一个键盘映射列表以此来选择其他键盘形式。通常情况下直接按回车键继续就行了。

```
   Welcome to the Slackware Linux installation disk! (version 14.0)

   ######  IMPORTANT!  READ THE INFORMATION BELOW CAREFULLY.  ######

   - You will need one or more partitions of type 'Linux' prepared.  It is also
     recommended that you create a swap partition (type 'Linux swap') prior
     to installation.  For more information, run 'setup' and read the help file.

   - If you're having problems that you think might be related to low memory, you
     can try activating a swap partition before you run setup.  After making a
     swap partition (type 82) with cfdisk or fdisk, activate it like this:
       mkswap /dev/<partition> ; swapon /dev/<partition>

   - Once you have prepared the disk partitions for Linux, type 'setup' to begin
     the installation process.

   - If you do not have a color monitor, type:  TERM=vt100
     before you start 'setup'.

   You may now login as 'root'.

   slackware login: root
```

和直接引导你到专用的安装程序的其他Linux发行版本不同，Slackware提供给你一个载入到你的电脑内存中的小体积的Linux版本。这个小体积的版本被用来手动的运行所有的安装程序，或者被用来当作急救盘，修复引导失败的损坏的操作系统。现在你可以以root的的身份登录（无需密码），然后设置你的硬盘。你可以设置软RAID或者LVM甚至是加密的root分区，不过这些话题超出了这本手册的范围。我推荐你阅读`README_RAID.txt`、`README_LVM.txt`和`README_CRYPT.txt`文档来进行这些高级设置。大部分用户无需做什么直接进行分区即可。

