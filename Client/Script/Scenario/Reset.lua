L0_6832 = Class
L0_6832 = L0_6832.Reset
L0_6832 = L0_6832.Script
L0_6832({})
L0_6832 = {}
L0_6832[1] = "necklace"
L0_6832[2] = "accessory"
L0_6832[3] = "cap"
L0_6832[4] = "eardrop"
L0_6832[5] = "belt"
L0_6832[6] = "coat"
L0_6832[7] = "shoulder"
L0_6832[8] = "pants"
L0_6832[9] = "glove"
L0_6832[10] = "weapon"
L0_6832[11] = "assistant"
L0_6832[12] = "lring"
L0_6832[13] = "badge"
L0_6832[14] = "shoes"
L0_6832[15] = "cape"
L0_6832[16] = "rring"
for _FORV_5_, _FORV_6_ in ipairs(L0_6832) do
  ;({})[_FORV_6_] = _FORV_5_
end
function Reset.Constructor(A0_6833, A1_6834)
  local L2_6835, L3_6836, L4_6837, L5_6838, L6_6839
  L2_6835(L3_6836, L4_6837)
  if not A1_6834 then
    return
  end
  for L5_6838, L6_6839 in L2_6835(L3_6836) do
    A1_6834[string.format("b%s", L6_6839)].tag = L5_6838
    A1_6834[string.format("b%s", L6_6839)].on = {
      "Down",
      A0_6833,
      A0_6833.OnItemDown
    }
    A1_6834[string.format("b%s", L6_6839)].on = {
      "Up",
      A0_6833,
      A0_6833.OnItemUp
    }
  end
  L5_6838 = A0_6833.OnVisible
  A1_6834.on = L2_6835
  L5_6838 = A0_6833
  L6_6839 = A0_6833.OnBindAgreeCheck
  L2_6835.on = L3_6836
  L5_6838 = A0_6833
  L6_6839 = A0_6833.OnBindAgreeCheck
  L2_6835.on = L3_6836
  L5_6838 = A0_6833
  L6_6839 = A0_6833.OnResetStart
  L2_6835.on = L3_6836
  L5_6838 = A0_6833
  L6_6839 = A0_6833.OnResetStart
  L2_6835.on = L3_6836
  L5_6838 = A0_6833
  L6_6839 = A0_6833.OnUpdate
  L2_6835(L3_6836, L4_6837, L5_6838, L6_6839)
end
function Reset.FocusAction(A0_6840)
  local L1_6841, L2_6842, L3_6843, L4_6844, L5_6845, L6_6846, L7_6847
  L1_6841 = Array
  L1_6841 = L1_6841()
  for L5_6845 = 0, 7 do
    L6_6846 = string
    L6_6846 = L6_6846.format
    L7_6847 = "UI/Select/%d.ntp"
    L6_6846 = L6_6846(L7_6847, L5_6845)
    L7_6847 = Animate
    L7_6847 = L7_6847(L6_6846, 0, 0, 0.15)
    if L7_6847 ~= nil then
      L1_6841:AddObject(L7_6847)
    end
  end
  L7_6847 = L3_6843(L4_6844)
  return L2_6842(L3_6843, L4_6844, L5_6845, L6_6846, L7_6847, L3_6843(L4_6844))
end
function Reset.RefreshEquipView(A0_6848)
  local L1_6849, L2_6850, L3_6851, L4_6852, L5_6853
  L1_6849 = A0_6848.Parent
  L1_6849 = L1_6849(L2_6850)
  for L5_6853, _FORV_6_ in L2_6850(L3_6851) do
    if L1_6849[_FORV_6_].item then
      L1_6849[_FORV_6_].item.parent = nil
    end
  end
  if not L3_6851 then
    return
  end
  L5_6853 = L3_6851.focus_object
  if not L4_6852 then
    return
  end
  L5_6853 = Items
  L5_6853 = L5_6853.Find
  L5_6853 = L5_6853(L5_6853, string.format("belong = %d and site = 'equips'", L4_6852.name))
  for _FORV_9_, _FORV_10_ in pairs(L5_6853) do
    ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).name = "item"
    ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).x = 20
    ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).y = 20
    ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).parent, ItemView(_FORV_10_.item_id, _FORV_10_.amount, _FORV_10_.stochastic).tag = L1_6849[LoadConf(string.format("Item/%d.item", _FORV_10_.item_id)).info.type], _FORV_10_.serial
  end
