-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\buydrink\panel_buydrink.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
Panel_BuyDrink:SetShow(false)
Panel_BuyDrink:setMaskingChild(true)
Panel_BuyDrink:ActiveMouseEventEffect(true)
Panel_BuyDrink:setGlassBackground(true)
Panel_BuyDrink:RegisterShowEventFunc(true, "BuyDrinkShowAni()")
Panel_BuyDrink:RegisterShowEventFunc(false, "BuyDrinkHideAni()")
BuyDrinkShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Down)(Panel_BuyDrink)
  audioPostEvent_SystemUi(1, 0)
end

BuyDrinkHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV
  Panel_BuyDrink:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_BuyDrink:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor((Defines.Color).C_FFFFFFFF)
  aniInfo1:SetEndColor((Defines.Color).C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(1, 1)
end

local ui = {_frameScroll, _frameContent, _txt_Desc; _btn_WinClose = (UI.getChildControl)(Panel_BuyDrink, "Button_Close"), _btn_Close = (UI.getChildControl)(Panel_BuyDrink, "Button_CloseWindow"), _buttonQuestion = (UI.getChildControl)(Panel_BuyDrink, "Button_Question"), _titleImage = (UI.getChildControl)(Panel_BuyDrink, "StaticText_TitleImage"), _descBG = (UI.getChildControl)(Panel_BuyDrink, "Static_DescBG"), _frameBuyDrink = (UI.getChildControl)(Panel_BuyDrink, "Frame_BuyDrink"), _txt_FindWay = (UI.getChildControl)(Panel_BuyDrink, "StaticText_FindWay_Title"), _base_Way = (UI.getChildControl)(Panel_BuyDrink, "Button_C_WayPoint")}
local findWay_StartY = 0
local findWayBtn_StartY = 0
local getBottom = 0
local test_Category = 2
local knowledgeCount = 6
local totalPanelSizeY = 0
local GetBottomPos = function(control)
  -- function num : 0_2
  if control == nil then
    (UI.ASSERT)(false, "GetBottomPos(control) , control nil")
    return 
  end
  return control:GetPosY() + control:GetSizeY()
end

Panel_BuyDrink_Initialize = function()
  -- function num : 0_3 , upvalues : ui
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  ui._frameScroll = (UI.getChildControl)(ui._frameBuyDrink, "VerticalScroll")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  ui._frameContent = (UI.getChildControl)(ui._frameBuyDrink, "Frame_1_Content")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  ui._txt_Desc = (UI.getChildControl)(ui._frameContent, "StaticText_Desc")
  ;
  (ui._frameScroll):SetControlPos(0)
  ;
  (ui._btn_WinClose):addInputEvent("Mouse_LUp", "Panel_BuyDrink_ShowToggle()")
  ;
  (ui._btn_Close):addInputEvent("Mouse_LUp", "Panel_BuyDrink_ShowToggle()")
  ;
  (ui._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelBuyDrink\" )")
  ;
  (ui._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelBuyDrink\", \"true\")")
  ;
  (ui._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelBuyDrink\", \"false\")")
  Panel_BuyDrink_UpdateFunc()
  ;
  (ui._frameBuyDrink):UpdateContentScroll()
end

Panel_BuyDrink_UpdateFunc = function(message)
  -- function num : 0_4 , upvalues : ui, test_Category, UI_TM, getBottom, GetBottomPos, findWay_StartY, findWayBtn_StartY, knowledgeCount, UI_PUCT, totalPanelSizeY
  local msg = message
  if msg == nil then
    msg = ""
  end
  ;
  (ui._btn_Close):SetShow(true)
  ;
  (ui._txt_FindWay):SetShow(false)
  ;
  (ui._base_Way):SetShow(false)
  if test_Category == 0 then
    (ui._titleImage):ChangeTextureInfoName("new_ui_common_forlua/window/buydrink/buydrink_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(ui._titleImage, 1, 145, 347, 180)
    ;
    ((ui._titleImage):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (ui._titleImage):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BUYDRINK_TITLE_TIP"))
    ;
    (ui._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (ui._txt_Desc):SetAutoResize(true)
    ;
    (ui._txt_Desc):SetText("TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP TIP ")
    ;
    (ui._txt_Desc):SetSize((ui._txt_Desc):GetSizeX(), (ui._txt_Desc):GetSizeY())
    ;
    (ui._descBG):SetSize((ui._descBG):GetSizeX(), (ui._txt_Desc):GetSizeY() + 10)
    getBottom = GetBottomPos(ui._descBG) + 10
    ;
    (ui._btn_Close):SetShow(true)
    ;
    (ui._btn_Close):SetPosY(getBottom)
    getBottom = GetBottomPos(ui._btn_Close) + 7
    Panel_BuyDrink:SetSize(Panel_BuyDrink:GetSizeX(), getBottom)
  else
    do
      if test_Category == 1 then
        (ui._titleImage):ChangeTextureInfoName("new_ui_common_forlua/window/buydrink/buydrink_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(ui._titleImage, 1, 37, 347, 72)
        ;
        ((ui._titleImage):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (ui._titleImage):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BUYDRINK_TITLE_RUMOR"))
        ;
        (ui._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
        ;
        (ui._txt_Desc):SetAutoResize(true)
        ;
        (ui._txt_Desc):SetText("자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와자와")
        ;
        (ui._txt_Desc):SetSize((ui._txt_Desc):GetSizeX(), (ui._txt_Desc):GetSizeY())
        ;
        (ui._descBG):SetSize((ui._descBG):GetSizeX(), (ui._txt_Desc):GetSizeY() + 10)
        getBottom = GetBottomPos(ui._descBG) + 10
        ;
        (ui._btn_Close):SetShow(true)
        ;
        (ui._btn_Close):SetPosY(getBottom)
        getBottom = GetBottomPos(ui._btn_Close) + 7
        Panel_BuyDrink:SetSize(Panel_BuyDrink:GetSizeX(), getBottom)
      else
        do
          if test_Category == 2 then
            (ui._titleImage):ChangeTextureInfoName("new_ui_common_forlua/window/buydrink/buydrink_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(ui._titleImage, 1, 73, 347, 108)
            ;
            ((ui._titleImage):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (ui._titleImage):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BUYDRINK_TITLE_KNOWLEDGE"))
            ;
            (ui._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
            ;
            (ui._txt_Desc):SetAutoResize(true)
            ;
            (ui._txt_Desc):SetText(msg)
            if (ui._txt_Desc):GetSizeY() > 110 then
              (ui._frameScroll):SetShow(true)
            else
              ;
              (ui._frameScroll):SetShow(false)
            end
            ;
            (ui._frameScroll):SetControlPos(0)
            ;
            (ui._frameContent):SetSize((ui._frameContent):GetSizeX(), (ui._txt_Desc):GetSizeY())
            ;
            (ui._btn_Close):SetShow(true)
          else
            do
              if test_Category == 3 then
                (ui._titleImage):ChangeTextureInfoName("new_ui_common_forlua/window/buydrink/buydrink_00.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(ui._titleImage, 1, 1, 347, 36)
                ;
                ((ui._titleImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (ui._titleImage):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BUYDRINK_TITLE_LOCATION"))
                ;
                (ui._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
                ;
                (ui._txt_Desc):SetAutoResize(true)
                ;
                (ui._txt_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BUYDRINK_TITLE_LOCATION_DESC"))
                ;
                (ui._txt_Desc):SetSize((ui._txt_Desc):GetSizeX(), (ui._txt_Desc):GetSizeY())
                ;
                (ui._descBG):SetSize((ui._descBG):GetSizeX(), (ui._txt_Desc):GetSizeY() + 10)
                findWay_StartY = GetBottomPos(ui._descBG) + 10
                ;
                (ui._btn_Close):SetShow(false)
                ;
                (ui._txt_FindWay):SetShow(true)
                ;
                (ui._base_Way):SetShow(false)
                ;
                (ui._txt_FindWay):SetPosY(findWay_StartY)
                findWayBtn_StartY = GetBottomPos(ui._txt_FindWay) + 10
                for idx = 0, knowledgeCount - 1 do
                  local _findWayButton = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, Panel_BuyDrink, "Button_FindWay_" .. idx)
                  CopyBaseProperty(ui._base_Way, _findWayButton)
                  _findWayButton:SetPosY(findWayBtn_StartY + idx * 35)
                  _findWayButton:SetShow(true)
                  _findWayButton:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BUYDRINK_TITLE_FINDWAY"))
                  totalPanelSizeY = GetBottomPos(_findWayButton) + 15
                end
                Panel_BuyDrink:SetSize(Panel_BuyDrink:GetSizeX(), totalPanelSizeY)
              else
                do
                  if test_Category == 4 then
                    (ui._titleImage):ChangeTextureInfoName("new_ui_common_forlua/window/buydrink/buydrink_00.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(ui._titleImage, 1, 109, 347, 144)
                    ;
                    ((ui._titleImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                    ;
                    (ui._titleImage):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BUYDRINK_TITLE_PRESENT"))
                    ;
                    (ui._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
                    ;
                    (ui._txt_Desc):SetAutoResize(true)
                    ;
                    (ui._txt_Desc):SetText(msg)
                    ;
                    (ui._txt_Desc):SetSize((ui._txt_Desc):GetSizeX(), (ui._txt_Desc):GetSizeY())
                    ;
                    (ui._descBG):SetSize((ui._descBG):GetSizeX(), (ui._txt_Desc):GetSizeY() + 10)
                    getBottom = GetBottomPos(ui._descBG) + 10
                    ;
                    (ui._btn_Close):SetShow(true)
                    ;
                    (ui._btn_Close):SetPosY(getBottom)
                    getBottom = GetBottomPos(ui._btn_Close) + 7
                    Panel_BuyDrink:SetSize(Panel_BuyDrink:GetSizeX(), getBottom)
                  end
                  do
                    ;
                    (ui._titleImage):setRenderTexture((ui._titleImage):getBaseTexture())
                    ;
                    (ui._frameBuyDrink):UpdateContentScroll()
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

Panel_BuyDrink_ShowToggle = function()
  -- function num : 0_5
  local isOn = Panel_BuyDrink:IsShow()
  if isOn == true then
    Panel_BuyDrink:SetShow(false, true)
  else
    Panel_BuyDrink:SetShow(true, true)
  end
end

Panel_BuyDrink_Initialize()
registerEvent("FromClient_BuyDrinkResult", "FromClient_BuyDrinkResult")
FromClient_BuyDrinkResult = function(message)
  -- function num : 0_6
  Panel_BuyDrink:SetShow(true, true)
  Panel_BuyDrink_UpdateFunc(message)
end


