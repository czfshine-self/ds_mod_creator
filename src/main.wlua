-------------------------
--main frame
--by:czfshine
--time:2014-12-10 19:14
---------------------------

-- Load the wxLua module
package.cpath = package.cpath..";./?.dll;./?.so;../lib/?.so;../lib/vc_dll/?.dll;../lib/bcc_dll/?.dll;../lib/mingw_dll/?.dll;"

require("wx")
--wx.__index=wx
setmetatable(_G, {__index=wx})

require("module.class")
--=======id===================
ID={
	COUNTER = wxID_HIGHEST + 1,

	New=function ()
		ID.COUNTER = ID.COUNTER + 1
		return ID.COUNTER
	end}

----widget id ----------
--ID.MAINWIN=ID.NEW() --main window(frame)

--=========ID=END========

--==string================
strings={}
strings.view={}
strings.view.maintitle="饥荒mod创作者平台"
strings.view.DefaultTitle="这是一个框架"
--========view================
wxFrame.__call

local MainWin = {}
setmetatable(MainWin,wxFrame)
--[[
local MainWin = Class(wxFrame,function(self,parent,id,title,pos,size,style,name)
	parent=parent or wx.NULL
	id=id or wx.wxID_ANY
	title=title or strings.view.DefaultTitle
	pos=pos or wx.wxDefaultPosition
	size=size or wx.wxDefaultSize
	style= style or wx.wxDEFAULT_FRAME_STYLE
	name =name or ""

	self.frame=wx.wxFrame(parent,id,title,pos,size,style,name)

end)

]]

--[[
local MainWin = Class(function(self,parent,id,title,pos,size,style,name)
	self.__call=wx.wxFrame
	end)
]]

--========view=end=========


MyApp={}
function MyApp:OnInit()
	mainwin=MainWin(wx.NULL,
                        wx.wxID_ANY,
                        strings.view.maintitle,
                        wx.wxDefaultPosition,
                        wx.wxSize(800,600),
						wx.wxDEFAULT_FRAME_STYLE
						+wx.wxMAXIMIZE)

    wx.wxGetApp():SetTopWindow(mainwin);
    mainwin:Show();
    return true;
end
MyApp:OnInit()
wx.wxGetApp():MainLoop()

