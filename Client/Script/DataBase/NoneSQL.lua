local L1_2810
L0_2809 = nil
L1_2810 = false
Class.NoneSQL.None({})
function NoneSQL.Constructor(A0_2811, A1_2812, A2_2813)
  A0_2811.sName = A1_2812 or "none_sql_db"
  A0_2811.tList = {}
  A0_2811.bModify = false
  A0_2811.bSaveable = A2_2813
  SQLManager:SetTable(A0_2811.sName, A0_2811)
  if not A2_2813 then
    return
  end
  A0_2811.sFullName = string.format("%s%s", A0_2811:DestPath(), A1_2812)
  LoadDataFromFile(A0_2811.sFullName)
end
function NoneSQL.DestPath(A0_2814)
  return FileUtils:WritablePath()
end
function NoneSQL.Name(A0_2815)
  local L1_2816
  L1_2816 = A0_2815.sName
  return L1_2816
end
function NoneSQL.SetModify(A0_2817)
  local L1_2818
  A0_2817.bModify = true
end
function NoneSQL.CreateItem(A0_2819, A1_2820)
  local L2_2821
  L2_2821 = SQLItem
  L2_2821 = L2_2821(A0_2819.sName, A1_2820, true)
  A0_2819:OnItemInsert(L2_2821)
  if not rawget(L2_2821, "serial") then
    return
  end
  if A0_2819.tList[rawget(L2_2821, "serial")] then
    return
  end
  A0_2819.tList[rawget(L2_2821, "serial")] = L2_2821
end
function NoneSQL.OnItemInsert(A0_2822, A1_2823)
end
function NoneSQL.InsertItem(A0_2824, A1_2825)
  A0_2824:OnItemInsert(A1_2825)
  if not rawget(A1_2825, "serial") then
    return
  end
  if A0_2824.tList[rawget(A1_2825, "serial")] then
    return
  end
  A0_2824.tList[rawget(A1_2825, "serial")] = A1_2825
  rawset(A1_2825, "S", "N")
end
function NoneSQL.IsManipulationData(A0_2826)
  for _FORV_4_, _FORV_5_ in pairs(A0_2826.tList) do
    if not _FORV_5_:Verify() then
      Event:Fire("DataException", "sql_data")
      return true
    end
  end
end
function NoneSQL.CleanItem(A0_2827, A1_2828)
  local L2_2829
  L2_2829 = A0_2827.tList
  L2_2829 = L2_2829[A1_2828:ID()]
  if not L2_2829 then
    return
  end
  A0_2827.tList[A1_2828:ID()] = nil
  A0_2827:SetModify()
end
function NoneSQL.Clean(A0_2830, A1_2831)
  local L2_2832, L3_2833, L4_2834, L5_2835, L6_2836, L7_2837
  L2_2832 = A0_2830.bSaveable
  if L2_2832 then
    return
  end
  if not A1_2831 then
    L2_2832 = {}
    A0_2830.tList = L2_2832
    L2_2832 = A0_2830.SetModify
    L2_2832(L3_2833)
    return
  end
  L2_2832 = A0_2830.tList
  for L6_2836, L7_2837 in L3_2833(L4_2834) do
    if not A1_2831 or A0_2830:CheckCondition(L7_2837, A1_2831) then
      A0_2830.tList[L6_2836] = nil
      A0_2830:SetModify()
    end
  end
end
function NoneSQL.DeleteItem(A0_2838, A1_2839)
  local L2_2840
  L2_2840 = A0_2838.tList
  L2_2840 = L2_2840[A1_2839:ID()]
  if not L2_2840 then
    return
  end
  if not L2_2840:Verify() then
    Event:Fire("DataException", "sql_data")
  end
  if rawget(L2_2840, "S") == "N" then
    A0_2838.tList[A1_2839:ID()] = nil
  else
    rawset(L2_2840, "S", "D")
  end
  A0_2838:SetModify()
end
function NoneSQL.Delete(A0_2841, A1_2842)
  local L2_2843, L3_2844, L4_2845, L5_2846, L6_2847, L7_2848, L8_2849
  if not A1_2842 then
    L2_2843(L3_2844)
    L2_2843(L3_2844)
    for L5_2846, L6_2847 in L2_2843(L3_2844) do
      L7_2848 = rawget
      L8_2849 = L6_2847
      L7_2848 = L7_2848(L8_2849, "S")
      if L7_2848 == "N" then
        L8_2849 = A0_2841.tList
        L8_2849[L5_2846] = nil
      else
        L8_2849 = rawset
        L8_2849(L6_2847, "S", "D")
      end
    end
    return
  end
  for L7_2848, L8_2849 in L4_2845(L5_2846) do
    if not A1_2842 or A0_2841:CheckCondition(L8_2849, A1_2842) then
      if not L8_2849:Verify() then
      end
      if rawget(L8_2849, "S") == "N" then
        A0_2841.tList[L7_2848] = nil
      else
        rawset(L8_2849, "S", "D")
      end
      A0_2841:SetModify()
    end
  end
  if not L3_2844 then
    return
  end
  L7_2848 = "sql_data"
  L4_2845(L5_2846, L6_2847, L7_2848)
