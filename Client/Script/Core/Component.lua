L0_1456 = Class
L0_1456 = L0_1456.Component
L0_1456 = L0_1456.None
L0_1456({})
L0_1456 = Component
function L0_1456.Constructor(A0_1457)
  local L1_1458
  L1_1458 = Child
  L1_1458 = L1_1458()
  L1_1458.parent = A0_1457
  A0_1457.rclean = true
  rawset(A0_1457, "event", {})
  rawset(A0_1457, "component", {})
  rawset(A0_1457, "values", {})
  rawset(A0_1457, "child", L1_1458)
end
L0_1456 = Component
function L0_1456.class_get(A0_1459, A1_1460)
  local L2_1461
  L2_1461 = "Component"
  return L2_1461
end
L0_1456 = Component
function L0_1456.name_get(A0_1462, A1_1463)
  return rawget(A0_1462, "name")
end
L0_1456 = Component
function L0_1456.name_set(A0_1464, A1_1465, A2_1466)
  rawset(A0_1464, "name", A2_1466)
end
L0_1456 = Component
function L0_1456.tag_get(A0_1467, A1_1468)
  local L2_1469
  L2_1469 = A0_1467.render
  if not L2_1469 then
    return
  end
  return L2_1469:Tag()
end
L0_1456 = Component
function L0_1456.tag_set(A0_1470, A1_1471, A2_1472)
  local L3_1473
  L3_1473 = A0_1470.render
  if not L3_1473 then
    return
  end
  L3_1473:SetTag(A2_1472)
end
L0_1456 = Component
function L0_1456.child_get(A0_1474)
  return rawget(A0_1474, "child")
end
L0_1456 = Component
function L0_1456.render_get(A0_1475, A1_1476)
  if not rawget(A0_1475, "component") then
    return
  end
  return rawget(A0_1475, "component").render
end
L0_1456 = Component
function L0_1456.prender_get(A0_1477, A1_1478)
  if not rawget(A0_1477, "component") then
    return
  end
  return rawget(A0_1477, "component").render
end
L0_1456 = Component
function L0_1456.crender_get(A0_1479, A1_1480)
  if not rawget(A0_1479, "component") then
    return
  end
  return rawget(A0_1479, "component").render
end
L0_1456 = Component
function L0_1456.rrender_get(A0_1481, A1_1482, A2_1483)
  if not rawget(A0_1481, "component") then
    return
  end
  return rawget(A0_1481, "component").render
end
L0_1456 = Component
function L0_1456.render_set(A0_1484, A1_1485, A2_1486)
  if not rawget(A0_1484, "component") then
    return
  end
  if rawget(A0_1484, "component").render then
    rawget(A0_1484, "component").render:RemoveFromParent()
  end
  rawget(A0_1484, "component").render = A2_1486
  if not A2_1486 then
    return
  end
  if A0_1484.parent and A0_1484.parent.render or nil then
    ;(A0_1484.parent and A0_1484.parent.render or nil):AddChild(A2_1486)
  end
  for _FORV_10_, _FORV_11_ in pairs(A0_1484.child.all) do
    A2_1486:AddChild(_FORV_11_.render)
  end
end
L0_1456 = Component
function L0_1456.x_get(A0_1487, A1_1488)
  local L2_1489
  L2_1489 = A0_1487.render
  if not L2_1489 then
    return
  end
  return L2_1489:PositionX()
end
L0_1456 = Component
function L0_1456.x_set(A0_1490, A1_1491, A2_1492)
  local L3_1493
  L3_1493 = A0_1490.render
  if not L3_1493 then
    return
  end
  L3_1493:SetPositionX(A2_1492)
end
L0_1456 = Component
function L0_1456.y_get(A0_1494, A1_1495)
  local L2_1496
  L2_1496 = A0_1494.render
  if not L2_1496 then
    return
  end
  return L2_1496:PositionY()
