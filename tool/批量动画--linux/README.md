饥荒动画批量转换工具
===========================
本工具用来批量转换饥荒动画文件为scml格式，用spriter就能打开编辑。


依赖相关
============================
依赖外部`ktools`工具，需要`lfs` 库。

在bin/spriter/目录里有免费版的`Spriter`（win32 与 linux32版）
软件，用来编辑scml文件。

注:linux下spriter需要安装依赖库


64位
```sh
sudo apt-get install libqt4-webkit libqt4-help phonon
```

32位
```sh
sudo apt-get install libqt4-webkit libqt4-help phonon
```



说明：
================================

## getrequire.lua ##
`getrequire.lua`文件用来分析动画依赖的，比如有的动画zip压缩包里
只有`anim.bin`文件，而有的zip里只有`build.bin`文件。
两者都不能独立转换成scml动画，必须分析它的依赖条件。

例如：

文件名					|拥有文件
------------------------|---------
player_actions_eat.zip	|anim.bin
wx78.zip				|build.bin
mole_basic.zip			|anim.zip
mole_build.zip			|build.zip

现在wx78只有build，缺少一个anim，可是现在player_actions_eat和mole_basic都有anim，到底是用前者的还是后者的？

这个脚本就是用来分析这些关系的。

生成两个文件`re.lua`与`zip.lua`


## unallzip.lua ##

利用系统的`7z`命令，解压所有zip到对应的目录，如果没有7z，请自行更换命令。

## copyall.lua ##

通过`getrequire`生成的文件，根据依赖关系，将对应的build与anim放入`build+animname`的文件夹里。

## main.lua ##

利用`ktools`将所有的动画转换到当前的`anim`目录里，这个脚本比较费时，我用了5分钟才执行完成。所有的饥荒动画转换后大约2G，请预留空间，我没有做错误处理的哦。





