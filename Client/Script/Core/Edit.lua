Class.Edit.Component({})
function Edit.Constructor(A0_1755, A1_1756, A2_1757, A3_1758)
  Component.Constructor(A0_1755)
  if not EditBox(Size(A1_1756, A2_1757), Scale9Sprite(A3_1758), nil, nil) then
    return
  end
  A0_1755.render = EditBox(Size(A1_1756, A2_1757), Scale9Sprite(A3_1758), nil, nil)
  EditBox(Size(A1_1756, A2_1757), Scale9Sprite(A3_1758), nil, nil):SetReturnType(KeyboardReturnTypeDone)
  A0_1755.on = {
    "Start",
    A0_1755,
    Edit.on_start_set
  }
  A0_1755.on = {
    "Stop",
    A0_1755,
    Edit.on_stop_set
  }
end
function Edit.on_begin_get(A0_1759, A1_1760)
  return rawget(A0_1759, "on_beigin")
end
function Edit.on_begin_set(A0_1761, A1_1762, A2_1763)
  rawset(A0_1761, "on_beigin", A2_1763)
end
function Edit.on_end_get(A0_1764, A1_1765)
  return rawget(A0_1764, "on_end")
end
function Edit.on_end_set(A0_1766, A1_1767, A2_1768)
  rawset(A0_1766, "on_end", A2_1768)
end
function Edit.on_changed_get(A0_1769, A1_1770)
  return rawget(A0_1769, "on_changed")
end
function Edit.on_changed_set(A0_1771, A1_1772, A2_1773)
  rawset(A0_1771, "on_changed", A2_1773)
end
function Edit.on_start_set(A0_1774)
  local L1_1775, L2_1776, L3_1777, L4_1778
  L1_1775 = A0_1774.render
  if not L1_1775 then
    return
  end
  L2_1776 = Functor
  L3_1777 = A0_1774
  L4_1778 = Edit
  L4_1778 = L4_1778.on_begin_fire
  L2_1776 = L2_1776(L3_1777, L4_1778)
  L3_1777 = Functor
  L4_1778 = A0_1774
  L3_1777 = L3_1777(L4_1778, Edit.on_end_fire)
  L4_1778 = Functor
  L4_1778 = L4_1778(A0_1774, Edit.on_changed_fire)
  A0_1774.on_beigin = L2_1776
  A0_1774.on_end = L3_1777
  A0_1774.on_changed = L4_1778
  L1_1775:On("Begin", L2_1776)
  L1_1775:On("End", L3_1777)
  L1_1775:On("Changed", L4_1778)
end
function Edit.on_begin_fire(A0_1779)
  local L1_1780
  A0_1779.fire = "Begin"
end
function Edit.on_end_fire(A0_1781)
  local L1_1782
  A0_1781.fire = "End"
end
function Edit.on_changed_fire(A0_1783)
  local L1_1784
  A0_1783.fire = "Changed"
end
function Edit.on_stop_set(A0_1785)
  local L1_1786, L2_1787, L3_1788, L4_1789
  L1_1786 = A0_1785.render
  if not L1_1786 then
    return
  end
  L2_1787 = A0_1785.on_beigin
  L3_1788 = A0_1785.on_end
  L4_1789 = A0_1785.on_changed
  A0_1785.on_beigin = nil
  A0_1785.on_end = nil
  A0_1785.on_changed = nil
  L1_1786:Off("Begin", L2_1787)
  L1_1786:Off("End", L3_1788)
  L1_1786:Off("Changed", L4_1789)
end
function Edit.class_get(A0_1790, A1_1791)
  local L2_1792
  L2_1792 = "Edit"
  return L2_1792
end
function Edit.text_get(A0_1793, A1_1794)
  local L2_1795
  L2_1795 = A0_1793.render
  if not L2_1795 then
    return
  end
  return L2_1795:Text()
end
function Edit.text_set(A0_1796, A1_1797, A2_1798)
  local L3_1799
  L3_1799 = A0_1796.render
  if not L3_1799 then
    return
  end
  if type(A2_1798) ~= "string" then
    return
  end
  L3_1799:SetText(A2_1798)
end
function Edit.font_set(A0_1800, A1_1801, A2_1802)
  local L3_1803
  L3_1803 = A0_1800.render
  if not L3_1803 then
    return
  end
  if type(A2_1802) ~= "string" then
    return
  end
  L3_1803:SetFontName(A2_1802)
end
function Edit.font_color_set(A0_1804, A1_1805, A2_1806)
  local L3_1807, L4_1808, L5_1809, L6_1810, L7_1811, L8_1812
  L3_1807 = A0_1804.render
  if not L3_1807 then
    return
  end
  L4_1808 = A2_1806 & 4278190080
  L4_1808 = L4_1808 >> 24
  L5_1809 = A2_1806 & 16711680
  L5_1809 = L5_1809 >> 16
  L6_1810 = A2_1806 & 65280
  L6_1810 = L6_1810 >> 8
  L8_1812 = L3_1807
  L7_1811 = L3_1807.SetFontColor
  L7_1811(L8_1812, Color3B(L4_1808, L5_1809, L6_1810))
