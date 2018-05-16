local L1_7872
L0_7871 = Class
L0_7871 = L0_7871.CastApplyStatus
L0_7871 = L0_7871.Component
L1_7872 = {}
L0_7871(L1_7872)
L0_7871 = {}
L1_7872 = {}
function CastApplyStatus.Constructor(A0_7873, A1_7874, A2_7875)
  Component.Constructor(A0_7873)
  A0_7873.name = "cast_apply_buff"
  A0_7873.on = {
    "Parent",
    A0_7873,
    CastApplyStatus.on_set_parent_fire
  }
end
function CastApplyStatus.class_get(A0_7876)
  local L1_7877
  L1_7877 = "CastApplyStatus"
  return L1_7877
end
function CastApplyStatus.clean_buff_set(A0_7878, A1_7879, A2_7880)
  local L3_7881
  L3_7881 = A2_7880.attach_status
  if not status then
    return
  end
  for _FORV_7_, _FORV_8_ in pairs(L3_7881) do
    if _FORV_8_.info.type == "buff" then
      A2_7880.unattach_status = _FORV_7_
    end
  end
end
function CastApplyStatus.on_skill_execute_fire(A0_7882)
  local L1_7883, L2_7884, L3_7885, L4_7886, L5_7887, L6_7888
  L1_7883 = A0_7882.parent
  if not L1_7883 then
    return
  end
  L2_7884 = L1_7883.info
  L3_7885 = L2_7884.status_id
  if not L3_7885 then
    return
  end
  L3_7885 = L1_7883.parent
  if not L3_7885 then
    return
  end
  L4_7886 = L3_7885.parent
  L4_7886 = L4_7886.parent
  if not L4_7886 then
    return
  end
  L5_7887 = SkillSearchArg
  L6_7888 = L3_7885
  L5_7887 = L5_7887(L6_7888, L2_7884)
  L4_7886.search_args = L5_7887
  L6_7888 = L4_7886.search
  L0_7871[1] = L3_7885
  L0_7871[2] = L2_7884.status_id
  if not L2_7884.multiple then
    if not L6_7888 then
      L3_7885.fire = L2_7884.type == "attack" and "AttackAfter" or "CastSkillAfter"
      CheckWasteop(L3_7885)
      return
    end
    L1_7883.hit_effect.attach = L6_7888
    L1_7883.hit_sound.attach = true
    L6_7888.attach_status = L0_7871
    A0_7882.clean_buff = L6_7888
    return
  end
  if #L6_7888 == Config.ZeroNumber then
    L3_7885.fire = L2_7884.type == "attack" and "AttackAfter" or "CastSkillAfter"
    CheckWasteop(L3_7885)
    return
  end
  L1_7883.hit_sound.attach = true
  L1_7872[2] = true
  for _FORV_14_, _FORV_15_ in ipairs(L6_7888) do
    L1_7872[1] = _FORV_15_
    L1_7883.hit_effect.attach = L1_7872
    _FORV_15_.attach_status = L0_7871
  end
  L3_7885.fire = L2_7884.type == "attack" and "AttackAfter" or "CastSkillAfter"
end
function CastApplyStatus.on_set_parent_fire(A0_7889)
  local L1_7890
  L1_7890 = A0_7889.parent
  if not L1_7890 then
    return
  end
  L1_7890.on = {
    "execute",
    A0_7889,
    CastApplyStatus.on_skill_execute_fire
  }
end
