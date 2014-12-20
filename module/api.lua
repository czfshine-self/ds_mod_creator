api={}

function addapi(name,fn)
  api[name]={}
  api[name].new=fn
end

addapi("Editbook",function (self)
  self.api=wxaui.wxAuiPaneInfo():
    Name("test"):
    Caption("Client Size Reporter"):
    Right():
    Layer(2):
    CloseButton(true):
    MaximizeButton(true):
    CaptionVisible (false):
    Center()
  return self.api
end)



addapi("Tree",function(self)
    self.api=wxaui.wxAuiPaneInfo():
      Name("test7"):
      Caption("Client Size Reporter"):
      Left():
      Layer(1):
      BestSize(200,200)

return self.api
end)
addapi("Grid",function(self)
    self.api=wxaui.wxAuiPaneInfo():
      Name("test7"):
      Caption("Client Size Reporter"):
      Right():
      Layer(1):
      BestSize(200,200)

return self.api
end)


addapi("Text",function (self)
  self.api=wxaui.wxAuiPaneInfo():
    Name(""):
    Caption(""):
    Right():
    Layer(3):
    CaptionVisible (false):
    Bottom():
    BestSize(200,200)
  return self.api
end)
addapi("Run",function (self)
  self.api=wxaui.wxAuiPaneInfo():
    Name(""):
    Caption(""):
    Left():
    Layer(3):
    CaptionVisible (false):
  --self.api:PaneBorder(true)
    Movable(false):
    Bottom():
    --PinButton(true):
    BestSize(200,200)
  return self.api
end)
