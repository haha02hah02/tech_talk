local L1_6530, L2_6531, L3_6532
L0_6529 = Class
L0_6529 = L0_6529.ItemDetail
L0_6529 = L0_6529.Script
L1_6530 = {}
L0_6529(L1_6530)
L0_6529 = LoadConf
L1_6530 = "Config/String.conf"
L0_6529 = L0_6529(L1_6530)
L1_6530 = LoadConf
L2_6531 = "Config/Stochastic.conf"
L1_6530 = L1_6530(L2_6531)
L2_6531 = LoadConf
L3_6532 = "Config/Jobs.conf"
L2_6531 = L2_6531(L3_6532)
L3_6532 = {}
L3_6532[1] = "str"
L3_6532[2] = "dex"
L3_6532[3] = "int"
L3_6532[4] = "luck"
L3_6532[5] = "attack"
L3_6532[6] = "max_hp"
L3_6532[7] = "max_mp"
L3_6532[8] = "pdd"
L3_6532[9] = "mdd"
L3_6532[10] = "ias"
L3_6532[11] = "hit"
L3_6532[12] = "dodge"
L3_6532[13] = "critical"
L3_6532[14] = "speed"
L3_6532[15] = "jump"
function ItemDetail.Constructor(A0_6533, A1_6534)
  Script.Constructor(A0_6533, A1_6534)
end
function ItemDetail.NameType(A0_6535, A1_6536)
  local L2_6537, L3_6538, L4_6539
  L2_6537 = A1_6536.info
  L2_6537 = L2_6537.type
  L3_6538 = A1_6536.info
  L3_6538 = L3_6538.stype
  if L2_6537 == "cap" then
    L4_6539 = "cap"
    return L4_6539
  end
  if L2_6537 == "coat" and L3_6538 == "longcoat" then
    L4_6539 = "longcoat"
    return L4_6539
  end
  if L2_6537 == "coat" then
    L4_6539 = "coat"
    return L4_6539
  end
  if L2_6537 == "eardrop" then
    L4_6539 = "eardrop"
    return L4_6539
  end
  if L2_6537 == "badge" then
    L4_6539 = "badge"
    return L4_6539
  end
  if L2_6537 == "pants" then
    L4_6539 = "pants"
    return L4_6539
  end
  if L2_6537 == "glove" then
    L4_6539 = "glove"
    return L4_6539
  end
  if L2_6537 == "lring" then
    L4_6539 = "lring"
    return L4_6539
  end
  if L2_6537 == "rring" then
    L4_6539 = "rring"
    return L4_6539
  end
  if L2_6537 == "necklace" then
    L4_6539 = "necklace"
    return L4_6539
  end
  if L2_6537 == "belt" then
    L4_6539 = "belt"
    return L4_6539
  end
  if L2_6537 == "cape" then
    L4_6539 = "cape"
    return L4_6539
  end
  if L2_6537 == "shoes" then
    L4_6539 = "shoes"
    return L4_6539
  end
  if L2_6537 == "shoulder" then
    L4_6539 = "shoulder"
    return L4_6539
  end
  if L2_6537 == "weapon" and L3_6538 == "dualwield" then
    L4_6539 = "dualwield"
    return L4_6539
  end
  if L2_6537 == "weapon" then
    L4_6539 = "weapon"
    return L4_6539
  end
  if L2_6537 == "assistant" and L3_6538 == "shield" then
    L4_6539 = "shield"
    return L4_6539
  end
  if L2_6537 == "assistant" and L3_6538 == "arrow" then
    L4_6539 = "arrow"
    return L4_6539
  end
  if L2_6537 == "assistant" and L3_6538 == "dart" then
    L4_6539 = "dart"
    return L4_6539
  end
