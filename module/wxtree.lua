require("module.class")


Tree=Class(function(self,frame,data)



  self.notebook= wxaui.wxAuiNotebook(frame, wx.wxID_ANY,wx.wxDefaultPosition, wx.wxDefaultSize,
    wxaui.wxAUI_NB_BOTTOM+wxaui.wxAUI_NB_TAB_SPLIT+wxaui.wxAUI_NB_TAB_MOVE+wxaui.wxAUI_NB_TAB_EXTERNAL_MOVE)
	 self.tree = wx.wxTreeCtrl( self.notebook, wx.wxID_ANY,
                          wx.wxDefaultPosition, wx.wxSize(-1, 200),
                          wx.wxTR_LINES_AT_ROOT + wx.wxTR_HAS_BUTTONS )
	local tree=self.tree
  self.notebook:AddPage(self.tree,"..")
  

	

	local root_id = tree:AddRoot( "Root" )
	local parent_id = tree:AppendItem( root_id, "Parent " )
	local child_id = tree:AppendItem( parent_id, "Child " )
	--local imagelist=wx.wxImageList(32,32)
	--local bitmap = wx.wxBitmap(sample_xpm)
	--imagelist:Add(bitmap) --index is 0 no 1
	--tree:AssignImageList(imagelist)
	--tree:SetItemImage(root_id,0,wx.wxTreeItemIcon_Normal)
	--tree:SetItemTextColour(root_id,wx.wxColour("0xFF0000"))
	--tree:SetItemBackgroundColour(root_id,wx.wxColour("0xFF0000"))
	tree:SetIndent(32)
	tree:SetItemDropHighlight(root_id,true)
	local child_id2=tree:PrependItem ( root_id,"string",0)

end)
return Tree
