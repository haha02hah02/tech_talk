L0_5747 = Class
L0_5747 = L0_5747.Backpack
L0_5747 = L0_5747.Script
L0_5747({})
L0_5747 = Backpack
function L0_5747.Constructor(A0_5748, A1_5749)
  Script.Constructor(A0_5748, A1_5749)
  if not A1_5749 then
    return
  end
  for _FORV_5_ = 1, Config.MaxBackpackGrid do
    A1_5749[_FORV_5_].on = {
      "Down",
      A0_5748,
      A0_5748.OnItemDown
    }
    A1_5749[_FORV_5_].on = {
      "Up",
      A0_5748,
      A0_5748.OnItemUp
    }
  end
  A1_5749.consume_1.on = {
    "Down",
    A0_5748,
    A0_5748.OnConsumeDown
  }
  A1_5749.consume_2.on = {
    "Down",
    A0_5748,
    A0_5748.OnConsumeDown
  }
  A1_5749.consume_3.on = {
    "Down",
    A0_5748,
    A0_5748.OnConsumeDown
  }
  A1_5749.sort.on = {
    "Down",
    A0_5748,
    A0_5748.OnSortDown
  }
  A1_5749.drop.on = {
    "Down",
    A0_5748,
    A0_5748.OnDropDown
  }
  A1_5749.recycle.on = {
    "Down",
    A0_5748,
    A0_5748.OnRecycleDown
  }
  A1_5749.sell.on = {
    "Down",
    A0_5748,
    A0_5748.OnSellDown
  }
  A1_5749.move.on = {
    "Down",
    A0_5748,
    A0_5748.OnMoveDown
  }
  A1_5749.compose.on = {
    "Down",
    A0_5748,
    A0_5748.OnComposeDown
  }
  A1_5749.on = {
    "Visible",
    A0_5748,
    A0_5748.OnVisible
  }
  A1_5749.on = {
    "Changed",
    A0_5748,
    A0_5748.OnBackpackChanged
  }
  A1_5749.price.on = {
    "Begin",
    A0_5748,
    A0_5748.OnSellPriceBegin
  }
  A1_5749.price.on = {
    "End",
    A0_5748,
    A0_5748.OnSellPriceEnd
  }
  Event:On("Update", A0_5748, A0_5748.OnUpdate)
end
L0_5747 = Backpack
function L0_5747.FocusAction(A0_5750)
  local L1_5751, L2_5752, L3_5753, L4_5754, L5_5755, L6_5756, L7_5757
  L1_5751 = Array
  L1_5751 = L1_5751()
  for L5_5755 = 0, 7 do
    L6_5756 = string
    L6_5756 = L6_5756.format
    L7_5757 = "UI/Select/%d.ntp"
    L6_5756 = L6_5756(L7_5757, L5_5755)
    L7_5757 = Animate
    L7_5757 = L7_5757(L6_5756, 0, 0, 0.15)
    if L7_5757 ~= nil then
      L1_5751:AddObject(L7_5757)
    end
  end
  L7_5757 = L3_5753(L4_5754)
  return L2_5752(L3_5753, L4_5754, L5_5755, L6_5756, L7_5757, L3_5753(L4_5754))
end
L0_5747 = Backpack
function L0_5747.FreeGrid(A0_5758)
  local L1_5759, L2_5760, L3_5761, L4_5762, L5_5763, L6_5764
  L1_5759 = 0
  L2_5760 = A0_5758.Parent
  L2_5760 = L2_5760(L3_5761)
  for L6_5764 = 1, L4_5762.MaxBackpackGrid do
    if not L2_5760[string.format("%d_bg", L6_5764)].item then
      L1_5759 = L1_5759 + 1
    end
  end
  return L1_5759
end
L0_5747 = Backpack
function L0_5747.CheckIncItemByID(A0_5765, A1_5766, A2_5767, A3_5768)
  local L4_5769, L5_5770, L6_5771, L7_5772, L8_5773, L9_5774, L10_5775
  if not A1_5766 or not A2_5767 then
    return
  end
  L4_5769 = LoadConf
  L5_5770 = string
  L5_5770 = L5_5770.format
  L6_5771 = "Item/%d.item"
  L10_5775 = L5_5770(L6_5771, L7_5772)
  L4_5769 = L4_5769(L5_5770, L6_5771, L7_5772, L8_5773, L9_5774, L10_5775, L5_5770(L6_5771, L7_5772))
  L5_5770 = L4_5769.info
  L6_5771 = L5_5770.stack
  if L6_5771 then
    L6_5771 = L5_5770.stack
    if L6_5771 > L7_5772 then
      L6_5771 = A0_5765.Parent
      L6_5771 = L6_5771(L7_5772)
      for L10_5775 = L7_5772.OneNumber, L8_5773.MaxBackpackGrid do
        if A2_5767 ~= Config.ZeroNumber then
          if L6_5771[string.format("%d_bg", L10_5775)].item and L6_5771[string.format("%d_bg", L10_5775)].item.id == A1_5766 and L6_5771[string.format("%d_bg", L10_5775)].item.tradable == A3_5768 and L6_5771[string.format("%d_bg", L10_5775)].item.stackable > Config.ZeroNumber then
            A2_5767 = A2_5767 - (A2_5767 or L6_5771[string.format("%d_bg", L10_5775)].item.stackable)
          end
        end
      end
    end
  end
  L6_5771 = A0_5765.session
  if L7_5772 then
  else
  end
  if A2_5767 == L8_5773 then
    return L8_5773
  end
  L10_5775 = A2_5767 / L7_5772
  L8_5773 = L8_5773 > L9_5774
  return L8_5773
