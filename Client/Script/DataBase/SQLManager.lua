L0_3062 = Class
L0_3062 = L0_3062.SQLManagerImpl
L0_3062 = L0_3062.None
L0_3062({})
L0_3062 = SQLManagerImpl
function L0_3062.Constructor(A0_3063)
  A0_3063.tDBList = {}
  A0_3063.bSyncLoading = false
  A0_3063.bForceSync = false
end
L0_3062 = SQLManagerImpl
function L0_3062.Find(A0_3064, A1_3065)
  local L2_3066
  L2_3066 = A0_3064.tDBList
  L2_3066 = L2_3066[A1_3065]
  if L2_3066 then
    return L2_3066
  end
  return Global[A1_3065]:CreateTable(A1_3065)
end
L0_3062 = SQLManagerImpl
function L0_3062.SetTable(A0_3067, A1_3068, A2_3069)
  A0_3067.tDBList[A1_3068] = A2_3069
end
L0_3062 = SQLManagerImpl
function L0_3062.CreateTableItem(A0_3070, A1_3071, A2_3072)
  A0_3070:Find(A1_3071):CreateItem(A2_3072)
end
L0_3062 = SQLManagerImpl
function L0_3062.FilterItem(A0_3073, A1_3074)
  local L2_3075, L3_3076, L4_3077, L5_3078, L6_3079, L7_3080
  L2_3075 = A1_3074.S
  if L2_3075 == "D" then
    L2_3075 = {}
    L2_3075.serial = L3_3076
    L2_3075.belong = L3_3076
    return L2_3075
  end
  L2_3075 = {}
  for L6_3079, L7_3080 in L3_3076(L4_3077) do
    if A1_3074.Filter(L6_3079, L7_3080) then
      if L6_3079 == "extra" then
        L2_3075[L6_3079] = TypeToString(L7_3080)
      elseif L6_3079 == "stochastic" then
        L2_3075[L6_3079] = TypeToString(L7_3080)
      elseif L6_3079 == "data" then
        L2_3075[L6_3079] = TypeToString(L7_3080)
      else
        L2_3075[L6_3079] = L7_3080
      end
    end
  end
  return L2_3075
end
L0_3062 = SQLManagerImpl
function L0_3062.FilterTable(A0_3081, A1_3082, A2_3083)
  local L3_3084, L4_3085, L5_3086, L6_3087, L7_3088, L8_3089
  L3_3084 = {}
  for L7_3088, L8_3089 in L4_3085(L5_3086) do
    if A1_3082 ~= "Setting" or L8_3089.name ~= "default" then
      table.insert(L3_3084, A0_3081:FilterItem(L8_3089))
    end
  end
  return L3_3084
end
L0_3062 = SQLManagerImpl
function L0_3062.Snapshoot(A0_3090)
  for _FORV_6_, _FORV_7_ in pairs(A0_3090.tDBList) do
    if #_FORV_7_:Snapshoot() ~= 0 then
      ;({})[_FORV_6_] = _FORV_7_:Snapshoot()
    end
  end
  if true then
    return {}
  end
end
L0_3062 = SQLManagerImpl
function L0_3062.SnapshootJson(A0_3091)
  local L1_3092, L2_3093, L3_3094, L4_3095, L5_3096, L6_3097, L7_3098
  L1_3092 = JsonObject
  L1_3092 = L1_3092()
  for L5_3096, L6_3097 in L2_3093(L3_3094) do
    L7_3098 = L6_3097.Snapshoot
    L7_3098 = L7_3098(L6_3097)
    if #L7_3098 ~= 0 then
      L1_3092[L5_3096] = A0_3091:FilterTable(L5_3096, L7_3098)
    end
  end
  return L1_3092
