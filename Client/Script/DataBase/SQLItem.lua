Class.SQLItem.NoneSQLItem({})
function SQLItem.Constructor(A0_3033, A1_3034, A2_3035, A3_3036)
  NoneSQLItem.Constructor(A0_3033, A1_3034, A2_3035, A3_3036)
  A0_3033:SetCheckCodeEnable(true)
  A0_3033.__table = SQLManager:Find(rawget(A0_3033, "__this"))
end
function SQLItem.SetModify(A0_3037)
  local L1_3038
  L1_3038 = A0_3037.__table
  if L1_3038 then
    L1_3038:SetModify()
  end
end
function SQLItem.CreateTable(A0_3039, A1_3040)
  return SQLTable(A1_3040, A0_3039.__format, A0_3039.__formatindex, A0_3039.__flags, A0_3039.__saveable, A0_3039.__ignore)
end
function SQLItem.SetCheckCodeEnable(A0_3041, A1_3042)
  A0_3041.___checkcode = A1_3042
end
function SQLItem.CreateCheckCode(A0_3043, A1_3044, A2_3045)
  local L3_3046, L4_3047, L5_3048, L6_3049, L7_3050, L8_3051, L9_3052
  L3_3046 = A0_3043.__format
  if not L3_3046 then
    return
  end
  L3_3046 = {}
  for L7_3050, L8_3051 in L4_3047(L5_3048) do
    L9_3052 = nil
    if L8_3051 == A1_3044 then
      L9_3052 = A2_3045
    else
      L9_3052 = rawget(A0_3043, L8_3051)
    end
    if L9_3052 ~= nil then
      table.insert(L3_3046, TypeToString(L9_3052))
    end
  end
  L7_3050 = L3_3046
  L9_3052 = L6_3049(L7_3050)
  L9_3052 = L5_3048(L6_3049, L7_3050, L8_3051, L9_3052, L6_3049(L7_3050))
  return L4_3047(L5_3048, L6_3049, L7_3050, L8_3051, L9_3052, L5_3048(L6_3049, L7_3050, L8_3051, L9_3052, L6_3049(L7_3050)))
end
function SQLItem.Verify(A0_3053)
  local L1_3054
  L1_3054 = A0_3053.___checkcode
  if L1_3054 then
    L1_3054 = A0_3053.__format
  elseif not L1_3054 then
    L1_3054 = true
    return L1_3054
  end
  L1_3054 = A0_3053.check_code
  if not L1_3054 then
    L1_3054 = true
    return L1_3054
  end
  L1_3054 = A0_3053.check_code
  if L1_3054 == A0_3053:CreateCheckCode() then
    L1_3054 = true
    return L1_3054
  end
  L1_3054 = Platform
  if L1_3054 == Platform_Windows then
    L1_3054 = Log
    L1_3054(A0_3053:MakeString())
  end
end
function SQLItem.UpdateStatus(A0_3055)
  if not rawget(A0_3055, "S") then
    rawset(A0_3055, "S", "M")
  end
end
function SQLItem.SnapshootClean(A0_3056)
  if not rawget(A0_3056, "__table") then
    return
  end
  rawget(A0_3056, "__table"):SnapshootItemClean(A0_3056)
end
function SQLItem.MemberNewIndex(A0_3057, A1_3058, A2_3059)
  local L3_3060
  L3_3060 = rawget
  L3_3060 = L3_3060(A0_3057, A1_3058)
  if L3_3060 == A2_3059 then
    return
  end
  L3_3060 = A0_3057.___checkcode
  if not L3_3060 then
    L3_3060 = true
    return L3_3060
  end
  L3_3060 = string
  L3_3060 = L3_3060.find
  L3_3060 = L3_3060(A1_3058, "__")
  if L3_3060 then
    L3_3060 = true
    return L3_3060
  end
  L3_3060 = A0_3057.__format
  if not L3_3060 then
    L3_3060 = A0_3057.UpdateStatus
    L3_3060(A0_3057)
    L3_3060 = A0_3057.SetModify
    L3_3060(A0_3057)
    L3_3060 = true
    return L3_3060
  end
  L3_3060 = A0_3057.__formatindex
  L3_3060 = L3_3060[A1_3058]
  if not L3_3060 then
    L3_3060 = A0_3057.UpdateStatus
    L3_3060(A0_3057)
    L3_3060 = A0_3057.SetModify
    L3_3060(A0_3057)
    L3_3060 = true
    return L3_3060
  end
  L3_3060 = A0_3057.check_code
  if L3_3060 then
    L3_3060 = A0_3057.check_code
    if L3_3060 ~= A0_3057:CreateCheckCode() then
      return
    end
  end
  L3_3060 = A0_3057.UpdateStatus
  L3_3060(A0_3057)
  L3_3060 = A0_3057.___times
  if L3_3060 then
    L3_3060 = rawset
    L3_3060(A0_3057, "mtime", os.time())
  end
  L3_3060 = A0_3057.CreateCheckCode
  L3_3060 = L3_3060(A0_3057, A1_3058, A2_3059)
  rawset(A0_3057, "check_code", L3_3060)
  A0_3057:SetModify()
  return true
end
function SQLItem.OnSaveBefore(A0_3061)
  NoneSQLItem.OnSaveBefore(A0_3061)
end
