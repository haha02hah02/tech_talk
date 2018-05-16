Class.TButton.Component({})
function TButton.Constructor(A0_2527, A1_2528, A2_2529)
  local L3_2530, L4_2531
  L3_2530 = Component
  L3_2530 = L3_2530.Constructor
  L4_2531 = A0_2527
  L3_2530(L4_2531)
  L3_2530 = Menu
  L3_2530 = L3_2530()
  if not L3_2530 then
    return
  end
  L4_2531 = L3_2530.SetPosition
  L4_2531(L3_2530, 0, 0)
  L4_2531 = L3_2530.SetTouchPriority
  L4_2531(L3_2530, 0)
  A0_2527.render = L3_2530
  L4_2531 = MenuItem
  L4_2531 = L4_2531()
  if not L4_2531 then
    return
  end
  L4_2531:SetTag(1)
  L3_2530:AddChild(L4_2531)
  A1_2528 = A1_2528 or EGLView:DesignResolutionSize().Width
  A2_2529 = A2_2529 or EGLView:DesignResolutionSize().Height
  A0_2527.on = {
    "Start",
    A0_2527,
    TButton.on_start_set
  }
  A0_2527.on = {
    "Stop",
    A0_2527,
    TButton.on_stop_set
  }
  L4_2531:SetContentSize(Size(A1_2528, A2_2529))
end
function TButton.on_down_get(A0_2532, A1_2533)
  return rawget(A0_2532, "on_down")
end
function TButton.on_down_set(A0_2534, A1_2535, A2_2536)
  rawset(A0_2534, "on_down", A2_2536)
end
function TButton.on_up_get(A0_2537, A1_2538)
  return rawget(A0_2537, "on_up")
end
function TButton.on_up_set(A0_2539, A1_2540, A2_2541)
  rawset(A0_2539, "on_up", A2_2541)
end
function TButton.on_start_set(A0_2542)
  local L1_2543, L2_2544, L3_2545
  L1_2543 = A0_2542.render
  if not L1_2543 then
    return
  end
  L3_2545 = L1_2543
  L2_2544 = L1_2543.ChildByTag
  L2_2544 = L2_2544(L3_2545, 1)
  L1_2543 = L2_2544
  if not L1_2543 then
    return
  end
  L2_2544 = Functor
  L3_2545 = A0_2542
  L2_2544 = L2_2544(L3_2545, TButton.on_down_fire)
  L3_2545 = Functor
  L3_2545 = L3_2545(A0_2542, TButton.on_up_fire)
  A0_2542.on_down = L2_2544
  A0_2542.on_up = L3_2545
  L1_2543:On("Down", L2_2544)
  L1_2543:On("Up", L3_2545)
end
function TButton.on_stop_set(A0_2546)
  local L1_2547, L2_2548, L3_2549
  L1_2547 = A0_2546.render
  if not L1_2547 then
    return
  end
  L3_2549 = L1_2547
  L2_2548 = L1_2547.ChildByTag
  L2_2548 = L2_2548(L3_2549, 1)
  L1_2547 = L2_2548
  if not L1_2547 then
    return
  end
  L2_2548 = A0_2546.on_down
  L3_2549 = A0_2546.on_up
  A0_2546.on_down = nil
  A0_2546.on_up = nil
  L1_2547:Off("Down", L2_2548)
  L1_2547:Off("Up", L3_2549)
end
function TButton.on_down_fire(A0_2550)
  local L1_2551
  A0_2550.fire = "Down"
end
function TButton.on_up_fire(A0_2552)
  local L1_2553
  A0_2552.fire = "Up"
end
function TButton.class_get(A0_2554, A1_2555)
  local L2_2556
  L2_2556 = "TButton"
  return L2_2556
end
function TButton.touch_point_get(A0_2557)
  local L1_2558
  L1_2558 = A0_2557.render
  if not L1_2558 then
    return
  end
  L1_2558 = L1_2558:ChildByTag(1)
  if not L1_2558 then
    return
  end
  return L1_2558:TouchPoint()
end
function TButton.size_set(A0_2559, A1_2560, A2_2561, A3_2562)
  local L4_2563
  L4_2563 = A0_2559.render
  if not L4_2563 then
    return
  end
  L4_2563 = L4_2563:ChildByTag(1)
  if not L4_2563 then
    return
  end
  L4_2563:SetContentSize(Size(A2_2561, A3_2562))
end
function TButton.enable_get(A0_2564, A1_2565, A2_2566)
  local L3_2567
  L3_2567 = A0_2564.render
  if not L3_2567 then
    return
  end
  L3_2567 = L3_2567:ChildByTag(1)
  if not L3_2567 then
    return
  end
  return L3_2567:IsEnabled()
end
function TButton.enable_set(A0_2568, A1_2569, A2_2570)
  local L3_2571
  L3_2571 = A0_2568.render
  if not L3_2571 then
    return
  end
  L3_2571 = L3_2571:ChildByTag(1)
  if not L3_2571 then
    return
  end
  L3_2571:SetEnabled(A2_2570)
end
function TButton.disable_get(A0_2572, A1_2573, A2_2574)
  local L3_2575
  L3_2575 = A0_2572.render
  if not L3_2575 then
    return
  end
  L3_2575 = L3_2575:ChildByTag(1)
  if not L3_2575 then
    return
  end
  return not L3_2575:IsEnabled()
end
function TButton.disable_set(A0_2576, A1_2577, A2_2578)
  local L3_2579
  L3_2579 = A0_2576.render
  if not L3_2579 then
    return
  end
  L3_2579 = L3_2579:ChildByTag(1)
  if not L3_2579 then
    return
  end
  L3_2579:SetEnabled(not A2_2578)
end
function TButton.selected_get(A0_2580)
  local L1_2581
  L1_2581 = A0_2580.render
  if not L1_2581 then
    return
  end
  L1_2581 = L1_2581:ChildByTag(1)
  if not L1_2581 then
    return
  end
  return L1_2581:IsSelected()
end
function TButton.priority_set(A0_2582, A1_2583, A2_2584)
  local L3_2585
  L3_2585 = A0_2582.render
  if not L3_2585 then
    return
  end
  L3_2585:SetTouchPriority(A2_2584)
end
