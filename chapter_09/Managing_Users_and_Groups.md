### 管理用户和组

Slackware 中，最简单的添加用户方式就是使用我们提供的牛逼的`adduser`脚本。`adduser`会与你交互，让你输入创建新用户所需信息，让创建用户变得简单快捷。它还会为新用户创建密码。

```
darkstar:~# adduser

Login name for new user []: david

User ID ('UID') [ defaults to next available ]:

Initial group [ users ]:
Additional UNIX groups:

Users can belong to additional UNIX groups on the system.
For local users using graphical desktop login managers such
as XDM/KDM, users may need to be members of additional groups
to access the full functionality of removable media devices.

* Security implications *
Please be aware that by adding users to additional groups may
potentially give access to the removable media of other users.

If you are creating a new user for remote shell access only,
users do not need to belong to any additional groups as standard,
so you may press ENTER at the next prompt.

Press ENTER to continue without adding any additional groups
Or press the UP arrow to add/select/edit additional groups
:  audio cdrom floppy plugdev video

Home directory [ /home/david ]

Shell [ /bin/bash ]

Expiry date (YYYY-MM-DD) []:

New account will be created as follows:

---------------------------------------
Login name.......:  david
UID..............:  [ Next available ]
Initial group....:  users
Additional groups:  audio,cdrom,floppy,plugdev,video
Home directory...:  /home/david
Shell............:  /bin/bash
Expiry date......:  [ Never ]

This is it... if you want to bail out, hit Control-C.  Otherwise, press
ENTER to go ahead and make the account.


Creating new account...


Changing the user information for david
Enter the new value, or press ENTER for the default
	Full Name []:
	Room Number []:
	Work Phone []:
	Home Phone []:
	Other []:
Changing password for david
Enter the new password (minimum of 5, maximum of 127 characters)
Please use a combination of upper and lower case letters and numbers.
New password:
Re-enter new password:
Password changed.


Account setup complete.
```

在此对可选用户组做出解释。Slackware 中，每个用户一定都会属于同一个组，默认情况下是`users`组。但是，一个用户还能同时从属于其他组并从中继承该组的权限。一般桌面用户还要添加进一些组来方便完成日常动作，比如播放音频，访问 USB 或光盘这样的可移动媒体。你只需要按下方向键上键，这里就会自动列出桌面用户应该从属的组。当然，你可以在此基础上修改。

既然我们已经展示了交互程序，接下来让我们介绍强大的非交互性程序。第一个就是`useradd(8)`。 `useradd`略显不友好，但用在批处理脚本中能更快地创建用户，这就是为什么它常用在脚本中的原因。实际上，`adduser`只是个封装了`useradd`的脚本。`useradd`还有很多参数我们在此不一一列出，详见手册页。现在，让我们创建一个新用户：

```
darkstar:~# useradd -d /data/home/alan -s /bin/bash -g users -G audio,cdrom,floppy,plugdev,video alan
```

这样就添加了用户`alan`。我将用户家目录设置为`/data/home/alan`并把`bash`设置为 shell, 指定了`users`为默认组，并加入了一堆组方便桌面使用。你应该会注意到`useradd`并不像`adduser`那样交互。除非你接受所有`useradd`的默认参数，你就得手动设置每一项。

既然知道了如何添加用户，我们就该学习一下如何添加组了。就像你猜想的那样，添加组的命令是`groupadd(8)`。`groupadd`用起来就像`useradd`, 不过可用参数更少。这条命令为系统添加了一个叫做`slackers`的用户组。

```
darkstar:~# groupadd slackers
```

删除用户或组就和创建一样简单，只需运行`userdel(8)`和`groupdel(8)`。默认情况下，`userdel`会保留用户的家目录，如果想要连同家目录一起删除，使用`-r`参数。
