L0_8195 = Class
L0_8195 = L0_8195.CastHPStrike
L0_8195 = L0_8195.Component
L0_8195({})
L0_8195 = {}
function CastHPStrike.Constructor(A0_8196, A1_8197, A2_8198)
  Component.Constructor(A0_8196)
  A0_8196.name = "cast_hp_strike"
  A0_8196.on = {
    "Parent",
    A0_8196,
    CastHPStrike.on_set_parent_fire
  }
end
function CastHPStrike.class_get(A0_8199)
  local L1_8200
  L1_8200 = "CastHPStrike"
  return L1_8200
end
function CastHPStrike.on_skill_execute_fire(A0_8201)
  local L1_8202, L2_8203, L3_8204, L4_8205, L5_8206, L6_8207, L7_8208, L8_8209, L9_8210, L10_8211, L11_8212, L12_8213, L13_8214, L14_8215, L15_8216
  L1_8202 = A0_8201.parent
  if not L1_8202 then
    return
  end
  L2_8203 = L1_8202.info
  L3_8204 = L1_8202.parent
  if not L3_8204 then
    return
  end
  L4_8205 = L3_8204.parent
  L4_8205 = L4_8205.parent
  if not L4_8205 then
    return
  end
  L5_8206 = SkillSearchArg
  L6_8207 = L3_8204
  L7_8208 = L2_8203
  L5_8206 = L5_8206(L6_8207, L7_8208)
  L4_8205.search_args = L5_8206
  L6_8207 = L4_8205.search
  L7_8208 = L1_8202.hit_effect
  L8_8209 = L1_8202.hit_sound
  L9_8210 = L2_8203.type
  if L9_8210 == "attack" then
    L9_8210 = "AttackAfter"
  else
    L9_8210 = L9_8210 or "CastSkillAfter"
  end
  L10_8211 = SkillPower
  L10_8211 = L10_8211(L11_8212, L12_8213)
  if not L11_8212 then
    if not L6_8207 then
      L3_8204.fire = L9_8210
      A0_8201.check_wasteop = L3_8204
      return
    end
    L7_8208.attach = L6_8207
    L8_8209.attach = true
    L11_8212.type = L12_8213
    L11_8212.producer = L3_8204
    L11_8212.target_hp = L12_8213
    L14_8215 = L6_8207
    L15_8216 = L2_8203
    if L12_8213 then
      L6_8207.under_attack = L11_8212
      return
    end
    L11_8212.source = L12_8213
    L14_8215 = L11_8212.source
    L11_8212.result = L12_8213
    L6_8207.under_attack = L11_8212
    return
  end
  if L11_8212 == L12_8213 then
    L3_8204.fire = L9_8210
    A0_8201.check_wasteop = L3_8204
    return
  end
  L8_8209.attach = true
  L0_8195[2] = true
  for L14_8215, L15_8216 in L11_8212(L12_8213) do
    L0_8195[1] = L15_8216
    L7_8208.attach = L0_8195
    Damage().type = L2_8203.damage_type
    Damage().producer = L3_8204
    Damage().target_hp = L15_8216.data.hp
    if not IsDodge(L3_8204, L15_8216, L2_8203) or not 0 then
    end
    Damage().source = math.floor(L15_8216.data.hp * L10_8211)
    L15_8216.under_attack, Damage().result = Damage(), math.min(L15_8216.data.hp, Damage().source)
  end
  L3_8204.fire = L9_8210
end
function CastHPStrike.on_set_parent_fire(A0_8217)
  local L1_8218
  L1_8218 = A0_8217.parent
  if not L1_8218 then
    return
  end
  L1_8218.on = {
    "execute",
    A0_8217,
    CastHPStrike.on_skill_execute_fire
  }
end
