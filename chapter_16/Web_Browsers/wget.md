#### wget

和我们见过的浏览器不同，`wget(1)`是非交互式的（non-interactive）。对 HTTP 内容，`wget`只下载不显示，这样一来离开网页浏览器我们也可以“浏览”网页了。不像其他浏览器的 dump 模式，`wget`不对下载的网页进行格式化，它从服务器上原封不动的把带有标签（tags）和二进制数据（binary data）的网页内容复制下来。开启一些递归选项，你可以用`wget`复制整个网站到你的本地计算机中。除了 HTTP，`wget`还支持 FTP 和其他一些协议。

```
darkstar:~# wget ftp://ftp.osuosl.org/pub/slackware/slackware-current/ChangeLog.txt
--2010-05-01 13:51:19--
ftp://ftp.osuosl.org/pub/slackware/slackware-current/ChangeLog.txt
           => `ChangeLog.txt'
Resolving ftp.osuosl.org... 64.50.236.52
Connecting to ftp.osuosl.org|64.50.236.52|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /pub/slackware/slackware-current ...  done.
==> SIZE ChangeLog.txt ... 75306
==> PASV ... done.    ==> RETR ChangeLog.txt ... done.
Length: 75306 (74K)

100%[======================================>] 75,306       110K/s   in 0.7s

2010-05-01 13:51:22 (110 KB/s) - `ChangeLog.txt' saved [75306]
```
