### chmod、chown 和 chgrp

现在我们知道了什么是权限，那么如何更改权限呢？更进一步地说，如何赋予用户和组以权限呢？本小节将对此做出解答。

我们要探讨的第一个工具就是 `chown(1)` 。使用 `chown`，我们就能（猜也能猜到）更改文件或目录的所有权。从前 `chown` 只能更改所有者，现在也能更改所属组了。

```
darkstar:~# ls -l /tmp/foo
total 0
-rw-r--r-- 1 alan users 0 2008-06-06 22:29 a
-rw-r--r-- 1 alan users 0 2008-06-06 22:29 b
darkstar:~# chown root /tmp/foo/a
darkstar:~# ls -l /tmp/foo
total 0
-rw-r--r-- 1 root users 0 2008-06-06 22:29 a
-rw-r--r-- 1 alan users 0 2008-06-06 22:29 b
```

你可在用户名后面同时指定所属组，二者用冒号隔开：

```
darkstar:~# chown root:root /tmp/foo/b
darkstar:~#  ls -l /tmp/foo
total 0
-rw-r--r-- 1 root users 0 2008-06-06 22:29 a
-rw-r--r-- 1 root root  0 2008-06-06 22:29 b
```

`chown` 也可用来递归地修改某目录下所有文件和子目录的权限。这条命令将把 `/tmp/foo` 目录下的所有内容的所有权改为 `root:root` 。

```
darkstar:~# chown -R root:root /tmp/foo/b
```

如果只有冒号和组名，没有用户名的话，将不会修改文件的所有者。

```
darkstar:~# chown :wheel /tmp/foo/a
darkstar:~# ls -l /tmp/foo
ls -l /tmp/foo
total 0
-rw-r--r-- 1 root wheel 0 2008-06-06 22:29 a
-rw-r--r-- 1 root root  0 2008-06-06 22:29 b
```

`chown` 还有个不那么常用的兄弟，`chgrp(1)` 。这个命令与 `chown` 相似，但只能改变文件所属组。既然两种事情 `chown` 都能做，那为什么还要提到 `chgrp` 呢？答案很简单，因为某些系统还用着老版的 `chown`，它不能更改所属组。如果碰到这种情况，你知道怎么做了吧。

为什么我们要把权限修改的介绍放在后面？主要原因是，`chmod(1)`（用来修改权限的工具）的语法和 `chown` 的几乎相同，但 `chmod` 除了要给出用户和组之外，还必须给出一组用八进制数或字母形式表示的权限，而这两种表示法都不是一看就会的。我们先从比较简单的八进制数表示法开始说起。

在八进制数表示下，2 的某一（0 到 2）次幂都代表了某个权限，把它们加起来就得到这一组权限的八进制表示。如果听起来很复杂的话，希望下面这个这个表格能帮到你。

| 权限 | 表示 |
| ---- | ---- |
| 读   | `4`  |
| 写   | `2`  |
| 执行 | `1`  |

> 表 10.2：八进制表示下的权限

把它们加起来就能得到一个 0 到 7 之间的数，这个数代表了一组权限。举个例子，可读可写不可执行的八进制表示就是 `6` 。 `3` 表示不可读可写可执行。设定时，三组权限都必须指定，不可能只指定某一组权限。

```
darkstar:~# ls -l /tmp/foo/a
-rw-r--r-- 1 root root  0 2008-06-06 22:29 a
darkstar:~# chmod 750 /tmp/foo/a
darkstar:~# ls -l /tmp/foo/a
-rwxr-x--- 1 root root  0 2008-06-06 22:29 a
```

`chmod` 也可以用字母表示，后面带上 `+` 或 `-` 表示的权限，这个比较好记，但是八进制表示更方便。

| 权限 | 字母表示 |
| ---- | -------- |
| 读   | `r`      |
| 写   | `w`      |
| 执行 | `x`      |

> 表 10.3：字母表示下的权限

| 影响的对象   | 字母表示 |
| ------------ | -------- |
| 用户、所有者 | `u`      |
| 所属组       | `g`      |
| 其他、全局   | `o`      |

> 表 10.4：字母表示下的用户和组

要在 `chmod` 里使用字母表示法，首先指明权限应用的对象（`u` 针对用户，`g` 针对组，`o` 表示其他），同时还要指明权限值（`+` 表示有这项权限，`-` 表示没有）。可同时设置多组，用逗号隔开。

```
darkstar:/tmp/foo# ls -l
total 0
-rw-r--r-- 1 alan users 0 2008-06-06 23:37 a
-rw-r--r-- 1 alan users 0 2008-06-06 23:37 b
-rw-r--r-- 1 alan users 0 2008-06-06 23:37 c
-rw-r--r-- 1 alan users 0 2008-06-06 23:37 d
darkstar:/tmp/foo# chmod u+x a
darkstar:/tmp/foo# chmod g+w b
darkstar:/tmp/foo# chmod u+x,g+x,o-r c
darkstar:/tmp/foo# chmod u+rx-w,g+r,o-r d
darkstar:/tmp/foo# ls -l
-rwxr--r-- 1 alan users 0 2008-06-06 23:37 a*
-rw-rw-r-- 1 alan users 0 2008-06-06 23:37 b
-rwxr-x--- 1 alan users 0 2008-06-06 23:37 c*
-r-xr----- 1 alan users 0 2008-06-06 23:37 d*
```

你喜欢哪种取决于你。每种都有各自的优点，所以真正的 Slackware 用户会选择把它们统统掌握。
