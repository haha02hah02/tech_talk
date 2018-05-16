Class.Consignor.Script({})
function Consignor.Constructor(A0_6161, A1_6162)
  Script.Constructor(A0_6161, A1_6162)
  if not A1_6162 then
    return
  end
  A1_6162.on = {
    "Visible",
    A0_6161,
    A0_6161.OnVisible
  }
  A1_6162.item.on = {
    "SelectDown",
    A0_6161,
    A0_6161.OnItemSelectDown
  }
  A1_6162.item.on = {
    "SelectUp",
    A0_6161,
    A0_6161.OnItemSelectUp
  }
  A1_6162.item.on = {
    "LongPress",
    A0_6161,
    A0_6161.OnItemLongPress
  }
  A1_6162.backpack.on = {
    "SelectDown",
    A0_6161,
    A0_6161.OnBackpackSelectDown
  }
  A1_6162.backpack.on = {
    "LongPress",
    A0_6161,
    A0_6161.OnBackpackLongPress
  }
end
function Consignor.SetNpc(A0_6163, A1_6164)
  local L2_6165, L3_6166
  L3_6166 = A0_6163
  L2_6165 = A0_6163.Parent
  L2_6165 = L2_6165(L3_6166)
  L3_6166 = L2_6165.npc
  if L3_6166 and L3_6166.id == A1_6164 then
    return
  end
  if L3_6166 then
    L3_6166.parent = nil
    L3_6166.render:RemoveFromParent()
  end
  L3_6166 = NpcAvatar(A1_6164)
  L3_6166.name = "npc"
  L3_6166.x = -170
  L3_6166.y = 90 + L3_6166.info.height / 2
  L3_6166.direction = "right"
  L3_6166.status = STATUS_STAND
  L3_6166.name_tag.visible = false
  L3_6166.parent = L2_6165
end
function Consignor.RefreshGoldView(A0_6167)
  local L1_6168, L2_6169, L3_6170, L4_6171, L5_6172, L6_6173, L7_6174
  L1_6168 = UniqueComponent
  L2_6169 = "Model/interface.model"
  L1_6168 = L1_6168(L2_6169)
  L2_6169 = L1_6168.parent
  if not L2_6169 then
    return
  end
  L4_6171 = A0_6167
  L3_6170 = A0_6167.Parent
  L3_6170 = L3_6170(L4_6171)
  L4_6171 = L2_6169.physical
  L5_6172 = L2_6169.focus_object
  L4_6171 = L4_6171[L5_6172]
  L5_6172 = Possession
  L6_6173 = L5_6172
  L5_6172 = L5_6172.Sum
  L7_6174 = "quantity"
  L5_6172 = L5_6172(L6_6173, L7_6174, string.format("belong = %d and limit = 0", L4_6171.name))
  L6_6173 = Possession
  L7_6174 = L6_6173
  L6_6173 = L6_6173.Sum
  L6_6173 = L6_6173(L7_6174, "quantity", string.format("belong = %d and limit = 1", L4_6171.name))
  L7_6174 = Integral
  L7_6174 = L7_6174.Sum
  L7_6174 = L7_6174(L7_6174, "quantity", "limit = 0")
  L3_6170.point.text = PriceFormat(L5_6172)
  L3_6170.lpoint.text = PriceFormat(L6_6173)
  L3_6170.integral.text = PriceFormat(L7_6174)
end
function Consignor.RefreshConsignorView(A0_6175)
  local L1_6176, L2_6177, L3_6178, L4_6179, L5_6180, L6_6181, L7_6182, L8_6183, L9_6184, L10_6185
  L1_6176 = UniqueComponent
  L2_6177 = "Model/interface.model"
  L1_6176 = L1_6176(L2_6177)
  L2_6177 = L1_6176.parent
  L3_6178 = L2_6177.physical
  L4_6179 = L2_6177.focus_object
  L3_6178 = L3_6178[L4_6179]
  if not L3_6178 then
    return
  end
  L5_6180 = A0_6175
  L4_6179 = A0_6175.Parent
  L4_6179 = L4_6179(L5_6180)
  L5_6180 = L4_6179.item
  L6_6181 = L5_6180.child
  L6_6181 = L6_6181.size
  L7_6182 = L1_6176.ui
  L7_6182 = L7_6182.ibackpack
  for _FORV_11_, _FORV_12_ in L8_6183(L9_6184) do
    _FORV_12_.parent = nil
  end
  for _FORV_12_, _FORV_13_ in L9_6184(L10_6185) do
    StorageItemView(_FORV_13_.item_id, _FORV_13_.amount).name = _FORV_12_
    StorageItemView(_FORV_13_.item_id, _FORV_13_.amount).parent = L5_6180
    StorageItemView(_FORV_13_.item_id, _FORV_13_.amount).order = _FORV_13_.serial
  end
  if L10_6185 ~= 228 and L6_6181 < L9_6184 then
  end
  L5_6180.refresh = true
  L5_6180.offset_y = L10_6185
