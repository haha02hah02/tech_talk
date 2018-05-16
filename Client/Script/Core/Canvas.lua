Class.Canvas.Component({})
function Canvas.Constructor(A0_1218)
  Component.Constructor(A0_1218)
  if not Scene() then
    return
  end
  A0_1218.render = Scene()
  Scene():SetAnchorPoint(Point(0.5, 0.5))
end
function Canvas.class_get(A0_1219, A1_1220)
  local L2_1221
  L2_1221 = "Canvas"
  return L2_1221
end
