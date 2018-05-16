Class.LRanking.Script({})
function LRanking.Constructor(A0_6675, A1_6676)
  Script.Constructor(A0_6675, A1_6676)
  A1_6676.on = {
    "Visible",
    A0_6675,
    A0_6675.OnVisible
  }
  A1_6676.prev.on = {
    "Down",
    A0_6675,
    A0_6675.OnPrevDown
  }
  A1_6676.next.on = {
    "Down",
    A0_6675,
    A0_6675.OnNextDown
  }
  A1_6676.all.on = {
    "Down",
    A0_6675,
    A0_6675.OnAllDown
  }
  A1_6676.job.on = {
    "Down",
    A0_6675,
    A0_6675.OnJobDown
  }
end
function LRanking.LoadingAction(A0_6677)
  local L1_6678, L2_6679, L3_6680, L4_6681, L5_6682, L6_6683, L7_6684
  L1_6678 = Array
  L1_6678 = L1_6678()
  for L5_6682 = 0, 15 do
    L6_6683 = string
    L6_6683 = L6_6683.format
    L7_6684 = "UI/Base/loading.%d.ntp"
    L6_6683 = L6_6683(L7_6684, L5_6682)
    L7_6684 = Animate
    L7_6684 = L7_6684(L6_6683, 0, 0, 0.1)
    if L7_6684 then
      L1_6678:AddObject(L7_6684)
    end
  end
  L7_6684 = L3_6680(L4_6681)
  return L2_6679(L3_6680, L4_6681, L5_6682, L6_6683, L7_6684, L3_6680(L4_6681))
end
function LRanking.SetLoading(A0_6685, A1_6686)
  A0_6685:Parent().loading.visible = A1_6686
  A0_6685:Parent().loading_limit.visible = A1_6686
  if not A1_6686 then
    return
  end
  A0_6685:Parent().loading.unactions = true
  A0_6685:Parent().loading.action = A0_6685:LoadingAction()
end
function LRanking.ReviewRanking(A0_6687)
  local L1_6688, L2_6689, L3_6690, L4_6691, L5_6692, L6_6693, L7_6694, L8_6695, L9_6696, L10_6697, L11_6698, L12_6699, L13_6700
  L2_6689 = A0_6687
  L1_6688 = A0_6687.Parent
  L1_6688 = L1_6688(L2_6689)
  L2_6689 = L1_6688.bg
  L2_6689 = L2_6689.visible
  if L2_6689 then
    L2_6689 = A0_6687.tAllList
  else
    L2_6689 = L2_6689 or A0_6687.tJobList
  end
  L3_6690 = L1_6688.bg
  L3_6690 = L3_6690.visible
  if L3_6690 then
    L3_6690 = A0_6687.iCurrentAllPage
  else
    L3_6690 = L3_6690 or A0_6687.iCurrentJobPage
  end
  L4_6691 = L1_6688.bg
  L4_6691 = L4_6691.visible
  if L4_6691 then
    L4_6691 = A0_6687.iMaxAllPage
  else
    L4_6691 = L4_6691 or A0_6687.iMaxJobPage
  end
  L5_6692 = L1_6688.prev
  L6_6693 = L3_6690 ~= 0
  L5_6692.enable = L6_6693
  L5_6692 = L1_6688.next
  L6_6693 = L4_6691 == -1 or L3_6690 < L4_6691
  L5_6692.enable = L6_6693
  L5_6692 = L3_6690 * 10
  L5_6692 = L5_6692 + 1
  L6_6693 = L3_6690 + 1
  L6_6693 = L6_6693 * 10
  L7_6694 = LoadConf
  L7_6694 = L7_6694(L8_6695)
  if L6_6693 > 90 then
    L8_6695.disable = true
  end
  for L11_6698 = L5_6692, L6_6693 do
    L12_6699 = L2_6689[L11_6698]
    L13_6700 = L11_6698 % 10
    if L13_6700 == 0 then
      L13_6700 = 10
    end
    if L12_6699 ~= nil then
      L1_6688[string.format("%d_name", L13_6700)].text = L12_6699.name
      L1_6688[string.format("%d_job", L13_6700)].text = L7_6694[L12_6699.job].attribute.name
      L1_6688[string.format("%d_level", L13_6700)].text = tostring(L12_6699.level)
      L1_6688[string.format("%d_rank", L13_6700)].text = tostring(L3_6690 * 10 + L13_6700)
    end
    L1_6688[string.format("%d_rank", L13_6700)].visible, L1_6688[string.format("%d_level", L13_6700)].visible, L1_6688[string.format("%d_job", L13_6700)].visible, L1_6688[string.format("%d_name", L13_6700)].visible = L12_6699 and true or false, L12_6699 and true or false, L12_6699 and true or false, L12_6699 and true or false
  end
