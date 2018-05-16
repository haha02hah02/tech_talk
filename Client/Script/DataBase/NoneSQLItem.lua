Class.NoneSQLItem.None({})
function NoneSQLItem.Constructor(A0_2934, A1_2935, A2_2936, A3_2937)
  DumpTable(A2_2936 or {}, A0_2934)
  A0_2934.__this = A1_2935
  A0_2934.__inserted = true
  if not A3_2937 then
    A0_2934:InsertForTable()
  end
end
function NoneSQLItem.Source(A0_2938)
  local L1_2939
  L1_2939 = "none_sql_db"
  return L1_2939
end
function NoneSQLItem.ID(A0_2940)
  return rawget(A0_2940, "serial")
end
function NoneSQLItem.InsertForTable(A0_2941)
  if not SQLManager:Find(A0_2941.__this) then
    A0_2941.__inserted = false
    return
  end
  SQLManager:Find(A0_2941.__this):InsertItem(A0_2941)
  SQLManager:Find(A0_2941.__this):SetModify()
end
function NoneSQLItem.OnSaveBefore(A0_2942)
  local L1_2943
end
function NoneSQLItem.CreateWhereFormat(A0_2944, A1_2945)
  local L2_2946, L3_2947, L4_2948, L5_2949, L6_2950, L7_2951, L8_2952, L9_2953, L10_2954, L11_2955, L12_2956, L13_2957, L14_2958, L15_2959
  if not A1_2945 then
    return
  end
  L2_2946 = string
  L2_2946 = L2_2946.len
  L3_2947 = A1_2945
  L2_2946 = L2_2946(L3_2947)
  L3_2947 = A1_2945
  L4_2948 = {}
  repeat
    L5_2949 = string
    L5_2949 = L5_2949.find
    L6_2950 = L3_2947
    L7_2951 = "^.-([%w-_]+).-"
    L7_2951 = L5_2949(L6_2950, L7_2951)
    if L5_2949 then
      L8_2952 = string
      L8_2952 = L8_2952.sub
      L9_2953 = L3_2947
      L10_2954 = L6_2950 + 1
      L8_2952 = L8_2952(L9_2953, L10_2954)
      L3_2947 = L8_2952
      if L3_2947 and L3_2947 ~= "" then
        if L7_2951 ~= "and" and L7_2951 ~= "or" then
          L8_2952 = string
          L8_2952 = L8_2952.find
          L9_2953 = L3_2947
          L10_2954 = "^%s-(%p+)%s-"
          L10_2954 = L8_2952(L9_2953, L10_2954)
          if L8_2952 then
            L11_2955 = string
            L11_2955 = L11_2955.sub
            L12_2956 = L3_2947
            L13_2957 = L9_2953 + 1
            L11_2955 = L11_2955(L12_2956, L13_2957)
            L3_2947 = L11_2955
            if L3_2947 and L3_2947 ~= "" then
              L11_2955 = true
              L12_2956 = string
              L12_2956 = L12_2956.find
              L13_2957 = L3_2947
              L14_2958 = "^%s-'(.+)'%s-"
              L14_2958 = L12_2956(L13_2957, L14_2958)
              if not L14_2958 then
                L11_2955 = false
                L15_2959 = string
                L15_2959 = L15_2959.find
                L13_2957, L14_2958, L15_2959 = L3_2947, "^%s-(%--%w+)%s-", L15_2959(L3_2947, "^%s-(%--%w+)%s-")
                L12_2956 = L15_2959
              end
              if not L12_2956 then
                L15_2959 = ShowStack
                L15_2959()
                L15_2959 = error
                L15_2959(A1_2945 .. ", error!")
                break
              end
              L15_2959 = string
              L15_2959 = L15_2959.sub
              L15_2959 = L15_2959(L3_2947, L13_2957 + 1)
              L3_2947 = L15_2959
              L15_2959 = L4_2948[L7_2951]
              if not L15_2959 then
                L15_2959 = {}
                L4_2948[L7_2951] = L15_2959
              end
              table.insert(L15_2959, L10_2954)
              table.insert(L15_2959, L11_2955 and L14_2958 or tonumber(L14_2958))
            end
          end
        end
      end
    end
  until not L3_2947 or L3_2947 == ""
  return L4_2948
end
function NoneSQLItem.Find(A0_2960, A1_2961, A2_2962, A3_2963, A4_2964)
  local L5_2965
  L5_2965 = rawget
  L5_2965 = L5_2965(A0_2960, "__this")
  if not L5_2965 then
    L5_2965 = A0_2960.Source
    L5_2965 = L5_2965(A0_2960)
  end
  if not SQLManager:Find(L5_2965) then
    return {}
  end
  return SQLManager:Find(L5_2965):Find(A0_2960:CreateWhereFormat(A1_2961), A2_2962, A3_2963, A4_2964)
