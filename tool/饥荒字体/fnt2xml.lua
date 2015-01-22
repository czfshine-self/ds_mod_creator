
function xyhw2uv12(x,y,h,w)
	local u1,u2,v1,v2
	u1=x
	v2=y
	v1=v2+h
	u2=u1+w
	return u1,u2,v1,v2
end


function id2ment(id,u1,u2,v1,v2)
	return "<Element name=\""..id..".tex\"\n u1=\""..u1.."\"\n u2=\""..u2.."\"\n v1=\""..v1.."\"\n v2=\""..v2.."\" />\n"

end

require "luaxml"

xmlfile=xml.load("sc.fnt")
font=xmlfile:find("font")
chars=font:find("chars")
print(chars.count)
emt=chars:find("char")
scaleW=4096 scaleH=2096

outfile=io.open("fontcn.xml","wb")
outfile:write([[
<Atlas>
<Texture filename="fontcn.tex" />
<Elements>
]])


for i=1,#chars do

local ID=chars[i].id
local X=chars[i].x/scaleW
local Y=chars[i].y/scaleH
local H=chars[i].height/scaleH
local W=chars[i].width/scaleW

outfile:write(id2ment(ID,xyhw2uv12(X,Y,H,W)))

end

outfile:write([[
</Elements>
</Atlas>]])



