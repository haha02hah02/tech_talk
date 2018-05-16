L0_5995 = Class
L0_5995 = L0_5995.CashShop
L0_5995 = L0_5995.Script
L0_5995({})
L0_5995 = LoadConf
L0_5995 = L0_5995("Config/CashShop.conf")
function CashShop.Constructor(A0_5996, A1_5997)
  Script.Constructor(A0_5996, A1_5997)
  if not A1_5997 then
    return
  end
  ;({}).cap = {}
  ;({}).coat = {}
  ;({}).longcoat = {}
  ;({}).pants = {}
  ;({}).shoes = {}
  ;({}).glove = {}
  ;({}).cape = {}
  ;({}).weapon = {}
  ;({}).shield = ({}).weapon
  A0_5996.type_items, ({}).other = {}, {}
  for _FORV_6_, _FORV_7_ in ipairs(L0_5995) do
    A0_5996:InsertShopItem(_FORV_7_.item_id)
  end
  A0_5996.focus = Image()
  A0_5996.focus.name = "focus"
  A0_5996.focus.x = 22
  A0_5996.focus.y = 22
  A0_5996.focus.order = 100
  A1_5997.buy.disable = true
  A1_5997.clean.on = {
    "Down",
    A0_5996,
    A0_5996.OnCleanDown
  }
  A1_5997.origin.on = {
    "Down",
    A0_5996,
    A0_5996.OnOriginDown
  }
  A1_5997.buy.on = {
    "Down",
    A0_5996,
    A0_5996.OnBuyDown
  }
  A1_5997.exit.on = {
    "Down",
    A0_5996,
    A0_5996.OnExitDown
  }
  A1_5997.item_radio.on = {
    "Checked",
    A0_5996,
    A0_5996.OnTypeItemDown
  }
  A1_5997.item_radio.select = "cap"
  A1_5997.state_radio.on = {
    "Checked",
    A0_5996,
    A0_5996.OnStateDown
  }
  A1_5997.state_radio.select = "stand"
  A1_5997.cash_item.on = {
    "ItemUp",
    A0_5996,
    A0_5996.OnCashItemDown
  }
  A1_5997.backpack.on = {
    "ItemUp",
    A0_5996,
    A0_5996.OnBackpackDown
  }
  A1_5997.cbackpack.on = {
    "ItemUp",
    A0_5996,
    A0_5996.OnCashBackpackDown
  }
  A0_5996:OnStateDown(A1_5997.state_radio, "stand", A1_5997.state_radio.stand)
  A0_5996:OnTypeItemDown(A1_5997.item_radio, "cap", A1_5997.item_radio.cap)
  A1_5997.on = {
    "Enter",
    A0_5996,
    A0_5996.OnEnter
  }
end
function CashShop.InsertShopItem(A0_5998, A1_5999)
  local L2_6000, L3_6001, L4_6002
  L2_6000 = CashItemView
  L3_6001 = A1_5999
  L2_6000 = L2_6000(L3_6001)
  L3_6001 = L2_6000.type
  if not L3_6001 then
    return
  end
  L3_6001 = A0_5998.type_items
  L4_6002 = L2_6000.stype
  L4_6002 = L3_6001[L4_6002]
  if not L4_6002 then
    L4_6002 = L2_6000.type
    L4_6002 = L3_6001[L4_6002]
    L4_6002 = L4_6002 or L3_6001.other
  end
  if not L4_6002 then
    return
  end
  L2_6000.name = "item"
  table.insert(L4_6002, L2_6000)
end
function CashShop.ItemTypeToAvatar(A0_6003, A1_6004, A2_6005)
  local L3_6006
  if A1_6004 == "cap" then
    L3_6006 = "cap"
    return L3_6006
  end
  if A1_6004 == "coat" and A2_6005 == "longcoat" then
    L3_6006 = "longcoat"
    return L3_6006
  end
  if A1_6004 == "coat" then
    L3_6006 = "coat"
    return L3_6006
  end
  if A1_6004 == "pants" then
    L3_6006 = "pants"
    return L3_6006
  end
  if A1_6004 == "shoes" then
    L3_6006 = "shoes"
    return L3_6006
  end
  if A1_6004 == "glove" then
    L3_6006 = "glove"
    return L3_6006
  end
  if A1_6004 == "cape" then
    L3_6006 = "cape"
    return L3_6006
  end
  if A1_6004 == "weapon" then
    L3_6006 = "weapon"
    return L3_6006
  end
  if A2_6005 == "shield" then
    L3_6006 = "shield"
    return L3_6006
  end
