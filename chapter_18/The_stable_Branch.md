### 稳定分支

#### slackware的稳定分支

每当slackware发布新版本，Slackware的团队会按需发布升级包用以修复严重的安全问题和惹人厌的漏洞。因此让你当前版本的Slackware跟进最新的补丁是非常重要的，这种版本被称之为-stable分支。与之不同的还有一个-current分支，我们会在这个分支上进行下一个稳定版本的开发工作（所以经常会有一些引发问题的提交）。除非你愿意在一个可能出错的系统中工作并可以自食其力地解决这些问题。我们强烈建议你使用-stable分支。

由于本地无法获得-stable分支的安全更新，所以你需要从互联网上自行获取。许多个人和组织提供Slackware的镜像站，你可以在这些地方以多种方式下载到Slackware的完整目录树（也可能只是`patches/`目录）。有些镜像站可以在网页上访问，但更常见的方式是从运行着ftp/rsync服务器的镜像站上获取更新。Slackware项目维护着一份按照国家分类的已知镜像站清单。如果你不确定该使用哪个镜像站，可以查看[http://www.slackware.com/getslack/](http://www.slackware.com/getslack/)获得帮助。如果你附近有一所大学，他们很可能会提供一份维护着许多开源项目的镜像站——Slackware可能也在其中。一个镜像站可用的必要条件只有一个——它是官方镜像站的一个完整克隆。通常来说，最好使用距离你较近的镜像站以获得最快的访问速度和最少的网络资源占用。

那么如何知道有可用更新呢？最好的方法是在任意提供及时更新的镜像站上查看ChangeLog.txt文件。你可以在Slackware官网上获得-stable和-current分支的更新日志。但是如果你正在使用一个较旧版本的Slackware，你需要从镜像站上查询是否有可用的更新。

```
darkstar:~# wget -O - \
ftp://slackware.osuosl.org/pub/slackware/slackware64-current/ChangeLog.txt \
| less
Thu Aug 16 04:01:31 UTC 2012
Getting close!  Hopefully we've cleared out most of the remaining issues
and are nearly ready here.  We'll call this release candidate 2.
Unless there's a very good rationale, versions are frozen.
Any reports of remaining bugs will be gladly taken, though.
  #include <more/cowbell.h>
a/aaa_base-14.0-x86_64-4.txz:  Rebuilt.
  Remove mention of HAL in the initial welcome email (mention udisks2
  instead).  Thanks to Dave Margell.
a/bash-4.2.037-x86_64-1.txz:  Upgraded.
```

