-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\auction\panel_territoryauth_message.luac 

-- params : ...
-- function num : 0
Panel_TerritoryAuth_Message:RegisterShowEventFunc(true, "TerritoryAuth_MessageShowAni()")
Panel_TerritoryAuth_Message:RegisterShowEventFunc(false, "TerritoryAuth_MessageHideAni()")
TerritoryAuth_MessageShowAni = function()
  -- function num : 0_0
end

TerritoryAuth_MessageHideAni = function()
  -- function num : 0_1
end

local MessageData = {
_Msg = {}
}
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local curIndex = 0
local processIndex = 0
local animationEndTime = 4
local elapsedTime = 5
local msgBG = (UI.getChildControl)(Panel_TerritoryAuth_Message, "Static_TerrityryAuth_MsgBorder")
local bg_L = (UI.getChildControl)(Panel_TerritoryAuth_Message, "Static_TerrityryAuth_Msg_L")
local bg_R = (UI.getChildControl)(Panel_TerritoryAuth_Message, "Static_TerrityryAuth_Msg_R")
local _text_Msg = (UI.getChildControl)(Panel_TerritoryAuth_Message, "StaticText_TerritoryAuth_Message")
Terr_ShowMessage_Ack = function(message)
  -- function num : 0_2
  Terr_ShowMessage_Ack_WithOut_ChattingMessage(message)
  chatting_sendMessage("", message, (CppEnums.ChatType).System)
end

Terr_ShowMessage_Ack_WithOut_ChattingMessage = function(message)
  -- function num : 0_3 , upvalues : msgBG, curIndex, MessageData
  msgBG:EraseAllEffect()
  curIndex = curIndex + 1
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (MessageData._Msg)[curIndex] = message
  Panel_TerritoryAuth_Message:SetShow(true, true)
end

local MessageOpen = function()
  -- function num : 0_4 , upvalues : _text_Msg, UI_ANI_ADV, UI_color
  _text_Msg:AddEffect("UI_ImperialLight", false, 0, 15)
  _text_Msg:AddEffect("fUI_ImperialStart", false, 0, -10)
  local aniInfo = Panel_TerritoryAuth_Message:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = true
  local aniInfo1 = Panel_TerritoryAuth_Message:addScaleAnimation(0.5, 0.65, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1)
  aniInfo1.AxisX = Panel_TerritoryAuth_Message:GetSizeX() / 2
  aniInfo1.AxisY = Panel_TerritoryAuth_Message:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_TerritoryAuth_Message:addScaleAnimation(0.15, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(1)
  aniInfo2.IsChangeChild = true
  local aniInfo3 = Panel_TerritoryAuth_Message:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo4 = Panel_TerritoryAuth_Message:addScaleAnimation(3.5, 3.65, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo4:SetStartScale(1)
  aniInfo4:SetEndScale(1)
  aniInfo4.AxisX = Panel_TerritoryAuth_Message:GetSizeX() / 2
  aniInfo4.AxisY = Panel_TerritoryAuth_Message:GetSizeY() / 2
  aniInfo4.ScaleType = 2
  aniInfo4.IsChangeChild = true
end

local tempMsg = nil
Terr_MessageUpdate = function(updateTime)
  -- function num : 0_5 , upvalues : elapsedTime, animationEndTime, processIndex, curIndex, MessageOpen, tempMsg, MessageData, _text_Msg
  elapsedTime = elapsedTime + updateTime
  if animationEndTime <= elapsedTime then
    if processIndex < curIndex then
      audioPostEvent_SystemUi(8, 1)
      MessageOpen()
      processIndex = processIndex + 1
      Panel_TerritoryAuth_Message:SetShow(false, true)
      Panel_TerritoryAuth_Message:SetShow(true, true)
      tempMsg = (MessageData._Msg)[processIndex]
      _text_Msg:SetText((MessageData._Msg)[processIndex])
      local _txtSize = _text_Msg:GetTextSizeX()
      -- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (MessageData._Msg)[processIndex] = nil
      elapsedTime = 0
    else
      do
        Panel_TerritoryAuth_Message:SetShow(false, false)
        curIndex = 0
        processIndex = 0
        if processIndex < curIndex and tempMsg == (MessageData._Msg)[processIndex + 1] then
          processIndex = processIndex + 1
          -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

          ;
          (MessageData._Msg)[processIndex] = nil
        end
      end
    end
  end
end

Terr_MessagePanel_Resize = function()
  -- function num : 0_6
  local scrX = getScreenSizeX()
  Panel_TerritoryAuth_Message:SetPosX(scrX / 2 - Panel_TerritoryAuth_Message:GetSizeX() / 2)
  Panel_TerritoryAuth_Message:SetPosY(getScreenSizeY() / 2 - Panel_TerritoryAuth_Message:GetSizeY() / 2 - 100)
end

Terr_MessagePanel_Resize()
Panel_TerritoryAuth_Message:RegisterUpdateFunc("Terr_MessageUpdate")
registerEvent("onScreenResize", "Terr_MessagePanel_Resize()")

