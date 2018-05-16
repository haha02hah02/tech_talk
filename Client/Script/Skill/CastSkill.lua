Class.CastSkill.Component({})
function CastSkill.Constructor(A0_8266, A1_8267, A2_8268, A3_8269)
  local L4_8270
  L4_8270 = Component
  L4_8270 = L4_8270.Constructor
  L4_8270(A0_8266)
  A0_8266.info = A3_8269
  L4_8270 = A3_8269.priority
  L4_8270 = L4_8270 or 0
  A0_8266.priority = L4_8270
  A0_8266.status = "end"
  A0_8266.id = A2_8268
  A0_8266.parent = A1_8267
  A0_8266.cd_time = 0
  L4_8270 = A3_8269.disable
  L4_8270 = not L4_8270
  A0_8266.enable = L4_8270
  L4_8270 = LimitStatus
  L4_8270 = L4_8270(A3_8269.operate, A3_8269.walkable, A3_8269.jumpable, A3_8269.attackable, A3_8269.skillable)
  A0_8266.limit_status = L4_8270
  L4_8270 = A3_8269.script
  if not L4_8270 then
    return
  end
  L4_8270 = Global
  L4_8270 = L4_8270[string.format("skill_%d", A3_8269.script)]
  if L4_8270 then
    L4_8270(A0_8266, A1_8267, A3_8269)
  end
end
function CastSkill.class_get(A0_8271)
  local L1_8272
  L1_8272 = "Skill"
  return L1_8272
end
function CastSkill.id_get(A0_8273)
  return rawget(A0_8273, "id")
end
function CastSkill.id_set(A0_8274, A1_8275, A2_8276)
  A0_8274.name = string.format("skill_%d", A2_8276)
  rawset(A0_8274, "id", A2_8276)
end
function CastSkill.info_get(A0_8277)
  return rawget(A0_8277, "info")
end
function CastSkill.info_set(A0_8278, A1_8279, A2_8280)
  rawset(A0_8278, "info", A2_8280)
end
function CastSkill.type_get(A0_8281)
  local L1_8282, L2_8283
  L1_8282 = A0_8281.info
  L2_8283 = L1_8282 and L1_8282.type
  return L2_8283
end
function CastSkill.priority_get(A0_8284)
  return rawget(A0_8284, "priority") or 0
end
function CastSkill.priority_set(A0_8285, A1_8286, A2_8287)
  rawset(A0_8285, "priority", A2_8287)
end
function CastSkill.cd_time_get(A0_8288)
  return rawset(A0_8288, "cd_time")
end
function CastSkill.cd_time_set(A0_8289, A1_8290, A2_8291)
  rawset(A0_8289, "cd_time", A2_8291)
end
function CastSkill.cd_get(A0_8292)
  return math.max(A0_8292.cd_time - MillisecondOfDay(), 0) / 1000
end
function CastSkill.cd_set(A0_8293, A1_8294, A2_8295)
  A0_8293.cd_time = MillisecondOfDay() + A2_8295 * 1000
end
function CastSkill.need_mp_get(A0_8296)
  local L1_8297
  L1_8297 = A0_8296.info
  return (L1_8297.mp or 0) + math.min(A0_8296.parent.data.level - (L1_8297.req_level or 0), L1_8297.max_level or 0) * (L1_8297.lmp or 0)
end
function CastSkill.limit_status_get(A0_8298)
  return rawget(A0_8298, "limit_status")
end
function CastSkill.limit_status_set(A0_8299, A1_8300, A2_8301)
  rawset(A0_8299, "limit_status", A2_8301)
end
function CastSkill.status_get(A0_8302)
  return rawget(A0_8302, "status")
end
function CastSkill.status_set(A0_8303, A1_8304, A2_8305)
  rawset(A0_8303, "status", A2_8305)
end
function CastSkill.equip_set(A0_8306, A1_8307, A2_8308)
  A0_8306.fire = "equip"
end
function CastSkill.unequip_set(A0_8309, A1_8310, A2_8311)
  A0_8309.fire = "unequip"
end
function CastSkill.enable_get(A0_8312)
  return rawget(A0_8312, "enable")
end
function CastSkill.enable_set(A0_8313, A1_8314, A2_8315)
  local L3_8316
  if A2_8315 then
    L3_8316 = true
  else
    L3_8316 = L3_8316 or false
  end
  if A0_8313.enable == L3_8316 then
    return
  end
  rawset(A0_8313, "enable", L3_8316)
  A0_8313.fire = "enable"
