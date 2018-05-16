Class.Label.Component({})
function Label.Constructor(A0_2331, ...)
  Component.Constructor(A0_2331)
  A0_2331.render = LabelTTF(...)
end
function Label.class_get(A0_2332, A1_2333)
  local L2_2334
  L2_2334 = "Label"
  return L2_2334
end
function Label.text_get(A0_2335, A1_2336)
  local L2_2337
  L2_2337 = A0_2335.render
  if not L2_2337 then
    return
  end
  return L2_2337:String()
end
function Label.text_set(A0_2338, A1_2339, A2_2340)
  local L3_2341
  L3_2341 = A0_2338.render
  if not L3_2341 then
    return
  end
  if type(A2_2340) ~= "string" then
    return
  end
  L3_2341:SetString(A2_2340)
end
function Label.font_get(A0_2342, A1_2343, A2_2344)
  local L3_2345
  L3_2345 = A0_2342.render
  if not L3_2345 then
    return
  end
  return L3_2345:FontName()
end
function Label.font_set(A0_2346, A1_2347, A2_2348)
  local L3_2349
  L3_2349 = A0_2346.render
  if not L3_2349 then
    return
  end
  if type(A2_2348) ~= "string" then
    return
  end
  L3_2349:SetFontName(A2_2348)
end
function Label.font_size_get(A0_2350, A1_2351, A2_2352)
  local L3_2353
  L3_2353 = A0_2350.render
  if not L3_2353 then
    return
  end
  return L3_2353:FontSize()
end
function Label.font_size_set(A0_2354, A1_2355, A2_2356)
  local L3_2357
  L3_2357 = A0_2354.render
  if not L3_2357 then
    return
  end
  if type(A2_2356) ~= "number" then
    return
  end
  L3_2357:SetFontSize(A2_2356)
end
function Label.align_get(A0_2358, A1_2359, A2_2360)
  local L3_2361
  L3_2361 = A0_2358.render
  if not L3_2361 then
    return
  end
  if L3_2361:HorizontalAlignment() == TextAlignmentLeft then
    return "left"
  end
  if L3_2361:HorizontalAlignment() == TextAlignmentCenter then
    return "center"
  end
  if L3_2361:HorizontalAlignment() == TextAlignmentRight then
    return "right"
  end
end
function Label.align_set(A0_2362, A1_2363, A2_2364)
  local L3_2365
  L3_2365 = A0_2362.render
  if not L3_2365 then
    return
  end
  if A2_2364 == "left" then
    return L3_2365:SetHorizontalAlignment(TextAlignmentLeft)
  end
  if A2_2364 == "center" then
    return L3_2365:SetHorizontalAlignment(TextAlignmentCenter)
  end
  if A2_2364 == "right" then
    return L3_2365:SetHorizontalAlignment(TextAlignmentRight)
  end
end
function Label.dimensions_set(A0_2366, A1_2367, A2_2368, A3_2369)
  local L4_2370, L5_2371, L6_2372
  L4_2370 = A0_2366.render
  if not L4_2370 then
    return
  end
  L6_2372 = L4_2370
  L5_2371 = L4_2370.SetDimensions
  L5_2371(L6_2372, Size(A2_2368, A3_2369))
end
function Label.width_get(A0_2373, A1_2374)
  local L2_2375
  L2_2375 = A0_2373.render
  if not L2_2375 then
    return
  end
  return L2_2375:Texture():ContentSize().Width
end
function Label.height_get(A0_2376, A1_2377)
  local L2_2378
  L2_2378 = A0_2376.render
  if not L2_2378 then
    return
  end
  return L2_2378:Texture():ContentSize().Height
end
