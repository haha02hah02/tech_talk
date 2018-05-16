local L1_2758
L0_2757 = Class
L0_2757 = L0_2757.DamageView
L0_2757 = L0_2757.Component
L1_2758 = {}
L0_2757(L1_2758)
L0_2757 = LoadCsv
L1_2758 = "Effect/Damage/NoRed/Config.ani"
L0_2757 = L0_2757(L1_2758)
L1_2758 = LoadCsv
L1_2758 = L1_2758("Effect/Damage/NoCritical/Config.ani")
function NumberTable(A0_2759)
  local L1_2760, L2_2761, L3_2762, L4_2763, L5_2764, L6_2765
  L1_2760 = A0_2759
  L2_2761 = {}
  for L6_2765 = 1, 10 do
    table.insert(L2_2761, math.floor(L1_2760) % 10)
    L1_2760 = L1_2760 / 10
    if not (L1_2760 < 1) then
      L1_2760 = math.floor(L1_2760)
    end
  end
  for _FORV_7_ = #L2_2761, 1, -1 do
    table.insert(L3_2762, L2_2761[_FORV_7_])
  end
  return L3_2762
end
function DamageAction(A0_2766, A1_2767, A2_2768)
  local L3_2769
  L3_2769 = Array
  L3_2769 = L3_2769()
  L3_2769:AddObject(Hide())
  L3_2769:AddObject(MoveBy(0, Point(0, (A1_2767 - 1) * A2_2768)))
  L3_2769:AddObject(DelayTime((A1_2767 - 1) * 0.13))
  L3_2769:AddObject(Show())
  L3_2769:AddObject(DelayTime(0.6))
  L3_2769:AddObject(RemoveSelf(true))
  A0_2766:RunAction(Sequence(L3_2769))
  A0_2766:RunAction(MoveBy(2.0, Point(0, 240)))
