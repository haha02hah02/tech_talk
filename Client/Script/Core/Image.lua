Class.Image.Component({})
function Image.Constructor(A0_2100, A1_2101)
  Component.Constructor(A0_2100)
  A0_2100.render = A1_2101 and Sprite(A1_2101) or Sprite()
end
function Image.class_get(A0_2102, A1_2103)
  local L2_2104
  L2_2104 = "Image"
  return L2_2104
end
function Image.plist_get(A0_2105, A1_2106)
  return rawget(A0_2105, "plist")
end
function Image.plist_set(A0_2107, A1_2108, A2_2109)
  if type(A2_2109) ~= "string" then
    return
  end
  rawset(A0_2107, "plist", A2_2109)
end
function Image.texture_get(A0_2110, A1_2111)
  local L2_2112
  L2_2112 = A0_2110.render
  if not L2_2112 then
    return
  end
  return L2_2112:Texture()
end
function Image.texture_set(A0_2113, A1_2114, A2_2115)
  local L3_2116, L4_2117
  L3_2116 = A0_2113.render
  if not L3_2116 then
    return
  end
  L4_2117 = type
  L4_2117 = L4_2117(A2_2115)
  if L4_2117 ~= "string" then
    L4_2117 = L3_2116.InitWithTexture
    L4_2117(L3_2116, A2_2115)
    return
  end
  L4_2117 = A0_2113.ntplv
  if not L4_2117 then
    L3_2116:InitWithFile(A2_2115)
    return
  end
  SpriteFrameCache:AddSpriteFramesWithFile(L4_2117)
  L3_2116:initWithSpriteFrameName(A2_2115)
end
function Image.width_set(A0_2118, A1_2119, A2_2120)
  local L3_2121
  L3_2121 = A0_2118.render
  if not L3_2121 then
    return
  end
  L3_2121:SetContentSize(Size(A2_2120, L3_2121:ContentSize().Height))
  L3_2121:SetTextureRect(Rect(0, 0, A2_2120, L3_2121:ContentSize().Height))
end
function Image.height_set(A0_2122, A1_2123, A2_2124)
  local L3_2125
  L3_2125 = A0_2122.render
  if not L3_2125 then
    return
  end
  L3_2125:SetContentSize(Size(L3_2125:ContentSize().Width, A2_2124))
  L3_2125:SetTextureRect(Rect(0, 0, L3_2125:ContentSize().Width, A2_2124))
end
function Image.size_set(A0_2126, A1_2127, A2_2128, A3_2129)
  local L4_2130, L5_2131, L6_2132
  L4_2130 = A0_2126.render
  if not L4_2130 then
    return
  end
  L6_2132 = L4_2130
  L5_2131 = L4_2130.SetContentSize
  L5_2131(L6_2132, Size(A2_2128, A3_2129))
  L6_2132 = L4_2130
  L5_2131 = L4_2130.SetTextureRect
  L5_2131(L6_2132, Rect(0, 0, A2_2128, A3_2129))
end
