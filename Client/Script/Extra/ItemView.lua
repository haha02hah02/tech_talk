Class.ItemView.Component({})
function ItemView.Constructor(A0_3414, A1_3415, A2_3416, A3_3417)
  Component.Constructor(A0_3414)
  if not Node() then
    return
  end
  A0_3414.render = Node()
  if not LoadConf(string.format("Item/%d.item", A1_3415)) then
    return
  end
  A0_3414.id = A1_3415
  A0_3414.position = {22, 22}
  Image(string.format("Item/%d.icon", A1_3415)).name = "icon"
  Image(string.format("Item/%d.icon", A1_3415)).parent = A0_3414
  Image("UI/Backpack/green.ntp").name = "state"
  Image("UI/Backpack/green.ntp").x = -18
  Image("UI/Backpack/green.ntp").y = 18
  Image("UI/Backpack/green.ntp").visible = false
  Image("UI/Backpack/green.ntp").parent = A0_3414
  ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).name = "number"
  ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).x = 20
  ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).y = -18
  ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).anchorpoint = {1, 0}
  ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).parent = A0_3414
  A0_3414.amount = A2_3416
  A0_3414.stochastic = A3_3417
  if not LoadConf(string.format("Item/%d.item", A1_3415)).info.is_cash then
    return
  end
  Image("UI/Item/cash.ntp").name = "cash_icon"
  Image("UI/Item/cash.ntp").x = 12
  Image("UI/Item/cash.ntp").y = -12
  Image("UI/Item/cash.ntp").parent = A0_3414
end
function ItemView.class_get(A0_3418)
  local L1_3419
  L1_3419 = "ItemView"
  return L1_3419
end
function ItemView.id_get(A0_3420)
  return rawget(A0_3420, "id")
end
function ItemView.id_set(A0_3421, A1_3422, A2_3423)
  rawset(A0_3421, "id", A2_3423)
end
function ItemView.amount_set(A0_3424, A1_3425, A2_3426)
  local L3_3427
  L3_3427 = A0_3424.number
  if not L3_3427 then
    return
  end
  if not A2_3426 or A2_3426 < 2 then
    L3_3427.visible = false
    return
  end
  L3_3427.visible = true
  L3_3427.text = tostring(A2_3426)
end
function ItemView.stochastic_set(A0_3428, A1_3429, A2_3430)
  local L3_3431, L4_3432, L5_3433
  if A2_3430 then
    L3_3431 = true
  else
    L3_3431 = L3_3431 or false
  end
  L4_3432 = A0_3428.state
  L4_3432.visible = L3_3431
  if not L3_3431 then
    return
  end
  L4_3432 = 0
  for _FORV_8_, _FORV_9_ in L5_3433(A2_3430) do
    if _FORV_9_ > L4_3432 then
      L4_3432 = _FORV_9_
    end
  end
  L5_3433.visible = L4_3432 > 5
  if L4_3432 < 6 then
    return
  end
  A0_3428.state.texture = string.format("UI/Backpack/%s.ntp", L5_3433)
end
