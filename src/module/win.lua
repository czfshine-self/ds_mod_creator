require("module.class")
Aui=require("module.aui")

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
	aui=Aui(frame)


end)

return MainWin
