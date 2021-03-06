-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase10_veliaworldmap.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_VeliaWorldmap = {_currentStep = 0, _nextStep = 0, _currentProgress = 1, _prevProgress = 1, _lastProgress = 6, _updateTime = 0, _isSkippable = true, 
_talkerCharacterKeyData = {[1] = 40044, [2] = 40012}
, 
_nodeWaypointKeyList = {1, 301, 601, 1101, 1301, 61, 604, 608, 602, 302, 1141, 1319, 1314, 1343, 1380, 1002}
}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.startPhase = function(self, stepNo)
  -- function num : 0_0
  _PA_LOG("๊ณฝ๋ฏผ์\176", "PaGlobal_TutorialPhase_VeliaWorldmap:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
  self._updateTime = 0
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

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.endPhase = function(self)
  -- function num : 0_1
  self._currentProgress = 1
  self._currentStep = 0
  self._nextStep = 1
  self._prevProgress = 1
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  PaGlobal_TutorialUiBlackSpirit:setShowAll(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.updatePerFrame = function(self, deltaTime)
  -- function num : 0_2
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleChangeStep = function(self, currentStep)
  -- function num : 0_3
  if self._currentStep == 1 then
    self:changeStepSuggestOpenWorldmap()
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.toNextProgress = function(self)
  -- function num : 0_4
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.toNextStep = function(self)
  -- function num : 0_5
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.toStep = function(self, destStep, destProgress)
  -- function num : 0_6
  self._nextStep = destStep
  if destProgress == nil then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.setEffectNodeWaypointKeyList = function(self)
  -- function num : 0_7
  for index,value in ipairs(self._nodeWaypointKeyList) do
    FGlobal_WorldmapMain_EraseAllEffectUiNodeButtonByWaypointKey(value)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_ArrowMark02", true, 0, -50)
    FGlobal_WorldmapMain_AddEffectUiNodeButtonByWaypointKey(value, "UI_WorldMap_Ping01", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eraseAllEffectNodeWaypointKeyList = function(self)
  -- function num : 0_8
  for index,value in ipairs(self._nodeWaypointKeyList) do
    FGlobal_WorldmapMain_EraseAllEffectUiNodeButtonByWaypointKey(value)
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.changeStepSuggestOpenWorldmap = function(self)
  -- function num : 0_9
  if self._currentProgress == 1 then
    toClient_FadeIn(0.75)
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๋\140 ์\180 ๋\140 ๊น์ง ๋์ ๋ณด์ด๋\148 ๊ธธ๋ง ๋ฌ๋ ค์์ง? ์ด๊ฒ์\128 ์\180 ์ธ์์\152 ์ง\128๋์ผ.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๋จ์ํ\136 ์์น๋ง\140 ๋ณด์ฌ์ฃผ๋ ๊ฒ์ด ์๋๋\188\n์์ฃผ ์ ์ฉํ\156 ๊ธฐ๋ฅ๋ค์ด ๋ง์.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์ ๋ถ\128ํ\176 ์ฌ์ฉ๋ฒ์ ์ตํ๋ณด์.\n๊ฑฐ์ ์ค์ ๋ช๊ตฐ๋ฐ๋ฅผ ๋์ ๋๊ฒ ํ์ํด๋ดค์\180.", "ํ์ดํ๊ฐ ํ์๋\156 ๊ฑฐ์ ์\132 ์ผํด๋ฆ\173 ํด๋ด.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
        self:setEffectNodeWaypointKeyList()
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ํ์\180. ๊ฑฐ์ ์\132 ์ข\128 ๋\148 ์์ธํ\136 ๋ณ\188 ์\152 ์๊ณ ,\n์ฐฝ๊ณ ๊ฐ\128 ์๋ค๋ฉ\180 ์์ง๊ธ๋ ๋ณ\188 ์\152 ์์ง.", "๋\164 ์ดํด๋ดค์ผ๋ฉ\180 <ESC>๋ฒํผ์\132 ๋๋ฌ ์๋๋ก\156 ๋น ์ ธ๋๊ฐ๋ด\144.", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.6, true)
  end
)
          self:eraseAllEffectNodeWaypointKeyList()
        else
          if self._currentProgress == 5 then
            ToClient_DeleteNaviGuideByGroup()
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์ ๋\148 ๋ชฉ์ ์ง\128๋ฅ\188 ์ง\128์ ํ๋๋ฒ์\132 ์๋ ค์ฃผ์ง.", "์๋๋ง\181 ๊ฑฐ์ ์ด๋ ๋ฐ๋ฅ ์๋ฌด๊ณณ์ด๋\152 ๋ง์ฐ์\164 ์ฐํด๋ฆญ์ ํ\180 ๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
          else
            if self._currentProgress == 6 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ํ์\180. ๊ทธ๋ ๊ฒ\140 ์๋ด๋\156 ๊ธธ์ฐพ๊ธฐ๋ฅผ ๋ณด๊ณ \n๋ชฉ์ ์ง\128๊น์ง ์ฝ๊ฒ ์ฐพ์๊ฐ\136 ์\152 ์์ผ๋\136 ์\152 ํ์ฉํ๋ผ๊ณ\160.", "์ด์  <ESC>ํค๋ <M>ํค๋ก ์๋๋งต์ ๋ซ๊ณ  ํ๋ ์\188 ๋ด\144.\n[ํํ ๋ฆฌ์ผ ์ข๋ฃ]", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
              self._lastProgress = self._currentProgress
            else
              if self._currentProgress == -1 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\156 ๋ฒ์จ ์๋๋งต์ ๋ซ๋๊ฑฐ์ง?", "์ด์ <M>ํค๋ก ์๋๋งต์ ์ด์ด!", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
              else
                if self._currentProgress == -2 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_7
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

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_10
  if self._currentProgress == 4 then
    self:setEffectNodeWaypointKeyList()
  else
    if self._currentProgress == -1 then
      if self._prevProgress >= 5 then
        self._currentProgress = 5
      else
        self._currentProgress = 1
      end
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1NodeLClick = function(self, uiNodeButton)
  -- function num : 0_11
  if self._currentProgress ~= 3 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -2
  else
    if self._currentProgress == 3 then
      local isMatchWaypointKey = false
      for index,value in ipairs(self._nodeWaypointKeyList) do
        if value == uiNodeButton:getWaypointKey() then
          isMatchWaypointKey = true
          break
        end
      end
      do
        do
          if isMatchWaypointKey == true then
            self._currentProgress = self._currentProgress + 1
          else
            self._prevProgress = self._currentProgress
            self._currentProgress = -2
          end
          self:handleChangeStep(self._currentStep)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_12
  if self._currentProgress >= 3 and self._currentProgress < 4 then
    self:setEffectNodeWaypointKeyList()
  else
    if self._currentProgress == 4 then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    else
      if self._currentProgress == -2 then
        if self._prevProgress < 3 then
          self._currentProgress = 1
        else
          if self._prevProgress == 4 then
            self._currentProgress = 3
          else
            self._currentProgress = self._prevProgress
          end
        end
        self:handleChangeStep(self._currentStep)
      end
    end
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1RClickWorldmapPanel = function(self)
  -- function num : 0_13
  if self._currentProgress == 5 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_14
  if self._currentProgress >= 1 and self._currentProgress < 6 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == 6 then
      self:endPhase()
    end
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_15
  if self._lastProgress == self._currentProgress then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleWorldMapOpenComplete = function(self)
  -- function num : 0_16
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_17
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_18
  if self._currentStep == 1 then
    self:eventCallStep1NodeLClick(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleRClickWorldmapPanel = function(self, pos3D, immediately, isTopPicking, uiKnowledgeStatic)
  -- function num : 0_19
  if self._currentStep == 1 then
    self:eventCallStep1RClickWorldmapPanel()
  end
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleResetTownMode = function(self)
  -- function num : 0_20
  self:eventCallStep1ResetTownMode()
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_VeliaWorldmap.handleMouseLUpBubble = function(self)
  -- function num : 0_21
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  end
end


