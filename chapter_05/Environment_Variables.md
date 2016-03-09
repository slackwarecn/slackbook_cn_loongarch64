### 环境变量

通过设置环境变量能使一些任务做起来更加容易。环境变量是一些用户希望存储或者以后会用到的信息的间断的名称。举个例子来说，环境变量*PS1*告诉bash如何显示提示符的格式。其他变量可能告诉应用程序如何运行。举个例子，*LESSOPEN*变量告诉`less`运行简便的*lesspipe.sh*预处理器，*LS_OPTIONS*为`ls`开启颜色显示。

设置你自己的环境变量是容易的。bash包含两个内建的函数用来设置变量：`set`和`export`。除此以外，环境变量也可以被`unset`移除。（如果你不小心用`unset`移除了一个你不知道干什么的环境变量，不要紧张。你可以通过登出终端后再重新登录的方式重置所有默认的变量）。你可以通过在变量名前加($)符号来获取变量的值。

    darkstar:~$ set FOO=bar
    darkstar:~$ echo $FOO
    bar

`set`和`export`最主要的区别是`export`会将变量应用到子shell中（子shell就是运行在一个父shell中的另一个shell）。你可以通过控制提示符显示的*PS1*变量来查看这一区别。

    darkstar:~$ set PS1='FOO '
    darkstar:~$ export PS1='FOO '
    FOO 

还有其他重要的环境变量，不过其中最重要的一个环境变量是*PATH*。*PATH*一个用来搜索应用程序的目录列表。例如，`top`位于`/usr/bin/top`。你可以输入完整路径来运行这个程序，但是如果`/usr/bin`位于*PATH*变量中，则直接输入`top`就可以运行，bash会搜索到这里你无需手动输入完整路径。当你作为普通用户来尝试运行一个程序是，你首先需要看看它所在的目录在不再*PATH*变量中，例如`ifconfig`。

    darkstar:~$ ifconfig
    bash: ifconfig: command not found
    darkstar:~$ echo $PATH
    /usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/usr/games:/opt/www/htdig/bin:.

上面是一个典型的普通用户的*PATH*。你可以像改变其他环境变量一样改变它。如果你以root身份登录，你会看到不一样的*PATH*。

    darkstar:~$ su -
    Password: 
    darkstar:~# echo $PATH
    /usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/usr/games:/opt/www/htdig/bin
