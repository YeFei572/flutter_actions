### 一些杂七杂八的代码记录

#### 1、记录了`github actions`自动对`flutter`的包并对包进行发布到release上去。
  需要注意的是这里触发条件是推送新的tag即可，如下步骤:
  ```bash
  # 查看目前已知的tag有哪些
  git tag --list 
  # 新建tag
  git tag v1.7
  # 将本地tag推送到线上仓库触发仓库钩子进行打包
  git push --tags
  ```
#### 2、第三方状态管理插件`flutter_riverpod`的简单使用

有点心得：是三不是三，用`StateNotifierProvider`基本就能解决问题，还有那个`StateProvider`如果对简单类型做状态管理用用倒是很美，一旦复杂点的就要用前面提到的那个。