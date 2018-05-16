Class.Skills.SQLItem({})
Skills.__format = {
  "serial",
  "belong",
  "skill_id"
}
Skills.__formatindex = DumpTableValueForKey(Skills.__format)
Skills.__flags = {"___times"}
function Skills.Constructor(A0_3004)
  SQLItem.Constructor(A0_3004, "Skills")
end
function Skills.Source(A0_3005)
  local L1_3006
  L1_3006 = "Skills"
  return L1_3006
end
