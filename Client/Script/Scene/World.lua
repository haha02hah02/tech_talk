Class.World.None({})
function World.Constructor(A0_7755)
  local L1_7756, L2_7757, L3_7758
  L1_7756 = Functor
  L2_7757 = A0_7755
  L3_7758 = A0_7755.EnterBackground
  L1_7756 = L1_7756(L2_7757, L3_7758)
  A0_7755.oEnterBackground = L1_7756
  L1_7756 = Functor
  L2_7757 = A0_7755
  L3_7758 = A0_7755.EnterForeground
  L1_7756 = L1_7756(L2_7757, L3_7758)
  A0_7755.oEnterForeground = L1_7756
  L1_7756 = Functor
  L2_7757 = A0_7755
  L3_7758 = A0_7755.MemoryWarning
  L1_7756 = L1_7756(L2_7757, L3_7758)
  A0_7755.oMemoryWarning = L1_7756
  L1_7756 = SchedulerFunctor
  L2_7757 = A0_7755
  L3_7758 = A0_7755.OnSyncToService
  L1_7756 = L1_7756(L2_7757, L3_7758)
  A0_7755.oSync2Serviece = L1_7756
  L1_7756 = SchedulerFunctor
  L2_7757 = A0_7755
  L3_7758 = A0_7755.UpdateMultipleItems
  L1_7756 = L1_7756(L2_7757, L3_7758)
  A0_7755.oUpdateMultiple = L1_7756
  A0_7755.response_fail = 0
  L1_7756 = EGLView
  L2_7757 = L1_7756
  L1_7756 = L1_7756.SetDesignResolutionSize
  L3_7758 = Config
  L3_7758 = L3_7758.ScreenWidth
  L1_7756(L2_7757, L3_7758, Config.ScreenHeight, ResolutionExactFit)
  L1_7756 = KeepScreenOn
  L2_7757 = true
  L1_7756(L2_7757)
  L2_7757 = A0_7755
  L1_7756 = A0_7755.CheckAppIntegrity
  L1_7756(L2_7757)
  L1_7756 = math
  L1_7756 = L1_7756.randomseed
  L2_7757 = os
  L2_7757 = L2_7757.time
  L3_7758 = L2_7757()
  L1_7756(L2_7757, L3_7758, L2_7757())
  L1_7756 = Event
  L2_7757 = L1_7756
  L1_7756 = L1_7756.On
  L3_7758 = "DataException"
  L1_7756(L2_7757, L3_7758, A0_7755, A0_7755.DataException, -1)
  L1_7756 = Event
  L2_7757 = L1_7756
  L1_7756 = L1_7756.On
  L3_7758 = "Wasteop"
  L1_7756(L2_7757, L3_7758, A0_7755, A0_7755.WasteOperation)
  L1_7756 = Scheduler
  L2_7757 = L1_7756
  L1_7756 = L1_7756.Schedule
  L3_7758 = A0_7755.oSync2Serviece
  L1_7756(L2_7757, L3_7758, 30)
  L1_7756 = Scheduler
  L2_7757 = L1_7756
  L1_7756 = L1_7756.Schedule
  L3_7758 = A0_7755.oUpdateMultiple
  L1_7756(L2_7757, L3_7758, 30)
  L1_7756 = Application
  L2_7757 = L1_7756
  L1_7756 = L1_7756.On
  L3_7758 = "EnterBackground"
  L1_7756(L2_7757, L3_7758, A0_7755.oEnterBackground)
  L1_7756 = Application
  L2_7757 = L1_7756
  L1_7756 = L1_7756.On
  L3_7758 = "EnterForeground"
  L1_7756(L2_7757, L3_7758, A0_7755.oEnterForeground)
  L1_7756 = Application
  L2_7757 = L1_7756
  L1_7756 = L1_7756.On
  L3_7758 = "MemoryWarning"
  L1_7756(L2_7757, L3_7758, A0_7755.oMemoryWarning)
  L1_7756 = AdventureSDK
  L2_7757 = L1_7756
  L1_7756 = L1_7756.On
  L3_7758 = "Response"
  L1_7756(L2_7757, L3_7758, A0_7755, A0_7755.OnResponseFire)
  L1_7756 = Localhost
  L2_7757 = L1_7756
  L1_7756 = L1_7756.One
  L3_7758 = "name = 'sound'"
  L1_7756 = L1_7756(L2_7757, L3_7758)
  if not L1_7756 then
    return
  end
  L2_7757 = L1_7756.bgm
  if L2_7757 == nil then
    L2_7757 = true
  else
    L2_7757 = L2_7757 or L1_7756.bgm
  end
  L3_7758 = L1_7756.effect
  if L3_7758 == nil then
    L3_7758 = true
  else
    L3_7758 = L3_7758 or L1_7756.effect
  end
  Sound:SetBackgroundEnable(L2_7757)
  Sound:SetEffectEnable(L3_7758)
