Class.CastGuard.Component({})
function CastGuard.Constructor(A0_8152, A1_8153, A2_8154)
  Component.Constructor(A0_8152)
  A0_8152.name = "cast_guard"
  A0_8152.on = {
    "Parent",
    A0_8152,
    CastGuard.on_set_parent_fire
  }
end
function CastGuard.class_get(A0_8155)
  local L1_8156
  L1_8156 = "CastGuard"
  return L1_8156
end
function CastGuard.is_active_get(A0_8157)
  local L1_8158, L2_8159, L3_8160
  L1_8158 = A0_8157.parent
  if not L1_8158 then
    return
  end
  L2_8159 = L1_8158.info
  if not L2_8159 then
    return
  end
  L3_8160 = L1_8158.parent
  if not L3_8160 then
    return
  end
  if L3_8160.data.level < (L2_8159.req_level or 0) then
    return
  end
  if L2_8159.shield_limit == true then
    return UniqueComponent("Model/interface.model").ui.iuserinfo.assistant.item and UniqueComponent("Model/interface.model").ui.iuserinfo.assistant.item.stype == "shield" or false
  end
  return true
end
function CastGuard.on_under_attack_fire(A0_8161, A1_8162, A2_8163)
  local L3_8164, L4_8165
  L3_8164 = A0_8161.parent
  if not L3_8164 then
    return
  end
  L4_8165 = L3_8164.info
  if not L4_8165 then
    return
  end
  if A1_8162.data.level < (L4_8165.req_level or 0) then
    return
  end
  if not A0_8161.is_active then
    return
  end
  if math.random(1, 10000) > (L4_8165.percent + math.min(A1_8162.data.level - (L4_8165.req_level or 0), L4_8165.max_level or 0) * (L4_8165.lpercent or 0)) * 100 then
    return
  end
  A2_8163.result = -1
  L3_8164.fire = "cast"
end
function CastGuard.on_set_parent_fire(A0_8166)
  local L1_8167, L2_8168
  L1_8167 = A0_8166.parent
  if not L1_8167 then
    return
  end
  L2_8168 = L1_8167.parent
  if not L2_8168 then
    return
  end
  L2_8168.on = {
    "UnderAttackBefore",
    A0_8166,
    CastGuard.on_under_attack_fire,
    -1
  }
end