end
L0_5747 = Backpack
function L0_5747.IncItemByID(A0_5776, A1_5777, A2_5778, A3_5779, A4_5780, ...)
  local L6_5782, L7_5783, L8_5784, L9_5785, L10_5786, L11_5787, L12_5788
  if not A1_5777 or not A2_5778 or not A4_5780 then
    return
  end
  L5_5781 = LoadConf
  L6_5782 = string
  L6_5782 = L6_5782.format
  L7_5783 = "Item/%d.item"
  L8_5784 = A1_5777
  L12_5788 = L6_5782(L7_5783, L8_5784)
  L5_5781 = L5_5781(L6_5782, L7_5783, L8_5784, L9_5785, L10_5786, L11_5787, L12_5788, L6_5782(L7_5783, L8_5784))
  L6_5782 = L5_5781.info
  L7_5783 = nil
  L8_5784 = L6_5782.stack
  if L8_5784 then
    L8_5784 = L6_5782.stack
    if L8_5784 > L9_5785 then
      L8_5784 = A0_5776.Parent
      L8_5784 = L8_5784(L9_5785)
      for L12_5788 = L9_5785.OneNumber, L10_5786.MaxBackpackGrid do
        if A2_5778 ~= Config.ZeroNumber then
          if L8_5784[string.format("%d_bg", L12_5788)].item and L8_5784[string.format("%d_bg", L12_5788)].item.id == A1_5777 and L8_5784[string.format("%d_bg", L12_5788)].item.tradable == A3_5779 and L8_5784[string.format("%d_bg", L12_5788)].item.stackable > Config.ZeroNumber then
            L8_5784[string.format("%d_bg", L12_5788)].item.amount = L8_5784[string.format("%d_bg", L12_5788)].item.amount + (A2_5778 or L8_5784[string.format("%d_bg", L12_5788)].item.stackable)
            L7_5783, A2_5778 = L8_5784[string.format("%d_bg", L12_5788)].item, A2_5778 - (A2_5778 or L8_5784[string.format("%d_bg", L12_5788)].item.stackable)
          end
        end
      end
    end
  end
  L8_5784 = A0_5776.session
  if L9_5785 then
  else
  end
  if A2_5778 == L10_5786 then
    return L10_5786, L11_5787
  end
  while true do
    if A2_5778 > L10_5786 then
      L10_5786 = A2_5778 > L9_5785 and L9_5785 or A2_5778
      L12_5788 = L8_5784.name
      L12_5788 = MakeItem
      L12_5788 = L12_5788(L11_5787)
      L12_5788.name = "item"
      L12_5788.view.name = "view"
      A2_5778 = A2_5778 - L10_5786
      if not A0_5776:Insert(L12_5788) then
        return
      end
      L7_5783 = L12_5788
    end
  end
  return L10_5786, L11_5787
end
L0_5747 = Backpack
function L0_5747.ItemAmountByID(A0_5789, A1_5790)
  local L2_5791, L3_5792, L4_5793, L5_5794, L6_5795, L7_5796
  L2_5791 = 0
  L3_5792 = A0_5789.Parent
  L3_5792 = L3_5792(L4_5793)
  for L7_5796 = 1, L5_5794.MaxBackpackGrid do
    if L3_5792[string.format("%d_bg", L7_5796)].item and L3_5792[string.format("%d_bg", L7_5796)].item.id == A1_5790 then
      L2_5791 = L2_5791 + L3_5792[string.format("%d_bg", L7_5796)].item.amount
    end
  end
  return L2_5791
end
L0_5747 = Backpack
function L0_5747.UseItemByID(A0_5797, A1_5798)
  local L2_5799, L3_5800, L4_5801, L5_5802, L6_5803
  L2_5799 = A0_5797.Parent
  L2_5799 = L2_5799(L3_5800)
  for L6_5803 = L3_5800.MaxBackpackGrid, 1, -1 do
    if L2_5799[string.format("%d_bg", L6_5803)].item and L2_5799[string.format("%d_bg", L6_5803)].item.id == A1_5798 then
      L2_5799[string.format("%d_bg", L6_5803)].item.use = A0_5797.session
      return
    end
  end
end
L0_5747 = Backpack
function L0_5747.ItemByID(A0_5804, A1_5805)
  local L2_5806, L3_5807, L4_5808, L5_5809, L6_5810
  L2_5806 = A0_5804.Parent
  L2_5806 = L2_5806(L3_5807)
  for L6_5810 = L3_5807.MaxBackpackGrid, 1, -1 do
    if L2_5806[string.format("%d_bg", L6_5810)].item and L2_5806[string.format("%d_bg", L6_5810)].item.id == A1_5805 then
      return L2_5806[string.format("%d_bg", L6_5810)].item
    end
  end
end
L0_5747 = Backpack
function L0_5747.ItemBySerial(A0_5811, A1_5812)
  local L2_5813, L3_5814, L4_5815, L5_5816, L6_5817
  L2_5813 = A0_5811.Parent
  L2_5813 = L2_5813(L3_5814)
  for L6_5817 = L3_5814.MaxBackpackGrid, 1, -1 do
    if L2_5813[string.format("%d_bg", L6_5817)].item and L2_5813[string.format("%d_bg", L6_5817)].item.serial == A1_5812 then
      return L2_5813[string.format("%d_bg", L6_5817)].item
    end
  end
end
L0_5747 = Backpack
function L0_5747.Insert(A0_5818, A1_5819)
  local L2_5820, L3_5821, L4_5822, L5_5823, L6_5824, L7_5825
  if not A1_5819 then
    return
  end
  L2_5820 = false
  L3_5821 = A0_5818.Parent
  L3_5821 = L3_5821(L4_5822)
  for L7_5825 = 1, L5_5823.MaxBackpackGrid do
    if not L3_5821[string.format("%d_bg", L7_5825)].item then
      A1_5819.name = "item"
      A1_5819.site = "backpack"
      A1_5819.parent, A1_5819.slot = L3_5821[string.format("%d_bg", L7_5825)], L7_5825
      A1_5819.view.x = 22
      A1_5819.view.y = 22
      A1_5819.view.name = "view"
      A1_5819.view.parent = L3_5821[string.format("%d_bg", L7_5825)]
      L2_5820 = true
      break
    end
  end
  if L2_5820 then
    L3_5821.fire = "Changed"
  end
  return L2_5820
end
function L0_5747(A0_5826, A1_5827)
  local L2_5828, L3_5829, L4_5830, L5_5831
  L2_5828 = A0_5826.id
  L3_5829 = A1_5827.id
  if L2_5828 ~= L3_5829 then
    L4_5830 = L2_5828 < L3_5829
    return L4_5830
  end
  L4_5830 = A0_5826.amount
  L4_5830 = L4_5830 or 1
  L5_5831 = A1_5827.amount
  L5_5831 = L5_5831 or 1
  L4_5830 = L4_5830 > L5_5831
  return L4_5830
