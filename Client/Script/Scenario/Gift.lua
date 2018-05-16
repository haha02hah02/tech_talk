Class.Gift.Script({})
function Gift.Constructor(A0_6330, A1_6331)
  Script.Constructor(A0_6330, A1_6331)
  if not A1_6331 then
    return
  end
  A1_6331.cdkey.on = {
    "End",
    A0_6330,
    A0_6330.OnCDKeyEnd
  }
  A1_6331.on = {
    "Visible",
    A0_6330,
    A0_6330.OnVisible
  }
  A1_6331.submit.on = {
    "Down",
    A0_6330,
    A0_6330.OnSubmitDown
  }
end
function Gift.LoadingAction(A0_6332)
  local L1_6333, L2_6334, L3_6335, L4_6336, L5_6337, L6_6338, L7_6339
  L1_6333 = Array
  L1_6333 = L1_6333()
  for L5_6337 = 0, 15 do
    L6_6338 = string
    L6_6338 = L6_6338.format
    L7_6339 = "UI/Base/loading.%d.ntp"
    L6_6338 = L6_6338(L7_6339, L5_6337)
    L7_6339 = Animate
    L7_6339 = L7_6339(L6_6338, 0, 0, 0.1)
    if L7_6339 then
      L1_6333:AddObject(L7_6339)
    end
  end
  L7_6339 = L3_6335(L4_6336)
  return L2_6334(L3_6335, L4_6336, L5_6337, L6_6338, L7_6339, L3_6335(L4_6336))
end
function Gift.SetLoading(A0_6340, A1_6341)
  A0_6340:Parent().loading.visible = A1_6341
  A0_6340:Parent().loading_limit.visible = A1_6341
  if not A1_6341 then
    return
  end
  A0_6340:Parent().loading.unactions = true
  A0_6340:Parent().loading.action = A0_6340:LoadingAction()
end
function Gift.OnCDKeyEnd(A0_6342, A1_6343)
  A0_6342:Parent().submit.enable = A1_6343.text ~= ""
end
function Gift.CreateSQLObject(A0_6344, A1_6345, A2_6346, A3_6347, A4_6348)
  Items().belong = A0_6344
  Items().item_id = A1_6345
  Items().level = 0
  Items().slevel = 0
  Items().amount = A2_6346
  Items().provenance = "cdkey"
  Items().comment = A4_6348
  Items().tradable = A3_6347
  return (Items())
end
function Gift.OnCDKeyResponse(A0_6349, A1_6350, A2_6351)
  A0_6349:SetLoading(false)
  A0_6349.bUpdating = false
  A0_6349:Parent().submit.enable = true
  if A1_6350 ~= 0 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(34)
    return
  end
  A0_6349:Parent().visible = false
  if A2_6351.type == "integral" then
    Integral().belong = A2_6351.belong
    Integral().provenance = "cdkey"
    Integral().comment = A0_6349:Parent().cdkey.text
    Integral().quantity = A2_6351.quantity
    Integral().limit = 0
    SQLManager:SyncToService()
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(35, Integral().quantity)
    return
  end
  if A2_6351.type ~= "item" then
    return
  end
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:IncItemByID(A2_6351.id, A2_6351.quantity, false, A0_6349.CreateSQLObject, A0_6349:Parent().cdkey.text)
  SQLManager:SyncToService()
  UniqueComponent("Model/interface.model").node.Interface:SetNotice(40, LoadConf(string.format("Item/%d.item", A2_6351.id)).info.name)
end
function Gift.OnSubmitDown(A0_6352, A1_6353)
  if A0_6352.bUpdating then
    return
  end
  if UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:FreeGrid() < 1 then
    UniqueComponent("Model/interface.model").Interface:SetNotice(41)
    return
  end
  A0_6352.bUpdating = true
  A0_6352:Parent().submit.disable = true
  A0_6352:SetLoading(true)
  AdventureSDK:CDKeyChange(A0_6352:Parent().cdkey.text, A0_6352, A0_6352.OnCDKeyResponse)
end
function Gift.OnVisible(A0_6354, A1_6355)
  if not A1_6355.visible then
    return
  end
  A0_6354:SetLoading(A0_6354.bUpdating)
  A1_6355.cdkey.text = ""
  A1_6355.submit.disable = true
end
