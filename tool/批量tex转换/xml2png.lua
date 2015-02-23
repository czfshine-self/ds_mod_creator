--coding: UTF-8-------
--********************************+
--利用每个tex配套的xml文件********+
--把一个大的png解析为小的png******+
--并用wx库切割********************+
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

-----------------------------------
--载入所需要的库
---------------------------------
require "luaxml"
require"wx"
print=print_lua
require"lfs"
print (lfs._VERSION)
------------------------------------
function xml2png(xmlpath,path)
  --接受xml路径与解析文件路径

	xmlfile=xml.load(xmlpath)
	texture=xmlfile:find("Texture")

	if texture then

		filen=tostring(texture.filename)
		filen=path..filen:sub(1,-4).."png"

		print("start filename:"..filen)

		im,err=wx.wxImage (filen,wx.wxBITMAP_TYPE_ANY)
		if im then

			x, y = im:GetWidth(),im:GetHeight()
			print(x,y)

			emt=xmlfile:find("Elements")
      for i=1,#emt do
        local name =emt[i].name
        local u1 =math.floor(tonumber(emt[i].u1)*x)
        local u2 =math.floor(tonumber(emt[i].u2)*x+0.5)
        local v1 =math.floor(x-tonumber(emt[i].v1)*x+0.5)
        local v2 =math.floor(x-tonumber(emt[i].v2)*x)
        print(name,u1,u2,v1,v2)
        local zsjx=u1
        local zsjy=v2
        local yxjx=u2
        local yxjy=v1
        local h=yxjy-zsjy
        local w=yxjx-zsjx
        local outim = im:GetSubImage (wx.wxRect(zsjx, zsjy,w,h))
        --outim:createPaletteFromTrueColor(false, 1)
        --outim:copyResampled(im,0,0,zsjx, zsjy,h,w,h,w)
        print(name,zsjx, zsjy,h,w,h,w)
        outim:SaveFile(path..name..".png")
      end
		else
			print("Error:"..filen)
		end
	end
end




function attrdir (path)
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local f = path..sep..file

			local attr = lfs.attributes (f)
			assert (type(attr) == "table")
			if attr.mode == "directory" then
				attrdir (f)
			elseif attr.mode == "file" then
				ext=f:sub(-3,-1)
				--print(f,ext)
				if ext=="xml" then
					xml2png(f,path..sep)
				end
			end
		end
	end
end

attrdir(ds_dir)