end
L0_3062 = SQLManagerImpl
function L0_3062.SnapshootClean(A0_3099, A1_3100)
  if not A1_3100 then
    for _FORV_5_, _FORV_6_ in pairs(A0_3099.tDBList) do
      _FORV_6_:SnapshootClean()
    end
    return
  end
  if not A0_3099.tDBList[A1_3100] then
    return
  end
  A0_3099.tDBList[A1_3100]:SnapshootClean()
end
L0_3062 = SQLManagerImpl
function L0_3062.IsManipulationData(A0_3101)
  for _FORV_4_, _FORV_5_ in pairs(A0_3101.tDBList) do
    if _FORV_5_:IsManipulationData() then
      return true
    end
  end
end
L0_3062 = SQLManagerImpl
function L0_3062.CheckManipulationData(A0_3102)
  local L1_3103
  L1_3103 = A0_3102.IsManipulationData
  L1_3103 = L1_3103(A0_3102)
  if not L1_3103 then
    return
  end
  L1_3103 = Account
  L1_3103 = L1_3103.Find
  L1_3103 = L1_3103(L1_3103)
  for _FORV_5_, _FORV_6_ in pairs(L1_3103) do
    _FORV_6_.ban = 1
    _FORV_6_.ban_comment = "sql_data"
  end
end
function L0_3062(A0_3104)
  local L1_3105, L2_3106, L3_3107, L4_3108, L5_3109, L6_3110
  L1_3105 = A0_3104.S
  if L1_3105 == "D" then
    L1_3105 = {}
    L1_3105.serial = L2_3106
    L1_3105.belong = L2_3106
    L1_3105.S = "D"
    return L1_3105
  end
  L1_3105 = {}
  for L5_3109, L6_3110 in L2_3106(L3_3107) do
    if A0_3104.Filter(L5_3109, L6_3110) then
      if L5_3109 == "stochastic" then
        L1_3105[L5_3109] = TypeToString(L6_3110)
      elseif L5_3109 == "data" then
        L1_3105[L5_3109] = TypeToString(L6_3110)
      else
        L1_3105[L5_3109] = L6_3110
      end
    end
  end
  return L1_3105
end
function SQLManagerImpl.MakeFilterTable(A0_3111, A1_3112, A2_3113)
  local L3_3114, L4_3115, L5_3116, L6_3117, L7_3118, L8_3119, L9_3120
  L3_3114 = {}
  for L7_3118, L8_3119 in L4_3115(L5_3116) do
    if A1_3112 == "Setting" then
      L9_3120 = L8_3119.name
    elseif L9_3120 ~= "default" then
      if A1_3112 ~= "Account" then
        L9_3120 = L8_3119.belong
      elseif L9_3120 then
        L9_3120 = L0_3062
        L9_3120 = L9_3120(L8_3119)
        if L9_3120 then
          table.insert(L3_3114, L9_3120)
        end
      end
    end
  end
  if L4_3115 ~= 0 then
    return L3_3114
  end
end
function SQLManagerImpl.SnapshootResponse(A0_3121, A1_3122, A2_3123, A3_3124)
  local L4_3125, L5_3126, L6_3127, L7_3128, L8_3129
  A0_3121.bSyncLoading = false
  if A1_3122 == -1 then
    L4_3125(L5_3126)
    return
  end
  if A1_3122 ~= 0 then
    return
  end
  for L7_3128, L8_3129 in L4_3125(L5_3126) do
    for _FORV_12_, _FORV_13_ in pairs(L8_3129) do
      _FORV_13_:SnapshootClean()
    end
  end
  if L4_3125 then
    L4_3125(L5_3126)
  end
  return
end
function SQLManagerImpl.SyncData(A0_3130)
  local L1_3131, L2_3132, L3_3133, L4_3134, L5_3135, L6_3136, L7_3137, L8_3138
  L2_3132 = A0_3130
  L1_3131 = A0_3130.CheckManipulationData
  L1_3131(L2_3132)
  L1_3131 = JsonObject
  L1_3131 = L1_3131()
  L2_3132 = SQLManager
  L3_3133 = L2_3132
  L2_3132 = L2_3132.Snapshoot
  L2_3132 = L2_3132(L3_3133)
  if not L2_3132 then
    return
  end
  L3_3133 = false
  for L7_3137, L8_3138 in L4_3134(L5_3135) do
    if A0_3130:MakeFilterTable(L7_3137, L8_3138) then
      L1_3131[L7_3137], L3_3133 = A0_3130:MakeFilterTable(L7_3137, L8_3138), true
    end
  end
  if L3_3133 then
    return L1_3131
  end
