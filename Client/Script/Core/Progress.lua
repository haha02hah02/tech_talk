Class.Progress.Component({})
function Progress.Constructor(A0_2399, A1_2400)
  local L2_2401
  L2_2401 = Component
  L2_2401 = L2_2401.Constructor
  L2_2401(A0_2399)
  L2_2401 = Sprite
  L2_2401 = L2_2401(A1_2400)
  if not L2_2401 then
    return
  end
  A0_2399.render = ProgressTimer(L2_2401)
  if not ProgressTimer(L2_2401) then
    return
  end
  ProgressTimer(L2_2401):SetType(ProgressTimerTypeBar)
  ProgressTimer(L2_2401):SetMidpoint(Point(0, 0))
  ProgressTimer(L2_2401):SetBarChangeRate(Point(1, 0))
  ProgressTimer(L2_2401):SetPercentage(100)
end
function Progress.class_get(A0_2402, A1_2403)
  local L2_2404
  L2_2404 = "Progress"
  return L2_2404
end
function Progress.percent_get(A0_2405, A1_2406)
  local L2_2407
  L2_2407 = A0_2405.render
  if not L2_2407 then
    return
  end
  return L2_2407:Percentage()
end
function Progress.percent_set(A0_2408, A1_2409, A2_2410)
  local L3_2411
  L3_2411 = A0_2408.render
  if not L3_2411 then
    return
  end
  L3_2411:SetPercentage(A2_2410)
end
function Progress.percent_action_set(A0_2412, A1_2413, A2_2414)
  if not A0_2412.render then
    return
  end
  A0_2412.unactions = true
  A0_2412.action = ProgressFromTo(0.5, A0_2412.percent, A2_2414)
end
