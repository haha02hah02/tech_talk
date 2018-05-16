local L1_3785
function L0_3784(A0_3786)
  if A0_3786 == nil then
    return
  end
  if A0_3786.Type == Json_False then
    return false
  end
  if A0_3786.Type == Json_True then
    return true
  end
  if A0_3786.Type == Json_NULL then
    return nil
  end
  if A0_3786.Type == Json_Number then
    return A0_3786.ValueFloat
  end
  if A0_3786.Type == Json_Int then
    return A0_3786.ValueInt
  end
  if A0_3786.Type == Json_String then
    return A0_3786.ValueString
  end
  if A0_3786.Type == Json_Object then
    return JsonObject(A0_3786)
  end
  if A0_3786.Type == Json_Array then
    return JsonArray(A0_3786)
  end
end
SwitchJsonData = L0_3784
function L0_3784(A0_3787, A1_3788)
  local L2_3789
  if A0_3787 == nil then
    return
  end
  if A1_3788 == nil then
    return
  end
  L2_3789 = A1_3788.Child
  if L2_3789 == nil then
    A1_3788.Child = A0_3787
    return
  end
  L2_3789 = A1_3788.Child
  while L2_3789.Next do
    L2_3789 = L2_3789.Next
  end
  L2_3789.Next = A0_3787
  A0_3787.Prev = L2_3789
end
SetJsonDataParent = L0_3784
function L0_3784(A0_3790, A1_3791)
  local L2_3792, L3_3793, L4_3794
  L2_3792 = A0_3790.Type
  L3_3793 = Json_NULL
  if L2_3792 == L3_3793 then
    return
  end
  L2_3792 = A0_3790.Type
  L3_3793 = Json_False
  if L2_3792 == L3_3793 then
    if A1_3791 then
      L2_3792 = "false"
      return L2_3792
    end
    L2_3792 = string
    L2_3792 = L2_3792.format
    L3_3793 = "\"%s\":false"
    L4_3794 = A0_3790.Name
    return L2_3792(L3_3793, L4_3794)
  end
  L2_3792 = A0_3790.Type
  L3_3793 = Json_True
  if L2_3792 == L3_3793 then
    if A1_3791 then
      L2_3792 = "true"
      return L2_3792
    end
    L2_3792 = string
    L2_3792 = L2_3792.format
    L3_3793 = "\"%s\":true"
    L4_3794 = A0_3790.Name
    return L2_3792(L3_3793, L4_3794)
  end
  L2_3792 = A0_3790.Type
  L3_3793 = Json_Number
  if L2_3792 == L3_3793 then
    if A1_3791 then
      L2_3792 = string
      L2_3792 = L2_3792.format
      L3_3793 = "%f"
      L4_3794 = A0_3790.ValueFloat
      return L2_3792(L3_3793, L4_3794)
    end
    L2_3792 = string
    L2_3792 = L2_3792.format
    L3_3793 = "\"%s\":%f"
    L4_3794 = A0_3790.Name
    return L2_3792(L3_3793, L4_3794, A0_3790.ValueFloat)
  end
  L2_3792 = A0_3790.Type
  L3_3793 = Json_Int
  if L2_3792 == L3_3793 then
    if A1_3791 then
      L2_3792 = string
      L2_3792 = L2_3792.format
      L3_3793 = "%d"
      L4_3794 = A0_3790.ValueInt
      return L2_3792(L3_3793, L4_3794)
    end
    L2_3792 = string
    L2_3792 = L2_3792.format
    L3_3793 = "\"%s\":%d"
    L4_3794 = A0_3790.Name
    return L2_3792(L3_3793, L4_3794, A0_3790.ValueInt)
  end
  L2_3792 = A0_3790.Type
  L3_3793 = Json_String
  if L2_3792 == L3_3793 then
    if A1_3791 then
      L2_3792 = A0_3790.ValueString
      return L2_3792
    end
    L2_3792 = string
    L2_3792 = L2_3792.format
    L3_3793 = "\"%s\":\"%s\""
    L4_3794 = A0_3790.Name
    return L2_3792(L3_3793, L4_3794, A0_3790.ValueString)
  end
  L2_3792 = A0_3790.Type
  L3_3793 = Json_Object
  if L2_3792 == L3_3793 then
    L2_3792 = {}
    L3_3793 = Instance
    L4_3794 = A0_3790.Child
    L3_3793 = L3_3793(L4_3794)
    while L3_3793 do
      L4_3794 = MakeJsonString
      L4_3794 = L4_3794(L3_3793)
      if L4_3794 then
        table.insert(L2_3792, L4_3794)
      end
      L3_3793 = Instance(L3_3793.Next)
    end
    if not A1_3791 then
      L4_3794 = A0_3790.Name
    elseif L4_3794 == "" then
      L4_3794 = string
      L4_3794 = L4_3794.format
      return L4_3794("{%s}", table.concat(L2_3792, ","))
    end
    L4_3794 = string
    L4_3794 = L4_3794.format
    return L4_3794("\"%s\":{%s}", A0_3790.Name, table.concat(L2_3792, ","))
  end
  L2_3792 = A0_3790.Type
  L3_3793 = Json_Array
  if L2_3792 ~= L3_3793 then
    return
  end
  L2_3792 = {}
  L3_3793 = Instance
  L4_3794 = A0_3790.Child
  L3_3793 = L3_3793(L4_3794)
  while L3_3793 do
    L4_3794 = MakeJsonString
    L4_3794 = L4_3794(L3_3793, true)
    if L4_3794 then
      table.insert(L2_3792, L4_3794)
    end
    L3_3793 = Instance(L3_3793.Next)
  end
  if not A1_3791 then
    L4_3794 = A0_3790.Name
  elseif L4_3794 == "" then
    L4_3794 = string
    L4_3794 = L4_3794.format
    return L4_3794("[%s]", table.concat(L2_3792, ","))
  end
  L4_3794 = string
  L4_3794 = L4_3794.format
  return L4_3794("\"%s\":[%s]", A0_3790.Name, table.concat(L2_3792, ","))
