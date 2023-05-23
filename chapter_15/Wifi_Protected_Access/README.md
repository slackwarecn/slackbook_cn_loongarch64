### Wifi 保护访问

Wifi 保护访问（Wifi Protected Access，WPA）是 WEP 的替代协议，它为修补 WEP 的几个无线加密的严重问题而生。可惜，WPA 仍有一些缺陷。其升级版 WPA2 能提供更强的保护。在现在，WPA2 几乎被所有的无线网卡和接入点支持，然而有一些老机器只支持 WEP。如果你需要保护你的无线网络通讯，其防护等级至少也是 WPA2 等级。不幸的是，`iwconfig`无法独自配置 WPA2 加密。为此，我们需要一个协助用保护进程，`wpa_supplicant(8)`。

然而，手动配置 WPA2 加密网络并不简单，首先需要用文本编辑器直接编辑`/etc/wpa_supplicant.conf`。在此我们要讨论以下 WPA2 保护的最简易形式——预共享密钥（Pre-Shared Key，PSK）。想要获知 WPA2 加密网络的更多细节以在 Slackware 上配置更加复杂的网络连接，参见`wpa_supplicant.conf`的手册页。

```
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

在这些文字中我们只需关心由花括号括起来的文字块。这里我们配置了网络的 SSID 为`nest`，以及要使用的 PSK，`secret passphrase`。这样，WPA2 就成功配置完毕了。你可以运行`wpa_supplicant`来通过 DHCP 获取 IP 地址或设置静态地址。当然，这些步骤很复杂，肯定有更简单的方式。