end
function CashShop.CalcModifyItemList(A0_6007)
  local L1_6008
  L1_6008 = {}
  if not UniqueComponent("Model/interface.model").parent then
    return L1_6008
  end
  if not UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object] then
    return L1_6008
  end
  if A0_6007:Parent().avatar.cap and A0_6007:Parent().avatar.cap ~= UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object].cap then
    table.insert(L1_6008, A0_6007:Parent().avatar.cap)
  end
  if A0_6007:Parent().avatar.coat and A0_6007:Parent().avatar.coat ~= 1040036 and A0_6007:Parent().avatar.coat ~= UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object].coat then
    table.insert(L1_6008, A0_6007:Parent().avatar.coat)
  end
  if A0_6007:Parent().avatar.pants and A0_6007:Parent().avatar.pants ~= 1060026 and A0_6007:Parent().avatar.pants ~= UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object].pants then
    table.insert(L1_6008, A0_6007:Parent().avatar.pants)
  end
  if A0_6007:Parent().avatar.longcoat and A0_6007:Parent().avatar.longcoat ~= UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object].longcoat then
    table.insert(L1_6008, A0_6007:Parent().avatar.longcoat)
  end
  if A0_6007:Parent().avatar.shoes and A0_6007:Parent().avatar.shoes ~= UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object].shoes then
    table.insert(L1_6008, A0_6007:Parent().avatar.shoes)
  end
  if A0_6007:Parent().avatar.glove and A0_6007:Parent().avatar.glove ~= UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object].glove then
    table.insert(L1_6008, A0_6007:Parent().avatar.glove)
  end
  if A0_6007:Parent().avatar.cape and A0_6007:Parent().avatar.cape ~= UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object].cape then
    table.insert(L1_6008, A0_6007:Parent().avatar.cape)
  end
  if A0_6007:Parent().avatar.weapon and A0_6007:Parent().avatar.weapon ~= UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object].weapon then
    table.insert(L1_6008, A0_6007:Parent().avatar.weapon)
  end
  if A0_6007:Parent().avatar.shield and A0_6007:Parent().avatar.shield ~= UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object].shield then
    table.insert(L1_6008, A0_6007:Parent().avatar.shield)
  end
  return L1_6008
end
function CashShop.RefreshButton(A0_6009)
  A0_6009:Parent().buy.enable = #A0_6009:CalcModifyItemList() ~= 0
end
function CashShop.OnCashItemDown(A0_6010, A1_6011, A2_6012, A3_6013)
  local L4_6014, L5_6015, L6_6016
  L4_6014 = A3_6013.item
  L5_6015 = L4_6014.type
  L6_6016 = L4_6014.stype
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
  if A0_6010:ItemTypeToAvatar(L5_6015, L6_6016) == nil then
    A0_6010:Parent().ui.ibuy.buy.tag = L4_6014.id
    A0_6010:Parent().ui.ibuy.visible = true
    return
  end
  if A0_6010:ItemTypeToAvatar(L5_6015, L6_6016) == "coat" and (A0_6010:Parent().avatar[A0_6010:ItemTypeToAvatar(L5_6015, L6_6016)] ~= L4_6014.id and L4_6014.id or nil) == nil then
  end
  if A0_6010:ItemTypeToAvatar(L5_6015, L6_6016) == "pants" and (1040036 or A0_6010:Parent().avatar[A0_6010:ItemTypeToAvatar(L5_6015, L6_6016)] ~= L4_6014.id and L4_6014.id or nil) == nil then
  end
  A0_6010:Parent().avatar[A0_6010:ItemTypeToAvatar(L5_6015, L6_6016)] = 1060026 or 1040036 or A0_6010:Parent().avatar[A0_6010:ItemTypeToAvatar(L5_6015, L6_6016)] ~= L4_6014.id and L4_6014.id or nil
  if (1060026 or 1040036 or A0_6010:Parent().avatar[A0_6010:ItemTypeToAvatar(L5_6015, L6_6016)] ~= L4_6014.id and L4_6014.id or nil) == nil and A0_6010:ItemTypeToAvatar(L5_6015, L6_6016) == "longcoat" then
    A0_6010:Parent().avatar.coat = 1040036
    A0_6010:Parent().avatar.pants = 1060026
  end
  A0_6010:RefreshButton()