end
function Reset.SetResetView(A0_6854, A1_6855)
  local L2_6856, L3_6857, L4_6858, L5_6859, L6_6860, L7_6861
  L3_6857 = A0_6854
  L2_6856 = A0_6854.Parent
  L2_6856 = L2_6856(L3_6857)
  L3_6857 = LoadConf
  L4_6858 = string
  L4_6858 = L4_6858.format
  L5_6859 = "Item/%d.item"
  L6_6860 = A1_6855.item_id
  L7_6861 = L4_6858(L5_6859, L6_6860)
  L3_6857 = L3_6857(L4_6858, L5_6859, L6_6860, L7_6861, L4_6858(L5_6859, L6_6860))
  L3_6857 = L3_6857.info
  L4_6858 = L3_6857.req_level
  L4_6858 = L4_6858 or 10
  L5_6859 = A1_6855.slevel
  if not L5_6859 then
    L5_6859 = Config
    L5_6859 = L5_6859.ZeroNumber
  end
  L6_6860 = Possession
  L7_6861 = L6_6860
  L6_6860 = L6_6860.Sum
  L6_6860 = L6_6860(L7_6861, "quantity", "limit = 0")
  L7_6861 = Config
  L7_6861 = L7_6861.ResetLevelGold
  L7_6861 = L7_6861 * L4_6858
  L7_6861 = L7_6861 * (L5_6859 + Config.OneNumber)
  L2_6856.gold.visible = true
  L2_6856.gold.text = PriceFormat(L7_6861)
  L2_6856.gold.color = L6_6860 < L7_6861 and 4278190335 or 269488383
  L2_6856.ilevel.text = string.format(":%d", L5_6859)
  L2_6856.ilevel.visible = true
  L2_6856.reset.disable = (not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855) or L6_6860 < L7_6861) and true or false
  L2_6856.reset.visible = not (UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855) and A1_6855.tradable and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855).tradable or false)
  L2_6856.breset.visible = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855) and A1_6855.tradable and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855).tradable or false
  L2_6856.breset.disable = true
  L2_6856.bind_title.visible = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855) and A1_6855.tradable and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855).tradable or false
  L2_6856.bind_agree.visible = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855) and A1_6855.tradable and not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855).tradable or false
  L2_6856.bind_agree.checked = false
  L2_6856.sacrifice.visible = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855) and true or false
  if not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855) then
    return
  end
  L2_6856.animate.unactions = true
  L2_6856.animate.action = RepeatForever(RotateBy(0.5, 10))
  L2_6856.sacrifice.texture = string.format("Item/%d.icon", UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(A1_6855).id)
end
function Reset.OnBindAgreeCheck(A0_6862, A1_6863)
  if not A0_6862:Parent()[A0_6862.select_name].item then
    return
  end
  if A1_6863.checked then
    A0_6862:Parent().breset.disable = true
    return
  end
  A0_6862:Parent().breset.enable = not (Possession:Sum("quantity", "limit = 0") < Config.ResetLevelGold * (LoadConf(string.format("Item/%d.item", Items:One(string.format("serial = %d", A0_6862:Parent()[A0_6862.select_name].item.tag)).item_id)).info.req_level or Config.TenNumber) * ((Items:One(string.format("serial = %d", A0_6862:Parent()[A0_6862.select_name].item.tag)).slevel or Config.ZeroNumber) + Config.OneNumber))
end
function Reset.LoadingAction(A0_6864)
  local L1_6865, L2_6866, L3_6867, L4_6868, L5_6869, L6_6870, L7_6871
  L1_6865 = Array
  L1_6865 = L1_6865()
  for L5_6869 = 0, 15 do
    L6_6870 = string
    L6_6870 = L6_6870.format
    L7_6871 = "UI/Base/loading.%d.ntp"
    L6_6870 = L6_6870(L7_6871, L5_6869)
    L7_6871 = Animate
    L7_6871 = L7_6871(L6_6870, 0, 0, 0.1)
    if L7_6871 then
      L1_6865:AddObject(L7_6871)
    end
  end
  L7_6871 = L3_6867(L4_6868)
  return L2_6866(L3_6867, L4_6868, L5_6869, L6_6870, L7_6871, L3_6867(L4_6868))
end
function Reset.SetLoading(A0_6872, A1_6873)
  A0_6872:Parent().loading.visible = A1_6873
  A0_6872:Parent().load_limit.visible = A1_6873
  if not A1_6873 then
    return
  end
  A0_6872:Parent().loading.unactions = true
  A0_6872:Parent().loading.action = A0_6872:LoadingAction()
end
function Reset.OnResetResponse(A0_6874, A1_6875, A2_6876)
  A0_6874:SetLoading(false)
  A0_6874.reset_update = false
  A0_6874.reset_equip = nil
  A0_6874.reset_sacrifice = nil
  A0_6874.session = nil
  if A1_6875 == -1 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(55)
    return
  end
  if A1_6875 ~= 0 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(55)
    SQLManager:SyncToService()
    return
  end
  Possession().belong = A0_6874.session.name
  Possession().quantity = -(Config.ResetLevelGold * (A0_6874.reset_equip.info.req_level or Config.TenNumber) * ((A0_6874.reset_equip.slevel or Config.ZeroNumber) + Config.OneNumber))
  Possession().limit = Config.ZeroNumber
  Possession().provenance = "reset"
  Possession().comment = tostring(A0_6874.reset_equip.level or Config.ZeroNumber)
  A0_6874.reset_sacrifice.site = "reset"
  A0_6874.reset_sacrifice.slot = nil
  A0_6874.reset_sacrifice.parent = nil
  A0_6874.reset_sacrifice.view.parent = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.fire = "Changed"
  A0_6874.reset_equip.resetting = true
  if A0_6874.reset_equip.tradable and not A0_6874.reset_sacrifice.tradable or false then
    A0_6874.reset_equip.tradable = false
  end
  A0_6874:Parent()[A0_6874.reset_equip.type].item.stochastic = A0_6874.reset_equip.stochastic
  Sound:PlayEffect("Music/Game/intensify_success.mp3")
  A0_6874:SetResetView(A0_6874.reset_equip.sql_object)
  SQLManager:SyncToService()