end
function Consignor.RefreshBackpackView(A0_6186)
  local L1_6187, L2_6188, L3_6189, L4_6190, L5_6191, L6_6192, L7_6193, L8_6194
  L1_6187 = UniqueComponent
  L2_6188 = "Model/interface.model"
  L1_6187 = L1_6187(L2_6188)
  L3_6189 = A0_6186
  L2_6188 = A0_6186.Parent
  L2_6188 = L2_6188(L3_6189)
  L3_6189 = L2_6188.backpack
  L4_6190 = L3_6189.child
  L4_6190 = L4_6190.size
  L5_6191 = L1_6187.ui
  L5_6191 = L5_6191.ibackpack
  for _FORV_9_, _FORV_10_ in L6_6192(L7_6193) do
    _FORV_10_.parent = nil
  end
  for _FORV_10_, _FORV_11_ in L7_6193(L8_6194) do
    StorageItemView(_FORV_11_.id, _FORV_11_.amount, _FORV_11_.stochastic).name = _FORV_10_
    StorageItemView(_FORV_11_.id, _FORV_11_.amount, _FORV_11_.stochastic).parent = L3_6189
    StorageItemView(_FORV_11_.id, _FORV_11_.amount, _FORV_11_.stochastic).order = _FORV_11_.slot
    StorageItemView(_FORV_11_.id, _FORV_11_.amount, _FORV_11_.stochastic).tag = _FORV_11_.slot
  end
  if L8_6194 ~= 228 and L4_6190 < L7_6193 then
  end
  L3_6189.refresh = true
  L3_6189.offset_y = L8_6194
end
function Consignor.OnItemSelectDown(A0_6195, A1_6196, A2_6197, A3_6198)
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
end
function Consignor.OnItemSelectUp(A0_6199, A1_6200, A2_6201, A3_6202)
  local L4_6203, L5_6204, L6_6205, L7_6206, L8_6207, L9_6208, L10_6209, L11_6210, L12_6211
  L4_6203 = A0_6199.item_select
  A0_6199.last_item_select = L4_6203
  A0_6199.item_select = A3_6202
  L4_6203 = A0_6199.last_item_select
  L5_6204 = A0_6199.item_select
  if L4_6203 ~= L5_6204 then
    return
  end
  L4_6203 = UniqueComponent
  L5_6204 = "Model/interface.model"
  L4_6203 = L4_6203(L5_6204)
  L5_6204 = L4_6203.node
  L5_6204 = L5_6204.Interface
  L6_6205 = L4_6203.parent
  if not L6_6205 then
    return
  end
  L7_6206 = L6_6205.physical
  L8_6207 = L6_6205.focus_object
  L7_6206 = L7_6206[L8_6207]
  if not L7_6206 then
    return
  end
  L9_6208 = A0_6199
  L8_6207 = A0_6199.Parent
  L8_6207 = L8_6207(L9_6208)
  L9_6208 = L8_6207.item
  L10_6209 = L4_6203.ui
  L10_6209 = L10_6209.ibackpack
  L11_6210 = L9_6208.child
  L11_6210 = L11_6210.sort
  L12_6211 = Items
  L12_6211 = L12_6211.One
  L12_6211 = L12_6211(L12_6211, string.format("belong = %d and serial = %d", L7_6206.name, L11_6210[A3_6202 + 1].order))
  if not L12_6211 then
    return
  end
  A0_6199.item_select = nil
  if not L10_6209.Backpack:Insert(MakeItem(L12_6211)) then
    L5_6204:SetNotice(41)
    return
  end
  A0_6199:RefreshConsignorView()
  A0_6199:RefreshBackpackView()
end
function Consignor.OnItemLongPress(A0_6212, A1_6213, A2_6214, A3_6215)
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  if not Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_6212:Parent().item.child.sort[A3_6215 + 1].order)) then
    return
  end
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_6212:Parent().item.child.sort[A3_6215 + 1].order)).item_id, Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_6212:Parent().item.child.sort[A3_6215 + 1].order)).level, Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_6212:Parent().item.child.sort[A3_6215 + 1].order)).slevel, Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_6212:Parent().item.child.sort[A3_6215 + 1].order)).enchant, Items:One(string.format("belong = %d and serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name, A0_6212:Parent().item.child.sort[A3_6215 + 1].order)).stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
  A0_6212.item_select = nil
end
function Consignor.OnBackpackSelectDown(A0_6216, A1_6217, A2_6218, A3_6219)
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
end
function Consignor.OnBackpackLongPress(A0_6220, A1_6221, A2_6222, A3_6223)
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_6223 + 1].id, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_6223 + 1].level, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_6223 + 1].slevel, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_6223 + 1].enchant, UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:StorageItems()[A3_6223 + 1].stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
  A0_6220.backpack_select = nil
