require "module.class"


ID=Calss(function(self)
	local self.COUNTER = wxID_HIGHEST + 1

end)



ID:New=function (self)
	self.COUNTER = self.COUNTER + 1
	return self.COUNTER
end

return
