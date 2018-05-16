L0_3168 = 10000
Class.SQLTable.NoneSQL({})
function SQLTable.Constructor(A0_3169, A1_3170, A2_3171, A3_3172, A4_3173, A5_3174, A6_3175)
  A0_3169.__serial = L0_3168 - 1
  A0_3169.__format = A2_3171
  A0_3169.__formatindex = A3_3172
  A0_3169.__flags = A4_3173
  A0_3169.bIgnore = A6_3175
  NoneSQL.Constructor(A0_3169, A1_3170, A5_3174)
end
function SQLTable.Snapshoot(A0_3176)
  local L1_3177, L2_3178, L3_3179, L4_3180, L5_3181, L6_3182
  L1_3177 = A0_3176.bIgnore
  if L1_3177 then
    L1_3177 = {}
    return L1_3177
  end
  L1_3177 = {}
  for L5_3181, L6_3182 in L2_3178(L3_3179) do
    if rawget(L6_3182, "S") then
      table.insert(L1_3177, L6_3182)
    end
  end
  return L1_3177
end
function SQLTable.SetAutoIncrement(A0_3183, A1_3184)
  if type(A1_3184) ~= "number" then
    return
  end
  A0_3183.__serial = A1_3184
end
function SQLTable.Clean(A0_3185, A1_3186)
  NoneSQL.Clean(A0_3185, A1_3186)
  if A1_3186 then
    return
  end
  A0_3185.__serial = L0_3168 - 1
end
function SQLTable.SnapshootCleanForItem(A0_3187, A1_3188)
  if not A1_3188 then
    return
  end
  if not rawget(A1_3188, "S") then
    return
  end
  A0_3187:SetModify()
  rawset(A1_3188, "S", nil)
  if rawget(A1_3188, "S") ~= "D" then
    return
  end
  A0_3187.tList[A1_3188:ID()] = nil
end
function SQLTable.SnapshootClean(A0_3189)
  local L1_3190, L2_3191, L3_3192, L4_3193, L5_3194
  for L4_3193, L5_3194 in L1_3190(L2_3191) do
    A0_3189:SnapshootCleanForItem(L5_3194)
  end
end
function SQLTable.SnapshootItemClean(A0_3195, A1_3196)
  local L2_3197
  L2_3197 = A0_3195.tList
  L2_3197 = L2_3197[A1_3196:ID()]
  if not L2_3197 then
    return
  end
  A0_3195:SnapshootCleanForItem(L2_3197)
end
function SQLTable.CheckCodeVerify(A0_3198, A1_3199)
  local L2_3200
  L2_3200 = A1_3199.check_code
  if L2_3200 then
    return
  end
  L2_3200 = A1_3199:CreateCheckCode()
  if not L2_3200 then
    return
  end
  A1_3199.check_code = L2_3200
end
function SQLTable.OnItemInsert(A0_3201, A1_3202)
  local L2_3203, L3_3204
  L2_3203 = rawset
  L3_3204 = A1_3202
  L2_3203(L3_3204, "__format", A0_3201.__format)
  L2_3203 = rawset
  L3_3204 = A1_3202
  L2_3203(L3_3204, "__formatindex", A0_3201.__formatindex)
  L2_3203 = rawget
  L3_3204 = A1_3202
  L2_3203 = L2_3203(L3_3204, "serial")
  if L2_3203 == 0 then
    L3_3204 = A0_3201.__serial
    L2_3203 = L3_3204 + 1
    L3_3204 = rawset
    L3_3204(A1_3202, "serial", L2_3203)
  end
  if L2_3203 then
    L3_3204 = A0_3201.__serial
    if L2_3203 > L3_3204 then
      A0_3201.__serial = L2_3203
    end
  end
  if not L2_3203 then
    L3_3204 = A0_3201.__serial
    L3_3204 = L3_3204 + 1
    A0_3201.__serial = L3_3204
    L3_3204 = A0_3201.__serial
    A1_3202.serial = L3_3204
  end
  L3_3204 = A0_3201.CheckCodeVerify
  L3_3204(A0_3201, A1_3202)
  L3_3204 = A0_3201.__flags
  if not L3_3204 then
    return
  end
  L3_3204 = DumpTableValueForKey
  L3_3204(A0_3201.__flags, A1_3202)
  L3_3204 = rawget
  L3_3204 = L3_3204(A1_3202, "___times")
  if not L3_3204 then
    return
  end
  L3_3204 = rawget
  L3_3204 = L3_3204(A1_3202, "ctime")
  if L3_3204 then
    return
  end
  L3_3204 = os
  L3_3204 = L3_3204.time
  L3_3204 = L3_3204()
  rawset(A1_3202, "ctime", L3_3204)
  rawset(A1_3202, "mtime", L3_3204)
end