end
function SQLManagerImpl.IsClean(A0_3139)
  local L1_3140, L2_3141, L3_3142, L4_3143, L5_3144, L6_3145
  L1_3140 = SQLManager
  L1_3140 = L1_3140.Snapshoot
  L1_3140 = L1_3140(L2_3141)
  if not L1_3140 then
    return L2_3141
  end
  for L5_3144, L6_3145 in L2_3141(L3_3142) do
    if A0_3139:MakeFilterTable(L5_3144, L6_3145) then
      return false
    end
  end
  return L2_3141
end
function SQLManagerImpl.SyncToService(A0_3146)
  local L1_3147, L2_3148, L3_3149, L4_3150, L5_3151, L6_3152, L7_3153
  L1_3147 = A0_3146.bSyncLoading
  if L1_3147 then
    A0_3146.bForceSync = true
    return
  end
  L2_3148 = A0_3146
  L1_3147 = A0_3146.CheckManipulationData
  L1_3147(L2_3148)
  A0_3146.bSyncLoading = true
  A0_3146.bForceSync = false
  L1_3147 = SQLManager
  L2_3148 = L1_3147
  L1_3147 = L1_3147.Snapshoot
  L1_3147 = L1_3147(L2_3148)
  A0_3146.tSyncData = L1_3147
  L1_3147 = A0_3146.tSyncData
  if not L1_3147 then
    A0_3146.bSyncLoading = false
    return
  end
  L1_3147 = false
  L2_3148 = {}
  for L6_3152, L7_3153 in L3_3149(L4_3150) do
    if A0_3146:MakeFilterTable(L6_3152, L7_3153) then
      L2_3148[L6_3152], L1_3147 = A0_3146:MakeFilterTable(L6_3152, L7_3153), true
    end
  end
  if not L1_3147 then
    A0_3146.bSyncLoading = false
    return
  end
  L6_3152 = A0_3146
  L7_3153 = A0_3146.SnapshootResponse
  L3_3149(L4_3150, L5_3151, L6_3152, L7_3153)
end
function SQLManagerImpl.IsException(A0_3154, A1_3155, A2_3156)
  if not A1_3155 or not A2_3156 then
    return
  end
  for _FORV_6_, _FORV_7_ in pairs(A2_3156) do
    if A1_3155 == _FORV_7_ then
      return true
    end
  end
end
function SQLManagerImpl.CleanAll(A0_3157, A1_3158)
  local L2_3159, L3_3160, L4_3161, L5_3162
  for L5_3162, _FORV_6_ in L2_3159(L3_3160) do
    if not A0_3157:IsException(L5_3162, A1_3158) then
      _FORV_6_:Clean()
    end
  end
end
function SQLManagerImpl.DeleteAll(A0_3163)
  for _FORV_4_, _FORV_5_ in pairs(A0_3163.tDBList) do
    _FORV_5_:Delete()
  end
end
function SQLManagerImpl.SaveAll(A0_3164)
  for _FORV_4_, _FORV_5_ in pairs(A0_3164.tDBList) do
    _FORV_5_:Save(true)
  end
end
function SQLManagerImpl.SaveAllForce(A0_3165)
  for _FORV_4_, _FORV_5_ in pairs(A0_3165.tDBList) do
    _FORV_5_:SaveForce(true)
  end
end
function SQLManagerImpl.Destructor(A0_3166)
  local L1_3167
end
Global.SQLManager = SQLManagerImpl()
