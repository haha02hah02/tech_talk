L0_8219 = Class
L0_8219 = L0_8219.CastMaxHPStrike
L0_8219 = L0_8219.Component
L0_8219({})
L0_8219 = {}
function CastMaxHPStrike.Constructor(A0_8220, A1_8221, A2_8222)
  Component.Constructor(A0_8220)
  A0_8220.name = "cast_max_hp_strike"
  A0_8220.on = {
    "Parent",
    A0_8220,
    CastMaxHPStrike.on_set_parent_fire
  }
end
function CastMaxHPStrike.class_get(A0_8223)
  local L1_8224
  L1_8224 = "CastMaxHPStrike"
  return L1_8224
end
function CastMaxHPStrike.on_skill_execute_fire(A0_8225)
  local L1_8226, L2_8227, L3_8228, L4_8229, L5_8230, L6_8231, L7_8232, L8_8233, L9_8234, L10_8235, L11_8236, L12_8237, L13_8238, L14_8239, L15_8240
  L1_8226 = A0_8225.parent
  if not L1_8226 then
    return
  end
  L2_8227 = L1_8226.info
  L3_8228 = L1_8226.parent
  if not L3_8228 then
    return
  end
  L4_8229 = L3_8228.parent
  L4_8229 = L4_8229.parent
  if not L4_8229 then
    return
  end
  L5_8230 = SkillSearchArg
  L6_8231 = L3_8228
  L7_8232 = L2_8227
  L5_8230 = L5_8230(L6_8231, L7_8232)
  L4_8229.search_args = L5_8230
  L6_8231 = L4_8229.search
  L7_8232 = L1_8226.hit_effect
  L8_8233 = L1_8226.hit_sound
  L9_8234 = L2_8227.type
  if L9_8234 == "attack" then
    L9_8234 = "AttackAfter"
  else
    L9_8234 = L9_8234 or "CastSkillAfter"
  end
  L10_8235 = SkillPower
  L10_8235 = L10_8235(L11_8236, L12_8237)
  if not L11_8236 then
    if not L6_8231 then
      L3_8228.fire = L9_8234
      L11_8236(L12_8237)
      return
    end
    L7_8232.attach = L6_8231
    L8_8233.attach = true
    L11_8236.producer = L3_8228
    L11_8236.target_hp = L12_8237
    L14_8239 = L6_8231
    L15_8240 = L2_8227
    if L12_8237 then
      L6_8231.under_attack = L11_8236
      return
    end
    L11_8236.source = L12_8237
    L14_8239 = L11_8236.source
    L11_8236.result = L12_8237
    L6_8231.under_attack = L11_8236
    return
  end
  if L11_8236 == L12_8237 then
    L3_8228.fire = L9_8234
    A0_8225.check_wasteop = L3_8228
    return
  end
  L8_8233.attach = true
  L0_8219[2] = true
  for L14_8239, L15_8240 in L11_8236(L12_8237) do
    L0_8219[1] = L15_8240
    L7_8232.attach = L0_8219
    Damage().producer = L3_8228
    Damage().target_hp = L15_8240.data.hp
    if not IsDodge(L3_8228, L15_8240, L2_8227) or not 0 then
    end
    Damage().source = math.floor(L15_8240.data.max_hp * L10_8235)
    L15_8240.under_attack, Damage().result = Damage(), math.min(L15_8240.data.hp, Damage().source)
  end
  L3_8228.fire = L9_8234
end
function CastMaxHPStrike.on_set_parent_fire(A0_8241)
  local L1_8242
  L1_8242 = A0_8241.parent
  if not L1_8242 then
    return
  end
  L1_8242.on = {
    "execute",
    A0_8241,
    CastMaxHPStrike.on_skill_execute_fire
  }
end
