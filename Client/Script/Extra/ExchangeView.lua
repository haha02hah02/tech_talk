Class.ExchangeView.Component({})
function ExchangeView.Constructor(A0_3386, A1_3387)
  Component.Constructor(A0_3386)
  A0_3386.render = Node()
  IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp").name = "item"
  IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp").x = -241
  IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp").y = 0
  IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp").priority = -21
  IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp").parent = A0_3386
  IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp").on = {
    "Down",
    A0_3386,
    ExchangeView.on_show_fire
  }
  IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp").script = "Script/Scenario/ButtonDown.nts"
  Image().name = "icon"
  Image().x = 0
  Image().parent, Image().y = IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp"), 0
  ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).name = "number"
  ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).x = 22
  ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).y = -19
  ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).parent, ILabel("0", "UI/Item/number.ntp", 8, 11, string.byte("0")).anchorpoint = IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp"), {1, 0}
  Image("UI/Backpack/green.ntp").name = "state"
  Image("UI/Backpack/green.ntp").x = -18
  Image("UI/Backpack/green.ntp").y = 18
  Image("UI/Backpack/green.ntp").parent, Image("UI/Backpack/green.ntp").visible = IButton("UI/Backpack/icon.ntp", "UI/Backpack/icon.ntp"), false
  Label("\230\181\139\232\175\149\232\180\166\229\143\183", "\228\187\191\229\174\139", 12).name = "owner"
  Label("\230\181\139\232\175\149\232\180\166\229\143\183", "\228\187\191\229\174\139", 12).x = -130
  Label("\230\181\139\232\175\149\232\180\166\229\143\183", "\228\187\191\229\174\139", 12).y = 0
  Label("\230\181\139\232\175\149\232\180\166\229\143\183", "\228\187\191\229\174\139", 12).color = 336860415
  Label("\230\181\139\232\175\149\232\180\166\229\143\183", "\228\187\191\229\174\139", 12).parent = A0_3386
  Label("23:59:59", "\228\187\191\229\174\139", 12).name = "time"
  Label("23:59:59", "\228\187\191\229\174\139", 12).x = -7
  Label("23:59:59", "\228\187\191\229\174\139", 12).y = 0
  Label("23:59:59", "\228\187\191\229\174\139", 12).color = 336860415
  Label("23:59:59", "\228\187\191\229\174\139", 12).parent = A0_3386
  Label("1,000", "\228\187\191\229\174\139", 12).name = "price"
  Label("1,000", "\228\187\191\229\174\139", 12).x = 135
  Label("1,000", "\228\187\191\229\174\139", 12).y = 0
  Label("1,000", "\228\187\191\229\174\139", 12).color = 336860415
  Label("1,000", "\228\187\191\229\174\139", 12).anchorpoint = {0.5, 0.5}
  Label("1,000", "\228\187\191\229\174\139", 12).parent = A0_3386
  Label("\232\180\166\230\136\183\232\189\172\231\167\187", "\228\187\191\229\174\139", 12).name = "move"
  Label("\232\180\166\230\136\183\232\189\172\231\167\187", "\228\187\191\229\174\139", 12).x = 135
  Label("\232\180\166\230\136\183\232\189\172\231\167\187", "\228\187\191\229\174\139", 12).y = 0
  Label("\232\180\166\230\136\183\232\189\172\231\167\187", "\228\187\191\229\174\139", 12).color = 352261375
  Label("\232\180\166\230\136\183\232\189\172\231\167\187", "\228\187\191\229\174\139", 12).visible = false
  Label("\232\180\166\230\136\183\232\189\172\231\167\187", "\228\187\191\229\174\139", 12).anchorpoint = {0.5, 0.5}
  Label("\232\180\166\230\136\183\232\189\172\231\167\187", "\228\187\191\229\174\139", 12).parent = A0_3386
  Image("UI/Shop/coin.ntp").name = "ptype"
  Image("UI/Shop/coin.ntp").x = 135 - (Label("\232\180\166\230\136\183\232\189\172\231\167\187", "\228\187\191\229\174\139", 12).width + 22) / 2
  Image("UI/Shop/coin.ntp").y = 0
  Image("UI/Shop/coin.ntp").parent = A0_3386
  IButton("UI/Exchange/bt.normal.ntp", "UI/Exchange/bt.pressed.ntp", "UI/Exchange/bt.disabled.ntp").name = "buy"
  IButton("UI/Exchange/bt.normal.ntp", "UI/Exchange/bt.pressed.ntp", "UI/Exchange/bt.disabled.ntp").x = 240
  IButton("UI/Exchange/bt.normal.ntp", "UI/Exchange/bt.pressed.ntp", "UI/Exchange/bt.disabled.ntp").y = 0
  IButton("UI/Exchange/bt.normal.ntp", "UI/Exchange/bt.pressed.ntp", "UI/Exchange/bt.disabled.ntp").priority = -21
  IButton("UI/Exchange/bt.normal.ntp", "UI/Exchange/bt.pressed.ntp", "UI/Exchange/bt.disabled.ntp").parent = A0_3386
  IButton("UI/Exchange/bt.normal.ntp", "UI/Exchange/bt.pressed.ntp", "UI/Exchange/bt.disabled.ntp").on = {
    "Up",
    A0_3386,
    ExchangeView.on_buy_fire
  }
  IButton("UI/Exchange/bt.normal.ntp", "UI/Exchange/bt.pressed.ntp", "UI/Exchange/bt.disabled.ntp").script = "Script/Scenario/ButtonDown.nts"
  if not A1_3387 then
    return
  end
  A0_3386.info = A1_3387
