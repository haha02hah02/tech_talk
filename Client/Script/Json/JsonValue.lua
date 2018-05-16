Class.JsonValue.Json({})
function JsonValue.Constructor(A0_3830, A1_3831)
  rawset(A0_3830, "this", oData)
end
function JsonValue.Value(A0_3832)
  return SwitchJsonData(A0_3832.this)
end
function JsonValue.Next(A0_3833)
  local L1_3834
end
function JsonValue.String(A0_3835)
  local L1_3836
  L1_3836 = rawget
  L1_3836 = L1_3836(A0_3835, "this")
  if not L1_3836 then
    return
  end
  return MakeJsonString(L1_3836)
end
