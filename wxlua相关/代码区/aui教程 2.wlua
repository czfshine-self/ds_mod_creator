--wxaui two
--new  two text into aui
--by:czfshine
--time:2014-12-8 19:14

package.cpath = package.cpath..";./?.dll;./?.wxlua;./?.so;../lib/?.so;../lib/vc_dll/?.dll;../lib/bcc_dll/?.dll;../lib/mingw_dll/?.dll;"
require("wx")

frame=wx.wxFrame(wx.NULL,
                        wx.wxID_ANY,
                        "wxAUI Sample Application",
                        wx.wxDefaultPosition,
                        wx.wxSize(800, 600));
frame:SetMinSize(wx.wxSize(400,300));


m_mgr = wxaui.wxAuiManager()
m_mgr:SetManagedWindow(frame);

text1=wx.wxTextCtrl(frame, -1,"text1")
--text2=wx.wxTextCtrl(frame, -1,"text2")


require("editor")
api1=wxaui.wxAuiPaneInfo()
api1:Name("test7")
api1:Caption("Client Size Reporter")
api1:Right()

api1:FloatingSize(100,100)
api1:Layer(1)
api1:CloseButton(false) --is require
api1:MaximizeButton(true)
--[[<=>
api1= wxaui.wxAuiPaneInfo():
                  Name("test7"):Caption("Client Size Reporter"):
                  Left():Layer(1):
                  CloseButton(false):MaximizeButton(true)]]


m_mgr:AddPane(text1,api1)
m_mgr:AddPane(newf(frame), wxaui.wxAuiPaneInfo():
                  Name("test7"):Caption("Client Size Reporter"):
                  Left():Layer(2):
                  CloseButton(true):MaximizeButton(true));


m_mgr:Update() --is require

frame:Show()
wx.wxGetApp():MainLoop()