end
function ExchangeView.class_get(A0_3388)
  local L1_3389
  L1_3389 = "ExchangeView"
  return L1_3389
end
function ExchangeView.info_get(A0_3390)
  return rawget(A0_3390, "info")
end
function ExchangeView.info_set(A0_3391, A1_3392, A2_3393)
  if not A2_3393 then
    return
  end
  rawset(A0_3391, "info", A2_3393)
  A0_3391.owner.text = A2_3393.name
  A0_3391.item.icon.texture = string.format("Item/%d.icon", A2_3393.item_id)
  A0_3391.item.number.text = tostring(A2_3393.amount or 1)
  A0_3391.item.number.visible = 1 < (A2_3393.amount or 1)
  A0_3391.move.visible = A2_3393.price == 0
  A0_3391.price.text = PriceFormat(A2_3393.price)
  A0_3391.price.visible = A2_3393.price > 0
  A0_3391.ptype.x = 135 - (A0_3391.price.width + 22) / 2
  A0_3391.ptype.visible = A2_3393.price > 0
  A0_3391.ptype.texture = A2_3393.currency == 1 and "UI/CashShop/coin.ntp" or "UI/Shop/coin.ntp"
  A0_3391.buy.disable = (A2_3393.currency == 0 and Possession or Integral):Sum("quantity", "limit = 0") < A2_3393.price
  A0_3391.stochastic = A2_3393.stochastic
end
function ExchangeView.on_show_fire(A0_3394, A1_3395)
  A0_3394.fire = "Show"
end
function ExchangeView.on_buy_fire(A0_3396, A1_3397)
  A0_3396.fire = "Buy"
end
function ExchangeView.stochastic_set(A0_3398, A1_3399, A2_3400)
  local L3_3401, L4_3402, L5_3403
  if A2_3400 then
    L3_3401 = true
  else
    L3_3401 = L3_3401 or false
  end
  L4_3402 = A0_3398.item
  L4_3402 = L4_3402.state
  L4_3402.visible = L3_3401
  if not L3_3401 then
    return
  end
  L4_3402 = 0
  for _FORV_8_, _FORV_9_ in L5_3403(A2_3400) do
    if _FORV_9_ > L4_3402 then
      L4_3402 = _FORV_9_
    end
  end
  L5_3403.visible = L4_3402 > 5
  if L4_3402 < 6 then
    return
  end
  A0_3398.item.state.texture = string.format("UI/Backpack/%s.ntp", L5_3403)
end
function ExchangeView.time_format_get(A0_3404)
  local L1_3405, L2_3406, L3_3407, L4_3408, L5_3409
  L1_3405 = A0_3404.info
  if not L1_3405 then
    L2_3406 = "\229\183\178\232\191\135\230\156\159\231\154\132"
    return L2_3406
  end
  L2_3406 = L1_3405.expire
  L3_3407 = os
  L3_3407 = L3_3407.time
  L3_3407 = L3_3407()
  L2_3406 = L2_3406 - L3_3407
  if L2_3406 < 0 then
    L3_3407 = "\229\183\178\232\191\135\230\156\159\231\154\132"
    return L3_3407
  end
  L3_3407 = math
  L3_3407 = L3_3407.floor
  L4_3408 = L2_3406 / 3600
  L3_3407 = L3_3407(L4_3408)
  L4_3408 = math
  L4_3408 = L4_3408.floor
  L5_3409 = L2_3406 / 60
  L4_3408 = L4_3408(L5_3409)
  L4_3408 = L4_3408 % 60
  L5_3409 = L2_3406 % 60
  return string.format("%02d:%02d:%02d", L3_3407, L4_3408, L5_3409)
end
function ExchangeView.refresh_set(A0_3410, A1_3411, A2_3412)
  local L3_3413
  L3_3413 = A0_3410.visible
  if not L3_3413 then
    return
  end
  L3_3413 = A0_3410.time
  L3_3413.text = A0_3410.time_format
end
