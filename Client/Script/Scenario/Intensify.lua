L0_6356 = Class
L0_6356 = L0_6356.Intensify
L0_6356 = L0_6356.Script
L0_6356({})
L0_6356 = {}
L0_6356[1] = "necklace"
L0_6356[2] = "accessory"
L0_6356[3] = "cap"
L0_6356[4] = "eardrop"
L0_6356[5] = "belt"
L0_6356[6] = "coat"
L0_6356[7] = "shoulder"
L0_6356[8] = "pants"
L0_6356[9] = "glove"
L0_6356[10] = "weapon"
L0_6356[11] = "assistant"
L0_6356[12] = "lring"
L0_6356[13] = "badge"
L0_6356[14] = "shoes"
L0_6356[15] = "cape"
L0_6356[16] = "rring"
for _FORV_5_, _FORV_6_ in ipairs(L0_6356) do
  ;({})[_FORV_6_] = _FORV_5_
end
function Intensify.Constructor(A0_6357, A1_6358)
  local L2_6359, L3_6360, L4_6361, L5_6362, L6_6363
  L2_6359(L3_6360, L4_6361)
  if not A1_6358 then
    return
  end
  for L5_6362, L6_6363 in L2_6359(L3_6360) do
    A1_6358[string.format("b%s", L6_6363)].tag = L5_6362
    A1_6358[string.format("b%s", L6_6363)].on = {
      "Down",
      A0_6357,
      A0_6357.OnItemDown
    }
    A1_6358[string.format("b%s", L6_6363)].on = {
      "Up",
      A0_6357,
      A0_6357.OnItemUp
    }
  end
  L5_6362 = A0_6357.OnVisible
  A1_6358.on = L2_6359
  L5_6362 = A0_6357
  L6_6363 = A0_6357.OnBindAgreeCheck
  L2_6359.on = L3_6360
  L5_6362 = A0_6357
  L6_6363 = A0_6357.OnBindAgreeCheck
  L2_6359.on = L3_6360
  L5_6362 = A0_6357
  L6_6363 = A0_6357.OnIntensifyStart
  L2_6359.on = L3_6360
  L5_6362 = A0_6357
  L6_6363 = A0_6357.OnIntensifyStart
  L2_6359.on = L3_6360
  L5_6362 = A0_6357
  L6_6363 = A0_6357.OnUpdate
  L2_6359(L3_6360, L4_6361, L5_6362, L6_6363)
end
function Intensify.FocusAction(A0_6364)
  local L1_6365, L2_6366, L3_6367, L4_6368, L5_6369, L6_6370, L7_6371
  L1_6365 = Array
  L1_6365 = L1_6365()
  for L5_6369 = 0, 7 do
    L6_6370 = string
    L6_6370 = L6_6370.format
    L7_6371 = "UI/Select/%d.ntp"
    L6_6370 = L6_6370(L7_6371, L5_6369)
    L7_6371 = Animate
    L7_6371 = L7_6371(L6_6370, 0, 0, 0.15)
    if L7_6371 ~= nil then
      L1_6365:AddObject(L7_6371)
    end
  end
  L7_6371 = L3_6367(L4_6368)
  return L2_6366(L3_6367, L4_6368, L5_6369, L6_6370, L7_6371, L3_6367(L4_6368))
end
function Intensify.RefreshEquipView(A0_6372)
  local L1_6373, L2_6374, L3_6375, L4_6376, L5_6377
  L1_6373 = A0_6372.Parent
  L1_6373 = L1_6373(L2_6374)
  for L5_6377, _FORV_6_ in L2_6374(L3_6375) do
    if L1_6373[_FORV_6_].item then
      L1_6373[_FORV_6_].item.parent = nil
    end
  end
  if not L3_6375 then
    return
  end
  L5_6377 = L3_6375.focus_object
  if not L4_6376 then
    return
  end
  L5_6377 = Items
  L5_6377 = L5_6377.Find
  L5_6377 = L5_6377(L5_6377, string.format("belong = %d and site = 'equips'", L4_6376.name))
  for _FORV_9_, _FORV_10_ in pairs(L5_6377) do
    ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).name = "item"
    ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).x = 20
    ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).y = 20
    ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).parent, ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).tag = L1_6373[LoadConf(string.format("Item/%d.item", _FORV_10_.item_id)).info.type], _FORV_10_.serial
  end
