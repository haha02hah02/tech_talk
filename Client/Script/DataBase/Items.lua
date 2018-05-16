Class.Items.SQLItem({})
Items.__format = {
  "serial",
  "belong",
  "item_id",
  "amount",
  "site",
  "slot",
  "level",
  "slevel",
  "enchant",
  "stochastic",
  "tradable",
  "provenance",
  "comment"
}
Items.__formatindex = DumpTableValueForKey(Items.__format)
Items.__flags = {"___times"}
function Items.Constructor(A0_2797)
  SQLItem.Constructor(A0_2797, "Items")
end
function Items.Source(A0_2798)
  local L1_2799
  L1_2799 = "Items"
  return L1_2799
end
