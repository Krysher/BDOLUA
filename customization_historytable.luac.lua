-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\customization_historytable.luac 

-- params : ...
-- function num : 0
local customization_HistoryBG = (UI.getChildControl)(Panel_CustomizationStatic, "Static_HistoryBG")
local checkbox_Close = (UI.getChildControl)(customization_HistoryBG, "CheckButton_Close")
local Static_HistoryTableTitle = (UI.getChildControl)(customization_HistoryBG, "StaticText_Title")
local BTN_Previous = (UI.getChildControl)(customization_HistoryBG, "Button_CtrlZ")
local BTN_Next = (UI.getChildControl)(customization_HistoryBG, "Button_CtrlY")
local list2_HistoryList = (UI.getChildControl)(customization_HistoryBG, "List2_History")
local listMaxCount = 12
local selectIndex = 1
local currentactive = nil
local isHistroyTableShow = true
local selectColor = (Defines.Color).C_FFEF9C7F
local PosY = customization_HistoryBG:GetPosY()
local BGSizeY = customization_HistoryBG:GetSizeY()
HistoryTableOpen = function()
  -- function num : 0_0
  Initialize()
  registEventHandler()
end

historyTableClose = function()
  -- function num : 0_1 , upvalues : currentactive, selectIndex, isHistroyTableShow
  currentactive = nil
  selectIndex = 1
  isHistroyTableShow = false
  historyTableRePosY(false)
end

historyTableSetShow = function(flag)
  -- function num : 0_2 , upvalues : isHistroyTableShow, customization_HistoryBG, checkbox_Close, Static_HistoryTableTitle, BTN_Previous, BTN_Next, list2_HistoryList
  isHistroyTableShow = flag
  customization_HistoryBG:SetShow(flag)
  checkbox_Close:SetShow(flag)
  Static_HistoryTableTitle:SetShow(flag)
  BTN_Previous:SetShow(flag)
  BTN_Next:SetShow(flag)
  list2_HistoryList:SetShow(flag)
  HidehistoryTable()
end

historyTableGetShow = function()
  -- function num : 0_3 , upvalues : isHistroyTableShow
  return isHistroyTableShow
end

Initialize = function()
  -- function num : 0_4 , upvalues : checkbox_Close, Static_HistoryTableTitle, BTN_Previous, BTN_Next, list2_HistoryList, customization_HistoryBG
  checkbox_Close:ComputePos()
  Static_HistoryTableTitle:ComputePos()
  BTN_Previous:ComputePos()
  BTN_Next:ComputePos()
  list2_HistoryList:ComputePos()
  customization_HistoryBG:SetPosX(getScreenSizeX() - customization_HistoryBG:GetSizeX() * 2 - 30)
  customization_HistoryBG:SetPosX(getScreenSizeX() - customization_HistoryBG:GetSizeX() - 20)
  checkbox_Close:SetCheck(true)
  registEventHandler()
end

SetHistroyList = function()
  -- function num : 0_5 , upvalues : list2_HistoryList, listMaxCount, selectIndex
  local toIndex = 0
  local scrollvalue = 0
  local vscroll = list2_HistoryList:GetVScroll()
  local hscroll = list2_HistoryList:GetHScroll()
  toIndex = list2_HistoryList:getCurrenttoIndex()
  local historyCount = ToClient_getHistoryCount()
  if listMaxCount - 1 <= selectIndex and selectIndex <= toIndex + (listMaxCount - 1) then
    toIndex = selectIndex - listMaxCount + 1
    if toIndex < 0 then
      toIndex = 0
    end
  end
  ;
  (list2_HistoryList:getElementManager()):clearKey()
  local historyGroupIndex = 0
  local historyPartIndex = 0
  local pushindex = 0
  for index = 1, historyCount do
    historyGroupIndex = ToClient_getControlGroupIndex(index - 1)
    historyPartIndex = ToClient_getControlPartIndex(index - 1)
    if index - 1 == 0 and historyGroupIndex == -1 then
      pushindex = 50001
    else
      pushindex = calculateListKeyIndex(historyGroupIndex, historyPartIndex, index)
    end
    ;
    (list2_HistoryList:getElementManager()):pushKey(pushindex)
  end
  list2_HistoryList:setCurrenttoIndex(toIndex)
end

HistoryListControlCreate = function(control, key)
  -- function num : 0_6 , upvalues : selectIndex, currentactive, selectColor
  local bg = (UI.getChildControl)(control, "Static_BG")
  local active = (UI.getChildControl)(control, "Static_Active")
  local statictext = (UI.getChildControl)(control, "StaticText_Item")
  local GroupIndex = 0
  local PartIndex = 0
  local index = 0
  GroupIndex = calculateGroupPartIndex(key)
  local inputtext = calculateText(GroupIndex, PartIndex)
  statictext:SetText(inputtext)
  if index == selectIndex then
    if currentactive ~= nil then
      currentactive:SetColor((Defines.Color).C_FFFFFFFF)
    end
    active:SetColor(selectColor)
    currentactive = active
  else
    active:SetColor((Defines.Color).C_FFFFFFFF)
  end
  statictext:SetIgnore(false)
  statictext:addInputEvent("Mouse_LUp", "HistoryApply(" .. GroupIndex .. ", " .. PartIndex .. ", " .. index .. ")")
