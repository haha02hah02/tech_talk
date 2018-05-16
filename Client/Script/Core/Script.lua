Class.Script.None({})
function Script.Constructor(A0_2499, A1_2500)
  A0_2499:SetParent(A1_2500)
end
function Script.Parent(A0_2501)
  local L1_2502, L2_2503
  L1_2502 = A0_2501.tParent
  if not L1_2502 then
    return
  end
  L2_2503 = L1_2502.parent
  return L2_2503
end
function Script.SetParent(A0_2504, A1_2505)
  local L2_2506
  L2_2506 = A0_2504.tParent
  if not L2_2506 then
    L2_2506 = {}
    setmetatable(L2_2506, {__mode = "v"})
    A0_2504.tParent = L2_2506
  end
  L2_2506.parent = A1_2505
end
