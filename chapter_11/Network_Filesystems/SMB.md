#### SMB

SMB是Windows网络文件共享协议。连接到一个SMB共享（通常称为samba共享）是非常简单的。然而SMB不像NFS那样被很好的支持。但是，它在Windows计算机之间提供了更高的性能和可连接性。基于此，SMB是部署在本地网络中最常用的网络文件共享协议。在Slackware中导出SMB共享是由samba守护进程和`smb.conf`完成的。然而，如何配置samba服务超出本书的讨论范围中。可以在线查找额外的文档，也可以查看`man`手册来获取更多信息。  

挂载SMB共享和挂载NFS一样简单。你只需要以哦那个样的方式告诉`mount`服务器的位置以及你想访问的东西。此外，你还必须指定一个用户名和密码。  
```plain
darkstar:~# mount -t cifs //darkstar/home /home -o username=alan,password=secret
```  

你可能会好奇为什么文件系统类型是cifs而不是smbfs。在旧版的Linux内核中用的是smbfs。然而它已被废弃，取而代之的是有着更好性能更安全的通用cifs驱动。  

所有的SMB共享都需要用户名和密码参数。如果你把你的samba共享写在`fstab`的话，这可能产生一个安全问题。你可以使用`[credentials]`参数来避免这点。`[credentials]`指向一个包含用户名和密码的文件。只要这个文件的安全性有保障并且只有root可读，你身份凭证被损害的可能性就会降低。
