Class.Shop.Script({})
function Shop.Constructor(A0_6887, A1_6888)
  Script.Constructor(A0_6887, A1_6888)
  if not A1_6888 then
    return
  end
  A1_6888.on = {
    "Visible",
    A0_6887,
    Shop.OnVisible
  }
  A1_6888.item.on = {
    "SelectDown",
    A0_6887,
    A0_6887.OnItemSelectDown
  }
  A1_6888.item.on = {
    "SelectUp",
    A0_6887,
    A0_6887.OnItemSelectUp
  }
  A1_6888.item.on = {
    "LongPress",
    A0_6887,
    A0_6887.OnItemLongPress
  }
  A1_6888.backpack.on = {
    "SelectDown",
    A0_6887,
    A0_6887.OnBackpackSelectDown
  }
  A1_6888.backpack.on = {
    "SelectUp",
    A0_6887,
    A0_6887.OnBackpackSelectUp
  }
  A1_6888.backpack.on = {
    "LongPress",
    A0_6887,
    A0_6887.OnBackpackLongPress
  }
end
function Shop.SetNpc(A0_6889, A1_6890)
  local L2_6891, L3_6892
  L3_6892 = A0_6889
  L2_6891 = A0_6889.Parent
  L2_6891 = L2_6891(L3_6892)
  L3_6892 = L2_6891.npc
  if L3_6892 and L3_6892.id == A1_6890 then
    return
  end
  if L3_6892 then
    L3_6892.parent = nil
    L3_6892.render:RemoveFromParent()
  end
  L3_6892 = NpcAvatar(A1_6890)
  L3_6892.name = "npc"
  L3_6892.x = -170
  L3_6892.y = 90 + L3_6892.info.height / 2
  L3_6892.direction = "right"
  L3_6892.status = STATUS_STAND
  L3_6892.name_tag.visible = false
  L3_6892.parent = L2_6891
end
function Shop.SetShop(A0_6893, A1_6894, A2_6895)
  local L3_6896, L4_6897, L5_6898, L6_6899, L7_6900
  if A1_6894 == "consume" then
    L3_6896 = "Consume"
  elseif not L3_6896 then
    if A1_6894 == "weapon" then
      L3_6896 = "Weapon"
    else
      L3_6896 = L3_6896 or "Armor"
    end
  end
  L4_6897 = LoadConf
  L5_6898 = string
  L5_6898 = L5_6898.format
  L6_6899 = "Config/%s.conf"
  L6_6899 = L5_6898(L6_6899, L7_6900)
  L4_6897 = L4_6897(L5_6898, L6_6899, L7_6900, L5_6898(L6_6899, L7_6900))
  L6_6899 = A0_6893
  L5_6898 = A0_6893.Parent
  L5_6898 = L5_6898(L6_6899)
  L6_6899 = L5_6898.item
  for _FORV_10_, _FORV_11_ in L7_6900(L6_6899.child.all) do
    _FORV_11_.parent = nil
  end
  A0_6893.tshopitems = L7_6900
  if not L7_6900 then
    return
  end
  for _FORV_11_, _FORV_12_ in ipairs(L7_6900) do
    ShopItemView(_FORV_12_.item_id, _FORV_12_.amount, 1).name = _FORV_11_
    ShopItemView(_FORV_12_.item_id, _FORV_12_.amount, 1).parent = L6_6899
    ShopItemView(_FORV_12_.item_id, _FORV_12_.amount, 1).order = _FORV_11_
  end
  L6_6899.refresh = true
end
function Shop.RefreshBackpackView(A0_6901)
  local L1_6902, L2_6903, L3_6904, L4_6905, L5_6906, L6_6907, L7_6908, L8_6909
  L1_6902 = UniqueComponent
  L2_6903 = "Model/interface.model"
  L1_6902 = L1_6902(L2_6903)
  L3_6904 = A0_6901
  L2_6903 = A0_6901.Parent
  L2_6903 = L2_6903(L3_6904)
  L3_6904 = L2_6903.backpack
  L4_6905 = L3_6904.child
  L4_6905 = L4_6905.size
  L5_6906 = L1_6902.ui
  L5_6906 = L5_6906.ibackpack
  for _FORV_9_, _FORV_10_ in L6_6907(L7_6908) do
    _FORV_10_.parent = nil
  end
  for _FORV_10_, _FORV_11_ in L7_6908(L8_6909) do
    ShopItemView(_FORV_11_.id, _FORV_11_.amount, 1, _FORV_11_.stochastic).name = _FORV_10_
    ShopItemView(_FORV_11_.id, _FORV_11_.amount, 1, _FORV_11_.stochastic).parent = L3_6904
    ShopItemView(_FORV_11_.id, _FORV_11_.amount, 1, _FORV_11_.stochastic).order = _FORV_11_.slot
    ShopItemView(_FORV_11_.id, _FORV_11_.amount, 1, _FORV_11_.stochastic).tag = _FORV_11_.slot
  end
  if L8_6909 ~= 228 and L4_6905 < L7_6908 then
  end
  L3_6904.refresh = true
  L3_6904.offset_y = L8_6909
