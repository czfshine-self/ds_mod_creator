-------------------------
--main frame
--by:czfshine
--time:2014-12-10 19:14
---------------------------

-- Load the wxLua module
package.cpath = package.cpath..";./?.dll;./?.so;../lib/?.so;../lib/vc_dll/?.dll;../lib/bcc_dll/?.dll;../lib/mingw_dll/?.dll;"
package.path=package.path..";./?.lua"
require("wx")
--wx.__index=wx
setmetatable(_G, {__index=wx})

require("module.class")
Menu=require("module.menu")
MainWin=require("module.win")


--=======id===================



--=========ID=END========

--==string================
strings={}
strings.view={}
strings.view.maintitle="饥荒mod创作者平台"
strings.view.DefaultTitle="这是一个框架"


--========view================

MyApp={}
function MyApp:OnInit()

	local mainwin=MainWin(wx.NULL,
                        wx.wxID_ANY,
                        strings.view.maintitle,
                        wx.wxDefaultPosition,
                        wx.wxSize(800,600),
						wx.wxDEFAULT_FRAME_STYLE
						+wx.wxMAXIMIZE)
	local frame=mainwin.frame

	local menu=Menu()
	local menubar=menu.menubar
	frame:SetMenuBar(menubar)



    wx.wxGetApp():SetTopWindow(frame);
    frame:Show();
    return true;
end

--========view=end=========
MyApp:OnInit()
wx.wxGetApp():MainLoop()

