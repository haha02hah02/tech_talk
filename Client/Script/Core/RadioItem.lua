Class.RadioItem.Component({})
function RadioItem.Constructor(A0_2441, ...)
  Component.Constructor(A0_2441)
  if not MenuItemImage(...) then
    return
  end
  A0_2441.render = MenuItemImage(...)
end
function RadioItem.class_get(A0_2442, A1_2443)
  local L2_2444
  L2_2444 = "RadioItem"
  return L2_2444
end
