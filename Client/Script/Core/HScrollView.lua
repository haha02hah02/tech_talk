Class.HScrollView.Component({})
function HScrollView.Constructor(A0_1910, A1_1911, A2_1912, A3_1913, A4_1914, A5_1915, A6_1916)
  local L7_1917
  L7_1917 = Component
  L7_1917 = L7_1917.Constructor
  L7_1917(A0_1910)
  L7_1917 = nil
  if type(A1_1911) == "string" then
    A0_1910.width = A3_1913
    L7_1917 = ListView(A1_1911, A2_1912, Size(A3_1913, A4_1914), Size(A5_1915, A6_1916))
  else
    A0_1910.width = A1_1911
    L7_1917 = ListView(Size(A1_1911, A2_1912), Size(A3_1913, A4_1914))
  end
  if not L7_1917 then
    return
  end
  L7_1917:SetHorizontal()
  A0_1910.render = L7_1917
  A0_1910.on = {
    "Start",
    A0_1910,
    HScrollView.on_start_set
  }
  A0_1910.on = {
    "Stop",
    A0_1910,
    HScrollView.on_stop_set
  }
end
function HScrollView.on_move_get(A0_1918, A1_1919)
  return rawget(A0_1918, "on_move")
end
function HScrollView.on_move_set(A0_1920, A1_1921, A2_1922)
  rawset(A0_1920, "on_move", A2_1922)
end
function HScrollView.on_move_end_get(A0_1923, A1_1924)
  return rawget(A0_1923, "on_move_end")
end
function HScrollView.on_move_end_set(A0_1925, A1_1926, A2_1927)
  rawset(A0_1925, "on_move_end", A2_1927)
end
function HScrollView.on_at_index_get(A0_1928, A1_1929)
  return rawget(A0_1928, "on_at_index")
end
function HScrollView.on_at_index_set(A0_1930, A1_1931, A2_1932)
  rawset(A0_1930, "on_at_index", A2_1932)
end
function HScrollView.on_select_up_get(A0_1933, A1_1934)
  return rawget(A0_1933, "on_select_up")
end
function HScrollView.on_select_up_set(A0_1935, A1_1936, A2_1937)
  rawset(A0_1935, "on_select_up", A2_1937)
end
function HScrollView.on_select_down_get(A0_1938, A1_1939)
  return rawget(A0_1938, "on_select_down")
end
function HScrollView.on_select_down_set(A0_1940, A1_1941, A2_1942)
  rawset(A0_1940, "on_select_down", A2_1942)
end
function HScrollView.on_long_press_get(A0_1943, A1_1944)
  return rawget(A0_1943, "on_long_press")
end
function HScrollView.on_long_press_set(A0_1945, A1_1946, A2_1947)
  rawset(A0_1945, "on_long_press", A2_1947)
end
function HScrollView.on_start_set(A0_1948)
  local L1_1949, L2_1950, L3_1951, L4_1952, L5_1953, L6_1954, L7_1955
  L1_1949 = A0_1948.render
  if not L1_1949 then
    return
  end
  L2_1950 = Functor
  L3_1951 = A0_1948
  L4_1952 = HScrollView
  L4_1952 = L4_1952.on_move_fire
  L2_1950 = L2_1950(L3_1951, L4_1952)
  L3_1951 = Functor
  L4_1952 = A0_1948
  L5_1953 = HScrollView
  L5_1953 = L5_1953.on_move_end_fire
  L3_1951 = L3_1951(L4_1952, L5_1953)
  L4_1952 = Functor
  L5_1953 = A0_1948
  L6_1954 = HScrollView
  L6_1954 = L6_1954.on_at_index_fire
  L4_1952 = L4_1952(L5_1953, L6_1954)
  L5_1953 = Functor
  L6_1954 = A0_1948
  L7_1955 = HScrollView
  L7_1955 = L7_1955.on_select_up_fire
  L5_1953 = L5_1953(L6_1954, L7_1955)
  L6_1954 = Functor
  L7_1955 = A0_1948
  L6_1954 = L6_1954(L7_1955, HScrollView.on_select_down_fire)
  L7_1955 = Functor
  L7_1955 = L7_1955(A0_1948, HScrollView.on_long_press_fire)
  A0_1948.on_move = L2_1950
  A0_1948.on_move_end = L3_1951
  A0_1948.on_at_index = L4_1952
  A0_1948.on_select_up = L5_1953
  A0_1948.on_select_down = L6_1954
  A0_1948.on_long_press = L7_1955
  L1_1949:On("CellMove", L2_1950)
  L1_1949:On("CellMoveEnd", L3_1951)
  L1_1949:On("CellAtIndex", L4_1952)
  L1_1949:On("CellSelectUp", L5_1953)
  L1_1949:On("CellSelectDown", L6_1954)
  L1_1949:On("CellLongPress", L7_1955)
  A0_1948.refresh = true
