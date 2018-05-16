Class.Account.SQLItem({})
Account.__format = {
  "serial",
  "name",
  "password",
  "invitation",
  "sex",
  "gm",
  "incable",
  "delable",
  "moveable",
  "ban"
}
Account.__formatindex = DumpTableValueForKey(Account.__format)
Account.__flags = {"___times"}
function Account.Constructor(A0_2791)
  SQLItem.Constructor(A0_2791, "Account")
  A0_2791.version = VersionNumber()
end
function Account.Source(A0_2792)
  local L1_2793
  L1_2793 = "Account"
  return L1_2793
end
