Class.LifeGame.Script({})
function LifeGame.Constructor(A0_6605, A1_6606)
  Script.Constructor(A0_6605, A1_6606)
  AdventureSDK:VersionCheck(UpdateVersionNumber(), A0_6605, A0_6605.CheckVersionCallBack)
end
function LifeGame.FadeOutAction(A0_6607)
  local L1_6608
  L1_6608 = Array
  L1_6608 = L1_6608()
  L1_6608:AddObject(OpacityTo(2.9, 0))
  L1_6608:AddObject(ActionInstant(Functor(A0_6607, A0_6607.AnimationEnd)))
  return Sequence(L1_6608)
end
function LifeGame.AnimationEnd(A0_6609)
  A0_6609:Parent().parent = nil
  if A0_6609.bNeedUpdate then
    A0_6609:Parent().parent.component = "Model/update.model"
    A0_6609:Parent().parent.update.visible = true
    return
  end
  A0_6609:Parent().parent.notice.visible = true
  FileUtils:RemoveFile(UpdateVersionFileName())
end
function LifeGame.CheckVersionCallBack(A0_6610, A1_6611, A2_6612)
  local L3_6613, L4_6614, L5_6615, L6_6616
  L4_6614 = A0_6610
  L3_6613 = A0_6610.Parent
  L3_6613 = L3_6613(L4_6614)
  L5_6615 = A0_6610
  L4_6614 = A0_6610.FadeOutAction
  L4_6614 = L4_6614(L5_6615)
  L3_6613.action = L4_6614
  if A1_6611 ~= 0 then
    return
  end
  L4_6614 = Global
  L5_6615 = {}
  L4_6614.tVerLogInfo = L5_6615
  L4_6614 = tVerLogInfo
  L5_6615 = A2_6612.size
  L4_6614.size = L5_6615
  L4_6614 = tVerLogInfo
  L5_6615 = A2_6612.version
  L5_6615 = L5_6615 - 1
  L4_6614.version = L5_6615
  L4_6614 = {}
  L5_6615 = tVerLogInfo
  L5_6615.context = L4_6614
  L5_6615 = A2_6612.log
  L6_6616 = L5_6615.First
  L6_6616 = L6_6616(L5_6615)
  while L6_6616 ~= nil do
    table.insert(L4_6614, L6_6616)
    L6_6616 = L5_6615:Next()
  end
  A0_6610.bNeedUpdate = true
end
function LifeGame.Destructor(A0_6617)
  local L1_6618
end
