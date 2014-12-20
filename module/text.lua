require "module.class"

Text=Class(function(self,frame)
    self.notebook= wxaui.wxAuiNotebook(frame, 
                                        wx.wxID_ANY,
                                        wx.wxDefaultPosition, 
                                        wx.wxDefaultSize,
                                        wxaui.wxAUI_NB_BOTTOM)
    self.text=wxTextCtrl(self.notebook,wxID_ANY)
    self.notebook:AddPage(self.text,"..")
    
  end)

return Text