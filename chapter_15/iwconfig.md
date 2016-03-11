### iwconfig

无线网络相比传统的有线网络更为复杂，因此需要一些额外的配置工具。Slackware包含了各种能在底层陪着无线网卡（WINC）的工具套件。我们不会每一个都讲，只是在这里为你快速上手打下一个坚实的基础。我们要研究的第一个工具就是`iwconfig(8)`。不带任何参数运行时，`iwconfig`会显示当前所有网卡的网络信息。

```Shell
darkstar:~# iwconfig
lo        no wireless extensions.

eth0      no wireless extensions.

wmaster0  no wireless extensions.

wlan0     IEEE 802.11abgn  ESSID:"nest"
          Mode:Managed  Frequency:2.432 GHz  Access Point:
00:13:10:EA:4E:BD
          Bit Rate=54 Mb/s   Tx-Power=17 dBm
          Retry min limit:7   RTS thr:off   Fragment thr=2352 B
          Encryption key:off
          Power Management:off
          Link Quality=100/100  Signal level:-42 dBm
          Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
          Tx excessive retries:0  Invalid misc:0   Missed beacon:0

tun0      no wireless extensions.
```

与有线网络工具不同，无线网络工具显得更加“模糊”。无线工具之间的界限很难划清，并且经常出现功能重叠。真想弄清楚的话，每个无线网络都有（希望它真的有）唯一标识符。两个最基本的就是服务区别号（Extended Service Set Identifier，ESSID）和信道或者说广播频率。ESSID就是用来标识无线网络名称的，实际上你可能听说过它，只不过它被称为“网络名称”或者什么别的东西。

一般无线网络工作在11个不同的信道上。如果要连接到哪怕是最基础的无线网络上，你也要设置两部分信息，而且很可能在配置之前还要做点别的准备工作，比如无线网卡的IP地址。在这里你会看见我的ESSID设置为了`nest`，我的笔记本射电频率是2.432GHz。这些就是连接到无加密无线网所需的全部信息。（这是对那些想要到我家来蹭网的人说的：在连接到我的无加密无线网之前，你们还得破解一个2048位的SSL密钥才能连接到接入点上网）

> 译者注：这里指传统的2.4G无线网络

```Shell
darkstar:~# iwconfig wlan0 essid nest \
freq 2.432G
```

`freq`和`channel`参数控制的基本上是同一个东西，你只要使用其中之一就行了。如果你不确定你用的是什么频率或者要用哪个信道，Slackware会自动帮你处理。

```Shell
darkstar:~# iwconfig wlan0 essid nest \
channel auto
```

现在Slackware会用某种频率连接到ESSID为`nest`的最强的接入点。

