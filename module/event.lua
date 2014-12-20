eventfn= eventfn or {}

require "module.openfile"

eventfn.openfile=function (event)
  local filename=OpenFileDialog(eventfn.frame).fileName
 print_lua(filename)
end

--require "module.process"
function Run(cmd,sync,cmdmod)
    local process =wxProcess()
    if cmdmod then 
      process:Redirect()
    end
    process:Connect(wx.wxEVT_END_PROCESS,function (event) 

      process=nil 
      print_lua("kill",event:GetPid())
      
      end)
  
  local pid = wx.wxExecute(cmd,sync,process)
  
  if pid == -1 then
      print_lua("Unknown ERROR Running program!\n", true)
    else
      print_lua("Process id is: "..tostring(pid).."\n", true)
  end
    
  end
  
eventfn.run=function (event)
  
Run("wlua src\\main.lua",wx.wxEXEC_ASYNC)
end


eventfn.CloseWin=function (event)
  
  
end




