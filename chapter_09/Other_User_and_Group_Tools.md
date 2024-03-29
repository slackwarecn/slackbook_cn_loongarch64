### 其他管理用户和组的工具

还有一些其他管理用户和组的工具。也许最重要的就是 `passwd(1)`, 该命令能修改用户的密码。普通用户也许只需要关心各自的密码，但 `root` 能修改所有人的密码。此外，`root` 也能通过 `-l` 参数锁定一个用户。并不是真的冻结了用户，而是把这个用户的密码改成了无论如何也无法匹配的字符串。

最简单的修改用户信息的工具就是 `usermod(8)`, 无论是组从属关系还是家目录地址，它都能修改。在此不列出详细参数，请参见手册页。 `usermod` 也许是修改组成员的最佳工具，为此请使用 `-s` 和 `-G` 参数。

```
darkstar:~# usermod -a -G wheel alan
darkstar:~# usermod -G wheel alan
```

一定要注意上面两条命令的区别。第一条命令仅仅是把用户 `alan` 添加到 `wheel` 用户组。第二条命令使得用户 `alan` 仅仅从属于 `wheel` 组。请一定注意。

另一个很棒的工具就是 `chsh(1)`, 它能修改用户的默认 shell。普通用户只能修改自己的 shell, 不过 `root` 用户能够修改所有人的。

我们最后要讨论的工具就是 `chfn(1)` 。它用来输入用户的身份信息，比如电话号码、家庭住址、真实姓名。这些信息存放在 `passwd(5)` 文件里，用 `finger(1)` 来读取。
