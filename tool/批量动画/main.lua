local tmp = "/tmp"
local sep = "\\"
local upper = ".."

require"lfs"
print (lfs._VERSION)

animpath="E:\\ds\\data\\anim"

lfs.mkdir("anim")
function attrdir (path)
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local f = path..sep..file

			local attr = lfs.attributes (f)
			assert (type(attr) == "table")
			if attr.mode == "directory" then

					hastwo(f,file)
			end
		end
	end
end


function hastwo(path,name)

	local animfile=io.open(path..sep.."anim.bin")
	local buildfile=io.open(path..sep.."build.bin")

	if animfile and buildfile then

		print(path,name)
		lfs.mkdir("anim"..sep..name)

		os.execute("krane ".."\""..path..sep.."anim.bin".."\" \""..path..sep.."build.bin".."\" ".."anim"..sep..name.."\\")

	end

 end
attrdir (animpath)
