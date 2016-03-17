#### ncftp

`ncftp(1)`(读做nick-f-t-p),是`ftp`的一个功能更丰富的继任者,它支持tab补全和递归下载.
它会自动使用匿名用户连接FTP服务器,除非你在命令行参数中指定用户名.
`ncftp`相对`ftp`的主要优点是可以通过`mget`和`mput`命令来一次发送或下载多个文件.
如果你给它们传递了`-R`参数,那么它们会递归目录上传或下载数据.

```
darkstar:~# ncftp ftp.osuosl.org
Logging in...                                                                   
Login successful.
Logged in to ftp.osuosl.org.                                                    
ncftp / > cd pub/slackware/slackware-current
Directory successfully changed.
ncftp ...ware/slackware-current > mget -R isolinux
isolinux/README.TXT:                                     4.63 kB 16.77 kB/s  
isolinux/README_SPLIT.TXT:                             788.00 B    5.43 kB/s  
isolinux/f2.txt:                                       793.00 B    5.68 kB/s  
isolinux/initrd.img:                                    13.75 MB 837.91 kB/s  
isolinux/iso.sort:                                      50.00 B  354.50 B/s   
isolinux/isolinux.bin:                                  14.00 kB 33.99 kB/s  
isolinux/isolinux.cfg:                                 487.00 B    3.30 kB/s  
isolinux/message.txt:                                  760.00 B    5.32 kB/s  
isolinux/setpkg:                                         2.76 kB 19.11 kB/s  
ncftp ...ware/slackware-current > bye
```
