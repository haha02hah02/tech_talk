Class.StorageItemView.Component({})
function StorageItemView.Constructor(A0_3488, A1_3489, A2_3490, A3_3491)
  Component.Constructor(A0_3488)
  if not Node() then
    return
  end
  A0_3488.render = Node()
  A0_3488.order = 100
  if not LoadConf(string.format("Item/%d.item", A1_3489)) then
    return
  end
  A0_3488.info = LoadConf(string.format("Item/%d.item", A1_3489)).info
  A0_3488.id = A1_3489
  Image(string.format("Item/%d.icon", A1_3489)).name = "icon"
  Image(string.format("Item/%d.icon", A1_3489)).x = 18
  Image(string.format("Item/%d.icon", A1_3489)).y = 21
  Image(string.format("Item/%d.icon", A1_3489)).parent = A0_3488
  Image("UI/Backpack/green.ntp").name = "state"
  Image("UI/Backpack/green.ntp").x = 2
  Image("UI/Backpack/green.ntp").y = 34
  Image("UI/Backpack/green.ntp").visible = false
  Image("UI/Backpack/green.ntp").parent = A0_3488
  A0_3488.stochastic = A3_3491
  ILabel(tostring(A2_3490 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).name = "number"
  ILabel(tostring(A2_3490 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).x = 35
  ILabel(tostring(A2_3490 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).y = 4
  ILabel(tostring(A2_3490 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).anchorpoint = {1, 0}
  ILabel(tostring(A2_3490 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).visible = 1 < (A2_3490 or 1) and true or false
  ILabel(tostring(A2_3490 or 1), "UI/Item/number.ntp", 8, 11, string.byte("0")).parent = A0_3488
  Label(LoadConf(string.format("Item/%d.item", A1_3489)).info.name, "Arial", 11).name = "item_name"
  Label(LoadConf(string.format("Item/%d.item", A1_3489)).info.name, "Arial", 11).x = 40
  Label(LoadConf(string.format("Item/%d.item", A1_3489)).info.name, "Arial", 11).y = 28
  Label(LoadConf(string.format("Item/%d.item", A1_3489)).info.name, "Arial", 11).color = 252645375
  Label(LoadConf(string.format("Item/%d.item", A1_3489)).info.name, "Arial", 11).anchorpoint = {0, 0.5}
  Label(LoadConf(string.format("Item/%d.item", A1_3489)).info.name, "Arial", 11).parent = A0_3488
end
function StorageItemView.serial_get(A0_3492, A1_3493, A2_3494)
  return rawget(A0_3492, "serial")
end
function StorageItemView.serial_set(A0_3495, A1_3496, A2_3497)
  rawset(A0_3495, "serial", A2_3497)
end
function StorageItemView.stochastic_set(A0_3498, A1_3499, A2_3500)
  local L3_3501, L4_3502, L5_3503
  if A2_3500 then
    L3_3501 = true
  else
    L3_3501 = L3_3501 or false
  end
  L4_3502 = A0_3498.state
  L4_3502.visible = L3_3501
  if not L3_3501 then
    return
  end
  L4_3502 = 0
  for _FORV_8_, _FORV_9_ in L5_3503(A2_3500) do
    if _FORV_9_ > L4_3502 then
      L4_3502 = _FORV_9_
    end
  end
  L5_3503.visible = L4_3502 > 5
  if L4_3502 < 6 then
    return
  end
  A0_3498.state.texture = string.format("UI/Backpack/%s.ntp", L5_3503)
end
