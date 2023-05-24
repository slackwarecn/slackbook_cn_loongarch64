### 贡献力量

#### 参与翻译

你有三种方式可以参与 Slackbook 中文版的翻译。

1. 提交 [Issues][id_issues]，适合单处的翻译错误。
2. 提交 [Pull Requests][id_pull_requests]，适合较多翻译内容提交。
3. [申请][id_joinus] 成为 [The Slackware Linux CN Community][id_slackwarecn] 的一员，适合长期跟进翻译工作。

#### 原始文档

你可以通过如下指令获得原始文档：

```
$ git clone https://github.com/slackwarecn/slackbook.git
$ cd slackbook
$ git checkout 7151c2376e05ee3a34025a24080fa283e460d7cc
$ make
```

或者你可以在 [**这里**](http://slackbook.org/beta) 在线查看原始文档。

#### 参与步骤

##### 新建 Issues

你需要在 [Issues][id_issues] 页面查看你要翻译的章节是否有人接手，如果该章节的翻译尚未开始，你需要新建一个 Issue 来说明自己要翻译的章节。

我会尽快把项目的翻译状态更新到 [项目翻译工作进展](https://github.com/slackwarecn/slackbook_cn/issues/2) 页面。

##### Pull Requests 流程

###### Fork 项目

在 GitHub 上 `fork` 到自己的仓库，然后 `clone` 到本地，并设置用户信息。

```
$ git clone https://github.com/<Your_Github_ID>/slackbook_cn.git
$ cd slackbook_cn
$ git config user.name "id"
$ git config user.email "email"
```

###### 修改并提交翻译

做修改后提交，推送到自己的仓库，并在 Commit 中关闭你提的 Issue。

```
$ git add .
$ git commit -m "Close #n 该章节翻译已经完成 "
$ git push origin master
```

###### 发起 Pull Request

现在你可以在你的 Github 项目页面上发起 [Pull Request][id_pull_requests] 。

##### 组织内翻译提交流程

###### Clone 项目

首先你需要 `clone` 项目到本地。

```
$ git clone https://github.com/slackwarecn/slackbook_cn.git
$ cd slackbook_cn
$ git config user.name "id"
$ git config user.email "email"
```

###### 进行翻译并提交

做修改后提交，推送到仓库，并在 Commit 中关闭你提的 Issue。

```
$ git add .
$ git commit -m "Close #n 该章节翻译已经完成 "
$ git push origin master
```

##### 定时更新本地仓库

除此之外，你需要定期使用项目仓库内容更新自己仓库内容。

###### 更新 Fork 的项目

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

如果你直接从上游 `clone` 下来的项目，只需要简单更新本地仓库即可。

```
$ git pull origin master
```

#### 签名

请尽量使用自己的 GPG 密钥对提交进行签名。

#### 贡献者列表

| 内容     | 贡献者                                                                                       |
| -------- | -------------------------------------------------------------------------------------------- |
| 翻译框架 | [Arondight][id_name_arondight]                                                               |
| 前言     | [Arondight][id_name_arondight] [zhuduiyou][id_name_zhuduiyou] [紫雨蝶眸][id_name_ziyudiemou] |
| 第一章   | [zhuduiyou][id_name_zhuduiyou] [紫雨蝶眸][id_name_ziyudiemou]                                |
| 第二章   | [liandesinian][id_name_liandesinian] [紫雨蝶眸][id_name_ziyudiemou]                          |
| 第三章   | [unnamed42][id_name_unnamed42]                                                               |
| 第四章   | [abbycin][id_name_abbycin] [unnamed42][id_name_unnamed42]                                    |
| 第五章   | [liandesinian][id_name_liandesinian]                                                         |
| 第六章   | [farkasity][id_name_farkasity]                                                               |
| 第七章   | [unnamed42][id_name_unnamed42]                                                               |
| 第八章   | [nnnewb][id_name_nnnewb]                                                                     |
| 第九章   | [unnamed42][id_name_unnamed42]                                                               |
| 第十章   | [unnamed42][id_name_unnamed42]                                                               |
| 第十一章 | [abbycin][id_name_abbycin]                                                                   |
| 第十二章 | [Arondight][id_name_arondight]                                                               |
| 第十三章 | [zhuduiyou][id_name_zhuduiyou]                                                               |
| 第十四章 | [cantaosir][id_name_cantaosir]                                                               |
| 第十五章 | [unnamed42][id_name_unnamed42]                                                               |
| 第十六章 | [zhuduiyou][id_name_zhuduiyou]                                                               |
| 第十七章 | [zhuduiyou][id_name_zhuduiyou] [紫雨蝶眸][id_name_ziyudiemou]                                |
| 第十八章 | [Arondight][id_name_arondight] [nnnewb][id_name_nnnewb] [zha0300][id_name_zha0300]           |
| 第十九章 | [coolrc136][id_name_coolrc136]                                                               |

[id_slackwarecn]: https://github.com/slackwarecn "访问The Slackware Linux CN Community"
[id_joinus]: http://slackwarecn.github.io/JoinUs "加入我们！"
[id_pull_requests]: https://github.com/slackwarecn/slackbook_cn/pulls "查看Pull Requests"
[id_issues]: https://github.com/slackwarecn/slackbook_cn/issues "提交Issues"
[id_name_arondight]: https://github.com/Arondight
[id_name_zhuduiyou]: https://github.com/zhuduiyou
[id_name_coolrc136]: https://github.com/coolrc136
[id_name_unnamed42]: https://github.com/unnamed42
[id_name_liandesinian]: https://github.com/liandesinian
[id_name_zha0300]: https://github.com/zha0300
[id_name_abbycin]: https://github.com/abbycin
[id_name_farkasity]: https://github.com/farkasity
[id_name_cantaosir]: https://github.com/cantaosir
[id_name_ziyudiemou]: http://tieba.baidu.com/home/main?un=%E7%B4%AB%E9%9B%A8%E8%9D%B6%E7%9C%B8&ie=utf-8&fr=pb
[id_name_nnnewb]: https://github.com/nnnewb
