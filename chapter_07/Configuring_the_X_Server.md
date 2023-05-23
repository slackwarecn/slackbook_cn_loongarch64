### 配置 X 服务器

很久以前，配置“X”是个很难又很痛苦的事情，一个不小心显示屏就崩了。现在“X”进化得更用户友好了。实际上，大多数用户根本不用自己配置“X”, Slackware 已经为你做好了简要而合适的配置。不过，仍有一些电脑不能使用自动生成的配置，需要手动调试。

很久以前，“X”的配置文件位于`/etc/X11/xorg.conf`, 如果你创建了这个文件，“X”会遵从你的每一行设定。不过，从**X.Org 1.6.3**起，`/etc/X11/xorg.conf`再也不是“X”运行所必需了。如果你想要修改“X”的配置，不要去改那个文件，这是不科学的做法。你应该在`/etc/X11/xorg.conf.d/`文件夹内创建文件放入配置。“X”启动时会自动读取这里面的每个文件，这样你就能把配置拆分成几个小文件。举个例子，这是我笔记本上的`/etc/X11/xorg.conf.d/synaptics.conf`文件：

```
darkstar:~$ cat /etc/X11/xorg.conf.d/synaptics.conf
Section "InputDevice"
    Identifier      "Synaptics Touchpad"
    Driver          "synaptics"
    Option          "SendCoreEvents"        "true"
    Option          "Device"                "/dev/psaux"
    Option          "Protocol"              "auto-dev"
    Option          "SHMConfig"             "on"
    Option          "LeftEdge"              "100"
    Option          "RightEdge"             "1120"
    Option          "TopEdge"               "50"
    Option          "BottomEdge"            "310"
    Option          "FingerLow"             "25"
    Option          "FingerHigh"            "30"
    Option          "VertScrollDelta"       "20"
    Option          "HorizScrollDelta"      "50"
    Option          "MinSpeed"              "0.79"
    Option          "MaxSpeed"              "0.88"
    Option          "AccelFactor"           "0.0015"
    Option          "TapButton1"            "1"
    Option          "TapButton2"            "2"
    Option          "TapButton3"            "3"
    Option          "MaxTapMove"            "100"
    Option          "HorizScrollDelta"      "0"
    Option          "HorizEdgeScroll"       "0"
    Option          "VertEdgeScroll"        "1"
    Option          "VertTwoFingerScroll"   "0"
EndSection
```

创建这些配置文件，你就能轻松地管理“X”配置。