end
function CastSkill.check_get(A0_8317)
  local L1_8318, L2_8319, L3_8320, L4_8321, L5_8322, L6_8323, L7_8324, L8_8325, L9_8326, L10_8327, L11_8328, L12_8329, L13_8330, L14_8331
  L1_8318 = A0_8317.cd
  if L1_8318 ~= 0 then
    L1_8318 = false
    return L1_8318
  end
  L1_8318 = A0_8317.info
  L2_8319 = A0_8317.parent
  L3_8320 = L2_8319.parent
  L3_8320 = L3_8320.parent
  L4_8321 = L2_8319.position
  L5_8322 = L1_8318.offset
  if L5_8322 then
    L6_8323 = L5_8322.x
  else
    L6_8323 = L6_8323 or 0
  end
  if L5_8322 then
    L7_8324 = L5_8322.y
  else
    L7_8324 = L7_8324 or 0
  end
  L8_8325 = L2_8319.direction
  if L8_8325 ~= "left" or not L6_8323 then
    L6_8323 = -L6_8323
  end
  L8_8325 = L1_8318.width
  L8_8325 = L8_8325 / 2
  L9_8326 = L1_8318.height
  L9_8326 = L9_8326 / 2
  L10_8327 = L4_8321.x
  L10_8327 = L10_8327 - L8_8325
  L10_8327 = L10_8327 + L6_8323
  L11_8328 = L4_8321.x
  L11_8328 = L11_8328 + L8_8325
  L11_8328 = L11_8328 + L6_8323
  L12_8329 = L4_8321.y
  L12_8329 = L12_8329 + L9_8326
  L12_8329 = L12_8329 + L7_8324
  L13_8330 = L4_8321.y
  L13_8330 = L13_8330 - L9_8326
  L13_8330 = L13_8330 + L7_8324
  L14_8331 = {
    L10_8327,
    L11_8328,
    L12_8329,
    L13_8330,
    L2_8319.hate_type,
    nil,
    L2_8319.direction
  }
  L3_8320.search_args = L14_8331
  L14_8331 = L3_8320.search
  return L14_8331 ~= nil
end
function CastSkill.active_get(A0_8332)
  local L1_8333, L2_8334
  L1_8333 = A0_8332.cd
  if L1_8333 ~= 0 then
    return
  end
  L1_8333 = A0_8332.info
  L2_8334 = A0_8332.parent
  if L1_8333.req_level and L2_8334.data.level < L1_8333.req_level then
    return
  end
  if not L1_8333.action or L1_8333.type == "auto" then
    return
  end
  if not A0_8332.cast_action then
    return
  end
  if L1_8333.status_limit and not L2_8334.attach_status[L1_8333.status_limit] then
    return
  end
  if L1_8333.item_limit and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ItemByID(L1_8333.item_limit) then
    return
  end
  return (L1_8333.mp or 0) + math.min(L2_8334.data.level - (L1_8333.req_level or 0), L1_8333.max_level or 0) * (L1_8333.lmp or 0) <= L2_8334.data.mp
end
function CastSkill.cast_set(A0_8335, A1_8336, A2_8337)
  local L3_8338, L4_8339
  L3_8338 = A0_8335.info
  L4_8339 = A0_8335.active
  if not L4_8339 then
    return
  end
  L4_8339 = A2_8337.proxy_status_limit
  if L4_8339 then
    return
  end
  L4_8339 = A0_8335.info
  L4_8339 = L4_8339.type
  if L4_8339 == "attack" then
    L4_8339 = "Attack"
  else
    L4_8339 = L4_8339 or "CastSkill"
  end
  if SessionObject.check_limit_status(A2_8337, L4_8339) then
    return
  end
  A0_8335.cd = (L3_8338.cd or 0) + math.min(A2_8337.data.level - (L3_8338.req_level or 0), L3_8338.max_level or 0) * (L3_8338.lcd or 0)
  A2_8337.data.inc_mp = -((L3_8338.mp or 0) + math.min(A2_8337.data.level - (L3_8338.req_level or 0), L3_8338.max_level or 0) * (L3_8338.lmp or 0))
  A0_8335.parent.proxy_status_limit = true
  A0_8335.parent.limit_status = A0_8335.limit_status
  A0_8335.status = "casting"
  A0_8335.fire = "cast"
  A0_8335.parent.fire = L4_8339
  if not L3_8338.item_limit then
    return
  end
  if UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ItemByID(L3_8338.item_limit) then
    UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ItemByID(L3_8338.item_limit).dec = 1
    return
  end
end
function CastSkill.interrupt_set(A0_8340, A1_8341, A2_8342)
  local L3_8343
  L3_8343 = A0_8340.status
  if L3_8343 ~= "casting" then
    return
  end
  L3_8343 = A0_8340.parent
  L3_8343.proxy_status_limit = false
  L3_8343.unlimit_status = A0_8340.limit_status
  A0_8340.fire = "interrupt"
  A0_8340.status = "interrupted"
end
function CastSkill.finish_set(A0_8344, A1_8345, A2_8346)
  local L3_8347
  L3_8347 = A0_8344.status
  if L3_8347 ~= "casting" then
    return
  end
  L3_8347 = A0_8344.parent
  L3_8347.proxy_status_limit = false
  L3_8347.unlimit_status = A0_8344.limit_status
  A0_8344.fire = "finish"
  A0_8344.status = "finish"
end
