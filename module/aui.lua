require("module.class")
Tree=require "module.wxtree"


Aui=Class(function (self,frame)

	self.m_mgr = wxaui.wxAuiManager()
    	self.m_mgr:SetManagedWindow(frame)
    	self.tree=Tree(frame)
    	self.m_mgr:AddPane(self.tree.tree,self.tree.api)




end)

Aui.API={
["default"]=0
}



return Aui
