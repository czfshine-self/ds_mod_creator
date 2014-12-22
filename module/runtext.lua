-- coding: UTF-8 
--运行框
-------------------------------------------
require "module.class"

RunText=Class(function(self,frame)
    self.notebook= wxaui.wxAuiNotebook(frame, wx.wxID_ANY,wx.wxDefaultPosition, wx.wxDefaultSize,wxaui.wxAUI_NB_BOTTOM)
   self.text=wxstc.wxStyledTextCtrl(self.notebook, wx.wxID_ANY,
    wx.wxDefaultPosition, wx.wxSize(0, 0),
    wx.wxBORDER_NONE)
    self.notebook:AddPage(self.text,"..")
end)

return RunText
