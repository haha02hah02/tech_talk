Class.Storage.Script({})
function Storage.Constructor(A0_7002, A1_7003)
  Script.Constructor(A0_7002, A1_7003)
  if not A1_7003 then
    return
  end
  A1_7003.on = {
    "Visible",
    A0_7002,
    A0_7002.OnVisible
  }
  A1_7003.item.on = {
    "SelectDown",
    A0_7002,
    A0_7002.OnItemSelectDown
  }
  A1_7003.item.on = {
    "SelectUp",
    A0_7002,
    A0_7002.OnItemSelectUp
  }
  A1_7003.item.on = {
    "LongPress",
    A0_7002,
    A0_7002.OnItemLongPress
  }
  A1_7003.backpack.on = {
    "SelectDown",
    A0_7002,
    A0_7002.OnBackpackSelectDown
  }
  A1_7003.backpack.on = {
    "SelectUp",
    A0_7002,
    A0_7002.OnBackpackSelectUp
  }
  A1_7003.backpack.on = {
    "LongPress",
    A0_7002,
    A0_7002.OnBackpackLongPress
  }
end
function Storage.SetNpc(A0_7004, A1_7005)
  local L2_7006, L3_7007
  L3_7007 = A0_7004
  L2_7006 = A0_7004.Parent
  L2_7006 = L2_7006(L3_7007)
  L3_7007 = L2_7006.npc
  if L3_7007 and L3_7007.id == A1_7005 then
    return
  end
  if L3_7007 then
    L3_7007.parent = nil
    L3_7007.render:RemoveFromParent()
  end
  L3_7007 = NpcAvatar(A1_7005)
  L3_7007.name = "npc"
  L3_7007.x = -170
  L3_7007.y = 90 + L3_7007.info.height / 2
  L3_7007.direction = "right"
  L3_7007.status = STATUS_STAND
  L3_7007.name_tag.visible = false
  L3_7007.parent = L2_7006
end
function Storage.RefreshGoldView(A0_7008)
  local L1_7009, L2_7010, L3_7011, L4_7012, L5_7013, L6_7014
  L1_7009 = UniqueComponent
  L2_7010 = "Model/interface.model"
  L1_7009 = L1_7009(L2_7010)
  L2_7010 = L1_7009.parent
  if not L2_7010 then
    return
  end
  L4_7012 = A0_7008
  L3_7011 = A0_7008.Parent
  L3_7011 = L3_7011(L4_7012)
  L4_7012 = L2_7010.physical
  L5_7013 = L2_7010.focus_object
  L4_7012 = L4_7012[L5_7013]
  L5_7013 = Possession
  L6_7014 = L5_7013
  L5_7013 = L5_7013.Sum
  L5_7013 = L5_7013(L6_7014, "quantity", string.format("belong = %d and limit = 0", L4_7012.name))
  L6_7014 = Possession
  L6_7014 = L6_7014.Sum
  L6_7014 = L6_7014(L6_7014, "quantity", string.format("belong = %d and limit = 1", L4_7012.name))
  L3_7011.point.text = PriceFormat(L5_7013)
  L3_7011.lpoint.text = PriceFormat(L6_7014)
end
function Storage.RefreshStorageView(A0_7015)
  local L1_7016, L2_7017, L3_7018, L4_7019, L5_7020, L6_7021, L7_7022, L8_7023, L9_7024, L10_7025
  L1_7016 = UniqueComponent
  L2_7017 = "Model/interface.model"
  L1_7016 = L1_7016(L2_7017)
  L2_7017 = L1_7016.parent
  L3_7018 = L2_7017.physical
  L4_7019 = L2_7017.focus_object
  L3_7018 = L3_7018[L4_7019]
  if not L3_7018 then
    return
  end
  L5_7020 = A0_7015
  L4_7019 = A0_7015.Parent
  L4_7019 = L4_7019(L5_7020)
  L5_7020 = L4_7019.item
  L6_7021 = L5_7020.child
  L6_7021 = L6_7021.size
  L7_7022 = L1_7016.ui
  L7_7022 = L7_7022.ibackpack
  for _FORV_11_, _FORV_12_ in L8_7023(L9_7024) do
    _FORV_12_.parent = nil
  end
  for _FORV_12_, _FORV_13_ in L9_7024(L10_7025) do
    StorageItemView(_FORV_13_.item_id, _FORV_13_.amount, _FORV_13_.stochastic).name = _FORV_12_
    StorageItemView(_FORV_13_.item_id, _FORV_13_.amount, _FORV_13_.stochastic).parent = L5_7020
    StorageItemView(_FORV_13_.item_id, _FORV_13_.amount, _FORV_13_.stochastic).serial = _FORV_13_.serial
    StorageItemView(_FORV_13_.item_id, _FORV_13_.amount, _FORV_13_.stochastic).order = _FORV_13_.item_id
  end
  if L10_7025 ~= 228 and L6_7021 < L9_7024 then
  end
  L5_7020.refresh = true
  L5_7020.offset_y = L10_7025