end
function HScrollView.on_stop_set(A0_1956)
  local L1_1957, L2_1958, L3_1959, L4_1960, L5_1961, L6_1962, L7_1963
  L1_1957 = A0_1956.render
  if not L1_1957 then
    return
  end
  L2_1958 = A0_1956.on_move
  L3_1959 = A0_1956.on_move_end
  L4_1960 = A0_1956.on_at_index
  L5_1961 = A0_1956.on_select_up
  L6_1962 = A0_1956.on_select_down
  L7_1963 = A0_1956.on_long_press
  A0_1956.on_move = nil
  A0_1956.on_move_end = nil
  A0_1956.on_at_index = nil
  A0_1956.on_select_up = nil
  A0_1956.on_select_down = nil
  A0_1956.on_long_press = nil
  L1_1957:Off("CellMove", L2_1958)
  L1_1957:Off("CellMoveEnd", L3_1959)
  L1_1957:Off("CellAtIndex", L4_1960)
  L1_1957:Off("CellSelectUp", L5_1961)
  L1_1957:Off("CellSelectDown", L6_1962)
  L1_1957:Off("CellLongPress", L7_1963)
end
function HScrollView.on_move_fire(A0_1964)
  local L1_1965
  A0_1964.fire = "Move"
end
function HScrollView.on_move_end_fire(A0_1966)
  local L1_1967
  A0_1966.fire = "MoveEnd"
  L1_1967 = A0_1966.page
  if not L1_1967 then
    return
  end
  L1_1967 = A0_1966.render
  if not L1_1967 then
    return
  end
  L1_1967:SetContentOffset((L1_1967:ItemAmount() - 1) * -A0_1966.width, 0, true)
end
function HScrollView.on_at_index_fire(A0_1968, A1_1969)
  local L2_1970, L3_1971, L4_1972, L5_1973, L6_1974
  L2_1970 = A0_1968.child
  L2_1970 = L2_1970.sort
  L3_1971 = A1_1969.Select
  L3_1971 = L3_1971 + 1
  L4_1972 = A1_1969.Cell
  L5_1973 = L2_1970[L3_1971]
  if L5_1973 then
    L6_1974 = L5_1973.render
  else
    L6_1974 = L6_1974 or nil
  end
  L4_1972:RemoveChildByTag(10)
  if L6_1974 then
    L6_1974:RemoveFromParent()
    L4_1972:AddChild(L6_1974)
  end
  A0_1968.fire = {
    "AtIndex",
    L4_1972,
    L3_1971
  }
end
function HScrollView.on_select_up_fire(A0_1975, A1_1976)
  A0_1975.fire = {
    "SelectUp",
    A1_1976.Cell,
    A1_1976.Select
  }