end
L0_1456 = Component
function L0_1456.y_set(A0_1497, A1_1498, A2_1499)
  local L3_1500
  L3_1500 = A0_1497.render
  if not L3_1500 then
    return
  end
  L3_1500:SetPositionY(A2_1499)
end
L0_1456 = Component
function L0_1456.order_get(A0_1501, A1_1502)
  local L2_1503
  L2_1503 = A0_1501.render
  if not L2_1503 then
    return
  end
  return L2_1503:ZOrder()
end
L0_1456 = Component
function L0_1456.order_set(A0_1504, A1_1505, A2_1506)
  local L3_1507
  L3_1507 = A0_1504.render
  if not L3_1507 then
    return
  end
  return L3_1507:SetZOrder(A2_1506)
end
L0_1456 = Component
function L0_1456.position_get(A0_1508, A1_1509)
  local L2_1510
  L2_1510 = A0_1508.render
  if not L2_1510 then
    return
  end
  return L2_1510:Position()
end
L0_1456 = Component
function L0_1456.position_set(A0_1511, A1_1512, A2_1513, A3_1514)
  local L4_1515
  L4_1515 = A0_1511.render
  if not L4_1515 then
    return
  end
  L4_1515:SetPosition(A2_1513, A3_1514)
end
L0_1456 = Component
function L0_1456.width_get(A0_1516, A1_1517)
  local L2_1518
  L2_1518 = A0_1516.render
  if not L2_1518 then
    return
  end
  return L2_1518:ContentSize().Width
end
L0_1456 = Component
function L0_1456.width_set(A0_1519, A1_1520, A2_1521)
  local L3_1522
  L3_1522 = A0_1519.render
  if not L3_1522 then
    return
  end
  L3_1522:SetContentSize(Size(A2_1521, L3_1522:ContentSize().Height))
end
L0_1456 = Component
function L0_1456.height_get(A0_1523, A1_1524)
  local L2_1525
  L2_1525 = A0_1523.render
  if not L2_1525 then
    return
  end
  return L2_1525:ContentSize().Height
end
L0_1456 = Component
function L0_1456.height_set(A0_1526, A1_1527, A2_1528)
  local L3_1529
  L3_1529 = A0_1526.render
  if not L3_1529 then
    return
  end
  L3_1529:SetContentSize(Size(L3_1529:ContentSize().Width, A2_1528))
end
L0_1456 = Component
function L0_1456.size_get(A0_1530, A1_1531)
  local L2_1532
  L2_1532 = A0_1530.render
  if not L2_1532 then
    return
  end
  return L2_1532:ContentSize()
end
L0_1456 = Component
function L0_1456.size_set(A0_1533, A1_1534, A2_1535, A3_1536)
  local L4_1537, L5_1538, L6_1539
  L4_1537 = A0_1533.render
  if not L4_1537 then
    return
  end
  L6_1539 = L4_1537
  L5_1538 = L4_1537.SetContentSize
  L5_1538(L6_1539, Size(A2_1535, A3_1536))
end
L0_1456 = Component
function L0_1456.anchorpoint_get(A0_1540, A1_1541)
  local L2_1542
  L2_1542 = A0_1540.render
  if not L2_1542 then
    return
  end
  return L2_1542:AnchorPoint()
end
L0_1456 = Component
function L0_1456.anchorpoint_set(A0_1543, A1_1544, A2_1545, A3_1546)
  local L4_1547, L5_1548, L6_1549
  L4_1547 = A0_1543.render
  if not L4_1547 then
    return
  end
  L6_1549 = L4_1547
  L5_1548 = L4_1547.SetAnchorPoint
  L5_1548(L6_1549, Point(A2_1545, A3_1546))
end
L0_1456 = Component
function L0_1456.scale_x_get(A0_1550, A1_1551)
  local L2_1552
  L2_1552 = A0_1550.render
  if not L2_1552 then
    return
  end
  return L2_1552:ScaleX()
