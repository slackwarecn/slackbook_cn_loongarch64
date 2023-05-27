## Slackware 中文手册

### 关于本书

本书是 [Slackbook][id_slackbook] 的中文版，项目托管于 [Github][id_github] 。

### 获取文档

推荐直接[在线阅读][id_online]本书，当然你也可以在[发布页面][id_releases]获取电子书版本。

### 自行编译

[GitBook][id_gitbook] 需要 [Calibre][id_calibre] 以输出 PDF、EPUB 和 MOBI 格式。安装此软件前，确保你的 Slackware Linux 中已安装 `python3` 、 `wget` 、 `xdg-utils` 和 `xz` 软件包。

```shell
curl -fsSL https://download.calibre-ebook.com/linux-installer.sh | sudo -E bash -s
sudo npm install -g @0y0/gitbook-cli
git clone https://github.com/slackwarecn/slackbook_cn.git
cd ./slackbook_cn/
make
```

> 因为 GitBook 官方已经 [不再支持 CLI][id_gitbook_deprecation]，所以这里使用了非官方维护的版本。

### 贡献力量

如果你想为项目贡献你的力量，请务必事先阅读 [CONTRIBUTING.md](CONTRIBUTING.md) 。

### 版权

Copyright (c) 2016-2023 The Slackware Linux CN Community (https://github.com/slackwarecn/)

[id_calibre]: https://github.com/kovidgoyal/calibre "访问 Calibre 项目"
[id_gitbook]: https://github.com/GitbookIO/gitbook "访问 Gitbook 项目"
[id_gitbook_deprecation]: https://github.com/GitbookIO/gitbook#%EF%B8%8F-deprecation-warning "查看 GitBook 官方不再支持 CLI 的公告"
[id_github]: https://github.com/slackwarecn/slackbook_cn "访问本项目主页"
[id_online]: https://slackwarecn.gitbook.io/slackbook_cn "在线阅读本书"
[id_releases]: https://github.com/slackwarecn/slackbook_cn/releases "查看发布页面"
[id_slackbook]: http://slackbook.org "访问 The Revised Slackware Book Project 主页"