end
function CashShop.SelectAction(A0_6017)
  local L1_6018, L2_6019, L3_6020, L4_6021, L5_6022, L6_6023, L7_6024
  L1_6018 = Array
  L1_6018 = L1_6018()
  for L5_6022 = 0, 7 do
    L6_6023 = string
    L6_6023 = L6_6023.format
    L7_6024 = "UI/Select/%d.ntp"
    L6_6023 = L6_6023(L7_6024, L5_6022)
    L7_6024 = Animate
    L7_6024 = L7_6024(L6_6023, 0, 0, 0.15)
    if L7_6024 ~= nil then
      L1_6018:AddObject(L7_6024)
    end
  end
  L7_6024 = L3_6020(L4_6021)
  return L2_6019(L3_6020, L4_6021, L5_6022, L6_6023, L7_6024, L3_6020(L4_6021))
end
function CashShop.InsertToCashBackpack(A0_6025, A1_6026)
  if not UniqueComponent("Model/interface.model").ui.ibackpack[string.format("%d_bg", A1_6026)] or not UniqueComponent("Model/interface.model").ui.ibackpack[string.format("%d_bg", A1_6026)].item or not UniqueComponent("Model/interface.model").ui.ibackpack[string.format("%d_bg", A1_6026)].item.is_cash then
    return
  end
  for _FORV_13_, _FORV_14_ in ipairs(A0_6025:Parent().cbackpack.child.all) do
    if not _FORV_14_.item then
      break
    end
  end
  if _FORV_14_.name == 0 then
  end
  if #A0_6025:Parent().cbackpack.child.all < (#A0_6025:Parent().cbackpack.child.all + 1 or _FORV_14_.name) then
    A0_6025:Parent().cbackpack.amount = #A0_6025:Parent().cbackpack.child.all + 1 or _FORV_14_.name
    A0_6025:Parent().cbackpack.refresh = true
  end
  UniqueComponent("Model/interface.model").ui.ibackpack[string.format("%d_bg", A1_6026)].item.parent = A0_6025:Parent().cbackpack[#A0_6025:Parent().cbackpack.child.all + 1 or _FORV_14_.name]
  UniqueComponent("Model/interface.model").ui.ibackpack[string.format("%d_bg", A1_6026)].item.view.parent = A0_6025:Parent().cbackpack[#A0_6025:Parent().cbackpack.child.all + 1 or _FORV_14_.name]
  UniqueComponent("Model/interface.model").ui.ibackpack[string.format("%d_bg", A1_6026)].item.slot, UniqueComponent("Model/interface.model").ui.ibackpack[string.format("%d_bg", A1_6026)].item.site = #A0_6025:Parent().cbackpack.child.all + 1 or _FORV_14_.name, "cbackpack"
  A0_6025.focus.visible = false
end
function CashShop.OnBackpackDown(A0_6027, A1_6028, A2_6029, A3_6030)
  A0_6027.last_select_type = A0_6027.select_type
  A0_6027.select_type = "backpack"
  A0_6027.last_select_index = A0_6027.select_index
  A0_6027.select_index = A2_6029
  if A0_6027.select_type == A0_6027.last_select_type and A0_6027.select_index == A0_6027.last_select_index then
    A0_6027:InsertToCashBackpack(A2_6029)
    return
  end
  if not A1_6028[A2_6029].view then
    return
  end
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
  A0_6027.focus.visible = true
  A0_6027.focus.parent = A3_6030
  A0_6027.focus.unactions = true
  A0_6027.focus.action = A0_6027:SelectAction()
end
function CashShop.InsertToBackpack(A0_6031, A1_6032)
  local L2_6033, L3_6034, L4_6035, L5_6036, L6_6037
  L2_6033 = UniqueComponent
  L3_6034 = "Model/interface.model"
  L2_6033 = L2_6033(L3_6034)
  L3_6034 = L2_6033.ui
  L3_6034 = L3_6034.ibackpack
  L3_6034 = L3_6034.Backpack
  L5_6036 = A0_6031
  L4_6035 = A0_6031.Parent
  L4_6035 = L4_6035(L5_6036)
  L5_6036 = L4_6035.cbackpack
  L6_6037 = L5_6036[A1_6032]
  L6_6037 = L6_6037.item
  if not L3_6034:Insert(L6_6037) then
    return
  end
  L6_6037.view.parent = L4_6035.backpack[L6_6037.slot]
  A0_6031.focus.visible = false
end
function CashShop.OnCashBackpackDown(A0_6038, A1_6039, A2_6040, A3_6041)
  A0_6038.last_select_type = A0_6038.select_type
  A0_6038.select_type = "cbackpack"
  A0_6038.last_select_index = A0_6038.select_index
  A0_6038.select_index = A2_6040
  if A0_6038.select_type == A0_6038.last_select_type and A0_6038.select_index == A0_6038.last_select_index then
    A0_6038:InsertToBackpack(A2_6040)
    return
  end
  if not A1_6039[A2_6040].item then
    return
  end
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
  A0_6038.focus.visible = true
  A0_6038.focus.parent = A3_6041
  A0_6038.focus.unactions = true
  A0_6038.focus.action = A0_6038:SelectAction()
end
function CashShop.OnStateDown(A0_6042, A1_6043, A2_6044, A3_6045)
  if A2_6044 == "stand" then
    A0_6042:Parent().avatar.status = STATUS_STAND
    return
  end
  if A2_6044 == "walk" then
    A0_6042:Parent().avatar.status = STATUS_WALK
    return
  end
  if A2_6044 == "rope" then
    A0_6042:Parent().avatar.status = STATUS_LADDER
    return
  end
end
function CashShop.FilterCashItem(A0_6046, A1_6047)
  local L2_6048, L3_6049, L4_6050, L5_6051, L6_6052, L7_6053, L8_6054, L9_6055, L10_6056
  L2_6048 = {}
  L3_6049 = UniqueComponent
  L4_6050 = "Model/interface.model"
  L3_6049 = L3_6049(L4_6050)
  L4_6050 = L3_6049.parent
  if not L4_6050 then
    return A1_6047
  end
  L5_6051 = L4_6050.physical
  L5_6051 = L5_6051[L6_6052]
  if not L5_6051 then
    return A1_6047
  end
  for L9_6055, L10_6056 in L6_6052(L7_6053) do
    if L10_6056.req_job and L10_6056.req_job ~= L5_6051.data.major_job and L10_6056.req_job ~= L5_6051.data.job then
    else
    end
    if false then
      table.insert(L2_6048, L10_6056)
    end
  end
  return L2_6048
end
function CashShop.OnTypeItemDown(A0_6057, A1_6058, A2_6059, A3_6060)
  local L4_6061
  L4_6061 = A0_6057.type_items
  L4_6061 = L4_6061[A2_6059]
  if not L4_6061 then
    return
  end
  L4_6061 = A0_6057:FilterCashItem(L4_6061)
  A0_6057:Parent().cash_item.amount = #L4_6061
  for _FORV_10_, _FORV_11_ in pairs(A0_6057:Parent().cash_item.child.all) do
    for _FORV_15_, _FORV_16_ in pairs(_FORV_11_.child.all) do
      _FORV_16_.parent = nil
    end
    L4_6061[_FORV_10_].parent = _FORV_11_
  end
  A0_6057:Parent().cash_item.refresh = true
end
function CashShop.OnCleanDown(A0_6062, A1_6063)
  A0_6062:Parent().avatar.cap = nil
  A0_6062:Parent().avatar.longcoat = nil
  A0_6062:Parent().avatar.shoes = nil
  A0_6062:Parent().avatar.glove = nil
  A0_6062:Parent().avatar.cape = nil
  A0_6062:Parent().avatar.weapon = nil
  A0_6062:Parent().avatar.shield = nil
  A0_6062:Parent().avatar.coat = 1040036
  A0_6062:Parent().avatar.pants = 1060026
  A0_6062:RefreshButton()
end
function CashShop.OnOriginDown(A0_6064, A1_6065)
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  A0_6064:Parent().avatar.copy = UniqueComponent("Model/interface.model").parent[UniqueComponent("Model/interface.model").parent.focus_object]
  A0_6064:RefreshButton()
end
function CashShop.OnBuyDown(A0_6066, A1_6067)
  A0_6066:Parent().ui.ibuylist.visible = true
end
function CashShop.OnExitDown(A0_6068, A1_6069)
  local L2_6070, L3_6071, L4_6072, L5_6073, L6_6074
  L3_6071 = A0_6068
  L2_6070 = A0_6068.Parent
  L2_6070 = L2_6070(L3_6071)
  L3_6071 = A0_6068.session
  if not L3_6071 then
    return
  end
  L4_6072 = UniqueComponent
  L5_6073 = "Model/interface.model"
  L4_6072 = L4_6072(L5_6073)
  L5_6073 = L4_6072.ui
  L5_6073 = L5_6073.ibackpack
  L5_6073 = L5_6073.Backpack
  L6_6074 = SceneByID
  L6_6074 = L6_6074(L2_6070.tag)
  L3_6071.init_x = L6_6074.drop_point.x
  L3_6071.init_y = L6_6074.drop_point.y + L3_6071.height
  L3_6071.parent = L6_6074.physical
  L6_6074.focus_object = L3_6071.name
  World:Launch(L6_6074)
  L5_6073:RefreshView()
end
function CashShop.RefreshBackpackItem(A0_6075)
  local L1_6076, L2_6077, L3_6078
  L1_6076 = UniqueComponent
  L2_6077 = "Model/interface.model"
  L1_6076 = L1_6076(L2_6077)
  L2_6077 = L1_6076.ui
  L2_6077 = L2_6077.ibackpack
  L2_6077 = L2_6077.Backpack
  L3_6078 = L2_6077.Items
  L3_6078 = L3_6078(L2_6077)
  for _FORV_9_ = 1, Config.MaxBackpackGrid do
    A0_6075:Parent().backpack[_FORV_9_].enable = true
  end
  for _FORV_9_, _FORV_10_ in ipairs(L3_6078) do
    _FORV_10_.view.parent = A0_6075:Parent().backpack[_FORV_10_.slot]
    A0_6075:Parent().backpack[_FORV_10_.slot].enable = _FORV_10_.is_cash == true
  end
end
function CashShop.InsertItem(A0_6079, A1_6080)
  for _FORV_9_, _FORV_10_ in ipairs(A0_6079:Parent().cbackpack.child.all) do
    if not _FORV_10_.item then
      break
    end
  end
  if _FORV_10_.name == 0 then
  end
  if #A0_6079:Parent().cbackpack.child.all < (#A0_6079:Parent().cbackpack.child.all + 1 or _FORV_10_.name) then
    A0_6079:Parent().cbackpack.amount = #A0_6079:Parent().cbackpack.child.all + 1 or _FORV_10_.name
    A0_6079:Parent().cbackpack.refresh = true
  end
  A1_6080.parent, A1_6080.name = A0_6079:Parent().cbackpack[#A0_6079:Parent().cbackpack.child.all + 1 or _FORV_10_.name], "item"
  A1_6080.view.name = "view"
  A1_6080.view.parent = A0_6079:Parent().cbackpack[#A0_6079:Parent().cbackpack.child.all + 1 or _FORV_10_.name]
  A1_6080.slot, A1_6080.site = #A0_6079:Parent().cbackpack.child.all + 1 or _FORV_10_.name, "cbackpack"
end
function CashShop.CheckItem(A0_6081, A1_6082)
  if not A1_6082 then
    return
  end
  A1_6082.name = "item"
  A1_6082.view.name = "view"
  if not A1_6082.slot then
    A0_6081:InsertItem(A1_6082)
    return
  end
  if not A0_6081:Parent().cbackpack[A1_6082.slot] then
    A0_6081:Parent().cbackpack.amount = A1_6082.slot
    A0_6081:Parent().cbackpack.refresh = true
  end
  if not A0_6081:Parent().cbackpack[A1_6082.slot] then
    return
  end
  if A0_6081:Parent().cbackpack[A1_6082.slot].item then
    A0_6081:InsertItem(A1_6082)
    return
  end
  A1_6082.parent = A0_6081:Parent().cbackpack[A1_6082.slot]
  A1_6082.view.parent = A0_6081:Parent().cbackpack[A1_6082.slot]
end
function CashShop.SetSession(A0_6083, A1_6084)
  local L2_6085, L3_6086, L4_6087, L5_6088, L6_6089, L7_6090, L8_6091, L9_6092
  L2_6085 = A0_6083.session
  if L2_6085 == A1_6084 then
    return
  end
  L3_6086 = A0_6083
  L2_6085 = A0_6083.Parent
  L2_6085 = L2_6085(L3_6086)
  L3_6086 = L2_6085.cbackpack
  for L7_6090, L8_6091 in L4_6087(L5_6088) do
    L9_6092 = L8_6091.item
    if L9_6092 then
      L9_6092.parent = nil
      L9_6092.view.parent = nil
    end
  end
  A0_6083.session = A1_6084
  L8_6091 = A1_6084.name
  L9_6092 = L6_6089(L7_6090, L8_6091)
  for L8_6091, L9_6092 in L5_6088(L6_6089) do
    A0_6083:CheckItem(MakeItem(L9_6092))
  end
end
function CashShop.RefreshIntegral(A0_6093, A1_6094)
  A0_6093:Parent().point_number.text = tostring(Integral:Sum("quantity", string.format("belong = %d and limit = 0", A1_6094)))
  A0_6093:Parent().lpoint_number.text = tostring(Integral:Sum("quantity", string.format("belong = %d and limit = 1", A1_6094)))
end
function CashShop.OnEnter(A0_6095, A1_6096)
  local L2_6097, L3_6098, L4_6099, L5_6100
  L2_6097 = A0_6095.focus
  L2_6097.visible = false
  L3_6098 = A0_6095
  L2_6097 = A0_6095.Parent
  L2_6097 = L2_6097(L3_6098)
  L3_6098 = UniqueComponent
  L4_6099 = "Model/interface.model"
  L3_6098 = L3_6098(L4_6099)
  L4_6099 = L3_6098.parent
  if not L4_6099 then
    return
  end
  L5_6100 = L4_6099.physical
  L5_6100 = L5_6100[L4_6099.focus_object]
  if not L5_6100 then
    return
  end
  if not Userinfo:One(string.format("serial = %d", L5_6100.name)) then
    return
  end
  if not Account:One(string.format("serial = %d", Userinfo:One(string.format("serial = %d", L5_6100.name)).belong)) then
    return
  end
  L2_6097.point_number.text = tostring(Integral:Sum("quantity", string.format("belong = %d and limit = 0", Userinfo:One(string.format("serial = %d", L5_6100.name)).belong)))
  L2_6097.lpoint_number.text = tostring(Integral:Sum("quantity", string.format("belong = %d and limit = 1", Userinfo:One(string.format("serial = %d", L5_6100.name)).belong)))
  L2_6097.avatar.status = STATUS_FALL
  L2_6097.avatar.status = STATUS_STAND
  L2_6097.state_radio.select = "stand"
  A0_6095:OnOriginDown(L2_6097.origin)
  A0_6095:RefreshBackpackItem()
  A0_6095:SetSession(L5_6100)
end
