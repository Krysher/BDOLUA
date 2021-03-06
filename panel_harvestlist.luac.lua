-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\housing\panel_harvestlist.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local isharvestManagement = ToClient_IsContentsGroupOpen("72")
Panel_HarvestList:SetShow(false)
Panel_HarvestList:setGlassBackground(true)
Panel_HarvestList:ActiveMouseEventEffect(true)
Panel_HarvestList:RegisterShowEventFunc(true, "Panel_HarvestList_ShowAni()")
Panel_HarvestList:RegisterShowEventFunc(false, "Panel_HarvestList_HideAni()")
local isBeforeShow = false
local _naviCurrentInfo = nil
local maxTentCount = 10
Panel_HarvestList_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_HarvestList)
  local aniInfo1 = Panel_HarvestList:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_HarvestList:GetSizeX() / 2
  aniInfo1.AxisY = Panel_HarvestList:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_HarvestList:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_HarvestList:GetSizeX() / 2
  aniInfo2.AxisY = Panel_HarvestList:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_HarvestList_HideAni = function()
  -- function num : 0_1
  Panel_HarvestList:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_HarvestList, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local HarvestList = {_Static_BG = (UI.getChildControl)(Panel_HarvestList, "Static_BG"), _Territory = (UI.getChildControl)(Panel_HarvestList, "StaticText_Territory"), _TownName = (UI.getChildControl)(Panel_HarvestList, "StaticText_TownName"), _Address = (UI.getChildControl)(Panel_HarvestList, "StaticText_Address"), _doWork = (UI.getChildControl)(Panel_HarvestList, "Button_doWork"), _info = (UI.getChildControl)(Panel_HarvestList, "RadioButton_Info"), _Navi = (UI.getChildControl)(Panel_HarvestList, "Button_Navi"), _btn_Close = (UI.getChildControl)(Panel_HarvestList, "Button_Close"), _frame = (UI.getChildControl)(Panel_HarvestList, "Frame_HarvestList"), 
_tentPos = {}
}
HarvestList.frameContent = (UI.getChildControl)(HarvestList._frame, "Frame_1_Content")
HarvestList.frameScroll = (UI.getChildControl)(HarvestList._frame, "Frame_1_VerticalScroll")
;
(HarvestList.frameScroll):SetIgnore(false)
local HarvestList_ContentGroup = {_workerTitle = (UI.getChildControl)(Panel_HarvestList, "StaticText_M_Worker"), _border = (UI.getChildControl)(Panel_HarvestList, "Static_TitleBorder_4"), _border5 = (UI.getChildControl)(Panel_HarvestList, "Static_TitleBorder_5"), _naviTitle = (UI.getChildControl)(Panel_HarvestList, "StaticText_M_Navi")}
if not isharvestManagement then
  (HarvestList_ContentGroup._workerTitle):SetShow(false)
  ;
  (HarvestList_ContentGroup._border):SetShow(true)
  ;
  (HarvestList_ContentGroup._border5):SetShow(false)
  ;
  (HarvestList_ContentGroup._naviTitle):SetSpanSize(580, 46)
end
HarvestList.Panel_HarvestList_Initialize = function(self)
  -- function num : 0_2 , upvalues : maxTentCount
  (self.frameContent):DestroyAllChild()
  self.listArray = {}
  for idx = 0, maxTentCount - 1 do
    local listArr = {}
    listArr._Territory = (UI.createAndCopyBasePropertyControl)(Panel_HarvestList, "StaticText_Territory", self.frameContent, "HarvestList_StaticText_Territory_" .. idx)
    listArr._TownName = (UI.createAndCopyBasePropertyControl)(Panel_HarvestList, "StaticText_TownName", self.frameContent, "HarvestList_StaticText_TownName_" .. idx)
    listArr._Address = (UI.createAndCopyBasePropertyControl)(Panel_HarvestList, "StaticText_Address", self.frameContent, "HarvestList_StaticText_Address_" .. idx)
    listArr._doWork = (UI.createAndCopyBasePropertyControl)(Panel_HarvestList, "Button_doWork", self.frameContent, "HarvestList_Button_doWork_" .. idx)
    listArr._Navi = (UI.createAndCopyBasePropertyControl)(Panel_HarvestList, "Button_Navi", self.frameContent, "HarvestList_Button_Navi_" .. idx)
    listArr._info = (UI.createAndCopyBasePropertyControl)(Panel_HarvestList, "RadioButton_Info", self.frameContent, "HarvestList_Button_Info_" .. idx)
    -- DECOMPILER ERROR at PC72: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.listArray)[idx] = listArr
  end
  for idx = 0, #self.listArray do
    (((self.listArray)[idx])._Territory):SetShow(false)
    ;
    (((self.listArray)[idx])._TownName):SetShow(false)
    ;
    (((self.listArray)[idx])._Address):SetShow(false)
    ;
    (((self.listArray)[idx])._doWork):SetShow(false)
    ;
    (((self.listArray)[idx])._Navi):SetShow(false)
    ;
    (((self.listArray)[idx])._info):SetShow(false)
    if idx == 0 then
      (((self.listArray)[idx])._info):SetCheck(true)
    end
  end
  ;
  (self.frameContent):SetIgnore(false)
  ;
  (self.frameContent):addInputEvent("Mouse_DownScroll", "HarvestList_ScrollEvent( true )")
  ;
  (self.frameContent):addInputEvent("Mouse_UpScroll", "HarvestList_ScrollEvent( false )")
  ;
  (self.frameScroll):SetControlTop()
  ;
  (self._frame):UpdateContentScroll()
  ;
  (self._frame):UpdateContentPos()
