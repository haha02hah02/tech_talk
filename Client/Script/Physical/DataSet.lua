Class.DataSet.Component({})
function DataSet.Constructor(A0_4257)
  Component.Constructor(A0_4257)
  A0_4257.on = {
    "Parent",
    A0_4257,
    DataSet.on_parent_fire
  }
  A0_4257.on = {
    "BeforeParent",
    A0_4257,
    DataSet.on_before_parent_fire
  }
end
function DataSet.class_get(A0_4258)
  local L1_4259
  L1_4259 = "DataSet"
  return L1_4259
end
function DataSet.on_map_set_fire(A0_4260, A1_4261)
  local L2_4262, L3_4263, L5_4264, L6_4265
  L2_4262 = A1_4261.parent
  if not L2_4262 then
    return
  end
  L3_4263 = L2_4262.parent
  L5_4264 = L3_4263.info
  L6_4265 = Userinfo
  L6_4265 = L6_4265.One
  L6_4265 = L6_4265(L6_4265, string.format("serial = %d", A1_4261.name))
  if not L6_4265 then
    return
  end
  if L5_4264.force_map then
    return
  end
  L6_4265.map = L3_4263.id
end
function DataSet.on_avatar_fire(A0_4266, A1_4267, A2_4268, A3_4269)
  local L4_4270, L5_4271
  L4_4270 = A0_4266.parent
  if not L4_4270 then
    return
  end
  L5_4271 = Userinfo
  L5_4271 = L5_4271.One
  L5_4271 = L5_4271(L5_4271, string.format("serial = %d", L4_4270.name))
  if L5_4271 then
    L5_4271[A2_4268] = A3_4269
  end
  UniqueComponent("Model/interface.model").node.figure.copy = L4_4270.proxy
end
function DataSet.on_status_fire(A0_4272, A1_4273)
  if A1_4273.status ~= STATUS_DIE then
    return
  end
  Sound:PlayEffect("Music/Game/Death.mp3")
  A1_4273.data.hp = 50
  if not Setting:One(string.format("belong = %d and name = 'amulet'", A1_4273.name)) or tonumber(Setting:One(string.format("belong = %d and name = 'amulet'", A1_4273.name)).data) < os.time() then
    A1_4273.data.inc_exp = -math.floor(LoadConf("Config/Levels.conf")[A1_4273.data.level] * Config.DieExpPercent)
  end
  UniqueComponent("Model/interface.model").ui.ideath.visible = true
  Userinfo:One(string.format("serial = %d", A1_4273.name)).map = A1_4273.parent.parent.info.major_city or A1_4273.parent.parent.id
  SQLManager:SyncToService()
end
function DataSet.on_level_fire(A0_4274, A1_4275)
  local L2_4276, L3_4277, L4_4278
  L2_4276 = UniqueComponent
  L3_4277 = "Model/interface.model"
  L2_4276 = L2_4276(L3_4277)
  L3_4277 = L2_4276.parent
  if not L3_4277 then
    return
  end
  L4_4278 = L3_4277.physical
  L4_4278 = L4_4278[L3_4277.focus_object]
  L4_4278.data.hp = L4_4278.data.max_hp
  L4_4278.data.mp = L4_4278.data.max_mp
  Levels().level = 1
  Levels().belong = L4_4278.name
  Levels().map = L3_4277.id
  L2_4276.node.Interface:RefreshStatus(L4_4278)
  if L4_4278.proxy["Common/LevelUp"] then
    L4_4278.proxy["Common/LevelUp"].parent = nil
  end
  Effect("Common/LevelUp").name = "Common/LevelUp"
  Effect("Common/LevelUp").direction = false
  Effect("Common/LevelUp").parent, Effect("Common/LevelUp").y = L4_4278.proxy, -32
  Sound:PlayEffect("Music/Game/LevelUp.mp3")
end
function DataSet.on_data_modify_fire(A0_4279, A1_4280)
  local L2_4281, L3_4282, L4_4283
  L2_4281 = UniqueComponent
  L3_4282 = "Model/interface.model"
  L2_4281 = L2_4281(L3_4282)
  L3_4282 = L2_4281.parent
  L4_4283 = L2_4281.start
  if not L4_4283 or not L3_4282 then
    return
  end
  L4_4283 = L3_4282.physical
  L4_4283 = L4_4283[L3_4282.focus_object]
  L2_4281.node.Interface:RefreshStatus(L4_4283)
  if not Userinfo:One(string.format("serial = %d", L4_4283.name)) then
    return
  end
  Userinfo:One(string.format("serial = %d", L4_4283.name)).hp = L4_4283.data.hp
  Userinfo:One(string.format("serial = %d", L4_4283.name)).mp = L4_4283.data.mp
  Userinfo:One(string.format("serial = %d", L4_4283.name)).exp = L4_4283.data.exp
