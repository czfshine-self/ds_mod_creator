-- Load the wxLua module
package.cpath = package.cpath..";./?.dll;./?.so;../lib/?.so;../lib/vc_dll/?.dll;../lib/bcc_dll/?.dll;../lib/mingw_dll/?.dll;"
require("wx")

local wxT = function(s) return s end
local _ = function(s) return s end

local IDCounter = nil
local function NewID()
    if not IDCounter then IDCounter = wx.wxID_HIGHEST end
    IDCounter = IDCounter + 1
    return IDCounter
end
local ID_IDCOUNTER = wx.wxID_HIGHEST + 1
function NewID()
    ID_IDCOUNTER = ID_IDCOUNTER + 1
    return ID_IDCOUNTER
end

-- File menu
local ID_NEW              = wx.wxID_NEW
local ID_OPEN             = wx.wxID_OPEN
local ID_CLOSE            = NewID()
local ID_SAVE             = wx.wxID_SAVE
local ID_SAVEAS           = wx.wxID_SAVEAS
local ID_SAVEALL          = NewID()
local ID_EXIT             = wx.wxID_EXIT
-- Edit menu
local ID_CUT              = wx.wxID_CUT
local ID_COPY             = wx.wxID_COPY
local ID_PASTE            = wx.wxID_PASTE
local ID_SELECTALL        = wx.wxID_SELECTALL
local ID_UNDO             = wx.wxID_UNDO
local ID_REDO             = wx.wxID_REDO
local ID_AUTOCOMPLETE     = NewID()
local ID_AUTOCOMPLETE_ENABLE = NewID()
local ID_COMMENT          = NewID()
local ID_FOLD             = NewID()
-- Find menu
local ID_FIND             = wx.wxID_FIND
local ID_FINDNEXT         = NewID()
local ID_FINDPREV         = NewID()
local ID_REPLACE          = NewID()
local ID_GOTOLINE         = NewID()
local ID_SORT             = NewID()
-- Debug menu
local ID_TOGGLEBREAKPOINT = NewID()
local ID_COMPILE          = NewID()
local ID_RUN              = NewID()
local ID_ATTACH_DEBUG     = NewID()
local ID_START_DEBUG      = NewID()
local ID_USECONSOLE       = NewID()

local ID_STOP_DEBUG       = NewID()
local ID_STEP             = NewID()
local ID_STEP_OVER        = NewID()
local ID_STEP_OUT         = NewID()
local ID_CONTINUE         = NewID()
local ID_BREAK            = NewID()
local ID_VIEWCALLSTACK    = NewID()
local ID_VIEWWATCHWINDOW  = NewID()
local ID_SHOWHIDEWINDOW   = NewID()
local ID_CLEAROUTPUT      = NewID()
local ID_DEBUGGER_PORT    = NewID()
-- Help menu
local ID_ABOUT            = wx.wxID_ABOUT
-- Watch window menu items
local ID_WATCH_LISTCTRL   = NewID()
local ID_ADDWATCH         = NewID()
local ID_EDITWATCH        = NewID()
local ID_REMOVEWATCH      = NewID()
local ID_EVALUATEWATCH    = NewID()


--/* XPM */
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

local MyFrame = {
    ID_CreateTree = NewID(),
    ID_CreateGrid = NewID(),
    ID_CreateText = NewID(),
    ID_CreateHTML = NewID(),
    ID_CreateNotebook = NewID(),
    ID_CreateSizeReport = NewID(),
    ID_GridContent = NewID(),
    ID_TextContent = NewID(),
    ID_TreeContent = NewID(),
    ID_HTMLContent = NewID(),
    ID_NotebookContent = NewID(),
    ID_SizeReportContent = NewID(),
    ID_CreatePerspective = NewID(),
    ID_CopyPerspectiveCode = NewID(),
    ID_AllowFloating = NewID(),
    ID_AllowActivePane = NewID(),
    ID_TransparentHint = NewID(),
    ID_VenetianBlindsHint = NewID(),
    ID_RectangleHint = NewID(),
    ID_NoHint = NewID(),
    ID_HintFade = NewID(),
    ID_NoVenetianFade = NewID(),
    ID_TransparentDrag = NewID(),
    ID_NoGradient = NewID(),
    ID_VerticalGradient = NewID(),
    ID_HorizontalGradient = NewID(),
    ID_Settings = NewID(),
    ID_NotebookNoCloseButton = NewID(),
    ID_NotebookCloseButton = NewID(),
    ID_NotebookCloseButtonAll = NewID(),
    ID_NotebookCloseButtonActive = NewID(),
    ID_NotebookAllowTabMove = NewID(),
    ID_NotebookAllowTabExternalMove = NewID(),
    ID_NotebookAllowTabSplit = NewID(),
    ID_NotebookWindowList = NewID(),
    ID_NotebookScrollButtons = NewID(),
    ID_NotebookTabFixedWidth = NewID(),
    ID_NotebookArtGloss = NewID(),
    ID_NotebookArtSimple = NewID(),
    ID_NotebookAlignTop = NewID(),
    ID_NotebookAlignBottom = NewID(),

    m_mgr = nil,
    m_perspectives = nil,
    m_perspectives_menu = nil,
    m_notebook_style = nil,
    m_notebook_theme = nil,
}
MyFrame.ID_FirstPerspective = MyFrame.ID_CreatePerspective+1000



