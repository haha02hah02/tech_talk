Class.SkillButton.IButton({})
function SkillButton.Constructor(A0_3445, ...)
  IButton.Constructor(A0_3445, ...)
  Label("11", "\228\187\191\229\174\139", 20).name = "cd"
  Label("11", "\228\187\191\229\174\139", 20).color = 3356805375
  Label("11", "\228\187\191\229\174\139", 20).visible = false
  Label("11", "\228\187\191\229\174\139", 20).parent = A0_3445
end
function SkillButton.class_get(A0_3446)
  local L1_3447
  L1_3447 = "SkillButton"
  return L1_3447
end
function SkillButton.cd_get(A0_3448)
  return tonumber(A0_3448.child.all.cd.text)
end
function SkillButton.cd_set(A0_3449, A1_3450, A2_3451)
  local L3_3452
  if not A2_3451 then
    return
  end
  L3_3452 = A0_3449.child
  L3_3452 = L3_3452.all
  L3_3452 = L3_3452.cd
  L3_3452.text = string.format("%.1f", A2_3451)
  L3_3452.visible = A2_3451 > 0 and true or false
end
function SkillButton.id_get(A0_3453)
  return rawget(A0_3453, "id")
end
function SkillButton.id_set(A0_3454, A1_3455, A2_3456)
  local L3_3457, L4_3458, L5_3459
  L3_3457 = A0_3454.id
  if L3_3457 == A2_3456 then
    A0_3454.cd = 0
    return
  end
  L3_3457 = rawset
  L4_3458 = A0_3454
  L5_3459 = "id"
  L3_3457(L4_3458, L5_3459, A2_3456)
  if not A2_3456 then
    L3_3457 = "UI/Skill/bt_normal.ntp"
  elseif not L3_3457 then
    L3_3457 = string
    L3_3457 = L3_3457.format
    L4_3458 = "UI/Skill/%d.normal.icon"
    L5_3459 = A2_3456
    L3_3457 = L3_3457(L4_3458, L5_3459)
  end
  if not A2_3456 then
    L4_3458 = "UI/Skill/bt_pressed.ntp"
  elseif not L4_3458 then
    L4_3458 = string
    L4_3458 = L4_3458.format
    L5_3459 = "UI/Skill/%d.pressed.icon"
    L4_3458 = L4_3458(L5_3459, A2_3456)
  end
  if A2_3456 then
    L5_3459 = string
    L5_3459 = L5_3459.format
    L5_3459 = L5_3459("UI/Skill/%d.disabled.icon", A2_3456)
  else
    L5_3459 = L5_3459 or nil
  end
  A0_3454.cd = 0
  A0_3454.render:ChildByTag(1):InitWithImage(L3_3457, L4_3458, L5_3459)
end
function SkillButton.update_set(A0_3460, A1_3461, A2_3462)
  local L3_3463, L4_3464, L5_3465, L6_3466, L7_3467
  L3_3463 = A0_3460.id
  if not L3_3463 then
    return
  end
  L3_3463 = UniqueComponent
  L4_3464 = "Model/interface.model"
  L3_3463 = L3_3463(L4_3464)
  L4_3464 = L3_3463.parent
  if not L4_3464 then
    return
  end
  L5_3465 = L4_3464.physical
  L6_3466 = L4_3464.focus_object
  L5_3465 = L5_3465[L6_3466]
  if not L5_3465 then
    return
  end
  L6_3466 = L5_3465.skills
  L7_3467 = nil
  for _FORV_11_, _FORV_12_ in ipairs(L6_3466) do
    if _FORV_12_.id == A0_3460.id then
      L7_3467 = _FORV_12_
      break
    end
  end
  if not L7_3467 then
    return
  end
  A0_3460.disable = not L7_3467.active
  A0_3460.cd = L7_3467.cd
end
