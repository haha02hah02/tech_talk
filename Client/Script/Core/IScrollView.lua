Class.IScrollView.Component({})
function IScrollView.Constructor(A0_2133, A1_2134, A2_2135, A3_2136, A4_2137, A5_2138, A6_2139, A7_2140)
  Component.Constructor(A0_2133)
  A0_2133.normal = A5_2138
  A0_2133.pressed = A6_2139
  A0_2133.iheight, A0_2133.iwidth, A0_2133.disabled = Image(A5_2138).height, Image(A5_2138).width, A7_2140
  A0_2133.ioffset_x = A3_2136
  A0_2133.row_count, A0_2133.col_count, A0_2133.ioffset_y = math.ceil(A2_2135 / (Image(A5_2138).height + A4_2137)), math.floor(A1_2134 / (Image(A5_2138).width + A3_2136)), A4_2137
  if not ListView(Size(A1_2134, A2_2135), Size(A1_2134, Image(A5_2138).height + A4_2137)) then
    return
  end
  ListView(Size(A1_2134, A2_2135), Size(A1_2134, Image(A5_2138).height + A4_2137)):SetBounceable(false)
  A0_2133.render = ListView(Size(A1_2134, A2_2135), Size(A1_2134, Image(A5_2138).height + A4_2137))
  A0_2133.on = {
    "Start",
    A0_2133,
    IScrollView.on_start_set
  }
  A0_2133.on = {
    "Stop",
    A0_2133,
    IScrollView.on_stop_set
  }
end
function IScrollView.class_get(A0_2141, A1_2142)
  local L2_2143
  L2_2143 = "IScrollView"
  return L2_2143
end
function IScrollView.prender_get(A0_2144, A1_2145, A2_2146)
end
function IScrollView.normal_get(A0_2147)
  return rawget(A0_2147, "normal")
end
function IScrollView.normal_set(A0_2148, A1_2149, A2_2150)
  rawset(A0_2148, "normal", A2_2150)
end
function IScrollView.pressed_get(A0_2151)
  return rawget(A0_2151, "pressed")
end
function IScrollView.pressed_set(A0_2152, A1_2153, A2_2154)
  rawset(A0_2152, "pressed", A2_2154)
end
function IScrollView.disabled_get(A0_2155)
  return rawget(A0_2155, "disabled")
end
function IScrollView.disabled_set(A0_2156, A1_2157, A2_2158)
  rawset(A0_2156, "disabled", A2_2158)
end
function IScrollView.iwidth_get(A0_2159)
  return rawget(A0_2159, "iwidth")
end
function IScrollView.iwidth_set(A0_2160, A1_2161, A2_2162)
  rawset(A0_2160, "iwidth", A2_2162)
end
function IScrollView.iheight_get(A0_2163)
  return rawget(A0_2163, "iheight")
end
function IScrollView.iheight_set(A0_2164, A1_2165, A2_2166)
  rawset(A0_2164, "iheight", A2_2166)
end
function IScrollView.ioffset_x_get(A0_2167)
  return rawget(A0_2167, "ioffset_x")
end
function IScrollView.ioffset_x_set(A0_2168, A1_2169, A2_2170)
  rawset(A0_2168, "ioffset_x", A2_2170)
end
function IScrollView.ioffset_y_get(A0_2171)
  return rawget(A0_2171, "ioffset_y")
end
function IScrollView.ioffset_y_set(A0_2172, A1_2173, A2_2174)
  rawset(A0_2172, "ioffset_y", A2_2174)
end
function IScrollView.col_count_get(A0_2175)
  return rawget(A0_2175, "col_count")
end
function IScrollView.col_count_set(A0_2176, A1_2177, A2_2178)
  rawset(A0_2176, "col_count", A2_2178)
end
function IScrollView.row_count_get(A0_2179)
  return rawget(A0_2179, "row_count")
end
function IScrollView.row_count_set(A0_2180, A1_2181, A2_2182)
  rawset(A0_2180, "row_count", A2_2182)
end
function IScrollView.priority_get(A0_2183)
  local L1_2184
  L1_2184 = A0_2183.render
  if not L1_2184 then
    return 0
  end
  return L1_2184:TouchPriority()
end
function IScrollView.priority_set(A0_2185, A1_2186, A2_2187)
  local L3_2188
  L3_2188 = A0_2185.render
  if not L3_2188 then
    return
  end
  L3_2188:SetTouchPriority(A2_2187)
end
function IScrollView.bounceable_set(A0_2189, A1_2190, A2_2191)
  local L3_2192
  L3_2192 = A0_2189.render
  if not L3_2192 then
    return
  end
  L3_2192:SetBounceable(A2_2191)
end
function IScrollView.on_at_index_get(A0_2193, A1_2194)
  return rawget(A0_2193, "on_at_index")
end
function IScrollView.on_at_index_set(A0_2195, A1_2196, A2_2197)
  rawset(A0_2195, "on_at_index", A2_2197)
end
function IScrollView.amount_get(A0_2198)
  local L1_2199
  L1_2199 = A0_2198.child
  L1_2199 = L1_2199.all
  L1_2199 = #L1_2199
  return L1_2199
