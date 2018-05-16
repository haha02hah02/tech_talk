Class.Exchange.Script({})
function Exchange.Constructor(A0_6259, A1_6260)
  Script.Constructor(A0_6259, A1_6260)
  if not A1_6260 then
    return
  end
  A0_6259.iCurrentPage = 0
  A0_6259.iMaxPage = -1
  A0_6259.tExchangeList = {}
  A1_6260.on = {
    "Visible",
    A0_6259,
    A0_6259.OnVisible
  }
  A1_6260.search.on = {
    "Down",
    A0_6259,
    A0_6259.OnSearchDown
  }
  A1_6260.prev.on = {
    "Down",
    A0_6259,
    A0_6259.OnPrevDown
  }
  A1_6260.next.on = {
    "Down",
    A0_6259,
    A0_6259.OnNextDown
  }
  A1_6260[1].on = {
    "Buy",
    A0_6259,
    A0_6259.OnBuyDown
  }
  A1_6260[2].on = {
    "Buy",
    A0_6259,
    A0_6259.OnBuyDown
  }
  A1_6260[3].on = {
    "Buy",
    A0_6259,
    A0_6259.OnBuyDown
  }
  A1_6260[4].on = {
    "Buy",
    A0_6259,
    A0_6259.OnBuyDown
  }
  A1_6260[5].on = {
    "Buy",
    A0_6259,
    A0_6259.OnBuyDown
  }
  A1_6260[1].on = {
    "Show",
    A0_6259,
    A0_6259.OnShowDown
  }
  A1_6260[2].on = {
    "Show",
    A0_6259,
    A0_6259.OnShowDown
  }
  A1_6260[3].on = {
    "Show",
    A0_6259,
    A0_6259.OnShowDown
  }
  A1_6260[4].on = {
    "Show",
    A0_6259,
    A0_6259.OnShowDown
  }
  A1_6260[5].on = {
    "Show",
    A0_6259,
    A0_6259.OnShowDown
  }
end
function Exchange.SessionJob(A0_6261)
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  return UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.job, UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.major_job
end
function Exchange.OnExchangeItemChange(A0_6262)
  local L1_6263, L2_6264, L3_6265, L4_6266
  L1_6263 = A0_6262.tExchangeList
  if not L1_6263 then
    return
  end
  L3_6265 = A0_6262
  L2_6264 = A0_6262.Parent
  L2_6264 = L2_6264(L3_6265)
  L3_6265 = L2_6264.prev
  L4_6266 = A0_6262.iCurrentPage
  L4_6266 = L4_6266 ~= 0
  L3_6265.enable = L4_6266
  L3_6265 = L2_6264.next
  L4_6266 = A0_6262.iMaxPage
  L4_6266 = L4_6266 == -1 or L4_6266 < A0_6262.iMaxPage
  L3_6265.enable = L4_6266
  L3_6265 = A0_6262.iCurrentPage
  L3_6265 = L3_6265 * 5
  L3_6265 = L3_6265 + 1
  L4_6266 = A0_6262.iCurrentPage
  L4_6266 = L4_6266 + 1
  L4_6266 = L4_6266 * 5
  for _FORV_8_ = L3_6265, L4_6266 do
    if _FORV_8_ % 5 == 0 then
    end
    L2_6264[5 or _FORV_8_ % 5].info, L2_6264[5 or _FORV_8_ % 5].visible = L1_6263[_FORV_8_], L1_6263[_FORV_8_] ~= nil
  end