end
function LRanking.OnPrevDown(A0_6701)
  if (A0_6701:Parent().bg.visible and A0_6701.iCurrentAllPage or A0_6701.iCurrentJobPage) == 0 then
    return
  end
  A0_6701[A0_6701:Parent().bg.visible and "iCurrentAllPage" or "iCurrentJobPage"] = (A0_6701:Parent().bg.visible and A0_6701.iCurrentAllPage or A0_6701.iCurrentJobPage) - 1
  A0_6701:ReviewRanking()
end
function LRanking.OnNextDown(A0_6702)
  local L1_6703, L2_6704, L3_6705, L4_6706, L5_6707, L6_6708, L7_6709, L8_6710, L9_6711, L10_6712, L11_6713
  L2_6704 = A0_6702
  L1_6703 = A0_6702.Parent
  L1_6703 = L1_6703(L2_6704)
  L2_6704 = L1_6703.bg
  L2_6704 = L2_6704.visible
  if L2_6704 then
    L2_6704 = A0_6702.iCurrentAllPage
  else
    L2_6704 = L2_6704 or A0_6702.iCurrentJobPage
  end
  L3_6705 = L1_6703.bg
  L3_6705 = L3_6705.visible
  if L3_6705 then
    L3_6705 = A0_6702.iMaxAllPage
  else
    L3_6705 = L3_6705 or A0_6702.iMaxJobPage
  end
  L4_6706 = L1_6703.bg
  L4_6706 = L4_6706.visible
  if L4_6706 then
    L4_6706 = "iCurrentAllPage"
  else
    L4_6706 = L4_6706 or "iCurrentJobPage"
  end
  if L3_6705 ~= -1 and L2_6704 >= L3_6705 then
    return
  end
  L2_6704 = L2_6704 + 1
  A0_6702[L4_6706] = L2_6704
  L5_6707 = L2_6704 + 1
  L5_6707 = L5_6707 * 10
  L6_6708 = L1_6703.bg
  L6_6708 = L6_6708.visible
  if L6_6708 then
    L6_6708 = A0_6702.tAllList
  else
    L6_6708 = L6_6708 or A0_6702.tJobList
  end
  L7_6709 = #L6_6708
  if L5_6707 <= L7_6709 then
    L8_6710 = A0_6702
    L7_6709 = A0_6702.ReviewRanking
    L7_6709(L8_6710)
    return
  end
  if L3_6705 ~= -1 and L3_6705 <= L2_6704 then
    L8_6710 = A0_6702
    L7_6709 = A0_6702.ReviewRanking
    L7_6709(L8_6710)
    return
  end
  L7_6709 = UniqueComponent
  L8_6710 = "Model/interface.model"
  L7_6709 = L7_6709(L8_6710)
  L8_6710 = L7_6709.parent
  L9_6711 = Userinfo
  L10_6712 = L9_6711
  L9_6711 = L9_6711.One
  L11_6713 = string
  L11_6713 = L11_6713.format
  L11_6713 = L11_6713("serial = %d", L8_6710.focus_object)
  L9_6711 = L9_6711(L10_6712, L11_6713, L11_6713("serial = %d", L8_6710.focus_object))
  L10_6712 = L1_6703.bg
  L10_6712 = L10_6712.visible
  if L10_6712 then
    L10_6712 = 0
  else
    L10_6712 = L10_6712 or L9_6711.job
  end
  L11_6713 = L1_6703.bg
  L11_6713 = L11_6713.visible
  if L11_6713 then
    L11_6713 = A0_6702.OnRankingAllResponse
  else
    L11_6713 = L11_6713 or A0_6702.OnRankingJobResponse
  end
  A0_6702:SetLoading(true)
  AdventureSDK:LevelRanking(math.floor(L5_6707 / 20), 20, L10_6712, A0_6702, L11_6713)