end
function World.Launch(A0_7759, A1_7760)
  local L2_7761, L3_7762
  L2_7761 = A0_7759.scenario
  A1_7760.start = true
  L3_7762 = A1_7760.rrender
  if not L3_7762 then
    return
  end
  A0_7759.scenario = A1_7760
  Director:RunWithScene(L3_7762)
  GarbageCollect()
  SpriteFrameCache:RemoveUnusedSpriteFrames()
  TextureCache:RemoveUnusedTextures()
  if L2_7761 then
    L2_7761.stop = true
  end
end
function World.Quit(A0_7763)
  Director:End()
end
function World.Restart(A0_7764)
  Scheduler:Unschedule(A0_7764.oSync2Serviece)
  Scheduler:Unschedule(A0_7764.oUpdateMultiple)
  Application:RestartWithFile("Script/Main.nts")
end
function World.CheckAppIntegrity(A0_7765)
  if Platform ~= Platform_Android and Platform ~= Platform_IOS then
    return
  end
  if AppName() ~= Config.AppName then
    Director:End()
  end
  if AppPackageName() ~= Config.PackageName then
    Director:End()
  end
  if Platform ~= Platform_Android then
    return
  end
  if AppSignature() ~= Config.Signature then
    Director:End()
  end
  return
end
function World.OnSyncToService(A0_7766)
  SQLManager:SyncToService()
  if UniqueComponent("Model/interface.model").start then
    UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:CheckItemsExpire()
  end
end
function World.UpdateMultipleItems(A0_7767)
  if not UniqueComponent("Model/interface.model").start then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  Config.ExpMultiple = Setting:One(string.format("belong = %d and name = 'mexp'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) and tonumber(Setting:One(string.format("belong = %d and name = 'mexp'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).data) > os.time() and Config.OneNumber or Config.ZeroNumber
  Config.ExtraExpMultiple = Setting:One(string.format("belong = %d and name = 'sexp'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) and tonumber(Setting:One(string.format("belong = %d and name = 'sexp'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).data) > os.time() and Config.PointFive or Config.ZeroNumber
  Config.DropMultiple = Setting:One(string.format("belong = %d and name = 'mdrop'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) and tonumber(Setting:One(string.format("belong = %d and name = 'mdrop'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).data) > os.time() and Config.OneNumber or Config.ZeroNumber
  Config.ExtraDropMultiple = Setting:One(string.format("belong = %d and name = 'sdrop'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) and tonumber(Setting:One(string.format("belong = %d and name = 'sdrop'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).data) > os.time() and Config.PointFive or Config.ZeroNumber
  if Config.ExpMultiple == 0 then
    UniqueComponent("Model/interface.model").ui.istatusicon.Statusicon:UnsetIcon(4100002)
  end
  if Config.ExtraExpMultiple == 0 then
    UniqueComponent("Model/interface.model").ui.istatusicon.Statusicon:UnsetIcon(4101000)
  end
  if Config.DropMultiple == 0 then
    UniqueComponent("Model/interface.model").ui.istatusicon.Statusicon:UnsetIcon(4110002)
  end
  if Config.ExtraDropMultiple == 0 then
    UniqueComponent("Model/interface.model").ui.istatusicon.Statusicon:UnsetIcon(4101002)
  end
  if not Setting:One(string.format("belong = %d and name = 'amulet'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) or tonumber(Setting:One(string.format("belong = %d and name = 'amulet'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).data) < os.time() then
    UniqueComponent("Model/interface.model").ui.istatusicon.Statusicon:UnsetIcon(4120000)
  end
