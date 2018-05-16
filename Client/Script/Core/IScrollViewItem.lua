Class.IScrollViewItem.Component({})
function IScrollViewItem.Constructor(A0_2238, ...)
  Component.Constructor(A0_2238)
  A0_2238.render = MenuItemImage(...)
  if not MenuItemImage(...) then
    return
  end
  A0_2238.on = {
    "Start",
    A0_2238,
    IScrollViewItem.on_start_set
  }
  A0_2238.on = {
    "Stop",
    A0_2238,
    IScrollViewItem.on_stop_set
  }
end
function IScrollViewItem.on_down_get(A0_2239, A1_2240)
  return rawget(A0_2239, "on_down")
end
function IScrollViewItem.on_down_set(A0_2241, A1_2242, A2_2243)
  rawset(A0_2241, "on_down", A2_2243)
end
function IScrollViewItem.on_up_get(A0_2244, A1_2245)
  return rawget(A0_2244, "on_up")
end
function IScrollViewItem.on_up_set(A0_2246, A1_2247, A2_2248)
  rawset(A0_2246, "on_up", A2_2248)
end
function IScrollViewItem.on_start_set(A0_2249)
  local L1_2250, L2_2251, L3_2252
  L1_2250 = A0_2249.render
  if not L1_2250 then
    return
  end
  L2_2251 = Functor
  L3_2252 = A0_2249
  L2_2251 = L2_2251(L3_2252, IScrollViewItem.on_down_fire)
  L3_2252 = Functor
  L3_2252 = L3_2252(A0_2249, IScrollViewItem.on_up_fire)
  A0_2249.on_down = L2_2251
  A0_2249.on_up = L3_2252
  L1_2250:On("Down", L2_2251)
  L1_2250:On("Up", L3_2252)
end
function IScrollViewItem.on_stop_set(A0_2253)
  local L1_2254, L2_2255, L3_2256
  L1_2254 = A0_2253.render
  if not L1_2254 then
    return
  end
  L2_2255 = A0_2253.on_down
  L3_2256 = A0_2253.on_up
  A0_2253.on_down = nil
  A0_2253.on_up = nil
  L1_2254:Off("Down", L2_2255)
  L1_2254:Off("Up", L3_2256)
end
function IScrollViewItem.on_down_fire(A0_2257)
  local L1_2258
  A0_2257.fire = "Down"
end
function IScrollViewItem.on_up_fire(A0_2259)
  local L1_2260
  A0_2259.fire = "Up"
end
function IScrollViewItem.class_get(A0_2261, A1_2262)
  local L2_2263
  L2_2263 = "IScrollViewItem"
  return L2_2263
end
function IScrollViewItem.enable_get(A0_2264, A1_2265, A2_2266)
  local L3_2267
  L3_2267 = A0_2264.render
  if not L3_2267 then
    return
  end
  return L3_2267:IsEnabled()
end
function IScrollViewItem.enable_set(A0_2268, A1_2269, A2_2270)
  local L3_2271
  L3_2271 = A0_2268.render
  if not L3_2271 then
    return
  end
  L3_2271:SetEnabled(A2_2270)
end
function IScrollViewItem.disable_get(A0_2272, A1_2273, A2_2274)
  local L3_2275
  L3_2275 = A0_2272.render
  if not L3_2275 then
    return
  end
  return not L3_2275:IsEnabled()
end
function IScrollViewItem.disable_set(A0_2276, A1_2277, A2_2278)
  local L3_2279
  L3_2279 = A0_2276.render
  if not L3_2279 then
    return
  end
  L3_2279:SetEnabled(not A2_2278)
end
