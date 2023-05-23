### Kill 和 Killall

管理进程并不仅仅是了解哪些进程在运行，还包括改变它们的行为。最常见的管理程序的方法就是结束它。做这项工作的工具是`kill(1)`。尽管名字如此，但它实际上并不结束进程，只是向它们发送信号。最常见的信号是`SIGTERM`，它告诉进程结束正在进行的工作然后终结。还有一些其它可以发送的信号，最常用的三个是`SIGTERM`、`SIGHUP`和`SIGKILL`。

进程收到信号时会做什么呢。大多数程序收到任何信号时会退出（或者试图退出），但有些特殊的信号除外。对于初学者，`SIGTERM`信号告诉进程应该结束自己。这给了进程完成重要活动的时间，比如在退出前向磁盘上写信息。相反的，`SIGKILL`信号告诉进程立刻结束。这在杀死无响应的进程时很有用，这通常被称作“银弹”（"silver bullet"）。一些进程（通常是守护进程）会捕获`SIGHUP`信号并在收到这种信号时重新加载配置文件。

为了向进程发送信号，我们首先需要知道它的 PID。你可以使用我们说过的`ps`很容易的得到它。为了向正在运行的进程发送不同的信号，你可以使用信号编号和`-s`作为参数。`-l`参数列出了所有你可以选择的信号和它们的编号。你也可以使用`-s`和它们的名称来发送信号。

> 译者注：PID 即为进程号。

```
darkstar:~$ kill -l
 1) SIGHUP	 2) SIGINT	 3) SIGQUIT	 4) SIGILL
 5) SIGTRAP	 6) SIGABRT	 7) SIGBUS	 8) SIGFPE
 9) SIGKILL	10) SIGUSR1	11) SIGSEGV	12) SIGUSR2
13) SIGPIPE	14) SIGALRM	15) SIGTERM	16) SIGSTKFLT
... many more lines omitted ...
darkstar:~$ kill -s 9 1234 # SIGKILL
darkstar:~$ kill -s 1 1234 # SIGHUP
darkstar:~$ kill -s HUP 1234 # SIGHUP
```

有时你可能希望结束所有匹配某个进程名的进程。你可以使用`killall(1)`杀死这些进程。只需要向`killall`提供与`kill`相同的参数即可。

```
darkstar:~$ killall bash # SIGTERM
darkstar:~$ killall -s 9 bash # SIGKILL
darkstar:~$ killall -s 1 bash # SIGHUP
darkstar:~$ killall -s HUP bash # SIGHUP
```
