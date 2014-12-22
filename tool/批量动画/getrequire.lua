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
				if ext=="lua" then
					filestr=io.open(f,"rb"):read("*a")

					print(f)

					if haszip(filestr) then
						requiretable(filestr,file)

					end
					print("lll")

				end
			end
		end
	end
end

function haszip(str)

	if str:find("zip") then
		return true
	end
end

function getzip(str)
	local t={}
		str:gsub("Asset%(\"ANIM\", \"(.-)\"",function  (n)
			table.insert(t,n)
			end)
		for k,v in pairs(t) do
			print(k,v)
		end
	return t
end

function getrequire(str)
	local t={}
	str:gsub("require%s+\"(.-)\"",function  (n)
		table.insert(t,n)
	end)
	return t
end

require "tablesave"
retable={}
ziptable={}

function requiretable(str,filename)
	local ttt=getzip(str)
	print(#ttt)
	ziptable[filename:sub(1,-5)]=ttt
	local tttt=getrequire(str)
	print(#tttt)
	print(filename:sub(1,-5))
	retable[filename:sub(1,-5)]=tttt
end

attrdir ("E:\\ds\\")
table.save( retable ,"re.lua" )
table.save( ziptable ,"zip.lua" )


