#### mailx

基本上，有上面两个邮件客户端就足够了。但是如果你只是想要一个没有菜单的邮件客户端怎么办呢？mailx 可以满足你。

`mailx`基于伯克利邮件应用（Berkeley Mail application），支持一个和 AT&T 的第一版 UNIX 同时出现的`mail`命令。它可以交互式或非交互式使用。

`mailx`从你计算机的邮件池（mail spool ）中读取邮件并显示一个包含了发送者、主题、状态和大小的列表，然后给用户一个交互式的提示。事实上，如果你在安装完 Slackware 后马上就查看了 Pat Volkerding 发给你的欢迎邮件，你也许会对这个提示感到很亲切。

```
darkstar:~# mailx
Heirloom mailx version 12.4 7/29/08.  Type ? for help.
"/var/spool/mail/root": 2 messages 2 new
>N  1 To root            Thu Mar 10 23:33   52/1902  Register with the Linux counter project
 N  2 To root            Thu Mar 10 23:35  321/15417 Welcome to Linux (Slackware 14.0)!
?;
```

输入提示中消息的序号来阅读消息，然后这条消息就会被`more`显示出来。回车查看下一页，一旦到达了消息结尾，按`q`可以回到提示列表，或者按回车阅读下一条消息。

在提示中输入`?`可以查看可用的命令。使用提供的命令，你可以查看邮件池中的邮件头或者执行回复、删除、保存和其他常见的邮件操作。

`mailx`配合脚本使用会更强大。要查看所有`mailx`的选项，请参考 man 手册。简单的邮件发送只需要命令名字后边跟上目标地址：

```
darkstar:~$  mailx bob@example.com
```

发送命令后，会出现一个交互式的提示，你需要在里面写上主题，消息主体和结束字符（空行上的一个英文句号）。

然而，`mailx`也可以在无人干预下使用。一般来说，你可以假定任何以交互方式为`mailx`指定的属性也可以在脚本中以非交互方式指定。

```
darkstar:~$ mailx -n -s "Test message" bob@example.com < ~/message.txt
```

在上面的例子中，不需要人为干预，文件`message.txt`的内容就被当作消息主体发送给了指定接收者。

在某人自己的计算机（localhost）或者网络中，以这种方式发送邮件是完全可能的。但在因特网上想这么做则需要额外的步骤。当然，最值得注意的变化就是 SMTP 服务器承担了传送邮件的任务，在邮件命令中可以这样指定 SMTP 服务器：

```
darkstar:~$  env MAILRC=/dev/null
from="bob@example.com (Bob Dobbs)"
smtp=relay.example.com mail -n -s "Test message" connie@example.com < ~/message.txt
```

这里为了覆盖系统默认值，`MAILRC`被设置成了`/dev/null`，SMTP 服务器和`FROM:`行也在这里定义。剩下的部分则和上个例子相同。

总之，`mailx`被当作是特性最少的邮件客户端。在很大程度上确实如此，但当你想要用脚本控制提醒邮件或重要更新的消息的发送时，`mailx`要比像`mutt`或者`pine`这种完全交互式运行的程序更加有用。