end
L0_1456 = Component
function L0_1456.scale_x_set(A0_1553, A1_1554, A2_1555)
  local L3_1556
  L3_1556 = A0_1553.render
  if not L3_1556 then
    return
  end
  L3_1556:SetScaleX(A2_1555)
end
L0_1456 = Component
function L0_1456.scale_y_get(A0_1557, A1_1558)
  local L2_1559
  L2_1559 = A0_1557.render
  if not L2_1559 then
    return
  end
  return L2_1559:ScaleY()
end
L0_1456 = Component
function L0_1456.scale_y_set(A0_1560, A1_1561, A2_1562)
  local L3_1563
  L3_1563 = A0_1560.render
  if not L3_1563 then
    return
  end
  L3_1563:SetScaleY(A2_1562)
end
L0_1456 = Component
function L0_1456.scale_get(A0_1564, A1_1565)
  local L2_1566
  L2_1566 = A0_1564.render
  if not L2_1566 then
    return
  end
  return L2_1566:Scale()
end
L0_1456 = Component
function L0_1456.scale_set(A0_1567, A1_1568, A2_1569, A3_1570)
  local L4_1571
  L4_1571 = A0_1567.render
  if not L4_1571 then
    return
  end
  L4_1571:SetScale(A2_1569, A3_1570)
end
L0_1456 = Component
function L0_1456.rotation_x_get(A0_1572, A1_1573)
  local L2_1574
  L2_1574 = A0_1572.render
  if not L2_1574 then
    return
  end
  return L2_1574:RotationX()
end
L0_1456 = Component
function L0_1456.rotation_x_set(A0_1575, A1_1576, A2_1577)
  local L3_1578
  L3_1578 = A0_1575.render
  if not L3_1578 then
    return
  end
  L3_1578:SetRotationX(A2_1577)
end
L0_1456 = Component
function L0_1456.rotation_y_get(A0_1579, A1_1580)
  local L2_1581
  L2_1581 = A0_1579.render
  if not L2_1581 then
    return
  end
  return L2_1581:RotationY()
end
L0_1456 = Component
function L0_1456.rotation_y_set(A0_1582, A1_1583, A2_1584)
  local L3_1585
  L3_1585 = A0_1582.render
  if not L3_1585 then
    return
  end
  L3_1585:SetRotationY(A2_1584)
end
L0_1456 = Component
function L0_1456.rotation_get(A0_1586, A1_1587)
  local L2_1588
  L2_1588 = A0_1586.render
  if not L2_1588 then
    return
  end
  return L2_1588:Rotation()
end
L0_1456 = Component
function L0_1456.rotation_set(A0_1589, A1_1590, A2_1591)
  local L3_1592
  L3_1592 = A0_1589.render
  if not L3_1592 then
    return
  end
  L3_1592:SetRotation(A2_1591)
end
L0_1456 = Component
function L0_1456.opacity_get(A0_1593, A1_1594)
  local L2_1595
  L2_1595 = A0_1593.render
  if not L2_1595 then
    return
  end
  return L2_1595:Opacity()
end
L0_1456 = Component
function L0_1456.opacity_set(A0_1596, A1_1597, A2_1598)
  local L3_1599
  L3_1599 = A0_1596.render
  if not L3_1599 then
    return
  end
  L3_1599:SetOpacity(A2_1598)
end
L0_1456 = Component
function L0_1456.color_get(A0_1600, A1_1601, A2_1602)
  local L3_1603
  L3_1603 = A0_1600.render
  if not L3_1603 then
    return
  end
  return L3_1603:Color().r << 24 | L3_1603:Color().g << 16 | L3_1603:Color().b << 8
