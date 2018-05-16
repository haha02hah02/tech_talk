Class.InvisibleStatus.Component({})
function InvisibleStatus.Constructor(A0_8543, A1_8544, A2_8545, A3_8546)
  local L4_8547, L5_8548, L6_8549, L7_8550, L8_8551, L9_8552, L10_8553
  L4_8547 = Component
  L4_8547 = L4_8547.Constructor
  L5_8548 = A0_8543
  L4_8547(L5_8548)
  A0_8543.name = "proxy"
  if not A1_8544 or not A3_8546 then
    return
  end
  L4_8547 = A1_8544.data
  L4_8547 = L4_8547.level
  L5_8548 = A3_8546.req_level
  L5_8548 = L5_8548 or 0
  if L4_8547 < L5_8548 then
    return
  end
  L4_8547 = A0_8543.attach_data
  L5_8548 = math
  L5_8548 = L5_8548.min
  L6_8549 = A1_8544.data
  L6_8549 = L6_8549.level
  L6_8549 = L6_8549 - L7_8550
  L5_8548 = L5_8548(L6_8549, L7_8550)
  L6_8549 = DataFormat
  L6_8549 = L6_8549()
  for L10_8553, _FORV_11_ in L7_8550(L8_8551) do
    if A3_8546[L10_8553] then
      L6_8549[L10_8553] = A3_8546[L10_8553] + (A3_8546[string.format("l%s", L10_8553)] or 0) * L5_8548
    end
  end
  A0_8543.attach_data = L6_8549
end
function InvisibleStatus.class_get(A0_8554)
  local L1_8555
  L1_8555 = "InvisibleStatus"
  return L1_8555
end
function InvisibleStatus.attach_data_get(A0_8556)
  return rawget(A0_8556, "attach_data")
end
function InvisibleStatus.attach_data_set(A0_8557, A1_8558, A2_8559)
  rawset(A0_8557, "attach_data", A2_8559)
end
function InvisibleStatus.on_attack_fire(A0_8560, A1_8561)
  local L2_8562
  L2_8562 = A0_8560.parent
  if not L2_8562 then
    return
  end
  A1_8561.unattach_status = L2_8562.id
end
function InvisibleStatus.attach_set(A0_8563, A1_8564, A2_8565)
  local L3_8566, L4_8567
  L3_8566 = A2_8565.source
  if not L3_8566 then
    return
  end
  L4_8567 = L3_8566.data
  L4_8567.attach = A0_8563.attach_data
  L4_8567 = L3_8566.proxy
  L4_8567 = L4_8567.avatar
  L4_8567.opacity = 160
  L4_8567 = L3_8566.data
  L4_8567.invincible = L3_8566.data.invincible + 1
  L4_8567 = {
    "AttackAfter",
    A0_8563,
    InvisibleStatus.on_attack_fire
  }
  L3_8566.on = L4_8567
  L4_8567 = {
    "CastSkillAfter",
    A0_8563,
    InvisibleStatus.on_attack_fire
  }
  L3_8566.on = L4_8567
end
function InvisibleStatus.unattach_set(A0_8568, A1_8569, A2_8570)
  local L3_8571, L4_8572
  L3_8571 = A2_8570.source
  if not L3_8571 then
    return
  end
  L4_8572 = L3_8571.data
  L4_8572.unattach = A0_8568.attach_data
  L4_8572 = L3_8571.proxy
  L4_8572 = L4_8572.avatar
  L4_8572.opacity = 255
  L4_8572 = L3_8571.data
  L4_8572.invincible = L3_8571.data.invincible - 1
  L4_8572 = {
    "AttackAfter",
    A0_8568,
    InvisibleStatus.on_attack_fire
  }
  L3_8571.off = L4_8572
  L4_8572 = {
    "CastSkillAfter",
    A0_8568,
    InvisibleStatus.on_attack_fire
  }
  L3_8571.off = L4_8572
end