end
function Backpack.OnSortDown(A0_5832, A1_5833)
  local L2_5834, L3_5835, L4_5836, L5_5837, L6_5838, L7_5839
  L3_5835 = A0_5832
  L2_5834 = A0_5832.Items
  L2_5834 = L2_5834(L3_5835)
  L3_5835 = table
  L3_5835 = L3_5835.sort
  L3_5835(L4_5836, L5_5837)
  L3_5835 = A0_5832.Parent
  L3_5835 = L3_5835(L4_5836)
  for L7_5839, _FORV_8_ in L4_5836(L5_5837) do
    if L3_5835[string.format("%d_bg", L7_5839)].item then
      L3_5835[string.format("%d_bg", L7_5839)].item.parent = nil
      L3_5835[string.format("%d_bg", L7_5839)].item.view.parent = nil
    end
    _FORV_8_.parent = L3_5835[string.format("%d_bg", L7_5839)]
    _FORV_8_.view.parent = L3_5835[string.format("%d_bg", L7_5839)]
    _FORV_8_.slot = L7_5839
  end
  if L4_5836 then
    L4_5836(L5_5837)
  end
end
function Backpack.OnDropDown(A0_5840, A1_5841)
  if not A0_5840:Parent()[string.format("%d_bg", A0_5840.select_index)].item or not A0_5840:Parent()[string.format("%d_bg", A0_5840.select_index)].item.dropable then
    return
  end
  A0_5840:Parent()[string.format("%d_bg", A0_5840.select_index)].item.drop = true
  A0_5840:Parent()[string.format("%d_bg", A0_5840.select_index)].item.parent = nil
  A0_5840:Parent()[string.format("%d_bg", A0_5840.select_index)].item.view.parent = nil
  Sound:PlayEffect("Music/Game/DropItem.mp3")
  A0_5840:Parent().fire = "Changed"
  if not A0_5840:Parent().focus.visible then
    return
  end
  A0_5840:CleanSelectStatus()
  A0_5840:Parent().focus.tag = 0
  A0_5840:Parent().drop.visible = false
end
function Backpack.OnRecycleDown(A0_5842, A1_5843)
  if not A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item or not A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.is_cash or not A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.price then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  if not Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)) then
    return
  end
  A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.sell = true
  A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.parent = nil
  A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.view.parent = nil
  A0_5842:Parent().fire = "Changed"
  Integral().belong = Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].name)).belong
  Integral().quantity = math.floor(A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.price * Config.RecycleDiscount)
  Integral().limit = A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.tradable and Config.ZeroNumber or Config.OneNumbe
  Integral().provenance = "csell"
  Integral().comment = tostring(A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.id)
  UniqueComponent("Model/interface.model").node.Interface:SetNotice(A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.tradable and 67 or 68, math.floor(A0_5842:Parent()[string.format("%d_bg", A0_5842.select_index)].item.price * Config.RecycleDiscount))
  if not A0_5842:Parent().focus.visible then
    return
  end
  A0_5842:CleanSelectStatus()
  A0_5842:Parent().focus.tag = 0
  A0_5842:Parent().recycle.visible = false
end
function Backpack.OnSellPriceBegin(A0_5844, A1_5845)
  A1_5845.text = string.gsub(A1_5845.text, ",", "")
end
function Backpack.OnSellPriceEnd(A0_5846, A1_5847)
  local L2_5848, L3_5849, L4_5850
  L3_5849 = A0_5846
  L2_5848 = A0_5846.Parent
  L2_5848 = L2_5848(L3_5849)
  L3_5849 = string
  L3_5849 = L3_5849.gsub
  L4_5850 = A1_5847.text
  L3_5849 = L3_5849(L4_5850, ",", "")
  L4_5850 = math
  L4_5850 = L4_5850.floor
  L4_5850 = L4_5850(tonumber(L3_5849) or Config.ZeroNumber)
  A1_5847.text = PriceFormat(L4_5850)
  L2_5848.sell.enable = L4_5850 > Config.ZeroNumber and L4_5850 < Config.MaxGold or false
end
function Backpack.OnSellDown(A0_5851, A1_5852)
  local L2_5853, L3_5854, L4_5855, L5_5856, L6_5857, L7_5858, L8_5859, L9_5860
  L3_5854 = A0_5851
  L2_5853 = A0_5851.Parent
  L2_5853 = L2_5853(L3_5854)
  L3_5854 = string
  L3_5854 = L3_5854.gsub
  L4_5855 = L2_5853.price
  L4_5855 = L4_5855.text
  L5_5856 = ","
  L6_5857 = ""
  L3_5854 = L3_5854(L4_5855, L5_5856, L6_5857)
  L4_5855 = math
  L4_5855 = L4_5855.floor
  L5_5856 = tonumber
  L6_5857 = L3_5854
  L5_5856 = L5_5856(L6_5857)
  if not L5_5856 then
    L5_5856 = Config
    L5_5856 = L5_5856.ZeroNumber
  end
  L4_5855 = L4_5855(L5_5856)
  L5_5856 = Config
  L5_5856 = L5_5856.OneNumber
  if not (L4_5855 < L5_5856) then
    L5_5856 = Config
    L5_5856 = L5_5856.MaxGold
  elseif L4_5855 > L5_5856 then
    return
  end
  L5_5856 = UniqueComponent
  L6_5857 = "Model/interface.model"
  L5_5856 = L5_5856(L6_5857)
  L6_5857 = L5_5856.node
  L6_5857 = L6_5857.Interface
  L7_5858 = SQLManager
  L8_5859 = L7_5858
  L7_5858 = L7_5858.IsClean
  L7_5858 = L7_5858(L8_5859)
  if not L7_5858 then
    L7_5858 = SQLManager
    L8_5859 = L7_5858
    L7_5858 = L7_5858.SyncToService
    L7_5858(L8_5859)
    L8_5859 = L6_5857
    L7_5858 = L6_5857.SetNotice
    L9_5860 = 69
    L7_5858(L8_5859, L9_5860)
    return
  end
  L8_5859 = A0_5851
  L7_5858 = A0_5851.Parent
  L7_5858 = L7_5858(L8_5859)
  L8_5859 = string
  L8_5859 = L8_5859.format
  L9_5860 = "%d_bg"
  L8_5859 = L8_5859(L9_5860, A0_5851.select_index)
  L8_5859 = L7_5858[L8_5859]
  L8_5859 = L8_5859.item
  if L8_5859 then
    L9_5860 = L8_5859.duration
    L9_5860 = L9_5860 or L8_5859.tradable
  elseif not L9_5860 then
    return
  end
  L9_5860 = L5_5856.ui
  L9_5860 = L9_5860.iloading
  L9_5860 = L9_5860.visible
  if L9_5860 then
    return
  end
  L9_5860 = L5_5856.ui
  L9_5860 = L9_5860.iloading
  L9_5860.visible = true
  L9_5860 = L8_5859.serial
  A0_5851.move_serial = L9_5860
  L9_5860 = JsonObject
  L9_5860 = L9_5860()
  L9_5860.serial = L8_5859.serial
  L9_5860.currency = L7_5858.currency.checked and Config.OneNumber or Config.ZeroNumber
  L9_5860.price = L4_5855
  L9_5860.req_job = L8_5859.req_job
  AdventureSDK:ExchangeSet(L9_5860, A0_5851, A0_5851.OnMoveResponse)
