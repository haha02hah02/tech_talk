L0_1362 = Class
L0_1362 = L0_1362.ComImage
L0_1362 = L0_1362.Component
L0_1362({})
L0_1362 = Point
L0_1362 = L0_1362(0, 1)
function ComImage.Constructor(A0_1363, A1_1364, A2_1365, A3_1366, A4_1367, A5_1368, A6_1369, A7_1370, A8_1371, A9_1372)
  Component.Constructor(A0_1363)
  if not Node() then
    return
  end
  A0_1363.render = Node()
  A0_1363.lt = Sprite(A1_1364)
  A0_1363.ct = SpriteBatchNode(A2_1365, 500)
  A0_1363.rt = Sprite(A3_1366)
  A0_1363.lc = SpriteBatchNode(A4_1367, 500)
  A0_1363.mc = Sprite(A5_1368)
  A0_1363.rc = SpriteBatchNode(A6_1369, 500)
  A0_1363.lb = Sprite(A7_1370)
  A0_1363.cb = SpriteBatchNode(A8_1371, 500)
  A0_1363.rb = Sprite(A9_1372)
  A0_1363.stSize = Size()
  A0_1363.lt:SetAnchorPoint(L0_1362)
  A0_1363.rt:SetAnchorPoint(L0_1362)
  A0_1363.mc:SetAnchorPoint(L0_1362)
  A0_1363.lb:SetAnchorPoint(L0_1362)
  A0_1363.rb:SetAnchorPoint(L0_1362)
  Node():AddChild(A0_1363.lt)
  Node():AddChild(A0_1363.ct)
  Node():AddChild(A0_1363.rt)
  Node():AddChild(A0_1363.lc)
  Node():AddChild(A0_1363.mc)
  Node():AddChild(A0_1363.rc)
  Node():AddChild(A0_1363.lb)
  Node():AddChild(A0_1363.cb)
  Node():AddChild(A0_1363.rb)
end
function ComImage.class_get(A0_1373, A1_1374)
  local L2_1375
  L2_1375 = "ComImage"
  return L2_1375
end
function ComImage.lt_get(A0_1376, A1_1377)
  return rawget(A0_1376, "lt")
end
function ComImage.lt_set(A0_1378, A1_1379, A2_1380)
  return rawset(A0_1378, "lt", A2_1380)
end
function ComImage.ct_get(A0_1381, A1_1382)
  return rawget(A0_1381, "ct")
end
function ComImage.ct_set(A0_1383, A1_1384, A2_1385)
  return rawset(A0_1383, "ct", A2_1385)
end
function ComImage.rt_get(A0_1386, A1_1387)
  return rawget(A0_1386, "rt")
end
function ComImage.rt_set(A0_1388, A1_1389, A2_1390)
  return rawset(A0_1388, "rt", A2_1390)
end
function ComImage.lc_get(A0_1391, A1_1392)
  return rawget(A0_1391, "lc")
end
function ComImage.lc_set(A0_1393, A1_1394, A2_1395)
  return rawset(A0_1393, "lc", A2_1395)
end
function ComImage.mc_get(A0_1396, A1_1397)
  return rawget(A0_1396, "mc")
end
function ComImage.mc_set(A0_1398, A1_1399, A2_1400)
  return rawset(A0_1398, "mc", A2_1400)
end
function ComImage.rc_get(A0_1401, A1_1402)
  return rawget(A0_1401, "rc")
end
function ComImage.rc_set(A0_1403, A1_1404, A2_1405)
  return rawset(A0_1403, "rc", A2_1405)
end
function ComImage.lb_get(A0_1406, A1_1407)
  return rawget(A0_1406, "lb")
end
function ComImage.lb_set(A0_1408, A1_1409, A2_1410)
  return rawset(A0_1408, "lb", A2_1410)
end
function ComImage.cb_get(A0_1411, A1_1412)
  return rawget(A0_1411, "cb")
end
function ComImage.cb_set(A0_1413, A1_1414, A2_1415)
  return rawset(A0_1413, "cb", A2_1415)