end
function ItemDetail.StochasticAttrColor(A0_6540, A1_6541)
  local L2_6542
  if not A1_6541 then
    L2_6542 = 4210752255
    return L2_6542
  end
  if A1_6541 < 5 then
    L2_6542 = 2526451455
    return L2_6542
  end
  if A1_6541 < 6 then
    L2_6542 = 4210752255
    return L2_6542
  end
  if A1_6541 < 7 then
    L2_6542 = 16397055
    return L2_6542
  end
  if A1_6541 < 8 then
    L2_6542 = 6617855
    return L2_6542
  end
  if A1_6541 < 9 then
    L2_6542 = 4204147455
    return L2_6542
  end
  if A1_6541 < 10 then
    L2_6542 = 4197632255
    return L2_6542
  end
  L2_6542 = 4197593855
  return L2_6542
end
function ItemDetail.PlusAttr(A0_6543, A1_6544, A2_6545, A3_6546, A4_6547)
  local L5_6548, L6_6549, L7_6550, L8_6551
  if not A3_6546 then
    L5_6548 = 0
    return L5_6548
  end
  L5_6548 = A3_6546[A1_6544]
  if not L5_6548 then
    L5_6548 = 0
    return L5_6548
  end
  L5_6548 = A3_6546[A1_6544]
  L6_6549 = L1_6530[A1_6544]
  L6_6549 = L6_6549[L5_6548]
  if not L6_6549 then
    return
  end
  L7_6550 = A4_6547.req_level
  L7_6550 = L7_6550 or 10
  L8_6551 = L6_6549 < 0 and L6_6549 or L8_6551 + L6_6549 * (L7_6550 * A2_6545 * Config.IntensifyLevelRatio)
  return A1_6544 == "critical" and L8_6551 or math.floor(L8_6551)
