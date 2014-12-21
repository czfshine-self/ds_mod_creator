require("module.class")
require "module.wxtree"
require "module.editor"
require "module.text"
require "module.api"
require "module.run"
require "module.grid"
Aui=Class(function (self,frame)

	self.m_mgr = wxaui.wxAuiManager()
  self.m_mgr:SetManagedWindow(frame)
  self.frame=frame
  
  self:Add(Tree,"Tree","notebook")
  self:Add(Editor,"Editbook","notebook")
  self:Add(Text,"Text","notebook")
  self:Add(Run,"Run","notebook")
  self:Add(Grid,"Grid","notebook")
		--=================!!!!
  self.m_mgr:Update()--is require
		--===================
  

end)
function Aui:Add(Class,name,child)
  self[name]=Class(self.frame)
  if api[name] then 
    self.m_mgr:AddPane(self[name][child],api[name]:new())
  else
    self.m_mgr:AddPane(self[name][child],self[name].api)
  end
end

return Aui