end
function ComImage.rb_get(A0_1416, A1_1417)
  return rawget(A0_1416, "rb")
end
function ComImage.rb_set(A0_1418, A1_1419, A2_1420)
  return rawset(A0_1418, "rb", A2_1420)
end
function ComImage.stSize_get(A0_1421, A1_1422)
  return rawget(A0_1421, "stSize")
end
function ComImage.stSize_set(A0_1423, A1_1424, A2_1425)
  rawset(A0_1423, "stSize", A2_1425)
end
function ComImage.width_get(A0_1426, A1_1427)
  return A0_1426.stSize.Width
end
function ComImage.height_get(A0_1428, A1_1429)
  return A0_1428.stSize.Height
end
function ComImage.size_set(A0_1430, A1_1431, A2_1432, A3_1433)
  local L4_1434, L5_1435, L6_1436, L7_1437, L8_1438, L9_1439, L10_1440, L11_1441, L12_1442, L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455
  L4_1434 = Instance
  L5_1435 = A0_1430.lt
  L6_1436 = L5_1435
  L5_1435 = L5_1435.Texture
  L5_1435 = L5_1435(L6_1436)
  L6_1436 = L5_1435
  L5_1435 = L5_1435.ContentSize
  L25_1455 = L5_1435(L6_1436)
  L4_1434 = L4_1434(L5_1435, L6_1436, L7_1437, L8_1438, L9_1439, L10_1440, L11_1441, L12_1442, L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455, L5_1435(L6_1436))
  L5_1435 = Instance
  L6_1436 = A0_1430.ct
  L7_1437 = L6_1436
  L6_1436 = L6_1436.Texture
  L6_1436 = L6_1436(L7_1437)
  L7_1437 = L6_1436
  L6_1436 = L6_1436.ContentSize
  L25_1455 = L6_1436(L7_1437)
  L5_1435 = L5_1435(L6_1436, L7_1437, L8_1438, L9_1439, L10_1440, L11_1441, L12_1442, L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455, L6_1436(L7_1437))
  L6_1436 = Instance
  L7_1437 = A0_1430.rt
  L8_1438 = L7_1437
  L7_1437 = L7_1437.Texture
  L7_1437 = L7_1437(L8_1438)
  L8_1438 = L7_1437
  L7_1437 = L7_1437.ContentSize
  L25_1455 = L7_1437(L8_1438)
  L6_1436 = L6_1436(L7_1437, L8_1438, L9_1439, L10_1440, L11_1441, L12_1442, L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455, L7_1437(L8_1438))
  L7_1437 = Instance
  L8_1438 = A0_1430.lc
  L9_1439 = L8_1438
  L8_1438 = L8_1438.Texture
  L8_1438 = L8_1438(L9_1439)
  L9_1439 = L8_1438
  L8_1438 = L8_1438.ContentSize
  L25_1455 = L8_1438(L9_1439)
  L7_1437 = L7_1437(L8_1438, L9_1439, L10_1440, L11_1441, L12_1442, L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455, L8_1438(L9_1439))
  L8_1438 = Instance
  L9_1439 = A0_1430.mc
  L10_1440 = L9_1439
  L9_1439 = L9_1439.Texture
  L9_1439 = L9_1439(L10_1440)
  L10_1440 = L9_1439
  L9_1439 = L9_1439.ContentSize
  L25_1455 = L9_1439(L10_1440)
  L8_1438 = L8_1438(L9_1439, L10_1440, L11_1441, L12_1442, L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455, L9_1439(L10_1440))
  L9_1439 = Instance
  L10_1440 = A0_1430.rc
  L11_1441 = L10_1440
  L10_1440 = L10_1440.Texture
  L10_1440 = L10_1440(L11_1441)
  L11_1441 = L10_1440
  L10_1440 = L10_1440.ContentSize
  L25_1455 = L10_1440(L11_1441)
  L9_1439 = L9_1439(L10_1440, L11_1441, L12_1442, L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455, L10_1440(L11_1441))
  L10_1440 = Instance
  L11_1441 = A0_1430.lb
  L12_1442 = L11_1441
  L11_1441 = L11_1441.Texture
  L11_1441 = L11_1441(L12_1442)
  L12_1442 = L11_1441
  L11_1441 = L11_1441.ContentSize
  L25_1455 = L11_1441(L12_1442)
  L10_1440 = L10_1440(L11_1441, L12_1442, L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455, L11_1441(L12_1442))
  L11_1441 = Instance
  L12_1442 = A0_1430.cb
  L13_1443 = L12_1442
  L12_1442 = L12_1442.Texture
  L12_1442 = L12_1442(L13_1443)
  L13_1443 = L12_1442
  L12_1442 = L12_1442.ContentSize
  L25_1455 = L12_1442(L13_1443)
  L11_1441 = L11_1441(L12_1442, L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455, L12_1442(L13_1443))
  L12_1442 = Instance
  L13_1443 = A0_1430.rb
  L14_1444 = L13_1443
  L13_1443 = L13_1443.Texture
  L13_1443 = L13_1443(L14_1444)
  L14_1444 = L13_1443
  L13_1443 = L13_1443.ContentSize
  L25_1455 = L13_1443(L14_1444)
  L12_1442 = L12_1442(L13_1443, L14_1444, L15_1445, L16_1446, L17_1447, L18_1448, L19_1449, L20_1450, L21_1451, L22_1452, L23_1453, L24_1454, L25_1455, L13_1443(L14_1444))
  L13_1443 = math
  L13_1443 = L13_1443.ceil
  L14_1444 = L4_1434.Width
  L15_1445 = L5_1435.Width
  L14_1444 = L14_1444 + L15_1445
  L15_1445 = L6_1436.Width
  L14_1444 = L14_1444 + L15_1445
  L13_1443 = L13_1443(L14_1444)
  L14_1444 = math
  L14_1444 = L14_1444.ceil
  L15_1445 = L4_1434.Height
  L16_1446 = L7_1437.Height
  L15_1445 = L15_1445 + L16_1446
  L16_1446 = L10_1440.Height
  L15_1445 = L15_1445 + L16_1446
  L14_1444 = L14_1444(L15_1445)
  if A2_1432 < L13_1443 then
    A2_1432 = L13_1443
  end
  if A3_1433 < L14_1444 then
    A3_1433 = L14_1444
  end
  L15_1445 = math
  L15_1445 = L15_1445.ceil
  L16_1446 = L4_1434.Width
  L16_1446 = A2_1432 - L16_1446
  L17_1447 = L6_1436.Width
  L16_1446 = L16_1446 - L17_1447
  L17_1447 = L5_1435.Width
  L16_1446 = L16_1446 / L17_1447
  L15_1445 = L15_1445(L16_1446)
  L16_1446 = math
  L16_1446 = L16_1446.ceil
  L17_1447 = L4_1434.Height
  L17_1447 = A3_1433 - L17_1447
  L18_1448 = L10_1440.Height
  L17_1447 = L17_1447 - L18_1448
  L18_1448 = L7_1437.Height
  L17_1447 = L17_1447 / L18_1448
  L16_1446 = L16_1446(L17_1447)
  L17_1447 = L5_1435.Width
  L17_1447 = L15_1445 * L17_1447
  L18_1448 = L7_1437.Height
  L18_1448 = L16_1446 * L18_1448
  L19_1449 = L4_1434.Width
  L20_1450 = L6_1436.Width
  L19_1449 = L19_1449 + L20_1450
  A2_1432 = L19_1449 + L17_1447
  L19_1449 = L4_1434.Height
  L20_1450 = L10_1440.Height
  L19_1449 = L19_1449 + L20_1450
  A3_1433 = L19_1449 + L18_1448
  L19_1449 = A0_1430.stSize
  L19_1449 = L19_1449.Width
  if L19_1449 == A2_1432 then
    L19_1449 = A0_1430.stSize
    L19_1449 = L19_1449.Height
    if L19_1449 == A3_1433 then
      return
    end
  end
  L19_1449 = A0_1430.stSize
  L19_1449.Width = A2_1432
  L19_1449 = A0_1430.stSize
  L19_1449.Height = A3_1433
  L19_1449 = -A2_1432
  L19_1449 = L19_1449 / 2
  L20_1450 = A3_1433 / 2
  L24_1454 = L20_1450
  L21_1451(L22_1452, L23_1453, L24_1454)
  L19_1449 = L21_1451 + L22_1452
  L20_1450 = A3_1433 / 2
  L21_1451(L22_1452)
  for L24_1454 = 1, L15_1445 do
    L25_1455 = Sprite
    L25_1455 = L25_1455()
    L25_1455:InitWithTexture(A0_1430.ct:Texture())
    L25_1455:SetAnchorPoint(L0_1362)
    L25_1455:SetPosition(L19_1449 + (L24_1454 - 1) * L5_1435.Width, L20_1450)
    A0_1430.ct:AddChild(L25_1455)
  end
  L19_1449 = L21_1451 + L17_1447
  L20_1450 = A3_1433 / 2
  L24_1454 = L20_1450
  L21_1451(L22_1452, L23_1453, L24_1454)
  L19_1449 = L21_1451 / 2
  L20_1450 = L21_1451 - L22_1452
  L21_1451(L22_1452)
  for L24_1454 = 1, L16_1446 do
    L25_1455 = Sprite
    L25_1455 = L25_1455()
    L25_1455:InitWithTexture(A0_1430.lc:Texture())
    L25_1455:SetAnchorPoint(L0_1362)
    L25_1455:SetPosition(L19_1449, L20_1450 - (L24_1454 - 1) * L7_1437.Height)
    A0_1430.lc:AddChild(L25_1455)
  end
  L19_1449 = L21_1451 + L22_1452
  L20_1450 = L21_1451 - L22_1452
  L24_1454 = L17_1447
  L25_1455 = L18_1448
  L25_1455 = L23_1453(L24_1454, L25_1455)
  L21_1451(L22_1452, L23_1453, L24_1454, L25_1455, L23_1453(L24_1454, L25_1455))
  L24_1454 = 0
  L25_1455 = 0
  L25_1455 = L23_1453(L24_1454, L25_1455, L17_1447, L18_1448)
  L21_1451(L22_1452, L23_1453, L24_1454, L25_1455, L23_1453(L24_1454, L25_1455, L17_1447, L18_1448))
  L24_1454 = L20_1450
  L21_1451(L22_1452, L23_1453, L24_1454)
  L19_1449 = L21_1451 + L17_1447
  L20_1450 = L21_1451 - L22_1452
  L21_1451(L22_1452)
  for L24_1454 = 1, L16_1446 do
    L25_1455 = Sprite
    L25_1455 = L25_1455()
    L25_1455:InitWithTexture(A0_1430.rc:Texture())
    L25_1455:SetAnchorPoint(L0_1362)
    L25_1455:SetPosition(L19_1449, L20_1450 - (L24_1454 - 1) * L9_1439.Height)
    A0_1430.rc:AddChild(L25_1455)
  end
  L19_1449 = L21_1451 / 2
  L20_1450 = L21_1451 - L18_1448
  L24_1454 = L20_1450
  L21_1451(L22_1452, L23_1453, L24_1454)
  L19_1449 = L21_1451 + L22_1452
  L20_1450 = L21_1451 - L18_1448
  L21_1451(L22_1452)
  for L24_1454 = 1, L15_1445 do
    L25_1455 = Sprite
    L25_1455 = L25_1455()
    L25_1455:InitWithTexture(A0_1430.cb:Texture())
    L25_1455:SetAnchorPoint(L0_1362)
    L25_1455:SetPosition(L19_1449 + (L24_1454 - 1) * L11_1441.Width, L20_1450)
    A0_1430.cb:AddChild(L25_1455)
  end
  L19_1449 = L21_1451 + L17_1447
  L20_1450 = L21_1451 - L18_1448
  L24_1454 = L20_1450
  L21_1451(L22_1452, L23_1453, L24_1454)
end
