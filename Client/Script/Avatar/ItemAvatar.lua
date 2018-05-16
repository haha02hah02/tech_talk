Class.ItemAvatar.Component({})
function ItemAvatar.Constructor(A0_529, A1_530)
  Component.Constructor(A0_529)
  if not Sprite(string.format("Item/%d.icon", A1_530)) then
    return
  end
  A0_529.render = Sprite(string.format("Item/%d.icon", A1_530))
  A0_529.on = {
    "Start",
    A0_529,
    ItemAvatar.on_start_fire
  }
  A0_529.on = {
    "Stop",
    A0_529,
    ItemAvatar.on_stop_fire
  }
  A0_529.on = {
    "Parent",
    A0_529,
    ItemAvatar.on_parent_fire
  }
end
function ItemAvatar.class_get(A0_531, A1_532)
  local L2_533
  L2_533 = "ItemAvatar"
  return L2_533
end
function ItemAvatar.crender_get(A0_534)
  local L1_535
end
function ItemAvatar.layer_get(A0_536, A1_537)
  return rawget(A0_536, "layer")
end
function ItemAvatar.layer_set(A0_538, A1_539, A2_540)
  if not A2_540 then
    return
  end
  if A0_538.layer == A2_540 then
    return
  end
  rawset(A0_538, "layer", A2_540)
  if not A0_538.parent then
    return
  end
  if not A0_538.parent[tostring(A2_540)] then
    return
  end
  A0_538.render:RemoveFromParentAndCleanup(false)
  A0_538.parent[tostring(A2_540)].render:AddChild(A0_538.render)
end
function ItemAvatar.status_set(A0_541, A1_542, A2_543, A3_544)
  local L4_545
  if not A2_543 then
    return
  end
  L4_545 = STATUS_STAND
  if A2_543 ~= L4_545 then
    A0_541.unactions = true
    L4_545 = RepeatForever
    L4_545 = L4_545(RotateBy(0.1, 80))
    A0_541.action = L4_545
    return
  end
  A0_541.rotation_x = 0
  A0_541.rotation_y = 0
  A0_541.unactions = true
end
function ItemAvatar.on_start_fire(A0_546)
  local L1_547
  L1_547 = A0_546.parent
  if not L1_547 then
    return
  end
  if A0_546.render:Parent() then
    return
  end
  if L1_547.class == "Map" then
  else
  end
  if not (L1_547[tostring(A0_546.layer or 8)] or L1_547) then
    return
  end
  ;(L1_547[tostring(A0_546.layer or 8)] or L1_547).render:AddChild(A0_546.render, 1000000000)
end
function ItemAvatar.on_stop_fire(A0_548)
  if not A0_548.parent then
    return
  end
  A0_548.render:RemoveFromParentAndCleanup(false)
end
function ItemAvatar.on_parent_fire(A0_549)
  local L1_550
  L1_550 = A0_549.parent
  if not L1_550 then
    A0_549.render:RemoveFromParent()
    return
  end
  if L1_550.class == "Map" then
  else
  end
  if not (L1_550[tostring(A0_549.layer or 8)] or L1_550) then
    return
  end
  A0_549.render:RemoveFromParentAndCleanup(false)
  ;(L1_550[tostring(A0_549.layer or 8)] or L1_550).render:AddChild(A0_549.render, 1000000000)
end