function MyFrame:create(parent, id, title, pos, size, style)

self.this = wx.wxFrame(wx.NULL,
                        wx.wxID_ANY,
                        wxT("wxAUI Sample Application"),
                        wx.wxDefaultPosition,
                        wx.wxSize(800, 600));
    local this = self.this

    --// tell wxAuiManager to manage this frame
    self.m_mgr = wxaui.wxAuiManager()
    self.m_mgr:SetManagedWindow(this);

    --// set frame icon
    --this:SetIcon(wx.wxIcon(sample_xpm));
    local bitmap = wx.wxBitmap(sample_xpm)
    local icon = wx.wxIcon()
    icon:CopyFromBitmap(bitmap)
    this:SetIcon(icon)
    bitmap:delete()
    icon:delete()


    --// min size for the frame itself isn't completely done.
    --// see the end up wxAuiManager::Update() for the test
    --// code. For now, just hard code a frame minimum size
    this:SetMinSize(wx.wxSize(400,300));

    --// create some toolbars
    local tb1 = wx.wxToolBar(this, wx.wxID_ANY, wx.wxDefaultPosition, wx.wxDefaultSize,
                                   wx.wxTB_FLAT + wx.wxTB_NODIVIDER);
    tb1:SetToolBitmapSize(wx.wxSize(48,48));
    tb1:AddTool(101, wxT("Test"), wx.wxArtProvider.GetBitmap(wx.wxART_ERROR));
    tb1:AddSeparator();
    tb1:AddTool(102, wxT("Test"), wx.wxArtProvider.GetBitmap(wx.wxART_QUESTION));
    tb1:AddTool(103, wxT("Test"), wx.wxArtProvider.GetBitmap(wx.wxART_INFORMATION));
    tb1:AddTool(103, wxT("Test"), wx.wxArtProvider.GetBitmap(wx.wxART_WARNING));
    tb1:AddTool(103, wxT("Test"), wx.wxArtProvider.GetBitmap(wx.wxART_MISSING_IMAGE));
    tb1:Realize();
notebook = wx.wxNotebook(this, wx.wxID_ANY,
                         wx.wxDefaultPosition, wx.wxDefaultSize,
                         wx.wxCLIP_CHILDREN)
self.m_mgr:AddPane(tb1, wxaui.wxAuiPaneInfo():
                  Name(wxT("tb1")):Caption(wxT("Big Toolbar")):
                  ToolbarPane():Top():
                  LeftDockable(false):RightDockable(false));

self.m_mgr:AddPane(self:CreateTreeCtrl(), wxaui.wxAuiPaneInfo():
                  Name(wxT("test8")):Caption(wxT("Tree Pane")):
                  Left():Layer(1):Position(1):
                  CloseButton(true):MaximizeButton(true));
self.m_mgr:AddPane(self:CreateTreeCtrl(), wxaui.wxAuiPaneInfo():Name(wxT("tree_content")):
                  CenterPane():Hide());


self.m_mgr:AddPane(CreateEditor(notebook,""), wxaui.wxAuiPaneInfo():
                  Name(wxT("test8")):Caption(wxT("Tree Pane")):
                  Left():Layer(1):Position(2):
                  CloseButton(true):MaximizeButton(true));
self.m_mgr:AddPane(self:CreateTreeCtrl(), wxaui.wxAuiPaneInfo():Name(wxT("tree_content")):
                  CenterPane():Hide());


    self.m_mgr:Update();

return  self
   end
editorID         = 100
  font       = wx.wxFont(10, wx.wxFONTFAMILY_MODERN, wx.wxFONTSTYLE_NORMAL, wx.wxFONTWEIGHT_NORMAL, false, "Andale Mono")
    fontItalic = wx.wxFont(10, wx.wxFONTFAMILY_MODERN, wx.wxFONTSTYLE_ITALIC, wx.wxFONTWEIGHT_NORMAL, false, "Andale Mono")

