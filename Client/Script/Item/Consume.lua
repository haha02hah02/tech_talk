Class.Consume.Item({})
function Consume.Constructor(A0_3504, A1_3505)
  Item.Constructor(A0_3504, A1_3505)
  if not A0_3504.info then
    return
  end
  A0_3504.script = Global[string.format("Item_%d", A0_3504.info.script)]
  A0_3504.script_arg = {
    A0_3504.info.script_arg
  }
end
function Consume.class_get(A0_3506)
  local L1_3507
  L1_3507 = "Consume"
  return L1_3507
end
function Consume.script_get(A0_3508, A1_3509)
  return rawget(A0_3508, "script")
end
function Consume.script_set(A0_3510, A1_3511, A2_3512)
  rawset(A0_3510, "script", A2_3512)
end
function Consume.script_arg_get(A0_3513, A1_3514)
  return rawget(A0_3513, "script_arg")
end
function Consume.script_arg_set(A0_3515, A1_3516, A2_3517)
  rawset(A0_3515, "script_arg", A2_3517)
end
function Consume.direct_use_set(A0_3518, A1_3519, A2_3520)
  local L3_3521
  L3_3521 = A0_3518.script
  if not L3_3521(A2_3520, A0_3518.script_arg, A0_3518) then
    return
  end
  Sound:PlayEffect(string.format("Music/Item/%0.8d.Use.mp3", A0_3518.id))
  A0_3518.amount = (A0_3518.amount or 1) - 1
  UniqueComponent("Model/interface.model").ui.ibackpack.fire = "Changed"
  if 1 < (A0_3518.amount or 1) then
    if A0_3518.info.network then
      SQLManager:SyncToService()
    end
    return
  end
  A0_3518.parent = nil
  A0_3518.view.parent = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:CleanSelectStatus()
  if A0_3518.info.network then
    SQLManager:SyncToService()
  end
  if not A0_3518.sql_object then
    return
  end
  A0_3518.sql_object.site = "expend"
  A0_3518.sql_object.slot = nil
end
function Consume.network_response(A0_3522, A1_3523, A2_3524)
  UniqueComponent("Model/interface.model").ui.iloading.visible = false
  if A1_3523 == -1 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(55)
    return
  end
  if A1_3523 ~= 0 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(55)
    SQLManager:SyncToService()
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  A0_3522.direct_use = UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object]
end
function Consume.use_set(A0_3525, A1_3526, A2_3527)
  if A2_3527.status == STATUS_DIE then
    return
  end
  if UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:FreeGrid() < (A0_3525.info.need_grid or 0) then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(41)
    return
  end
  if not A0_3525.script then
    return
  end
  if not A0_3525.info.network then
    A0_3525.direct_use = A2_3527
    return
  end
  if UniqueComponent("Model/interface.model").ui.iloading.visible then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(66)
    return
  end
  UniqueComponent("Model/interface.model").ui.iloading.visible = true
  AdventureSDK:MagicBox(A0_3525.serial, A0_3525, Consume.network_response)
end
