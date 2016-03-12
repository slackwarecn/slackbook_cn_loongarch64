#### tcpdump

上面我们讨论的所有工具都只涉及对其他计算机的连接，现在我们来看看流量本身。`tcpdump(1)`（只能用root权限运行）允许我们查看我们计算机上发生或接收到的所有网络流量。`tcpdump`以各种方式原封不动地显示数据包（raw data packets）和所有网络头（network headers）。即便你看不懂它的显示信息也无所谓，因为它本来就是给专业人员设计的。默认情况下，它探测自己找到的第一张网卡，如果网卡有多个接口，可以用`-i`参数来指定一个。你可以用数式（expressions）来限制要显示的数据或者改变显示数据的方法，这些内容在man手册或其他参考资料中都有解释。

```
darkstar:~# tcpdump -i wlan0
tcpdump: verbose output suppressed, use -v or -vv for full protocol
decode
listening on wlan0, link-type EN10MB (Ethernet), capture size 96 bytes
13:22:28.221985 IP gw.ctsmacon.com.microsoft-ds > 192.168.1.198.59387:
Flags [P.], ack 838190560, win 3079, options [nop,nop,TS val 1382697489
ecr 339048583], length 164WARNING: Short packet. Try increasing the
snap length by 140
SMB PACKET: SMBtrans2 (REPLY)

13:22:28.222392 IP 192.168.1.198.59387 > gw.ctsmacon.com.microsoft-ds:
Flags [P.], ack 164, win 775, options [nop,nop,TS val 339048667 ecr
1382697489], length 134WARNING: Short packet. Try increasing the snap
length by 110
SMB PACKET: SMBtrans2 (REQUEST)
```

