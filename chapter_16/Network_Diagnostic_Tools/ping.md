#### ping

`ping(8)` 是个方便的工具，你可以用它来判断一台计算机是在你的网络上乖乖待命呢，还是到因特网上逍遥法外去了。 `ping` 就像一个探测计算机的声纳，想象一下，使用它时它会发出一声“砰”的巨响，然后你就可以通过回音来判断是否其他计算机或网络设备“听”到了这声巨响。默认情况下，`ping` 每秒检查一次远程计算机，无休无止，但你可以轻松的改变每次检查的间隔时间和要检查的次数，具体怎么做请参考 man 手册。当然不管什么时候你都可以用 `CTRL-c` 来中止程序。当 `ping` 完成了它的所有工作时，它会显示一个对于这些工作的总结，这个总结中的信息非常有用。 `ping` 常常被用来判断你是否已经连接到了因特网或者一个计算机是否存在于你的网络中，但有些系统拒绝被 ping，所以有时会出现一个系统虽然其他功能正常，但就是不回应 ping 的情况。

```
darkstar:~# ping -c 3 www.slackware.com
64 bytes from slackware.com (64.57.102.34): icmp_seq=1 ttl=47 time=87.1 ms
64 bytes from slackware.com (64.57.102.34): icmp_seq=2 ttl=47 time=86.2 ms
64 bytes from slackware.com (64.57.102.34): icmp_seq=3 ttl=47 time=86.7 ms

--- slackware.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2004ms
rtt min/avg/max/mdev = 86.282/86.718/87.127/0.345 ms
```
