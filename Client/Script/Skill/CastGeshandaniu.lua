Class.CastGeshandaniu.Component({})
function CastGeshandaniu.Constructor(A0_8100, A1_8101, A2_8102)
  Component.Constructor(A0_8100)
  A0_8100.name = "cast_geshandaniu"
  A0_8100.on = {
    "Parent",
    A0_8100,
    CastGeshandaniu.on_set_parent_fire
  }
end
function CastGeshandaniu.class_get(A0_8103)
  local L1_8104
  L1_8104 = "CastGeshandaniu"
  return L1_8104
end
function CastGeshandaniu.check_wasteop_set(A0_8105, A1_8106, A2_8107)
  if A2_8107.type ~= WORLD_TYPE_LIFE then
    return
  end
  Event:Fire("Wasteop", Config.OneNumber)
end
function CastGeshandaniu.spurting_set(A0_8108, A1_8109, A2_8110, A3_8111)
  Damage().producer = A2_8110
  Damage().target_hp = A3_8111.data.hp
  Damage().type = "holy_physical"
  Damage().source = A1_8109.result
  A3_8111.under_attack, Damage().result = Damage(), A1_8109.result
end
function CastGeshandaniu.on_skill_execute_fire(A0_8112)
  local L1_8113, L2_8114, L3_8115, L4_8116, L5_8117, L6_8118, L7_8119, L8_8120, L9_8121, L10_8122, L11_8123, L12_8124, L13_8125, L14_8126, L15_8127, L16_8128, L17_8129, L18_8130, L19_8131, L20_8132, L21_8133, L22_8134, L23_8135, L24_8136, L25_8137, L26_8138, L27_8139, L28_8140, L29_8141, L30_8142, L31_8143, L32_8144, L33_8145, L34_8146, L35_8147, L36_8148, L37_8149
  L1_8113 = A0_8112.parent
  if not L1_8113 then
    return
  end
  L2_8114 = L1_8113.info
  L3_8115 = L1_8113.parent
  if not L3_8115 then
    return
  end
  L4_8116 = L3_8115.parent
  L4_8116 = L4_8116.parent
  if not L4_8116 then
    return
  end
  L5_8117 = math
  L5_8117 = L5_8117.min
  L6_8118 = L3_8115.data
  L6_8118 = L6_8118.level
  L7_8119 = L2_8114.req_level
  L7_8119 = L7_8119 or 0
  L6_8118 = L6_8118 - L7_8119
  L7_8119 = L2_8114.max_level
  L7_8119 = L7_8119 or 0
  L5_8117 = L5_8117(L6_8118, L7_8119)
  L6_8118 = L2_8114.loffset
  L7_8119 = L2_8114.offset
  if L7_8119 then
    L8_8120 = L7_8119.x
  else
    L8_8120 = L8_8120 or 0
  end
  if L6_8118 then
    L9_8121 = L6_8118.x
    L9_8121 = L9_8121 * L5_8117
  else
    L9_8121 = L9_8121 or 0
  end
  L8_8120 = L8_8120 + L9_8121
  if L7_8119 then
    L9_8121 = L7_8119.y
  else
    L9_8121 = L9_8121 or 0
  end
  if L6_8118 then
    L10_8122 = L6_8118.y
    L10_8122 = L10_8122 * L5_8117
  else
    L10_8122 = L10_8122 or 0
  end
  L9_8121 = L9_8121 + L10_8122
  L10_8122 = L3_8115.direction
  if L10_8122 ~= "left" or not L8_8120 then
    L8_8120 = -L8_8120
  end
  L10_8122 = L2_8114.lwidth
  L11_8123 = L2_8114.lheight
  L12_8124 = L2_8114.width
  L12_8124 = L12_8124 / 2
  if L10_8122 then
    L13_8125 = L10_8122 * L5_8117
  else
    L13_8125 = L13_8125 or 0
  end
  L12_8124 = L12_8124 + L13_8125
  L13_8125 = L2_8114.height
  L13_8125 = L13_8125 / 2
  if L11_8123 then
    L14_8126 = L11_8123 * L5_8117
  else
    L14_8126 = L14_8126 or 0
  end
  L13_8125 = L13_8125 + L14_8126
  L14_8126 = L2_8114.max_count
  L14_8126 = L14_8126 or 6
  L15_8127 = L3_8115.position
  L16_8128 = L15_8127.x
  L16_8128 = L16_8128 - L12_8124
  L16_8128 = L16_8128 + L8_8120
  L17_8129 = L15_8127.x
  L17_8129 = L17_8129 + L12_8124
  L17_8129 = L17_8129 + L8_8120
  L18_8130 = L15_8127.y
  L18_8130 = L18_8130 + L13_8125
  L18_8130 = L18_8130 + L9_8121
  L19_8131 = L15_8127.y
  L19_8131 = L19_8131 - L13_8125
  L19_8131 = L19_8131 + L9_8121
  L20_8132 = L1_8113.hit_effect
  L21_8133 = L1_8113.hit_sound
  L22_8134 = L2_8114.type
  if L22_8134 == "attack" then
    L22_8134 = "AttackAfter"
  else
    L22_8134 = L22_8134 or "CastSkillAfter"
  end
  L23_8135 = {
    L24_8136,
    L25_8137,
    L26_8138,
    L27_8139,
    L28_8140,
    L29_8141,
    L30_8142
  }
  L24_8136 = L16_8128
  L25_8137 = L17_8129
  L26_8138 = L18_8130
  L27_8139 = L19_8131
  L28_8140 = L3_8115.hate_type
  L29_8141 = nil
  L30_8142 = L3_8115.direction
  L4_8116.search_args = L23_8135
  L23_8135 = L4_8116.search
  if not L23_8135 then
    L3_8115.fire = L22_8134
    A0_8112.check_wasteop = L3_8115
    return
  end
  L24_8136 = CalcDamage
  L25_8137 = L3_8115
  L26_8138 = L23_8135
  L27_8139 = L2_8114
  L24_8136 = L24_8136(L25_8137, L26_8138, L27_8139)
  if L24_8136 then
    L25_8137 = L24_8136.result
  elseif L25_8137 == 0 then
    return
  end
  if L20_8132 then
    L20_8132.attach = L23_8135
  end
  if L21_8133 then
    L21_8133.attach = true
  end
  L25_8137 = L23_8135.position
  L23_8135.under_attack = L24_8136
  L3_8115.fire = L22_8134
  L26_8138 = L2_8114.distance
  L26_8138 = L26_8138 or 300
  L27_8139 = L3_8115.direction
  if L27_8139 == "left" then
    L27_8139 = L25_8137.x
    L27_8139 = L27_8139 - L26_8138
  else
    L27_8139 = L27_8139 or L25_8137.x
  end
  L28_8140 = L3_8115.direction
  if L28_8140 == "right" then
    L28_8140 = L25_8137.x
    L28_8140 = L28_8140 + L26_8138
  else
    L28_8140 = L28_8140 or L25_8137.x
  end
  L29_8141 = L25_8137.y
  L29_8141 = L29_8141 + L13_8125
  L30_8142 = L25_8137.y
  L30_8142 = L30_8142 - L13_8125
  L31_8143 = {
    L32_8144,
    L33_8145,
    L34_8146,
    L35_8147,
    L36_8148,
    L37_8149,
    L3_8115.direction
  }
  L32_8144 = L27_8139
  L36_8148 = L3_8115.hate_type
  L37_8149 = L14_8126 + 1
  L4_8116.search_args = L31_8143
  L31_8143 = L4_8116.search
  L32_8144 = #L31_8143
  if L32_8144 == 0 then
    return
  end
  L32_8144 = 0
  for L36_8148, L37_8149 in L33_8145(L34_8146) do
    if not (L32_8144 > L14_8126 - 1) then
      if L37_8149 ~= L23_8135 then
        L32_8144 = L32_8144 + 1
        CastGeshandaniu.spurting_set(A0_8112, L24_8136, L3_8115, L37_8149)
      end
    end
  end
end
function CastGeshandaniu.on_set_parent_fire(A0_8150)
  local L1_8151
  L1_8151 = A0_8150.parent
  if not L1_8151 then
    return
  end
  L1_8151.on = {
    "execute",
    A0_8150,
    CastGeshandaniu.on_skill_execute_fire
  }
end