end
function IScrollView.amount_set(A0_2200, A1_2201, A2_2202)
  local L3_2203, L4_2204, L5_2205
  L3_2203 = math
  L3_2203 = L3_2203.ceil
  L4_2204 = A0_2200.col_count
  L4_2204 = A2_2202 / L4_2204
  L3_2203 = L3_2203(L4_2204)
  A0_2200.row_count = L3_2203
  L3_2203 = A0_2200.child
  L3_2203 = L3_2203.all
  L3_2203 = #L3_2203
  L4_2204 = A2_2202 - L3_2203
  if L4_2204 == 0 then
    return
  end
  if L4_2204 < 0 then
    for _FORV_8_, _FORV_9_ in L5_2205(A0_2200.child.all) do
      if A2_2202 < _FORV_9_.name then
        _FORV_9_.parent = nil
      end
    end
    return
  end
  for _FORV_12_ = 1, L4_2204 do
    IScrollViewItem(table.unpack(L5_2205)).on, IScrollViewItem(table.unpack(L5_2205)).on, IScrollViewItem(table.unpack(L5_2205)).name = {
      "Up",
      A0_2200,
      IScrollView.on_item_up_fire
    }, {
      "Down",
      A0_2200,
      IScrollView.on_item_down_fire
    }, L3_2203 + _FORV_12_
    IScrollViewItem(table.unpack(L5_2205)).tag = L3_2203 + _FORV_12_
    IScrollViewItem(table.unpack(L5_2205)).priority = A0_2200.priority + 1
    IScrollViewItem(table.unpack(L5_2205)).parent = A0_2200
  end
end
function IScrollView.refresh_set(A0_2206, A1_2207, A2_2208)
  local L3_2209, L4_2210, L5_2211
  L3_2209 = A0_2206.render
  if not L3_2209 then
    return
  end
  L5_2211 = L3_2209
  L4_2210 = L3_2209.SetItemAmount
  L4_2210(L5_2211, math.ceil(#A0_2206.child.all / A0_2206.col_count))
end
function IScrollView.on_item_down_fire(A0_2212, A1_2213)
  A0_2212.fire = {
    "ItemDown",
    A1_2213.tag,
    A1_2213
  }
end
function IScrollView.on_item_up_fire(A0_2214, A1_2215)
  A0_2214.fire = {
    "ItemUp",
    A1_2215.tag,
    A1_2215
  }
end
function IScrollView.on_at_index_fire(A0_2216, A1_2217)
  local L2_2218, L3_2219, L4_2220, L5_2221, L6_2222, L7_2223, L8_2224, L9_2225, L10_2226, L11_2227, L12_2228, L13_2229, L14_2230, L15_2231
  L2_2218 = A1_2217.Cell
  L3_2219 = A1_2217.Select
  L3_2219 = L3_2219 + 1
  L4_2220 = math
  L4_2220 = L4_2220.floor
  L5_2221 = A0_2216.iwidth
  L6_2222 = A0_2216.ioffset_x
  L5_2221 = L5_2221 + L6_2222
  L5_2221 = L5_2221 / 2
  L4_2220 = L4_2220(L5_2221)
  L5_2221 = math
  L5_2221 = L5_2221.floor
  L6_2222 = A0_2216.iheight
  L7_2223 = A0_2216.ioffset_y
  L6_2222 = L6_2222 + L7_2223
  L6_2222 = L6_2222 / 2
  L5_2221 = L5_2221(L6_2222)
  L6_2222 = A0_2216.iwidth
  L7_2223 = A0_2216.ioffset_x
  L6_2222 = L6_2222 + L7_2223
  L7_2223 = A0_2216.child
  L7_2223 = L7_2223.all
  L8_2224 = A0_2216.col_count
  L9_2225(L10_2226, L11_2227)
  for L12_2228 = 1, L8_2224 do
    L13_2229 = L3_2219 - 1
    L13_2229 = L8_2224 * L13_2229
    L13_2229 = L12_2228 + L13_2229
    L14_2230 = L7_2223[L13_2229]
    if not L14_2230 then
      return
    end
    L15_2231 = L14_2230.render
    L15_2231:RemoveFromParentAndCleanup(false)
    L15_2231:SetPosition(L4_2220 + L6_2222 * (L12_2228 - 1), L5_2221)
    L2_2218:AddChild(L15_2231)
  end
end
function IScrollView.on_start_set(A0_2232)
  local L1_2233, L2_2234
  L1_2233 = A0_2232.render
  if not L1_2233 then
    return
  end
  L2_2234 = Functor
  L2_2234 = L2_2234(A0_2232, IScrollView.on_at_index_fire)
  A0_2232.on_at_index = L2_2234
  L1_2233:On("CellAtIndex", L2_2234)
  A0_2232.refresh = true
end
function IScrollView.on_stop_set(A0_2235)
  local L1_2236, L2_2237
  L1_2236 = A0_2235.render
  if not L1_2236 then
    return
  end
  L2_2237 = A0_2235.on_at_index
  A0_2235.on_at_index = nil
  L1_2236:Off("CellAtIndex", L2_2237)
end