end
function DamageView(A0_2770, A1_2771)
  local L2_2772, L3_2773, L4_2774, L5_2775, L6_2776, L7_2777, L8_2778, L9_2779, L10_2780, L11_2781, L12_2782, L13_2783, L14_2784, L15_2785, L16_2786, L17_2787, L18_2788, L19_2789, L20_2790
  if A1_2771 then
    L2_2772 = "NoViolet"
  elseif not L2_2772 then
    L2_2772 = A0_2770.critical
    if L2_2772 then
      L2_2772 = "NoCritical"
    else
      L2_2772 = L2_2772 or "NoRed"
    end
  end
  L3_2773 = 26
  L4_2774 = A0_2770.result
  if L4_2774 == 0 then
    L4_2774 = Sprite
    L5_2775 = string
    L5_2775 = L5_2775.format
    L6_2776 = "Effect/Damage/%s/Miss.ntp"
    L7_2777 = L2_2772
    L20_2790 = L5_2775(L6_2776, L7_2777)
    L4_2774 = L4_2774(L5_2775, L6_2776, L7_2777, L8_2778, L9_2779, L10_2780, L11_2781, L12_2782, L13_2783, L14_2784, L15_2785, L16_2786, L17_2787, L18_2788, L19_2789, L20_2790, L5_2775(L6_2776, L7_2777))
    if not L4_2774 then
      return
    end
    L6_2776 = L4_2774
    L5_2775 = L4_2774.SetPosition
    L7_2777 = L0_2757[10]
    L7_2777 = L7_2777.x
    L8_2778 = L0_2757[10]
    L8_2778 = L8_2778.y
    L5_2775(L6_2776, L7_2777, L8_2778)
    L5_2775 = DamageAction
    L6_2776 = L4_2774
    L7_2777 = A0_2770.index
    L8_2778 = L3_2773
    L5_2775(L6_2776, L7_2777, L8_2778)
    return L4_2774
  end
  L4_2774 = A0_2770.result
  if L4_2774 == -1 then
    L4_2774 = Sprite
    L5_2775 = string
    L5_2775 = L5_2775.format
    L6_2776 = "Effect/Damage/%s/%s.ntp"
    if L2_2772 == "NoCritical" then
      L7_2777 = "NoRed"
    else
      L7_2777 = L7_2777 or L2_2772
    end
    if L2_2772 == "NoViolet" then
      L8_2778 = "Guard"
    else
      L8_2778 = L8_2778 or "Miss"
    end
    L20_2790 = L5_2775(L6_2776, L7_2777, L8_2778)
    L4_2774 = L4_2774(L5_2775, L6_2776, L7_2777, L8_2778, L9_2779, L10_2780, L11_2781, L12_2782, L13_2783, L14_2784, L15_2785, L16_2786, L17_2787, L18_2788, L19_2789, L20_2790, L5_2775(L6_2776, L7_2777, L8_2778))
    if not L4_2774 then
      return
    end
    L6_2776 = L4_2774
    L5_2775 = L4_2774.SetPosition
    L7_2777 = L0_2757[10]
    L7_2777 = L7_2777.x
    L8_2778 = L0_2757[10]
    L8_2778 = L8_2778.y
    L5_2775(L6_2776, L7_2777, L8_2778)
    L5_2775 = DamageAction
    L6_2776 = L4_2774
    L7_2777 = A0_2770.index
    L8_2778 = L3_2773
    L5_2775(L6_2776, L7_2777, L8_2778)
    return L4_2774
  end
  if L2_2772 == "NoCritical" then
    L4_2774 = 30
  else
    L4_2774 = L4_2774 or 22
  end
  if L2_2772 == "NoCritical" then
    L5_2775 = 2
  else
    L5_2775 = L5_2775 or 2
  end
  if L2_2772 == "NoCritical" then
    L6_2776 = 15
  else
    L6_2776 = L6_2776 or 11
  end
  if L2_2772 == "NoCritical" then
    L7_2777 = L1_2758
  else
    L7_2777 = L7_2777 or L0_2757
  end
  L8_2778 = NumberTable
  L9_2779 = A0_2770.result
  L8_2778 = L8_2778(L9_2779)
  L9_2779 = #L8_2778
  L9_2779 = -L9_2779
  L9_2779 = L9_2779 * L6_2776
  L9_2779 = L9_2779 + L6_2776
  L10_2780 = 0
  L11_2781 = Node
  L11_2781 = L11_2781()
  L12_2782 = string
  L12_2782 = L12_2782.format
  L12_2782 = L12_2782(L13_2783, L14_2784)
  if L2_2772 == "NoCritical" then
    L16_2786 = L7_2777[10]
    L16_2786 = L16_2786.x
    L16_2786 = L9_2779 + L16_2786
    L17_2787 = L7_2777[10]
    L17_2787 = L17_2787.y
    L14_2784(L15_2785, L16_2786, L17_2787)
    L16_2786 = L13_2783
    L14_2784(L15_2785, L16_2786)
  end
  for L16_2786, L17_2787 in L13_2783(L14_2784) do
    L18_2788 = Sprite
    L19_2789 = string
    L19_2789 = L19_2789.format
    L20_2790 = "%s/%d.ntp"
    L20_2790 = L19_2789(L20_2790, L12_2782, L17_2787)
    L18_2788 = L18_2788(L19_2789, L20_2790, L19_2789(L20_2790, L12_2782, L17_2787))
    L20_2790 = L11_2781
    L19_2789 = L11_2781.AddChild
    L19_2789(L20_2790, L18_2788)
    L19_2789 = L9_2779 + L10_2780
    L20_2790 = L7_2777[L17_2787]
    L20_2790 = L20_2790.x
    L19_2789 = L19_2789 + L20_2790
    L20_2790 = L16_2786 % 2
    if L20_2790 == 0 then
      L20_2790 = L7_2777[L17_2787]
      L20_2790 = L20_2790.y
      L20_2790 = L20_2790 - L5_2775
    elseif not L20_2790 then
      L20_2790 = L7_2777[L17_2787]
      L20_2790 = L20_2790.y
    end
    L18_2788:SetPosition(L19_2789, L20_2790)
    L10_2780 = L10_2780 + L4_2774
  end
  L16_2786 = L3_2773
  L13_2783(L14_2784, L15_2785, L16_2786)
  return L11_2781
end
