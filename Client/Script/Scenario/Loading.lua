Class.Loading.Script({})
function Loading.Constructor(A0_6619, A1_6620)
  Script.Constructor(A0_6619, A1_6620)
  A1_6620.on = {
    "Visible",
    A0_6619,
    A0_6619.OnVisible
  }
end
function Loading.Action(A0_6621)
  local L1_6622, L2_6623, L3_6624, L4_6625, L5_6626, L6_6627, L7_6628
  L1_6622 = Array
  L1_6622 = L1_6622()
  for L5_6626 = 0, 15 do
    L6_6627 = string
    L6_6627 = L6_6627.format
    L7_6628 = "UI/Base/loading.%d.ntp"
    L6_6627 = L6_6627(L7_6628, L5_6626)
    L7_6628 = Animate
    L7_6628 = L7_6628(L6_6627, 0, 0, 0.1)
    if L7_6628 then
      L1_6622:AddObject(L7_6628)
    end
  end
  L7_6628 = L3_6624(L4_6625)
  return L2_6623(L3_6624, L4_6625, L5_6626, L6_6627, L7_6628, L3_6624(L4_6625))
end
function Loading.OnVisible(A0_6629, A1_6630)
  local L2_6631
  L2_6631 = A1_6630.visible
  if not L2_6631 then
    return
  end
  L2_6631 = A1_6630.loading
  L2_6631.unactions = true
  L2_6631.action = A0_6629:Action()
end