end
function World.DataException(A0_7768, A1_7769)
  local L2_7770
  if A1_7769 == "sql_data" then
    L2_7770 = SQLManager
    L2_7770 = L2_7770.SyncToService
    L2_7770(L2_7770)
    return
  end
  L2_7770 = Account
  L2_7770 = L2_7770.Find
  L2_7770 = L2_7770(L2_7770)
  for _FORV_6_, _FORV_7_ in pairs(L2_7770) do
    _FORV_7_.ban = 1
    _FORV_7_.ban_comment = A1_7769
  end
  SQLManager:SyncToService()
end
function World.WasteOpHandle(A0_7771)
  local L1_7772, L2_7773, L3_7774
  L1_7772 = UniqueComponent
  L2_7773 = "Model/interface.model"
  L1_7772 = L1_7772(L2_7773)
  L2_7773 = L1_7772.start
  if not L2_7773 then
    return
  end
  A0_7771.wop_count = 0
  A0_7771.wop_tick = nil
  L2_7773 = L1_7772.parent
  if L2_7773 then
    L3_7774 = L2_7773.info
    L3_7774 = L3_7774.force_map
    if L3_7774 then
      return
    end
  end
  L3_7774 = SceneCache
  L3_7774 = L3_7774.World
  L3_7774 = L3_7774(L3_7774)
  L3_7774.y = 0
  L3_7774.users.Users:Refresh()
  A0_7771:Launch(L3_7774)
end
function World.WasteOperation(A0_7775, A1_7776)
  local L2_7777
  L2_7777 = A0_7775.wop_tick
  if not L2_7777 then
    L2_7777 = MillisecondOfDay()
    A0_7775.wop_tick = L2_7777
  end
  A0_7775.wop_count = (A0_7775.wop_count or 0) + A1_7776
  if (A0_7775.wop_count or 0) + A1_7776 >= Config.WasteOperation then
    A0_7775:WasteOpHandle()
    return
  end
  if MillisecondOfDay() - L2_7777 < Config.WasteOperationTick then
    return
  end
  A0_7775.wop_count = 0
  A0_7775.wop_tick = MillisecondOfDay()
end
function World.CheckErrorCode(A0_7778, A1_7779)
  local L2_7780, L3_7781
  L2_7780 = A0_7778.response_fail
  if A1_7779 == -1 then
    L3_7781 = L2_7780 + 1
  else
    L2_7780 = L3_7781 or 0
  end
  A0_7778.response_fail = L2_7780
  if L2_7780 > 4 then
    L3_7781 = true
    return L3_7781
  end
  if A1_7779 == 100000 then
    L3_7781 = true
    return L3_7781
  end
  if A1_7779 == 100001 then
    L3_7781 = true
    return L3_7781
  end
  if A1_7779 == 100002 then
    L3_7781 = true
    return L3_7781
  end
  if A1_7779 == 100003 then
    L3_7781 = true
    return L3_7781
  end
  if A1_7779 == 100200 then
    L3_7781 = true
    return L3_7781
  end
  if A1_7779 == 400500 then
    L3_7781 = true
    return L3_7781
  end
  if A1_7779 == 400600 then
    L3_7781 = true
    return L3_7781
  end
  if A1_7779 == 400601 then
    L3_7781 = true
    return L3_7781
  end
end
function World.OnResponseFire(A0_7782, A1_7783, A2_7784)
  local L3_7785
  L3_7785 = SceneCache
  L3_7785 = L3_7785.World
  L3_7785 = L3_7785(L3_7785)
  if L3_7785.start then
    return
  end
  if not A0_7782:CheckErrorCode(A1_7783) then
    return
  end
  L3_7785.y = 0
  World:Launch(L3_7785)
end
function World.EnterBackground(A0_7786)
  Event:Fire("EnterBackground")
  Sound:PauseAllEffects()
  Sound:PauseBackgroundMusic()
end
function World.EnterForeground(A0_7787)
  Event:Fire("EnterForeground")
  Sound:ResumeAllEffects()
  Sound:ResumeBackgroundMusic()
end
function World.MemoryWarning(A0_7788)
  Event:Fire("MemoryWarning")
  GarbageCollect()
  SpriteFrameCache:RemoveUnusedSpriteFrames()
  TextureCache:RemoveUnusedTextures()
end
function World.Destructor(A0_7789)
  Application:Off("EnterBackground", A0_7789.oEnterBackground)
  Application:Off("EnterForeground", A0_7789.oEnterForeground)
  Application:Off("MemoryWarning", A0_7789.oMemoryWarning)
end
Global.World = World()