end
MakeJsonString = L0_3784
function L0_3784(A0_3795, A1_3796)
  if type(A1_3796) == "nil" then
    return
  end
  if type(A1_3796) == "string" then
    A0_3795.Type = Json_String
    A0_3795.ValueString = A1_3796
    return
  end
  if type(A1_3796) == "boolean" then
    A0_3795.Type = A1_3796 and Json_True or Json_False
    return
  end
  if type(A1_3796) == "number" then
    if isinteger(A1_3796) then
      A0_3795.Type = Json_Int
      A0_3795.ValueInt = A1_3796
    else
      A0_3795.Type = Json_Number
      A0_3795.ValueFloat = A1_3796
    end
    return
  end
end
SetJsonData = L0_3784
function L0_3784(A0_3797)
  local L1_3798, L2_3799
  L1_3798 = A0_3797.Type
  if L1_3798 then
    L2_3799 = A0_3797.this
  elseif not L2_3799 then
    return
  end
  L2_3799 = Json_False
  if L1_3798 == L2_3799 then
    L2_3799 = true
    return L2_3799
  end
  L2_3799 = Json_True
  if L1_3798 == L2_3799 then
    L2_3799 = true
    return L2_3799
  end
  L2_3799 = Json_NULL
  if L1_3798 == L2_3799 then
    L2_3799 = true
    return L2_3799
  end
  L2_3799 = Json_Number
  if L1_3798 == L2_3799 then
    L2_3799 = true
    return L2_3799
  end
  L2_3799 = Json_Int
  if L1_3798 == L2_3799 then
    L2_3799 = true
    return L2_3799
  end
  L2_3799 = Json_String
  if L1_3798 == L2_3799 then
    L2_3799 = true
    return L2_3799
  end
  L2_3799 = Json_Object
  if L1_3798 == L2_3799 then
    L2_3799 = true
    return L2_3799
  end
  L2_3799 = Json_Array
  if L1_3798 == L2_3799 then
    L2_3799 = true
    return L2_3799
  end
end
IsJsonTypeByData = L0_3784
function L0_3784(A0_3800, A1_3801, A2_3802)
  local L3_3803, L4_3804, L5_3805, L6_3806, L7_3807, L8_3808, L9_3809, L10_3810
  L3_3803 = type
  L4_3804 = A1_3801
  L3_3803 = L3_3803(L4_3804)
  if L3_3803 == "nil" then
    return
  end
  L4_3804 = Instance
  L5_3805 = A2_3802.Item
  L10_3810 = L5_3805(L6_3806, L7_3807)
  L4_3804 = L4_3804(L5_3805, L6_3806, L7_3807, L8_3808, L9_3809, L10_3810, L5_3805(L6_3806, L7_3807))
  if L4_3804 then
    L5_3805 = SetJsonData
    L5_3805(L6_3806, L7_3807)
    return
  end
  L5_3805 = Instance
  L10_3810 = L6_3806()
  L5_3805 = L5_3805(L6_3806, L7_3807, L8_3808, L9_3809, L10_3810, L6_3806())
  if L5_3805 == nil then
    return
  end
  L5_3805.Name = A0_3800
  if L3_3803 == "string" then
    L5_3805.Type = L6_3806
    L5_3805.ValueString = A1_3801
    L6_3806(L7_3807, L8_3808)
    return
  end
  if L3_3803 == "boolean" then
    if A1_3801 then
    else
    end
    L5_3805.Type = L6_3806
    L6_3806(L7_3807, L8_3808)
    return
  end
  if L3_3803 == "number" then
    if L6_3806 then
      L5_3805.Type = L6_3806
      L5_3805.ValueInt = A1_3801
    else
      L5_3805.Type = L6_3806
      L5_3805.ValueFloat = A1_3801
    end
    L6_3806(L7_3807, L8_3808)
    return
  end
  if L3_3803 ~= "table" then
    return
  end
  if not L6_3806 then
  elseif L6_3806 then
    L5_3805.Type = L6_3806
    L6_3806(L7_3807, L8_3808)
    for L9_3809, L10_3810 in L6_3806(L7_3807) do
      MakeJsonData(tostring(L9_3809), L10_3810, L5_3805)
    end
    return
  end
  L5_3805.Type = L6_3806
  L6_3806(L7_3807, L8_3808)
  for L9_3809, L10_3810 in L6_3806(L7_3807) do
    MakeJsonData(L9_3809, L10_3810, L5_3805)
  end
end
MakeJsonData = L0_3784
