Class.CastSwitchAttack.Component({})
function CastSwitchAttack.Constructor(A0_8397, A1_8398, A2_8399)
  Component.Constructor(A0_8397)
  A0_8397.name = "cast_switch_attack"
  A0_8397.on = {
    "Parent",
    A0_8397,
    CastSwitchAttack.on_set_parent_fire
  }
end
function CastSwitchAttack.class_get(A0_8400)
  local L1_8401
  L1_8401 = "CastSwitchAttack"
  return L1_8401
end
function CastSwitchAttack.source_attack_get(A0_8402)
  return rawget(A0_8402, "source_attack")
end
function CastSwitchAttack.source_attack_set(A0_8403, A1_8404, A2_8405)
  rawset(A0_8403, "source_attack", A2_8405)
end
function CastSwitchAttack.check_skill_enable_set(A0_8406)
  local L1_8407, L2_8408, L3_8409
  L1_8407 = A0_8406.parent
  if not L1_8407 then
    return
  end
  L2_8408 = L1_8407.info
  L3_8409 = L1_8407.parent
  if not L3_8409 then
    return
  end
  if not L2_8408.skill_enable then
    return
  end
  for _FORV_12_, _FORV_13_ in ipairs(L2_8408.skill_enable) do
    if (UniqueComponent("Model/interface.model").node.attack.tag == L2_8408.skill_id and true or false) == true then
      L3_8409.skill_enable = _FORV_13_
    else
      L3_8409.skill_disable = _FORV_13_
    end
  end
end
function CastSwitchAttack.check_skill_config_set(A0_8410)
  local L1_8411, L2_8412, L3_8413, L4_8414, L5_8415, L6_8416, L7_8417, L8_8418
  L1_8411 = A0_8410.parent
  if not L1_8411 then
    return
  end
  L2_8412 = L1_8411.info
  L3_8413 = L1_8411.parent
  if not L3_8413 then
    return
  end
  L4_8414 = L2_8412.skill_config
  if not L4_8414 then
    return
  end
  L4_8414 = UniqueComponent
  L5_8415 = "Model/interface.model"
  L4_8414 = L4_8414(L5_8415)
  L5_8415 = L4_8414.node
  L5_8415 = L5_8415.Interface
  L6_8416 = L4_8414.node
  L6_8416 = L6_8416.attack
  L6_8416 = L6_8416.tag
  L7_8417 = LoadConf
  L8_8418 = "Config/SkillSet.conf"
  L7_8417 = L7_8417(L8_8418)
  L8_8418 = L3_8413.data
  L8_8418 = L8_8418.job
  L8_8418 = L7_8417[L8_8418]
  L5_8415:SetJobSkillByConf(L6_8416 == L2_8412.skill_id and L2_8412.skill_config or L8_8418)
end
function CastSwitchAttack.on_skill_execute_fire(A0_8419)
  local L1_8420, L2_8421, L3_8422
  L1_8420 = A0_8419.parent
  if not L1_8420 then
    return
  end
  L2_8421 = L1_8420.info
  L3_8422 = L1_8420.parent
  if not L3_8422 then
    return
  end
  UniqueComponent("Model/interface.model").node.attack.tag = UniqueComponent("Model/interface.model").node.attack.tag == L2_8421.skill_id and math.floor(UniqueComponent("Model/interface.model").node.attack.tag / 100) * 100 or L2_8421.skill_id
  A0_8419.check_skill_enable = true
  A0_8419.check_skill_config = true
  L3_8422.fire = L2_8421.type == "attack" and "AttackAfter" or "CastSkillAfter"
  if not L2_8421.hide_weapon then
    return
  end
  L3_8422.proxy.weapon_visible = UniqueComponent("Model/interface.model").node.attack.tag == L2_8421.skill_id and L2_8421.hide_weapon or not L2_8421.hide_weapon
end
function CastSwitchAttack.on_set_parent_fire(A0_8423)
  local L1_8424
  L1_8424 = A0_8423.parent
  if not L1_8424 then
    return
  end
  L1_8424.on = {
    "execute",
    A0_8423,
    CastSwitchAttack.on_skill_execute_fire
  }
end
