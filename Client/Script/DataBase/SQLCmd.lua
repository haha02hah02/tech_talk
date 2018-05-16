local L1_3008, L2_3009, L3_3010, L4_3011, L5_3012, L6_3013, L7_3014
L0_3007 = Global
L1_3008 = {}
L0_3007.insert = L1_3008
L0_3007 = Global
L1_3008 = {}
L0_3007.update = L1_3008
L0_3007 = Global
L1_3008 = {}
L0_3007.into = L1_3008
L0_3007 = Global
L1_3008 = {}
L0_3007.increment = L1_3008
L0_3007 = Global
L1_3008 = {}
L0_3007.config = L1_3008
function L0_3007(A0_3015)
  local L1_3016
  L1_3016 = rawget
  L1_3016 = L1_3016(into, "table_name")
  if not L1_3016 then
    return
  end
  into[L1_3016] = nil
  SQLManager:CreateTableItem(L1_3016, A0_3015)
end
L1_3008 = {}
function L2_3009(A0_3017, A1_3018)
  return Global[A1_3018]
end
L1_3008.__index = L2_3009
L2_3009 = {}
function L3_3010(A0_3019, A1_3020)
  local L2_3021
  A0_3019.table_name = A1_3020
  L2_3021 = L0_3007
  return L2_3021
end
L2_3009.__index = L3_3010
L3_3010 = setmetatable
L4_3011 = insert
L5_3012 = L1_3008
L3_3010(L4_3011, L5_3012)
L3_3010 = setmetatable
L4_3011 = into
L5_3012 = L2_3009
L3_3010(L4_3011, L5_3012)
function L3_3010(A0_3022)
  local L1_3023
  L1_3023 = rawget
  L1_3023 = L1_3023(increment, "table_name")
  increment[L1_3023] = nil
  if not L1_3023 then
    return
  end
  if not SQLManager:Find(L1_3023) then
    return
  end
  SQLManager:Find(L1_3023):SetAutoIncrement(tonumber(A0_3022))
end
L4_3011 = {}
function L5_3012(A0_3024, A1_3025)
  return Global[A1_3025]
end
L4_3011.__index = L5_3012
L5_3012 = {}
function L6_3013(A0_3026, A1_3027)
  local L2_3028
  A0_3026.table_name = A1_3027
  L2_3028 = L3_3010
  return L2_3028
end
L5_3012.__index = L6_3013
L6_3013 = setmetatable
L7_3014 = update
L6_3013(L7_3014, L4_3011)
L6_3013 = setmetatable
L7_3014 = increment
L6_3013(L7_3014, L5_3012)
function L6_3013(A0_3029)
  for _FORV_4_, _FORV_5_ in pairs(A0_3029) do
    Config[_FORV_4_] = _FORV_5_
  end
end
L7_3014 = {}
function L7_3014.__index(A0_3030, A1_3031)
  local L2_3032
  L2_3032 = L6_3013
  return L2_3032
end
setmetatable(config, L7_3014)
