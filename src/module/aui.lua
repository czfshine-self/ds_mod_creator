require("module.class")
require"module.wxtree"


Aui=Class(function (self,frame)

	self.m_mgr = wxaui.wxAuiManager()
    self.m_mgr:SetManagedWindow(frame)




end)

Aui.API={
["default"]=0
}



return Aui
