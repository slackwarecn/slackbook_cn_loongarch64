#### ssh

刚刚说到 `telnet` 是一个有用的诊断工具，不过因为缺少加密功能，它并不适合访问 shell。谢天谢地，我们有了安全 shell 协议（secure shell protocol）。几乎每个 Linux，UNIX 和 BSD 发行版都使用了 OpenSSH，或者简写成 `ssh(1)` 。 `ssh` 是最常用的网络工具之一，它使用了最强的加密技术。 `ssh` 有许多特性，配置选项和使用技巧（neat hacks)，这些内容够写本书了，所以这里我们只讨论基本使用方法。告诉 `ssh` 要连接的用户名和主机，它就会为你建立一个安全快速的连接。如果你是第一次连接到这台计算机，`ssh` 会要求你确认你的意图，然后在本地复制一份加密密钥（encryption key）以遍日后使用。一旦密钥变了，`ssh` 就会警告你并拒绝连接，因为这时可能有人想用中间人攻击（man-in-the-middle）手段劫持该连接。

```
darkstar:~# ssh alan@slackware.com
alan@slackware.com`s password: secret
alan@slackware.com:~$
```

用户名和主机的格式和 e-mail 地址一样，如果你留空用户名，`ssh` 会在建立连接时使用你当前的用户名。
