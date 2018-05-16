Class.VScrollView.Component({})
function VScrollView.Constructor(A0_2586, A1_2587, A2_2588, A3_2589, A4_2590, A5_2591, A6_2592)
  local L7_2593
  L7_2593 = Component
  L7_2593 = L7_2593.Constructor
  L7_2593(A0_2586)
  L7_2593 = nil
  if type(A1_2587) == "string" then
    A0_2586.width = A3_2589
    L7_2593 = ListView(A1_2587, A2_2588, Size(A3_2589, A4_2590), Size(A5_2591, A6_2592))
  else
    A0_2586.width = A1_2587
    L7_2593 = ListView(Size(A1_2587, A2_2588), Size(A3_2589, A4_2590))
  end
  if not L7_2593 then
    return
  end
  A0_2586.render = L7_2593
  A0_2586.on = {
    "Start",
    A0_2586,
    VScrollView.on_start_set
  }
  A0_2586.on = {
    "Stop",
    A0_2586,
    VScrollView.on_stop_set
  }
end
function VScrollView.on_move_get(A0_2594, A1_2595)
  return rawget(A0_2594, "on_move")
end
function VScrollView.on_move_set(A0_2596, A1_2597, A2_2598)
  rawset(A0_2596, "on_move", A2_2598)
end
function VScrollView.on_move_end_get(A0_2599, A1_2600)
  return rawget(A0_2599, "on_move_end")
end
function VScrollView.on_move_end_set(A0_2601, A1_2602, A2_2603)
  rawset(A0_2601, "on_move_end", A2_2603)
end
function VScrollView.on_at_index_get(A0_2604, A1_2605)
  return rawget(A0_2604, "on_at_index")
end
function VScrollView.on_at_index_set(A0_2606, A1_2607, A2_2608)
  rawset(A0_2606, "on_at_index", A2_2608)
end
function VScrollView.on_select_up_get(A0_2609, A1_2610)
  return rawget(A0_2609, "on_select_up")
end
function VScrollView.on_select_up_set(A0_2611, A1_2612, A2_2613)
  rawset(A0_2611, "on_select_up", A2_2613)
end
function VScrollView.on_select_down_get(A0_2614, A1_2615)
  return rawget(A0_2614, "on_select_down")
end
function VScrollView.on_select_down_set(A0_2616, A1_2617, A2_2618)
  rawset(A0_2616, "on_select_down", A2_2618)
end
function VScrollView.on_long_press_get(A0_2619, A1_2620)
  return rawget(A0_2619, "on_long_press")
end
function VScrollView.on_long_press_set(A0_2621, A1_2622, A2_2623)
  rawset(A0_2621, "on_long_press", A2_2623)
end
function VScrollView.on_start_set(A0_2624)
  local L1_2625, L2_2626, L3_2627, L4_2628, L5_2629, L6_2630, L7_2631
  L1_2625 = A0_2624.render
  if not L1_2625 then
    return
  end
  L2_2626 = Functor
  L3_2627 = A0_2624
  L4_2628 = VScrollView
  L4_2628 = L4_2628.on_move_fire
  L2_2626 = L2_2626(L3_2627, L4_2628)
  L3_2627 = Functor
  L4_2628 = A0_2624
  L5_2629 = VScrollView
  L5_2629 = L5_2629.on_move_end_fire
  L3_2627 = L3_2627(L4_2628, L5_2629)
  L4_2628 = Functor
  L5_2629 = A0_2624
  L6_2630 = VScrollView
  L6_2630 = L6_2630.on_at_index_fire
  L4_2628 = L4_2628(L5_2629, L6_2630)
  L5_2629 = Functor
  L6_2630 = A0_2624
  L7_2631 = VScrollView
  L7_2631 = L7_2631.on_select_up_fire
  L5_2629 = L5_2629(L6_2630, L7_2631)
  L6_2630 = Functor
  L7_2631 = A0_2624
  L6_2630 = L6_2630(L7_2631, VScrollView.on_select_down_fire)
  L7_2631 = Functor
  L7_2631 = L7_2631(A0_2624, VScrollView.on_long_press_fire)
  A0_2624.on_move = L2_2626
  A0_2624.on_move_end = L3_2627
  A0_2624.on_at_index = L4_2628
  A0_2624.on_select_up = L5_2629
  A0_2624.on_select_down = L6_2630
  A0_2624.on_long_press = L7_2631
  L1_2625:On("CellMove", L2_2626)
  L1_2625:On("CellMoveEnd", L3_2627)
  L1_2625:On("CellAtIndex", L4_2628)
  L1_2625:On("CellSelectUp", L5_2629)
  L1_2625:On("CellSelectDown", L6_2630)
  L1_2625:On("CellLongPress", L7_2631)
  A0_2624.refresh = true
end
function VScrollView.on_stop_set(A0_2632)
  local L1_2633, L2_2634, L3_2635, L4_2636, L5_2637, L6_2638, L7_2639
  L1_2633 = A0_2632.render
  if not L1_2633 then
    return
  end
  L2_2634 = A0_2632.on_move
  L3_2635 = A0_2632.on_move_end
  L4_2636 = A0_2632.on_at_index
  L5_2637 = A0_2632.on_select_up
  L6_2638 = A0_2632.on_select_down
  L7_2639 = A0_2632.on_long_press
  A0_2632.on_move = nil
  A0_2632.on_move_end = nil
  A0_2632.on_at_index = nil
  A0_2632.on_select_up = nil
  A0_2632.on_select_down = nil
  A0_2632.on_long_press = nil
  L1_2633:Off("CellMove", L2_2634)
  L1_2633:Off("CellMoveEnd", L3_2635)
  L1_2633:Off("CellAtIndex", L4_2636)
  L1_2633:Off("CellSelectUp", L5_2637)
  L1_2633:Off("CellSelectDown", L6_2638)
  L1_2633:Off("CellLongPress", L7_2639)