end
function NoneSQLItem.One(A0_2966, A1_2967)
  local L2_2968
  L2_2968 = rawget
  L2_2968 = L2_2968(A0_2966, "__this")
  if not L2_2968 then
    L2_2968 = A0_2966.Source
    L2_2968 = L2_2968(A0_2966)
  end
  if not SQLManager:Find(L2_2968) then
    return
  end
  return SQLManager:Find(L2_2968):One(A0_2966:CreateWhereFormat(A1_2967))
end
function NoneSQLItem.FindByID(A0_2969, A1_2970)
  local L2_2971
  L2_2971 = rawget
  L2_2971 = L2_2971(A0_2969, "__this")
  if not L2_2971 then
    L2_2971 = A0_2969.Source
    L2_2971 = L2_2971(A0_2969)
  end
  if not SQLManager:Find(L2_2971) then
    return
  end
  return SQLManager:Find(L2_2971):FindByID(A1_2970)
end
function NoneSQLItem.Sum(A0_2972, A1_2973, A2_2974)
  local L3_2975
  L3_2975 = rawget
  L3_2975 = L3_2975(A0_2972, "__this")
  if not L3_2975 then
    L3_2975 = A0_2972.Source
    L3_2975 = L3_2975(A0_2972)
  end
  if not SQLManager:Find(L3_2975) then
    return 0
  end
  return SQLManager:Find(L3_2975):Sum(A1_2973, A0_2972:CreateWhereFormat(A2_2974))
end
function NoneSQLItem.Same(A0_2976, A1_2977, A2_2978)
  local L3_2979
  L3_2979 = rawget
  L3_2979 = L3_2979(A0_2976, "__this")
  if not L3_2979 then
    L3_2979 = A0_2976.Source
    L3_2979 = L3_2979(A0_2976)
  end
  if not SQLManager:Find(L3_2979) then
    return {}
  end
  return SQLManager:Find(L3_2979):Same(A1_2977, A0_2976:CreateWhereFormat(A2_2978))
end
function NoneSQLItem.Snapshoot(A0_2980)
  local L1_2981
  L1_2981 = rawget
  L1_2981 = L1_2981(A0_2980, "__this")
  if not L1_2981 then
    L1_2981 = A0_2980.Source
    L1_2981 = L1_2981(A0_2980)
  end
  if not SQLManager:Find(L1_2981) then
    return
  end
  return SQLManager:Find(L1_2981):Snapshoot()
end
function NoneSQLItem.SnapshootClean(A0_2982)
  local L1_2983
  L1_2983 = rawget
  L1_2983 = L1_2983(A0_2982, "__this")
  if not L1_2983 then
    L1_2983 = A0_2982.Source
    L1_2983 = L1_2983(A0_2982)
  end
  if not SQLManager:Find(L1_2983) then
    return
  end
  return SQLManager:Find(L1_2983):SnapshootClean()
end
function NoneSQLItem.Filter(A0_2984, A1_2985)
  if type(A0_2984) ~= "string" then
    return true
  end
  if type(A1_2985) == "function" then
    return
  end
  if A0_2984 == "S" then
    return true
  end
  if not string.find(A0_2984, "__") then
    return true
  end
end
function NoneSQLItem.MakeString(A0_2986)
  return TableToString(A0_2986, A0_2986.Filter)
end
function NoneSQLItem.Save(A0_2987, A1_2988)
  if not rawget(A0_2987, "__this") then
    if not SQLManager:Find(A0_2987:Source()) then
      return
    end
    SQLManager:Find(A0_2987:Source()):Save(A1_2988)
  else
    if not A0_2987.__inserted then
      return
    end
    if not SQLManager:Find(A0_2987.__this) then
      return
    end
    A0_2987:OnSaveBefore()
    return SQLManager:Find(A0_2987.__this):Save(A1_2988)
  end
end
function NoneSQLItem.Clean(A0_2989, A1_2990)
  if rawget(A0_2989, "__this") then
    if not SQLManager:Find(A0_2989.__this) then
      return
    end
    return SQLManager:Find(A0_2989.__this):CleanItem(A0_2989)
  end
  if not SQLManager:Find(A0_2989:Source()) then
    return
  end
  if not A1_2990 then
    return SQLManager:Find(A0_2989:Source()):Clean()
  end
  return SQLManager:Find(A0_2989:Source()):Clean(A0_2989:CreateWhereFormat(A1_2990))
end
function NoneSQLItem.Delete(A0_2991, A1_2992)
  if rawget(A0_2991, "__this") then
    if not SQLManager:Find(A0_2991.__this) then
      return
    end
    return SQLManager:Find(A0_2991.__this):DeleteItem(A0_2991)
  end
  if not SQLManager:Find(A0_2991:Source()) then
    return
  end
  if not A1_2992 then
    return SQLManager:Find(A0_2991:Source()):Delete()
  end
  return SQLManager:Find(A0_2991:Source()):Delete(A0_2991:CreateWhereFormat(A1_2992))
end
function NoneSQLItem.Destructor(A0_2993)
  local L1_2994
end
