Class.UnderAttackSound.Component({})
function UnderAttackSound.Constructor(A0_5713, A1_5714, A2_5715)
  Component.Constructor(A0_5713)
  A0_5713.name = "under_attack_sound"
  A0_5713.on = {
    "Parent",
    A0_5713,
    UnderAttackSound.on_parent_fire
  }
  A0_5713.parent = A1_5714
end
function UnderAttackSound.class_get(A0_5716)
  local L1_5717
  L1_5717 = "UnderAttackSound"
  return L1_5717
end
function UnderAttackSound.on_status_set(A0_5718)
  local L1_5719, L2_5720
  L1_5719 = A0_5718.parent
  if not L1_5719 then
    return
  end
  L2_5720 = L1_5719.status
  if L2_5720 ~= STATUS_DIE then
    return
  end
  L2_5720 = L1_5719.proxy
  L2_5720.show_info = false
  L2_5720 = L1_5719.proxy
  L2_5720 = L2_5720.info
  L2_5720 = L2_5720.die_bgm
  if L2_5720 and L2_5720 ~= "" then
    Sound:PlayEffect(L2_5720)
  end
end
function UnderAttackSound.on_under_attack(A0_5721, A1_5722, A2_5723)
  local L3_5724, L4_5725
  L3_5724 = A1_5722.status
  L4_5725 = STATUS_DIE
  if L3_5724 == L4_5725 then
    return
  end
  L3_5724 = A1_5722.proxy
  L3_5724.show_info = true
  L4_5725 = A2_5723.index
  if L4_5725 ~= 1 then
    return
  end
  L4_5725 = L3_5724.info
  L4_5725 = L4_5725.hit_bgm
  if L4_5725 and L4_5725 ~= "" then
    Sound:PlayEffect(L4_5725)
  end
end
function UnderAttackSound.on_modify_fire(A0_5726, A1_5727)
  local L2_5728, L3_5729, L6_5730
  L2_5728 = A0_5726.parent
  if not L2_5728 then
    return
  end
  L3_5729 = L2_5728.data
  L6_5730 = L2_5728.proxy
  L6_5730.progress.percent = L3_5729.hp / L3_5729.max_hp * 100
end
function UnderAttackSound.on_parent_fire(A0_5731)
  local L1_5732, L2_5733
  L1_5732 = A0_5731.parent
  if not L1_5732 then
    return
  end
  L2_5733 = {
    "Status",
    A0_5731,
    UnderAttackSound.on_status_set
  }
  L1_5732.on = L2_5733
  L2_5733 = L1_5732.data
  L2_5733.on = {
    "modify",
    A0_5731,
    UnderAttackSound.on_modify_fire
  }
  L2_5733 = {
    "UnderAttackBefore",
    A0_5731,
    UnderAttackSound.on_under_attack
  }
  L1_5732.on = L2_5733
end
