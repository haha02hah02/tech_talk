Class.Statusicon.Script({})
function Statusicon.Constructor(A0_6986, A1_6987)
  Script.Constructor(A0_6986, A1_6987)
  A0_6986.tstatus = {}
end
function Statusicon.SetIcon(A0_6988, A1_6989)
  local L2_6990, L3_6991, L4_6992
  if not A1_6989 then
    return
  end
  L3_6991 = A0_6988
  L2_6990 = A0_6988.Parent
  L2_6990 = L2_6990(L3_6991)
  L3_6991 = L2_6990[A1_6989]
  if L3_6991 then
    return
  end
  L3_6991 = string
  L3_6991 = L3_6991.format
  L4_6992 = "UI/Status/%d.icon"
  L3_6991 = L3_6991(L4_6992, A1_6989)
  L4_6992 = FileUtils
  L4_6992 = L4_6992.FullPathForFilename
  L4_6992 = L4_6992(L4_6992, L3_6991)
  if not FileUtils:IsFileExist(L4_6992) then
    return
  end
  table.insert(A0_6988.tstatus, A1_6989)
  Image(L3_6991).name = A1_6989
  Image(L3_6991).anchorpoint = {0, 0.5}
  Image(L3_6991).x = -107.5 + #A0_6988.tstatus * 37
  Image(L3_6991).parent = L2_6990
end
function Statusicon.UnsetIcon(A0_6993, A1_6994)
  local L2_6995, L3_6996, L4_6997, L5_6998, L6_6999, L7_7000
  if not A1_6994 then
    return
  end
  L3_6996 = A0_6993
  L2_6995 = A0_6993.Parent
  L2_6995 = L2_6995(L3_6996)
  L3_6996 = L2_6995[A1_6994]
  if not L3_6996 then
    return
  end
  for L7_7000, _FORV_8_ in L4_6997(L5_6998) do
    if _FORV_8_ == A1_6994 then
      table.remove(A0_6993.tstatus, L7_7000)
      break
    end
  end
  for _FORV_8_, _FORV_9_ in L5_6998(L6_6999) do
    L2_6995[_FORV_9_].x = L4_6997 + (_FORV_8_ - 1) * 37
  end
  L3_6996.parent = nil
end
function Statusicon.Clean(A0_7001)
  A0_7001.tstatus = {}
  for _FORV_5_, _FORV_6_ in pairs(A0_7001:Parent().child.all) do
    _FORV_6_.parent = nil
  end
end
