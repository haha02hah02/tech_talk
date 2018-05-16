Class.Gameobject.Component({})
function Gameobject.Constructor(A0_1892, A1_1893)
  Component.Constructor(A0_1892)
  if not (A1_1893 and NodeRGBA() or Node()) then
    return
  end
  A0_1892.render = A1_1893 and NodeRGBA() or Node()
  A0_1892.on = {
    "Start",
    A0_1892,
    Gameobject.on_start_set
  }
  A0_1892.on = {
    "Stop",
    A0_1892,
    Gameobject.on_stop_set
  }
end
function Gameobject.on_visible_get(A0_1894, A1_1895)
  return rawget(A0_1894, "on_visible")
end
function Gameobject.on_visible_set(A0_1896, A1_1897, A2_1898)
  rawset(A0_1896, "on_visible", A2_1898)
end
function Gameobject.on_start_set(A0_1899)
  local L1_1900, L2_1901
  L1_1900 = A0_1899.render
  if not L1_1900 then
    return
  end
  L2_1901 = Functor
  L2_1901 = L2_1901(A0_1899, Gameobject.on_visible_fire)
  A0_1899.on_visible = L2_1901
  L1_1900:On("Visible", L2_1901)
end
function Gameobject.on_stop_set(A0_1902)
  local L1_1903, L2_1904
  L1_1903 = A0_1902.render
  if not L1_1903 then
    return
  end
  L2_1904 = A0_1902.on_visible
  A0_1902.on_visible = nil
  L1_1903:Off("Visible", L2_1904)
end
function Gameobject.on_visible_fire(A0_1905)
  local L1_1906
  A0_1905.fire = "Visible"
end
function Gameobject.class_get(A0_1907, A1_1908)
  local L2_1909
  L2_1909 = "Gameobject"
  return L2_1909
end