end
function ItemDetail.SetEquipInfo(A0_6552, A1_6553, A2_6554, A3_6555, A4_6556, A5_6557)
  local L6_6558, L7_6559, L8_6560, L9_6561, L10_6562, L11_6563, L12_6564, L13_6565, L14_6566, L15_6567, L16_6568, L17_6569, L18_6570, L19_6571, L20_6572, L21_6573, L22_6574
  L7_6559 = A0_6552
  L6_6558 = A0_6552.Parent
  L6_6558 = L6_6558(L7_6559)
  L7_6559 = L6_6558.parent
  L7_6559 = L7_6559.parent
  L8_6560 = L7_6559.parent
  if not L8_6560 then
    return
  end
  L9_6561 = L8_6560.physical
  L10_6562 = L8_6560.focus_object
  L9_6561 = L9_6561[L10_6562]
  L10_6562 = L9_6561.data
  L11_6563 = A1_6553.info
  L12_6564 = L6_6558.item
  L12_6564.visible = false
  L12_6564 = L6_6558.equip
  L12_6564.visible = true
  L13_6565 = L12_6564.child
  L13_6565.remove_by_tag = 100
  L13_6565 = L12_6564.cash
  L14_6566 = L11_6563.is_cash
  if L14_6566 then
    L14_6566 = true
  else
    L14_6566 = L14_6566 or false
  end
  L13_6565.visible = L14_6566
  L13_6565 = L12_6564.icon
  L14_6566 = string
  L14_6566 = L14_6566.format
  L15_6567 = "Item/%d.icon"
  L14_6566 = L14_6566(L15_6567, L16_6568)
  L13_6565.texture = L14_6566
  L13_6565 = A3_6555 or 0
  if L13_6565 > 0 then
    L13_6565 = string
    L13_6565 = L13_6565.format
    L14_6566 = " +%d"
    L15_6567 = A3_6555
    L13_6565 = L13_6565(L14_6566, L15_6567)
  else
    L13_6565 = L13_6565 or ""
  end
  L14_6566 = L12_6564.item_name
  L15_6567 = string
  L15_6567 = L15_6567.format
  L15_6567 = L15_6567(L16_6568, L17_6569, L18_6570)
  L14_6566.text = L15_6567
  L14_6566 = L12_6564.req_level
  L15_6567 = string
  L15_6567 = L15_6567.format
  L15_6567 = L15_6567(L16_6568, L17_6569, L18_6570)
  L14_6566.text = L15_6567
  L14_6566 = L12_6564.req_level
  L15_6567 = L10_6562.level
  if L15_6567 < L16_6568 then
    L15_6567 = 4194304255
  else
    L15_6567 = L15_6567 or 4210752255
  end
  L14_6566.color = L15_6567
  L14_6566 = L12_6564.req_str
  L15_6567 = string
  L15_6567 = L15_6567.format
  L15_6567 = L15_6567(L16_6568, L17_6569, L18_6570)
  L14_6566.text = L15_6567
  L14_6566 = L12_6564.req_str
  L15_6567 = L10_6562.str
  if L15_6567 < L16_6568 then
    L15_6567 = 4194304255
  else
    L15_6567 = L15_6567 or 4210752255
  end
  L14_6566.color = L15_6567
  L14_6566 = L12_6564.req_dex
  L15_6567 = string
  L15_6567 = L15_6567.format
  L15_6567 = L15_6567(L16_6568, L17_6569, L18_6570)
  L14_6566.text = L15_6567
  L14_6566 = L12_6564.req_dex
  L15_6567 = L10_6562.dex
  if L15_6567 < L16_6568 then
    L15_6567 = 4194304255
  else
    L15_6567 = L15_6567 or 4210752255
  end
  L14_6566.color = L15_6567
  L14_6566 = L12_6564.req_int
  L15_6567 = string
  L15_6567 = L15_6567.format
  L15_6567 = L15_6567(L16_6568, L17_6569, L18_6570)
  L14_6566.text = L15_6567
  L14_6566 = L12_6564.req_int
  L15_6567 = L10_6562.int
  if L15_6567 < L16_6568 then
    L15_6567 = 4194304255
  else
    L15_6567 = L15_6567 or 4210752255
  end
  L14_6566.color = L15_6567
  L14_6566 = L12_6564.req_luck
  L15_6567 = string
  L15_6567 = L15_6567.format
  L15_6567 = L15_6567(L16_6568, L17_6569, L18_6570)
  L14_6566.text = L15_6567
  L14_6566 = L12_6564.req_luck
  L15_6567 = L10_6562.luck
  if L15_6567 < L16_6568 then
    L15_6567 = 4194304255
  else
    L15_6567 = L15_6567 or 4210752255
  end
  L14_6566.color = L15_6567
  L14_6566 = L12_6564.req_job
  L15_6567 = L11_6563.req_job
  if not L15_6567 then
    L15_6567 = L0_6529.all_job
  elseif not L15_6567 then
    L15_6567 = string
    L15_6567 = L15_6567.format
    L15_6567 = L15_6567(L16_6568, L17_6569, L18_6570)
  end
  L14_6566.text = L15_6567
  L14_6566 = L12_6564.req_job
  L15_6567 = L11_6563.req_job
  if not L15_6567 then
    L15_6567 = 4210752255
  elseif not L15_6567 then
    L15_6567 = L11_6563.req_job
    if L15_6567 ~= L16_6568 then
      L15_6567 = L11_6563.req_job
      if L15_6567 ~= L16_6568 then
        L15_6567 = 4194304255
      end
    else
      L15_6567 = L15_6567 or 4210752255
    end
  end
  L14_6566.color = L15_6567
  L14_6566 = {}
  L15_6567 = {}
  L22_6574 = A0_6552
  L21_6573 = A0_6552.NameType
  L21_6573 = L21_6573(L22_6574, A1_6553)
  L21_6573 = L0_6529[L21_6573]
  L21_6573 = L21_6573 or "Unknow"
  L22_6574 = L18_6570(L19_6571, L20_6572, L21_6573)
  L16_6568(L17_6569, L18_6570, L19_6571, L20_6572, L21_6573, L22_6574, L18_6570(L19_6571, L20_6572, L21_6573))
  L16_6568(L17_6569, L18_6570)
  for L19_6571, L20_6572 in L16_6568(L17_6569) do
    L21_6573 = L11_6563[L20_6572]
    L21_6573 = L21_6573 or 0
    L22_6574 = A0_6552.PlusAttr
    L22_6574 = L22_6574(A0_6552, L20_6572, A3_6555, A5_6557, L11_6563)
    L21_6573 = L21_6573 + L22_6574
    if L21_6573 > 0 then
      L22_6574 = table
      L22_6574 = L22_6574.insert
      L22_6574(L15_6567, string.format(isinteger(L21_6573) and "%s: + %d" or "%s: + %.1f", L0_6529[L20_6572], L21_6573))
      L22_6574 = table
      L22_6574 = L22_6574.insert
      L22_6574(L14_6566, A0_6552:StochasticAttrColor(A5_6557 and A5_6557[L20_6572] or 5))
    end
  end
  if not L16_6568 then
    L21_6573 = A2_6554 or 0
    L22_6574 = L18_6570(L19_6571, L20_6572)
    L16_6568(L17_6569, L18_6570, L19_6571, L20_6572, L21_6573, L22_6574, L18_6570(L19_6571, L20_6572))
    L16_6568(L17_6569, L18_6570)
  end
  for L21_6573, L22_6574 in L18_6570(L19_6571) do
    Label(L22_6574, "\228\187\191\229\174\139", 12).name = L22_6574.format("info_%d", L21_6573)
    Label(L22_6574, "\228\187\191\229\174\139", 12).x = -90
    Label(L22_6574, "\228\187\191\229\174\139", 12).y = L16_6568
    Label(L22_6574, "\228\187\191\229\174\139", 12).tag = 100
    Label(L22_6574, "\228\187\191\229\174\139", 12).color = L14_6566[L21_6573]
    Label(L22_6574, "\228\187\191\229\174\139", 12).anchorpoint = {0, 1}
    Label(L22_6574, "\228\187\191\229\174\139", 12).dimensions = {180, 0}
    Label(L22_6574, "\228\187\191\229\174\139", 12).align = "left"
    Label(L22_6574, "\228\187\191\229\174\139", 12).parent = L12_6564
  end
  L21_6573 = L17_6569
  L18_6570.size = L19_6571
  L12_6564.y = L18_6570
  L21_6573 = L17_6569
  L18_6570.size = L19_6571
