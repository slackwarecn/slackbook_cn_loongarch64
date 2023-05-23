#### SMB

SMB 是 Windows 网络文件共享协议。连接到一个 SMB 共享（通常称为 samba 共享）是非常简单的。然而 SMB 不像 NFS 那样被很好的支持。但是，它在 Windows 计算机之间提供了更高的性能和可连接性。基于此，SMB 是部署在本地网络中最常用的网络文件共享协议。在 Slackware 中导出 SMB 共享是由 samba 守护进程和`smb.conf`完成的。然而，如何配置 samba 服务超出了本书的讨论范围。你可以在线查找额外的文档，也可以查看`man`手册来获取更多信息。

挂载 SMB 共享和挂载 NFS 一样简单。你只需要以挂载 NFS 那样的方式告诉`mount`服务器的位置以及你想访问的东西。此外，你还必须指定一个用户名和密码。

```
darkstar:~# mount -t cifs //darkstar/home /home -o username=alan,password=secret
```

你可能会好奇为什么文件系统类型是 cifs 而不是 smbfs。在旧版的 Linux 内核中用的是 smbfs。然而它已被废弃，取而代之的是有着更好性能更安全的通用 cifs 驱动。

所有的 SMB 共享都需要用户名和密码参数。如果你把你的 samba 共享写在`fstab`的话，这可能产生一个安全问题。你可以使用`credentials`参数来避免这点。`credentials`指向一个包含用户名和密码的文件。只要这个文件的安全性有保障并且只有 root 可读，你身份凭证被损害的可能性就会降低。
