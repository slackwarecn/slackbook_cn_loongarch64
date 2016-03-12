#### dig

`dig(1)`工具用来手动执行更复杂的DNS查找。当你用`dig`解决DNS问题时，它就会变成一只“围栏里铁面无私的小狗”（the meanest dog in the pound）。使用`dig`，你几乎可以执行任意类型的DNS查找，从反向查找（reverse lookups）到A、CNAME、MX、SP、TXT字段的查找等等。还有太多太多的命令行选项和查找类型有待深入讨论，不过man手册中已经列出了它们的常见用法。

```
darkstar:~# dig @207.69.188.185 www.slackware.com a

; <<>> DiG 9.4.3-P4 <<>> @207.69.188.185 www.slackware.com a
; (1 server found)
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 57965
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 2, ADDITIONAL: 0

;; QUESTION SECTION:
;www.slackware.com.		IN	A

;; ANSWER SECTION:
www.slackware.com.	86400	IN	CNAME	slackware.com.
slackware.com.		86400	IN	A	64.57.102.34

;; AUTHORITY SECTION:
slackware.com.		86400	IN	NS	ns2.cwo.com.
slackware.com.		86400	IN	NS	ns1.cwo.com.

;; Query time: 348 msec
;; SERVER: 207.69.188.185#53(207.69.188.185)
;; WHEN: Sat Jul  3 16:25:10 2010
;; MSG SIZE  rcvd: 105
```

我们来看看上面用到的命令行选项。参数`@207.69.188.185`告诉`dig`要在哪个DNS服务器上进行查找，如果不指定，`dig`就在`/etc/resolv.conf`中列出的所有服务器上查找。末尾的参数`a`标明了要查找的DNS字段类型，在这个例子中我们要查找的是“A”字段包含的IPv4地址。