end
function Shop.RefreshGoldView(A0_6910)
  local L1_6911, L2_6912, L3_6913, L4_6914, L5_6915, L6_6916
  L1_6911 = UniqueComponent
  L2_6912 = "Model/interface.model"
  L1_6911 = L1_6911(L2_6912)
  L2_6912 = L1_6911.parent
  if not L2_6912 then
    return
  end
  L4_6914 = A0_6910
  L3_6913 = A0_6910.Parent
  L3_6913 = L3_6913(L4_6914)
  L4_6914 = L2_6912.physical
  L5_6915 = L2_6912.focus_object
  L4_6914 = L4_6914[L5_6915]
  L5_6915 = Possession
  L6_6916 = L5_6915
  L5_6915 = L5_6915.Sum
  L5_6915 = L5_6915(L6_6916, "quantity", string.format("belong = %d and limit = 0", L4_6914.name))
  L6_6916 = Possession
  L6_6916 = L6_6916.Sum
  L6_6916 = L6_6916(L6_6916, "quantity", string.format("belong = %d and limit = 1", L4_6914.name))
  L3_6913.point.text = PriceFormat(L5_6915)
  L3_6913.lpoint.text = PriceFormat(L6_6916)
end
function Shop.CreateSQLObject(A0_6917, A1_6918, A2_6919, A3_6920)
  Items().belong = A0_6917
  Items().item_id = A1_6918
  Items().level = 0
  Items().slevel = 0
  Items().amount = A2_6919
  Items().provenance = "bought"
  Items().tradable = A3_6920
  return (Items())
end
function Shop.OnItemSelectDown(A0_6921, A1_6922, A2_6923, A3_6924)
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
end
function Shop.OnItemSelectUp(A0_6925, A1_6926, A2_6927, A3_6928)
  local L4_6929, L5_6930, L6_6931, L7_6932, L8_6933, L9_6934, L10_6935, L11_6936, L12_6937, L13_6938, L14_6939, L15_6940, L16_6941
  L4_6929 = A0_6925.item_select
  A0_6925.last_item_select = L4_6929
  A0_6925.item_select = A3_6928
  L4_6929 = A0_6925.last_item_select
  L5_6930 = A0_6925.item_select
  if L4_6929 ~= L5_6930 then
    return
  end
  L4_6929 = UniqueComponent
  L5_6930 = "Model/interface.model"
  L4_6929 = L4_6929(L5_6930)
  L5_6930 = L4_6929.node
  L5_6930 = L5_6930.Interface
  L6_6931 = L4_6929.parent
  if not L6_6931 then
    return
  end
  L7_6932 = L6_6931.physical
  L8_6933 = L6_6931.focus_object
  L7_6932 = L7_6932[L8_6933]
  L8_6933 = L4_6929.ui
  L8_6933 = L8_6933.ibackpack
  L9_6934 = A0_6925.tshopitems
  L10_6935 = Config
  L10_6935 = L10_6935.OneNumber
  L10_6935 = A3_6928 + L10_6935
  L10_6935 = L9_6934[L10_6935]
  L12_6937 = A0_6925
  L11_6936 = A0_6925.Parent
  L11_6936 = L11_6936(L12_6937)
  L12_6937 = LoadConf
  L13_6938 = string
  L13_6938 = L13_6938.format
  L14_6939 = "Item/%d.item"
  L15_6940 = L10_6935.item_id
  L16_6941 = L13_6938(L14_6939, L15_6940)
  L12_6937 = L12_6937(L13_6938, L14_6939, L15_6940, L16_6941, L13_6938(L14_6939, L15_6940))
  L12_6937 = L12_6937.info
  L13_6938 = L12_6937.price
  L14_6939 = L10_6935.amount
  if not L14_6939 then
    L14_6939 = Config
    L14_6939 = L14_6939.OneNumber
  end
  L13_6938 = L13_6938 * L14_6939
  L14_6939 = Possession
  L15_6940 = L14_6939
  L14_6939 = L14_6939.Sum
  L16_6941 = "quantity"
  L14_6939 = L14_6939(L15_6940, L16_6941, string.format("belong = %d and limit = 0", L7_6932.name))
  L15_6940 = Possession
  L16_6941 = L15_6940
  L15_6940 = L15_6940.Sum
  L15_6940 = L15_6940(L16_6941, "quantity", string.format("belong = %d and limit = 1", L7_6932.name))
  if L13_6938 > L15_6940 then
    L16_6941 = true
  else
    L16_6941 = L16_6941 or false
  end
  if L13_6938 > L14_6939 and L13_6938 > L15_6940 then
    L5_6930:SetNotice(25)
    return
  end
  if not L8_6933.Backpack:CheckIncItemByID(L10_6935.item_id, L10_6935.amount or Config.OneNumber, L16_6941) then
    L5_6930:SetNotice(26)
    return
  end
  A0_6925.item_select = nil
  Possession().belong = L7_6932.name
  Possession().provenance = "bought"
  Possession().quantity = -L13_6938
  Possession().limit = L16_6941 and Config.ZeroNumber or Config.OneNumber
  Possession().comment = tostring(L10_6935.item_id) .. "," .. tostring(L10_6935.amount or Config.OneNumber)
  L8_6933.Backpack:IncItemByID(L10_6935.item_id, L10_6935.amount or Config.OneNumber, L16_6941, Shop.CreateSQLObject)
  Sound:PlayEffect("Music/UI/BuyShopItem.mp3")
  A0_6925:RefreshGoldView()
  A0_6925:RefreshBackpackView()