end
function Backpack.OnMoveResponse(A0_5861, A1_5862, A2_5863)
  UniqueComponent("Model/interface.model").ui.iloading.visible = false
  if A1_5862 == 400900 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(50)
    return
  end
  if A1_5862 ~= 0 then
    UniqueComponent("Model/interface.model").node.Interface:SetNotice(30)
    return
  end
  if not A0_5861:ItemBySerial(A0_5861.move_serial) then
    return
  end
  A0_5861:CleanSelectStatus()
  A0_5861:ItemBySerial(A0_5861.move_serial).parent = nil
  A0_5861:ItemBySerial(A0_5861.move_serial).view.parent = nil
  A0_5861:ItemBySerial(A0_5861.move_serial).site = "exchange"
  A0_5861:ItemBySerial(A0_5861.move_serial).slot = nil
  A0_5861:Parent().fire = "Changed"
  SQLManager:SyncToService()
  Sound:PlayEffect("Music/UI/BuyShopItem.mp3")
end
function Backpack.OnMoveDown(A0_5864, A1_5865)
  local L2_5866, L3_5867, L4_5868, L5_5869, L6_5870, L7_5871, L8_5872
  L2_5866 = Account
  L3_5867 = L2_5866
  L2_5866 = L2_5866.One
  L2_5866 = L2_5866(L3_5867)
  if L2_5866 then
    L3_5867 = L2_5866.moveable
  elseif not L3_5867 then
    L3_5867 = Config
    L3_5867 = L3_5867.ZeroNumber
  end
  L4_5868 = Config
  L4_5868 = L4_5868.OneNumber
  if L3_5867 < L4_5868 then
    return
  end
  L4_5868 = UniqueComponent
  L5_5869 = "Model/interface.model"
  L4_5868 = L4_5868(L5_5869)
  L5_5869 = L4_5868.node
  L5_5869 = L5_5869.Interface
  L6_5870 = SQLManager
  L7_5871 = L6_5870
  L6_5870 = L6_5870.IsClean
  L6_5870 = L6_5870(L7_5871)
  if not L6_5870 then
    L6_5870 = SQLManager
    L7_5871 = L6_5870
    L6_5870 = L6_5870.SyncToService
    L6_5870(L7_5871)
    L7_5871 = L5_5869
    L6_5870 = L5_5869.SetNotice
    L8_5872 = 69
    L6_5870(L7_5871, L8_5872)
    return
  end
  L7_5871 = A0_5864
  L6_5870 = A0_5864.Parent
  L6_5870 = L6_5870(L7_5871)
  L7_5871 = string
  L7_5871 = L7_5871.format
  L8_5872 = "%d_bg"
  L7_5871 = L7_5871(L8_5872, A0_5864.select_index)
  L7_5871 = L6_5870[L7_5871]
  L7_5871 = L7_5871.item
  if L7_5871 then
    L8_5872 = L7_5871.duration
  elseif L8_5872 then
    return
  end
  L8_5872 = L4_5868.ui
  L8_5872 = L8_5872.iloading
  L8_5872 = L8_5872.visible
  if L8_5872 then
    return
  end
  L8_5872 = L4_5868.ui
  L8_5872 = L8_5872.iloading
  L8_5872.visible = true
  L8_5872 = L7_5871.serial
  A0_5864.move_serial = L8_5872
  L8_5872 = JsonObject
  L8_5872 = L8_5872()
  L8_5872.serial = L7_5871.serial
  L8_5872.req_job = L7_5871.req_job
  L2_5866.moveable = L2_5866.moveable - Config.OneNumber
  AdventureSDK:ExchangeMove(L8_5872, A0_5864, A0_5864.OnMoveResponse)
end
function Backpack.OnComposeDown(A0_5873, A1_5874)
  if not A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item then
    return
  end
  if A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.id ~= Config.IntensifyItem and A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.id ~= Config.StochasticItem then
    return
  end
  if (A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.level or Config.ZeroNumber) >= Config.MaxIntensifyLevel - Config.OneNumber then
    return
  end
  if not A0_5873:IntensifyItemByInfo(A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.sql_object) then
    return
  end
  A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.level = A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.level + Config.OneNumber
  A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.slevel = A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.slevel + Config.OneNumber
  A0_5873:IntensifyItemByInfo(A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.sql_object).site = "compose"
  A0_5873:IntensifyItemByInfo(A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.sql_object).slot = nil
  A0_5873:IntensifyItemByInfo(A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.sql_object).parent = nil
  A0_5873:IntensifyItemByInfo(A0_5873:Parent()[string.format("%d_bg", A0_5873.select_index)].item.sql_object).view.parent = nil
  A0_5873.fire = "Changed"
  Sound:PlayEffect("Music/Game/intensify_success.mp3")
