L0_1299 = Class
L0_1299 = L0_1299.Child
L0_1299 = L0_1299.None
L0_1299({})
L0_1299 = Child
function L0_1299.Constructor(A0_1300)
  rawset(A0_1300, "all", {})
  rawset(A0_1300, "values", {})
end
L0_1299 = Child
function L0_1299.class_get(A0_1301, A1_1302)
  local L2_1303
  L2_1303 = "Child"
  return L2_1303
end
function L0_1299(A0_1304, A1_1305)
  local L2_1306, L3_1307, L4_1308
  L2_1306 = A0_1304.order
  L2_1306 = L2_1306 or 0
  L3_1307 = A1_1305.order
  L3_1307 = L3_1307 or 1
  L4_1308 = L2_1306 < L3_1307
  return L4_1308
end
function Child.sort_get(A0_1309, A1_1310)
  local L2_1311, L3_1312, L4_1313, L5_1314, L6_1315, L7_1316
  L2_1311 = {}
  for L6_1315, L7_1316 in L3_1312(L4_1313) do
    table.insert(L2_1311, L7_1316)
  end
  L3_1312(L4_1313, L5_1314)
  return L2_1311
end
function Child.remove_by_tag_set(A0_1317, A1_1318, A2_1319)
  for _FORV_6_, _FORV_7_ in pairs(A0_1317.all) do
    if _FORV_7_.tag == A2_1319 then
      _FORV_7_.parent = nil
    end
  end
end
function Child.parent_get(A0_1320, A1_1321)
  local L2_1322
  L2_1322 = rawget
  L2_1322 = L2_1322(A0_1320, "values")
  if not L2_1322 then
    return
  end
  if not rawget(L2_1322, A1_1321) then
    return
  end
  return rawget(L2_1322, A1_1321)[A1_1321]
end
function Child.parent_set(A0_1323, A1_1324, A2_1325)
  local L3_1326, L4_1327
  L3_1326 = rawget
  L4_1327 = A0_1323
  L3_1326 = L3_1326(L4_1327, "values")
  if not L3_1326 then
    return
  end
  L4_1327 = rawget
  L4_1327 = L4_1327(L3_1326, A1_1324)
  if not L4_1327 then
    L4_1327 = {}
    setmetatable(L4_1327, {__mode = "v"})
    rawset(L3_1326, A1_1324, L4_1327)
  end
  rawset(L4_1327, A1_1324, A2_1325)
end
function Child.size_get(A0_1328, A1_1329)
  local L3_1330
  L3_1330 = 0
  for _FORV_6_, _FORV_7_ in pairs(rawget(A0_1328, "all")) do
    L3_1330 = L3_1330 + 1
  end
  return L3_1330
end
function Child.add_set(A0_1331, A1_1332, A2_1333)
  local L3_1334, L4_1335, L5_1336, L6_1337, L7_1338, L8_1339
  if not A2_1333 then
    return
  end
  L3_1334 = A2_1333.name
  if not L3_1334 then
    L4_1335 = Log
    L5_1336 = "not name"
    L4_1335(L5_1336)
    return
  end
  L4_1335 = rawget
  L5_1336 = A0_1331
  L6_1337 = "all"
  L4_1335 = L4_1335(L5_1336, L6_1337)
  L5_1336 = L4_1335[L3_1334]
  if L5_1336 then
    L5_1336 = Log
    L6_1337 = "exist name:"
    L7_1338 = L3_1334
    L5_1336(L6_1337, L7_1338)
    return
  end
  L4_1335[L3_1334] = A2_1333
  L5_1336 = A0_1331.parent
  L6_1337 = A2_1333.values
  L6_1337 = L6_1337.parent
  A2_1333.fire = "BeforeParent"
  L6_1337.parent = L5_1336
  A2_1333.fire = "Parent"
  L7_1338 = L5_1336.prender
  L8_1339 = rawget
  L8_1339 = L8_1339(L5_1336, "start")
  if L8_1339 then
    A2_1333.start = true
  end
  if not L7_1338 then
    return
  end
  L8_1339 = A2_1333.crender
  if not L8_1339 then
    return
  end
  L7_1338:AddChild(L8_1339)
end
function Child.remove_set(A0_1340, A1_1341, A2_1342, A3_1343)
  local L4_1344, L5_1345, L6_1346, L7_1347, L8_1348, L9_1349, L10_1350
  if not A2_1342 then
    return
  end
  L4_1344 = rawget
  L5_1345 = A0_1340
  L6_1346 = "all"
  L4_1344 = L4_1344(L5_1345, L6_1346)
  L5_1345, L6_1346 = nil, nil
  for L10_1350, _FORV_11_ in L7_1347(L8_1348) do
    if _FORV_11_ == A2_1342 then
      L6_1346 = L10_1350
      L5_1345 = _FORV_11_
      break
    end
  end
  if not L5_1345 then
    return
  end
  L4_1344[L6_1346] = nil
  L5_1345.stop = true
  L5_1345.fire = "BeforeParent"
  L7_1347.parent = nil
  L5_1345.fire = "Parent"
  if not L9_1349 then
    return
  end
  L10_1350 = L5_1345.crender
  if not L10_1350 then
    return
  end
  L9_1349:RemoveChild(L10_1350, A3_1343 == nil and true or false)
end
function Child.MemberIndex(A0_1351, A1_1352)
  local L2_1353, L3_1354, L4_1355
  L2_1353 = string
  L2_1353 = L2_1353.format
  L3_1354 = "%s_get"
  L4_1355 = A1_1352
  L2_1353 = L2_1353(L3_1354, L4_1355)
  L3_1354 = getmetatable
  L4_1355 = A0_1351
  L3_1354 = L3_1354(L4_1355)
  L4_1355 = rawget
  L4_1355 = L4_1355(L3_1354, L2_1353)
  if L2_1353 == "start_get" then
    ShowStack()
  end
  if L4_1355 then
    return L4_1355(A0_1351, A1_1352)
  end
  return rawget(A0_1351, "all")[A1_1352]
end
function Child.MemberNewIndex(A0_1356, A1_1357, A2_1358)
  local L3_1359, L4_1360, L5_1361
  L3_1359 = string
  L3_1359 = L3_1359.format
  L4_1360 = "%s_set"
  L5_1361 = A1_1357
  L3_1359 = L3_1359(L4_1360, L5_1361)
  L4_1360 = getmetatable
  L5_1361 = A0_1356
  L4_1360 = L4_1360(L5_1361)
  L5_1361 = rawget
  L5_1361 = L5_1361(L4_1360, L3_1359)
  if not L5_1361 then
    return
  end
  if type(A2_1358) ~= "table" then
    L5_1361(A0_1356, A1_1357, A2_1358)
    return
  end
  if not rawget(A2_1358, 1) then
    L5_1361(A0_1356, A1_1357, A2_1358)
    return
  end
  L5_1361(A0_1356, A1_1357, table.unpack(A2_1358))
end
