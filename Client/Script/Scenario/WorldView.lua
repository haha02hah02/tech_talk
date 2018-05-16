local L1_7265, L2_7266
L0_7264 = Class
L0_7264 = L0_7264.WorldView
L0_7264 = L0_7264.Script
L1_7265 = {}
L0_7264(L1_7265)
L0_7264 = {}
L0_7264[11] = 10
L0_7264[21] = 20
L0_7264[25] = 60
L0_7264[27] = 80
L0_7264[12] = 10
L1_7265 = {}
L1_7265[22008] = 31
L1_7265[22007] = 31
L1_7265[22006] = 31
L1_7265[10501] = 12
L1_7265[10502] = 12
L1_7265[10503] = 12
L1_7265[10504] = 12
L1_7265[10505] = 12
L1_7265[10506] = 12
L1_7265[10507] = 12
L1_7265[10508] = 12
L1_7265[10509] = 12
L2_7266 = {}
L2_7266[2110403] = 21
L2_7266[2110404] = 21
L2_7266[2110405] = 21
L2_7266[2110406] = 21
L2_7266[2110407] = 21
L2_7266[2110408] = 21
L2_7266[2110409] = 21
L2_7266[2110410] = 21
L2_7266[2110411] = 21
L2_7266[2110412] = 21
L2_7266[2110413] = 21
L2_7266[2110414] = 21
L2_7266[2110415] = 21
L2_7266[2110416] = 21
L2_7266[2110417] = 21
L2_7266[2110418] = 21
L2_7266[2110419] = 21
L2_7266[2110420] = 21
L2_7266[2110421] = 21
L2_7266[2110422] = 21
L2_7266[2110423] = 21
function WorldView.Constructor(A0_7267, A1_7268)
  Script.Constructor(A0_7267, A1_7268)
  if not A1_7268 then
    return
  end
  A1_7268.on = {
    "Visible",
    A0_7267,
    A0_7267.OnVisible
  }
end
function WorldView.OnVisible(A0_7269, A1_7270)
  local L2_7271, L3_7272, L4_7273, L5_7274, L6_7275, L7_7276, L8_7277, L9_7278, L10_7279, L11_7280, L12_7281, L13_7282
  L2_7271 = A1_7270.visible
  if not L2_7271 then
    return
  end
  L3_7272 = A0_7269
  L2_7271 = A0_7269.Parent
  L2_7271 = L2_7271(L3_7272)
  L2_7271 = L2_7271.parent
  L2_7271 = L2_7271.parent
  L3_7272 = L2_7271.parent
  if not L3_7272 then
    return
  end
  L4_7273 = L3_7272.id
  L5_7274 = math
  L5_7274 = L5_7274.floor
  L6_7275 = L4_7273 / 10000000
  L5_7274 = L5_7274(L6_7275)
  L6_7275 = math
  L6_7275 = L6_7275.floor
  L7_7276 = L4_7273 / 10000
  L6_7275 = L6_7275(L7_7276)
  L7_7276 = math
  L7_7276 = L7_7276.floor
  L8_7277 = L4_7273 / 100
  L7_7276 = L7_7276(L8_7277)
  L8_7277 = L2_7266[L7_7276]
  if not L8_7277 then
    L8_7277 = L1_7265[L6_7275]
    L8_7277 = L8_7277 or L0_7264[L5_7274]
  end
  L9_7278 = string
  L9_7278 = L9_7278.format
  L10_7279 = "%02d"
  L11_7280 = L8_7277 or L5_7274
  L9_7278 = L9_7278(L10_7279, L11_7280)
  L10_7279 = LoadConf
  L11_7280 = string
  L11_7280 = L11_7280.format
  L12_7281 = "Config/WorldView%s.conf"
  L13_7282 = L9_7278
  L13_7282 = L11_7280(L12_7281, L13_7282)
  L10_7279 = L10_7279(L11_7280, L12_7281, L13_7282, L11_7280(L12_7281, L13_7282))
  if not L10_7279 then
    return
  end
  L11_7280 = L10_7279.list
  L12_7281 = L10_7279.id
  L12_7281 = L12_7281[L4_7273]
  L11_7280 = L11_7280[L12_7281]
  if not L11_7280 then
    L12_7281 = A1_7270.location
    L12_7281.visible = false
    return
  end
  L12_7281 = A1_7270.location
  L13_7282 = L11_7280.x
  L12_7281.x = L13_7282
  L12_7281 = A1_7270.location
  L13_7282 = L11_7280.y
  L12_7281.y = L13_7282
  L12_7281 = A1_7270.location
  L12_7281.visible = true
  L12_7281 = A1_7270.location
  L12_7281.unactions = true
  L12_7281 = Array
  L12_7281 = L12_7281()
  L13_7282 = L12_7281.AddObject
  L13_7282(L12_7281, MoveBy(0.8, Point(0, 10)))
  L13_7282 = L12_7281.AddObject
  L13_7282(L12_7281, MoveBy(0.8, Point(0, -10)))
  L13_7282 = A1_7270.location
  L13_7282.action = RepeatForever(Sequence(L12_7281))
  L13_7282 = A0_7269.result_code
  if L13_7282 == L9_7278 then
    return
  end
  A0_7269.result_code = L9_7278
  L13_7282 = Sprite
  L13_7282 = L13_7282(string.format("UI/Map/map%s.ntp", L9_7278))
  A1_7270.map.render:RemoveAllChildren()
  A1_7270.map.render:AddChild(L13_7282)
  for _FORV_18_, _FORV_19_ in pairs(L10_7279.list) do
    L13_7282 = Sprite("UI/Base/change.ntp")
    L13_7282:SetPosition(_FORV_19_.x, _FORV_19_.y)
    A1_7270.map.render:AddChild(L13_7282)
  end
end
