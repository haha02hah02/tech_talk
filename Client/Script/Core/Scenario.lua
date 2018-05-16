L0_2445 = Class
L0_2445 = L0_2445.Scenario
L0_2445 = L0_2445.Component
L0_2445({})
L0_2445 = {}
L0_2445[1] = "Update"
function Scenario.Constructor(A0_2446)
  Component.Constructor(A0_2446)
  if not Scene() then
    return
  end
  A0_2446.render = Scene()
  A0_2446.on = {
    "Start",
    A0_2446,
    Scenario.on_start_set
  }
  A0_2446.on = {
    "Stop",
    A0_2446,
    Scenario.on_stop_set
  }
end
function Scenario.class_get(A0_2447, A1_2448)
  local L2_2449
  L2_2449 = "Scenario"
  return L2_2449
end
function Scenario.rrender_get(A0_2450)
  local L1_2451, L2_2452
  L1_2451 = A0_2450.render
  if not L1_2451 then
    return
  end
  L2_2452 = A0_2450.transition
  if not L2_2452 then
    return L1_2451
  end
  return L2_2452(A0_2450.dura or 2, L1_2451)
end
function Scenario.dura_get(A0_2453)
  return rawget(A0_2453, "dura")
end
function Scenario.dura_set(A0_2454, A1_2455, A2_2456)
  rawset(A0_2454, "dura", A2_2456)
end
function Scenario.transition_get(A0_2457)
  return rawget(A0_2457, "transition")
end
function Scenario.transition_set(A0_2458, A1_2459, A2_2460)
  rawset(A0_2458, "transition", A2_2460)
end
function Scenario.on_enter_get(A0_2461, A1_2462)
  return rawget(A0_2461, "on_enter")
end
function Scenario.on_enter_set(A0_2463, A1_2464, A2_2465)
  rawset(A0_2463, "on_enter", A2_2465)
end
function Scenario.on_update_get(A0_2466, A1_2467)
  return rawget(A0_2466, "on_update")
end
function Scenario.on_update_set(A0_2468, A1_2469, A2_2470)
  rawset(A0_2468, "on_update", A2_2470)
end
function Scenario.on_exit_get(A0_2471, A1_2472)
  return rawget(A0_2471, "on_exit")
end
function Scenario.on_exit_set(A0_2473, A1_2474, A2_2475)
  rawset(A0_2473, "on_exit", A2_2475)
end
function Scenario.on_start_set(A0_2476)
  local L1_2477, L2_2478, L3_2479, L4_2480
  L1_2477 = A0_2476.render
  if not L1_2477 then
    return
  end
  L2_2478 = Functor
  L3_2479 = A0_2476
  L4_2480 = Scenario
  L4_2480 = L4_2480.on_update_fire
  L2_2478 = L2_2478(L3_2479, L4_2480)
  L3_2479 = Functor
  L4_2480 = A0_2476
  L3_2479 = L3_2479(L4_2480, Scenario.on_enter_fire)
  L4_2480 = Functor
  L4_2480 = L4_2480(A0_2476, Scenario.on_exit_fire)
  A0_2476.on_enter = L3_2479
  A0_2476.on_exit = L4_2480
  A0_2476.on_update = L2_2478
  L1_2477:On("Update", L2_2478)
  L1_2477:On("Enter", L3_2479)
  L1_2477:On("Exit", L4_2480)
end
function Scenario.on_stop_set(A0_2481)
  local L1_2482, L2_2483, L3_2484, L4_2485
  L1_2482 = A0_2481.render
  if not L1_2482 then
    return
  end
  L2_2483 = A0_2481.on_update
  L3_2484 = A0_2481.on_enter
  L4_2485 = A0_2481.on_exit
  A0_2481.on_enter = nil
  A0_2481.on_exit = nil
  A0_2481.on_update = nil
  L1_2482:Off("Update", L2_2483)
  L1_2482:Off("Enter", L3_2484)
  L1_2482:Off("Exit", L4_2485)
  L1_2482:UnscheduleUpdate()
end
function Scenario.on_enter_fire(A0_2486)
  local L1_2487, L2_2488
  A0_2486.fire = "Enter"
  L1_2487 = A0_2486.render
  if L1_2487 then
    L2_2488 = L1_2487.ScheduleUpdate
    L2_2488(L1_2487)
  end
  L2_2488 = A0_2486.bgm
  if not L2_2488 then
    return
  end
  Sound:PlayBackgroundMusic(L2_2488, rawget(A0_2486, "bgm_loop"))
end
function Scenario.on_exit_fire(A0_2489)
  local L1_2490
  A0_2489.fire = "Exit"
  L1_2490 = A0_2489.render
  if L1_2490 then
    L1_2490:UnscheduleUpdate()
  end
  A0_2489.stop = true
end
function Scenario.on_update_fire(A0_2491, A1_2492)
  L0_2445[2] = A1_2492.Delay
  A0_2491.fire = L0_2445
end
function Scenario.bgm_get(A0_2493, A1_2494)
  return rawget(A0_2493, "bgm")
end
function Scenario.bgm_set(A0_2495, A1_2496, A2_2497, A3_2498)
  rawset(A0_2495, "bgm", A2_2497)
  rawset(A0_2495, "bgm_loop", A3_2498 and true or false)
end