end
function Backpack.OnConsumeDown(A0_5875, A1_5876)
  local L2_5877, L3_5878, L4_5879, L5_5880, L6_5881, L7_5882, L8_5883
  L3_5878 = A0_5875
  L2_5877 = A0_5875.Parent
  L2_5877 = L2_5877(L3_5878)
  L3_5878 = UniqueComponent
  L4_5879 = "Model/interface.model"
  L3_5878 = L3_5878(L4_5879)
  L3_5878 = L3_5878.node
  L4_5879 = L2_5877.focus
  L4_5879 = L4_5879.visible
  if not L4_5879 then
    return
  end
  L4_5879 = string
  L4_5879 = L4_5879.format
  L5_5880 = "%d_bg"
  L6_5881 = A0_5875.select_index
  L4_5879 = L4_5879(L5_5880, L6_5881)
  L5_5880 = L2_5877[L4_5879]
  L6_5881 = L5_5880.item
  if L6_5881 then
    L7_5882 = L6_5881.class
  elseif L7_5882 ~= "Consume" then
    return
  end
  L7_5882 = A0_5875.session
  L8_5883 = Setting
  L8_5883 = L8_5883.One
  L8_5883 = L8_5883(L8_5883, string.format("belong = %d and name = 'consume'", L7_5882.name))
  if not L8_5883 then
    L8_5883 = Setting()
    L8_5883.name = "consume"
    L8_5883.data = {}
    L8_5883.belong = L7_5882.name
  end
  if L8_5883.data[1] == L6_5881.id and L3_5878.consume_1.item then
    L3_5878.consume_1.item.parent = nil
  end
  if L8_5883.data[2] == L6_5881.id and L3_5878.consume_2.item then
    L3_5878.consume_2.item.parent = nil
  end
  if L8_5883.data[3] == L6_5881.id and L3_5878.consume_3.item then
    L3_5878.consume_3.item.parent = nil
  end
  ;({})[1] = L8_5883.data[1] ~= L6_5881.id and L8_5883.data[1] or nil
  ;({})[2] = L8_5883.data[2] ~= L6_5881.id and L8_5883.data[2] or nil
  ;({})[3] = L8_5883.data[3] ~= L6_5881.id and L8_5883.data[3] or nil
  L8_5883.data, ({})[A1_5876.tag] = {}, L6_5881.id
  if L3_5878[string.format("consume_%d", A1_5876.tag)].item then
    L3_5878[string.format("consume_%d", A1_5876.tag)].item.parent = nil
  end
  ItemView(L6_5881.id, A0_5875:ItemAmountByID(L6_5881.id)).name = "item"
  ItemView(L6_5881.id, A0_5875:ItemAmountByID(L6_5881.id)).parent, ItemView(L6_5881.id, A0_5875:ItemAmountByID(L6_5881.id)).position = L3_5878[string.format("consume_%d", A1_5876.tag)], {0, 0}
end
function Backpack.CheckConsumeItem(A0_5884, A1_5885)
  local L2_5886
  if not A1_5885 then
    return
  end
  L2_5886 = A1_5885.class
  L2_5886 = L2_5886 == "Consume"
  if A0_5884:Parent().fconsume_1.visible == L2_5886 then
    return
  end
  A0_5884:Parent().fconsume_1.visible = L2_5886
  A0_5884:Parent().fconsume_2.visible = L2_5886
  A0_5884:Parent().fconsume_3.visible = L2_5886
  if not L2_5886 then
    return
  end
  A0_5884:Parent().fconsume_1.unactions = true
  A0_5884:Parent().fconsume_2.unactions = true
  A0_5884:Parent().fconsume_3.unactions = true
  A0_5884:Parent().fconsume_1.action = A0_5884:FocusAction()
  A0_5884:Parent().fconsume_2.action = A0_5884:FocusAction()
  A0_5884:Parent().fconsume_3.action = A0_5884:FocusAction()
end
function Backpack.CheckItemForButton(A0_5887, A1_5888)
  if (A1_5888.id == Config.IntensifyItem or A1_5888.id == Config.StochasticItem) and true or false then
  A0_5887:Parent().coin_icon.visible = not A1_5888.tradable and true or false
  A0_5887:Parent().coin_number.visible = not A1_5888.tradable and true or false
  A0_5887:Parent().lcoin_icon.visible = not A1_5888.tradable and true or false
  A0_5887:Parent().lcoin_number.visible = not A1_5888.tradable and true or false
  A0_5887:Parent().lcoin_bg.visible = not A1_5888.tradable and true or false
  A0_5887:Parent().currency.visible = not (not A1_5888.tradable and true or false)
  A0_5887:Parent().price.visible = not (not A1_5888.tradable and true or false)
  A0_5887:Parent().sell.visible = A1_5888.tradable and true or false
  A0_5887:Parent().sort.visible = ((Account:One() and Account:One().moveable or 0) < 1 or A1_5888.duration) and true or false
  A0_5887:Parent().recycle.visible = A1_5888.is_cash and not A1_5888.duration and true or false
  A0_5887:Parent().drop.visible = not A1_5888.is_cash and 1 > A1_5888.slevel and not (((A1_5888.level or 0) < Config.MaxIntensifyLevel - 1 or false) and A0_5887:IntensifyItemByInfo(A1_5888.sql_object) or nil) and true or false
  A0_5887:Parent().move.visible = 0 < (Account:One() and Account:One().moveable or 0) and not A1_5888.duration and true or false
  A0_5887:Parent().sell.disable = true
  A0_5887:Parent().price.text = ""
  A0_5887:Parent().compose.visible = (((A1_5888.level or 0) < Config.MaxIntensifyLevel - 1 or false) and A0_5887:IntensifyItemByInfo(A1_5888.sql_object) or nil) and true or false
end
function Backpack.CheckItemsExpire(A0_5889)
  local L1_5890
  L1_5890 = A0_5889.Items
  L1_5890 = L1_5890(A0_5889)
  for _FORV_6_, _FORV_7_ in ipairs(L1_5890) do
    if _FORV_7_.duration and _FORV_7_.ctime + _FORV_7_.duration < os.time() then
      _FORV_7_.parent = nil
      _FORV_7_.view.parent = nil
      _FORV_7_.site = "expire"
      _FORV_7_.slot = nil
    end
  end
  if not true then
    return
  end
  A0_5889:Parent().fire = "Changed"
end
function Backpack.OnItemDown(A0_5891, A1_5892)
  if not A0_5891:Parent()[string.format("%d_bg", A1_5892.tag)].item then
    return
  end
  A0_5891.show_item_count = 0
  A0_5891:CheckConsumeItem(A0_5891:Parent()[string.format("%d_bg", A1_5892.tag)].item)
  A0_5891:CheckItemForButton(A0_5891:Parent()[string.format("%d_bg", A1_5892.tag)].item)
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
  if A0_5891:Parent().focus.tag == A1_5892.tag then
    return
  end
  A0_5891.select_index = A1_5892.tag
  A0_5891:Parent().focus.unactions = true
  A0_5891:Parent().focus.action = A0_5891:FocusAction()
  A0_5891:Parent().focus.visible = true
  A0_5891:Parent().focus.x = A0_5891:Parent()[string.format("%d_bg", A1_5892.tag)].x
  A0_5891:Parent().focus.y = A0_5891:Parent()[string.format("%d_bg", A1_5892.tag)].y
