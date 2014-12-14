require("module.class")

local Meun=Class(function (self,frame)

	self.menubar=wx.wxMenuBar()

	local menubar=self.menubar

	local fileMenu = wx.wxMenu()
    fileMenu:Append(wx.wxID_EXIT, "E&xit", "Quit the program")
    local helpMenu = wx.wxMenu()
    helpMenu:Append(wx.wxID_ABOUT, "&About", "About the wxLua wxTreeCtrl Sample")

    menubar:Append(fileMenu, "&File")
    menubar:Append(helpMenu, "&Help")


end)

return Meun

