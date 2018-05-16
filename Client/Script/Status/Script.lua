local L1_8594
function L0_8593(A0_8595, A1_8596, A2_8597, A3_8598)
  return LittleJumpStatus(A0_8595, A1_8596, A2_8597, A3_8598)
end
status_0 = L0_8593
function L0_8593(A0_8599, A1_8600, A2_8601, A3_8602)
  return AttributeStatus(A0_8599, A1_8600, A2_8601, A3_8602)
end
status_10000 = L0_8593
function L0_8593(A0_8603, A1_8604, A2_8605, A3_8606)
  return SwitchAttackStatus(A0_8603, A1_8604, A2_8605, A3_8606)
end
status_10001 = L0_8593
function L0_8593(A0_8607, A1_8608, A2_8609, A3_8610)
  return InvisibleStatus(A0_8607, A1_8608, A2_8609, A3_8610)
end
status_10002 = L0_8593
function L0_8593(A0_8611, A1_8612, A2_8613, A3_8614)
  if A2_8613.seffect then
    A3_8614.effect = ShadowEffect(A2_8613.seffect)
  end
  return AttributeStatus(A0_8611, A1_8612, A2_8613, A3_8614)
end
status_400401 = L0_8593
