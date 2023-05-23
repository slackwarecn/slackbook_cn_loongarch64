#### telnet

很久很久以前，`telnet(1)`是自切片面包以来最伟大的发明。简单的说，`telnet`为两台计算机建立起一个不加密的连接，然后它把任务的控制权交给用户而不是交给另外一些程序。通过`telnet`你能连接到其他计算机上的 shell，被连接的计算机仿佛就摆在了你的面前，你可以在上面执行命令。由于`telnet`没有加密功能，所以现在已经**不推荐使用**它了，然而仍不少设备在用`telnet`做它最本分的工作。
现在，`telnet`在诊断网络方面用的更多一些。因为它把任务控制权直接交给了用户，所以可以被用来做各种各样的测试。只要你知道要给接收计算机发送什么 ASCII 命令，你可以做任意数量的活动，比如读取网页或者检查邮件。告诉`telnet`要用的端口号，一切都会准备就绪。

```
darkstar:~$ telnet www.slackware.com 80
Trying 64.57.102.34...
Connected to www.slackware.com.
Escape character is `^]`.
HEAD / HTTP/1.1
Host: www.slackware.com

HTTP/1.1 200 OK
Date: Thu, 04 Feb 2010 18:01:35 GMT
Server: Apache/1.3.27 (Unix) PHP/4.3.1
Last-Modified: Fri, 28 Aug 2009 01:30:27 GMT
ETag: "61dc2-5374-4a973333"
Accept-Ranges: bytes
Content-Length: 21364
Content-Type: text/html
```
