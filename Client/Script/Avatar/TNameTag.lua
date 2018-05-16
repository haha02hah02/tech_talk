Class.TNameTag.Gameobject({})
function TNameTag.Constructor(A0_788, A1_789)
  local L2_790, L3_791, L4_792
  L2_790 = Gameobject
  L2_790 = L2_790.Constructor
  L3_791 = A0_788
  L2_790(L3_791)
  A1_789 = A1_789 or ""
  L2_790 = A0_788.render
  if not L2_790 then
    return
  end
  L3_791 = Label
  L4_792 = A1_789
  L3_791 = L3_791(L4_792, "Arial", 12)
  L3_791.name = "label"
  L3_791.x = 0
  L3_791.y = 0
  L4_792 = color
  L3_791.color = L4_792
  L3_791.parent = A0_788
  L3_791.order = 1
  A0_788.text = A1_789
  L4_792 = L3_791.width
  L4_792 = L4_792 + 4
  MaskColor(127, L4_792, 18).name = "mask"
  MaskColor(127, L4_792, 18).x = -L4_792 / 2
  MaskColor(127, L4_792, 18).y = -9
  MaskColor(127, L4_792, 18).parent = A0_788
end
function TNameTag.class_get(A0_793, A1_794)
  local L2_795
  L2_795 = "TNameTag"
  return L2_795
end
function TNameTag.text_get(A0_796, A1_797)
  return A0_796.label.text
end
function TNameTag.color_get(A0_798, A1_799, A2_800)
  local L3_801, L4_802
  L3_801 = A0_798.label
  if not L3_801 then
    return
  end
  L4_802 = L3_801.color
  return L4_802
end
function TNameTag.color_set(A0_803, A1_804, A2_805)
  local L3_806
  L3_806 = A0_803.label
  if not L3_806 then
    return
  end
  L3_806.color = A2_805
end
function TNameTag.Destructor(A0_807)
  local L1_808
end
