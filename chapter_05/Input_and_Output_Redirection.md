### 输入、输出重定向

Linux和其他类UNIX操作系统的一个特点就是小和相对简单的应用程序的数量，以及能够将将它们堆叠在一起来创造复杂程序的能力。这可以通过重定向一个程序的输出到另一个程序，或者通过从一个文件或者第二个程序中提取输入来做到。

一开始，我们会演示给你如何将一个程序的输出重定向到文件中。这通过'>'字符来实现。当bash看到'>'字符时，会将标准输出（stdout）的内容重定向到字符后面跟着的文件中。

    darkstar:~$ echo foo
    foo
    darkstar:~$ echo foo > /tmp/bar
    darkstar:~$ cat /tmp/bar
    foo

在这个例子中，我们演示了如果没有将标准输出定位到一个文件中，`echo`会显示的内容，之后我们将其重定向到*/tmp/bar*文件中。如果这个文件不存在，会被创建。然后`echo`输出的内容就会被放在其中。如果这个文件存在，则其中的内容会被覆盖。如果你想保存这个文件中原本的内容，可以使用'>>'来添加输出到文件的后面。

    darkstar:~$ echo foo
    foo
    darkstar:~$ echo foo > /tmp/bar
    darkstar:~$ cat /tmp/bar
    foo
    darkstar:~$ echo foo2 >> /tmp/bar
    darkstar:~$ cat /tmp/bar
    foo
    foo2

你也可以重定向标准错误(stderr)到文件中。这有一点不同，你需要使用'2>'而不是'>'（因为bash能重定向标准输入，标准输出和标准错误，因此需要进行区分。0表示标准输入，1表示标准输出，2表示标准错误。除非你指明，否则bash会认为'>'表示的是重定向到标准输出。'1>'表示的也是重定向到标准输出）。

    darkstar:~$ rm bar
    rm: cannot remove 'bar': No such file or directory
    darkstar:~$ rm bar 2> /tmp/foo
    darkstar:~$ cat /tmp/foo
    rm: cannot remove 'bar': No such file or directory

如果你要重定向标准输入，使用'<'字符，尽管这并不常用。

darkstar:~$ fromdos < dosfile 

最后你也可以将一个程序的输出重定向到另一个程序的输入。这也许是bash和其他shell最有用的特点，可以通过'|'字符完成。（这个字符被认为是管道符，就好像连接两个程序的管道）

    darkstar:~$ ps auxw | grep getty
    root      2632  0.0  0.0   1656   532 tty2     Ss+  Feb21   0:00 /sbin/agetty 38400 tty2 linux
    root      3199  0.0  0.0   1656   528 tty3     Ss+  Feb15   0:00 /sbin/agetty 38400 tty3 linux
    root      3200  0.0  0.0   1656   532 tty4     Ss+  Feb15   0:00 /sbin/agetty 38400 tty4 linux
    root      3201  0.0  0.0   1656   532 tty5     Ss+  Feb15   0:00 /sbin/agetty 38400 tty5 linux
    root      3202  0.0  0.0   1660   536 tty6     Ss+  Feb15   0:00 /sbin/agetty 38400 tty6 linux



