Class.DataFormat.None({})
function DataFormat.MemberIndex(A0_1708, A1_1709)
  local L2_1710, L3_1711, L4_1712, L5_1713, L6_1714, L7_1715
  L2_1710 = rawget
  L3_1711 = A0_1708
  L4_1712 = "values"
  L2_1710 = L2_1710(L3_1711, L4_1712)
  if not L2_1710 then
    return
  end
  L3_1711 = rawget
  L4_1712 = L2_1710
  L5_1713 = A1_1709
  L3_1711 = L3_1711(L4_1712, L5_1713)
  L4_1712 = type
  L5_1713 = L3_1711
  L4_1712 = L4_1712(L5_1713)
  if L4_1712 ~= "table" then
    return L3_1711
  end
  L5_1713 = L3_1711.check_code
  if not L5_1713 then
    return L3_1711
  end
  L6_1714 = L3_1711.mask
  L7_1715 = L3_1711.source
  if SHA1String(string.format("%s%d", tostring(L7_1715), L6_1714)) == L5_1713 then
    return L7_1715
  end
  Event:Fire("DataException", "data_format")
end
function DataFormat.MemberNewIndex(A0_1716, A1_1717, A2_1718)
  local L3_1719, L4_1720, L5_1721
  L3_1719 = type
  L4_1720 = A2_1718
  L3_1719 = L3_1719(L4_1720)
  L4_1720 = rawget
  L5_1721 = A0_1716
  L4_1720 = L4_1720(L5_1721, "values")
  if not L4_1720 then
    L5_1721 = {}
    L4_1720 = L5_1721
    L5_1721 = rawset
    L5_1721(A0_1716, "values", L4_1720)
  end
  if L3_1719 ~= "number" then
    L5_1721 = rawset
    L5_1721(L4_1720, A1_1717, A2_1718)
    return
  end
  L5_1721 = rawget
  L5_1721 = L5_1721(L4_1720, A1_1717)
  if not L5_1721 then
    L5_1721 = {}
    rawset(L4_1720, A1_1717, L5_1721)
  end
  L5_1721.source = A2_1718
  L5_1721.mask = math.random(1, 100000000)
  L5_1721.check_code = SHA1String(string.format("%s%d", tostring(L5_1721.source), L5_1721.mask))
end