end
function Consignor.LoadingAction(A0_6224)
  local L1_6225, L2_6226, L3_6227, L4_6228, L5_6229, L6_6230, L7_6231
  L1_6225 = Array
  L1_6225 = L1_6225()
  for L5_6229 = 0, 15 do
    L6_6230 = string
    L6_6230 = L6_6230.format
    L7_6231 = "UI/Base/loading.%d.ntp"
    L6_6230 = L6_6230(L7_6231, L5_6229)
    L7_6231 = Animate
    L7_6231 = L7_6231(L6_6230, 0, 0, 0.1)
    if L7_6231 then
      L1_6225:AddObject(L7_6231)
    end
  end
  L7_6231 = L3_6227(L4_6228)
  return L2_6226(L3_6227, L4_6228, L5_6229, L6_6230, L7_6231, L3_6227(L4_6228))
end
function Consignor.SetLoading(A0_6232, A1_6233)
  A0_6232:Parent().loading.visible = A1_6233
  A0_6232:Parent().load_limit.visible = A1_6233
  if not A1_6233 then
    return
  end
  A0_6232:Parent().loading.unactions = true
  A0_6232:Parent().loading.action = A0_6232:LoadingAction()
end
function Consignor.HandlePrice(A0_6234, A1_6235, A2_6236, A3_6237)
  local L4_6238, L5_6239, L6_6240, L7_6241, L8_6242, L9_6243
  if not A2_6236 or not A3_6237 or A3_6237 == 0 then
    return
  end
  if A2_6236 == 0 then
    L4_6238 = Possession
  else
    L4_6238 = L4_6238 or Integral
  end
  L5_6239 = -2
  while true do
    L7_6241 = L4_6238
    L6_6240 = L4_6238.One
    L8_6242 = string
    L8_6242 = L8_6242.format
    L9_6243 = "serial = %d"
    L9_6243 = L8_6242(L9_6243, L5_6239)
    L6_6240 = L6_6240(L7_6241, L8_6242, L9_6243, L8_6242(L9_6243, L5_6239))
    if L6_6240 then
      L5_6239 = L5_6239 - 1
    end
  end
  L6_6240 = string
  L6_6240 = L6_6240.format
  L7_6241 = "%d%d%d0'system'"
  L8_6242 = L5_6239
  L9_6243 = A1_6235
  L6_6240 = L6_6240(L7_6241, L8_6242, L9_6243, A3_6237)
  L7_6241 = L6_6240.lower
  L8_6242 = SHA1String
  L9_6243 = L6_6240
  L9_6243 = L8_6242(L9_6243)
  L7_6241 = L7_6241(L8_6242, L9_6243, L8_6242(L9_6243))
  if A2_6236 == 0 then
    L8_6242 = "Possession"
  else
    L8_6242 = L8_6242 or "Integral"
  end
  L9_6243 = L6_6240.format
  L9_6243 = L9_6243("insert.into.%s{serial = %d, belong = %s, quantity = %s, limit = 0, provenance = 'system', check_code = '%s'}", L8_6242, L5_6239, A1_6235, A3_6237, L7_6241)
  load("return " .. L9_6243)()
end
function Consignor.HandlePriceNotice(A0_6244, A1_6245, A2_6246)
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  if not Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) then
    return
  end
  A0_6244:HandlePrice(Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).belong, 1, A2_6246)
  A0_6244:HandlePrice(Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).serial, 0, A1_6245)
  if A1_6245 == 0 and A2_6246 == 0 then
    return
  end
  if A1_6245 > 0 and A2_6246 > 0 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(46, A1_6245, A2_6246)
    return
  end
  if A1_6245 > 0 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(44, A1_6245)
    return
  end
  if A2_6246 > 0 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(45, A2_6246)
    return
  end
end
function Consignor.OnConsignorResponse(A0_6247, A1_6248, A2_6249)
  local L3_6250, L4_6251, L5_6252, L6_6253
  L4_6251 = A0_6247
  L3_6250 = A0_6247.SetLoading
  L5_6252 = false
  L3_6250(L4_6251, L5_6252)
  A0_6247.consignor_update = false
  if A1_6248 ~= 0 or not A2_6249 then
    return
  end
  L3_6250 = A2_6249.integral
  L4_6251 = A2_6249.possession
  L6_6253 = A0_6247
  L5_6252 = A0_6247.HandlePriceNotice
  L5_6252(L6_6253, L4_6251, L3_6250)
  L5_6252 = A2_6249.items
  L6_6253 = L5_6252.First
  L6_6253 = L6_6253(L5_6252)
  while L6_6253 ~= nil do
    load("return " .. L6_6253)()
    L6_6253 = L5_6252:Next()
  end
  A0_6247:RefreshConsignorView()
end
function Consignor.OnVisible(A0_6254, A1_6255)
  if not A1_6255.visible then
    return
  end
  A0_6254.item_select = nil
  A0_6254.backpack_select = nil
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  A0_6254:Parent().avatar.copy = UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].proxy
  A0_6254:SetLoading(A0_6254.consignor_update)
  A0_6254:RefreshGoldView()
  A0_6254:RefreshBackpackView()
  if A0_6254.consignor_update then
    return
  end
  A0_6254:SetLoading(true)
  A0_6254.consignor_update = true
  AdventureSDK:ExchangeMy(A0_6254, A0_6254.OnConsignorResponse)
end