end
function Exchange.HandleExchangeData(A0_6267, A1_6268)
  local L2_6269, L3_6270, L4_6271, L5_6272, L6_6273, L7_6274, L8_6275
  L2_6269 = A0_6267.tExchangeList
  if not A1_6268 then
    A0_6267.iMaxPage = L3_6270
    return
  end
  for L6_6273 = 1, 20 do
    if L6_6273 == 1 then
      L8_6275 = A1_6268
      L7_6274 = A1_6268.First
      L7_6274 = L7_6274(L8_6275)
    elseif not L7_6274 then
      L8_6275 = A1_6268
      L7_6274 = A1_6268.Next
      L7_6274 = L7_6274(L8_6275)
    end
    if not L7_6274 then
      L8_6275 = math
      L8_6275 = L8_6275.floor
      L8_6275 = L8_6275(#L2_6269 / 5)
      A0_6267.iMaxPage = L8_6275
      break
    end
    L8_6275 = load
    L8_6275 = L8_6275("return " .. L7_6274)
    L8_6275 = L8_6275()
    table.insert(L2_6269, L8_6275)
  end
end
function Exchange.OnPrevDown(A0_6276)
  if A0_6276.iCurrentPage == 0 then
    return
  end
  A0_6276.iCurrentPage = A0_6276.iCurrentPage - 1
  A0_6276:OnExchangeItemChange()
end
function Exchange.OnNextDown(A0_6277)
  local L1_6278, L2_6279, L3_6280
  L1_6278 = A0_6277.iMaxPage
  if L1_6278 ~= -1 then
    L1_6278 = A0_6277.iCurrentPage
    L2_6279 = A0_6277.iMaxPage
    if L1_6278 >= L2_6279 then
      return
    end
  end
  L1_6278 = A0_6277.iCurrentPage
  L1_6278 = L1_6278 + 1
  A0_6277.iCurrentPage = L1_6278
  L1_6278 = A0_6277.iCurrentPage
  L1_6278 = L1_6278 + 1
  L1_6278 = L1_6278 * 5
  L2_6279 = A0_6277.tExchangeList
  L3_6280 = #L2_6279
  if L1_6278 <= L3_6280 then
    L3_6280 = A0_6277.OnExchangeItemChange
    L3_6280(A0_6277)
    return
  end
  L3_6280 = A0_6277.iMaxPage
  if L3_6280 ~= -1 then
    L3_6280 = A0_6277.iCurrentPage
    if L3_6280 >= A0_6277.iMaxPage then
      L3_6280 = A0_6277.OnExchangeItemChange
      L3_6280(A0_6277)
      return
    end
  end
  L3_6280 = A0_6277.SetLoading
  L3_6280(A0_6277, true)
  L3_6280 = A0_6277.tSearchData
  L3_6280.page = math.floor(L1_6278 / 20)
  L3_6280.amount = 20
  AdventureSDK:ExchangeGet(L3_6280, A0_6277, A0_6277.OnExchangeGet)
end
function Exchange.HandleBuyPrice(A0_6281, A1_6282)
  local L2_6283, L3_6284, L4_6285, L5_6286, L6_6287, L7_6288
  if not A1_6282 then
    return
  end
  L2_6283 = A1_6282.price
  if L2_6283 == 0 then
    return
  end
  L2_6283 = A1_6282.currency
  if L2_6283 == 0 then
    L2_6283 = Possession
  else
    L2_6283 = L2_6283 or Integral
  end
  L3_6284 = -2
  while true do
    L5_6286 = L2_6283
    L4_6285 = L2_6283.One
    L6_6287 = string
    L6_6287 = L6_6287.format
    L7_6288 = "serial = %d"
    L7_6288 = L6_6287(L7_6288, L3_6284)
    L4_6285 = L4_6285(L5_6286, L6_6287, L7_6288, L6_6287(L7_6288, L3_6284))
    if L4_6285 then
      L3_6284 = L3_6284 - 1
    end
  end
  L4_6285 = string
  L4_6285 = L4_6285.format
  L5_6286 = "%d%d%d0'system'"
  L6_6287 = L3_6284
  L7_6288 = A1_6282.belong
  L4_6285 = L4_6285(L5_6286, L6_6287, L7_6288, -A1_6282.price)
  L5_6286 = L4_6285.lower
  L6_6287 = SHA1String
  L7_6288 = L4_6285
  L7_6288 = L6_6287(L7_6288)
  L5_6286 = L5_6286(L6_6287, L7_6288, L6_6287(L7_6288))
  L6_6287 = A1_6282.currency
  if L6_6287 == 0 then
    L6_6287 = "Possession"
  else
    L6_6287 = L6_6287 or "Integral"
  end
  L7_6288 = L4_6285.format
  L7_6288 = L7_6288("insert.into.%s{serial = %d, belong = %s, quantity = %s, limit = 0, provenance = 'system', check_code = '%s'}", L6_6287, L3_6284, A1_6282.belong, -A1_6282.price, L5_6286)
  load("return " .. L7_6288)()
end
function Exchange.OnBuyResponse(A0_6289, A1_6290, A2_6291)
  local L3_6292, L4_6293, L5_6294, L6_6295, L7_6296, L8_6297, L9_6298, L10_6299
  L4_6293 = A0_6289
  L3_6292 = A0_6289.SetLoading
  L5_6294 = false
  L3_6292(L4_6293, L5_6294)
  L3_6292 = UniqueComponent
  L4_6293 = "Model/interface.model"
  L3_6292 = L3_6292(L4_6293)
  L4_6293 = L3_6292.node
  L4_6293 = L4_6293.Interface
  L5_6294 = L3_6292.ui
  L5_6294 = L5_6294.ibackpack
  L5_6294 = L5_6294.Backpack
  if A1_6290 == 400400 then
    L6_6295 = L4_6293.SetNotice
    L6_6295(L7_6296, L8_6297)
    return
  end
  if A1_6290 == 400700 then
    L6_6295 = L4_6293.SetNotice
    L6_6295(L7_6296, L8_6297)
    return
  end
  if A1_6290 ~= 0 then
    L6_6295 = L4_6293.SetNotice
    L6_6295(L7_6296, L8_6297)
    return
  end
  L6_6295 = A0_6289.HandleBuyPrice
  L6_6295(L7_6296, L8_6297)
  L6_6295 = load
  L6_6295 = L6_6295(L7_6296)
  L6_6295()
  L6_6295 = Items
  L6_6295 = L6_6295.One
  L10_6299 = A2_6291.identify
  L10_6299 = L8_6297(L9_6298, L10_6299)
  L6_6295 = L6_6295(L7_6296, L8_6297, L9_6298, L10_6299, L8_6297(L9_6298, L10_6299))
  for L10_6299, _FORV_11_ in L7_6296(L8_6297) do
    if _FORV_11_.identify == A2_6291.identify then
      table.remove(A0_6289.tExchangeList, L10_6299)
    end
  end
  L7_6296(L8_6297)
  if not L6_6295 then
    return
  end
  L10_6299 = L6_6295.item_id
  L10_6299 = L8_6297(L9_6298, L10_6299)
  L10_6299 = MakeItem
  L10_6299 = L10_6299(L6_6295)
  L8_6297(L9_6298, L10_6299, L10_6299(L6_6295))
  L10_6299 = 49
  L8_6297(L9_6298, L10_6299, L7_6296.info.name)
end
function Exchange.OnShowDown(A0_6300, A1_6301)
  if not A1_6301.info then
    return
  end
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(A1_6301.info.item_id, A1_6301.info.level, A1_6301.info.slevel, A1_6301.info.enchant, A1_6301.info.stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
end
function Exchange.OnBuyDown(A0_6302, A1_6303)
  local L2_6304, L3_6305, L4_6306, L5_6307, L6_6308
  L3_6305 = A0_6302
  L2_6304 = A0_6302.Parent
  L2_6304 = L2_6304(L3_6305)
  L3_6305 = L2_6304.loading
  L3_6305 = L3_6305.visible
  if L3_6305 then
    return
  end
  L3_6305 = UniqueComponent
  L4_6306 = "Model/interface.model"
  L3_6305 = L3_6305(L4_6306)
  L4_6306 = L3_6305.node
  L4_6306 = L4_6306.Interface
  L5_6307 = L3_6305.ui
  L5_6307 = L5_6307.ibackpack
  L5_6307 = L5_6307.Backpack
  L6_6308 = L5_6307.FreeGrid
  L6_6308 = L6_6308(L5_6307)
  if L6_6308 < 1 then
    L6_6308 = L4_6306.SetNotice
    L6_6308(L4_6306, 41)
    return
  end
  L6_6308 = SQLManager
  L6_6308 = L6_6308.IsClean
  L6_6308 = L6_6308(L6_6308)
  if not L6_6308 then
    L6_6308 = SQLManager
    L6_6308 = L6_6308.SyncToService
    L6_6308(L6_6308)
    L6_6308 = L4_6306.SetNotice
    L6_6308(L4_6306, 69)
    return
  end
  L6_6308 = JsonObject
  L6_6308 = L6_6308()
  L6_6308.identify = A1_6303.info.identify
  A0_6302:SetLoading(true)
  AdventureSDK:ExchangePurchase(L6_6308, A0_6302, A0_6302.OnBuyResponse)
end
function Exchange.OnExchangeGet(A0_6309, A1_6310, A2_6311)
  A0_6309:SetLoading(false)
  if A1_6310 ~= 0 then
    return
  end
  A0_6309:HandleExchangeData(A2_6311)
  A0_6309:OnExchangeItemChange()
end
function Exchange.LoadingAction(A0_6312)
  local L1_6313, L2_6314, L3_6315, L4_6316, L5_6317, L6_6318, L7_6319
  L1_6313 = Array
  L1_6313 = L1_6313()
  for L5_6317 = 0, 15 do
    L6_6318 = string
    L6_6318 = L6_6318.format
    L7_6319 = "UI/Base/loading.%d.ntp"
    L6_6318 = L6_6318(L7_6319, L5_6317)
    L7_6319 = Animate
    L7_6319 = L7_6319(L6_6318, 0, 0, 0.1)
    if L7_6319 then
      L1_6313:AddObject(L7_6319)
    end
  end
  L7_6319 = L3_6315(L4_6316)
  return L2_6314(L3_6315, L4_6316, L5_6317, L6_6318, L7_6319, L3_6315(L4_6316))
end
function Exchange.SetLoading(A0_6320, A1_6321)
  A0_6320:Parent().loading.visible = A1_6321
  A0_6320:Parent().load_limit.visible = A1_6321
  if not A1_6321 then
    return
  end
  A0_6320:Parent().loading.unactions = true
  A0_6320:Parent().loading.action = A0_6320:LoadingAction()
end
function Exchange.OnSearchDown(A0_6322, A1_6323)
  local L2_6324, L3_6325
  L3_6325 = A0_6322
  L2_6324 = A0_6322.Parent
  L2_6324 = L2_6324(L3_6325)
  L3_6325 = L2_6324.loading
  L3_6325 = L3_6325.visible
  if L3_6325 then
    return
  end
  L3_6325 = A0_6322.SetLoading
  L3_6325(A0_6322, true)
  A0_6322.iCurrentPage = 0
  A0_6322.iMaxPage = -1
  L3_6325 = {}
  A0_6322.tExchangeList = L3_6325
  L3_6325 = JsonObject
  L3_6325 = L3_6325()
  if not L2_6324.job.checked then
  else
  end
  L3_6325.job = A0_6322:SessionJob() or nil
  if not L2_6324.job.checked then
  else
  end
  L3_6325.major_job = A0_6322:SessionJob() or nil
  L3_6325.coin = not L2_6324.coin.checked
  L3_6325.integral = not L2_6324.integral.checked
  L3_6325.sort = not L2_6324.sort.checked
  A0_6322.tSearchData = L3_6325
  AdventureSDK:ExchangeGet(L3_6325, A0_6322, A0_6322.OnExchangeGet)
end
function Exchange.OnUpdate(A0_6326, A1_6327)
  A0_6326:Parent()[1].refresh = true
  A0_6326:Parent()[2].refresh = true
  A0_6326:Parent()[3].refresh = true
  A0_6326:Parent()[4].refresh = true
  A0_6326:Parent()[5].refresh = true
end
function Exchange.OnVisible(A0_6328, A1_6329)
  if not A1_6329.visible then
    Event:Off("Update", A0_6328, A0_6328.OnUpdate)
    return
  end
  A1_6329.prev.disable = true
  A1_6329.next.disable = true
  A1_6329[1].visible = false
  A1_6329[2].visible = false
  A1_6329[3].visible = false
  A1_6329[4].visible = false
  A1_6329[5].visible = false
  Event:On("Update", A0_6328, A0_6328.OnUpdate)
end
