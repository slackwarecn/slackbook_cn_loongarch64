### 从安装介质启动

启动安装程序只需插入Slackware安装盘并重启。也许还需要进入电脑BIOS并调整启动顺序，让光驱优先于硬盘。有些电脑允许动态修改启动顺序，只需系统启动时按下功能键。因为各种电脑情况不同，我们无法给出通用步骤，不过这些步骤在不同电脑上大体相同。

从CD启动后就能看到启动屏幕，并可输入自定义内核参数。这个功能的用意是让你能够把安装盘当成急救盘来用。有些很稀有的电脑需要一些特殊的内核参数才能启动。大多数用户可直接按enter来启动内核。

```fundamental
Welcome to Slackware version 14.0 (Linux kernel 3.2.27)!

If you need to pass extra parameters to the kernel, enter them at the prompt
below after the name of the kernel to boot (huge.s etc).

In a pinch, you can boot your system from here with a command like:

boot: huge.s root=/dev/sda1 rdinit= ro 

In the example above, /dev/sda1 is the / Linux partition.

To test your memory with memtest86+, enter memtest on the boot line below.

This prompt is just for entering extra parameters.  If you don't need to enter
any parameters, hit ENTER to boot the default kernel "huge.s" or press [F2] 
for a listing of more kernel choices.
```

按下**ENTER**就会看见大量的文字信息刷过你的屏幕。无需惊慌，这是正常情况。这些是内核在启动期间探测硬件并加载系统（在这里，是安装程序）所输出的文字信息。稍后你可用`dmesg(1)`来阅读你感兴趣的信息。通常，这些信息对于排除硬件故障很有帮助。当内核探测完毕，输出应当停止，这时候你应该给如一个参数来获得非us键盘布局支持。

```fundamental
<OPTION TO LOAD SUPPORT FOR NON-US KEYBOARD>

If you are not using a US keyboard, you may need to load a different
keyboard map.  To select a different keyboard map, please enter 1
now.  To continue using the US map, just hit enter.

Enter 1 to select a keyboard map: _
```

输入**1**，按下**ENTER**就会给出一个键盘映射列表。选择匹配你键盘类型的一项并继续。

```fundamental
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

slackware login: <strong>root</strong>
```

不像其他发行版直接启动到专用安装程序那样，Slackware安装程序把一个削减的Linux发行版加载进内存。这个削减版用来手动执行安装程序，或者可以用来搞系统急救。