end
function Backpack.OnItemUp(A0_5893, A1_5894)
  A0_5893:Parent().focus.tag = A1_5894.tag
  A0_5893.show_item_count = nil
  if A0_5893:Parent().focus.tag ~= A1_5894.tag then
    return
  end
  if not A0_5893:Parent()[string.format("%d_bg", A1_5894.tag)].item then
    return
  end
  if not A0_5893:Parent().parent.parent.parent then
    return
  end
  A0_5893:Parent()[string.format("%d_bg", A1_5894.tag)].item.use = A0_5893:Parent().parent.parent.parent.physical[A0_5893:Parent().parent.parent.parent.focus_object]
end
function Backpack.CheckItem(A0_5895, A1_5896)
  if not A1_5896 then
    return
  end
  A1_5896.name = "item"
  A1_5896.view.name = "view"
  if not A1_5896.slot then
    A0_5895:Insert(A1_5896)
    return
  end
  if A0_5895:Parent()[string.format("%d_bg", A1_5896.slot)].item then
    A0_5895:Insert(A1_5896)
    return
  end
  A1_5896.parent = A0_5895:Parent()[string.format("%d_bg", A1_5896.slot)]
  A1_5896.view.x = 22
  A1_5896.view.y = 22
  A1_5896.view.parent = A0_5895:Parent()[string.format("%d_bg", A1_5896.slot)]
end
function Backpack.Items(A0_5897)
  local L1_5898, L2_5899, L3_5900, L4_5901, L5_5902, L6_5903, L7_5904, L8_5905
  L1_5898 = {}
  L2_5899 = A0_5897.Parent
  L2_5899 = L2_5899(L3_5900)
  for L6_5903 = 1, L4_5901.MaxBackpackGrid do
    L7_5904 = string
    L7_5904 = L7_5904.format
    L8_5905 = "%d_bg"
    L7_5904 = L7_5904(L8_5905, L6_5903)
    L7_5904 = L2_5899[L7_5904]
    L8_5905 = L7_5904.item
    if L8_5905 then
      table.insert(L1_5898, L8_5905)
    end
  end
  return L1_5898
end
function Backpack.ShopItems(A0_5906)
  local L1_5907, L2_5908, L3_5909, L4_5910, L5_5911, L6_5912, L7_5913, L8_5914
  L1_5907 = {}
  L2_5908 = A0_5906.Parent
  L2_5908 = L2_5908(L3_5909)
  for L6_5912 = 1, L4_5910.MaxBackpackGrid do
    L7_5913 = string
    L7_5913 = L7_5913.format
    L8_5914 = "%d_bg"
    L7_5913 = L7_5913(L8_5914, L6_5912)
    L7_5913 = L2_5908[L7_5913]
    L8_5914 = L7_5913.item
    if L8_5914 and L8_5914.price and not L8_5914.is_cash then
      table.insert(L1_5907, L8_5914)
    end
  end
  return L1_5907
end
function Backpack.StorageItems(A0_5915)
  local L1_5916, L2_5917, L3_5918, L4_5919, L5_5920, L6_5921, L7_5922, L8_5923
  L1_5916 = {}
  L2_5917 = A0_5915.Parent
  L2_5917 = L2_5917(L3_5918)
  for L6_5921 = 1, L4_5919.MaxBackpackGrid do
    L7_5922 = string
    L7_5922 = L7_5922.format
    L8_5923 = "%d_bg"
    L7_5922 = L7_5922(L8_5923, L6_5921)
    L7_5922 = L2_5917[L7_5922]
    L8_5923 = L7_5922.item
    if L8_5923 and not L8_5923.is_cash then
      table.insert(L1_5916, L8_5923)
    end
  end
  return L1_5916
end
function Backpack.IsIntensifySuccess(A0_5924, A1_5925, A2_5926, A3_5927)
  if not A1_5925 then
    return
  end
  if A1_5925.serial == A2_5926.serial then
    return
  end
  if A1_5925.id ~= A2_5926.item_id then
    return
  end
  if A1_5925.level ~= A2_5926.level then
    return
  end
  if A1_5925.slevel ~= A2_5926.slevel then
    return
  end
  if not A3_5927 and A1_5925.tradable ~= A2_5926.tradable then
    return
  end
  return TypeToString(A1_5925.stochastic) == TypeToString(A2_5926.stochastic)
end
function Backpack.IsCurrencyIntensifyItem(A0_5928, A1_5929, A2_5930, A3_5931)
  local L4_5932, L5_5933
  if not A1_5929 then
    return
  end
  L4_5932 = A1_5929.serial
  L5_5933 = A2_5930.serial
  if L4_5932 == L5_5933 then
    return
  end
  L4_5932 = A1_5929.id
  L5_5933 = Config
  L5_5933 = L5_5933.IntensifyItem
  if L4_5932 ~= L5_5933 then
    return
  end
  L4_5932 = A1_5929.level
  L5_5933 = A2_5930.level
  if L4_5932 ~= L5_5933 then
    return
  end
  L4_5932 = A1_5929.slevel
  L5_5933 = A2_5930.slevel
  if L4_5932 ~= L5_5933 then
    return
  end
  L4_5932 = A3_5931 or L4_5932 == L5_5933
  return L4_5932
end
function Backpack.IntensifyItemByInfo(A0_5934, A1_5935, A2_5936, A3_5937)
  local L4_5938, L5_5939, L6_5940, L7_5941, L8_5942, L9_5943, L10_5944, L11_5945
  L5_5939 = A0_5934
  L4_5938 = A0_5934.Parent
  L4_5938 = L4_5938(L5_5939)
  L5_5939 = nil
  for L9_5943 = L6_5940.MaxBackpackGrid, 1, -1 do
    L10_5944 = string
    L10_5944 = L10_5944.format
    L11_5945 = "%d_bg"
    L10_5944 = L10_5944(L11_5945, L9_5943)
    L10_5944 = L4_5938[L10_5944]
    L11_5945 = L10_5944.item
    if L11_5945 and A0_5934:IsIntensifySuccess(L11_5945, A1_5935) then
      return L11_5945
    end
    if L11_5945 and A2_5936 and not L5_5939 and A0_5934:IsCurrencyIntensifyItem(L11_5945, A1_5935) then
      L5_5939 = L11_5945
    end
  end
  if not A3_5937 then
    return L5_5939
  end
  for L9_5943 = 1, L7_5941.MaxBackpackGrid do
    L10_5944 = string
    L10_5944 = L10_5944.format
    L11_5945 = "%d_bg"
    L10_5944 = L10_5944(L11_5945, L9_5943)
    L10_5944 = L4_5938[L10_5944]
    L11_5945 = L10_5944.item
    if L11_5945 and A0_5934:IsIntensifySuccess(L11_5945, A1_5935, A3_5937) then
      return L11_5945
    end
    if L11_5945 and A2_5936 and not L5_5939 and A0_5934:IsCurrencyIntensifyItem(L11_5945, A1_5935, A3_5937) then
      L5_5939 = L11_5945
    end
  end
  return L5_5939