end
function Reset.OnResetStart(A0_6877, A1_6878)
  if A0_6877.reset_update then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  if Possession:Sum("quantity", "limit = 0") < Config.ResetLevelGold * (UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6877.select_name].item.info.req_level or Config.TenNumber) * ((UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6877.select_name].item.slevel or Config.ZeroNumber) + Config.OneNumber) then
    return
  end
  if not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6877.select_name].item.sql_object) then
    return
  end
  A0_6877:SetLoading(true)
  A0_6877.reset_sacrifice, A0_6877.reset_equip, A0_6877.session = UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6877.select_name].item.sql_object), UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6877.select_name].item, UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object]
  A0_6877.reset_update = true
  AdventureSDK:Resetting(UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:ResetItemByInfo(UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Parent()[A0_6877.select_name].item.sql_object).serial, A0_6877, A0_6877.OnResetResponse)
end
function Reset.OnItemDown(A0_6879, A1_6880)
  if not A0_6879:Parent()[string.sub(A1_6880.name, 2)].item then
    return
  end
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
  A0_6879.select_name, A0_6879.select_index = string.sub(A1_6880.name, 2), A1_6880.tag
  A0_6879.equip_show_count = 0
  if A0_6879:Parent().focus.tag == A1_6880.tag then
    return
  end
  A0_6879:SetResetView(Items:One(string.format("serial = %d", A0_6879:Parent()[string.sub(A1_6880.name, 2)].item.tag)))
  A0_6879:Parent().focus.tag = A1_6880.tag
  A0_6879:Parent().focus.unactions = true
  A0_6879:Parent().focus.action = A0_6879:FocusAction()
  A0_6879:Parent().focus.visible = true
  A0_6879:Parent().focus.x = A0_6879:Parent()[string.sub(A1_6880.name, 2)].x
  A0_6879:Parent().focus.y = A0_6879:Parent()[string.sub(A1_6880.name, 2)].y
end
function Reset.OnItemUp(A0_6881, A1_6882)
  A0_6881.equip_show_count = nil
end
function Reset.OnVisible(A0_6883, A1_6884)
  if not A1_6884.visible then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  A1_6884.reset.disable = true
  A1_6884.ilevel.visible = false
  A1_6884.focus.visible = false
  A1_6884.focus.tag = 0
  A1_6884.gold.visible = false
  A1_6884.animate.unactions = true
  A1_6884.reset.visible = true
  A1_6884.breset.visible = false
  A1_6884.sacrifice.visible = false
  A1_6884.bind_title.visible = false
  A1_6884.bind_agree.visible = false
  A1_6884.avatar.copy = UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].proxy
  A1_6884.avatar.status = STATUS_FALL
  A1_6884.avatar.status = STATUS_STAND
  A1_6884.user_name.text = Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) and Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).name or ""
  A1_6884.sex.checked = UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.sex == 1
  A0_6883:RefreshEquipView()
end
function Reset.OnUpdate(A0_6885, A1_6886)
  if not A0_6885.equip_show_count then
    return
  end
  A0_6885.equip_show_count = A0_6885.equip_show_count + A1_6886
  if A0_6885.equip_show_count < 1.0 then
    return
  end
  A0_6885.equip_show_count = nil
  if not A0_6885:Parent()[L0_6832[A0_6885.select_index]].item then
    return
  end
  if not Items:One(string.format("serial = %d", A0_6885:Parent()[L0_6832[A0_6885.select_index]].item.tag)) then
    return
  end
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(Items:One(string.format("serial = %d", A0_6885:Parent()[L0_6832[A0_6885.select_index]].item.tag)).item_id, Items:One(string.format("serial = %d", A0_6885:Parent()[L0_6832[A0_6885.select_index]].item.tag)).level, Items:One(string.format("serial = %d", A0_6885:Parent()[L0_6832[A0_6885.select_index]].item.tag)).slevel, Items:One(string.format("serial = %d", A0_6885:Parent()[L0_6832[A0_6885.select_index]].item.tag)).enchant, Items:One(string.format("serial = %d", A0_6885:Parent()[L0_6832[A0_6885.select_index]].item.tag)).stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
end
