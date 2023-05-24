#### 再看 rc.inet1.conf

`rc.inet1.conf`：欢迎回来。让我们回想一下 [第十四章，网络](../../chapter_14/README.md) 中我们使用了这个文件使得 Slackware 启动时让它自动配置网卡。现在，我们使用它来配置 wifi。

> ##### 注意
>
> 如果你使用的是 WPA2，你需要首先配置好 `wpa_supplicant.conf` 。

还记得每个网卡都有个与变量配套，用来标识变量的名称或数字吗？这对无线网卡依然成立，只不过由于无线网络网络的复杂性，变量更多了而已。

```
# rc.inet1.conf (excert)
# ======================
## Example config information for wlan0.  Uncomment the lines you need and fill
## in your info.  (You may not need all of these for your wireless network)
IFNAME[4]="wlan0"
IPADDR[4]=""
NETMASK[4]=""
USE_DHCP[4]="yes"
#DHCP_HOSTNAME[4]="icculus-wireless"
#DHCP_KEEPRESOLV[4]="yes"
#DHCP_KEEPNTP[4]="yes"
#DHCP_KEEPGW[4]="yes"
#DHCP_IPADDR[4]=""
WLAN_ESSID[4]="nest"
#WLAN_MODE[4]=Managed
#WLAN_RATE[4]="54M auto"
#WLAN_CHANNEL[4]="auto"
#WLAN_KEY[4]="D5AD1F04ACF048EC2D0B1C80C7"
#WLAN_IWPRIV[4]="set AuthMode=WPAPSK | \
#   set EncrypType=TKIP | \
#   set WPAPSK=96389dc66eaf7e6efd5b5523ae43c7925ff4df2f8b7099495192d44a774fda16"
WLAN_WPA[4]="wpa_supplicant"
#WLAN_WPADRIVER[4]="ndiswrapper"
```

党我们讨论有线以太网的时候，与数字 `n` 配套的是 `ethn` 中每个变量里的 `n` 。然而，对无线网不成立。注意 `IFNAME[4]` 有个值为 `wlan0`（无线网卡有个除了 `ethn` 以外的名字很正常）。当启动脚本读取 `rc.inet1.conf` 时，Slackware 会将这些配置应用到 `wlan0` 网卡而不是（可能不存在的）`eth4` 网卡上。其他许多选项同理。IP 地址的配置要与 [第十四章，网络](../../chapter_14/README.md) 里讲的有线网卡配置方式完全一样。不过，还有些选项需要在下面进行解释。

`WLAN_ESSID[n]` 和 `WLAN_CHANNEL[n]` 正如其名，分别表示 ESSID 和使用的频率。 `WLAN_MODE[n]` 可是 `managed` 或 `ad-hoc` 。连接到无线接入点的人需要使用 `managed` 模式。 `WLAN_KEY[n]` 是要使用的 WEP 密钥（如果你不得不使用 WEP 的话）。 `WLAN_IWPRIV[n]` 相当复杂，它设置了其他变量的值。 `WLAN_IWPRIV[n]` 是为 WPA2 网络准备的，在这里你告诉 Slackware 你所使用的 WPA2 连接的的认证模式，加密类型，密钥。请注意 `WLAN_KEY[n]` 和 `WLAN_IWPRIV[n]` 是相互独立的，在同一个接口上你不可能两个都用。如果你成功配置了以上项目，系统启动时 Slackware 就会尝试连接至你的无线网络。

等等，还有事没做！如果我要连接多个无线网怎么办？我平时带笔记本去上班和去学校，一旦进入无线网覆盖范围内就要马上配置以无缝切换，如果这么干的话就太麻烦了。对，你想的没错，有更方便的工具。