end
L0_1456 = Component
function L0_1456.color_set(A0_1604, A1_1605, A2_1606)
  local L3_1607, L4_1608, L5_1609, L6_1610
  L3_1607 = A0_1604.render
  if not L3_1607 then
    return
  end
  L4_1608 = type
  L5_1609 = A2_1606
  L4_1608 = L4_1608(L5_1609)
  if L4_1608 ~= "number" then
    return
  end
  L4_1608 = A2_1606 & 4278190080
  L4_1608 = L4_1608 >> 24
  L5_1609 = A2_1606 & 16711680
  L5_1609 = L5_1609 >> 16
  L6_1610 = A2_1606 & 65280
  L6_1610 = L6_1610 >> 8
  L3_1607:SetColor(Color3B(L4_1608, L5_1609, L6_1610))
end
L0_1456 = Component
function L0_1456.visible_get(A0_1611, A1_1612, A2_1613)
  local L3_1614
  L3_1614 = A0_1611.render
  if not L3_1614 then
    return
  end
  return L3_1614:IsVisible()
end
L0_1456 = Component
function L0_1456.visible_set(A0_1615, A1_1616, A2_1617)
  local L3_1618
  L3_1618 = A0_1615.render
  if not L3_1618 then
    return
  end
  L3_1618:SetVisible(A2_1617)
end
L0_1456 = Component
function L0_1456.action_set(A0_1619, A1_1620, A2_1621)
  local L3_1622
  if not A2_1621 then
    return
  end
  L3_1622 = A0_1619.render
  if not L3_1622 then
    return
  end
  L3_1622:RunAction(A2_1621)
end
L0_1456 = Component
function L0_1456.pause_actions_set(A0_1623, A1_1624, A2_1625)
  local L3_1626
  L3_1626 = A0_1623.render
  if not L3_1626 then
    return
  end
  L3_1626:PauseActions()
end
L0_1456 = Component
function L0_1456.resume_actions_set(A0_1627, A1_1628, A2_1629)
  local L3_1630
  L3_1630 = A0_1627.render
  if not L3_1630 then
    return
  end
  L3_1630:ResumeActions()
end
L0_1456 = Component
function L0_1456.unaction_set(A0_1631, A1_1632, A2_1633)
  local L3_1634
  if not A2_1633 then
    return
  end
  L3_1634 = A0_1631.render
  if not L3_1634 then
    return
  end
  L3_1634:StopAction(A2_1633)
end
L0_1456 = Component
function L0_1456.unactions_set(A0_1635)
  local L1_1636
  L1_1636 = A0_1635.render
  if not L1_1636 then
    return
  end
  L1_1636:StopAllActions()
end
L0_1456 = Component
function L0_1456.add_set(A0_1637, A1_1638, A2_1639)
  local L3_1640
  if not A2_1639 then
    return
  end
  L3_1640 = A2_1639.name
  if not L3_1640 then
    return
  end
  if not rawget(A0_1637, "component") then
    return
  end
  if rawget(A0_1637, "component")[L3_1640] then
    A0_1637.remove = rawget(A0_1637, "component")[L3_1640]
  end
  rawget(A0_1637, "component")[L3_1640] = A2_1639
  A2_1639.parent = A0_1637
  A2_1639.enter = true
end
L0_1456 = Component
function L0_1456.remove(A0_1641, A1_1642, A2_1643)
  local L3_1644
  if not A2_1643 then
    return
  end
  L3_1644 = A2_1643.name
  if not L3_1644 then
    return
  end
  if not rawget(A0_1641, "component") then
    return
  end
  if rawget(A0_1641, "component")[L3_1644] ~= A2_1643 then
    return
  end
  rawget(A0_1641, "component")[L3_1644] = nil
  rawget(A0_1641, "component")[L3_1644].exit = true
  rawget(A0_1641, "component")[L3_1644].parent = nil
end
L0_1456 = Component
function L0_1456.parent_get(A0_1645, A1_1646)
  local L2_1647
  L2_1647 = rawget
  L2_1647 = L2_1647(A0_1645, "values")
  if not L2_1647 then
    return
  end
  if not rawget(L2_1647, A1_1646) then
    return
  end
  return rawget(L2_1647, A1_1646)[A1_1646]
