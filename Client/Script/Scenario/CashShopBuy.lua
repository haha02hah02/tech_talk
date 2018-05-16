Class.CashShopBuy.Script({})
function CashShopBuy.Constructor(A0_6101, A1_6102)
  Script.Constructor(A0_6101, A1_6102)
  if not A1_6102 then
    return
  end
  A1_6102.on = {
    "Visible",
    A0_6101,
    A0_6101.OnVisible
  }
  A1_6102.buy.on = {
    "Down",
    A0_6101,
    A0_6101.OnOkDown
  }
end
function CashShopBuy.OnOkDown(A0_6103, A1_6104)
  local L2_6105, L3_6106, L4_6107, L5_6108, L6_6109, L7_6110, L8_6111, L9_6112, L10_6113, L11_6114, L12_6115, L13_6116, L14_6117
  L3_6106 = A0_6103
  L2_6105 = A0_6103.Parent
  L2_6105 = L2_6105(L3_6106)
  L3_6106 = L2_6105.fail
  L3_6106 = L3_6106.visible
  if L3_6106 then
    L2_6105.visible = false
    return
  end
  L3_6106 = L2_6105.parent
  L3_6106 = L3_6106.parent
  L3_6106 = L3_6106.CashShop
  L4_6107 = UniqueComponent
  L5_6108 = "Model/interface.model"
  L4_6107 = L4_6107(L5_6108)
  L5_6108 = L4_6107.parent
  if not L5_6108 then
    L2_6105.visible = false
    return
  end
  L6_6109 = L5_6108.physical
  L7_6110 = L5_6108.focus_object
  L6_6109 = L6_6109[L7_6110]
  if not L6_6109 then
    L2_6105.visible = false
    return
  end
  L7_6110 = LoadConf
  L8_6111 = string
  L8_6111 = L8_6111.format
  L9_6112 = "Item/%d.item"
  L10_6113 = L2_6105.buy
  L10_6113 = L10_6113.tag
  L14_6117 = L8_6111(L9_6112, L10_6113)
  L7_6110 = L7_6110(L8_6111, L9_6112, L10_6113, L11_6114, L12_6115, L13_6116, L14_6117, L8_6111(L9_6112, L10_6113))
  L8_6111 = L7_6110.info
  L9_6112 = Userinfo
  L10_6113 = L9_6112
  L9_6112 = L9_6112.One
  L11_6114 = string
  L11_6114 = L11_6114.format
  L12_6115 = "serial = %d"
  L13_6116 = L6_6109.name
  L14_6117 = L11_6114(L12_6115, L13_6116)
  L9_6112 = L9_6112(L10_6113, L11_6114, L12_6115, L13_6116, L14_6117, L11_6114(L12_6115, L13_6116))
  L10_6113 = Integral
  L11_6114 = L10_6113
  L10_6113 = L10_6113.Sum
  L12_6115 = "quantity"
  L13_6116 = string
  L13_6116 = L13_6116.format
  L14_6117 = "belong = %d and limit = 0"
  L14_6117 = L13_6116(L14_6117, L9_6112.belong)
  L10_6113 = L10_6113(L11_6114, L12_6115, L13_6116, L14_6117, L13_6116(L14_6117, L9_6112.belong))
  L11_6114 = Integral
  L12_6115 = L11_6114
  L11_6114 = L11_6114.Sum
  L13_6116 = "quantity"
  L14_6117 = string
  L14_6117 = L14_6117.format
  L14_6117 = L14_6117("belong = %d and limit = 1", L9_6112.belong)
  L11_6114 = L11_6114(L12_6115, L13_6116, L14_6117, L14_6117("belong = %d and limit = 1", L9_6112.belong))
  L12_6115 = L8_6111.rintegral
  if L12_6115 then
    L12_6115 = L8_6111.price
  L12_6115 = L10_6113 < L12_6115 or true
  L13_6116 = L8_6111.price
  if L10_6113 < L13_6116 then
    L13_6116 = L8_6111.price
    if L11_6114 < L13_6116 then
      L13_6116 = true
    end
  else
    L12_6115 = L13_6116 or false
  end
  if L12_6115 then
    L2_6105.visible = false
    return
  end
  L13_6116 = L8_6111.is_cash
  if L13_6116 then
    L13_6116 = L8_6111.price
  elseif L13_6116 < 0 then
    return
  end
  L13_6116 = Integral
  L13_6116 = L13_6116()
  L14_6117 = L9_6112.belong
  L13_6116.belong = L14_6117
  L14_6117 = L8_6111.price
  L14_6117 = -L14_6117
  L13_6116.quantity = L14_6117
  L14_6117 = L8_6111.rintegral
  if L14_6117 then
    L14_6117 = 0
  elseif not L14_6117 then
    L14_6117 = L8_6111.price
    if L11_6114 >= L14_6117 then
      L14_6117 = 1
    else
      L14_6117 = L14_6117 or 0
    end
  end
  L13_6116.limit = L14_6117
  L13_6116.provenance = "cbought"
  L14_6117 = tostring
  L14_6117 = L14_6117(L7_6110.id)
  L13_6116.comment = L14_6117
  L14_6117 = L3_6106.RefreshIntegral
  L14_6117(L3_6106, L9_6112.belong)
  L14_6117 = Items
  L14_6117 = L14_6117()
  L14_6117.belong = L9_6112.serial
  L14_6117.item_id = L7_6110.id
  L14_6117.amount = 1
  L14_6117.level = 0
  L14_6117.slevel = 0
  L14_6117.tradable = L13_6116.limit == 0 and true or false
  L14_6117.provenance = "cbought"
  L3_6106:InsertItem(MakeItem(L14_6117))
  L2_6105.visible = false
  Sound:PlayEffect("Music/UI/BuyShopItem.mp3")
end
function CashShopBuy.OnVisible(A0_6118, A1_6119)
  if not A1_6119.visible then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  if (LoadConf(string.format("Item/%d.item", A1_6119.buy.tag)).info.rintegral and Integral:Sum("quantity", string.format("belong = %d and limit = 0", Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).belong)) < LoadConf(string.format("Item/%d.item", A1_6119.buy.tag)).info.price or false) == false and Integral:Sum("quantity", string.format("belong = %d and limit = 0", Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).belong)) < LoadConf(string.format("Item/%d.item", A1_6119.buy.tag)).info.price and Integral:Sum("quantity", string.format("belong = %d and limit = 1", Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).belong)) < LoadConf(string.format("Item/%d.item", A1_6119.buy.tag)).info.price then
  end
  A1_6119.icon.texture = string.format("Item/%d.icon", LoadConf(string.format("Item/%d.item", A1_6119.buy.tag)).id)
  A1_6119.fail.visible = true or LoadConf(string.format("Item/%d.item", A1_6119.buy.tag)).info.rintegral and Integral:Sum("quantity", string.format("belong = %d and limit = 0", Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).belong)) < LoadConf(string.format("Item/%d.item", A1_6119.buy.tag)).info.price or false
  A1_6119.sure.visible = not (true or LoadConf(string.format("Item/%d.item", A1_6119.buy.tag)).info.rintegral and Integral:Sum("quantity", string.format("belong = %d and limit = 0", Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).belong)) < LoadConf(string.format("Item/%d.item", A1_6119.buy.tag)).info.price or false)
end