end

HarvestList_ScrollEvent = function(isDown)
  -- function num : 0_3 , upvalues : HarvestList
  local self = HarvestList
  if isDown then
    (self.frameScroll):ControlButtonDown()
  else
    ;
    (self.frameScroll):ControlButtonUp()
  end
  ;
  (self._frame):UpdateContentScroll()
end

Panel_HarvestList_Update = function()
  -- function num : 0_4 , upvalues : HarvestList, isharvestManagement
  HarvestList:Panel_HarvestList_Initialize()
  local self = HarvestList
  local temporaryWrapper = getTemporaryInformationWrapper()
  local myTentCount = temporaryWrapper:getSelfTentCount()
  local _PosY = 0
  if myTentCount > 0 then
    for idx = 0, myTentCount - 1 do
      local householdDataWithInstallationWrapper = temporaryWrapper:getSelfTentWrapperByIndex(idx)
      local characterStaticStatusWrapper = householdDataWithInstallationWrapper:getHouseholdCharacterStaticStatusWrapper()
      if characterStaticStatusWrapper ~= nil and characterStaticStatusWrapper:getName() ~= nil then
        local tentWrapper = temporaryWrapper:getSelfTentWrapperByIndex(idx)
        local tentPosX = tentWrapper:getSelfTentPositionX()
        local tentPosY = tentWrapper:getSelfTentPositionY()
        local tentPosZ = tentWrapper:getSelfTentPositionZ()
        local tentPos = float3(tentPosX, tentPosY, tentPosZ)
        -- DECOMPILER ERROR at PC41: Confused about usage of register: R15 in 'UnsetPending'

        ;
        (self._tentPos)[idx] = tentPos
        local regionWrapper = ToClient_getRegionInfoWrapperByPosition(tentPos)
        if idx ~= 0 then
          _PosY = (self._Territory):GetSizeY() + 7 + _PosY
        end
        ;
        (((self.listArray)[idx])._Territory):SetText(regionWrapper:getTerritoryName())
        ;
        (((self.listArray)[idx])._Territory):SetPosX(10)
        ;
        (((self.listArray)[idx])._Territory):SetPosY(_PosY)
        ;
        (((self.listArray)[idx])._Territory):SetShow(true)
        ;
        (((self.listArray)[idx])._TownName):SetText(regionWrapper:getAreaName())
        ;
        (((self.listArray)[idx])._TownName):SetPosX(195)
        ;
        (((self.listArray)[idx])._TownName):SetPosY(_PosY)
        ;
        (((self.listArray)[idx])._TownName):SetShow(true)
        ;
        (((self.listArray)[idx])._Address):SetText(characterStaticStatusWrapper:getName())
        ;
        (((self.listArray)[idx])._Address):SetPosX(405)
        ;
        (((self.listArray)[idx])._Address):SetPosY(_PosY)
        ;
        (((self.listArray)[idx])._Address):SetShow(true)
        ;
        (((self.listArray)[idx])._Navi):SetPosX(640)
        ;
        (((self.listArray)[idx])._Navi):SetPosY(_PosY + 2)
        ;
        (((self.listArray)[idx])._Navi):SetShow(true)
        ;
        (((self.listArray)[idx])._Navi):addInputEvent("Mouse_LUp", "_HarvestListNavigatorStart(" .. idx .. ")")
        ;
        (((self.listArray)[idx])._doWork):SetPosX(555)
        ;
        (((self.listArray)[idx])._doWork):SetPosY(_PosY)
        ;
        (((self.listArray)[idx])._doWork):SetShow(true)
        ;
        (((self.listArray)[idx])._info):SetPosX(698)
        ;
        (((self.listArray)[idx])._info):SetPosY(_PosY)
        ;
        (((self.listArray)[idx])._info):SetShow(true)
        if (((self.listArray)[idx])._info):IsCheck() and Panel_HarvestList:GetShow() then
          HarvestList_TentTooltipShow(idx)
        end
        ;
        (((self.listArray)[idx])._info):addInputEvent("Mouse_LUp", "HarvestList_TentTooltipShow(" .. idx .. ")")
        if isharvestManagement then
          local isShow = isWorkeOnHarvest(householdDataWithInstallationWrapper)
          if isShow then
            (((self.listArray)[idx])._doWork):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HARVESTLIST_BTNWORKING"))
            ;
            (((self.listArray)[idx])._doWork):SetIgnore(true)
            ;
            (((self.listArray)[idx])._doWork):addInputEvent("Mouse_LUp", "")
          else
            ;
            (((self.listArray)[idx])._doWork):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HARVESTLIST_BTNWORKERLIST"))
            ;
            (((self.listArray)[idx])._doWork):SetIgnore(false)
            ;
            (((self.listArray)[idx])._doWork):addInputEvent("Mouse_LUp", "HarvestList_WorkManager_Open(" .. idx .. ")")
          end
        else
          do
            do
              ;
              (((self.listArray)[idx])._doWork):SetShow(false)
              ;
              (((self.listArray)[idx])._Navi):SetPosX(600)
              -- DECOMPILER ERROR at PC287: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC287: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC287: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC287: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC287: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