end
L0_1456 = Component
function L0_1456.parent_set(A0_1648, A1_1649, A2_1650)
  local L3_1651, L4_1652
  L3_1651 = A0_1648.parent
  if L3_1651 == A2_1650 then
    return
  end
  L3_1651 = rawget
  L4_1652 = A0_1648
  L3_1651 = L3_1651(L4_1652, "values")
  if not L3_1651 then
    return
  end
  L4_1652 = rawget
  L4_1652 = L4_1652(L3_1651, "parent")
  if L4_1652 and L4_1652.parent or nil then
    ;(L4_1652 and L4_1652.parent or nil).child.remove = {A0_1648, A2_1650}
  end
  if not L4_1652 then
    L4_1652 = {}
    setmetatable(L4_1652, {__mode = "v"})
    rawset(L3_1651, A1_1649, L4_1652)
  end
  if A2_1650 then
    A2_1650.child.add = A0_1648
  end
end
L0_1456 = Component
function L0_1456.start_get(A0_1653)
  return rawget(A0_1653, "start")
end
L0_1456 = Component
function L0_1456.start_set(A0_1654, A1_1655, A2_1656)
  if rawget(A0_1654, "start") then
    return
  end
  rawset(A0_1654, "start", true)
  A0_1654.fire = "Start"
  for _FORV_7_, _FORV_8_ in pairs(rawget(A0_1654, "child").all) do
    _FORV_8_.start = true
  end
end
L0_1456 = Component
function L0_1456.stop_get(A0_1657)
  return not rawget(A0_1657, "start")
end
L0_1456 = Component
function L0_1456.stop_set(A0_1658, A1_1659, A2_1660)
  if not rawget(A0_1658, "start") then
    return
  end
  rawset(A0_1658, "start", false)
  A0_1658.fire = "Stop"
  A0_1658.unactions = true
  for _FORV_7_, _FORV_8_ in pairs(rawget(A0_1658, "child").all) do
    _FORV_8_.stop = true
  end
end
function L0_1456(A0_1661, A1_1662)
  return A0_1661:Priority() < A1_1662:Priority()
end
function Component.on_set(A0_1663, A1_1664, A2_1665, ...)
  local L4_1667
  L3_1666 = rawget
  L4_1667 = A0_1663
  L3_1666 = L3_1666(L4_1667, "event")
  L4_1667 = L3_1666[A2_1665]
  if not L4_1667 then
    L4_1667 = {}
    L3_1666[A2_1665] = L4_1667
  end
  table.insert(L4_1667, Acceptor(...))
  table.sort(L4_1667, L0_1456)
end
function Component.off_set(A0_1668, A1_1669, A2_1670, ...)
  local L4_1672, L5_1673, L6_1674, L7_1675, L8_1676
  L3_1671 = rawget
  L4_1672 = A0_1668
  L3_1671 = L3_1671(L4_1672, L5_1673)
  L4_1672 = L3_1671[A2_1670]
  if not L4_1672 then
    return
  end
  for L8_1676, _FORV_9_ in L5_1673(L6_1674) do
    if _FORV_9_:Equal(...) then
      table.remove(L4_1672, L8_1676)
      return
    end
  end
end
function Component.fire_set(A0_1677, A1_1678, A2_1679, ...)
  local L4_1681
  L3_1680 = rawget
  L4_1681 = A0_1677
  L3_1680 = L3_1680(L4_1681, "event")
  L4_1681 = L3_1680[A2_1679]
  if not L4_1681 then
    return
  end
  for _FORV_8_, _FORV_9_ in pairs(L4_1681) do
    _FORV_9_:On(A0_1677, ...)
  end
