-------------------------------------
--菜单类
------------------------------------
require("module.class")
require "module.event"

Menu=Class(function (self,frame)

啦啦啦=1
print_lua(啦啦啦)
	self.menubar=wx.wxMenuBar() --菜单栏
  self.frame=frame
  self.ID={}
	local menubar=self.menubar
  
	local fileMenu = wx.wxMenu()
    self:Add(fileMenu,"打开(&O)","openfile")
    self:Add(fileMenu,"YUNGXIN","run")
  local helpMenu = wx.wxMenu()
    self:Add(helpMenu,"帮助(&H)","help")
    menubar:Append(fileMenu, "&File")
    menubar:Append(helpMenu, "&Help")


end)

function Menu:Add(menu,name,eventname,str)
  --增加菜单项
  local id=ID:New()
  self.ID[name]=id
  menu:Append(id, name, str or "")
  self.frame:Connect(id, wx.wxEVT_COMMAND_MENU_SELECTED,
      eventfn[eventname] or function (event) end)

end

return Meun

