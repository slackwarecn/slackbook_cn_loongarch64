### 有线等（无）效保密

无线网络就性质来说比有线网络更不安全。信息通过无线电波传播，使得它很容易被第三方截取。因此这些年来人们想出了很多种让无线网更安全的方法。我们第一个要介绍的就是有线等效保密（Wired Equivilant Protection，WEP。虽然名字里有“保密”但和它的名字相比相去甚远）。如果今天你还在用WEP的话，我强烈建议换用WPA2或其他更强的加密方式。破解WEP相当容易，而且只需要几分钟。然而直到今天还有无线接入点使用的是WEP，并且你某一天就有可能要用这种连接。如果你有十六进制密钥的话，连接到WEP保护的接入点非常容易。使用`iwconfig`的话，我们需要用`key`参数，后面跟着十六进制或ASCII格式的密码。如果使用ASCII密码的话，在`key`后面需要加一个`s`。但一般说来，推荐使用十六进制格式。

```Shell
darkstar:~# iwconfig wlan0 \
  key cf80baf8bf01a160de540bfb1c
darkstar:~# iwconfig wlan0 \
  key s:thisisapassword
```
