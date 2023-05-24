### 制定

现在你应该对 bash 有所熟悉，并且你可能会碰到一些奇特的情况。比如说，当你登录的时候，会呈现给你一个类似下面这样的提示。

```
alan@darkstar:~$
```

但是，有些时候你可能会看到像下面这样的提示：

```
bash-3.1$
```

造成这样的原因和控制 bash 提示的环境变量有关。一些 shell 被认为是“login shell”，而另一些 shell 则被认为是“interactive shell”，这两种 shell 当它们启动的时候读取的是不一样的配置文件。“login shell”读取的是 `/etc/profile` 和 `~/.bash_profile` 。“interactive shell”读取的是 `~/.bashrc` 。这对于一些有能力的用户来说是有好处的，但是对于新手来说它们并不关心这两种 shell 的不同，并且希望任何时候它们执行 bash 的时候都能有相同的环境。如果是这样，编辑你的 `~/.bashrc` 文件，然后写入以下几行。（更多关于配置文件的详情请阅读 bash 手册的“INVOCATION”一节）

> 译者注：这里的“shell”特指 bash。

```
# ~/.bashrc
. /etc/profile
. ~/.bash_profile
```

当输入上述内容后，“login shell”和“interactive shell”都会有同样的环境设置。现在如果我们想自己定制 shell 设定，只要编辑 `~/.bash_profile`（用户各自的）或者 `/etc/profile`（全局的）。让我们开始配置 bash 提示。

对于 bash 提示的格式每个用户都有各自的喜好。我个人倾向于短小的简单的提示，因为那样节省空间。但我也使用多多行提示。我其中的一个朋友甚至在它的提示中包含 ASCII-art。要改变你的提示格式，你只需要改变 `PS1` 变量。默认情况下，Slackware 将提示配置成如下格式：

```
darkstar:~$ echo $PS1
\u@\h:\w\$
```

是的，这个看上去有点搞笑的一串东西控制着你 bash 的提示格式。基本上，每一个在 `PS1` 变量中的字符都包含在了提示中，除非之前有转义字符<code>\\</code>。有很多的转义序列，我们不会一个个去讨论，但是我会解释这里的这些。第一个 `\u` 会被转义成当前用户的用户名。 `\h` 是主机名。 `\w` 是当前的工作目录，`\$` 显示的要么是 `#`（root 用户）要么是 `$`（普通用户）。一个完整的转义序列列表可以在 bash 手册的“PROMOTING”一节中看到。

虽然我们已经讨论了这个默认的提示，不过我还要花些时间展示给你几个提示的例子以及 `PS1` 的设置。

```
Wed Jan 14 12:08 AM
alan@raven:~$ echo $PS1
\d \@\n\u@\h:\w$
HOST: raven - JOBS: 0 - TTY: 3
alan@~/Desktop/sb_3.0:$ echo $PS1
HOST: \H - JOBS: \j - TTY: \l\n\u@\w:\$
```

更多配置 bash 提示的信息，包括设置有颜色的提示，可以参考 `/usr/doc/Linux-HOWTOs/Bash-Prompt-HOWTO` 。这个文档会带给你一个好的想法。
