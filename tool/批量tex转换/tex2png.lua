
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
				if ext=="tex" then
				os.execute("ktech "..f.." "..path)
				end
			end
		end
	end
end

--attrdir("E:/DLC0001")



