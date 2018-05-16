L0_5695 = Class
L0_5695 = L0_5695.UnderAttack
L0_5695 = L0_5695.Component
L0_5695({})
L0_5695 = {true, 0}
function UnderAttack.Constructor(A0_5696)
  Component.Constructor(A0_5696)
  A0_5696.name = "under_attack"
  A0_5696.on = {
    "Parent",
    A0_5696,
    UnderAttack.on_parent_fire
  }
end
function UnderAttack.class_get(A0_5697)
  local L1_5698
  L1_5698 = "UnderAttack"
  return L1_5698
end
function UnderAttack.tick_count_get(A0_5699)
  return rawget(A0_5699, "tick_count") or 0
end
function UnderAttack.tick_count_set(A0_5700, A1_5701, A2_5702)
  rawset(A0_5700, "tick_count", A2_5702)
end
function UnderAttack.little_jump_set(A0_5703, A1_5704, A2_5705)
  local L3_5706
  L3_5706 = A0_5703.parent
  if not L3_5706 then
    return
  end
  L0_5695[1] = A2_5705
  L3_5706.attach_status = L0_5695
end
function UnderAttack.on_under_attack(A0_5707, A1_5708, A2_5709)
  local L3_5710
  L3_5710 = A0_5707.parent
  if not L3_5710 then
    return
  end
  if A2_5709.result == 0 then
    return
  end
  if MillisecondOfDay() - A0_5707.tick_count < 2400 then
    return
  end
  if L3_5710.status ~= STATUS_STAND and L3_5710.status ~= STATUS_WALK then
    return
  end
  A0_5707.tick_count = MillisecondOfDay()
  A0_5707.status = STATUS_JUMP
  A0_5707.little_jump = A2_5709.producer
end
function UnderAttack.on_parent_fire(A0_5711)
  local L1_5712
  L1_5712 = A0_5711.parent
  if not L1_5712 then
    return
  end
  L1_5712.on = {
    "UnderAttack",
    A0_5711,
    UnderAttack.on_under_attack
  }
end
