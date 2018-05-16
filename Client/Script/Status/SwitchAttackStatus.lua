Class.SwitchAttackStatus.Component({})
function SwitchAttackStatus.Constructor(A0_8685, A1_8686, A2_8687, A3_8688)
  Component.Constructor(A0_8685)
  A0_8685.name = "proxy"
end
function SwitchAttackStatus.class_get(A0_8689)
  local L1_8690
  L1_8690 = "SwitchAttackStatus"
  return L1_8690
end
function SwitchAttackStatus.attach_set(A0_8691, A1_8692, A2_8693)
  if not A2_8693.source then
    return
  end
  if not A2_8693.info.skill_id then
    return
  end
  UniqueComponent("Model/interface.model").node.attack.tag = A2_8693.info.skill_id
end
function SwitchAttackStatus.unattach_set(A0_8694, A1_8695, A2_8696)
  if not A2_8696.source then
    return
  end
  if not A2_8696.info.skill_id then
    return
  end
  UniqueComponent("Model/interface.model").node.attack.tag = math.floor(A2_8696.info.skill_id / 100) * 100
end
