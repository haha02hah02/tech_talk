Class.StandAttackAways.Component({})
function StandAttackAways.Constructor(A0_5596)
  Component.Constructor(A0_5596)
  A0_5596.name = "stand_attack"
  A0_5596.limit_status = LimitStatus(true, true, true)
  A0_5596.on = {
    "Start",
    A0_5596,
    StandAttackAways.on_start_fire
  }
  A0_5596.on = {
    "Stop",
    A0_5596,
    StandAttackAways.on_stop_fire
  }
end
function StandAttackAways.class_get(A0_5597)
  local L1_5598
  L1_5598 = "StandAttackAways"
  return L1_5598
end
function StandAttackAways.limit_status_get(A0_5599)
  return rawget(A0_5599, "limit_status")
end
function StandAttackAways.limit_status_set(A0_5600, A1_5601, A2_5602)
  rawset(A0_5600, "limit_status", A2_5602)
end
function StandAttackAways.tick_count_get(A0_5603, A1_5604)
  return rawget(A0_5603, "tick_count") or 0
end
function StandAttackAways.tick_count_set(A0_5605, A1_5606, A2_5607)
  rawset(A0_5605, "tick_count", A2_5607)
end
function StandAttackAways.limit_status_on_get(A0_5608, A1_5609)
  return rawget(A0_5608, "limit_status_on")
end
function StandAttackAways.limit_status_on_set(A0_5610, A1_5611, A2_5612)
  rawset(A0_5610, "limit_status_on", A2_5612)
end
function StandAttackAways.on_status_fire(A0_5613, A1_5614)
  local L2_5615
  L2_5615 = A1_5614.status
  if L2_5615 == STATUS_STAND then
    return
  end
  L2_5615 = A0_5613.limit_status_on
  if not L2_5615 then
    return
  end
  A0_5613.tick_count = 0
  A0_5613.limit_status_on = false
  L2_5615 = A0_5613.limit_status
  A1_5614.unlimit_status = L2_5615
end
function StandAttackAways.on_update_fire(A0_5616, A1_5617, A2_5618)
  local L3_5619
  L3_5619 = A0_5616.limit_status_on
  if L3_5619 then
    return
  end
  L3_5619 = A0_5616.tick_count
  L3_5619 = L3_5619 + A2_5618
  A0_5616.tick_count = L3_5619
  if L3_5619 < 300 then
    return
  end
  A0_5616.tick_count = 0
  A0_5616.limit_status_on = true
  A1_5617.limit_status = A0_5616.limit_status
end
function StandAttackAways.on_start_fire(A0_5620)
  local L1_5621, L2_5622
  L1_5621 = A0_5620.parent
  if not L1_5621 then
    return
  end
  L2_5622 = {
    "Status",
    A0_5620,
    StandAttackAways.on_status_fire
  }
  L1_5621.on = L2_5622
  L2_5622 = {
    "Update",
    A0_5620,
    StandAttackAways.on_update_fire
  }
  L1_5621.on = L2_5622
end
function StandAttackAways.on_stop_fire(A0_5623)
  local L1_5624, L2_5625
  L1_5624 = A0_5623.parent
  if not L1_5624 then
    return
  end
  L2_5625 = {
    "Status",
    A0_5623,
    StandAttackAways.on_status_fire
  }
  L1_5624.off = L2_5625
  L2_5625 = {
    "Update",
    A0_5623,
    StandAttackAways.on_update_fire
  }
  L1_5624.off = L2_5625
end
