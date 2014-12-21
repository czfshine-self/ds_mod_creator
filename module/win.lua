require("module.class")
Aui=require("module.aui")

MainWin = Class(wxFrame,function(self,parent,id,title,pos,size,style,name)
	parent=parent or wx.NULL
	id=id or wx.wxID_ANY
	title=title or strings.view.DefaultTitle
	pos=pos or wx.wxDefaultPosition
	size=size or wx.wxDefaultSize
	style= style or wx.wxDEFAULT_FRAME_STYLE
	name =name or ""


	self.frame=wx.wxFrame(parent,id,title,pos,size,style,name)
	local frame=self.frame
  
  local xpmdata =
{
    "16 16 5 1",
    "  c None",
    "a c Black",
    "b c #FFFFFF",
    "c c #808080",
    "d c #9DBDCD",
    "  aaaaaaaaaaaa  ",
    "  addddddddddac ",
    "  adaaaaaaaadac ",
    "  adabbbbbbadac ",
    "  adabbbbbbadac ",
    "  adaaaaaaaadac ",
    "  addddddddddac ",
    "  adaadaadaadac ",
    "  adaadaadaadac ",
    "  addddddddddac ",
    "  adaadaadaadac ",
    "  adaadaadaadac ",
    "  addddddddddac ",
    "  aaaaaaaaaaaac ",
    "  ccccccccccccc ",
    "  aaaaaaaaaaaac "
}
  
  --frame:SetCursor(wxCursor( 1,wxImage(wx.wxBitmap(xpmdata))))
  frame:SetCursor(wxCursor(2))
  
  im=wxImage(wx.wxBitmap(xpmdata))
  im:SaveFile("1.png")
	aui=Aui(frame)


end)

return MainWin
