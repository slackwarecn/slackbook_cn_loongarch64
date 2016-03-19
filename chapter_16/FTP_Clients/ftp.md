#### ftp

Slackware包含的最简单的FTP客户端是`ftp(1)`，能简单可靠地传输数据。`ftp`连接到ftp服务器时，会要求你输入用户名和密码，然后才允许你从ftp服务器获得数据。`ftp`由于缺乏特色，已经渐渐淡出人们的视线，但它仍然是一个有用的工具，很多文档中都可能会提到它。

一旦一个FTP会话被初始化后，你将会看到一个shell提示符，在这里，你可以像使用本地shell一样使用`cd`和`ls`命令。另外，你还可以使用`put`命令来把数据上传到服务器，或`get`命令来从服务器下载数据。如果你连接到一个公开的FTP服务器，你可能要使用"Anonymous"作为用户名，然后输入你的邮件地址(或者伪造一个)作为密码。

```
darkstar:~$ ftp ftp.osuosl.org
Name (ftp.osuosl.org:alan): anonymous
331 Please specify the password.
Password: secret
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> cd pub/slackware/slackware-current/
250 Directory successfully changed.
ftp> get ChangeLog.txt
local: ChangeLog.txt remote: ChangeLog.txt
200 PORT command successful. Consider using PASV.
150 Opening BINARY mode data connection for ChangeLog.txt (33967
bytes).
226 File send OK.
33967 bytes received in 0.351 secs (94 Kbytes/sec)
ftp> bye
221 Goodbye.
```

