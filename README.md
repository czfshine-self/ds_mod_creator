ds_mod_creator（unfinished）
==============
全称Don't Starve's MOD Creator.
饥荒mod制作平台，本项目的设计初衷是为了方便mod工作者制作饥荒的mod，类似于一个IDE，集成了ds_mod_tools（`MIT`协议）工具与ktools（`GPL`协议)。

本项目使用lua+`wxlua`（一个wxwidget与lua的绑定）编写，还有一部分C++用来处理上述两个工具与lua的交互。
这个项目还未完成。

================================================

编译的依赖关系
=================================================
本项目使用lua脚本语言，脚本代码无需编译。但是，它包含了`wxlua`库，本仓库提供了一个编译好的wx.dll（32bit for window）直接给lua调用，如果你是linux系统或者要使用64bit的，去wxlua官网看。
还有，
