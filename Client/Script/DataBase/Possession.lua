Class.Possession.SQLItem({})
Possession.__format = {
  "serial",
  "belong",
  "quantity",
  "limit",
  "provenance",
  "comment"
}
Possession.__formatindex = DumpTableValueForKey(Possession.__format)
Possession.__flags = {"___times"}
function Possession.Constructor(A0_2995)
  SQLItem.Constructor(A0_2995, "Possession")
end
function Possession.Source(A0_2996)
  local L1_2997
  L1_2997 = "Possession"
  return L1_2997
end