-- Create an editor and add it to the notebook
function CreateEditor(FF,name)
    local editor = wxstc.wxStyledTextCtrl(FF, editorID,
                                          wx.wxDefaultPosition, wx.wxDefaultSize,
                                          wx.wxSUNKEN_BORDER)

    editorID = editorID + 1 -- increment so they're always unique

    editor:SetBufferedDraw(true)
    editor:StyleClearAll()

    editor:SetFont(font)
    editor:StyleSetFont(wxstc.wxSTC_STYLE_DEFAULT, font)
    for i = 0, 32 do
        editor:StyleSetFont(i, font)
    end

    editor:StyleSetForeground(0,  wx.wxColour(128, 128, 128)) -- White space
    editor:StyleSetForeground(1,  wx.wxColour(0,   127, 0))   -- Block Comment
    editor:StyleSetFont(1, fontItalic)
    --editor:StyleSetUnderline(1, false)
    editor:StyleSetForeground(2,  wx.wxColour(0,   127, 0))   -- Line Comment
    editor:StyleSetFont(2, fontItalic)                        -- Doc. Comment
    --editor:StyleSetUnderline(2, false)
    editor:StyleSetForeground(3,  wx.wxColour(127, 127, 127)) -- Number
    editor:StyleSetForeground(4,  wx.wxColour(0,   127, 127)) -- Keyword
    editor:StyleSetForeground(5,  wx.wxColour(0,   0,   127)) -- Double quoted string
    editor:StyleSetBold(5,  true)
    --editor:StyleSetUnderline(5, false)
    editor:StyleSetForeground(6,  wx.wxColour(127, 0,   127)) -- Single quoted string
    editor:StyleSetForeground(7,  wx.wxColour(127, 0,   127)) -- not used
    editor:StyleSetForeground(8,  wx.wxColour(0,   127, 127)) -- Literal strings
    editor:StyleSetForeground(9,  wx.wxColour(127, 127, 0))  -- Preprocessor
    editor:StyleSetForeground(10, wx.wxColour(0,   0,   0))   -- Operators
    --editor:StyleSetBold(10, true)
    editor:StyleSetForeground(11, wx.wxColour(0,   0,   0))   -- Identifiers
    editor:StyleSetForeground(12, wx.wxColour(0,   0,   0))   -- Unterminated strings
    editor:StyleSetBackground(12, wx.wxColour(224, 192, 224))
    editor:StyleSetBold(12, true)
    editor:StyleSetEOLFilled(12, true)

    editor:StyleSetForeground(13, wx.wxColour(0,   0,  95))   -- Keyword 2 highlighting styles
    editor:StyleSetForeground(14, wx.wxColour(0,   95, 0))    -- Keyword 3
    editor:StyleSetForeground(15, wx.wxColour(127, 0,  0))    -- Keyword 4
    editor:StyleSetForeground(16, wx.wxColour(127, 0,  95))   -- Keyword 5
    editor:StyleSetForeground(17, wx.wxColour(35,  95, 175))  -- Keyword 6
    editor:StyleSetForeground(18, wx.wxColour(0,   127, 127)) -- Keyword 7
    editor:StyleSetBackground(18, wx.wxColour(240, 255, 255)) -- Keyword 8

    editor:StyleSetForeground(19, wx.wxColour(0,   127, 127))
    editor:StyleSetBackground(19, wx.wxColour(224, 255, 255))
    editor:StyleSetForeground(20, wx.wxColour(0,   127, 127))
    editor:StyleSetBackground(20, wx.wxColour(192, 255, 255))
    editor:StyleSetForeground(21, wx.wxColour(0,   127, 127))
    editor:StyleSetBackground(21, wx.wxColour(176, 255, 255))
    editor:StyleSetForeground(22, wx.wxColour(0,   127, 127))
    editor:StyleSetBackground(22, wx.wxColour(160, 255, 255))
    editor:StyleSetForeground(23, wx.wxColour(0,   127, 127))
    editor:StyleSetBackground(23, wx.wxColour(144, 255, 255))
    editor:StyleSetForeground(24, wx.wxColour(0,   127, 127))
    editor:StyleSetBackground(24, wx.wxColour(128, 155, 255))

    editor:StyleSetForeground(32, wx.wxColour(224, 192, 224))  -- Line number
    editor:StyleSetBackground(33, wx.wxColour(192, 192, 192))  -- Brace highlight
    editor:StyleSetForeground(34, wx.wxColour(0,   0,   255))
    editor:StyleSetBold(34, true)                              -- Brace incomplete highlight
    editor:StyleSetForeground(35, wx.wxColour(255, 0,   0))
    editor:StyleSetBold(35, true)                              -- Indentation guides
    editor:StyleSetForeground(37, wx.wxColour(192, 192, 192))
    editor:StyleSetBackground(37, wx.wxColour(255, 255, 255))

    editor:SetUseTabs(false)
    editor:SetTabWidth(4)
    editor:SetIndent(4)
    editor:SetIndentationGuides(true)

    editor:SetVisiblePolicy(wxstc.wxSTC_VISIBLE_SLOP, 3)
    --editor:SetXCaretPolicy(wxstc.wxSTC_CARET_SLOP, 10)
    --editor:SetYCaretPolicy(wxstc.wxSTC_CARET_SLOP, 3)

    editor:SetMarginWidth(0, editor:TextWidth(32, "99999_")) -- line # margin

    editor:SetMarginWidth(1, 16) -- marker margin
    editor:SetMarginType(1, wxstc.wxSTC_MARGIN_SYMBOL)
    editor:SetMarginSensitive(1, true)

    editor:SetMarginWidth(2, 16) -- fold margin
    editor:SetMarginType(2, wxstc.wxSTC_MARGIN_SYMBOL)
    editor:SetMarginMask(2, wxstc.wxSTC_MASK_FOLDERS)
    editor:SetMarginSensitive(2, true)

    editor:SetFoldFlags(wxstc.wxSTC_FOLDFLAG_LINEBEFORE_CONTRACTED +
                        wxstc.wxSTC_FOLDFLAG_LINEAFTER_CONTRACTED)

    editor:SetProperty("fold", "1")
    editor:SetProperty("fold.compact", "1")
    editor:SetProperty("fold.comment", "1")

    local grey = wx.wxColour(128, 128, 128)
    editor:MarkerDefine(wxstc.wxSTC_MARKNUM_FOLDEROPEN,    wxstc.wxSTC_MARK_BOXMINUS, wx.wxWHITE, grey)
    editor:MarkerDefine(wxstc.wxSTC_MARKNUM_FOLDER,        wxstc.wxSTC_MARK_BOXPLUS,  wx.wxWHITE, grey)
    editor:MarkerDefine(wxstc.wxSTC_MARKNUM_FOLDERSUB,     wxstc.wxSTC_MARK_VLINE,    wx.wxWHITE, grey)
    editor:MarkerDefine(wxstc.wxSTC_MARKNUM_FOLDERTAIL,    wxstc.wxSTC_MARK_LCORNER,  wx.wxWHITE, grey)
    editor:MarkerDefine(wxstc.wxSTC_MARKNUM_FOLDEREND,     wxstc.wxSTC_MARK_BOXPLUSCONNECTED,  wx.wxWHITE, grey)
    editor:MarkerDefine(wxstc.wxSTC_MARKNUM_FOLDEROPENMID, wxstc.wxSTC_MARK_BOXMINUSCONNECTED, wx.wxWHITE, grey)
    editor:MarkerDefine(wxstc.wxSTC_MARKNUM_FOLDERMIDTAIL, wxstc.wxSTC_MARK_TCORNER,  wx.wxWHITE, grey)
    grey:delete()

    editor:Connect(wxstc.wxEVT_STC_MARGINCLICK,
            function (event)
                local line = editor:LineFromPosition(event:GetPosition())
                local margin = event:GetMargin()
                if margin == 1 then
                    ToggleDebugMarker(editor, line)
                elseif margin == 2 then
                    if wx.wxGetKeyState(wx.WXK_SHIFT) and wx.wxGetKeyState(wx.WXK_CONTROL) then
                        FoldSome()
                    else
                        local level = editor:GetFoldLevel(line)
                        if HasBit(level, wxstc.wxSTC_FOLDLEVELHEADERFLAG) then
                            editor:ToggleFold(line)
                        end
                    end
                end
            end)

    editor:Connect(wxstc.wxEVT_STC_CHARADDED,
            function (event)
                -- auto-indent
                local ch = event:GetKey()
                if (ch == char_CR) or (ch == char_LF) then
                    local pos = editor:GetCurrentPos()
                    local line = editor:LineFromPosition(pos)

                    if (line > 0) and (editor:LineLength(line) == 0) then
                        local indent = editor:GetLineIndentation(line - 1)
                        if indent > 0 then
                            editor:SetLineIndentation(line, indent)
                            editor:GotoPos(pos + indent)
                        end
                    end
                elseif autoCompleteEnable then -- code completion prompt
                    local pos = editor:GetCurrentPos()
                    local start_pos = editor:WordStartPosition(pos, true)
                    -- must have "wx.X" otherwise too many items
                    if (pos - start_pos > 0) and (start_pos > 2) then
                        local range = editor:GetTextRange(start_pos-3, start_pos)
                        if range == "wx." then
                            local commandEvent = wx.wxCommandEvent(wx.wxEVT_COMMAND_MENU_SELECTED,
                                                                   ID_AUTOCOMPLETE)
                            wx.wxPostEvent(frame, commandEvent)
                        end
                    end
                end
            end)

    editor:Connect(wxstc.wxEVT_STC_USERLISTSELECTION,
            function (event)
                local pos = editor:GetCurrentPos()
                local start_pos = editor:WordStartPosition(pos, true)
                editor:SetSelection(start_pos, pos)
                editor:ReplaceSelection(event:GetText())
            end)

    editor:Connect(wxstc.wxEVT_STC_SAVEPOINTREACHED,
            function (event)
                SetDocumentModified(editor:GetId(), false)
            end)

    editor:Connect(wxstc.wxEVT_STC_SAVEPOINTLEFT,
            function (event)
                SetDocumentModified(editor:GetId(), true)
            end)

    editor:Connect(wxstc.wxEVT_STC_UPDATEUI,
            function (event)
                UpdateStatusText(editor)
            end)

    editor:Connect(wx.wxEVT_SET_FOCUS,
            function (event)
                event:Skip()
                if in_evt_focus or exitingProgram then return end
                in_evt_focus = true
                IsFileAlteredOnDisk(editor)
                in_evt_focus = false
            end)

    if notebook:AddPage(editor, name, true) then
        local id            = editor:GetId()
        local document      = {}
        document.editor     = editor
        document.index      = notebook:GetSelection()
        document.fileName   = nil
        document.filePath   = nil
        document.modTime    = nil
        document.isModified = false
    end

    return editor
