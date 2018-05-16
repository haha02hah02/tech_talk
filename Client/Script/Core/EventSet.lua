L0_1866 = Class
L0_1866 = L0_1866.EventSet
L0_1866 = L0_1866.None
L0_1866({})
L0_1866 = EventSet
function L0_1866.Constructor(A0_1867)
  A0_1867.tEventListener = {}
end
function L0_1866(A0_1868, A1_1869)
  return A0_1868:Priority() < A1_1869:Priority()
end
function EventSet.On(A0_1870, A1_1871, ...)
  local L3_1873
  L2_1872 = A0_1870.tEventListener
  L3_1873 = L2_1872[A1_1871]
  if not L3_1873 then
    L3_1873 = {}
    L2_1872[A1_1871] = L3_1873
  end
  table.insert(L3_1873, Acceptor(...))
  table.sort(L3_1873, L0_1866)
end
function EventSet.Off(A0_1874, A1_1875, ...)
  local L3_1877, L4_1878, L5_1879, L6_1880, L7_1881
  L2_1876 = A0_1874.tEventListener
  L3_1877 = L2_1876[A1_1875]
  if not L3_1877 then
    return
  end
  for L7_1881, _FORV_8_ in L4_1878(L5_1879) do
    if _FORV_8_:Equal(...) then
      table.remove(L3_1877, L7_1881)
      return
    end
  end
end
function EventSet.Clean(A0_1882)
  A0_1882.tEventListener = {}
end
function EventSet.Fire(A0_1883, A1_1884, ...)
  local L3_1886
  L2_1885 = A0_1883.tEventListener
  L3_1886 = L2_1885[A1_1884]
  if not L3_1886 then
    return
  end
  for _FORV_7_, _FORV_8_ in ipairs(L3_1886) do
    if _FORV_8_:On(...) then
      return
    end
  end
end
function EventSet.Destructor(A0_1887)
  local L1_1888
end
