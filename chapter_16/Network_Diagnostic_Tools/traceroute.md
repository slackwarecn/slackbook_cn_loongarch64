#### traceroute

`traceroute(8)`是一个方便的工具，你可以用它来了解你的数据包经过了哪些路径才到达另一台计算机的。这个工具的主要用途是判断哪些计算机离你“远”，哪些计算机离你“近”，这里的“远近”严格来讲并不是地理位置上的远近，因为你的因特网服务提供商可能会为你的数据包选择奇怪的路径。`traceroute`显示从你的计算机到你要连接的计算机之间的所有路由器。不幸的是，很多提供商、防火墙还有路由器屏蔽了`traceroute`，所以你得到的信息可能并不完整。

```
darkstar:~# traceroute www.slackware.com
traceroute to slackware.com (64.57.102.34), 30 hops max, 46 byte
packets
 1  gw.ctsmacon.com (192.168.1.254)  1.468 ms  2.045 ms  1.387 ms
 2  10.0.0.1 (10.0.0.1)  7.642 ms  8.019 ms  6.006 ms
 3  68.1.8.49 (68.1.8.49)  10.446 ms  9.739 ms  7.003 ms
 4  68.1.8.69 (68.1.8.69)  11.564 ms  6.235 ms  7.971 ms
 5  dalsbbrj01-ae0.r2.dl.cox.net (68.1.0.142)  43.859 ms  43.287 ms 44.125 ms
 6  dpr1-ge-2-0-0.dallasequinix.savvis.net (204.70.204.146)  41.927 ms 58.247 ms  44.989 ms
 7  cr2-tengige0-7-5-0.dallas.savvis.net (204.70.196.29)  42.577 ms 46.110 ms  43.977 ms
 8  cr1-pos-0-3-3-0.losangeles.savvis.net (204.70.194.53)  78.070 ms 76.735 ms  76.145 ms
 9  bpr1-ge-3-0-0.LosAngeles.savvis.net (204.70.192.222)  77.533 ms 108.328 ms  120.096 ms
10  wiltel-communications-group-inc.LosAngeles.savvis.net (208.173.55.186)  79.607 ms  76.847 ms  75.998 ms
11  tg9-4.cr01.lsancarc.integra.net (209.63.113.57)  84.789 ms  85.436 ms  85.575 ms
12  tg13-1.cr01.sntdcabl.integra.net (209.63.113.106)  87.608 ms 84.278 ms  86.922 ms
13  tg13-4.cr02.sntdcabl.integra.net (209.63.113.134)  87.284 ms 85.924 ms  86.102 ms
14  tg13-1.cr02.rcrdcauu.integra.net (209.63.114.169)  85.578 ms 85.285 ms  84.148 ms
15  209.63.99.166 (209.63.99.166)  84.515 ms  85.424 ms  85.956 ms
16  208.186.199.158 (208.186.199.158)  86.557 ms  85.822 ms  86.072 ms
17  sac-main.cwo.com (209.210.78.20)  88.105 ms  87.467 ms  87.526 ms
18  slackware.com (64.57.102.34)  85.682 ms  86.322 ms  85.594 ms
```
