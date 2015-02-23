--coding: UTF-8-------
--********************************+
--将目录下的所有tex后缀的纹理图片*+
--用ktech转换成png格式************+
--********************************+
----------------------------------------
--配置---------------------------
---------------------------------

--饥荒目录
local ds_dir="H:\\ds1"

--------------------------------
--获取系统版本信息
--------------------------------------------------
-- put bin/ first to avoid conflicts with included modules
-- that may have other versions present somewhere else in path/cpath.
os.iswindows = os.getenv('WINDIR')
                  or (os.getenv('OS') or ''):match('[Ww]indows')
os.islinux = not os.iswindows
                and not os.getenv('DYLD_LIBRARY_PATH')
                and io.open("/proc")
os.arch = "x86" -- use 32bit by default
unpack = table.unpack or unpack
--获取位数
if os.islinux then
  local file = io.popen("uname -m")
  if file then
    local machine=file:read("*l")
    local archtype= { x86_64="x64", armv7l="armhf" }
    print(machine)
    os.arch = archtype[machine] or "x86"
    file:close()
  end
end

package.cpath = (
  os.iswindows and 'bin/?.dll;bin/clibs/?.dll;' or
  os.islinux   and ('bin/linux/%s/lib?.so;bin/linux/%s/clibs/?.so;'):format(os.arch,os.arch) or
  --[[isosx]]        'bin/lib?.dylib;bin/clibs/?.dylib;')
  .. package.cpath

package.path  = 'lualibs/?.lua;lualibs/?/?.lua;lualibs/?/init.lua;lualibs/?/?/?.lua;lualibs/?/?/init.lua;'
              .. package.path


--路径分隔符
if os.islinux then
  sep = "/"
else
  sep="\\"
end

local upper = ".."

------------------------------------------
--main
-------------------------------------
--载入lfs库
require"lfs"
print (lfs._VERSION)


function attrdir (path)
  --目录迭代器
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local f = path..sep..file

			local attr = lfs.attributes (f)
			assert (type(attr) == "table")
			if attr.mode == "directory" then
				attrdir (f)
			elseif attr.mode == "file" then
        --如果是文件的话
          run(f,path)
			end
		end
	end
end

function run(f,path)
  --处理函数
  ext=f:sub(-3,-1)
	--print(f,ext)
	if ext=="tex" then
    ----------------------------------------------+
    --********************************************|
		os.execute("ktech "..f.." "..path)--**********|
    --********************************************|
    ----------------------------------------------+
  end
end


attrdir(ds_dir,run)



