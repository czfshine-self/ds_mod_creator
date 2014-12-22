package.cpath = package.cpath..";./?.dll;./?.so;../lib/?.so;../lib/vc_dll/?.dll;../lib/bcc_dll/?.dll;../lib/mingw_dll/?.dll;"



require("wx")




function openfile(path)
  local f = io.open(path,"rb");
  return f
end



function filetogrid(filep)
  local maxrow=8
  s=""
  file=io.open("1","rb")
  local row,col=0,0
  s=file:read(1)
  while s do


    grid:SetCellValue(row, col,string.format( "%x" , string.byte(s) ))
    if row ==maxrow  then
      col=col+1
      row=0
    else
      row=row+1
    end
	s=file:read(1)
  end
end









frame = wx.wxFrame(wx.NULL, wx.wxID_ANY, "wxLua wxGrid Sample",
                         wx.wxPoint(25, 25), wx.wxSize(350, 250))



grid = wx.wxGrid(frame, wx.wxID_ANY)

grid:CreateGrid(10, 8)
grid:SetColSize(3, 200)
grid:SetRowSize(4, 45)
grid:SetCellValue(0, 0, "First cell")
grid:SetCellValue(1, 1, "Another cell")
grid:SetCellValue(2, 2, "Yet another cell")
grid:SetCellFont(0, 0, wx.wxFont(10, wx.wxROMAN, wx.wxITALIC, wx.wxNORMAL))
grid:SetCellTextColour(1, 1, wx.wxRED)
grid:SetCellBackgroundColour(2, 2, wx.wxCYAN)

filetogrid("1")

frame:Show(true)
wx.wxGetApp():MainLoop()
