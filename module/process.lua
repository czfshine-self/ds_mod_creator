require "module.class"
--[[
Process=Class(function (self,frame,cmdmod)
      
  end)

function Process:Run(cmd,sync)
    self.process =wxProcess()
    if cmdmod then 
  self.process:Redirect()
  end

  self.process:Connect(wx.wxEVT_END_PROCESS,function (event) 

      self.process=nil 
      print_lua("kill",event:GetPid())
      
      end)
  
  
  local pid = wx.wxExecute(cmd,sync,self.process)
  
  if pid == -1 then
      print_lua("Unknown ERROR Running program!\n", true)
    else
      print_lua("Process id is: "..tostring(pid).."\n", true)
  end
    
  end
  ]]
  return Process