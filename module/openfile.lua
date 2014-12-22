require "module.class"

OpenFileDialog=Class(function (self,frame)
    self.fileDialog = wx.wxFileDialog(frame,
                                       "Open Lua file",
                                       "",
                                       "",
                                       "lua file (*.lua)|*.lua|All files(*)|*",
                                       wx.wxFD_OPEN + wx.wxFD_FILE_MUST_EXIST)
    self.result = false
    if self.fileDialog:ShowModal() == wx.wxID_OK then
        self.fileName = self.fileDialog:GetPath()
        frame:SetTitle("饥荒mod平台" .. self.fileName)
    end
    if fileDialog then
      fileDialog:Destroy()
    end
  
end)

