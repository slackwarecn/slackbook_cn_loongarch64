#### host

网络问题常常由 DNS 错误导致。DNS 负责域名与 IP 地址之间的映射，可以用 `host(1)` 命令进行快速的 DNS 查找。在运行 `host` 时，你的计算机将执行少量的普通 DNS 查找并返回执行结果。

```
darkstar:~# host www.slackware.com
www.slackware.com is an alias for slackware.com.
slackware.com has address 64.57.102.34
slackware.com mail is handled by 1 mail-mx.cwo.com.
```
