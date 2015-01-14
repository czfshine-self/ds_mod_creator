local MyOwnComponent = Class(function(self, inst)
    self.inst = inst
    print "I've initialized my own component!"
end)

return MyOwnComponent