end
function Backpack.IsCurrencyResetItem(A0_5946, A1_5947, A2_5948, A3_5949)
  local L4_5950, L5_5951
  if not A1_5947 then
    return
  end
  L4_5950 = A1_5947.serial
  L5_5951 = A2_5948.serial
  if L4_5950 == L5_5951 then
    return
  end
  L4_5950 = A1_5947.id
  L5_5951 = Config
  L5_5951 = L5_5951.StochasticItem
  if L4_5950 ~= L5_5951 then
    return
  end
  L4_5950 = A1_5947.level
  L5_5951 = A2_5948.level
  if L4_5950 ~= L5_5951 then
    return
  end
  L4_5950 = A1_5947.slevel
  L5_5951 = A2_5948.slevel
  if L4_5950 ~= L5_5951 then
    return
  end
  L4_5950 = A3_5949 or L4_5950 == L5_5951
  return L4_5950
end
function Backpack.ResetItemByInfo(A0_5952, A1_5953, A2_5954)
  local L3_5955, L4_5956, L5_5957, L6_5958, L7_5959, L8_5960, L9_5961, L10_5962, L11_5963
  L4_5956 = A0_5952
  L3_5955 = A0_5952.Parent
  L3_5955 = L3_5955(L4_5956)
  L4_5956, L5_5957 = nil, nil
  for L9_5961 = L6_5958.MaxBackpackGrid, 1, -1 do
    L10_5962 = string
    L10_5962 = L10_5962.format
    L11_5963 = "%d_bg"
    L10_5962 = L10_5962(L11_5963, L9_5961)
    L10_5962 = L3_5955[L10_5962]
    L11_5963 = L10_5962.item
    if L11_5963 and A0_5952:IsIntensifySuccess(L11_5963, A1_5953) then
      return L11_5963
    end
    if L11_5963 and not L4_5956 and A0_5952:IsIntensifySuccess(L11_5963, A1_5953, true) then
      L4_5956 = L11_5963
    end
  end
  for L9_5961 = L6_5958.MaxBackpackGrid, 1, -1 do
    L10_5962 = string
    L10_5962 = L10_5962.format
    L11_5963 = "%d_bg"
    L10_5962 = L10_5962(L11_5963, L9_5961)
    L10_5962 = L3_5955[L10_5962]
    L11_5963 = L10_5962.item
    if L11_5963 and A0_5952:IsCurrencyResetItem(L11_5963, A1_5953) then
      return L11_5963
    end
    if L11_5963 and not L5_5957 and A0_5952:IsCurrencyResetItem(L11_5963, A1_5953, true) then
      L5_5957 = L11_5963
    end
  end
  L6_5958 = L4_5956 or L5_5957
  return L6_5958
end
function Backpack.RefreshView(A0_5964)
  local L1_5965
  L1_5965 = A0_5964.Items
  L1_5965 = L1_5965(A0_5964)
  for _FORV_6_, _FORV_7_ in ipairs(L1_5965) do
    _FORV_7_.view.parent = A0_5964:Parent()[string.format("%d_bg", _FORV_7_.slot)]
  end
end
function Backpack.SetConsumeItem(A0_5966, A1_5967)
  local L2_5968
  L2_5968 = Setting
  L2_5968 = L2_5968.One
  L2_5968 = L2_5968(L2_5968, string.format("belong = %d and name = 'consume'", A1_5967.name))
  if UniqueComponent("Model/interface.model").node.consume_1.item then
    UniqueComponent("Model/interface.model").node.consume_1.item.parent = nil
  end
  if UniqueComponent("Model/interface.model").node.consume_2.item then
    UniqueComponent("Model/interface.model").node.consume_2.item.parent = nil
  end
  if UniqueComponent("Model/interface.model").node.consume_3.item then
    UniqueComponent("Model/interface.model").node.consume_3.item.parent = nil
  end
  if not L2_5968 then
    return
  end
  if L2_5968.data[1] then
    ItemView(L2_5968.data[1], A0_5966:ItemAmountByID(L2_5968.data[1])).name = "item"
    ItemView(L2_5968.data[1], A0_5966:ItemAmountByID(L2_5968.data[1])).parent, ItemView(L2_5968.data[1], A0_5966:ItemAmountByID(L2_5968.data[1])).position = UniqueComponent("Model/interface.model").node.consume_1, {0, 0}
  end
  if L2_5968.data[2] then
    ItemView(L2_5968.data[2], A0_5966:ItemAmountByID(L2_5968.data[2])).name = "item"
    ItemView(L2_5968.data[2], A0_5966:ItemAmountByID(L2_5968.data[2])).parent, ItemView(L2_5968.data[2], A0_5966:ItemAmountByID(L2_5968.data[2])).position = UniqueComponent("Model/interface.model").node.consume_2, {0, 0}
  end
  if L2_5968.data[3] then
    ItemView(L2_5968.data[3], A0_5966:ItemAmountByID(L2_5968.data[3])).name = "item"
    ItemView(L2_5968.data[3], A0_5966:ItemAmountByID(L2_5968.data[3])).parent, ItemView(L2_5968.data[3], A0_5966:ItemAmountByID(L2_5968.data[3])).position = UniqueComponent("Model/interface.model").node.consume_3, {0, 0}
  end
