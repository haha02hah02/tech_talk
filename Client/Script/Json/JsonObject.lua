Class.JsonObject.Json({})
function JsonObject.Constructor(A0_3811, A1_3812)
  local L2_3813
  if A1_3812 ~= nil then
    L2_3813 = rawset
    L2_3813(A0_3811, "this", A1_3812)
    return
  end
  L2_3813 = Json
  L2_3813 = L2_3813()
  if not L2_3813 then
    return
  end
  L2_3813.Type = Json_Object
  rawset(A0_3811, "this", L2_3813)
end
function JsonObject.MemberIndex(A0_3814, A1_3815)
  local L2_3816, L3_3817
  L2_3816 = rawget
  L3_3817 = A0_3814
  L2_3816 = L2_3816(L3_3817, "this")
  if L2_3816 == nil then
    return
  end
  L3_3817 = L2_3816.Item
  L3_3817 = L3_3817(L2_3816, A1_3815)
  if L3_3817 == nil then
    return
  end
  return SwitchJsonData(L3_3817)
end
function JsonObject.First(A0_3818)
  local L1_3819, L2_3820
  L1_3819 = rawget
  L2_3820 = A0_3818
  L1_3819 = L1_3819(L2_3820, "this")
  if not L1_3819 then
    return
  end
  L2_3820 = Instance
  L2_3820 = L2_3820(L1_3819.Child)
  rawset(A0_3818, "nchild", L2_3820)
  if not L2_3820 then
    return
  end
  return SwitchJsonData(L2_3820)
end
function JsonObject.Next(A0_3821)
  local L1_3822, L2_3823
  L1_3822 = rawget
  L2_3823 = A0_3821
  L1_3822 = L1_3822(L2_3823, "nchild")
  if not L1_3822 then
    return
  end
  L2_3823 = Instance
  L2_3823 = L2_3823(L1_3822.Next)
  rawset(A0_3821, "nchild", L2_3823)
  if not L2_3823 then
    return
  end
  return SwitchJsonData(L2_3823)
end
function JsonObject.MemberNewIndex(A0_3824, A1_3825, A2_3826)
  local L3_3827
  L3_3827 = rawget
  L3_3827 = L3_3827(A0_3824, "this")
  if L3_3827 == nil then
    return
  end
  MakeJsonData(A1_3825, A2_3826, L3_3827)
end
function JsonObject.String(A0_3828)
  local L1_3829
  L1_3829 = rawget
  L1_3829 = L1_3829(A0_3828, "this")
  if not L1_3829 then
    return
  end
  return MakeJsonString(L1_3829)
end
