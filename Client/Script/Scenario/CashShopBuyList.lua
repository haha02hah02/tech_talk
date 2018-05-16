Class.CashShopBuyList.Script({})
function CashShopBuyList.Constructor(A0_6120, A1_6121)
  Script.Constructor(A0_6120, A1_6121)
  if not A1_6121 then
    return
  end
  A1_6121.on = {
    "Visible",
    A0_6120,
    A0_6120.OnVisible
  }
  A1_6121.buy.on = {
    "Down",
    A0_6120,
    A0_6120.OnBuyDown
  }
end
function CashShopBuyList.OnBuyDown(A0_6122, A1_6123)
  local L2_6124, L3_6125, L4_6126, L5_6127, L6_6128, L7_6129, L8_6130, L9_6131, L10_6132, L11_6133, L12_6134, L13_6135, L14_6136, L15_6137, L16_6138, L17_6139, L18_6140
  L3_6125 = A0_6122
  L2_6124 = A0_6122.Parent
  L2_6124 = L2_6124(L3_6125)
  L3_6125 = L2_6124.parent
  L3_6125 = L3_6125.parent
  L3_6125 = L3_6125.CashShop
  L5_6127 = L3_6125
  L4_6126 = L3_6125.CalcModifyItemList
  L4_6126 = L4_6126(L5_6127)
  L5_6127 = 0
  L6_6128 = UniqueComponent
  L7_6129 = "Model/interface.model"
  L6_6128 = L6_6128(L7_6129)
  L7_6129 = L6_6128.parent
  if not L7_6129 then
    return
  end
  L8_6130 = L7_6129.physical
  L8_6130 = L8_6130[L9_6131]
  if not L8_6130 then
    return
  end
  for L12_6134, L13_6135 in L9_6131(L10_6132) do
    L16_6138 = "Item/%d.item"
    L17_6139 = L13_6135
    L18_6140 = L15_6137(L16_6138, L17_6139)
    L5_6127 = L5_6127 + L15_6137
    if not L15_6137 then
      return
    end
  end
  L12_6134 = "serial = %d"
  L18_6140 = L11_6133(L12_6134, L13_6135)
  L12_6134 = "quantity"
  L18_6140 = L13_6135(L14_6136, L15_6137)
  L12_6134 = L11_6133
  L16_6138 = L9_6131.belong
  L18_6140 = L14_6136(L15_6137, L16_6138)
  if L5_6127 < 0 or L5_6127 > L10_6132 and L5_6127 > L11_6133 then
    return
  end
  L12_6134 = Integral
  L12_6134 = L12_6134()
  L12_6134.belong = L13_6135
  L12_6134.quantity = L13_6135
  if L5_6127 <= L11_6133 then
  else
  end
  L12_6134.limit = L13_6135
  L12_6134.provenance = "cbought"
  L12_6134.comment = L13_6135
  L13_6135(L14_6136, L15_6137)
  for L16_6138, L17_6139 in L13_6135(L14_6136) do
    L18_6140 = Items
    L18_6140 = L18_6140()
    L18_6140.belong = L9_6131.serial
    L18_6140.item_id = L17_6139
    L18_6140.amount = 1
    L18_6140.level = 0
    L18_6140.slevel = 0
    L18_6140.tradable = L12_6134.limit == 0 and true or false
    L18_6140.provenance = "cbought"
    L3_6125:InsertItem(MakeItem(L18_6140))
  end
  L2_6124.visible = false
  L13_6135(L14_6136, L15_6137)
end
function CashShopBuyList.OnVisible(A0_6141, A1_6142)
  local L2_6143, L3_6144, L4_6145, L5_6146, L6_6147, L7_6148, L8_6149, L9_6150, L10_6151, L11_6152, L12_6153, L13_6154, L14_6155
  L2_6143 = A1_6142.visible
  if not L2_6143 then
    return
  end
  L3_6144 = A0_6141
  L2_6143 = A0_6141.Parent
  L2_6143 = L2_6143(L3_6144)
  L3_6144 = L2_6143.parent
  L3_6144 = L3_6144.parent
  L3_6144 = L3_6144.CashShop
  L4_6145 = L2_6143.scrollview
  for L8_6149, L9_6150 in L5_6146(L6_6147) do
    L9_6150.parent = nil
  end
  L8_6149 = "Model/interface.model"
  L8_6149 = L7_6148.parent
  if not L8_6149 then
    return
  end
  L9_6150 = L8_6149.physical
  L9_6150 = L9_6150[L10_6151]
  if not L9_6150 then
    return
  end
  for L13_6154, L14_6155 in L10_6151(L11_6152) do
    CashBuyView(L14_6155).name = L14_6155
    CashBuyView(L14_6155).parent = L4_6145
  end
  L4_6145.refresh = true
  L13_6154 = "serial = %d"
  L14_6155 = L9_6150.name
  L14_6155 = L12_6153(L13_6154, L14_6155)
  L13_6154 = "quantity"
  L14_6155 = string
  L14_6155 = L14_6155.format
  L14_6155 = L14_6155("belong = %d and limit = 0", L10_6151.belong)
  L13_6154 = L12_6153
  L14_6155 = "quantity"
  L13_6154 = L2_6143.point_count
  L14_6155 = string
  L14_6155 = L14_6155.format
  L14_6155 = L14_6155("\229\133\177 %d \231\167\175\229\136\134", L6_6147)
  L13_6154.text = L14_6155
  L13_6154 = L2_6143.point_count
  if L6_6147 > L11_6152 and L6_6147 > L12_6153 then
    L14_6155 = 3691645695
  else
    L14_6155 = L14_6155 or 336860415
  end
  L13_6154.color = L14_6155
  L13_6154 = L2_6143.buy
  if L6_6147 > L11_6152 and L6_6147 > L12_6153 then
    L14_6155 = true
  else
    L14_6155 = L14_6155 or false
  end
  L13_6154.disable = L14_6155
end