HarvestList_TentTooltipShow = function(idx)
  -- function num : 0_5
  local temporaryWrapper = getTemporaryInformationWrapper()
  if temporaryWrapper == nil then
    return 
  end
  local householdDataWithInstallationWrapper = temporaryWrapper:getSelfTentWrapperByIndex(idx)
  if householdDataWithInstallationWrapper ~= nil then
    FGlobal_TentTooltipShow(householdDataWithInstallationWrapper)
  end
end

isWorkeOnHarvest = function(hhWrapper)
  -- function num : 0_6
  local houseHoldNo = hhWrapper:getHouseholdNo()
  if ToClient_hasWorkerWorkingInHarvest(houseHoldNo) then
    return true
  end
  return false
end

_HarvestListNavigatorStart = function(idx, myTentCount)
  -- function num : 0_7 , upvalues : HarvestList, maxTentCount, _naviCurrentInfo
  local self = HarvestList
  ToClient_DeleteNaviGuideByGroup(0)
  for ii = 0, maxTentCount - 1 do
    (((self.listArray)[ii])._Navi):SetCheck(false)
  end
  if _naviCurrentInfo ~= idx then
    local navigationGuideParam = NavigationGuideParam()
    navigationGuideParam._isAutoErase = true
    worldmapNavigatorStart((HarvestList._tentPos)[idx], navigationGuideParam, false, false, true)
    ;
    (((self.listArray)[idx])._Navi):SetCheck(true)
    _naviCurrentInfo = idx
  else
    do
      _naviCurrentInfo = nil
    end
  end
end

HarvestList_WorkManager_Open = function(index)
  -- function num : 0_8
  FGlobal_Harvest_WorkManager_Open(index)
end

FGlobal_HarvestList_Open = function()
  -- function num : 0_9
  audioPostEvent_SystemUi(13, 6)
  Panel_HarvestList:SetShow(true, true)
  Panel_HarvestList_Update()
end

HarvestList_Close = function()
  -- function num : 0_10
  audioPostEvent_SystemUi(13, 5)
  FGlobal_TentTooltipHide()
  Panel_HarvestList:SetShow(false, false)
end

HandleClicked_HarvestList_Close = function()
  -- function num : 0_11
  HarvestList_Close()
end

FGlobal_HarvestList_Update = function()
  -- function num : 0_12
  Panel_HarvestList_Update()
end

HarvestList.registEventHandler = function(self)
  -- function num : 0_13
  (self._btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_HarvestList_Close()")
end

renderModeChange_Panel_HarvestList_Update = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_14
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  Panel_HarvestList_Update()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_HarvestList_Update")
HarvestList:registEventHandler()

