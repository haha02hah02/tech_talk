Class.ItemHandle.Component({})
function ItemHandle.Constructor(A0_4531)
  Component.Constructor(A0_4531)
  A0_4531.on = {
    "Parent",
    A0_4531,
    ItemHandle.on_parent_fire
  }
end
function ItemHandle.class_get(A0_4532)
  local L1_4533
  L1_4533 = "ItemHandle"
  return L1_4533
end
function ItemHandle.expire_get(A0_4534)
  return rawget(A0_4534, "expire")
end
function ItemHandle.expire_set(A0_4535, A1_4536, A2_4537)
  rawset(A0_4535, "expire", A2_4537)
end
function ItemHandle.on_delte_item(A0_4538)
  local L1_4539, L2_4540
  L1_4539 = A0_4538.parent
  if not L1_4539 then
    return
  end
  L2_4540 = L1_4539.parent
  L2_4540 = L2_4540.parent
  L2_4540.drop_item_remove = L1_4539
  L1_4539.parent = nil
  L1_4539.unactions = true
end
function ItemHandle.on_update_fire(A0_4541, A1_4542)
  local L2_4543, L3_4544, L4_4545
  L2_4543 = os
  L2_4543 = L2_4543.time
  L2_4543 = L2_4543()
  L3_4544 = A0_4541.expire
  if L2_4543 < L3_4544 then
    return
  end
  L3_4544 = A0_4541.parent
  if not L3_4544 then
    return
  end
  L4_4545 = Event
  L4_4545 = L4_4545.Off
  L4_4545(L4_4545, "Update", A0_4541, ItemHandle.on_update_fire)
  L4_4545 = Array
  L4_4545 = L4_4545()
  L4_4545:AddObject(OpacityTo(0.8, 0))
  L4_4545:AddObject(ActionInstant(Functor(A0_4541, ItemHandle.on_delte_item)))
  L3_4544.proxy.action = Sequence(L4_4545)
end
function ItemHandle.on_parent_fire(A0_4546)
  if not A0_4546.parent then
    return
  end
  A0_4546.expire = os.time() + 30
  Event:On("Update", A0_4546, ItemHandle.on_update_fire)
end
