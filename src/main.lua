-------------------------
--main f
--by:czfshine
--time:2014-12-10 19:14
---------------------------
require("tool.osystem")

-- Load the wxLua module
require("wx")
setmetatable(_G, {__index=wx})

require("module.class")
require("module.menu")
require("module.win")

idclass=require "module.ID"

ID=idclass()


--==string================
strings={}
strings.view={}
strings.view.maintitle="啦啦啦"
strings.view.DefaultTitle="frame"

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
  
  require "module.event"
  eventfn.frame=frame


	local menu=Menu(frame)
	local menubar=menu.menubar
	frame:SetMenuBar(menubar)



    wx.wxGetApp():SetTopWindow(frame);
    frame:Show();
    return true;
end

--========view=end=========
MyApp:OnInit()
wx.wxGetApp():MainLoop()
os.exit(0)
