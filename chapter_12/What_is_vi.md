### vi 是什么？

在你的电脑里散落着成千上万的文件。对新用户而言这或许是无足轻重的，但是在 Slackware Linux 中几乎一些都需要用纯文本来配置。这使得用户可以快速、简单并且直观地改变系统。在第五章中我们看到了一些可以用于阅读这些文件的指令，例如 `cat` 和 `less`，但是如果我们想编辑他们，又应该怎么办？我们需要一个编辑器去完成这项工作，而 vi 正是为此而生。

总的来说，vi 世界上最古老、最强大的编辑器之一，并且在当今仍被广泛使用。它被世界各地的系统管理员、程序员和爱好者等人群所青睐。事实上本书几乎全部由 vi 写成，只有介绍 Emacs 的下一章是在 Emacs 中写的。

为了弄清楚现在所说的 vi 到底是什么，这里有必要解释一下。Slackware 严格来说并不提供 vi，相反，Slackware 提供了两个 vi 的“克隆品”——`evlis` 和 `vim` 。这两个 vi 的克隆在原基础上增加了许多特性，例如语法高亮、二进制编辑和网络支持。我们不会过多深入讨论这些细节。默认的，如果你在 Slackware 上运行 vi，你实际运行的是 `evlis`——本节所有的例子都假定你使用的是 `evlis` 。如果你之前使用了其他 Linux 发行版，你可能更加熟悉 `vim` 。如果是这样，你需要将 `/usr/bin/vim` 链接到 `/usr/bin/vi`，或者在你的 Shell 启动脚本里添加你的 alisa 语句。通常认为 `vim` 比 `evlis` 功能更加丰富多样，但是 `evlis` 要小的多，并且包含了大多数用户都会用到的功能。

vi 非常强大，对新用户而言学习过程稍显繁琐和富有挑战。但是对于任何一个有自尊心的系统管理员来说，驾驭 vi 是一项至关重要的能力。几乎所有的 Linux 发行版、BSD 系统和 UNIX 系统都提供 vi，甚至你可以在 Mac OS X 上找到它。一旦你学会了 vi，你就不必为了在上述系统中工作而再学习另一种编辑器了。事实上，vi 已经被移植到了微软的 Windows 操作系统，在 Windows 中你可以照常使用。
