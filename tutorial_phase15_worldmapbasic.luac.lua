-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase15_worldmapbasic.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_WorldmapBasic = {_currentStep = 0, _nextStep = 0, _currentProgress = 1, _prevProgress = 1, _lastProgress = 6, _updateTime = 0, _isSkippable = true, _tempTargetUi = nil, _eventTempControl = nil, _longWaitTime = 20}
-- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.startPhase = function(self, stepNo)
  -- function num : 0_0
  _PA_LOG("๊ณฝ๋ฏผ์\176", "PaGlobal_TutorialPhase_WorldmapBasic:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 1
  self._updateTime = 0
  self._longWaitTime = 20
  classType = (getSelfPlayer()):getClassType()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.endPhase = function(self)
  -- function num : 0_1
  self._prevProgress = 1
  self._currentStep = 0
  self._nextStep = 1
  self._updateTime = 0
  self._longWaitTime = 20
  FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal)
  FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage)
  FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
  self:eraseAllEffectAllSearchResultUi()
  self:eraseAllEffectAllModeButton()
  self:eraseAllEffectAllCheckButton()
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.updatePerFrame = function(self, deltaTime)
  -- function num : 0_2
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    self:updateStep1(deltaTime)
  else
    if self._currentStep == 2 then
      self:updateStep2(deltaTime)
    end
  end
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.handleChangeStep = function(self, currentStep)
  -- function num : 0_3
  if self._currentStep == 1 then
    self:changeStep1()
  else
    if self._currentStep == 2 then
      self:changeStep2()
    end
  end
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.toNextProgress = function(self)
  -- function num : 0_4
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.toNextStep = function(self)
  -- function num : 0_5
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.toStep = function(self, destStep, destProgress)
  -- function num : 0_6
  self._nextStep = destStep
  if destProgress == nil then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
  if self._currentStep == self._nextStep then
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.setEffectAllSearchResultUi = function(self, effectName, isLoop, offsetX, offsetY)
  -- function num : 0_7
  for index = 0, FGlobal_WorldmapMain_GetSearchingResultCount() - 1 do
    local resultUiByIndex = FGlobal_WorldmapMain_GetSearchResultUiPool(index)
    if resultUiByIndex ~= nil then
      resultUiByIndex:EraseAllEffect()
      resultUiByIndex:AddEffect(effectName, isLoop, offsetX, offsetY)
    end
  end
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eraseAllEffectAllSearchResultUi = function(self)
  -- function num : 0_8
  for index = 0, FGlobal_WorldmapMain_GetSearchingResultCount() - 1 do
    local resultUiByIndex = FGlobal_WorldmapMain_GetSearchResultUiPool(index)
    if resultUiByIndex ~= nil then
      resultUiByIndex:EraseAllEffect()
    end
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.setEffectAllModeButton = function(self)
  -- function num : 0_9
  local worldmapModeButtonList = FGlobal_WorldmapMain_GetWorldmapModeButtonList()
  for key,value in pairs(worldmapModeButtonList) do
    value:EraseAllEffect()
    value:AddEffect("UI_ItemInstall", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eraseAllEffectAllModeButton = function(self)
  -- function num : 0_10
  local worldmapModeButtonList = FGlobal_WorldmapMain_GetWorldmapModeButtonList()
  for key,value in pairs(worldmapModeButtonList) do
    value:EraseAllEffect()
  end
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.setEffectAllCheckButton = function(self)
  -- function num : 0_11
  local worldmapFilterCheckButtonList = FGlobal_WorldmapMain_GetWorldmapCheckButtonList()
  for key,value in pairs(worldmapFilterCheckButtonList) do
    value:EraseAllEffect()
    value:AddEffect("UI_ItemInstall_Gold", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eraseAllEffectAllCheckButton = function(self)
  -- function num : 0_12
  local worldmapFilterCheckButtonList = FGlobal_WorldmapMain_GetWorldmapCheckButtonList()
  for key,value in pairs(worldmapFilterCheckButtonList) do
    value:EraseAllEffect()
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.changeStep1 = function(self)
  -- function num : 0_13
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\144, ๊ทธ๋ผ ์ด์  ํธ์๊ธฐ๋ฅ์\144 ๋\128ํ\180 ์์๋ณด์.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ฐ์  ์ผ์ชฝ ์๋จ ๋ฉ๋ด๋ฅ\188 ๋ณด์.\n๊ฑฐ์ ๋ค์ ์ฐพ์ ์\152 ์๋ ๊ณณ์ด์\188.", "๋ง์ฐ์ค๋ฅผ ์ฌ๋ ค๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
      self._tempTargetUi = (UI.getChildControl)(Panel_WorldMap_Main, "MainMenu_Bg")
      self._eventTempControl = FGlobal_WorldmapMain_CreateEventTempControl("Mouse_On", self._tempTargetUi, Panel_WorldMap_Main)
      if self._eventTempControl ~= nil then
        (self._eventTempControl):SetShow(true, true)
      end
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("[๊ฑฐ์ ] ์์ด์ฝ์ด ๋ณด์ด์ง\128?\n์ฌ๊ธฐ์\160 ๋ฐ๊ฒฌํ\156 ๊ฑฐ์ ์\132 ํ์ธํ\160 ์\152 ์์ด.", "ํ์๋\156 [๊ฑฐ์ ] ์์ด์ฝ์ ํด๋ฆญํด๋ด.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
        FGlobal_WorldmapMain_DeleteEventTempControl()
        FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal)
        FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal, "UI_WorldMap_Ping01", true, 0, 0)
        FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal, "UI_ItemJewel02", true, 0, 0)
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ํ์\180. ์ด์  [๋ง์] ์์ด์ฝ์ ํด๋ฆญํด๋ด.\n๋ฐ๊ฒฌํ\156 ๋ชจ๋  ๋ง์์\180 ๋ณด์ผ ๊ฑฐ์ผ.", "ํ์๋\156 [๋ง์] ์์ด์ฝ์ ํด๋ฆญํด๋ด.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
          FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage)
          FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage, "UI_WorldMap_Ping01", true, 0, 0)
          FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage, "UI_ItemJewel02", true, 0, 0)
        else
          if self._currentProgress == 5 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ข์. ๊ทธ๋ผ ๋ค์ [๋์]๋ฅ\188 ๋๋ฌ๋ด\144.\n๊ทธ๋ผ ๋ฐ๊ฒฌํ\156 ๋์๊ฐ\128 ๋ณด์ผ ๊ฑฐ์ผ.", "ํ์๋\156 [๋์] ์์ด์ฝ์ ํด๋ฆญํด๋ด.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
            FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
            FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city, "UI_WorldMap_Ping01", true, 0, 0)
            FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city, "UI_ItemJewel02", true, 0, 0)
          else
            if self._currentProgress == 6 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ํ์\180. ๊ทธ๋ผ ํ์๋\156 ์ง\128์\173 ๋ชฉ๋ก์ค\145 ์๋ฌด๊ฑฐ๋ ๋๋ฌ ๋ด\144.\n๊ทธ๋ผ ํ๋ฉด์\180 ์๋์ผ๋ก ํด๋น ์ง\128์ญ์ผ๋ก\156 ๊ฐ\128๊ฒ\140 ๋\188.", "๋ชฉ๋ก์์ ํ์๋\156 ์ง\128์ญ์ ๋๋ฌ๋ด\144.", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.2, true)
  end
)
              self:setEffectAllSearchResultUi("UI_ButtonLineRight_Blue", true, -10, 0)
              FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
              FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city, "UI_WorldMap_Ping02", true, 0, 0)
              FGlobal_WorldmapMain_AddEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city, "UI_ItemJewel02", true, 0, 0)
            else
              if self._currentProgress == 7 then
                self._updateTime = 0
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด๋ฐ ์์ผ๋ก\156 ๋๋ฅด๋ฉ\180 ๋\188.\n์ด๋? ๊ต์ฅํ\136 ์ฝ์ง?", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
                self._lastProgress = self._currentProgress
              else
                if self._currentProgress == -1 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\156 ๋ฒ์จ ์๋๋งต์ ๋ซ๋๊ฑฐ์ง?", "์ด์ <M>ํค๋ก ์๋๋งต์ ์ด์ด!", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
                else
                  if self._currentProgress == -2 then
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_8
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๋ด๊ฐ ๋งํ๊ณณ์ ์\180 ์ด๊ณณ์\180 ์๋์\188.", "<ESC>ํค๋ก ๋ค์ ์๋๋ก\156 ๋์๊ฐ\128.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
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

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.updateStep1 = function(self, deltaTime)
  -- function num : 0_14
  if self._currentProgress == 2 then
    FGlobal_WorldmapMain_PerFrameAlphaAnimationEventTempControl(0.4, 0.9, deltaTime * 7.5)
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_15
  if self._currentProgress == -1 then
    self._currentProgress = self._prevProgress
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_16
  if self._currentProgress >= 1 and self._currentProgress <= 7 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eventCallStep1WorldmapMainEventTempControl = function(self)
  -- function num : 0_17
  if self._currentProgress == 2 then
    FGlobal_WorldmapMain_DeleteEventTempControl()
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eventCallStep1ClickedGrandWorldMapSearchNodeType = function(self, typeIndex)
  -- function num : 0_18
  -- DECOMPILER ERROR at PC12: Unhandled construct in 'MakeBoolean' P1

  if self._currentProgress == 3 and (FGlobal_WorldmapMain_GetWorldmapNodeType()).normal == typeIndex then
    FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).normal)
    self:toNextProgress()
  end
  -- DECOMPILER ERROR at PC28: Unhandled construct in 'MakeBoolean' P1

  if self._currentProgress == 4 and (FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage == typeIndex then
    FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).viliage)
    self:toNextProgress()
  end
  if self._currentProgress == 5 and (FGlobal_WorldmapMain_GetWorldmapNodeType()).city == typeIndex then
    FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eventCallStep1ClickedGrandWorldmapGotoNodeFocus = function(self, resultIndex)
  -- function num : 0_19
  if self._currentProgress == 6 then
    FGlobal_WorldmapMain_EraseAllEffectNodeTypeRadioButton((FGlobal_WorldmapMain_GetWorldmapNodeType()).city)
    self:eraseAllEffectAllSearchResultUi()
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_20
  if self._lastProgress == self._currentProgress then
    self:toNextStep()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.changeStep2 = function(self)
  -- function num : 0_21
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ทธ๋ผ ์ด์  ์๋๋ง\181 ์์ด์ฝ\152 ๊ด\128๋ฆฌ๋ฅผ ํด๋ณด์\144.\n์ค๋ฅธ์ช\189 ์๋จ์\144 ์์ด์ฝ๋ค์\180 ๋ณด์ด์ง\128?", "", false, getScreenSizeX() * 0.6, getScreenSizeY() * 0.2, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์์ชฝ ์ ๋ณด๋\148 ์๋๋ง\181 ์์ฑ์ด์ผ.\n๋๋ฅผ ๋๋ง๋\164 ์๋๋งต์ด ์์ ํ\136 ๋ฐ๋\128์ง.", "", false, getScreenSizeX() * 0.6, getScreenSizeY() * 0.2, false)
  end
)
      self:eraseAllEffectAllModeButton()
      self:setEffectAllModeButton()
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์๋ ์ ๋ณด๋\148 ์๋๋ง\181 ์ ๋ณด ์์ด์ฝ\152 ๊ด\128๋ฆฌ์ผ.\n๊ฐ\129 ๋ฒํผ๋ง๋ค ์ผ๊ณ  ๋๊ณ ๊ฐ\128 ๊ฐ\128๋ฅํด.", "", false, getScreenSizeX() * 0.6, getScreenSizeY() * 0.2, false)
  end
)
        self:eraseAllEffectAllModeButton()
        self:eraseAllEffectAllCheckButton()
        self:setEffectAllCheckButton()
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_3 , upvalues : self
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๋ค์๊ณผ์ ๊น์ง ๋จ์์๊ฐ : " .. (string.format)("%.2f\n\n", self._longWaitTime - self._updateTime) .. "๊ทธ๋ผ ์๊ฐ์\132 ์คํ๋\136,", "ํ๋์\169 ๋๋ฌ๋ด\144. ๋๋ฌ๋ณด๋ฉด ์ดํด๊ฐ\128 ๋\160 ๊ฑฐ์ผ.", false, getScreenSizeX() * 0.6, getScreenSizeY() * 0.2, true)
  end
)
        else
          if self._currentProgress == 5 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด๋? ์ ๊ธฐํ์ง?\n์\180 ๊ธฐ๋ฅ๋ค์ ์ด์ฉํ๋ฉด ๋ด๊ฐ ์ํ๋\148 ์ ๋ณด๋ง\140 ์ผ๊ณ  ๋\140 ์\152 ์์ด.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
            self:eraseAllEffectAllModeButton()
            self:eraseAllEffectAllCheckButton()
          else
            if self._currentProgress == 6 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\152 ์ด์ฉํ๋๋ก\157 ํ\180.\n์ด์  ๋ค์ ๋ชจํ์\132 ๋ ๋๋\132 ๋\188.\n\n๊ทธ๋ผ ์ด์ฌํ\136 ํ์๊ณ\160.", "[ํํ ๋ฆฌ์ผ ์ข๋ฃ]", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
              self._lastProgress = self._currentProgress
            else
              if self._currentProgress == -1 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\156 ๋ฒ์จ ์๋๋งต์ ๋ซ๋๊ฑฐ์ง?", "์ด์ <M>ํค๋ก ์๋๋งต์ ์ด์ด!", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.updateStep2 = function(self, deltaTime)
  -- function num : 0_22
  if self._currentProgress == 4 then
    if self._longWaitTime * timeRatio < self._updateTime then
      self._updateTime = 0
      self._longWaitTime = 20
      self:toNextProgress()
    end
    self:handleChangeStep(self._currentProgress)
    self._updateTime = self._updateTime + deltaTime
  end
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eventCallStep2WorldMapOpenComplete = function(self)
  -- function num : 0_23
  if self._currentProgress == -1 then
    self._currentProgress = self._prevProgress
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eventCallStep2WorldMapImmediatelyClose = function(self)
  -- function num : 0_24
  if self._currentProgress >= 1 and self._currentProgress <= 4 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.eventCallStep2MouseLUpBubble = function(self)
  -- function num : 0_25
  if self._lastProgress == self._currentProgress then
    self:endPhase()
  else
    if self._currentProgress == 3 then
      self:eraseAllEffectAllModeButton()
      self:eraseAllEffectAllCheckButton()
      self:setEffectAllModeButton()
      self:setEffectAllCheckButton()
    end
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.handleWorldMapOpenComplete = function(self)
  -- function num : 0_26
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  else
    if self._currentStep == 2 then
      self:eventCallStep2WorldMapOpenComplete()
    end
  end
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_27
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  else
    if self._currentStep == 2 then
      self:eventCallStep2WorldMapImmediatelyClose()
    end
  end
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.handleWorldmapMainEventTempControl = function(self)
  -- function num : 0_28
  if self._currentStep == 1 then
    self:eventCallStep1WorldmapMainEventTempControl()
  end
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.handleClickedGrandWorldMapSearchNodeType = function(self, typeIndex)
  -- function num : 0_29
  if self._currentStep == 1 then
    self:eventCallStep1ClickedGrandWorldMapSearchNodeType(typeIndex)
  end
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.handleClickedGrandWorldmapGotoNodeFocus = function(self, resultIndex)
  -- function num : 0_30
  if self._currentStep == 1 then
    self:eventCallStep1ClickedGrandWorldmapGotoNodeFocus(resultIndex)
  end
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_WorldmapBasic.handleMouseLUpBubble = function(self)
  -- function num : 0_31
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  else
    if self._currentStep == 2 then
      self:eventCallStep2MouseLUpBubble()
    end
  end
end


