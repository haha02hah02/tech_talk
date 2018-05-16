Class.InterfaceLink.Script({})
function InterfaceLink.Constructor(A0_6511, A1_6512, A2_6513)
  Script.Constructor(A0_6511, A1_6512)
  if not A1_6512 or not A2_6513 then
    return
  end
  A0_6511.button = A2_6513
  A1_6512.on = {
    "Parent",
    A0_6511,
    A0_6511.OnParentSet
  }
end
function InterfaceLink.OnButtonDown(A0_6514)
  A0_6514:Parent().visible = true
end
function InterfaceLink.OnParentSet(A0_6515, A1_6516)
  local L2_6517, L3_6518, L4_6519
  L2_6517 = A1_6516.parent
  L2_6517 = L2_6517.parent
  if not L2_6517 then
    return
  end
  L3_6518 = L2_6517.node
  L4_6519 = A0_6515.button
  L3_6518 = L3_6518[L4_6519]
  if not L3_6518 then
    return
  end
  L4_6519 = {
    "Down",
    A0_6515,
    A0_6515.OnButtonDown
  }
  L3_6518.on = L4_6519
end