end
function ItemDetail.SetItemInfo(A0_6575, A1_6576, A2_6577, A3_6578)
  local L4_6579, L5_6580, L6_6581
  L5_6580 = A0_6575
  L4_6579 = A0_6575.Parent
  L4_6579 = L4_6579(L5_6580)
  L5_6580 = L4_6579.equip
  L5_6580.visible = false
  L5_6580 = L4_6579.item
  L5_6580.visible = true
  L6_6581 = L4_6579.back_limit
  L6_6581.size = {300, 120}
  L6_6581 = L4_6579.back
  L6_6581.size = {300, 120}
  L6_6581 = L5_6580.icon
  L6_6581.texture = string.format("Item/%d.icon", A1_6576.id)
  L6_6581 = L5_6580.cash
  L6_6581.visible = A1_6576.info.is_cash and true or false
  L6_6581 = A1_6576.info
  L6_6581 = L6_6581.name
  L6_6581 = L6_6581 or ""
  L5_6580.item_name.text = 0 < (A3_6578 or 0) and string.format("%s +%d", L6_6581, A3_6578) or L6_6581
  L5_6580.detail.text = A1_6576.info.desc or ""
end
function ItemDetail.SetItem(A0_6582, A1_6583, ...)
  local L3_6585, L4_6586
  if not A1_6583 then
    return
  end
  L2_6584 = LoadConf
  L3_6585 = string
  L3_6585 = L3_6585.format
  L4_6586 = "Item/%d.item"
  L4_6586 = L3_6585(L4_6586, A1_6583)
  L2_6584 = L2_6584(L3_6585, L4_6586, L3_6585(L4_6586, A1_6583))
  L3_6585 = L2_6584.info
  L3_6585 = L3_6585.type
  L4_6586 = nil
  if L3_6585 == "cap" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "coat" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "pants" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "glove" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "cape" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "shoes" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "assistant" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "weapon" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "eardrop" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "badge" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "lring" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "rring" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "necklace" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "belt" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "shoulder" then
    L4_6586 = A0_6582.SetEquipInfo
  end
  if L3_6585 == "consume" then
    L4_6586 = A0_6582.SetItemInfo
  end
  if L3_6585 == "material" then
    L4_6586 = A0_6582.SetItemInfo
  end
  if L4_6586 then
    L4_6586(A0_6582, L2_6584, ...)
  end
end