end
function HScrollView.on_select_down_fire(A0_1977, A1_1978)
  local L2_1979
  L2_1979 = {
    "SelectDown",
    A1_1978.Cell,
    A1_1978.Select
  }
  A0_1977.fire = L2_1979
  L2_1979 = A0_1977.page
  if not L2_1979 then
    return
  end
  L2_1979 = A0_1977.render
  if not L2_1979 then
    return
  end
  A0_1977.downindex = A1_1978.Select
  A0_1977.downx = L2_1979:ContentOffset().x
end
function HScrollView.on_long_press_fire(A0_1980, A1_1981)
  A0_1980.fire = {
    "LongPress",
    A1_1981.Cell,
    A1_1981.Select
  }
end
function HScrollView.class_get(A0_1982, A1_1983)
  local L2_1984
  L2_1984 = "HScrollView"
  return L2_1984
end
function HScrollView.prender_get(A0_1985, A1_1986, A2_1987)
end
function HScrollView.width_get(A0_1988, A1_1989)
  return rawget(A0_1988, "width")
end
function HScrollView.width_set(A0_1990, A1_1991, A2_1992)
  rawset(A0_1990, "width", A2_1992)
end
function HScrollView.downx_get(A0_1993, A1_1994)
  return rawget(A0_1993, "downx")
end
function HScrollView.downx_set(A0_1995, A1_1996, A2_1997)
  rawset(A0_1995, "downx", A2_1997)
end
function HScrollView.downindex_get(A0_1998, A1_1999)
  return rawget(A0_1998, "downindex")
end
function HScrollView.downindex_set(A0_2000, A1_2001, A2_2002)
  rawset(A0_2000, "downindex", A2_2002)
end
function HScrollView.page_get(A0_2003, A1_2004)
  return rawget(A0_2003, "page")
end
function HScrollView.page_set(A0_2005, A1_2006, A2_2007)
  rawset(A0_2005, "page", true)
end
function HScrollView.priority_set(A0_2008, A1_2009, A2_2010)
  local L3_2011
  L3_2011 = A0_2008.render
  if not L3_2011 then
    return
  end
  L3_2011:SetTouchPriority(A2_2010)
end
function HScrollView.offset_x_get(A0_2012, A1_2013)
  local L2_2014
  L2_2014 = A0_2012.render
  if not L2_2014 then
    return
  end
  return L2_2014:ContentOffset().x
end
function HScrollView.offset_x_set(A0_2015, A1_2016, A2_2017)
  local L3_2018
  L3_2018 = A0_2015.render
  if not L3_2018 then
    return
  end
  L3_2018:SetContentOffset(A2_2017, L3_2018:ContentOffset().y, false)
end
function HScrollView.offset_y_get(A0_2019, A1_2020)
  local L2_2021
  L2_2021 = A0_2019.render
  if not L2_2021 then
    return
  end
  return L2_2021:ContentOffset().y
end
function HScrollView.offset_y_set(A0_2022, A1_2023, A2_2024)
  local L3_2025
  L3_2025 = A0_2022.render
  if not L3_2025 then
    return
  end
  L3_2025:SetContentOffset(L3_2025:ContentOffset().x, A2_2024, false)
end
function HScrollView.offset_get(A0_2026, A1_2027)
  local L2_2028
  L2_2028 = A0_2026.render
  if not L2_2028 then
    return
  end
  return L2_2028:ContentOffset()
end
function HScrollView.bounceable_set(A0_2029, A1_2030, A2_2031)
  local L3_2032
  L3_2032 = A0_2029.render
  if not L3_2032 then
    return
  end
  L3_2032:SetBounceable(A2_2031)
end
function HScrollView.refresh_set(A0_2033, A1_2034, A2_2035)
  local L3_2036
  L3_2036 = A0_2033.render
  if not L3_2036 then
    return
  end
  for _FORV_7_, _FORV_8_ in pairs(A0_2033.child.all) do
    _FORV_8_.tag = 10
  end
  L3_2036:SetItemAmount(#A0_2033.child.sort)
end
