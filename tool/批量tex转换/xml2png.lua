--os.execute("ktech 1.tex .")


os.iswindows = os.getenv('WINDIR') or (os.getenv('OS') or ''):match('[Ww]indows')

os.islinux = not os.iswindows and not os.getenv('DYLD_LIBRARY_PATH') and io.open("/proc")
os.arch = "x86" -- use 32bit by default
unpack = table.unpack or unpack

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
  os.iswindows and 'bin/?.dll;bin/clibs/?.dll;../../bin/ktools/?.dll;../../bin/?.dll;../../bin/clibs/?.dll;' or
  os.islinux and ('bin/linux/%s/lib?.so;bin/linux/%s/clibs/?.so;'):format(os.arch,os.arch) or
  --[[isosx]] 'bin/lib?.dylib;bin/clibs/?.dylib;')
    .. package.cpath

package.path  = 'lualibs/?.lua;lualibs/?/?.lua;lualibs/?/init.lua;lualibs/?/?/?.lua;lualibs/?/?/init.lua;../../bin/clibs/?.lua;'
              .. package.path

require "luaxml"
require"wx"
print=print_lua

function xml2png(xmlpath,path)

	xmlfile=xml.load(xmlpath)
	texture=xmlfile:find("Texture")

	if texture then
		filen=tostring(texture.filename)
		filen=path..filen:sub(1,-4).."png"

		print(filen)

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



local tmp = "/tmp"
local sep = "/"
local upper = ".."

require"lfs"
print (lfs._VERSION)


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

--attrdir("E:/DLC0001")