end
function Storage.RefreshBackpackView(A0_7026)
  local L1_7027, L2_7028, L3_7029, L4_7030, L5_7031, L6_7032, L7_7033, L8_7034
  L1_7027 = UniqueComponent
  L2_7028 = "Model/interface.model"
  L1_7027 = L1_7027(L2_7028)
  L3_7029 = A0_7026
  L2_7028 = A0_7026.Parent
  L2_7028 = L2_7028(L3_7029)
  L3_7029 = L2_7028.backpack
  L4_7030 = L3_7029.child
  L4_7030 = L4_7030.size
  L5_7031 = L1_7027.ui
  L5_7031 = L5_7031.ibackpack
  for _FORV_9_, _FORV_10_ in L6_7032(L7_7033) do
    _FORV_10_.parent = nil
  end
  for _FORV_10_, _FORV_11_ in L7_7033(L8_7034) do
    StorageItemView(_FORV_11_.id, _FORV_11_.amount, _FORV_11_.stochastic).name = _FORV_10_
    StorageItemView(_FORV_11_.id, _FORV_11_.amount, _FORV_11_.stochastic).parent = L3_7029
    StorageItemView(_FORV_11_.id, _FORV_11_.amount, _FORV_11_.stochastic).order = _FORV_11_.slot
    StorageItemView(_FORV_11_.id, _FORV_11_.amount, _FORV_11_.stochastic).tag = _FORV_11_.slot
  end
  if L8_7034 ~= 228 and L4_7030 < L7_7033 then
  end
  L3_7029.refresh = true
  L3_7029.offset_y = L8_7034
end
function Storage.OnItemSelectDown(A0_7035, A1_7036, A2_7037, A3_7038)
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
end
function Storage.OnItemSelectUp(A0_7039, A1_7040, A2_7041, A3_7042)
  local L4_7043, L5_7044, L6_7045, L7_7046, L8_7047, L9_7048, L10_7049, L11_7050, L12_7051
  L4_7043 = A0_7039.item_select
  A0_7039.last_item_select = L4_7043
  A0_7039.item_select = A3_7042
  L4_7043 = A0_7039.last_item_select
  L5_7044 = A0_7039.item_select
  if L4_7043 ~= L5_7044 then
    return
  end
  L4_7043 = UniqueComponent
  L5_7044 = "Model/interface.model"
  L4_7043 = L4_7043(L5_7044)
  L5_7044 = L4_7043.node
  L5_7044 = L5_7044.Interface
  L6_7045 = L4_7043.parent
  if not L6_7045 then
    return
  end
  L7_7046 = L6_7045.physical
  L8_7047 = L6_7045.focus_object
  L7_7046 = L7_7046[L8_7047]
  if not L7_7046 then
    return
  end
  L9_7048 = A0_7039
  L8_7047 = A0_7039.Parent
  L8_7047 = L8_7047(L9_7048)
  L9_7048 = L8_7047.item
  L10_7049 = L4_7043.ui
  L10_7049 = L10_7049.ibackpack
  L11_7050 = L9_7048.child
  L11_7050 = L11_7050.sort
  L12_7051 = Items
  L12_7051 = L12_7051.One
  L12_7051 = L12_7051(L12_7051, string.format("belong = %d and serial = %d", L7_7046.name, L11_7050[A3_7042 + 1].serial))
  if not L12_7051 then
    return
  end
  A0_7039.item_select = nil
  if not L10_7049.Backpack:Insert(MakeItem(L12_7051)) then
    L5_7044:SetNotice(41)
    return
  end
  A0_7039:RefreshStorageView()
  A0_7039:RefreshBackpackView()
end
function Storage.OnItemLongPress(A0_7052, A1_7053, A2_7054, A3_7055)
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  if not Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_7052:Parent().item.child.sort[A3_7055 + 1].order)) then
    return
  end
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_7052:Parent().item.child.sort[A3_7055 + 1].order)).item_id, Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_7052:Parent().item.child.sort[A3_7055 + 1].order)).level, Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_7052:Parent().item.child.sort[A3_7055 + 1].order)).slevel, Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_7052:Parent().item.child.sort[A3_7055 + 1].order)).enchant, Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_7052:Parent().item.child.sort[A3_7055 + 1].order)).stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
  A0_7052.item_select = nil
end
function Storage.OnBackpackSelectDown(A0_7056, A1_7057, A2_7058, A3_7059)
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
end
function Storage.OnBackpackSelectUp(A0_7060, A1_7061, A2_7062, A3_7063)
  A0_7060.last_backpack_select = A0_7060.backpack_select
  A0_7060.backpack_select = A3_7063
  if A0_7060.last_backpack_select ~= A0_7060.backpack_select then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  if not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7063 + 1] then
    return
  end
  if #Items:Find(string.format("belong = %d and site = 'storage'", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) >= Config.MaxStorageGrid + (Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).storage or 0) then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(36)
    return
  end
  A0_7060.backpack_select = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7063 + 1].parent = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7063 + 1].view.parent = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7063 + 1].site = "storage"
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7063 + 1].slot = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.fire = "Changed"
  A0_7060:RefreshStorageView()
  A0_7060:RefreshBackpackView()
end
function Storage.OnBackpackLongPress(A0_7064, A1_7065, A2_7066, A3_7067)
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7067 + 1].id, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7067 + 1].level, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7067 + 1].slevel, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7067 + 1].enchant, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_7067 + 1].stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
  A0_7064.backpack_select = nil
end
function Storage.OnVisible(A0_7068, A1_7069)
  if not A1_7069.visible then
    return
  end
  A0_7068.item_select = nil
  A0_7068.backpack_select = nil
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  A0_7068:Parent().avatar.copy = UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].proxy
  A0_7068:RefreshGoldView()
  A0_7068:RefreshStorageView()
  A0_7068:RefreshBackpackView()
end
