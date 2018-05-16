Class.Dialog.ComImage({})
function Dialog.Constructor(A0_1722, A1_1723)
  local L2_1724, L3_1725, L4_1726, L5_1727, L6_1728, L7_1729, L8_1730, L9_1731, L10_1732, L11_1733
  A1_1723 = A1_1723 or 0
  L2_1724 = string
  L2_1724 = L2_1724.format
  L3_1725 = "UI/ChatBalloon/%d.nw.ntp"
  L4_1726 = A1_1723
  L2_1724 = L2_1724(L3_1725, L4_1726)
  L3_1725 = string
  L3_1725 = L3_1725.format
  L4_1726 = "UI/ChatBalloon/%d.n.ntp"
  L5_1727 = A1_1723
  L3_1725 = L3_1725(L4_1726, L5_1727)
  L4_1726 = string
  L4_1726 = L4_1726.format
  L5_1727 = "UI/ChatBalloon/%d.ne.ntp"
  L6_1728 = A1_1723
  L4_1726 = L4_1726(L5_1727, L6_1728)
  L5_1727 = string
  L5_1727 = L5_1727.format
  L6_1728 = "UI/ChatBalloon/%d.w.ntp"
  L7_1729 = A1_1723
  L5_1727 = L5_1727(L6_1728, L7_1729)
  L6_1728 = string
  L6_1728 = L6_1728.format
  L7_1729 = "UI/ChatBalloon/%d.c.ntp"
  L8_1730 = A1_1723
  L6_1728 = L6_1728(L7_1729, L8_1730)
  L7_1729 = string
  L7_1729 = L7_1729.format
  L8_1730 = "UI/ChatBalloon/%d.e.ntp"
  L9_1731 = A1_1723
  L7_1729 = L7_1729(L8_1730, L9_1731)
  L8_1730 = string
  L8_1730 = L8_1730.format
  L9_1731 = "UI/ChatBalloon/%d.sw.ntp"
  L10_1732 = A1_1723
  L8_1730 = L8_1730(L9_1731, L10_1732)
  L9_1731 = string
  L9_1731 = L9_1731.format
  L10_1732 = "UI/ChatBalloon/%d.s.ntp"
  L11_1733 = A1_1723
  L9_1731 = L9_1731(L10_1732, L11_1733)
  L10_1732 = string
  L10_1732 = L10_1732.format
  L11_1733 = "UI/ChatBalloon/%d.se.ntp"
  L10_1732 = L10_1732(L11_1733, A1_1723)
  L11_1733 = string
  L11_1733 = L11_1733.format
  L11_1733 = L11_1733("UI/ChatBalloon/%d.arrow.ntp", A1_1723)
  ComImage.Constructor(A0_1722, L2_1724, L3_1725, L4_1726, L5_1727, L6_1728, L7_1729, L8_1730, L9_1731, L10_1732)
  Image(L11_1733).name = "arrow"
  Image(L11_1733).parent = A0_1722
  Label("", "\228\187\191\229\174\139", 13).name = "label"
  Label("", "\228\187\191\229\174\139", 13).dimensions = {110, 0}
  Label("", "\228\187\191\229\174\139", 13).parent = A0_1722
  A0_1722.size = {110, 100}
end
function Dialog.class_get(A0_1734, A1_1735)
  local L2_1736
  L2_1736 = "Dialog"
  return L2_1736
end
function Dialog.color_get(A0_1737, A1_1738)
  return A0_1737.label.color
end
function Dialog.color_set(A0_1739, A1_1740, A2_1741)
  A0_1739.label.color = A2_1741
end
function Dialog.text_get(A0_1742, A1_1743)
  return A0_1742.label.text
end
function Dialog.text_set(A0_1744, A1_1745, A2_1746)
  local L3_1747
  L3_1747 = A0_1744.label
  L3_1747.text = A2_1746
  L3_1747 = A0_1744.label
  L3_1747 = L3_1747.height
  L3_1747 = L3_1747 + 10
  A0_1744.size = {110, L3_1747}
end
function Dialog.size_set(A0_1748, A1_1749, A2_1750, A3_1751)
  ComImage.size_set(A0_1748, A1_1749, A2_1750, A3_1751)
  A0_1748.arrow.position = {
    0,
    -A0_1748.height / 2
  }
end
