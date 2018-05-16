L0_8034 = Class
L0_8034 = L0_8034.CastCleanBuff
L0_8034 = L0_8034.Component
L0_8034({})
L0_8034 = {}
function CastCleanBuff.Constructor(A0_8035, A1_8036, A2_8037)
  Component.Constructor(A0_8035)
  A0_8035.name = "cast_clean_buff"
  A0_8035.on = {
    "Parent",
    A0_8035,
    CastCleanBuff.on_set_parent_fire
  }
end
function CastCleanBuff.class_get(A0_8038)
  local L1_8039
  L1_8039 = "CastCleanBuff"
  return L1_8039
end
function CastCleanBuff.clean_buff_set(A0_8040, A1_8041, A2_8042)
  local L3_8043
  L3_8043 = A2_8042.attach_status
  if not L3_8043 then
    return
  end
  for _FORV_7_, _FORV_8_ in pairs(L3_8043) do
    if _FORV_8_.info.type == "buff" then
      A2_8042.unattach_status = _FORV_7_
    end
  end
end
function CastCleanBuff.on_skill_execute_fire(A0_8044)
  local L1_8045, L2_8046, L3_8047, L4_8048, L5_8049, L6_8050
  L1_8045 = A0_8044.parent
  if not L1_8045 then
    return
  end
  L2_8046 = L1_8045.info
  L3_8047 = L1_8045.parent
  if not L3_8047 then
    return
  end
  L4_8048 = L3_8047.parent
  L4_8048 = L4_8048.parent
  if not L4_8048 then
    return
  end
  L5_8049 = SkillSearchArg
  L6_8050 = L3_8047
  L5_8049 = L5_8049(L6_8050, L2_8046)
  L4_8048.search_args = L5_8049
  L6_8050 = L4_8048.search
  if not L2_8046.multiple then
    if not L6_8050 then
      L3_8047.fire = L2_8046.type == "attack" and "AttackAfter" or "CastSkillAfter"
      CheckWasteop(L3_8047)
      return
    end
    L1_8045.hit_effect.attach = L6_8050
    L1_8045.hit_sound.attach = true
    A0_8044.clean_buff = L6_8050
    return
  end
  if #L6_8050 == Config.ZeroNumber then
    L3_8047.fire = L2_8046.type == "attack" and "AttackAfter" or "CastSkillAfter"
    A0_8044.check_wasteop = L3_8047
    return
  end
  L1_8045.hit_sound.attach = true
  L0_8034[2] = true
  for _FORV_14_, _FORV_15_ in ipairs(L6_8050) do
    L0_8034[1] = _FORV_15_
    L1_8045.hit_effect.attach = L0_8034
    A0_8044.clean_buff = _FORV_15_
  end
  L3_8047.fire = L2_8046.type == "attack" and "AttackAfter" or "CastSkillAfter"
end
function CastCleanBuff.on_set_parent_fire(A0_8051)
  local L1_8052
  L1_8052 = A0_8051.parent
  if not L1_8052 then
    return
  end
  L1_8052.on = {
    "execute",
    A0_8051,
    CastCleanBuff.on_skill_execute_fire
  }
end
