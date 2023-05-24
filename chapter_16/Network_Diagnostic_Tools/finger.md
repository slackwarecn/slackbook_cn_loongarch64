#### finger

与其说 `finger(1)` 是诊断网络的工具，倒不如说它是诊断网络用户的工具。只要某个服务器在运行着 `fingerd(8)` 守护进程，你就可以用 `finger` 获取关于这个服务器上所有用户的有用信息。目前很少有服务器会提供 `fingerd`，但对那些提供了 `fingerd` 的服务器，`finger` 可以说是用来跟踪朋友和同事的好工具。

```
darkstar:~# finger alan@cardinal.lizella.net
[cardinal.lizella.net]
Login: alan           			Name: Alan Hicks
Directory: /home/alan               	Shell: /bin/bash
Office: 478 808 9919, 478 935 8133
On since Wed Apr 13 17:43 (UTC) on pts/9 from
75-150-12-113-atlanta.hfc.comcastbusiness.net
    32 minutes 24 seconds idle
     (messages off)
On since Wed Apr 13 17:45 (UTC) on pts/10 from :pts/9:S.0
   48 minutes 56 seconds idle
Mail forwarded to alan@lizella.net
No mail.
No Plan.
```
