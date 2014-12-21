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
				pp=f:sub(1,-5)
				--print(f,ext)
				if ext=="zip" then
					print(f)
					lfs.mkdir(pp..sep)
					os.execute("7z x \""..f.."\" -y -aos -o\""..pp..sep.."\"")

				end
			end
		end
	end
end
attrdir ("e:\\ds\\")