end
function Intensify.SetIntensifyView(A0_6378, A1_6379)
  local L2_6380, L3_6381, L4_6382, L5_6383, L6_6384, L7_6385, L8_6386
  L3_6381 = A0_6378
  L2_6380 = A0_6378.Parent
  L2_6380 = L2_6380(L3_6381)
  L3_6381 = LoadConf
  L4_6382 = string
  L4_6382 = L4_6382.format
  L5_6383 = "Item/%d.item"
  L6_6384 = A1_6379.item_id
  L8_6386 = L4_6382(L5_6383, L6_6384)
  L3_6381 = L3_6381(L4_6382, L5_6383, L6_6384, L7_6385, L8_6386, L4_6382(L5_6383, L6_6384))
  L3_6381 = L3_6381.info
  L4_6382 = L3_6381.req_level
  if not L4_6382 then
    L4_6382 = Config
    L4_6382 = L4_6382.TenNumber
  end
  L5_6383 = A1_6379.slevel
  if not L5_6383 then
    L5_6383 = Config
    L5_6383 = L5_6383.ZeroNumber
  end
  L6_6384 = A1_6379.level
  if not L6_6384 then
    L6_6384 = Config
    L6_6384 = L6_6384.ZeroNumber
  end
  L7_6385 = Possession
  L8_6386 = L7_6385
  L7_6385 = L7_6385.Sum
  L7_6385 = L7_6385(L8_6386, "quantity", "limit = 0")
  L8_6386 = Config
  L8_6386 = L8_6386.IntensifyLevelGold
  L8_6386 = L8_6386 * L4_6382
  L8_6386 = L8_6386 * (L5_6383 + Config.OneNumber)
  L2_6380.gold.visible = true
  L2_6380.gold.text = PriceFormat(L8_6386)
  L2_6380.gold.color = L7_6385 < L8_6386 and 4278190335 or 269488383
  L2_6380.ilevel.text = string.format(":%d", L5_6383)
  L2_6380.ilevel.visible = true
  L2_6380.intensify.disable = (L6_6384 >= Config.MaxIntensifyLevel or not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true) or L7_6385 < L8_6386) and true or false
  L2_6380.intensify.visible = not (UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true) and A1_6379.tradable and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true).tradable or false)
  L2_6380.bintensify.visible = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true) and A1_6379.tradable and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true).tradable or false
  L2_6380.bintensify.disable = true
  L2_6380.bind_title.visible = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true) and A1_6379.tradable and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true).tradable or false
  L2_6380.bind_agree.visible = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true) and A1_6379.tradable and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true).tradable or false
  L2_6380.bind_agree.checked = false
  L2_6380.sacrifice.visible = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true) and true or false
  if not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true) then
    return
  end
  L2_6380.animate.unactions = true
  L2_6380.animate.action = RepeatForever(RotateBy(0.5, 10))
  L2_6380.sacrifice.texture = string.format("Item/%d.icon", UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(A1_6379, true, true).id)
end
function Intensify.OnBindAgreeCheck(A0_6387, A1_6388)
  if not A0_6387:Parent()[A0_6387.select_name].item then
    return
  end
  if A1_6388.checked then
    A0_6387:Parent().bintensify.disable = true
    return
  end
  A0_6387:Parent().bintensify.enable = not ((Items:One(string.format("serial = %d", A0_6387:Parent()[A0_6387.select_name].item.tag)).level or Config.ZeroNumber) >= Config.MaxIntensifyLevel) and not (Possession:Sum("quantity", "limit = 0") < Config.IntensifyLevelGold * (LoadConf(string.format("Item/%d.item", Items:One(string.format("serial = %d", A0_6387:Parent()[A0_6387.select_name].item.tag)).item_id)).info.req_level or Config.TenNumber) * ((Items:One(string.format("serial = %d", A0_6387:Parent()[A0_6387.select_name].item.tag)).slevel or Config.ZeroNumber) + Config.OneNumber))
