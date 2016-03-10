#### NFS

NFS是为Linux和其他操作系统提供的网络文件系统。它的性能一般，但是支持完整的权限。要将NFS作为客户端或者服务端，你必须运行远程过程调用守护程序。这可以简单的通过赋予`/etc/rc.d/rc.rpc`文件可执行权限然后运行它搞定。一旦它被设置为可执行，那么它将在你每次启动Slackware是自动运行。  
```plain
darkstar:~# chmod +x /etc/rc.d/rc.rpc
darkstar:~# /etc/rc.d/rc.rpc start
```  
挂载NFS共享和挂载本地文件系统有点不同。不是给`mount`一个本地设备，而是你必须告诉`mount`NFS服务器的域名或者IP以及要挂载的目录，这两者用冒号隔开。  
```plain
darkstar:~# mount -t nfs darkstar.example.com:/home /home
```  

运行NFS服务端又有一点不同。首先，你需要在`/etc/exports`中配置每个要导出的目录。`exports(5)`包含了用来共享的目录的信息，以及和谁共享，共享的权限是怎样的。  
```plain
# See exports(5) for a description.
# This file contains a list of all directories exported to other computers.
# It is used by rpc.nfsd and rpc.mountd.

/home/backup    192.168.1.0/24(sync,rw,no_root_squash)
```  
`exports`中的第一列是要通过NFS导出的文件列表。第二列是可以访问导出文件的系统及其所需的权限的列表。你可以使用域名、IP或者网络块地址（本例）来指定主机。特殊的权限总是一个括号列表。你可以从`man`手册中获取它的完整列表。到目前为止，只有一个特殊选项`[no_root_squash]`需要注意。通常NFS客户端上的root用户对一个导出的共享既不能读也不能写。反而root用户被“压缩”了，并且被强制表现来nobody用户一样。而`[no_root_squash]`选项会防止这个现象。  

同时你还需要运行NFS守护程序。启动和停止NFS服务可以通过`/etc/rc.d/rc.ndfd`这个脚本来完成。你也可以给这个脚本可执行权限使它想`rc.rpc`那样运行。  
