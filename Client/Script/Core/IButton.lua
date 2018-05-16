Class.IButton.Component({})
function IButton.Constructor(A0_2037, ...)
  local L2_2039
  L1_2038 = Component
  L1_2038 = L1_2038.Constructor
  L2_2039 = A0_2037
  L1_2038(L2_2039)
  L1_2038 = Menu
  L1_2038 = L1_2038()
  if not L1_2038 then
    return
  end
  L2_2039 = L1_2038.SetPosition
  L2_2039(L1_2038, 0, 0)
  L2_2039 = L1_2038.SetTouchPriority
  L2_2039(L1_2038, 0)
  A0_2037.render = L1_2038
  L2_2039 = MenuItemImage
  L2_2039 = L2_2039(...)
  if not L2_2039 then
    return
  end
  L2_2039:SetTag(1)
  L1_2038:AddChild(L2_2039)
  A0_2037.on = {
    "Start",
    A0_2037,
    IButton.on_start_set
  }
  A0_2037.on = {
    "Stop",
    A0_2037,
    IButton.on_stop_set
  }
end
function IButton.on_down_get(A0_2040, A1_2041)
  return rawget(A0_2040, "on_down")
end
function IButton.on_down_set(A0_2042, A1_2043, A2_2044)
  rawset(A0_2042, "on_down", A2_2044)
end
function IButton.on_up_get(A0_2045, A1_2046)
  return rawget(A0_2045, "on_up")
end
function IButton.on_up_set(A0_2047, A1_2048, A2_2049)
  rawset(A0_2047, "on_up", A2_2049)
end
function IButton.on_start_set(A0_2050)
  local L1_2051, L2_2052, L3_2053
  L1_2051 = A0_2050.render
  if not L1_2051 then
    return
  end
  L3_2053 = L1_2051
  L2_2052 = L1_2051.ChildByTag
  L2_2052 = L2_2052(L3_2053, 1)
  L1_2051 = L2_2052
  if not L1_2051 then
    return
  end
  L2_2052 = Functor
  L3_2053 = A0_2050
  L2_2052 = L2_2052(L3_2053, IButton.on_down_fire)
  L3_2053 = Functor
  L3_2053 = L3_2053(A0_2050, IButton.on_up_fire)
  A0_2050.on_down = L2_2052
  A0_2050.on_up = L3_2053
  L1_2051:On("Down", L2_2052)
  L1_2051:On("Up", L3_2053)
end
function IButton.on_stop_set(A0_2054)
  local L1_2055, L2_2056, L3_2057
  L1_2055 = A0_2054.render
  if not L1_2055 then
    return
  end
  L3_2057 = L1_2055
  L2_2056 = L1_2055.ChildByTag
  L2_2056 = L2_2056(L3_2057, 1)
  L1_2055 = L2_2056
  if not L1_2055 then
    return
  end
  L2_2056 = A0_2054.on_down
  L3_2057 = A0_2054.on_up
  A0_2054.on_down = nil
  A0_2054.on_up = nil
  L1_2055:Off("Down", L2_2056)
  L1_2055:Off("Up", L3_2057)
end
function IButton.on_down_fire(A0_2058)
  local L1_2059
  A0_2058.fire = "Down"
end
function IButton.on_up_fire(A0_2060)
  local L1_2061
  A0_2060.fire = "Up"
end
function IButton.class_get(A0_2062, A1_2063)
  local L2_2064
  L2_2064 = "IButton"
  return L2_2064
end
function IButton.touch_point_get(A0_2065)
  local L1_2066
  L1_2066 = A0_2065.render
  if not L1_2066 then
    return
  end
  L1_2066 = L1_2066:ChildByTag(1)
  if not L1_2066 then
    return
  end
  return L1_2066:TouchPoint()
end
function IButton.enable_get(A0_2067, A1_2068, A2_2069)
  local L3_2070
  L3_2070 = A0_2067.render
  if not L3_2070 then
    return
  end
  L3_2070 = L3_2070:ChildByTag(1)
  if not L3_2070 then
    return
  end
  return L3_2070:IsEnabled()
end
function IButton.enable_set(A0_2071, A1_2072, A2_2073)
  local L3_2074
  L3_2074 = A0_2071.render
  if not L3_2074 then
    return
  end
  L3_2074 = L3_2074:ChildByTag(1)
  if not L3_2074 then
    return
  end
  L3_2074:SetEnabled(A2_2073)
end
function IButton.disable_get(A0_2075, A1_2076, A2_2077)
  local L3_2078
  L3_2078 = A0_2075.render
  if not L3_2078 then
    return
  end
  L3_2078 = L3_2078:ChildByTag(1)
  if not L3_2078 then
    return
  end
  return not L3_2078:IsEnabled()
end
function IButton.disable_set(A0_2079, A1_2080, A2_2081)
  local L3_2082
  L3_2082 = A0_2079.render
  if not L3_2082 then
    return
  end
  L3_2082 = L3_2082:ChildByTag(1)
  if not L3_2082 then
    return
  end
  L3_2082:SetEnabled(not A2_2081)
end
function IButton.selected_get(A0_2083)
  local L1_2084
  L1_2084 = A0_2083.render
  if not L1_2084 then
    return
  end
  L1_2084 = L1_2084:ChildByTag(1)
  if not L1_2084 then
    return
  end
  return L1_2084:IsSelected()
end
function IButton.priority_set(A0_2085, A1_2086, A2_2087)
  local L3_2088
  L3_2088 = A0_2085.render
  if not L3_2088 then
    return
  end
  L3_2088:SetTouchPriority(A2_2087)
end
