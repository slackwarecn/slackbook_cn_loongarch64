### GRUB2

GRUB2 是一种 Linux 引导器，并且目前是 LoongArch Slackware 的默认引导器。

UEFI （Unified Extensible Firmware Interface) 固件只支持 GPT (GUID Partition Table) 分区，所以在安装系统分区时需要把磁盘分区格式设置为 GPT 格式。

#### GRUB2 的grub.cfg

grub.cfg 的功能简单来讲可以分为两部分：启动界面的设置、启动项的配置。下面介绍下通过修改哪些配置文件，来进行定制 grub.cfg：

* 启动界面的设置：`/etc/default/grub` 是 grub 全局配置文件，文件中定义了 grub 的全局宏，主要包含了启动界面的设置，比如默认启动项的设置、等待用户选择启动项时间设置、加载的字体等。 
* 启动项的配置：`/etc/grub.d/` 目录下是 grub 的配置脚本，在定制系统启动时可以修改全局配置文件和配置脚本。
  
可以使用 grub-mkconfig 生成 grub2 配置文件 grub.cfg，执行：

```
    grub-mkconfig -o /boot/grub/grub.cfg
```

新生成的grub.cfg里启动项大致如下:

```
.... many more lines ommitted ....
### BEGIN /etc/grub.d/10_linux ###
menuentry 'Slackware-15.0+ GNU/Linux' --class slackware_15_0_ --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-555b5454-296c-499b-ac88-219d17c7e5b9' {
        load_video
        insmod gzio
        insmod part_gpt
        insmod ext2
        set root='hd0,gpt2'
        if [ x$feature_platform_search_hint = xy ]; then
          search --no-floppy --fs-uuid --set=root --hint-ieee1275='ieee1275//disk@0,gpt2' --hint-bios=hd0,gpt2 --hint-efi=hd0,gpt2 --hint-baremetal=ahci0,gpt2  c15c4ceb-7c1b-4ad5-a646-217e0b575d95
        else
          search --no-floppy --fs-uuid --set=root c15c4ceb-7c1b-4ad5-a646-217e0b575d95
        fi
        echo    'Loading Linux 6.3.0 ...'
        linux   /vmlinuz-generic-6.3.0 root=UUID=555b5454-296c-499b-ac88-219d17c7e5b9 ro  
        echo    'Loading initial ramdisk ...'
        initrd  /initrd-6.3.0.img
}
.... many more lines ommitted ....
```

在 Slackware 里的启动条目例子里，menuentry 是显示的启动条目，下面是 GRUB2 加载的 grub 模块，linux 后面跟要启动的内核是 `vmlinuz-generic-6.3.0` ，根的 UUID是 `555b5454-296c-499b-ac88-219d17c7e5b9`, initrd 后面跟加载的 initrd 是 `initrd-6.3.0.img` ，因为加载了 initrd，所以系统可以解析 UUID ，若你的系统没有 initd，那就不能使用UUID，需要指定设备号。

#### GRUB2 的 EFI 程序

EFI 程序存放环境设置
* 在 GPT 分区下，创建 EFI 系统分区(ESP分区，又叫 esp 分区)，文件系统格式为 VFAT 分区。

生成更新 EFI 程序

```
cat  >> grub.cfg << EOL
set root=',gpt2'
set prefix=($root)'/grub'
configfile $prefix/grub.cfg
EOL

GRUB_MODS="acpi adler32 affs afs all_video archelp bfs bitmap bitmap_scale \
blocklist boot bswap_test btrfs bufio cat cbfs chain cmdline_cat_test cmp  \
cmp_test configfile cpio_be cpio crc64 cryptodisk crypto ctz_test datehook \
date datetime diskfilter disk div div_test dm_nv echo efifwsetup efi_gop   \
efinet elf eval exfat exfctest ext2 extcmd fat file font fshelp            \
functional_test gcry_arcfour gcry_blowfish gcry_camellia gcry_cast5        \
gcry_crc gcry_des gcry_dsa gcry_idea gcry_md4 gcry_md5 gcry_rfc2268        \
gcry_rijndael gcry_rmd160 gcry_rsa gcry_seed gcry_serpent gcry_sha1        \
gcry_sha256 gcry_sha512 gcry_tiger gcry_twofish gcry_whirlpool geli        \
gettext gfxmenu gfxterm_background gfxterm_menu gfxterm gptsync gzio halt  \
hashsum hello help hexdump hfs hfspluscomp hfsplus http iso9660 jfs jpeg   \
keystatus ldm linux loadenv loopback lsacpi lsefimmap lsefi lsefisystab    \
lsmmap ls lssal luks lvm lzopio macbless macho mdraid09_be mdraid09        \
mdraid1x memdisk memrw minicmd minix2_be minix2 minix3_be minix3 minix_be  \
minix mmap mpi msdospart mul_test net newc nilfs2 normal ntfscomp ntfs odc \
offsetio part_acorn part_amiga part_apple part_bsd part_dfly part_dvh      \
part_gpt part_msdos part_plan part_sun part_sunpc parttool password        \
password_pbkdf2 pbkdf2 pbkdf2_test png priority_queue probe procfs         \
progress raid5rec raid6rec read reboot regexp reiserfs romfs scsi          \
search_fs_file search_fs_uuid search_label search serial setjmp            \
setjmp_test sfs shift_test signature_test sleep sleep_test squash4         \
syslinuxcfg tar terminal terminfo test_blockarg testload test testspeed    \
tftp tga time trig tr true udf ufs1_be ufs1 ufs2 video_colors video_fb     \
videoinfo video videotest_checksum videotest xfs xnu_uuid xnu_uuid_test    \
xzio zfscrypt zfsinfo zfs"

grub-mkimage -p /boot/efi/EFI/BOOT/ --format=loongarch64-efi \
-c `pwd`/grub.cfg --output=/boot/efi/EFI/BOOT/BOOTLOONGARCH64.EFI \
$GRUB_MODS
# 有少量机型的固件可能会识别BOOTLOONGARCH.EFI，基于实际情况制作

# 参数含义
-p 设置偏好文件夹，cfg文件中会调
--format或-d 表示指定查找模块目录
-c 表示指定配置文件，这个配置文件会集成到efi文件内，就是我们刚刚编写的grub.cfg
--output或-o 表示生成的目标文件
```
