Class.CastAttribute.Component({})
function CastAttribute.Constructor(A0_7914, A1_7915, A2_7916)
  Component.Constructor(A0_7914)
  A0_7914.name = "cast_attribute"
  A0_7914.on = {
    "Parent",
    A0_7914,
    CastAttribute.on_set_parent_fire
  }
end
function CastAttribute.class_get(A0_7917)
  local L1_7918
  L1_7918 = "CastAttribute"
  return L1_7918
end
function CastAttribute.attach_data_get(A0_7919)
  return rawget(A0_7919, "attach_data")
end
function CastAttribute.attach_data_set(A0_7920, A1_7921, A2_7922)
  rawset(A0_7920, "attach_data", A2_7922)
end
function CastAttribute.attached_data_get(A0_7923)
  return rawget(A0_7923, "attached_data")
end
function CastAttribute.attached_data_set(A0_7924, A1_7925, A2_7926)
  rawset(A0_7924, "attached_data", A2_7926)
end
function CastAttribute.attribute_data_get(A0_7927)
  local L1_7928, L2_7929, L3_7930, L4_7931, L5_7932, L6_7933, L7_7934, L8_7935, L9_7936, L10_7937
  L1_7928 = A0_7927.parent
  if not L1_7928 then
    return
  end
  L2_7929 = L1_7928.info
  if not L2_7929 then
    return
  end
  L3_7930 = L1_7928.parent
  if not L3_7930 then
    return
  end
  L4_7931 = L3_7930.data
  L4_7931 = L4_7931.level
  L5_7932 = L2_7929.req_level
  L5_7932 = L5_7932 or 0
  if L4_7931 < L5_7932 then
    return
  end
  L4_7931 = math
  L4_7931 = L4_7931.min
  L5_7932 = L3_7930.data
  L5_7932 = L5_7932.level
  L6_7933 = L2_7929.req_level
  L6_7933 = L6_7933 or 0
  L5_7932 = L5_7932 - L6_7933
  L6_7933 = L2_7929.max_level
  L6_7933 = L6_7933 or 0
  L4_7931 = L4_7931(L5_7932, L6_7933)
  L5_7932 = DataFormat
  L5_7932 = L5_7932()
  L6_7933 = false
  for L10_7937, _FORV_11_ in L7_7934(L8_7935) do
    if L2_7929[L10_7937] then
      L5_7932[L10_7937] = L2_7929[L10_7937] + (L2_7929[string.format("l%s", L10_7937)] or 0) * L4_7931
      L6_7933 = true
    end
  end
  if L6_7933 then
    return L5_7932
  end
end
function CastAttribute.is_active_get(A0_7938)
  local L1_7939, L2_7940, L3_7941
  L1_7939 = A0_7938.parent
  if not L1_7939 then
    return
  end
  L2_7940 = L1_7939.info
  if not L2_7940 then
    return
  end
  L3_7941 = L1_7939.parent
  if not L3_7941 then
    return
  end
  if L3_7941.data.level < (L2_7940.req_level or 0) then
    return
  end
  if not L1_7939.enable then
    return
  end
  if L2_7940.shield_limit == true then
    return UniqueComponent("Model/interface.model").ui.iuserinfo.assistant.item and UniqueComponent("Model/interface.model").ui.iuserinfo.assistant.item.stype == "shield" or false
  end
  return true
end
function CastAttribute.check_data_set(A0_7942)
  local L1_7943, L3_7944, L5_7945, L6_7946, L7_7947
  L1_7943 = A0_7942.parent
  if not L1_7943 then
    return
  end
  L3_7944 = L1_7943.info
  if not L3_7944 then
    return
  end
  L5_7945 = L1_7943.parent
  if not L5_7945 then
    return
  end
  L6_7946 = A0_7942.is_active
  if not L6_7946 then
    L7_7947 = A0_7942.attached_data
    if not L7_7947 then
      return
    end
    A0_7942.attached_data = nil
    L5_7945.data.unattach = L7_7947
    return
  end
  L7_7947 = A0_7942.attached_data
  if L7_7947 == A0_7942.attach_data then
    return
  end
  if not A0_7942.attach_data then
    L5_7945.data.unattach = L7_7947
    return
  end
  L5_7945.data.attach = A0_7942.attach_data
  A0_7942.attached_data, L5_7945.data.unattach = A0_7942.attach_data, L7_7947
end
function CastAttribute.on_session_level_fire(A0_7948)
  local L1_7949, L2_7950, L3_7951, L4_7952, L5_7953, L6_7954
  L1_7949 = A0_7948.parent
  if not L1_7949 then
    return
  end
  L2_7950 = L1_7949.info
  if not L2_7950 then
    return
  end
  L3_7951 = L1_7949.parent
  if not L3_7951 then
    return
  end
  L4_7952 = L3_7951.data
  L4_7952 = L4_7952.level
  L5_7953 = L2_7950.req_level
  L5_7953 = L5_7953 or 0
  if L4_7952 < L5_7953 then
    return
  end
  L4_7952 = L2_7950.req_level
  L4_7952 = L4_7952 or 0
  L5_7953 = L2_7950.max_level
  L5_7953 = L5_7953 or 0
  L4_7952 = L4_7952 + L5_7953
  L5_7953 = A0_7948.attach_data
  if L5_7953 then
    L6_7954 = L3_7951.data
    L6_7954 = L6_7954.level
    if L4_7952 < L6_7954 then
      A0_7948.check_data = true
      return
    end
  end
  L6_7954 = A0_7948.attribute_data
  A0_7948.attach_data = L6_7954
  A0_7948.check_data = true
end
function CastAttribute.on_set_parent_fire(A0_7955)
  local L1_7956, L2_7957
  L1_7956 = A0_7955.parent
  if not L1_7956 then
    return
  end
  L2_7957 = {
    "equip",
    A0_7955,
    CastAttribute.on_session_level_fire
  }
  L1_7956.on = L2_7957
  L2_7957 = {
    "enable",
    A0_7955,
    CastAttribute.on_session_level_fire
  }
  L1_7956.on = L2_7957
  L2_7957 = L1_7956.parent
  if not L2_7957 then
    return
  end
  L2_7957.on = {
    "Equiped",
    A0_7955,
    CastAttribute.check_data_set
  }
  L2_7957.on = {
    "Unequiped",
    A0_7955,
    CastAttribute.check_data_set
  }
  L2_7957.data.on = {
    "level",
    A0_7955,
    CastAttribute.on_session_level_fire
  }
end
