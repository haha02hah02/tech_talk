Class.Quests.SQLItem({})
Quests.__format = {
  "serial",
  "belong",
  "quest_id",
  "status",
  "data"
}
Quests.__formatindex = DumpTableValueForKey(Quests.__format)
Quests.__flags = {"___times"}
function Quests.Constructor(A0_2998)
  SQLItem.Constructor(A0_2998, "Quests")
  A0_2998.version = VersionNumber()
end
function Quests.Source(A0_2999)
  local L1_3000
  L1_3000 = "Quests"
  return L1_3000
end
