Class.CastHPAttribute.Component({})
function CastHPAttribute.Constructor(A0_8169, A1_8170, A2_8171)
  Component.Constructor(A0_8169)
  A0_8169.name = "cast_hp_attribute"
  A0_8169.on = {
    "Parent",
    A0_8169,
    CastHPAttribute.on_set_parent_fire
  }
end
function CastHPAttribute.class_get(A0_8172)
  local L1_8173
  L1_8173 = "CastHPAttribute"
  return L1_8173
end
function CastHPAttribute.attach_data_get(A0_8174)
  return rawget(A0_8174, "attach_data")
end
function CastHPAttribute.attach_data_set(A0_8175, A1_8176, A2_8177)
  rawset(A0_8175, "attach_data", A2_8177)
end
function CastHPAttribute.on_session_level_fire(A0_8178)
  local L1_8179, L2_8180, L3_8181, L4_8182, L5_8183, L6_8184, L7_8185, L8_8186, L9_8187, L10_8188, L11_8189, L12_8190, L13_8191
  L1_8179 = A0_8178.parent
  if not L1_8179 then
    return
  end
  L2_8180 = L1_8179.info
  if not L2_8180 then
    return
  end
  L3_8181 = L2_8180.percent
  if not L3_8181 then
    return
  end
  L3_8181 = L1_8179.parent
  if not L3_8181 then
    return
  end
  L4_8182 = L3_8181.data
  L5_8183 = L2_8180.req_level
  L5_8183 = L5_8183 or 0
  L6_8184 = L4_8182.level
  if L5_8183 > L6_8184 then
    return
  end
  L5_8183 = math
  L5_8183 = L5_8183.min
  L6_8184 = L4_8182.hp
  L7_8185 = L4_8182.max_hp
  L6_8184 = L6_8184 / L7_8185
  L6_8184 = L6_8184 * 100
  L7_8185 = 100
  L5_8183 = L5_8183(L6_8184, L7_8185)
  L6_8184 = A0_8178.attach_data
  L7_8185 = math
  L7_8185 = L7_8185.min
  L8_8186 = L4_8182.level
  L9_8187 = L2_8180.req_level
  L9_8187 = L9_8187 or 0
  L8_8186 = L8_8186 - L9_8187
  L9_8187 = L2_8180.max_level
  L9_8187 = L9_8187 or 0
  L7_8185 = L7_8185(L8_8186, L9_8187)
  L8_8186 = math
  L8_8186 = L8_8186.max
  L9_8187 = math
  L9_8187 = L9_8187.ceil
  L9_8187 = L9_8187(L10_8188)
  L8_8186 = L8_8186(L9_8187, L10_8188)
  L9_8187 = DataFormat
  L9_8187 = L9_8187()
  for L13_8191, _FORV_14_ in L10_8188(L11_8189) do
    if L2_8180[L13_8191] then
      L9_8187[L13_8191] = (L2_8180[L13_8191] + (L2_8180[string.format("l%s", L13_8191)] or 0) * L7_8185) * L8_8186
    end
  end
  if not L6_8184 then
    A0_8178.attach_data = L9_8187
    L4_8182.attach = L9_8187
    return
  end
  for _FORV_14_, _FORV_15_ in L11_8189(L12_8190) do
    if L9_8187[_FORV_14_] and L9_8187[_FORV_14_] ~= L6_8184[_FORV_14_] then
      break
    end
  end
  if L10_8188 == true then
    return
  end
  A0_8178.attach_data = L9_8187
  L4_8182.attach = L9_8187
  L4_8182.unattach = L6_8184
end
function CastHPAttribute.on_set_parent_fire(A0_8192)
  local L1_8193, L2_8194
  L1_8193 = A0_8192.parent
  if not L1_8193 then
    return
  end
  L2_8194 = {
    "equip",
    A0_8192,
    CastHPAttribute.on_session_level_fire
  }
  L1_8193.on = L2_8194
  L2_8194 = L1_8193.parent
  if not L2_8194 then
    return
  end
  L2_8194.data.on = {
    "hp",
    A0_8192,
    CastHPAttribute.on_session_level_fire
  }
end
