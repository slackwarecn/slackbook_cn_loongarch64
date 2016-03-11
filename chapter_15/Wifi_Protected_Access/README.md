### Wifi保护访问

Wifi保护访问（Wifi Protected Access，WPA）是WEP的替代协议，它为修补WEP的几个无线加密的严重问题而生。可惜，WPA仍有一些缺陷。其升级版WPA2能提供更强的保护。在现在，WPA2几乎被所有的无线网卡和接入点支持，然而有一些老机器只支持WEP。如果你需要保护你的无线网络通讯，其防护等级至少也是WPA2等级。不幸的是，`iwconfig`无法独自配置WPA2加密。为此，我们需要一个协助用保护进程，`wpa_supplicant(8)`。

然而，手动配置WPA2加密网络并不简单，首先需要用文本编辑器直接编辑`/etc/wpa_supplicant.conf`。在此我们要讨论以下WPA2保护的最简易形式——预共享密钥（Pre-Shared Key，PSK）。想要获知WPA2加密网络的更多细节以在Slackware上配置更加复杂的网络连接，参见`wpa_supplicant.conf`的手册页。

```fundamental
# /etc/wpa_supplicant.conf
# ========================
# This line enables the use of wpa_cli which is used by rc.wireless
# if possible (to check for successful association)
ctrl_interface=/var/run/wpa_supplicant
# By default, only root (group 0) may use wpa_cli
ctrl_interface_group=0
eapol_version=1
ap_scan=1
fast_reauth=1
#country=US

# WPA protected network, supply your own ESSID and WPAPSK here:
network={
  scan_ssid=1
  ssid="nest"
  key_mgmt=WPA-PSK
  psk="secret passphrase"
}
```

在这些文字中我们只需关心由花括号括起来的文字块。这里我们配置了网络的SSID为`nest`，以及要使用的PSK，`secret passphrase`。这样，WPA2就成功配置完毕了。你可以运行`wpa_supplicant`来通过DHCP获取IP地址或设置静态地址。当然，这些步骤很复杂，肯定有更简单的方式。
