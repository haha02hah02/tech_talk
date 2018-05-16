L0_7891 = Class
L0_7891 = L0_7891.CastAttack
L0_7891 = L0_7891.Component
L0_7891({})
L0_7891 = {}
function CastAttack.Constructor(A0_7892, A1_7893, A2_7894)
  Component.Constructor(A0_7892)
  A0_7892.name = "cast_attack"
  A0_7892.on = {
    "Parent",
    A0_7892,
    CastAttack.on_set_parent_fire
  }
end
function CastAttack.class_get(A0_7895)
  local L1_7896
  L1_7896 = "CastAttack"
  return L1_7896
end
function CastAttack.on_skill_execute_fire(A0_7897)
  local L1_7898, L2_7899, L3_7900, L4_7901, L5_7902, L6_7903, L7_7904, L8_7905, L9_7906, L10_7907, L11_7908, L12_7909, L13_7910, L14_7911
  L1_7898 = A0_7897.parent
  if not L1_7898 then
    return
  end
  L2_7899 = L1_7898.info
  L3_7900 = L1_7898.parent
  if not L3_7900 then
    return
  end
  L4_7901 = L3_7900.parent
  L4_7901 = L4_7901.parent
  if not L4_7901 then
    return
  end
  L5_7902 = SkillSearchArg
  L6_7903 = L3_7900
  L7_7904 = L2_7899
  L5_7902 = L5_7902(L6_7903, L7_7904)
  L4_7901.search_args = L5_7902
  L6_7903 = L4_7901.search
  L7_7904 = L1_7898.hit_effect
  L8_7905 = L1_7898.hit_sound
  L9_7906 = L2_7899.type
  if L9_7906 == "attack" then
    L9_7906 = "AttackAfter"
  else
    L9_7906 = L9_7906 or "CastSkillAfter"
  end
  if not L10_7907 then
    if not L6_7903 then
      L3_7900.fire = L9_7906
      L10_7907(L11_7908)
      return
    end
    L7_7904.attach = L6_7903
    L8_7905.attach = true
    L13_7910 = L2_7899
    L10_7907(L11_7908, L12_7909, L13_7910)
    return
  end
  if L10_7907 == L11_7908 then
    L3_7900.fire = L9_7906
    L10_7907(L11_7908)
    return
  end
  L8_7905.attach = true
  L0_7891[2] = true
  for L13_7910, L14_7911 in L10_7907(L11_7908) do
    L0_7891[1] = L14_7911
    L7_7904.attach = L0_7891
    AttackSet(L3_7900, L14_7911, L2_7899)
  end
  L3_7900.fire = L9_7906
end
function CastAttack.on_set_parent_fire(A0_7912)
  local L1_7913
  L1_7913 = A0_7912.parent
  if not L1_7913 then
    return
  end
  L1_7913.on = {
    "execute",
    A0_7912,
    CastAttack.on_skill_execute_fire
  }
end