end
function VScrollView.on_move_fire(A0_2640)
  local L1_2641
  A0_2640.fire = "Move"
end
function VScrollView.on_move_end_fire(A0_2642)
  local L1_2643
  A0_2642.fire = "MoveEnd"
  L1_2643 = A0_2642.page
  if not L1_2643 then
    return
  end
  L1_2643 = A0_2642.render
  if not L1_2643 then
    return
  end
  L1_2643:SetContentOffset((L1_2643:ItemAmount() - 1) * -A0_2642.width, 0, true)
end
function VScrollView.on_at_index_fire(A0_2644, A1_2645)
  local L2_2646, L3_2647, L4_2648, L5_2649, L6_2650
  L2_2646 = A0_2644.child
  L2_2646 = L2_2646.sort
  L3_2647 = A1_2645.Select
  L3_2647 = L3_2647 + 1
  L4_2648 = A1_2645.Cell
  L5_2649 = L2_2646[L3_2647]
  if L5_2649 then
    L6_2650 = L5_2649.render
  else
    L6_2650 = L6_2650 or nil
  end
  L4_2648:RemoveChildByTag(10)
  if L6_2650 then
    L6_2650:RemoveFromParent()
    L4_2648:AddChild(L6_2650)
  end
  A0_2644.fire = {
    "AtIndex",
    L4_2648,
    L3_2647
  }
end
function VScrollView.on_select_up_fire(A0_2651, A1_2652)
  A0_2651.fire = {
    "SelectUp",
    A1_2652.Cell,
    A1_2652.Select
  }
end
function VScrollView.on_select_down_fire(A0_2653, A1_2654)
  local L2_2655
  L2_2655 = {
    "SelectDown",
    A1_2654.Cell,
    A1_2654.Select
  }
  A0_2653.fire = L2_2655
  L2_2655 = A0_2653.page
  if not L2_2655 then
    return
  end
  L2_2655 = A0_2653.render
  if not L2_2655 then
    return
  end
  A0_2653.downindex = A1_2654.Select
  A0_2653.downx = L2_2655:ContentOffset().x
end
function VScrollView.on_long_press_fire(A0_2656, A1_2657)
  A0_2656.fire = {
    "LongPress",
    A1_2657.Cell,
    A1_2657.Select
  }
end
function VScrollView.class_get(A0_2658, A1_2659)
  local L2_2660
  L2_2660 = "VScrollView"
  return L2_2660
end
function VScrollView.prender_get(A0_2661, A1_2662, A2_2663)
end
function VScrollView.width_get(A0_2664, A1_2665)
  return rawget(A0_2664, "width")
end
function VScrollView.width_set(A0_2666, A1_2667, A2_2668)
  rawset(A0_2666, "width", A2_2668)
end
function VScrollView.downx_get(A0_2669, A1_2670)
  return rawget(A0_2669, "downx")
end
function VScrollView.downx_set(A0_2671, A1_2672, A2_2673)
  rawset(A0_2671, "downx", A2_2673)
end
function VScrollView.downindex_get(A0_2674, A1_2675)
  return rawget(A0_2674, "downindex")
end
function VScrollView.downindex_set(A0_2676, A1_2677, A2_2678)
  rawset(A0_2676, "downindex", A2_2678)
end
function VScrollView.page_get(A0_2679, A1_2680)
  return rawget(A0_2679, "page")
end
function VScrollView.page_set(A0_2681, A1_2682, A2_2683)
  rawset(A0_2681, "page", true)
end
function VScrollView.priority_set(A0_2684, A1_2685, A2_2686)
  local L3_2687
  L3_2687 = A0_2684.render
  if not L3_2687 then
    return
  end
  L3_2687:SetTouchPriority(A2_2686)
end
function VScrollView.offset_x_get(A0_2688, A1_2689)
  local L2_2690
  L2_2690 = A0_2688.render
  if not L2_2690 then
    return
  end
  return L2_2690:ContentOffset().x
end
function VScrollView.offset_x_set(A0_2691, A1_2692, A2_2693)
  local L3_2694
  L3_2694 = A0_2691.render
  if not L3_2694 then
    return
  end
  L3_2694:SetContentOffset(A2_2693, L3_2694:ContentOffset().y, false)
end
function VScrollView.offset_y_get(A0_2695, A1_2696)
  local L2_2697
  L2_2697 = A0_2695.render
  if not L2_2697 then
    return
  end
  return L2_2697:ContentOffset().y
end
function VScrollView.offset_y_set(A0_2698, A1_2699, A2_2700)
  local L3_2701
  L3_2701 = A0_2698.render
  if not L3_2701 then
    return
  end
  L3_2701:SetContentOffset(L3_2701:ContentOffset().x, A2_2700, false)
end
function VScrollView.offset_get(A0_2702, A1_2703)
  local L2_2704
  L2_2704 = A0_2702.render
  if not L2_2704 then
    return
  end
  return L2_2704:ContentOffset()
end
function VScrollView.bounceable_set(A0_2705, A1_2706, A2_2707)
  local L3_2708
  L3_2708 = A0_2705.render
  if not L3_2708 then
    return
  end
  L3_2708:SetBounceable(A2_2707)
end
function VScrollView.refresh_set(A0_2709, A1_2710, A2_2711)
  local L3_2712
  L3_2712 = A0_2709.render
  if not L3_2712 then
    return
  end
  for _FORV_7_, _FORV_8_ in pairs(A0_2709.child.all) do
    _FORV_8_.tag = 10
  end
  L3_2712:SetItemAmount(#A0_2709.child.sort)
end
