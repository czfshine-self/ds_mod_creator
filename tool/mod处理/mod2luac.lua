
local tmp = "/tmp"
local sep = "\\"
local upper = ".."


require"lfs"
print (lfs._VERSION)

path="e:\\boxlock"


local newdir=path.."1"

lfs.mkdir(newdir..sep)
print("XCOPY \""..path.."".."\" \""..newdir..sep.."\" /S")
os.execute("XCOPY \""..path.."".."\" \""..newdir..sep.."\" /S" )

function dir (path)


print(path)

	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local f = path..sep..file

			local attr = lfs.attributes (f)
			assert (type(attr) == "table")
			if attr.mode == "directory" then
				dir (f)
			elseif attr.mode == "file" then
				ext=f:sub(-3,-1)
				pp=f:sub(1,-5)
				print(f,ext,pp)
				if ext=="lua" then

					print(f)

    os.execute("luac -o "..pp..".lua "..f)

				end
			end
		end
	end
end

dir (newdir)
