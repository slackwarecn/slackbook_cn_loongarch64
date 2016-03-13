### Manual Configuration 手动配置
好了，你已经安装完Slackware，也已经设置好桌面，但现在不能把它连接到互联网或您的企业的局域网，这个时候该怎么办？其实这个问题的答案很简单。 Slackware有很多工具来配置网络。首先，我们来看看一个非常强大的命令 <b>ifconfig</b>（8）它是用于查看或调整配置最常见的网络连接设备：有线网卡。<b>ifconfig</b> 是令人难以置信的强大工具，能做的不止是设置IP地址。想知道一个完整的介绍，你可以使用 <b>man</b> 命令阅读它的手册页。现在，我们只是用它来显示和更改网卡的网络地址。

<pre>
darkstar:~# ifconfig
lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:699 errors:0 dropped:0 overruns:0 frame:0
          TX packets:699 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:39518 (38.5 KiB)  TX bytes:39518 (38.5 KiB)
wlan0     Link encap:Ethernet  HWaddr 00:1c:b3:ba:ad:4c  
          inet addr:192.168.1.198  Bcast:192.168.1.255  Mask:255.255.255.0
          inet6 addr: fe80::21c:b3ff:feba:ad4c/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1630677 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1183224 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:1627370207 (1.5 GiB)  TX bytes:163308463 (155.7 MiB)
wmaster0  Link encap:UNSPEC  HWaddr 00-1C-B3-BA-AD-4C-00-00-00-00-00-00-00-00-00-00  
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
</pre>

现在你可以很清楚地看到，不带任何参数运行使用 <b>ifconfig</b> 会显示您的系统上所有网卡（包括无线网卡）的信息。以上代表的是我笔记本电脑的无线连接信息，如果看到你的系统上显示的和这不一样也没关系。如果你没有看到任何 <b>eth</b> 或 <b>wlan</b> 开头的接口显示，那可能是接口关闭了。要显示当前所有存在的网卡，无论是 [<b>up</b>]开启 或 [<b>down</b>]关闭状态，加个[<b>-a</b>]参数就可以了。

<pre>
darkstar:~# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:19:e3:45:90:44  
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:122780 errors:0 dropped:0 overruns:0 frame:0
          TX packets:124347 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:60495452 (57.6 MiB)  TX bytes:17185220 (16.3 MiB)
          Interrupt:16 
lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:699 errors:0 dropped:0 overruns:0 frame:0
          TX packets:699 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:39518 (38.5 KiB)  TX bytes:39518 (38.5 KiB)
wlan0     Link encap:Ethernet  HWaddr 00:1c:b3:ba:ad:4c  
          inet addr:192.168.1.198  Bcast:192.168.1.255  Mask:255.255.255.0
          inet6 addr: fe80::21c:b3ff:feba:ad4c/4 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1630677 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1183224 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:1627370207 (1.5 GiB)  TX bytes:163308463 (155.7 MiB)
wmaster0  Link encap:UNSPEC  HWaddr 00-1C-B3-BA-AD-4C-00-00-00-00-00-00-00-00-00-00  
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
</pre>

我们可以看到 <b>eth0</b> 接口已经在结果列出。<b>ifconfig</b> 也可以更改网卡当前的配置。通常情况下，你需要更改IP地址和子网掩码，实际上你可以修改任何参数。

<pre>
darkstar:~# ifconfig eth0 192.168.1.1 netmask 255.255.255.0
darkstar:~# ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:19:e3:45:90:44  
          inet addr:192.168.1.1  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:122780 errors:0 dropped:0 overruns:0 frame:0
          TX packets:124347 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:60495452 (57.6 MiB)  TX bytes:17185220 (16.3 MiB)
          Interrupt:16 
</pre>

现在你会发现网卡接口已经有 <b>192.168.1.1</b> 的IP地址和 <b>255.255.255.0</b> 子网掩码。现在联网的基础配置已经好了，但我们还要设置默认网关[GW]和域名解析服务器[DNS]。因此我们需要一些其他工具。
 
接下来我们看一下同样强大的命令 <b>route</b>（8）。这个工具是负责修改Linux核心的路由表, 这会影响网络上的所有数据传输。路由表可以变得非常复杂，也可以是简单地做转发。大多数用户将只需要设置一个默认网关，现在我们就说说怎么操作。如果你需要一个更复杂的路由表，我们建议阅读整个 <b>route</b> 命令的手册页或者其他的课程。现在，让我们来看看设置好 <b>eth0</b> 接口后我们的路由表是怎么样的。 

<pre>
darkstar:~# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.1.0     *               255.255.255.0   U     0      0        0 eth0
loopback        *               255.0.0.0       U     0      0        0 lo
</pre>