end
function Edit.placeholder_font_set(A0_1813, A1_1814, A2_1815)
  local L3_1816
  L3_1816 = A0_1813.render
  if not L3_1816 then
    return
  end
  if type(A2_1815) ~= "string" then
    return
  end
  L3_1816:SetPlaceholderFontName(A2_1815)
end
function Edit.font_size_set(A0_1817, A1_1818, A2_1819)
  local L3_1820
  L3_1820 = A0_1817.render
  if not L3_1820 then
    return
  end
  if type(A2_1819) ~= "number" then
    return
  end
  L3_1820:SetFontSize(A2_1819)
end
function Edit.placeholder_font_size_set(A0_1821, A1_1822, A2_1823)
  local L3_1824
  L3_1824 = A0_1821.render
  if not L3_1824 then
    return
  end
  if type(A2_1823) ~= "number" then
    return
  end
  L3_1824:SetPlaceholderFontSize(A2_1823)
end
function Edit.placeholder_color_set(A0_1825, A1_1826, A2_1827)
  local L3_1828, L4_1829, L5_1830, L6_1831
  L3_1828 = A0_1825.render
  if not L3_1828 then
    return
  end
  L4_1829 = type
  L5_1830 = A2_1827
  L4_1829 = L4_1829(L5_1830)
  if L4_1829 ~= "number" then
    return
  end
  L4_1829 = A2_1827 & 4278190080
  L4_1829 = L4_1829 >> 24
  L5_1830 = A2_1827 & 16711680
  L5_1830 = L5_1830 >> 16
  L6_1831 = A2_1827 & 65280
  L6_1831 = L6_1831 >> 8
  L3_1828:SetPlaceholderFontColor(Color3B(L4_1829, L5_1830, L6_1831))
end
function Edit.placeholder_set(A0_1832, A1_1833, A2_1834)
  local L3_1835
  L3_1835 = A0_1832.render
  if not L3_1835 then
    return
  end
  L3_1835:SetPlaceholder(A2_1834)
end
function Edit.priority_set(A0_1836, A1_1837, A2_1838)
  local L3_1839
  L3_1839 = A0_1836.render
  if not L3_1839 then
    return
  end
  L3_1839:SetTouchPriority(A2_1838)
end
function Edit.enable_get(A0_1840, A1_1841, A2_1842)
  local L3_1843
  L3_1843 = A0_1840.render
  if not L3_1843 then
    return
  end
  return L3_1843:IsEnabled()
end
function Edit.enable_set(A0_1844, A1_1845, A2_1846)
  local L3_1847
  L3_1847 = A0_1844.render
  if not L3_1847 then
    return
  end
  L3_1847:SetEnabled(A2_1846)
end
function Edit.disable_get(A0_1848, A1_1849, A2_1850)
  local L3_1851
  L3_1851 = A0_1848.render
  if not L3_1851 then
    return
  end
  return not L3_1851:IsEnabled()
end
function Edit.disable_set(A0_1852, A1_1853, A2_1854)
  local L3_1855
  L3_1855 = A0_1852.render
  if not L3_1855 then
    return
  end
  L3_1855:SetEnabled(not A2_1854)
end
function Edit.input_type_set(A0_1856, A1_1857, A2_1858)
  local L3_1859, L4_1860
  L3_1859 = A0_1856.render
  if not L3_1859 then
    return
  end
  L4_1860 = EditBoxInputFlagSensitive
  if A2_1858 == "password" then
    L4_1860 = EditBoxInputFlagPassword
  end
  L3_1859:SetInputFlag(L4_1860)
end
function Edit.input_mode_set(A0_1861, A1_1862, A2_1863)
  local L3_1864, L4_1865
  L3_1864 = A0_1861.render
  if not L3_1864 then
    return
  end
  L4_1865 = EditBoxInputModeAny
  if A2_1863 == "email" then
    L4_1865 = EditBoxInputModeEmailAddr
  elseif A2_1863 == "numeric" then
    L4_1865 = EditBoxInputModeNumeric
  elseif A2_1863 == "phone_number" then
    L4_1865 = EditBoxInputModePhoneNumber
  elseif A2_1863 == "url" then
    L4_1865 = EditBoxInputModeUrl
  elseif A2_1863 == "decimal" then
    L4_1865 = EditBoxInputModeDecimal
  elseif A2_1863 == "sigle_line" then
    L4_1865 = EditBoxInputModeSingleLine
  end
  L3_1864:SetInputMode(L4_1865)
end
