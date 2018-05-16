Class.NameTag.Gameobject({})
function NameTag.Constructor(A0_682, A1_683, A2_684)
  Gameobject.Constructor(A0_682)
  A1_683 = A1_683 or 0
  A2_684 = A2_684 or ""
  A0_682.id = A1_683
  if not A0_682.render then
    return
  end
  Image(string.format("UI/NameTag/%d.w.ntp", A1_683)).name = "head"
  Image(string.format("UI/NameTag/%d.w.ntp", A1_683)).anchorpoint = {0, 0.5}
  Image(string.format("UI/NameTag/%d.w.ntp", A1_683)).parent = A0_682
  Image(string.format("UI/NameTag/%d.c.ntp", A1_683)).name = "center"
  Image(string.format("UI/NameTag/%d.c.ntp", A1_683)).anchorpoint = {0, 0.5}
  Image(string.format("UI/NameTag/%d.c.ntp", A1_683)).parent = A0_682
  Image(string.format("UI/NameTag/%d.e.ntp", A1_683)).name = "tail"
  Image(string.format("UI/NameTag/%d.e.ntp", A1_683)).anchorpoint = {0, 0.5}
  Image(string.format("UI/NameTag/%d.e.ntp", A1_683)).parent = A0_682
  Label(A2_684, "Arial", 12).name = "label"
  Label(A2_684, "Arial", 12).x = 0
  Label(A2_684, "Arial", 12).color, Label(A2_684, "Arial", 12).y = LoadMsv(string.format("UI/NameTag/%d.ani", A1_683)) and tonumber(LoadMsv(string.format("UI/NameTag/%d.ani", A1_683)).color) or 4126536960, 0
  Label(A2_684, "Arial", 12).parent = A0_682
  A0_682.text = A2_684
end
function NameTag.class_get(A0_685, A1_686)
  local L2_687
  L2_687 = "NameTag"
  return L2_687
end
function NameTag.id_get(A0_688, A1_689)
  return rawget(A0_688, "id")
end
function NameTag.id_set(A0_690, A1_691, A2_692)
  rawset(A0_690, "id", A2_692)
end
function NameTag.text_get(A0_693, A1_694)
  return A0_693.label.text
end
function NameTag.text_set(A0_695, A1_696, A2_697)
  local L3_698, L4_699, L6_700
  if A2_697 == nil then
    return
  end
  L3_698 = A0_695.label
  L3_698.text = A2_697
  L3_698 = A0_695.head
  L3_698 = L3_698.width
  L4_699 = A0_695.label
  L4_699 = L4_699.width
  L6_700 = A0_695.center
  L6_700 = L6_700.height
  A0_695.head.x = -L3_698 - math.floor(L4_699 / 2) + (LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)) and LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)).w.x or 0)
  A0_695.head.y = LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)) and LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)).w.y or 0
  A0_695.center.width = L4_699
  A0_695.center.x = -math.floor(L4_699 / 2) + (LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)) and LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)).c.x or 0)
  A0_695.center.y = LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)) and LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)).c.y or 0
  A0_695.tail.x = math.floor(L4_699 / 2) + (LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)) and LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)).e.x or 0)
  A0_695.tail.y = LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)) and LoadMsv(string.format("UI/NameTag/%d.ani", A0_695.id)).e.y or 0
end
function NameTag.Destructor(A0_701)
  local L1_702
end
