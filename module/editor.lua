require "module.class"
require "module.ID"


Editor=Class(function(self,frame)
    
    self.notebook= wxaui.wxAuiNotebook(frame, wx.wxID_ANY,wx.wxDefaultPosition, wx.wxDefaultSize)
    self:NewEditor()
    
end)

function Editor:NewEditor()
  self.editor = wxstc.wxStyledTextCtrl(self.notebook, wx.wxID_ANY,
    wx.wxDefaultPosition, wx.wxSize(0, 0),
    wx.wxBORDER_NONE)
  
  self.notebook:AddPage(self.editor,"ll")
end

return Editor
