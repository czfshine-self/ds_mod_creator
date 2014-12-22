local sample_xpm = {
"32 32 6 1",
"  c black",
". c navy",
"X c red",
"o c yellow",
"O c gray100",
"+ c None",
"++++++++++++++++++++++++++++++++",
"++++++++++++++++++++++++++++++++",
"++++++++++++++++++++++++++++++++",
"++++++++++++++++++++++++++++++++",
"++++++++++++++++++++++++++++++++",
"++++++++              ++++++++++",
"++++++++ ............ ++++++++++",
"++++++++ ............ ++++++++++",
"++++++++ .OO......... ++++++++++",
"++++++++ .OO......... ++++++++++",
"++++++++ .OO......... ++++++++++",
"++++++++ .OO......              ",
"++++++++ .OO...... oooooooooooo ",
"         .OO...... oooooooooooo ",
" XXXXXXX .OO...... oOOooooooooo ",
" XXXXXXX .OO...... oOOooooooooo ",
" XOOXXXX ......... oOOooooooooo ",
" XOOXXXX ......... oOOooooooooo ",
" XOOXXXX           oOOooooooooo ",
" XOOXXXXXXXXX ++++ oOOooooooooo ",
" XOOXXXXXXXXX ++++ oOOooooooooo ",
" XOOXXXXXXXXX ++++ oOOooooooooo ",
" XOOXXXXXXXXX ++++ oooooooooooo ",
" XOOXXXXXXXXX ++++ oooooooooooo ",
" XXXXXXXXXXXX ++++              ",
" XXXXXXXXXXXX ++++++++++++++++++",
"              ++++++++++++++++++",
"++++++++++++++++++++++++++++++++",
"++++++++++++++++++++++++++++++++",
"++++++++++++++++++++++++++++++++",
"++++++++++++++++++++++++++++++++",
"++++++++++++++++++++++++++++++++"
};


data={
	root={
		type="treeitem",
		name="name",
		colour={R=255,G=255,B=125},
		colourbg={R=255,G=255,B=125},
		imagename="lua",
		data="string",

		child={
			{type="treeitem",
			name="name1",
			colour={R=255,G=255,B=125},
			colourbg={R=255,G=255,B=125},
			imagename="lua",
			data="string",

			child={
				type="treeitem",
				name="name",
				colour={R=255,G=255,B=125},
				colourbg={R=255,G=255,B=125},
				imagename="lua",
				data="string"
					},
				},

			{
			type="treeitem",
			name="name2",
			colour={R=255,G=255,B=125},
			colourbg={R=255,G=255,B=125},
			imagename="lua",
			data="string",
				},

		},

		},

	image={x=32,y=32},
	imagelist={
		["lua"]=wx.wxBitmap(sample_xpm),
		["wlua"]=wx.wxBitmap(sample_xpm),
},
}


function pairsdataroot(tree,parent_id,t,data)

	local child_id2=tree:PrependItem ( parent_id,t.name..data.imagenamelist[t.imagename])

	for k,v in pairs(t.child) do
		if type(v)=="table" then
			pairsdataroot(tree,parent_id,v,data)
		end
	end
end



function data2tree(tree,data)
	if not data then
		return nil,1,"tree data is nil"
	end

	local imagelist=wx.wxImageList(data.image.x,data.image.y)

	data.imagenamelist={}
	local imgindex=0
	for k,v in pairs(data.imagelist) do
		imagelist:Add(v)
		data.imagenamelist[k]=imgindex
		imgindex=imgindex+1
	end
	tree:AssignImageList(imagelist)

	local root_id = tree:AddRoot( "Root" )

	pairsdataroot(tree,root_id,data.root,data)


end



--------------------------------

function NewTree(frame,data)

	local tree = wx.wxTreeCtrl( frame, wx.wxID_ANY,
                          wx.wxDefaultPosition, wx.wxSize(-1, 200),
                          wx.wxTR_LINES_AT_ROOT + wx.wxTR_HAS_BUTTONS )

--[[
	local root_id = tree:AddRoot( "Root" )
	local parent_id = tree:AppendItem( root_id, "Parent " )
	local child_id = tree:AppendItem( parent_id, "Child " )

	local imagelist=wx.wxImageList(32,32)
	local bitmap = wx.wxBitmap(sample_xpm)
	imagelist:Add(bitmap) --index is 0 no 1
	tree:AssignImageList(imagelist)
	tree:SetItemImage(root_id,0,wx.wxTreeItemIcon_Normal)
	tree:SetItemTextColour(root_id,wx.wxColour("0xFF0000"))
	tree:SetItemBackgroundColour(root_id,wx.wxColour("0xFF0000"))
	tree:SetIndent(32)
	tree:SetItemDropHighlight(root_id,true)


	child_id2=tree:PrependItem ( root_id,"string",0)
	]]

	data2tree(tree,data)


	return tree
end
