Class.Userinfo.SQLItem({})
Userinfo.__format = {
  "belong",
  "hp",
  "mp",
  "exp",
  "body",
  "hair",
  "face",
  "job",
  "storage",
  "map",
  "rmap",
  "disable"
}
Userinfo.__formatindex = DumpTableValueForKey(Userinfo.__format)
Userinfo.__flags = {"___times"}
function Userinfo.Constructor(A0_3205)
  SQLItem.Constructor(A0_3205, "Userinfo")
end
function Userinfo.Source(A0_3206)
  local L1_3207
  L1_3207 = "Userinfo"
  return L1_3207
end
