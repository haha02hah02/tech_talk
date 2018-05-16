Class.CastSummon.Component({})
function CastSummon.Constructor(A0_8373, A1_8374, A2_8375)
  Component.Constructor(A0_8373)
  A0_8373.name = "cast_summon"
  A0_8373.on = {
    "Parent",
    A0_8373,
    CastSummon.on_set_parent_fire
  }
end
function CastSummon.class_get(A0_8376)
  local L1_8377
  L1_8377 = "CastSummon"
  return L1_8377
end
function CastSummon.mob_summon_set(A0_8378, A1_8379, A2_8380, A3_8381)
  local L4_8382, L5_8383, L6_8384, L7_8385
  L4_8382 = A2_8380.parent
  L5_8383 = L4_8382.parent
  L6_8384 = string
  L6_8384 = L6_8384.format
  L7_8385 = "%s_%d"
  L6_8384 = L6_8384(L7_8385, A2_8380.name, math.random(1, 1000))
  L7_8385 = L4_8382.child
  L7_8385 = L7_8385.all
  while L7_8385[L6_8384] do
    L6_8384 = string.format("%s_%d", A2_8380.name, math.random(1, 1000))
  end
  if Mob(L6_8384, A3_8381, A2_8380.x, A2_8380.y - A2_8380.height / 2 + 1, true) then
    L5_8383.mob = Mob(L6_8384, A3_8381, A2_8380.x, A2_8380.y - A2_8380.height / 2 + 1, true)
  end
end
function CastSummon.on_skill_execute_fire(A0_8386)
  local L1_8387, L2_8388, L3_8389, L4_8390, L5_8391, L6_8392, L7_8393, L8_8394
  L1_8387 = A0_8386.parent
  if not L1_8387 then
    return
  end
  L2_8388 = L1_8387.info
  L3_8389 = L2_8388.summon
  if not L3_8389 then
    return
  end
  L3_8389 = L1_8387.parent
  if not L3_8389 then
    return
  end
  if L4_8390 == "attack" then
  else
  end
  L3_8389.fire = L4_8390
  if L4_8390 == "number" then
    L7_8393 = L3_8389
    L8_8394 = L2_8388.summon
    L4_8390(L5_8391, L6_8392, L7_8393, L8_8394)
    return
  end
  for L7_8393, L8_8394 in L4_8390(L5_8391) do
    CastSummon.mob_summon_set(A0_8386, "mob_summon", L3_8389, L8_8394)
  end
end
function CastSummon.on_set_parent_fire(A0_8395)
  local L1_8396
  L1_8396 = A0_8395.parent
  if not L1_8396 then
    return
  end
  L1_8396.on = {
    "execute",
    A0_8395,
    CastSummon.on_skill_execute_fire
  }
end
