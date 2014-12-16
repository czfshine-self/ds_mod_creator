api={}

function addapi(name,fn)
  api[name]={}
  api[name].new=fn
end

addapi("Editbook",function (self)
  self.api=wxaui.wxAuiPaneInfo()
  self.api:Name("test")
  self.api:Caption("Client Size Reporter")
  self.api:Right()
  self.api:Layer(2)
  self.api:CloseButton(true)
  self.api:MaximizeButton(true)
  self.api:CaptionVisible (false)
  self.api:Center()
  return self.api
end)



addapi("Tree",function(self)
    self.api=wxaui.wxAuiPaneInfo()
	self.api:Name("test7")
	self.api:Caption("Client Size Reporter")
	self.api:Left()
	self.api:Layer(1)
	self.api:BestSize(200,200)

return self.api
end)

addapi("Text",function (self)
  self.api=wxaui.wxAuiPaneInfo()
  self.api:Name("")
  self.api:Caption("")
  self.api:Right()
  self.api:Layer(3)
  self.api:CaptionVisible (false)
  self.api:Bottom()
  self.api:BestSize(200,200)
  return self.api
end)
addapi("Run",function (self)
  self.api=wxaui.wxAuiPaneInfo()
  self.api:Name("")
  self.api:Caption("")
  self.api:Left()
  self.api:Layer(3)
  self.api:CaptionVisible (false)
  self.api:Bottom()
  self.api:BestSize(200,200)
  return self.api
end)