end
function Shop.OnItemLongPress(A0_6942, A1_6943, A2_6944, A3_6945)
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(A0_6942.tshopitems[A3_6945 + 1].item_id)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
  A0_6942.item_select = nil
end
function Shop.OnBackpackSelectDown(A0_6946, A1_6947, A2_6948, A3_6949)
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
end
function Shop.OnBackpackSelectUp(A0_6950, A1_6951, A2_6952, A3_6953)
  A0_6950.last_backpack_select = A0_6950.backpack_select
  A0_6950.backpack_select = A3_6953
  if A0_6950.last_backpack_select ~= A0_6950.backpack_select then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6953 + 1] then
    return
  end
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6953 + 1].parent = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6953 + 1].view.parent = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6953 + 1].sell = true
  UniqueComponent("Model/interface.model").ui.ibackpack.fire = "Changed"
  A0_6950.backpack_select = nil
  Possession().belong = UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name
  Possession().provenance = "sell"
  Possession().quantity = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6953 + 1].price * (UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6953 + 1].amount or 1)
  Possession().limit = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6953 + 1].tradable and 0 or 1
  Possession().comment = tostring(UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6953 + 1].id) .. "," .. tostring(UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6953 + 1].amount or 1)
  Sound:PlayEffect("Music/UI/DragEnd.mp3")
  A0_6950:RefreshGoldView()
  A0_6950:RefreshBackpackView()
end
function Shop.OnBackpackLongPress(A0_6954, A1_6955, A2_6956, A3_6957)
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6957 + 1].id, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6957 + 1].level, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6957 + 1].slevel, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6957 + 1].enchant, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ShopItems()[A3_6957 + 1].stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
  A0_6954.backpack_select = nil
end
function Shop.OnVisible(A0_6958, A1_6959)
  local L2_6960, L3_6961, L4_6962, L5_6963, L6_6964, L7_6965
  L2_6960 = A1_6959.visible
  if not L2_6960 then
    return
  end
  A0_6958.item_select = nil
  A0_6958.backpack_select = nil
  L2_6960 = UniqueComponent
  L3_6961 = "Model/interface.model"
  L2_6960 = L2_6960(L3_6961)
  L3_6961 = L2_6960.parent
  if not L3_6961 then
    return
  end
  L4_6962 = L3_6961.physical
  L5_6963 = L3_6961.focus_object
  L4_6962 = L4_6962[L5_6963]
  L6_6964 = A0_6958
  L5_6963 = A0_6958.Parent
  L5_6963 = L5_6963(L6_6964)
  L6_6964 = L5_6963.avatar
  L7_6965 = L4_6962.proxy
  L6_6964.copy = L7_6965
  L6_6964 = Possession
  L7_6965 = L6_6964
  L6_6964 = L6_6964.Sum
  L6_6964 = L6_6964(L7_6965, "quantity", string.format("belong = %d and limit = 0", L4_6962.name))
  L7_6965 = Possession
  L7_6965 = L7_6965.Sum
  L7_6965 = L7_6965(L7_6965, "quantity", string.format("belong = %d and limit = 1", L4_6962.name))
  A1_6959.point.text = PriceFormat(L6_6964)
  A1_6959.lpoint.text = PriceFormat(L7_6965)
  A0_6958:RefreshBackpackView()
end
