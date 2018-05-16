local L1_3748, L2_3749, L3_3750, L4_3751, L5_3752, L6_3753, L7_3754, L8_3755, L9_3756, L10_3757
function L0_3747(A0_3758)
  local L1_3759
  if not A0_3758 then
    return
  end
  L1_3759 = A0_3758.parent
  L1_3759 = L1_3759.parent
  if not L1_3759 then
    return
  end
  if L1_3759.info.force_map then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(22)
    return
  end
  if not L1_3759.info.major_city then
    return
  end
  if L1_3759.info.major_city == L1_3759.id then
    return
  end
  A0_3758.transfer = {
    tm = L1_3759.info.major_city
  }
  return true
end
Item_1000 = L0_3747
function L0_3747(A0_3760)
  local L1_3761
end
Item_10000 = L0_3747
function L0_3747(A0_3762, A1_3763, A2_3764)
  local L3_3765, L4_3766
  if not A0_3762 or not A1_3763 then
    return
  end
  L3_3765 = A0_3762.data
  L4_3766 = A1_3763.hp
  L3_3765.inc_hp = L4_3766
  L4_3766 = A1_3763.mp
  L3_3765.inc_mp = L4_3766
  L4_3766 = true
  return L4_3766
end
Item_100000 = L0_3747
function L0_3747(A0_3767, A1_3768)
  local L2_3769
  if not A0_3767 or not A1_3768 then
    return
  end
  L2_3769 = A0_3767.data
  if A1_3768.hp then
    L2_3769.inc_hp = math.floor(L2_3769.max_hp * A1_3768.hp / 100)
  end
  if A1_3768.mp then
    L2_3769.inc_mp = math.floor(L2_3769.max_mp * A1_3768.mp / 100)
  end
  return true
end
Item_100001 = L0_3747
L0_3747 = LoadConf
L1_3748 = "Config/HairCare.conf"
L0_3747 = L0_3747(L1_3748)
L0_3747 = L0_3747 or {}
L1_3748 = {}
L2_3749 = {}
for L6_3753, L7_3754 in L3_3750(L4_3751) do
  L9_3756 = string
  L9_3756 = L9_3756.format
  L10_3757 = "Item/%d.item"
  L10_3757 = L9_3756(L10_3757, L7_3754.hair_id)
  if L8_3755 ~= nil then
    L9_3756 = L8_3755.info
    L9_3756 = L9_3756.stype
    if L9_3756 == "man" then
      L9_3756 = table
      L9_3756 = L9_3756.insert
      L10_3757 = L1_3748
      L9_3756(L10_3757, L7_3754)
    else
      L9_3756 = L8_3755.info
      L9_3756 = L9_3756.stype
      if L9_3756 == "woman" then
        L9_3756 = table
        L9_3756 = L9_3756.insert
        L10_3757 = L2_3749
        L9_3756(L10_3757, L7_3754)
      end
    end
  end
end
Item_100005 = L3_3750
Item_100006 = L3_3750
for L9_3756, L10_3757 in L6_3753(L7_3754) do
  if LoadConf(string.format("Item/%d.item", L10_3757.face_id)) ~= nil then
    if LoadConf(string.format("Item/%d.item", L10_3757.face_id)).info.stype == "man" then
      table.insert(L4_3751, L10_3757)
    elseif LoadConf(string.format("Item/%d.item", L10_3757.face_id)).info.stype == "woman" then
      table.insert(L5_3752, L10_3757)
    end
  end
end
Item_100007 = L6_3753
Item_100008 = L6_3753
Item_100010 = L7_3754
Item_100011 = L7_3754
Item_100020 = L7_3754
Item_100030 = L7_3754
Item_100040 = L7_3754
Item_100050 = L7_3754
Item_2180000 = L7_3754
Item_4100002 = L7_3754
Item_4101000 = L7_3754
Item_4101002 = L7_3754
Item_4110002 = L7_3754
Item_4120000 = L7_3754