end
function Backpack.SetSession(A0_5969, A1_5970)
  local L2_5971, L3_5972, L4_5973, L5_5974, L6_5975, L7_5976, L8_5977, L9_5978
  L2_5971 = A0_5969.session
  if L2_5971 == A1_5970 then
    return
  end
  A0_5969.session = A1_5970
  L3_5972 = A0_5969
  L2_5971 = A0_5969.Parent
  L2_5971 = L2_5971(L3_5972)
  L3_5972 = A1_5970.name
  for L7_5976 = 1, L5_5974.MaxBackpackGrid do
    L8_5977 = string
    L8_5977 = L8_5977.format
    L8_5977 = L8_5977(L9_5978, L7_5976)
    L8_5977 = L2_5971[L8_5977]
    for _FORV_12_, _FORV_13_ in L9_5978(L8_5977.child.all) do
      _FORV_13_.parent = nil
    end
  end
  L8_5977 = L3_5972
  L8_5977 = L6_5975(L7_5976, L8_5977)
  for L8_5977, L9_5978 in L5_5974(L6_5975) do
    A0_5969:CheckItem(MakeItem(L9_5978))
  end
  L5_5974(L6_5975, L7_5976)
  L2_5971.fire = "Changed"
end
function Backpack.CleanSelectStatus(A0_5979)
  A0_5979:Parent().fconsume_1.visible = false
  A0_5979:Parent().fconsume_2.visible = false
  A0_5979:Parent().fconsume_3.visible = false
  A0_5979:Parent().focus.visible = false
  A0_5979:Parent().focus.visible = false
  A0_5979:Parent().focus.tag = 0
  A0_5979:Parent().drop.visible = false
  A0_5979:Parent().recycle.visible = false
  A0_5979:Parent().sell.visible = false
  A0_5979:Parent().move.visible = false
  A0_5979:Parent().sort.visible = true
  A0_5979:Parent().compose.visible = false
  A0_5979:Parent().coin_icon.visible = true
  A0_5979:Parent().coin_number.visible = true
  A0_5979:Parent().lcoin_icon.visible = true
  A0_5979:Parent().lcoin_number.visible = true
  A0_5979:Parent().lcoin_bg.visible = true
  A0_5979:Parent().currency.visible = false
  A0_5979:Parent().price.visible = false
  A0_5979:Parent().fconsume_1.visible = false
  A0_5979:Parent().fconsume_2.visible = false
  A0_5979:Parent().fconsume_3.visible = false
end
function Backpack.OnBackpackChanged(A0_5980, A1_5981)
  if UniqueComponent("Model/interface.model").node.consume_1.item then
    UniqueComponent("Model/interface.model").node.consume_1.item.amount = A0_5980:ItemAmountByID(UniqueComponent("Model/interface.model").node.consume_1.item.id)
  end
  if UniqueComponent("Model/interface.model").node.consume_2.item then
    UniqueComponent("Model/interface.model").node.consume_2.item.amount = A0_5980:ItemAmountByID(UniqueComponent("Model/interface.model").node.consume_2.item.id)
  end
  if UniqueComponent("Model/interface.model").node.consume_3.item then
    UniqueComponent("Model/interface.model").node.consume_3.item.amount = A0_5980:ItemAmountByID(UniqueComponent("Model/interface.model").node.consume_3.item.id)
  end
end
function Backpack.OnVisible(A0_5982, A1_5983)
  local L2_5984, L3_5985, L4_5986, L5_5987, L6_5988
  L2_5984 = A1_5983.visible
  if not L2_5984 then
    return
  end
  L3_5985 = A0_5982
  L2_5984 = A0_5982.Parent
  L2_5984 = L2_5984(L3_5985)
  L2_5984 = L2_5984.parent
  L2_5984 = L2_5984.parent
  L3_5985 = L2_5984.parent
  L4_5986 = A1_5983.focus
  L4_5986.visible = false
  L4_5986 = A1_5983.focus
  L4_5986.tag = 0
  L4_5986 = A1_5983.drop
  L4_5986.visible = false
  L4_5986 = A1_5983.recycle
  L4_5986.visible = false
  L4_5986 = A1_5983.sell
  L4_5986.visible = false
  L4_5986 = A1_5983.move
  L4_5986.visible = false
  L4_5986 = A1_5983.sort
  L4_5986.visible = true
  L4_5986 = A1_5983.compose
  L4_5986.visible = false
  L4_5986 = A1_5983.coin_icon
  L4_5986.visible = true
  L4_5986 = A1_5983.coin_number
  L4_5986.visible = true
  L4_5986 = A1_5983.lcoin_icon
  L4_5986.visible = true
  L4_5986 = A1_5983.lcoin_number
  L4_5986.visible = true
  L4_5986 = A1_5983.lcoin_bg
  L4_5986.visible = true
  L4_5986 = A1_5983.currency
  L4_5986.visible = false
  L4_5986 = A1_5983.price
  L4_5986.visible = false
  L4_5986 = A1_5983.fconsume_1
  L4_5986.visible = false
  L4_5986 = A1_5983.fconsume_2
  L4_5986.visible = false
  L4_5986 = A1_5983.fconsume_3
  L4_5986.visible = false
  L4_5986 = A0_5982.session
  if not L3_5985 or not L4_5986 then
    return
  end
  L5_5987 = Possession
  L6_5988 = L5_5987
  L5_5987 = L5_5987.Sum
  L5_5987 = L5_5987(L6_5988, "quantity", string.format("belong = %d and limit = 0", L4_5986.name))
  L6_5988 = Possession
  L6_5988 = L6_5988.Sum
  L6_5988 = L6_5988(L6_5988, "quantity", string.format("belong = %d and limit = 1", L4_5986.name))
  A1_5983.coin_number.text = PriceFormat(L5_5987)
  A1_5983.lcoin_number.text = PriceFormat(L6_5988)
end
function Backpack.OnUpdate(A0_5989, A1_5990)
  if not A0_5989.show_item_count then
    return
  end
  A0_5989.show_item_count = A0_5989.show_item_count + A1_5990
  if A0_5989.show_item_count < 1.0 then
    return
  end
  A0_5989.show_item_count = nil
  A0_5989:Parent().focus.tag = 0
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem(A0_5989:Parent()[string.format("%d_bg", A0_5989.select_index)].item.id, A0_5989:Parent()[string.format("%d_bg", A0_5989.select_index)].item.level, A0_5989:Parent()[string.format("%d_bg", A0_5989.select_index)].item.slevel, A0_5989:Parent()[string.format("%d_bg", A0_5989.select_index)].item.enchant, A0_5989:Parent()[string.format("%d_bg", A0_5989.select_index)].item.stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
end
