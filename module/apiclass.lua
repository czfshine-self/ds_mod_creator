require("module.class")

local API=Class(function (self)
    self.api==wxaui.wxAuiPaneInfo()
    
    
    
  end)

function API:我的名字是(name)
  self.api:Name(name)
  return self
end

function API:标题是什么好呢(tilte)
  self.api:Caption(tilte)
  return self
end

function API:我要在右边()
  self.api:Right()
  return self
end
function API:第几层(num)
  self.api:Layer(num)
  return self
end

function API:关闭按钮这么丑我才不要呢(b)
  self.api:CloseButton(b)
  return self
end
function API:最大化这个东东很好呀(b)
  self.api:MaximizeButton(b)
  return self
end
function API:标题栏被我吃了(b)
  self.api:CaptionVisible (b)
  return self
end
function API:我要在中间嘛()
  self.api:Center()
  return self
end

function API:左边这个位置风水好()
  self.api:Left()
  return self
endfunction API:最小只能这么小哦(x,y)
  self.api:BestSize(x,y)
  return self
endfunction API:我要在中间嘛()
  self.api:Center()
  return self
endfunction API:我要在中间嘛()
  self.api:Center()
  return self
end
return API