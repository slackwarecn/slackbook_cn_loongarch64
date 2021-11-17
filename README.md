## Slackware中文手册

### 关于本书

本书是[Slackbook][ID_SLACKBOOK]的中文版，项目托管于[Github][ID_GITHUB]。

### 修订历史

你可以在[这里][ID_CHANGES]查看该文档的修订历史。

### 获取文档

+ [在线阅读][ID_ONLINE]
+ [发布页面][ID_RELEASES]

### 本地编译

确保你的系统中有`xdg-utils`、`wget`、`xz-utils`和`python2.6+`以安装[Calibre][ID_CALIBRE]。[GitBook][ID_GITBOOK]需要此软件进行PDF、EPUB和MOBI的格式转换。

```
$ sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
$ sudo npm install -g @0y0/gitbook-cli
$ git clone https://github.com/slackwarecn/slackbook_cn
$ cd slackbook_cn
$ make all
```

> 因为GitBook官方已经[不再支持CLI][ID_GITBOOK_DEPRECATION]，所以这里使用了非官方维护的版本。

### 贡献力量

如果你想为项目贡献你的力量，请务必事先阅读[CONTRIBUTING.md](CONTRIBUTING.md)。

[ID_GITHUB]: https://github.com/slackwarecn/slackbook_cn "访问项目主页"
[ID_SLACKBOOK]: http://slackbook.org "访问The Revised Slackware Book Project主页"
[ID_CHANGES]: https://github.com/slackwarecn/slackbook_cn/blob/master/CHANGES.md "查看修订历史"
[ID_ONLINE]: https://slackwarecn.gitbook.io/slackbook_cn "阅读在线版本"
[ID_RELEASES]: https://github.com/slackwarecn/slackbook_cn/releases "查看已发布文档"
[ID_GITBOOK]: https://github.com/GitbookIO/gitbook "Gitbook项目主页"
[ID_GITBOOK_DEPRECATION]: https://github.com/GitbookIO/gitbook#%EF%B8%8F-deprecation-warning "查看GitBook官方不再支持CLI公告"
[ID_CALIBRE]: https://github.com/kovidgoyal/calibre/releases "点此获取Calibre"

