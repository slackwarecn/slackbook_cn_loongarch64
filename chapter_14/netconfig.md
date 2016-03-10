### netconfig 网络配置

计算机如果不能联网就有些没意思了,
Computers aren't very interesting on their own. 

当然,你也可以在计算机上装游戏,但那也只是好一点的游戏机.
Sure, you can install games on them, but that just turns them into glorified entertainment consoles. 

在当下的时代里,计算机需要能够彼此联系沟通,他们需要联网才行.
Today, computers need to be able to talk to one another; they need to be networked.

无论你是要组建一个上千台计算机的企业网络,
Whether you're installing a business network with hundreds or thousands of computers or 

还是只想要一台电脑能联上互联网,Slackware的配置都是非常方便而简单的。
just setting up a single PC for Internet access, Slackware is simple and easy. 

这一章会教你如何建立典型的有线网络.
This chapter should teach you how to setup typical wired networks. 

下一节再讨论无线网络的设置.
Common wireless setup will be thoroughly discussed in the next section,

不过你在这章里所学到的大部分内容在无线网络那里也适用.
but much of what you read here will be applicable there as well.

我们有许多不同的方式来配置您的计算机连接到某个企业网络或互联网,
There are many different ways to configure your computer to connect to a network or the Internet, 

他们基本上可以分为两大类:静态和动态. 静态地址是固定的,
but they fall into two main categories: static and dymanic. Static addresses are solid; 

通常静态地址设置好后不太会变动,至少不会频繁变化.
they are set with the understanding that they will not be changed, at least not anytime soon. 

动态的地址是可以流通变动的, 一般是设定一段时间后地址会改变.
Dynamic addresses are fluid; the assumption is that the address will change at some time in the future. 

通常任何类型的网络服务器都会设定一个静态地址,这样其他的机器需要访问网络服务时就可以知道地址在哪里.
Typically any sort of network server requires a static address simply so other machines will know where to contact it when they need services. 

动态地址通常用于工作站,网络终端和其他任何非必需设静态地址的设备.
Dynamic addresses tend to be used for workstations, Internet clients, and any machine that doesn't require a static address for any reason.

动态地址更灵活,但其本身是极其复杂的.(注1)
Dynamic addresses are more flexible, but present complications of their own.

您可能会遇到很多种不同的网络协议,但大多数人都将只需要处理互联网协议(IP)
There are many different kinds of network protocols that you might encounter, but most people will only ever need to deal with Internet Protocol (IP).

因为这个原因，本书中我们将专注与互联网协议(IP)。
For that reason, we'll focus exclusively on IP in this book.
 
(注1:复杂指动态IP的协议实现要求,比如防止多个客户端被分配到同一个IP地址)





 
