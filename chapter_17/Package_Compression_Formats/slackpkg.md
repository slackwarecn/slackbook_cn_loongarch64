#### slackpkg

`slackpkg`是管理Slackware Linux软件包的自动化工具，它最初出现在slackware-12.1的*extra*中。自slackware-12.2发布以来，`slackpkg`已经被包含在了基本系统安装的ap系列中。

就像用`installpkg`可以从安装盘的*extra*目录中安装Slackware软件包一样，用`slackpkg`可以从网上把软件包拖过来安装。对安全更新和已被上传到Slackware服务器的重要软件升级来说，这非常有用。

如果没有`slackpkg`，只能这么做：

1. 在Slackware变要记录中看到有能用的更新
+ 在本地的Slackware镜像站中找到更新软件包的下载链接
+ 下载软件包
+ 使用 installpkg 或 pkgtool 安装下载的软件包

有了`slackpkg`，只需要这么做：

1. 在Slackware变要记录中看到有“foo”的更新。
+ 运行`slackpkg install foo`

很明显，效率提高了。

要使用`slackpkg`，用root权限编辑`/etc/slackpkg/mirrors`来为系统选择一个Slackware镜像站，找到和使用的Slackware版本、架构都一致的镜像站，然后取消注释就可以了。镜像列表提供了ftp和http两种访问方式，但只能取消注释一个镜像站。

一旦选择了一个镜像站，就要用命令`slackpkg update`来更新远程文件的列表。如果看到有新的软件包被上传到了Slackware服务器，同样要更新远程文件的列表（通常Slackware变要记录里查看，见“[第十八章、追踪系统更新](../chapter_18/README.md)”）。

要搜索一个软件包，使用命令`slackpkg search foo`，要安装一个软件包，使用命令`slackpkg install foo`。

一旦用 `slackpkg` 安装了一个软件包，就可以用 `pkgtool` 或其他包管理命令移除或升级包，这些命令在“软件包的安装、移除和升级”小节中介绍过了。

关于 `slackpkg` 的更多信息在man手册slackpkg(8)、slackpkg.conf(5)以及它的网站[http://www.slackpkg.org/](http://www.slackpkg.org/ "slackpkg")中可以找到。



