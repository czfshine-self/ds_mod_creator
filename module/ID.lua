require "module.class"


ID=Class(function(self)
	 self.COUNTER = wxID_HIGHEST + 1

end)



function ID:New ()
	self.COUNTER = self.COUNTER + 1
	return self.COUNTER
end

return ID