end
function NoneSQL.CheckConditionSpecial(A0_2850, A1_2851, A2_2852, A3_2853)
  local L4_2854
  if A2_2852 == ">" then
    L4_2854 = A3_2853 < A1_2851
    return L4_2854
  end
  if A2_2852 == "<" then
    L4_2854 = A1_2851 < A3_2853
    return L4_2854
  end
  if A2_2852 == ">=" then
    L4_2854 = A3_2853 <= A1_2851
    return L4_2854
  end
  if A2_2852 == "<=" then
    L4_2854 = A1_2851 <= A3_2853
    return L4_2854
  end
  if A2_2852 == "=" then
    L4_2854 = A1_2851 == A3_2853
    return L4_2854
  end
  if A2_2852 == "!=" then
    L4_2854 = A1_2851 ~= A3_2853
    return L4_2854
  end
end
function NoneSQL.CheckCondition(A0_2855, A1_2856, A2_2857)
  local L3_2858, L4_2859, L5_2860, L6_2861, L7_2862, L8_2863
  if not A2_2857 then
    return L3_2858
  end
  for L6_2861, L7_2862 in L3_2858(L4_2859) do
    L8_2863 = rawget
    L8_2863 = L8_2863(A1_2856, L6_2861)
    for _FORV_12_ = 0, math.floor(#L7_2862 / 2) - 1 do
      if not A0_2855:CheckConditionSpecial(L8_2863, L7_2862[_FORV_12_ * 2 + 1], L7_2862[_FORV_12_ * 2 + 2]) then
        return
      end
    end
  end
  return L3_2858
end
function NoneSQL.FindListSort(A0_2864, A1_2865)
  if not rawget(A0_2864, L0_2809) then
    return false
  end
  if not rawget(A1_2865, L0_2809) then
    return false
  end
  if L1_2810 then
    return rawget(A0_2864, L0_2809) > rawget(A1_2865, L0_2809)
  end
  return rawget(A0_2864, L0_2809) < rawget(A1_2865, L0_2809)
end
function NoneSQL.Find(A0_2866, A1_2867, A2_2868, A3_2869, A4_2870)
  local L5_2871, L6_2872, L7_2873, L8_2874, L9_2875, L10_2876, L11_2877, L12_2878
  L5_2871 = {}
  L6_2872 = 0
  L7_2873 = false
  for L11_2877, L12_2878 in L8_2874(L9_2875) do
    if not A4_2870 or not (A4_2870 <= L6_2872) then
      if rawget(L12_2878, "S") ~= "D" and (not A1_2867 or A0_2866:CheckCondition(L12_2878, A1_2867)) then
        L6_2872 = L6_2872 + 1
        if not L12_2878:Verify() then
          L7_2873 = true
        end
        table.insert(L5_2871, L12_2878)
      end
    end
  end
  if L7_2873 then
    L11_2877 = "sql_data"
    L8_2874(L9_2875, L10_2876, L11_2877)
  end
  if not A2_2868 then
    return L5_2871
  end
  L0_2809 = A2_2868
  L1_2810 = A3_2869
  L8_2874(L9_2875, L10_2876)
  return L5_2871
end
function NoneSQL.One(A0_2879, A1_2880)
  local L2_2881, L3_2882, L4_2883, L5_2884, L6_2885
  for L5_2884, L6_2885 in L2_2881(L3_2882) do
    if rawget(L6_2885, "S") ~= "D" and (not A1_2880 or A0_2879:CheckCondition(L6_2885, A1_2880)) then
      if not L6_2885:Verify() then
        Event:Fire("DataException", "sql_data")
      end
      return L6_2885
    end
  end
end
function NoneSQL.FindByID(A0_2886, A1_2887)
  local L2_2888
  L2_2888 = A0_2886.tList
  L2_2888 = L2_2888[A1_2887]
  if not L2_2888 then
    return
  end
  if rawget(L2_2888, "S") == "D" then
    return
  end
  if L2_2888:Verify() then
    return L2_2888
  end
  Event:Fire("DataException", "sql_data")
  return L2_2888
end
function NoneSQL.Size(A0_2889)
  local L1_2890, L2_2891, L3_2892, L4_2893, L5_2894, L6_2895
  L1_2890 = 0
  for L5_2894, L6_2895 in L2_2891(L3_2892) do
    if rawget(L6_2895, "S") ~= "D" then
      L1_2890 = L1_2890 + 1
    end
  end
  return L1_2890
end
function NoneSQL.Sum(A0_2896, A1_2897, A2_2898)
  local L3_2899, L4_2900, L5_2901, L6_2902, L7_2903, L8_2904, L9_2905
  L3_2899 = 0
  L4_2900 = false
  for L8_2904, L9_2905 in L5_2901(L6_2902) do
    if rawget(L9_2905, "S") ~= "D" and (A1_2897 and L9_2905[A1_2897] or 1) ~= nil and (not A2_2898 or A0_2896:CheckCondition(L9_2905, A2_2898)) then
      if not L9_2905:Verify() then
        L4_2900 = true
      end
      L3_2899 = L3_2899 + (A1_2897 and L9_2905[A1_2897] or 1)
    end
  end
  if L4_2900 then
    L5_2901(L6_2902, L7_2903)
  end
  return L3_2899
end
function NoneSQL.Same(A0_2906, A1_2907, A2_2908)
  local L3_2909, L4_2910, L5_2911, L6_2912, L7_2913, L8_2914, L9_2915
  L3_2909 = {}
  if not A1_2907 then
    return L3_2909
  end
  L4_2910 = {}
  for L8_2914, L9_2915 in L5_2911(L6_2912) do
    if rawget(L9_2915, "S") ~= "D" and L9_2915[A1_2907] ~= nil and (not A2_2908 or A0_2906:CheckCondition(L9_2915, A2_2908)) then
      if L4_2910[L9_2915[A1_2907]] ~= nil then
        if L4_2910[L9_2915[A1_2907]][2] == 1 then
          table.insert(L3_2909, L4_2910[L9_2915[A1_2907]][1])
        end
        L4_2910[L9_2915[A1_2907]][2] = L4_2910[L9_2915[A1_2907]][2] + 1
        table.insert(L3_2909, L9_2915)
      else
        L4_2910[L9_2915[A1_2907]] = {L9_2915, 1}
      end
    end
  end
  return L3_2909
end
function NoneSQL.Save(A0_2916, A1_2917)
  if not A0_2916.bSaveable then
    return
  end
  if not A0_2916.bModify then
    return
  end
  A0_2916:SaveForce(A1_2917)
end
function NoneSQL.SaveForce(A0_2918, A1_2919)
  local L2_2920, L3_2921, L4_2922, L5_2923, L6_2924, L7_2925, L8_2926, L9_2927, L10_2928, L11_2929, L12_2930, L13_2931
  L2_2920 = A0_2918.bSaveable
  if not L2_2920 then
    return
  end
  L2_2920 = A0_2918.bModify
  if not L2_2920 then
    return
  end
  L2_2920 = {}
  L3_2921 = string
  L3_2921 = L3_2921.format
  L4_2922 = "%s.temp"
  L5_2923 = A0_2918.sFullName
  L3_2921 = L3_2921(L4_2922, L5_2923)
  L4_2922 = fstream
  L5_2923 = L3_2921
  L4_2922 = L4_2922(L5_2923, L6_2924)
  L5_2923 = 0
  A0_2918.bModify = false
  if not L4_2922 then
    return
  end
  for L9_2927, L10_2928 in L6_2924(L7_2925) do
    L11_2929 = string
    L11_2929 = L11_2929.format
    L12_2930 = "insert.into.%s%s\n"
    L13_2931 = A0_2918.Name
    L13_2931 = L13_2931(A0_2918)
    L11_2929 = L11_2929(L12_2930, L13_2931, L10_2928:MakeString())
    L12_2930 = DataEncode
    L13_2931 = L11_2929
    L12_2930 = L12_2930(L13_2931, L5_2923)
    L13_2931 = string
    L13_2931 = L13_2931.len
    L13_2931 = L13_2931(L11_2929)
    if not L12_2930 then
      L4_2922:close()
      return
    end
    if not L4_2922:write(L12_2930, L13_2931) then
      L4_2922:close()
      return
    end
    L5_2923 = L5_2923 + L13_2931
  end
  L6_2924(L7_2925)
  L6_2924(L7_2925)
  L6_2924 = L6_2924 == 0
  return L6_2924
end
function NoneSQL.Destructor(A0_2932)
  local L1_2933
end
