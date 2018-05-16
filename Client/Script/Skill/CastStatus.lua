L0_8360 = Class
L0_8360 = L0_8360.CastStatus
L0_8360 = L0_8360.Component
L0_8360({})
L0_8360 = {true, 0}
function CastStatus.Constructor(A0_8361, A1_8362, A2_8363)
  Component.Constructor(A0_8361)
  A0_8361.name = "cast_status"
  A0_8361.on = {
    "Parent",
    A0_8361,
    CastStatus.on_set_parent_fire
  }
end
function CastStatus.class_get(A0_8364)
  local L1_8365
  L1_8365 = "CastStatus"
  return L1_8365
end
function CastStatus.on_skill_execute_fire(A0_8366)
  local L1_8367, L2_8368, L3_8369, L4_8370
  L1_8367 = A0_8366.parent
  if not L1_8367 then
    return
  end
  L2_8368 = L1_8367.info
  L3_8369 = L1_8367.parent
  if not L3_8369 then
    return
  end
  L4_8370 = L2_8368.type
  if L4_8370 == "attack" then
    L4_8370 = "AttackAfter"
  else
    L4_8370 = L4_8370 or "CastSkillAfter"
  end
  L3_8369.fire = L4_8370
  L0_8360[1] = L3_8369
  L4_8370 = L2_8368.status_id
  L0_8360[2] = L4_8370
  L4_8370 = L0_8360
  L3_8369.attach_status = L4_8370
end
function CastStatus.on_set_parent_fire(A0_8371)
  local L1_8372
  L1_8372 = A0_8371.parent
  if not L1_8372 then
    return
  end
  L1_8372.on = {
    "execute",
    A0_8371,
    CastStatus.on_skill_execute_fire
  }
end