end

registEventHandler = function()
  -- function num : 0_7 , upvalues : BTN_Previous, BTN_Next, checkbox_Close, list2_HistoryList
  BTN_Previous:addInputEvent("Mouse_LUp", "customHistoryUnDo()")
  BTN_Next:addInputEvent("Mouse_LUp", "customHistoryDo()")
  checkbox_Close:addInputEvent("Mouse_LUp", "HidehistoryTable()")
  list2_HistoryList:registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "HistoryListControlCreate")
  list2_HistoryList:createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

calculateListKeyIndex = function(historyGroupIndex, historyPartIndex, index)
  -- function num : 0_8
  return (historyGroupIndex + 1) * 10000 + (historyPartIndex + 1) * 100 + index
end

calculateGroupPartIndex = function(key)
  -- function num : 0_9
  local strkey = tostring(key)
  local GroupIndex = tonumber((string.sub)(strkey, 1, 1)) - 1
  local historyPartIndex = tonumber((string.sub)(strkey, 2, 3)) - 1
  local index = tonumber((string.sub)(strkey, 4, 5))
  return GroupIndex, historyPartIndex, index
end

calculateText = function(GroupIndex, PartIndex)
  -- function num : 0_10
  local text = {}
  local classtype = (getSelfPlayer()):getClassType()
  local partcount = ToClient_HistoryUIPartCount(classtype, GroupIndex)
  if GroupIndex == 0 then
    text = PAGetString(Defines.StringSheet_RESOURCE, "UI_CUSTOMIZATION_MAIN_HAIR") .. " - "
    if PartIndex == 0 then
      text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_TYPE")
    else
      if PartIndex == 1 then
        text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_SHAPE")
      else
        if PartIndex == 2 then
          text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_COLOR")
        end
      end
    end
  else
    if GroupIndex == 1 then
      text = PAGetString(Defines.StringSheet_RESOURCE, "UI_CUSTOMIZATION_MAIN_FACE") .. " - "
      if partcount == 10 then
        if PartIndex == 0 then
          text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_FACETYPE")
        else
          if PartIndex == 1 then
            text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_SKIN")
          else
            if PartIndex == 2 then
              text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_BEARD_EYEBROW")
            else
              if PartIndex == 3 then
                text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_FACESHAPE")
              else
                if PartIndex == 4 then
                  text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_MAKEUP")
                else
                  if PartIndex == 5 then
                    text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_EYE")
                  else
                    if PartIndex == 6 then
                      text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_EYELINE")
                    else
                      if PartIndex == 7 then
                        text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_TATTOO")
                      else
                        if PartIndex == 8 then
                          text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_WRINKLE")
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      else
        if PartIndex == 0 then
          text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_FACETYPE")
        else
          if PartIndex == 1 then
            text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_SKIN")
          else
            if PartIndex == 2 then
              text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_FACESHAPE")
            else
              if PartIndex == 3 then
                text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_MAKEUP")
              else
                if PartIndex == 4 then
                  text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_EYE")
                else
                  if PartIndex == 5 then
                    text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_EYELINE")
                  else
                    if PartIndex == 6 then
                      text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_TATTOO")
                    else
                      if PartIndex == 7 then
                        text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_WRINKLE")
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    else
      if GroupIndex == 2 then
        text = PAGetString(Defines.StringSheet_RESOURCE, "UI_CUSTOMIZATION_MAIN_FORM") .. " - "
        if PartIndex == 0 then
          text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_SHAPE")
        else
          if PartIndex == 1 then
            text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_MUSCLE")
          else
            if PartIndex == 2 then
              text = text .. PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_TATTOO")
            end
          end
        end
      else
        text = PAGetString(Defines.StringSheet_GAME, "XML_CUSTOMIZATION_NORMAL")
      end
    end
  end
  return text
end

setCurrentActive = function(setindex)
  -- function num : 0_11 , upvalues : list2_HistoryList, selectIndex, listMaxCount, currentactive, selectColor
  local historyCount = ToClient_getHistoryCount()
  local key = -1
  if setindex == nil then
    key = list2_HistoryList:getKeyByIndex(historyCount - 1)
  else
    key = list2_HistoryList:getKeyByIndex(setindex - 1)
  end
  local GroupIndex = 0
  local PartIndex = 0
  local index = 0
  GroupIndex = calculateGroupPartIndex(key)
  local inputtext = calculateText(GroupIndex, PartIndex)
  selectIndex = index
  local toIndex = list2_HistoryList:getCurrenttoIndex()
  toIndex = (math.floor)(toIndex)
  if selectIndex < toIndex + 1 or toIndex + listMaxCount <= selectIndex then
    if currentactive ~= nil then
      currentactive:SetColor((Defines.Color).C_FFFFFFFF)
    end
    return 
  end
  if currentactive ~= nil then
    currentactive:SetColor((Defines.Color).C_FFFFFFFF)
  end
  local control = list2_HistoryList:GetContentByKey(key)
  local active = (UI.getChildControl)(control, "Static_Active")
  active:SetColor(selectColor)
  currentactive = active
