Class.Acceptor.None({})
function Acceptor.Constructor(A0_1200, A1_1201, A2_1202, A3_1203)
  local L4_1204
  L4_1204 = {}
  A0_1200.tValues = L4_1204
  setmetatable(L4_1204, {__mode = "v"})
  if type(A1_1201) == "function" then
    A0_1200.type = "function"
    L4_1204.func = A1_1201
    A0_1200.iPriority = A2_1202 or 0
  else
    A0_1200.type = "functor"
    L4_1204.object = A1_1201
    L4_1204.func = A2_1202
    A0_1200.iPriority = A3_1203 or 0
  end
end
function Acceptor.Priority(A0_1205)
  local L1_1206
  L1_1206 = A0_1205.iPriority
  return L1_1206
end
function Acceptor.On(A0_1207, ...)
  local L2_1209, L3_1210, L4_1211
  L1_1208 = A0_1207.tValues
  L2_1209 = A0_1207.type
  if L2_1209 == "function" then
    L2_1209 = L1_1208.func
    L4_1211 = ...
    L2_1209(L3_1210, L4_1211)
    return
  end
  L2_1209 = L1_1208.object
  if not L2_1209 then
    return
  end
  L2_1209 = L1_1208.func
  L3_1210 = L1_1208.object
  L4_1211 = ...
  return L2_1209(L3_1210, L4_1211)
end
function Acceptor.Equal(A0_1212, A1_1213, A2_1214)
  local L3_1215
  L3_1215 = A0_1212.tValues
  if type(A1_1213) == "function" then
    return L3_1215.func == A1_1213
  end
  return L3_1215.object == A1_1213 and L3_1215.func == A2_1214
end
function Acceptor.Destructor(A0_1216)
  local L1_1217
end