end
function LRanking.HandleAllData(A0_6714, A1_6715)
  local L2_6716, L3_6717, L4_6718, L5_6719, L6_6720, L7_6721, L8_6722
  L2_6716 = A0_6714.tAllList
  if not A1_6715 then
    A0_6714.iMaxAllPage = L3_6717
    return
  end
  for L6_6720 = 1, 20 do
    if L6_6720 == 1 then
      L8_6722 = A1_6715
      L7_6721 = A1_6715.First
      L7_6721 = L7_6721(L8_6722)
    elseif not L7_6721 then
      L8_6722 = A1_6715
      L7_6721 = A1_6715.Next
      L7_6721 = L7_6721(L8_6722)
    end
    if not L7_6721 then
      L8_6722 = math
      L8_6722 = L8_6722.floor
      L8_6722 = L8_6722(#L2_6716 / 10)
      A0_6714.iMaxAllPage = L8_6722
      break
    end
    L8_6722 = {}
    L8_6722.name = L7_6721.name
    L8_6722.job = L7_6721.job
    L8_6722.level = L7_6721.level
    table.insert(L2_6716, L8_6722)
  end
end
function LRanking.OnRankingAllResponse(A0_6723, A1_6724, A2_6725, A3_6726)
  A0_6723.bUpdating = false
  A0_6723:SetLoading(false)
  if A1_6724 ~= 0 then
    return
  end
  A0_6723:HandleAllData(A2_6725)
  A0_6723:ReviewRanking()
end
function LRanking.RankingAllLoading(A0_6727)
  if A0_6727.bUpdating then
    return
  end
  A0_6727.tAllList = {}
  A0_6727.iCurrentAllPage = 0
  A0_6727.iMaxAllPage = -1
  A0_6727.bUpdating = true
  A0_6727:Parent().bg.visible = true
  A0_6727:Parent().jbg.visible = false
  A0_6727:SetLoading(true)
  A0_6727:ReviewRanking()
  AdventureSDK:LevelRanking(0, 20, 0, A0_6727, A0_6727.OnRankingAllResponse)
end
function LRanking.HandleJobData(A0_6728, A1_6729)
  local L2_6730, L3_6731, L4_6732, L5_6733, L6_6734, L7_6735, L8_6736
  L2_6730 = A0_6728.tJobList
  if not A1_6729 then
    A0_6728.iMaxJobPage = L3_6731
    return
  end
  for L6_6734 = 1, 20 do
    if L6_6734 == 1 then
      L8_6736 = A1_6729
      L7_6735 = A1_6729.First
      L7_6735 = L7_6735(L8_6736)
    elseif not L7_6735 then
      L8_6736 = A1_6729
      L7_6735 = A1_6729.Next
      L7_6735 = L7_6735(L8_6736)
    end
    if not L7_6735 then
      L8_6736 = math
      L8_6736 = L8_6736.floor
      L8_6736 = L8_6736(#L2_6730 / 10)
      A0_6728.iMaxJobPage = L8_6736
      break
    end
    L8_6736 = {}
    L8_6736.name = L7_6735.name
    L8_6736.job = L7_6735.job
    L8_6736.level = L7_6735.level
    table.insert(L2_6730, L8_6736)
  end
end
function LRanking.OnRankingJobResponse(A0_6737, A1_6738, A2_6739, A3_6740)
  A0_6737.bUpdating = false
  A0_6737:SetLoading(false)
  if A1_6738 ~= 0 then
    return
  end
  A0_6737:HandleJobData(A2_6739)
  A0_6737:ReviewRanking()
end
function LRanking.RankingJobLoading(A0_6741)
  if A0_6741.bUpdating then
    return
  end
  A0_6741.tJobList = {}
  A0_6741.iCurrentJobPage = 0
  A0_6741.iMaxJobPage = -1
  A0_6741.bUpdating = true
  A0_6741:Parent().bg.visible = false
  A0_6741:Parent().jbg.visible = true
  A0_6741:SetLoading(true)
  A0_6741:ReviewRanking()
  AdventureSDK:LevelRanking(0, 20, Userinfo:One(string.format("serial = %d", UniqueComponent("Model/interface.model").parent.focus_object)).job, A0_6741, A0_6741.OnRankingJobResponse)
end
function LRanking.OnAllDown(A0_6742, A1_6743)
  if A0_6742:Parent().bg.visible then
    return
  end
  A0_6742:Parent().jbg.visible = false
  A0_6742:Parent().bg.visible = true
  if #A0_6742.tAllList ~= 0 then
    A0_6742:ReviewRanking()
    return
  end
  A0_6742:RankingAllLoading()
end
function LRanking.OnJobDown(A0_6744, A1_6745)
  if A0_6744:Parent().jbg.visible then
    return
  end
  A0_6744:Parent().jbg.visible = true
  A0_6744:Parent().bg.visible = false
  if #A0_6744.tJobList ~= 0 then
    A0_6744:ReviewRanking()
    return
  end
  A0_6744:RankingJobLoading()
end
function LRanking.OnVisible(A0_6746, A1_6747)
  local L2_6748
  L2_6748 = A1_6747.visible
  if not L2_6748 then
    return
  end
  L2_6748 = A0_6746.bUpdating
  if L2_6748 then
    L2_6748 = A0_6746.SetLoading
    L2_6748(A0_6746, true)
  end
  L2_6748 = A1_6747.loading
  L2_6748.visible = A0_6746.bUpdating and true or false
  L2_6748 = A1_6747.bg
  L2_6748.visible = true
  L2_6748 = A1_6747.jbg
  L2_6748.visible = false
  L2_6748 = A1_6747.bg
  L2_6748 = L2_6748.visible
  if L2_6748 then
    L2_6748 = A0_6746.RankingAllLoading
  else
    L2_6748 = L2_6748 or A0_6746.RankingJobLoading
  end
  A0_6746.tAllList = {}
  A0_6746.iCurrentAllPage = 0
  A0_6746.iMaxAllPage = -1
  A0_6746.tJobList = {}
  A0_6746.iCurrentJobPage = 0
  A0_6746.iMaxJobPage = -1
  L2_6748(A0_6746)
  A0_6746:ReviewRanking()
end