end

historyTableDoChangeActive = function()
  -- function num : 0_12 , upvalues : selectIndex, list2_HistoryList, listMaxCount, currentactive, selectColor
  local historyCount = ToClient_getHistoryCount()
  selectIndex = selectIndex + 1
  if historyCount <= selectIndex then
    selectIndex = historyCount
  end
  local toIndex = list2_HistoryList:getCurrenttoIndex()
  toIndex = (math.floor)(toIndex)
  if selectIndex < toIndex + 1 or toIndex + listMaxCount < selectIndex then
    if currentactive ~= nil then
      currentactive:SetColor((Defines.Color).C_FFFFFFFF)
    end
    return 
  end
  local key = list2_HistoryList:getKeyByIndex(selectIndex - 1)
  if currentactive ~= nil then
    currentactive:SetColor((Defines.Color).C_FFFFFFFF)
  end
  if key == -1 then
    selectIndex = selectIndex - 1
    key = list2_HistoryList:getKeyByIndex(selectIndex - 1)
  end
  local control = list2_HistoryList:GetContentByKey(key)
  if control == nil then
    return 
  end
  local active = (UI.getChildControl)(control, "Static_Active")
  if active == nil then
    return 
  end
  active:SetColor(selectColor)
  currentactive = active
end

historyTableUnDoChangeActive = function()
  -- function num : 0_13 , upvalues : selectIndex, list2_HistoryList, listMaxCount, currentactive, selectColor
  selectIndex = selectIndex - 1
  if selectIndex <= 1 then
    selectIndex = 1
  end
  local toIndex = list2_HistoryList:getCurrenttoIndex()
  toIndex = (math.floor)(toIndex)
  if selectIndex < toIndex + 1 or toIndex + listMaxCount < selectIndex then
    if currentactive ~= nil then
      currentactive:SetColor((Defines.Color).C_FFFFFFFF)
    end
    return 
  end
  local key = list2_HistoryList:getKeyByIndex(selectIndex - 1)
  if currentactive ~= nil then
    currentactive:SetColor((Defines.Color).C_FFFFFFFF)
  end
  if key == -1 then
    selectIndex = selectIndex + 1
    key = list2_HistoryList:getKeyByIndex(selectIndex - 1)
  end
  local control = list2_HistoryList:GetContentByKey(key)
  if control == nil then
    return 
  end
  local active = (UI.getChildControl)(control, "Static_Active")
  if active == nil then
    return 
  end
  active:SetColor(selectColor)
  currentactive = active
end

historyTableRePosY = function(flag)
  -- function num : 0_14 , upvalues : customization_HistoryBG
  customization_HistoryBG:SetPosX(getScreenSizeX() - customization_HistoryBG:GetSizeX() - 20)
  if Panel_Cash_Customization ~= nil then
    if Panel_Cash_Customization:GetShow() then
      customization_HistoryBG:SetPosY(Panel_Cash_Customization:GetPosY() + FGlobal_CashCustom_CashBgSizeY() + 10)
    else
      customization_HistoryBG:SetPosY(40)
    end
  else
    customization_HistoryBG:SetPosY(40)
  end
end

HidehistoryTable = function()
  -- function num : 0_15 , upvalues : checkbox_Close, BTN_Previous, BTN_Next, list2_HistoryList, customization_HistoryBG, BGSizeY
  if checkbox_Close:IsCheck() then
    BTN_Previous:SetShow(false)
    BTN_Next:SetShow(false)
    list2_HistoryList:SetShow(false)
    checkbox_Close:SetCheck(true)
    customization_HistoryBG:SetSize(customization_HistoryBG:GetSizeX(), checkbox_Close:GetSizeY() + 10)
    checkbox_Close:setRenderTexture(checkbox_Close:getClickTexture())
  else
    BTN_Previous:SetShow(true)
    BTN_Next:SetShow(true)
    list2_HistoryList:SetShow(true)
    checkbox_Close:SetCheck(false)
    customization_HistoryBG:SetSize(customization_HistoryBG:GetSizeX(), BGSizeY)
    checkbox_Close:setRenderTexture(checkbox_Close:getBaseTexture())
  end
end

HistoryApply = function(GroupIndex, PartIndex, index)
  -- function num : 0_16 , upvalues : selectIndex, currentactive, list2_HistoryList, selectColor
  selectIndex = index
  local key = calculateListKeyIndex(GroupIndex, PartIndex, index)
  if currentactive ~= nil then
    currentactive:SetColor((Defines.Color).C_FFFFFFFF)
  end
  local control = list2_HistoryList:GetContentByKey(key)
  local active = (UI.getChildControl)(control, "Static_Active")
  active:SetColor(selectColor)
  currentactive = active
  ToClient_HistorySelectByIndex(selectIndex - 1)
end


