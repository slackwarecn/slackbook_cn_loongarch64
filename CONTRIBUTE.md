### 贡献力量

#### 参与翻译

你有三种方式可以参与Slackbook中文版的翻译。

1. 提交[Issues][ID_ISSUES]，适合单处的翻译错误。
2. 提交[Pull Requests][ID_PULL_REQUESTS]，适合较多翻译内容提交。
3. [申请][ID_JOINUS]成为[The Slackware Linux CN Community][ID_SLACKWARECN] 的一员，适合长期跟进翻译工作。

#### 原始文档

你可以通过如下指令获得原始文档：

```
$ git clone git://slackbook.org/slackbook.git
$ cd slackbook
$ make
```

或者你可以在[**这里**](http://slackbook.org/beta)在线查看原始文档。

#### 参与步骤

##### 新建Issues

你需要在[Issues][ID_ISSUES]页面查看你要翻译的章节是否有人接手，如果该章节的翻译尚未开始，你需要新建一个Issue来说明自己要翻译的章节。

我会尽快把项目的翻译状态更新到[项目翻译工作进展](https://github.com/slackwarecn/slackbook_cn/issues/2)页面。

##### Pull Requests 流程

###### Fork项目

在GitHub上`fork`到自己的仓库，然后`clone`到本地，并设置用户信息。

```
$ git clone https://github.com/<Your_Github_ID>/slackbook_cn.git
$ cd slackbook_cn
$ git config user.name "id"
$ git config user.email "email"
```

###### 修改并提交翻译

做修改后提交，推送到自己的仓库，并在Commit中关闭你提的Issue。

```
$ git add .
$ git commit -am "Fix issue #n 该章节翻译已经完成 "
$ git push origin master
```

###### 发起Pull Request

现在你可以在你的Github 项目页面上发起[pull request][ID_PULL_REQUESTS]。

##### 组织内翻译提交流程

###### Clone 项目

首先你需要`clone`项目到本地。

```
$ git clone https://github.com/slackwarecn/slackbook_cn.git
$ cd slackbook_cn
$ git config user.name "id"
$ git config user.email "email"
```

###### 进行翻译并提交

做修改后提交，推送到仓库，并在Commit中关闭你提的Issue。

```
$ git add .
$ git commit -am "Fix issue #n 该章节翻译已经完成 "
$ git push origin master
```

##### 定时更新本地仓库

除此之外，你需要定期使用项目仓库内容更新自己仓库内容。

###### 更新Fork的项目

首先你需要为上游添加一个别名。

```
$ git remote add upstream https://github.com/slackwarecn/slackbook_cn.git
```

然后定期更新本地仓库。

```
$ git fetch upstream
$ git checkout master
$ git rebase upstream/master
$ git push -f origin master
```

###### 更新上游项目

如果你直接从上游`clone`下来的项目，只需要简单更新本地仓库即可。

```
$ git pull origin master
```

#### 贡献者列表

| 内容 | 贡献者 |
| --- | --- |
| 翻译框架 | [Arondight][ID_NAME_ARONDIGHT] |
| 前言 | [zhuduiyou][ID_NAME_ZHUDUIYOU] |
| 第一章 | [zhuduiyou][ID_NAME_ZHUDUIYOU] |
| 第二章 | [liandesinian][ID_NAME_LIANDESINIAN] |
| 第三章 | [unnamed42][ID_NAME_UNNAMED42] |
| 第四章 | [unnamed42][ID_NAME_UNNAMED42] [abbycin][ID_NAME_ABBYCIN] |
| 第五章 | |
| 第六章 | |
| 第七章 | |
| 第八章 | |
| 第九章 | |
| 第十章 | |
| 第十一章 | |
| 第十二章 | [Arondight][ID_NAME_ARONDIGHT] |
| 第十三章 | |
| 第十四章 | |
| 第十五章 | |
| 第十六章 | |
| 第十七章 | |
| 第十八章 | [Arondight][ID_NAME_ARONDIGHT] [zha0300][ID_NAME_ZHA0300] |
| 第十九章 | [coolrc136][ID_NAME_COOLRC136] |

[ID_SLACKWARECN]: https://github.com/slackwarecn "访问The Slackware Linux CN Community"
[ID_JOINUS]: http://slackwarecn.github.io/JoinUs "加入我们！"
[ID_PULL_REQUESTS]: https://github.com/slackwarecn/slackbook_cn/pulls "查看Pull requests"
[ID_ISSUES]: https://github.com/slackwarecn/slackbook_cn/issues "提交Issues"

[ID_NAME_ARONDIGHT]: https://github.com/Arondight
[ID_NAME_ZHUDUIYOU]: https://github.com/zhuduiyou
[ID_NAME_COOLRC136]: https://github.com/coolrc136
[ID_NAME_UNNAMED42]: https://github.com/unnamed42
[ID_NAME_LIANDESINIAN]: https://github.com/liandesinian
[ID_NAME_ZHA0300]: https://github.com/zha0300
[ID_NAME_ABBYCIN]: https://github.com/abbycin

