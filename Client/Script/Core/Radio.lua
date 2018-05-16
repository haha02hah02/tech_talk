Class.Radio.Component({})
function Radio.Constructor(A0_2415)
  Component.Constructor(A0_2415)
  if not RadioMenu() then
    return
  end
  RadioMenu():SetTouchPriority(0)
  A0_2415.render = RadioMenu()
  A0_2415.on = {
    "Start",
    A0_2415,
    Radio.on_start_fire
  }
  A0_2415.on = {
    "Stop",
    A0_2415,
    Radio.on_stop_fire
  }
end
function Parallax.class_get(A0_2416, A1_2417)
  local L2_2418
  L2_2418 = "Radio"
  return L2_2418
end
function Radio.select_get(A0_2419, A1_2420)
  local L2_2421
  L2_2421 = A0_2419.render
  if not L2_2421 then
    return
  end
  for _FORV_7_, _FORV_8_ in pairs(A0_2419.child.all) do
    if L2_2421:SelectedItem() == _FORV_8_.render then
      return _FORV_8_.name
    end
  end
end
function Radio.select_set(A0_2422, A1_2423, A2_2424)
  local L3_2425, L4_2426
  L3_2425 = A0_2422.render
  if not L3_2425 then
    return
  end
  L4_2426 = A0_2422.child
  L4_2426 = L4_2426.all
  L4_2426 = L4_2426[A2_2424]
  if not L4_2426 then
    return
  end
  L3_2425:SetSelectedItem(L4_2426.render)
end
function Radio.on_check_get(A0_2427)
  return rawget(A0_2427, "on_check")
end
function Radio.on_check_set(A0_2428, A1_2429, A2_2430)
  rawset(A0_2428, "on_check", A2_2430)
end
function Radio.on_item_check_down_fire(A0_2431, A1_2432)
  local L2_2433, L3_2434
  L2_2433 = A1_2432.Object
  L3_2434 = nil
  for _FORV_7_, _FORV_8_ in pairs(A0_2431.child.all) do
    if _FORV_8_.render == L2_2433 then
      L3_2434 = _FORV_8_
      break
    end
  end
  A0_2431.fire = {
    "Checked",
    L3_2434.name,
    L3_2434
  }
end
function Radio.on_start_fire(A0_2435, A1_2436)
  local L2_2437
  L2_2437 = Functor
  L2_2437 = L2_2437(A0_2435, Radio.on_item_check_down_fire)
  A0_2435.on_check = L2_2437
  for _FORV_6_, _FORV_7_ in pairs(A0_2435.child.all) do
    if _FORV_7_.render then
      _FORV_7_.render:On("Down", L2_2437)
    end
  end
end
function Radio.on_stop_fire(A0_2438, A1_2439)
  local L2_2440
  L2_2440 = A0_2438.on_check
  A0_2438.on_check = nil
  for _FORV_6_, _FORV_7_ in pairs(A0_2438.child.all) do
    if _FORV_7_.render then
      _FORV_7_.render:Off("Down", L2_2440)
    end
  end
end
