## Slackware 中文手册

### 关于本书

本书是 [Slackbook][id_slackbook] 的中文版，项目托管于 [Github][id_github] 。

### 修订历史

你可以在 [这里][id_changes] 查看该文档的修订历史。

### 获取文档

- [在线阅读][id_online]
- [发布页面][id_releases]

### 本地编译

[GitBook][id_gitbook] 需要 [Calibre][id_calibre] 以输出 PDF、EPUB 和 MOBI 格式。安装此软件前，确保你的 Slackware Linux 中已安装 `python3` 、 `wget` 、 `xdg-utils` 和 `xz` 软件包。

```shell
curl -fsSL https://download.calibre-ebook.com/linux-installer.sh | sudo -E bash -s
sudo npm install -g @0y0/gitbook-cli
git clone https://github.com/slackwarecn/slackbook_cn.git
cd ./slackbook_cn/
make all
```

> 因为 GitBook 官方已经 [不再支持 CLI][id_gitbook_deprecation]，所以这里使用了非官方维护的版本。

### 贡献力量

如果你想为项目贡献你的力量，请务必事先阅读 [CONTRIBUTING.md](CONTRIBUTING.md) 。

[id_github]: https://github.com/slackwarecn/slackbook_cn "访问项目主页"
[id_slackbook]: http://slackbook.org "访问The Revised Slackware Book Project主页"
[id_changes]: https://github.com/slackwarecn/slackbook_cn/blob/master/CHANGES.md "查看修订历史"
[id_online]: https://slackwarecn.gitbook.io/slackbook_cn "阅读在线版本"
[id_releases]: https://github.com/slackwarecn/slackbook_cn/releases "查看已发布文档"
[id_gitbook]: https://github.com/GitbookIO/gitbook "Gitbook项目主页"
[id_gitbook_deprecation]: https://github.com/GitbookIO/gitbook#%EF%B8%8F-deprecation-warning "查看GitBook官方不再支持CLI公告"
[id_calibre]: https://github.com/kovidgoyal/calibre/releases "点此获取Calibre"

### 版权

Copyright (c) 2016-2023 The Slackware Linux CN Community (https://github.com/slackwarecn/)
