Class.ShopItemView.Component({})
function ShopItemView.Constructor(A0_3434, A1_3435, A2_3436, A3_3437, A4_3438)
  Component.Constructor(A0_3434)
  if not Node() then
    return
  end
  A0_3434.render = Node()
  A0_3434.order = 100
  if not LoadConf(string.format("Item/%d.item", A1_3435)) then
    return
  end
  A0_3434.info = LoadConf(string.format("Item/%d.item", A1_3435)).info
  A0_3434.id = A1_3435
  Image(string.format("Item/%d.icon", A1_3435)).name = "icon"
  Image(string.format("Item/%d.icon", A1_3435)).x = 18
  Image(string.format("Item/%d.icon", A1_3435)).y = 21
  Image(string.format("Item/%d.icon", A1_3435)).parent = A0_3434
  ILabel(tostring(A2_3436 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).name = "number"
  ILabel(tostring(A2_3436 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).x = 35
  ILabel(tostring(A2_3436 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).y = 4
  ILabel(tostring(A2_3436 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).anchorpoint = {1, 0}
  ILabel(tostring(A2_3436 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).visible = 1 < (A2_3436 or 1) and true or false
  ILabel(tostring(A2_3436 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).parent = A0_3434
  Label(LoadConf(string.format("Item/%d.item", A1_3435)).info.name, "Arial", 11).name = "item_name"
  Label(LoadConf(string.format("Item/%d.item", A1_3435)).info.name, "Arial", 11).x = 40
  Label(LoadConf(string.format("Item/%d.item", A1_3435)).info.name, "Arial", 11).y = 28
  Label(LoadConf(string.format("Item/%d.item", A1_3435)).info.name, "Arial", 11).color = 252645375
  Label(LoadConf(string.format("Item/%d.item", A1_3435)).info.name, "Arial", 11).anchorpoint = {0, 0.5}
  Label(LoadConf(string.format("Item/%d.item", A1_3435)).info.name, "Arial", 11).parent = A0_3434
  Image("UI/Shop/coin.ntp").name = "coin"
  Image("UI/Shop/coin.ntp").x = 45
  Image("UI/Shop/coin.ntp").y = 11
  Image("UI/Shop/coin.ntp").parent = A0_3434
  Image("UI/Backpack/green.ntp").name = "state"
  Image("UI/Backpack/green.ntp").x = 2
  Image("UI/Backpack/green.ntp").y = 34
  Image("UI/Backpack/green.ntp").visible = false
  Image("UI/Backpack/green.ntp").parent = A0_3434
  A0_3434.stochastic = A4_3438
  Label(PriceFormat(LoadConf(string.format("Item/%d.item", A1_3435)).info.price * (A2_3436 or 1) * (A3_3437 or 1)), "Arial", 11).name = "price"
  Label(PriceFormat(LoadConf(string.format("Item/%d.item", A1_3435)).info.price * (A2_3436 or 1) * (A3_3437 or 1)), "Arial", 11).x = 55
  Label(PriceFormat(LoadConf(string.format("Item/%d.item", A1_3435)).info.price * (A2_3436 or 1) * (A3_3437 or 1)), "Arial", 11).y = 11
  Label(PriceFormat(LoadConf(string.format("Item/%d.item", A1_3435)).info.price * (A2_3436 or 1) * (A3_3437 or 1)), "Arial", 11).color = 252645375
  Label(PriceFormat(LoadConf(string.format("Item/%d.item", A1_3435)).info.price * (A2_3436 or 1) * (A3_3437 or 1)), "Arial", 11).anchorpoint = {0, 0.5}
  Label(PriceFormat(LoadConf(string.format("Item/%d.item", A1_3435)).info.price * (A2_3436 or 1) * (A3_3437 or 1)), "Arial", 11).parent = A0_3434
end
function ShopItemView.stochastic_set(A0_3439, A1_3440, A2_3441)
  local L3_3442, L4_3443, L5_3444
  if A2_3441 then
    L3_3442 = true
  else
    L3_3442 = L3_3442 or false
  end
  L4_3443 = A0_3439.state
  L4_3443.visible = L3_3442
  if not L3_3442 then
    return
  end
  L4_3443 = 0
  for _FORV_8_, _FORV_9_ in L5_3444(A2_3441) do
    if _FORV_9_ > L4_3443 then
      L4_3443 = _FORV_9_
    end
  end
  L5_3444.visible = L4_3443 > 5
  if L4_3443 < 6 then
    return
  end
  A0_3439.state.texture = string.format("UI/Backpack/%s.ntp", L5_3444)
end
