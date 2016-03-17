#### lftp

我们要看的最后一个FTP客户端是`lftp`。
就像`ncftp`，它支持tab补全和递归操作。
但`lftp`代码有一个更友好的许可证。
不同于`ncftp`的`mget`和`mput`，`lftp`的递归操作通过`mirror`处理。
`mirror`有很多不同的可用选项，我们可以通过`man lftp`或`lftp`内建的`help`命令查看具体的参数细节。

```
darkstar:~# lftp ftp.osuosl.org
lftp ftp.osuosl.org:~> cd /pub/slackware/slackware-current
cd ok, cwd=/pub/slackware/slackware-current            
lftp ftp.osuosl.org:/pub/slackware/slackware-current> mirror isolinux
Total: 2 directories, 16 files, 1 symlink                                      
New: 16 files, 1 symlink
14636789 bytes transferred in 20 seconds (703.7K/s)
lftp ftp.osuosl.org:/pub/slackware/slackware-current> bye
```
