## Slackware中文手册

### 关于本书

本书是[Slackbook][ID_SLACKBOOK] 的中文版。

### 修订历史

你可以在[这里][ID_CHANGES]查看该文档的修订历史。

### 贡献力量

#### 贡献者列表

| 贡献者 | 章节 |
| --- | --- |
| [Arondight](https://github.com/Arondight) | 目录翻译和GitBook 翻译框架建立 |

#### 参与翻译

你有三种方式可以参与Slackbook 中文版的翻译。

1. 提交[Issues][ID_ISSUES]，适合单处的翻译错误。
2. 提交[Pull Requests][ID_PULL_REQUESTS]，适合较多翻译内容提交。
3. [申请][ID_JOINUS]成为[The Slackware Linux CN Community][ID_SLACKWARECN] 的一员，适合长期跟进翻译工作。

#### 原始文档

你可以通过如下指令获得原始文档：

```bash
$ git clone git://slackbook.org/slackbook.git
$ cd slackbook
$ make
```

### 获取文档

#### 实时文档

+ [在线阅读][ID_HTML]
+ [离线阅读][ID_EPUB]

#### 已发布文档

+ [发布页面][ID_RELEASES]

### 本地编译

```shell
$ git clone https://github.com/slackwarecn/slackbook_cn
$ cd slackbook_cn
$ gitbook build . slackbook_cn
$ gitbook epub . slackbook_cn.epub
$ gitbook pdf . slackbook_cn.pdf
```

> 使用GitBook 本地编译需要安装[Calibre][ID_CALIBRE] 以提供EPUB 和PDF 的转换工具。

[ID_SLACKWARECN]: https://github.com/slackwarecn "访问The Slackware Linux CN Community"
[ID_JOINUS]: http://slackwarecn.github.io/JoinUs "加入我们！"
[ID_SLACKBOOK]: http://slackbook.org "访问The Revised Slackware Book Project 主页"
[ID_ISSUES]: https://github.com/slackwarecn/slackbook_cn/issues "提交Issues"
[ID_PULL_REQUESTS]: https://github.com/slackwarecn/slackbook_cn/pulls "查看Pull requests"
[ID_CHANGES]: https://github.com/slackwarecn/slackbook_cn/blob/master/Changes.md "查看修订历史"
[ID_HTML]: https://www.gitbook.com/read/book/slackwarecn/slackbook_cn "阅读在线HTML"
[ID_EPUB]: https://www.gitbook.com/download/epub/book/slackwarecn/slackbook_cn "获取EPUB"
[ID_RELEASES]: https://github.com/slackwarecn/slackbook_cn/releases "查看已发布文档"
[ID_CALIBRE]: https://github.com/kovidgoyal/calibre/releases "点此获取Calibre"

