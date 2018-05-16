Class.Integral.SQLItem({})
Integral.__format = {
  "serial",
  "belong",
  "quantity",
  "limit",
  "provenance",
  "comment"
}
Integral.__formatindex = DumpTableValueForKey(Integral.__format)
Integral.__flags = {"___times"}
function Integral.Constructor(A0_2794)
  SQLItem.Constructor(A0_2794, "Integral")
end
function Integral.Source(A0_2795)
  local L1_2796
  L1_2796 = "Integral"
  return L1_2796
end
