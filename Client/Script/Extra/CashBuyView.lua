Class.CashBuyView.Component({})
function CashBuyView.Constructor(A0_3360, A1_3361)
  Component.Constructor(A0_3360)
  if not Node() then
    return
  end
  A0_3360.render = Node()
  if not LoadConf(string.format("Item/%d.item", A1_3361)) then
    return
  end
  Image(string.format("Item/%d.icon", A1_3361)).name = "icon"
  Image(string.format("Item/%d.icon", A1_3361)).x = 50
  Image(string.format("Item/%d.icon", A1_3361)).y = 25
  Image(string.format("Item/%d.icon", A1_3361)).parent = A0_3360
  Label(LoadConf(string.format("Item/%d.item", A1_3361)).info.name, "Arial", 12).name = "item_name"
  Label(LoadConf(string.format("Item/%d.item", A1_3361)).info.name, "Arial", 12).x = 75
  Label(LoadConf(string.format("Item/%d.item", A1_3361)).info.name, "Arial", 12).y = 25
  Label(LoadConf(string.format("Item/%d.item", A1_3361)).info.name, "Arial", 12).color = 336860415
  Label(LoadConf(string.format("Item/%d.item", A1_3361)).info.name, "Arial", 12).anchorpoint = {0, 0.5}
  Label(LoadConf(string.format("Item/%d.item", A1_3361)).info.name, "Arial", 12).parent = A0_3360
  Label(string.format("%d", LoadConf(string.format("Item/%d.item", A1_3361)).info.price), "Arial", 12).name = "point"
  Label(string.format("%d", LoadConf(string.format("Item/%d.item", A1_3361)).info.price), "Arial", 12).x = 265
  Label(string.format("%d", LoadConf(string.format("Item/%d.item", A1_3361)).info.price), "Arial", 12).y = 25
  Label(string.format("%d", LoadConf(string.format("Item/%d.item", A1_3361)).info.price), "Arial", 12).color = 336860415
  Label(string.format("%d", LoadConf(string.format("Item/%d.item", A1_3361)).info.price), "Arial", 12).parent = A0_3360
  Label("100%", "Arial", 12).name = "discount"
  Label("100%", "Arial", 12).x = 465
  Label("100%", "Arial", 12).y = 25
  Label("100%", "Arial", 12).color = 336860415
  Label("100%", "Arial", 12).parent = A0_3360
end
function CashBuyView.class_get(A0_3362)
  local L1_3363
  L1_3363 = "CashBuyView"
  return L1_3363
end
