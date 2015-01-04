-------------------------------------------------------
require "tablesave"
-------------------------------------------------------
ziptable=table.load("zip.lua")
retable=table.load("re.lua")

-------------------------------------------------------------------
animpath="E:\\ds\\data\\anim"

local tmp = "/tmp"
local sep = "\\"
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

				if hasanimnotbuild(f) then
				--print(file)
					getanim(file,f,path)
				end


			end
		end
	end
end

function hasanimnotbuild(path)

	animf=io.open(path..sep.."anim.bin")
	buildf=io.open(path..sep.."build.bin")

	if  animf and not buildf  then
		return true
	end

	if animf then
		animf:close()
	end
	if buildf then
		buildf:close()
	end

end

function hasbuildnotanim(path)

	animf=io.open(path..sep.."anim.bin")
	buildf=io.open(path..sep.."build.bin")

	if  buildf and not animf  then
		return true
	end

	if animf then
		animf:close()
	end
	if buildf then
		buildf:close()
	end

end




function getanim(file,f,path)
	local zipfilename2="anim/"..file..".zip"

	for k,v in pairs(ziptable) do
		for kk,vv in pairs(v) do
		--print(k,v,kk,vv)
			if vv==zipfilename2 then

				local animname=file

				for kkk,vvv in pairs(ziptable[k]) do

				 if hasbuildnotanim(path..sep..vvv:sub(6,-5)) then

					buildname=vvv:sub(6,-5)

					print(animname.."_"..buildname)

					lfs.mkdir(path..sep..animname.."_"..buildname..sep)
					print("cp ".."\""..path..sep..animname..sep.."*.*\" \""..path..sep..animname.."_"..buildname..sep.."\"")
					os.execute("copy ".."\""..path..sep..buildname..sep.."*.*\" \""..path..sep..animname.."_"..buildname..sep.."\"")
					os.execute("copy ".."\""..path..sep..animname..sep.."*.*\" \""..path..sep..animname.."_"..buildname..sep.."\"")


				end

				end

			end
		end
	end



end


attrdir (animpath)
