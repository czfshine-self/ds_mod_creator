require "module.class"

Grid=Class(function(self,frame)
    self.notebook= wxaui.wxAuiNotebook(frame, 
                                      wx.wxID_ANY,wx.wxDefaultPosition, 
                                      wx.wxDefaultSize,
                                      wxaui.wxAUI_NB_BOTTOM+
                                      wxaui.wxAUI_NB_TAB_SPLIT+
                                      wxaui.wxAUI_NB_TAB_MOVE+
                                      wxaui.wxAUI_NB_TAB_EXTERNAL_MOVE)
    self.grid=wxGrid(self.notebook,wxID_ANY)
    self.panel=wxPanel(self.notebook, wx.wxID_ANY)
    self.sizer = wx.wxBoxSizer(wx.wxVERTICAL)
    local sizer1=self.sizer
    local panel1=self.panel
    local choices = {"one", "two", "three", "four"}
    local radioBox = wx.wxRadioBox(panel1, wx.wxID_ANY, "wxRadioBox",
                                   wx.wxDefaultPosition, wx.wxDefaultSize,
                                   choices, 1, wx.wxRA_SPECIFY_ROWS)
    local listBox = wx.wxListBox(panel1, wx.wxID_ANY, wx.wxDefaultPosition,
                                 wx.wxDefaultSize, choices)
    local listBoxStaticBox = wx.wxStaticBox( panel1, wx.wxID_ANY, "wxListBox")
    local listBoxStaticBoxSizer = wx.wxStaticBoxSizer( listBoxStaticBox, wx.wxVERTICAL )
    
    listBoxStaticBoxSizer:Add(listBox, 1, wx.wxALL + wx.wxGROW + wx.wxCENTER, 5)
    
    sizer1:Add(radioBox, 1, wx.wxALL + wx.wxGROW, 5)
    sizer1:Add(listBoxStaticBoxSizer, 1, wx.wxALL + wx.wxGROW, 5)
    
    panel1:SetSizer(sizer1)
    sizer1:SetSizeHints(panel1)
    
    self.notebook:AddPage(self.grid,"属性")
    self.notebook:AddPage(self.panel,"选择")
  end)

return Grid