end
function DataSet.on_update_fire(A0_4284, A1_4285, A2_4286)
  local L3_4287, L4_4288, L5_4289, L6_4290
  L3_4287 = A1_4285.alert
  if L3_4287 == true then
    L3_4287 = A1_4285.alert_tick
    L3_4287 = L3_4287 - A2_4286
    if L3_4287 <= 0 then
      L4_4288 = 0
    else
      L4_4288 = L4_4288 or L3_4287
    end
    A1_4285.alert_tick = L4_4288
    if L3_4287 <= 0 then
      A1_4285.alert = false
    end
  end
  L3_4287 = A1_4285.transfer
  if not L3_4287 then
    return
  end
  A1_4285.transfer = nil
  L4_4288 = A1_4285.parent
  L4_4288 = L4_4288.parent
  L5_4289 = L4_4288.id
  L6_4290 = L3_4287.tm
  if L5_4289 == L6_4290 then
    L5_4289 = L4_4288.portals
    L6_4290 = L3_4287.tn
    L5_4289 = L5_4289[L6_4290]
    if not L5_4289 then
      return
    end
    L6_4290 = STATUS_FALL
    A1_4285.status = L6_4290
    L6_4290 = {
      L5_4289.x,
      L5_4289.y + A1_4285.height
    }
    A1_4285.position = L6_4290
    return
  end
  L4_4288.cant_update = true
  L5_4289 = L4_4288.limit_status
  L6_4290 = SceneByID
  L6_4290 = L6_4290(L3_4287.tm)
  A1_4285.init_x = (L6_4290.portals[L3_4287.tn] or L6_4290.drop_point).x
  A1_4285.init_y = (L6_4290.portals[L3_4287.tn] or L6_4290.drop_point).y + A1_4285.height
  A1_4285.parent = L6_4290.physical
  A1_4285.unlimit_status = L5_4289
  L6_4290.focus_object = A1_4285.name
  World:Launch(L6_4290)
  A1_4285.stand = nil
  A1_4285.status = STATUS_FALL
end
function DataSet.on_before_parent_fire(A0_4291)
  local L1_4292, L2_4293
  L1_4292 = A0_4291.parent
  if not L1_4292 then
    return
  end
  L2_4293 = {
    "Parent",
    A0_4291,
    DataSet.on_map_set_fire
  }
  L1_4292.off = L2_4293
  L2_4293 = {
    "AvatarModify",
    A0_4291,
    DataSet.on_avatar_fire
  }
  L1_4292.off = L2_4293
  L2_4293 = {
    "Status",
    A0_4291,
    DataSet.on_status_fire
  }
  L1_4292.off = L2_4293
  L2_4293 = {
    "Update",
    A0_4291,
    DataSet.on_update_fire
  }
  L1_4292.off = L2_4293
  L2_4293 = L1_4292.data
  L2_4293.off = {
    "level",
    A0_4291,
    DataSet.on_level_fire
  }
  L2_4293 = L1_4292.data
  L2_4293.off = {
    "modify",
    A0_4291,
    DataSet.on_data_modify_fire
  }
end
function DataSet.on_parent_fire(A0_4294)
  local L1_4295, L2_4296
  L1_4295 = A0_4294.parent
  if not L1_4295 then
    return
  end
  L2_4296 = {
    "Parent",
    A0_4294,
    DataSet.on_map_set_fire
  }
  L1_4295.on = L2_4296
  L2_4296 = {
    "AvatarModify",
    A0_4294,
    DataSet.on_avatar_fire
  }
  L1_4295.on = L2_4296
  L2_4296 = {
    "Status",
    A0_4294,
    DataSet.on_status_fire
  }
  L1_4295.on = L2_4296
  L2_4296 = {
    "Update",
    A0_4294,
    DataSet.on_update_fire,
    1
  }
  L1_4295.on = L2_4296
  L2_4296 = L1_4295.data
  L2_4296.on = {
    "level",
    A0_4294,
    DataSet.on_level_fire
  }
  L2_4296 = L1_4295.data
  L2_4296.on = {
    "modify",
    A0_4294,
    DataSet.on_data_modify_fire
  }
end
