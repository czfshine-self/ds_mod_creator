饥荒图片处理
============================
本工具用来处理饥荒纹理图片的，可以将饥荒的tex转换成png格式，并利用
对应的xml文件解析切割成小的png图片。

依赖
========================
这个工具需要用到`ktools`，lua的`wx`，`lfs`（luafilesystem），`luaxml`库。

如何使用
======================================

修改tex2png.lua的最后一行的attrdir函数为你的饥荒路径，例如

```lua
attrdir("E:/ds")
```
运行tex2png.lua


修改xml2png.lua的最后一行的attrdir函数为你的饥荒路径，例如

```lua
attrdir("E:/ds")
```
运行xml2png.lua

在饥荒对应的目录下会输出对应的png文件。