end


function MyFrame:CreateTreeCtrl()
    local this = self.this
    local tree = wx.wxTreeCtrl(this, wx.wxID_ANY,
                                      wx.wxPoint(0,0), wx.wxSize(160,250),
                                      wx.wxTR_DEFAULT_STYLE + wx.wxNO_BORDER);

    local imglist = wx.wxImageList(16, 16, true, 2);
    imglist:Add(wx.wxArtProvider.GetBitmap(wx.wxART_FOLDER, wx.wxART_OTHER, wx.wxSize(16,16)));
    imglist:Add(wx.wxArtProvider.GetBitmap(wx.wxART_NORMAL_FILE, wx.wxART_OTHER, wx.wxSize(16,16)));
    tree:AssignImageList(imglist);

    local root = tree:AddRoot(wxT("wxAUI Project"), 0);

    local items = {} --local items = wx.wxArrayTreeItemIds();

    items[#items+1] = tree:AppendItem(root, wxT("Item 1"), 0); --items:Add(tree:AppendItem(root, wxT("Item 1"), 0));
    items[#items+1] = tree:AppendItem(root, wxT("Item 2"), 0); --items:Add(tree:AppendItem(root, wxT("Item 2"), 0));
    items[#items+1] = tree:AppendItem(root, wxT("Item 3"), 0); --items:Add(tree:AppendItem(root, wxT("Item 3"), 0));
    items[#items+1] = tree:AppendItem(root, wxT("Item 4"), 0); --items:Add(tree:AppendItem(root, wxT("Item 4"), 0));
    items[#items+1] = tree:AppendItem(root, wxT("Item 5"), 0); --items:Add(tree:AppendItem(root, wxT("Item 5"), 0));

    local i, count;
    count = #items --items:Count()
    for i = 1, count do --for i = 0, count-1 do
        local id = items[i]; --local id = items:Item(i);
        tree:AppendItem(id, wxT("Subitem 1"), 1);
        tree:AppendItem(id, wxT("Subitem 2"), 1);
        tree:AppendItem(id, wxT("Subitem 3"), 1);
        tree:AppendItem(id, wxT("Subitem 4"), 1);
        tree:AppendItem(id, wxT("Subitem 5"), 1);
    end


    tree:Expand(root);

    return tree;
end

MyApp={}
function MyApp:OnInit()
    local myframe = MyFrame:create()
    local frame = myframe.this
    wx.wxGetApp():SetTopWindow(frame);
    frame:Show();
    return true;
end
MyApp:OnInit()
wx.wxGetApp():MainLoop()











