require "module.class"

Notebook=Class(function(self,frame)
	self.notebook = wxaui.wxAuiNotebook(frame, wx.wxID_ANY,
    wx.wxDefaultPosition, wx.wxDefaultSize
   )
	self.api=wxaui.wxAuiPaneInfo()
	self.api:Name("test")
	self.api:Caption("Client Size Reporter")
	self.api:Right()
	self.api:Layer(2)
	self.api:CloseButton(true)
	self.api:MaximizeButton(true)
	self.api:CaptionVisible (false)--标题

end)

return Notebook
