## 第三章、引导

### 本章目录

- [mkinitrd](mkinitrd.md)
- [引导器](chapter_03/Boot_loader/README.md)
  - [LILO](chapter_03/Boot_loader/LILO.md)
  - [GRUB2](chapter_03/Boot_loader/GRUB2.md)
- [多重引导](Dual_Booting/README.md)
  - [引导多个分区](Dual_Booting/Dual_Booting_with_Partitions.md)
  - [引导多个硬盘](Dual_Booting/Dual_Booting_from_Hard_Drives.md)

既然你已经安装好了一个 Slackware 系统，你就应该学习些关于系统启动的知识，比如是什么控制着机器的启动顺序，当这一机制损坏的时候如何修复。如果你已使用 Linux 足够长的时间，你总有可能搞坏你的引导程序（bootloader）。 还好，修复它并不需要重装一次系统。Linux（更确切一点，Slackware）给予您启动过程的完全控制权，而不是像其他系统一样将底层工作原理隐藏起来。简单到只需修改几个配置文件并重新运行引导程序的安装程序，你就能又快又好地修改（或破坏）你的系统。Slackware 还让多系统启动更加简单，比如和其他 Linux 发行版或 Microsoft Windows 组成多系统。
