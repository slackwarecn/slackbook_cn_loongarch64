### Manual Configuration 手动配置

好了，你已经安装完 Slackware，也已经设置好桌面，但现在却不能把它连接到互联网或您的企业的局域网，这个时候该怎么办？其实这个问题的答案很简单。 Slackware 有很多工具来配置网络。首先，我们来看看一个非常强大的命令`ifconfig(8)`，它是用于查看或调整配置最常见的网络连接设备：有线网卡。`ifconfig`是令人难以置信的强大工具，能做的不仅仅是设置 IP 地址。想知道一个完整的介绍，你可以使用`man 8 ifconfig`命令阅读它的手册页。现在，我们只是用它来显示和更改网卡的网络地址。

```
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
```

现在你可以很清楚地看到，不带任何参数运行使用`ifconfig`会显示您的系统上所有网卡（包括无线网卡）的信息。以上代表的是我笔记本电脑的无线连接信息，如果看到你的系统上显示的和这不一样也没关系。如果你没有看到任何`eth`或`wlan`开头的接口显示，那可能是接口关闭了。要显示当前所有存在的网卡，无论是`up`开启还是`down`关闭状态，加个`-a`参数就可以了。

```
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
```

我们可以看到`eth0`接口已经在结果列出。`ifconfig`也可以更改网卡当前的配置。通常情况下，你需要更改 IP 地址和子网掩码，实际上你可以修改任何参数。

```
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
```

现在你会发现网卡接口已经有`192.168.1.1`的 IP 地址和`255.255.255.0`子网掩码。现在联网的基础配置已经好了，但我们还要设置默认网关（gateway）和域名解析服务器（DNS）。因此我们需要一些其他工具。

接下来我们看一下同样强大的命令`route(8)`。这个工具是负责修改 Linux 核心的路由表， 这会影响网络上的所有数据传输。路由表可以变得非常复杂，也可以是简单地做转发。大多数用户将只需要设置一个默认网关，现在我们就说说怎么操作。如果你需要一个更复杂的路由表，我们建议阅读完整的`route`命令手册页或者其他的教程。现在，让我们来看看设置好`eth0`接口后我们的路由表是怎么样的。

```
darkstar:~# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.1.0     *               255.255.255.0   U     0      0        0 eth0
loopback        *               255.0.0.0       U     0      0        0 lo
```

现在我不多解释这些信息，但如果你熟悉网络，基本信息还是可以看出来的。一个目标地址和掩码字段对应一个 IP 地址范围。

如果一个网关被定义，在数据包里的数据信息将被发送到对应的主机进行转发。在最后指定一个接口作为通道来发送这些数据信息。眼下，我们只能和网络地址在`192.168.1.0`和`192.168.1.255`之间的计算机通信，还有通过环回接口（loopback interface）和自己进行通信，环回接口是一种用来给自己传递数据信息的的虚拟网卡接口。为了和世界上其他的计算机通信，我们需要设置一个默认网关。

```
darkstar:~# route add default gw 192.168.1.254
darkstar:~# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.1.0     *               255.255.255.0   U     0      0        0 eth0
loopback        *               255.0.0.0       U     0      0        0 lo
default         192.168.1.254   0.0.0.0         UG    0      0        0 eth0
```

现在你应该发现多了一个缺省路由。路由器把那些我们路由表中没有定义路径的数据包的发送到缺省路由。现在，当我们尝试连接`64.57.102.34`，这些信息将被发送到`192.168.1.254`，这个地址的主机负责传送数据。到这一步，我们还没有完全设置好网络。我们需要些方法，把`slackware.com`这样的域名转换为计算机可以使用的 IP 地址。为此，我们需要使用 DNS 服务器。

幸运的是，设置计算机使用外部（包括内部）DNS 服务器也是很容易的。你可以用你喜欢的文本编辑器打开`/etc/resolv.conf`文件。在我的电脑，`resolv.conf`的内容是这样的。

```
# /etc/resolv.conf
search lizella.net
nameserver 192.168.1.254
```

多数用户将不需要`search`这一行。这是用来把主机名称映射到完整的域名。一般来说，如果我尝试连接到`barnowl`，计算机会去查找`barnowl.lizella.net`，就是`search`这一行产生的作用。我们主要看`nameserver`这行配置。这告诉 Slackware 要连接到哪个域名服务器（DNS）。一般来说，这些是指定为 IP 地址。如果你清楚究竟该用用哪个域名服务器，你可以随时添加它们。事实上我也不知道在 resolv.conf 中指定的域名服务器有什么实际的数量限制，随便你想加多上行都可以。一旦这个做好了，你就可以通过完整的域名与其他主机进行通信。

但是兄弟，这工作量会很大很辛苦！我不想这样做，一次又一次的几十甚至上百台机器。所以你也该猜到了，这就是为什么那些聪明的人创造了“DHCP”。“DHCP”是指动态主机控制协议，是自动配置电脑使其具有唯一的 IP 地址，子网掩码，网关和 DNS 服务器的方法。大多数时候，你都会使用“DHCP”。大多数无线路由器，DSL 或电缆调制解调器，甚至防火墙都具有 DHCP 服务器，这可以使你的生活变得更轻松些。 Slackware 的包括两个主要的工具用于连接到一个现有的 DHCP 服务器，也可以作为其他计算机的 DHCP 服务器。 不过现在，我们只是要看看 DHCP 客户端功能。

首先我们考虑用`dhcpcd(8)`，这是 ISC DHCP 工具包的一部分。假设您的计算机的网线已经连好，并且您的网络上有可用的 DHCP 服务器，您可以一下子就配置好你的网卡。

```
darkstar:~/ dhcpcd eth0
```

如果一切正常，你的网卡应该已经配置好了，你可以跟局域网上的其他计算机进行通信，也可以上互联网了。如果出了意外`dhcpcd`的不能用，你可以尝试`dhclient(8)`。`dhclient`是 dhcpcd 的替代品，基本使用方法一样。

```
darkstar:~/ dhclient eth0
Listening on LPF/eth0/00:1c:b3:ba:ad:4c
Sending on   LPF/eth0/00:1c:b3:ba:ad:4c
Sending on   Socket/fallback
DHCPREQUEST on eth0 to 255.255.255.255 port 67
DHCPACK from 192.168.1.254
bound to 192.168.1.198 -- renewal in 8547 seconds.
```

为什么 Slackware 会包括两种 DHCP 客户端？有时，一个特定的 DHCP 服务器可能会出问题，并没有很好地回应`dhcpcd`或者`dhclient`。这个时候，您可以使用其他 DHCP 客户端从服务器获取正确的配置。习惯上，Slackware 使用`dhcpcd`，这在绝大多数情况下都可以正常工作，但可能在某些时候你会需要使用`dhclient`来替代。两者都是优秀的 DHCP 客户端，所以你喜欢哪个就用哪个。
