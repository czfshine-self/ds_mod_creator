--wxaui one
--new  two text into aui
--by:czfshine
--time:2014-12-8 19:14

package.cpath = package.cpath..";./?.dll;./?.so;../lib/?.so;../lib/vc_dll/?.dll;../lib/bcc_dll/?.dll;../lib/mingw_dll/?.dll;"
require("wx")
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
	image={x=32,y=32},
	imagelist={
		["lua"]=wx.wxBitmap(sample_xpm),
		["wlua"]=wx.wxBitmap(sample_xpm),
		}
	}
}


frame=wx.wxFrame(wx.NULL,
                        wx.wxID_ANY,
                        "wxAUI Sample Application",
                        wx.wxDefaultPosition,
                        wx.wxSize(800, 600));
frame:SetMinSize(wx.wxSize(400,300));
bitmap = wx.wxBitmap(sample_xpm)
ps=wx.wxSplashScreen(bitmap,
          wx.wxSPLASH_CENTRE_ON_SCREEN+wx.wxSPLASH_TIMEOUT,
          6000, wx.NULL, -1, wx.wxDefaultPosition, wx.wxDefaultSize,
          wx.wxSIMPLE_BORDER+wx.wxSTAY_ON_TOP)

m_mgr = wxaui.wxAuiManager()
m_mgr:SetManagedWindow(frame);

text1=wx.wxTextCtrl(frame, -1,"text1")
--text2=wx.wxTextCtrl(frame, -1,"text2")

require "wxtree"
--tree=NewTree(frame,data)

api1=wxaui.wxAuiPaneInfo()
api1:Name("test7")
api1:Caption("Client Size Reporter")
api1:Left()
api1:Layer(1)
api1:CloseButton(true)
api1:MaximizeButton(true)
--[[<=>
api1= wxaui.wxAuiPaneInfo():
                  Name("test7"):Caption("Client Size Reporter"):
                  Left():Layer(1):
                  CloseButton(true):MaximizeButton(true)]]


m_mgr:AddPane(text1,api1)
tree=wxaui.wxAuiNotebook(frame,wx.wxID_ANY)

m_mgr:AddPane(tree, wxaui.wxAuiPaneInfo():
                  Name("test7"):Caption("Client Size Reporter"):
                  Left():Layer(2):
                  CloseButton(true):MaximizeButton(true));


m_mgr:Update() --is require

frame:Show()
wx.wxGetApp():MainLoop()