end
function Component.script_set(A0_1682, A1_1683, A2_1684, ...)
  if not A2_1684 then
    return
  end
  if type(A2_1684) ~= "string" then
    return
  end
  if not string.find(A2_1684, ".*/(.*).nts$") then
    return
  end
  if not Global[string.find(A2_1684, ".*/(.*).nts$")] then
    include(A2_1684)
  end
  A0_1682.add, Global[string.find(A2_1684, ".*/(.*).nts$")](A0_1682, ...).name = Global[string.find(A2_1684, ".*/(.*).nts$")](A0_1682, ...), string.find(A2_1684, ".*/(.*).nts$")
end
function Component.unscript_set(A0_1685, A1_1686, A2_1687)
  if not A2_1687 then
    return
  end
  if type(A2_1687) ~= "string" then
    return
  end
  if not string.find(A2_1687, ".*/(.*).nts$") then
    return
  end
  if rawget(A0_1685, "component")[string.find(A2_1687, ".*/(.*).nts$")] then
    return
  end
  A0_1685.remove = rawget(A0_1685, "component")[string.find(A2_1687, ".*/(.*).nts$")]
end
function Component.component_set(A0_1688, A1_1689, A2_1690)
  if type(A2_1690) ~= "string" then
    Log("not string")
    return
  end
  if not LoadComponent(A2_1690) then
    Log("not component ", A2_1690)
    return
  end
  LoadComponent(A2_1690).parent = A0_1688
end
function Component.MemberGet(A0_1691, A1_1692)
  local L2_1693, L3_1694
  if not A0_1691 then
    return
  end
  L2_1693 = rawget
  L3_1694 = A0_1691
  L2_1693 = L2_1693(L3_1694, A1_1692)
  if L2_1693 then
    return L2_1693
  end
  L3_1694 = rawget
  L3_1694 = L3_1694(A0_1691, "__parent")
  if not L3_1694 then
    return
  end
  return Component.MemberGet(L3_1694, A1_1692)
end
function Component.MemberIndex(A0_1695, A1_1696)
  local L2_1697, L3_1698, L4_1699
  L2_1697 = string
  L2_1697 = L2_1697.format
  L3_1698 = "%s_get"
  L4_1699 = A1_1696
  L2_1697 = L2_1697(L3_1698, L4_1699)
  L3_1698 = getmetatable
  L4_1699 = A0_1695
  L3_1698 = L3_1698(L4_1699)
  L4_1699 = Component
  L4_1699 = L4_1699.MemberGet
  L4_1699 = L4_1699(L3_1698, L2_1697)
  if L4_1699 then
    return L4_1699(A0_1695, A1_1696)
  end
  if rawget(A0_1695, "component") and rawget(A0_1695, "component")[A1_1696] or nil then
    return rawget(A0_1695, "component") and rawget(A0_1695, "component")[A1_1696] or nil
  end
  return rawget(A0_1695, "child").all[A1_1696]
end
function Component.MemberNewIndex(A0_1700, A1_1701, A2_1702)
  local L3_1703, L4_1704, L5_1705
  L3_1703 = string
  L3_1703 = L3_1703.format
  L4_1704 = "%s_set"
  L5_1705 = A1_1701
  L3_1703 = L3_1703(L4_1704, L5_1705)
  L4_1704 = getmetatable
  L5_1705 = A0_1700
  L4_1704 = L4_1704(L5_1705)
  L5_1705 = Component
  L5_1705 = L5_1705.MemberGet
  L5_1705 = L5_1705(L4_1704, L3_1703)
  if not L5_1705 then
    return
  end
  if type(A2_1702) ~= "table" then
    L5_1705(A0_1700, A1_1701, A2_1702)
    return
  end
  if not rawget(A2_1702, 1) then
    L5_1705(A0_1700, A1_1701, A2_1702)
    return
  end
  L5_1705(A0_1700, A1_1701, table.unpack(A2_1702))
end
function Component.Destructor(A0_1706)
  local L1_1707
end
