local L1_7741
function L0_7740(A0_7742, A1_7743)
  local L2_7744
  if not A1_7743 then
    return
  end
  L2_7744 = A0_7742.physical
  L2_7744 = L2_7744[A0_7742.focus_object]
  if not L2_7744 then
    return
  end
  TransmitDelay(A1_7743.delay, A1_7743.tid, A1_7743.tn).name = "transmit"
  if L2_7744.transmit then
    L2_7744.transmit.parent = nil
  end
  TransmitDelay(A1_7743.delay, A1_7743.tid, A1_7743.tn).parent = L2_7744
end
map_10000 = L0_7740
function L0_7740(A0_7745, A1_7746)
  A0_7745.mobs_clean = true
  A0_7745.drop_items_clean = true
end
map_100000000 = L0_7740
function L0_7740(A0_7747, A1_7748)
end
map_220080001 = L0_7740
function L0_7740(A0_7749, A1_7750)
  local L2_7751, L3_7752, L4_7753, L5_7754
  L2_7751 = A1_7750.name
  if not L2_7751 then
    L2_7751 = true
    return L2_7751
  end
  L2_7751 = type
  L3_7752 = A1_7750.name
  L2_7751 = L2_7751(L3_7752)
  if L2_7751 ~= "string" then
    L2_7751 = true
    return L2_7751
  end
  L2_7751 = type
  L3_7752 = A1_7750.max
  L2_7751 = L2_7751(L3_7752)
  if L2_7751 ~= "number" then
    L2_7751 = true
    return L2_7751
  end
  L2_7751 = A0_7749.parent
  L2_7751 = L2_7751.parent
  L3_7752 = L2_7751.physical
  L4_7753 = L2_7751.focus_object
  L3_7752 = L3_7752[L4_7753]
  if not L3_7752 then
    L4_7753 = true
    return L4_7753
  end
  L4_7753 = os
  L4_7753 = L4_7753.date
  L5_7754 = "*t"
  L4_7753 = L4_7753(L5_7754)
  L4_7753.hour = 0
  L4_7753.min = 0
  L4_7753.sec = 0
  L5_7754 = os
  L5_7754 = L5_7754.time
  L5_7754 = L5_7754(L4_7753)
  if ((Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()) and (Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()).data or 0) > os.time() and ((Setting:One(string.format("belong = %d and name = 'c%s'", L3_7752.name, A1_7750.name)) or Setting()) and (Setting:One(string.format("belong = %d and name = 'c%s'", L3_7752.name, A1_7750.name)) or Setting()).data or 0) >= Config.ThreeNumber then
    return true
  end
  ;(Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()).name = A1_7750.name
  ;(Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()).belong = L3_7752.name
  ;(Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()).data = ((Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()) and (Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()).data or 0) > os.time() and ((Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()) and (Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()).data or 0) or math.floor(L5_7754 + os.difftime(L5_7754, os.time(os.date("!*t", L5_7754))) + Config.DayTimeStamp)
  ;(Setting:One(string.format("belong = %d and name = 'c%s'", L3_7752.name, A1_7750.name)) or Setting()).name = string.format("c%s", A1_7750.name)
  ;(Setting:One(string.format("belong = %d and name = 'c%s'", L3_7752.name, A1_7750.name)) or Setting()).belong = L3_7752.name
  ;(Setting:One(string.format("belong = %d and name = 'c%s'", L3_7752.name, A1_7750.name)) or Setting()).data = (((Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()) and (Setting:One(string.format("belong = %d and name = '%s'", L3_7752.name, A1_7750.name)) or Setting()).data or 0) > os.time() and ((Setting:One(string.format("belong = %d and name = 'c%s'", L3_7752.name, A1_7750.name)) or Setting()) and (Setting:One(string.format("belong = %d and name = 'c%s'", L3_7752.name, A1_7750.name)) or Setting()).data or 0) or 0) + Config.OneNumber
  SQLManager:SyncToService()
end
portal_10000 = L0_7740
