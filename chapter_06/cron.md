### 计划任务

我们学习了许多不同的方法来查看系统上的进程和信号，但是如果我们想周期性的运行进程呢？幸运的是，Slackware 包含了 crond(8) 这个工具。cron 为每个用户按照计划表运行进程。这对于需要周期性运行但不需要守护进程的进程很有用，比如备份脚本。每个用户都有自己的 cron。数据库，所以非 root 用户也能周期性的运行程序。

为了从 cron 中运行程序，你需要使用 crontab(1)。Man 页面列出了许多方法，但是最常见的方法是传递 [-e] 参数。
这会锁定用户的 cron 数据库（为了防止它被其它进程覆盖），然后打开由 VISUAL 环境变量指定的文本编辑器。在 Slackware 系统上，这通常是 vi 编辑器。你可以在继续阅读之前参照 vi 的那一章。

cron 数据库最初可能看起来有点过时了，但是它们很灵活。每一个非注释行都会被处理，如果所有时间条件都匹配命令就会被执行。

```
darkstar:~$ crontab -e
# Keep current with slackware
30 02 * * * /usr/local/bin/rsync-slackware64.sh 1>/dev/null 2>&1
```

就像之前提到过的，cron 的语法一开始很难理解，所以让我们独立的看看每一部分。从左到右，分别是分钟，小时，天，月份，工作日和命令。任何 `*` 匹配每一分钟，小时，天等等。所以上面的例子中，命令是 "/usr/local/bin/rsync-slackware64.sh 1>/dev/null 2>&1"，而且它每个月里每周的工作日的上午 2:30 运行。

cron 也会用命令的输出给本地用户发邮件。因此，一些任务会将输出重定向至 `/dev/null`，这是一个忽略所有输入的特殊设备文件。为了让你容易的记住它，你可能希望把下面的注释文本粘贴到 cron 配置的顶端。

```
# Redirect everything to /dev/null with:
#   1>/dev/null 2>&1
#
# MIN HOUR DAY MONTH WEEKDAY COMMAND
```

默认情况下，Slackware 在 root 的 crontab 里包括了一些配置文件和注释。这些文件通过在 /etc 目录下创建一些指出它们应该怎么运行的文件夹使设置周期性任务更加简单。放在这些目录下的所有脚本都会每小时，每天，每周，或每月运行一次。目录名需要能自解释：/etc/cron.hourly，/etc/cron.daily，/etc/cron.weekly 和 /etc/cron.monthly。