现在我不多解释这些信息，但如果你熟悉网络，基本信息还是可以看出来的。一个目标地址和掩码字段对应一个IP地址范围。
如果一个网关被定义，在数据包里的数据信息将被发送到对应的主机进行转发。在最后指定一个接口作为通道来发送这些数据信息。眼下，我们只能和网络地址在192.168.1.0和192.168.1.255之间的计算机通信,还有通过环回接口和自己进行通信，环回接口是一种用来给自己传递数据信息的的虚拟网卡接口。为了和世界上其他的计算机通信,我们需要设置一个默认网关。

<pre>
darkstar:~# route add default gw 192.168.1.254
darkstar:~# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.1.0     *               255.255.255.0   U     0      0        0 eth0
loopback        *               255.0.0.0       U     0      0        0 lo
default         192.168.1.254   0.0.0.0         UG    0      0        0 eth0
</pre>

现在你应该发现多了一个缺省路由。路由器把那些我们路由表中没有定义路径的数据包的发送到缺省路由。现在，当我们尝试连接 <b>64.57.102.34</b> 这些信息将被发送到 <b>192.168.1.254</b> ,这个地址的主机负责传送数据。到这一步，我们还没有完全设置好网络。我们需要些方法,把 <b>slackware.com</b> 这样的域名转换为计算机可以使用的IP地址。为此，我们需要使用DNS服务器的。

幸运的是，设置计算机使用外部（包括内部）DNS服务器也是很容易的。你可以用你喜欢的文本编辑器打开 <b>/etc/resolv.conf</b> 文件。不要问我为什么，在我的电脑，<b>resolv.conf</b> 的是这样的。

<pre>
# /etc/resolv.conf
search lizella.net
nameserver 192.168.1.254
</pre>

多数用户将不需要　<b>search</b> 这一行。这是用来把主机名称映射到完整的域名。一般来说，如果我尝试连接到 <b>barnowl</b> ，计算机会去查找 <b>barnowl.lizella.net</b>,就是 <b>search</b> 这一行产生的作用。我们主要看 <b>nameserver</b> 这行配置。这告诉 Slackware 要连接到哪个域名服务器（DNS）。一般来说，这些是指定为IP地址。如果你知道哪个用哪个 DNS (域名服务器) 你可以随时添加它们。事实上我也不知道在 <b>resolv.conf</b> 中指定的域名服务器有什么实际的数量限制，随便你想加多上行都可以。一旦这个做好了，你就可以通过完整的域名与其他主机进行通信。

但是兄弟,这工作量会很大很辛苦！我不想这样做，一次又一次的几十甚至上百台机器。所以你也该猜到了，这就是为什么那些聪明的人创造了 <b> DHCP</b>。 <b>DHCP</b> 是指动态主机控制协议，是自动配置电脑使其具有唯一的IP地址，子网掩码，网关和DNS服务器的方法。大多数时候，你都会使用 <b>DHCP</b>。大多数无线路由器，DSL或电缆调制解调器，甚至防火墙都具有DHCP服务器，这可以使你的生活变得更轻松些。 Slackware的包括两个主要的工具用于连接到一个现有的DHCP服务器，也可以作为其他计算机的DHCP服务器。 不过现在，我们只是要看看DHCP客户端功能。

首先我们考虑用 <b>dhcpd</b>(8) ， 这是 ISC DHCP 工具包的一部分。假设您的计算机的网线已经连好，并且您的网络上有可用的DHCP服务器，您可以一下子就配置好你的网卡。

<pre>
darkstar:~/ dhcpcd eth0
</pre>

如果一切正常，你的网卡应该已经配置好了，你可以跟局域网上的其他计算机进行通信，也可以上互联网了。如果出了意外 <b>dhcpcd</b> 的不能用，你可以尝试  <b>dhclient</b>（8）。<b>dhclient</b> 是dhcpcd的替代品,基本使用方法一样。

<pre>
darkstar:~/ dhclient eth0
Listening on LPF/eth0/00:1c:b3:ba:ad:4c
Sending on   LPF/eth0/00:1c:b3:ba:ad:4c
Sending on   Socket/fallback
DHCPREQUEST on eth0 to 255.255.255.255 port 67
DHCPACK from 192.168.1.254
bound to 192.168.1.198 -- renewal in 8547 seconds.
</pre>

为什么Slackware 会包括两种DHCP客户端？有时，一个特定的DHCP服务器可能会出问题，并没有很好地回应 <b>dhcpcd</b> 或者 <b>dhclient</b>   。这个时候，您可以使用其他DHCP客户端从服务器获取正确的配置。习惯上，Slackware的使用的 <b>dhcpcd</b>，这在绝大多数情况下都可以正常实用，但可能在某些时候你会需要使用 <b>dhclient</b> 来替代。两者都是优秀的DHCP客户端，所以你喜欢哪个就用哪个。
 
 
