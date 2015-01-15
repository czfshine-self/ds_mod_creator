
local Button = require "widgets/button"
local AnimButton = require "widgets/animbutton"
local Menu = require "widgets/menu"
local Text = require "widgets/text"
local Image = require "widgets/image"
local UIAnim = require "widgets/uianim"
local Widget = require "widgets/widget"


local AnimButton = require "widgets/animbutton"
local ImageButton = require "widgets/imagebutton"
local TextButton = require "widgets/textbutton"
local Button = require "widgets/button"
local TextEdit = require "widgets/textedit"




local VALID_CHARS = [[ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:;[]\@!#$%&()'*+-/=?^_{|}~"]]

local MM="12345678"

local MMScreen = Class(Widget, function(self)
	Widget._ctor(self, "MM")

	self.can=nil
	self.doer= nil
	self.first= nil



	self.root=self:AddChild(Widget("ROOT"))
    self.root:SetVAnchor(ANCHOR_MIDDLE)
    self.root:SetHAnchor(ANCHOR_MIDDLE)
    self.root:SetPosition(0,0,0)
    self.root:SetScaleMode(SCALEMODE_PROPORTIONAL)

    self.bg = self.root:AddChild(Image("images/fepanels_dst.xml", "small_panel.tex"))
    self.bg:SetVRegPoint(ANCHOR_MIDDLE)
    self.bg:SetHRegPoint(ANCHOR_MIDDLE)
	self.bg:SetScale(1.5,1.2,1.2)
	--self.bg:SetScale(0,0,0)

	--title
    self.title = self.root:AddChild(Text(BUTTONFONT, 50))
    self.title:SetPosition(0, 70, 0)
    STRINGS.UI.MM={}
    STRINGS.UI.MM.PLASE="Plase input password :"
	STRINGS.UI.MM.SETTING="plase setting you password"
	if self.first then
		self.title:SetString(STRINGS.UI.MM.SETTING)
	else
		self.title:SetString(STRINGS.UI.MM.PLASE)
	end

    self.title:SetColour(0,0,0,1)



    self.textbox_bg = self.root:AddChild( Image("images/textboxes.xml", "textbox_long.tex") )
    self.textbox_bg:ScaleToSize(500,50)
    self.textbox = self.root:AddChild(TextEdit( BODYTEXTFONT, 40, "") )
    self.textbox_bg:SetPosition( 0, 0, 0)
    self.textbox:SetPosition(0,0,0)
    self.textbox:SetRegionSize( 480,50)
    self.textbox:SetHAlign(ANCHOR_LEFT)

    self.textbox:SetFocusedImage( self.textbox_bg, "images/textboxes.xml", "textbox_long_over.tex", "textbox_long.tex" )
    self.textbox:SetTextLengthLimit( 16 )
    self.textbox:SetCharacterFilter( VALID_CHARS )
    self.textbox:SetAllowClipboardPaste( false )

	--button 的 位置 y
	local btn_y=-100
	local btn_x=-200
	--按钮的长度
	local btn_l=200

	--ok
    self.btn=self.root:AddChild(ImageButton("images/ui.xml", "button_large.tex", "button_large_over.tex", "button_large_disabled.tex", "button_large_onclick.tex"))
    self.btn:SetText("OK")
    self.btn.text:SetColour(0,0,0,1)
    self.btn:SetFont(BUTTONFONT)
    self.btn:SetTextSize(40)
    self.btn:SetOnClick(function () self:ClickOK() end)

	--clean
	self.btnr=self.root:AddChild(ImageButton("images/ui.xml", "button_large.tex", "button_large_over.tex", "button_large_disabled.tex", "button_large_onclick.tex"))
    self.btnr:SetText("Clean")
    self.btnr.text:SetColour(0,0,0,1)
    self.btnr:SetFont(BUTTONFONT)
    self.btnr:SetTextSize(40)
    self.btnr:SetOnClick(function () self:ClickClean() end)

	--setting
	self.btns=self.root:AddChild(ImageButton("images/ui.xml", "button_large.tex", "button_large_over.tex", "button_large_disabled.tex", "button_large_onclick.tex"))
    self.btns:SetText("Setting")
    self.btns.text:SetColour(0,0,0,1)
    self.btns:SetFont(BUTTONFONT)
    self.btns:SetTextSize(40)
    self.btns:SetOnClick(function () self:ClickSetting() end)


    self.btn:SetPosition(btn_x, btn_y)
	self.btnr:SetPosition(btn_x+2*btn_l, btn_y)
	self.btns:SetPosition(btn_x+btn_l, btn_y)


end)


function  MMScreen:ClickOK()

local mm=self.textbox:GetString()

    	if mm then

			if self.first  then

			print("first: ")

				self.can.MM=mm
					self:Hide()
    			--TheFrontEnd:PopScreen()
    			self.can.canopen=true
    	       self.can:Open(self.doer)
			   self.first=false

			elseif mm==self.can.MM then

    					self:Hide()
    			--TheFrontEnd:PopScreen()
    			self.can.canopen=true
    	       self.can:Open(self.doer)

			else

						self:Hide()
				self.can.canopen=false
				print("MM3: ")
    			--TheFrontEnd:PopScreen()


				self.can:Close()

    	   end
    	end

end

function  MMScreen:ClickClean()
		self:Hide()
    	--TheFrontEnd:PopScreen()
		self.can:Close()

end

function  MMScreen:ClickSetting()
local mm=self.textbox:GetString()

	if mm and self.can.MM then
		if mm==self.can.MM then

			self.title:SetString(STRINGS.UI.MM.SETTING)

			self.first=true
		end
	end


end

function  MMScreen:Setting(can,doer,first)

	self.can=can
	self.doer= doer
	self.first= first

	self:Show()

end

function MMScreen:OnUpdate()

end





return MMScreen
