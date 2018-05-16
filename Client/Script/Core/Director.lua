Global.DirectorRaw = Global.Director
Class.DirectorLua.CDirector({})
function DirectorLua.Constructor(A0_1752)
  local L1_1753
  L1_1753 = Global
  L1_1753 = L1_1753.DirectorRaw
  A0_1752.this = L1_1753
end
function DirectorLua.End(A0_1754)
  ShowStack()
end
Global.Director = DirectorLua()