end
function Intensify.OnIntensifyStart(A0_6389, A1_6390)
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  if not Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) then
    return
  end
  if UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item then
  elseif (UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.level or Config.ZeroNumber) >= Config.MaxIntensifyLevel then
    return
  end
  if Possession:Sum("quantity", "limit = 0") < Config.IntensifyLevelGold * (UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.info.req_level or Config.TenNumber) * ((UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.slevel or Config.ZeroNumber) + Config.OneNumber) then
    return
  end
  Possession().belong = UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name
  Possession().quantity = -(Config.IntensifyLevelGold * (UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.info.req_level or Config.TenNumber) * ((UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.slevel or Config.ZeroNumber) + Config.OneNumber))
  Possession().limit = Config.ZeroNumber
  Possession().provenance = "intensify"
  Possession().comment = tostring(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.level or Config.ZeroNumber)
  if not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.sql_object, true, true) then
    return
  end
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.sql_object, true, true).site = "intensify"
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.sql_object, true, true).slot = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.sql_object, true, true).parent = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.sql_object, true, true).view.parent = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.fire = "Changed"
  UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.level = (UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.level or Config.ZeroNumber) + Config.OneNumber
  UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.slevel = (UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.slevel or Config.ZeroNumber) + Config.OneNumber
  UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.refresh_attr = true
  if UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.tradable and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IntensifyItemByInfo(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.sql_object, true, true).tradable or false then
    UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.tradable = false
  end
  Sound:PlayEffect("Music/Game/intensify_success.mp3")
  A0_6389:SetIntensifyView(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6389.select_name].item.sql_object)
end
function Intensify.OnItemDown(A0_6391, A1_6392)
  if not A0_6391:Parent()[string.sub(A1_6392.name, 2)].item then
    return
  end
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
  A0_6391.select_name, A0_6391.select_index = string.sub(A1_6392.name, 2), A1_6392.tag
  A0_6391.equip_show_count = 0
  if A0_6391:Parent().focus.tag == A1_6392.tag then
    return
  end
  A0_6391:SetIntensifyView(Items:One(string.format("serial = %d", A0_6391:Parent()[string.sub(A1_6392.name, 2)].item.tag)))
  A0_6391:Parent().focus.tag = A1_6392.tag
  A0_6391:Parent().focus.unactions = true
  A0_6391:Parent().focus.action = A0_6391:FocusAction()
  A0_6391:Parent().focus.visible = true
  A0_6391:Parent().focus.x = A0_6391:Parent()[string.sub(A1_6392.name, 2)].x
  A0_6391:Parent().focus.y = A0_6391:Parent()[string.sub(A1_6392.name, 2)].y
end
function Intensify.OnItemUp(A0_6393, A1_6394)
  A0_6393.equip_show_count = nil
end
function Intensify.OnVisible(A0_6395, A1_6396)
  if not A1_6396.visible then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  A1_6396.intensify.disable = true
  A1_6396.ilevel.visible = false
  A1_6396.focus.visible = false
  A1_6396.focus.tag = 0
  A1_6396.gold.visible = false
  A1_6396.animate.unactions = true
  A1_6396.intensify.visible = true
  A1_6396.bintensify.visible = false
  A1_6396.bind_title.visible = false
  A1_6396.bind_agree.visible = false
  A1_6396.sacrifice.visible = false
  A1_6396.avatar.copy = UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].proxy
  A1_6396.avatar.status = STATUS_FALL
  A1_6396.avatar.status = STATUS_STAND
  A1_6396.user_name.text = Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) and Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).name or ""
  A1_6396.sex.checked = UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.sex == 1
  A0_6395:RefreshEquipView()
end
function Intensify.OnUpdate(A0_6397, A1_6398)
  if not A0_6397.equip_show_count then
    return
  end
  A0_6397.equip_show_count = A0_6397.equip_show_count + A1_6398
  if A0_6397.equip_show_count < 1.0 then
    return
  end
  A0_6397.equip_show_count = nil
  if not A0_6397:Parent()[L0_6356[A0_6397.select_index]].item then
    return
  end
  if not Items:One(string.format("serial = %d", A0_6397:Parent()[L0_6356[A0_6397.select_index]].item.tag)) then
    return
  end
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(Items:One(string.format("serial = %d", A0_6397:Parent()[L0_6356[A0_6397.select_index]].item.tag)).item_id, Items:One(string.format("serial = %d", A0_6397:Parent()[L0_6356[A0_6397.select_index]].item.tag)).level, Items:One(string.format("serial = %d", A0_6397:Parent()[L0_6356[A0_6397.select_index]].item.tag)).slevel, Items:One(string.format("serial = %d", A0_6397:Parent()[L0_6356[A0_6397.select_index]].item.tag)).enchant, Items:One(string.format("serial = %d", A0_6397:Parent()[L0_6356[A0_6397.select_index]].item.tag)).stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
end
