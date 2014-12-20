-- coding: UTF-8----
--主窗口
-----------------------------------------------
require("module.class")
require("module.aui")
require"module.event"

local MainWin = Class(wxFrame,function(self,parent,id,title,pos,size,style,name)
	parent=parent or wx.NULL
	id=id or wx.wxID_ANY
	title=title or strings.view.DefaultTitle
	pos=pos or wx.wxDefaultPosition
	size=size or wx.wxDefaultSize
	style= style or wx.wxDEFAULT_FRAME_STYLE
	name =name or ""

	self.frame=wx.wxFrame(parent,id,title,pos,size,style,name)
	local frame=self.frame
  frame:Connect(wx.wxEVT_CLOSE_WINDOW,eventfn["CloseWin"])
	self.aui=Aui(frame)
end)

return MainWin
