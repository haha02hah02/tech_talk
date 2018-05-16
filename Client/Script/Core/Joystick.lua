Class.Joystick.Component({})
function Joystick.Constructor(A0_2280, A1_2281, A2_2282, A3_2283, A4_2284, A5_2285, A6_2286)
  Component.Constructor(A0_2280)
  if not CJoystick(Point(A1_2281, A2_2282), A3_2283, A4_2284, A5_2285, A6_2286 and true or false) then
    return
  end
  A0_2280.render = CJoystick(Point(A1_2281, A2_2282), A3_2283, A4_2284, A5_2285, A6_2286 and true or false)
  A0_2280.on = {
    "Start",
    A0_2280,
    Joystick.on_start_fire
  }
  A0_2280.on = {
    "Stop",
    A0_2280,
    Joystick.on_stop_fire
  }
end
function Joystick.class_get(A0_2287)
  local L1_2288
  L1_2288 = "Joystick"
  return L1_2288
end
function Joystick.priority_set(A0_2289, A1_2290, A2_2291)
  local L3_2292
  L3_2292 = A0_2289.render
  if not L3_2292 then
    return
  end
  L3_2292:SetTouchPriority(A2_2291)
end
function Joystick.active_get(A0_2293, A1_2294)
  local L2_2295
  L2_2295 = A0_2293.render
  if not L2_2295 then
    return
  end
  return L2_2295:IsActive()
end
function Joystick.active_set(A0_2296, A1_2297, A2_2298)
  local L3_2299
  L3_2299 = A0_2296.render
  if not L3_2299 then
    return
  end
  if A2_2298 then
    L3_2299:Active()
    return
  end
  L3_2299:Inactive()
end
function Joystick.inactive_get(A0_2300, A1_2301)
  local L2_2302
  L2_2302 = A0_2300.render
  if not L2_2302 then
    return
  end
  return not L2_2302:IsActive()
end
function Joystick.inactive_set(A0_2303, A1_2304, A2_2305)
  local L3_2306
  L3_2306 = A0_2303.render
  if not L3_2306 then
    return
  end
  if not A2_2305 then
    L3_2306:Active()
    return
  end
  L3_2306:Inactive()
end
function Joystick.direction_get(A0_2307, A1_2308)
  local L2_2309
  L2_2309 = A0_2307.render
  if not L2_2309 then
    return
  end
  return L2_2309:Direction().x, L2_2309:Direction().y
end
function Joystick.direction_set(A0_2310, A1_2311, A2_2312)
  local L3_2313
  L3_2313 = A0_2310.render
  if not L3_2313 then
    return
  end
  if A2_2312 == 4 then
    L3_2313:SetEightDirection(false)
    return
  end
  if A2_2312 == 8 then
    L3_2313:SetEightDirection(true)
    return
  end
end
function Joystick.is_jump_get(A0_2314, A1_2315)
  return rawget(A0_2314, "is_jump")
end
function Joystick.is_jump_set(A0_2316, A1_2317, A2_2318)
  rawset(A0_2316, "is_jump", A2_2318)
end
function Joystick.on_update_get(A0_2319, A1_2320)
  return rawget(A0_2319, "on_update")
end
function Joystick.on_update_set(A0_2321, A1_2322, A2_2323)
  rawset(A0_2321, "on_update", A2_2323)
end
function Joystick.on_start_fire(A0_2324)
  A0_2324.on_update = Functor(A0_2324, Joystick.on_update_fire)
  A0_2324.render:On("Update", A0_2324.on_update)
end
function Joystick.opera_code_get(A0_2325)
  local L1_2326
  L1_2326 = A0_2325.render
  if not L1_2326 then
    return
  end
  if L1_2326:Direction().x == -1 and L1_2326:Direction().y == 0 then
    return "left"
  end
  if L1_2326:Direction().x == 1 and L1_2326:Direction().y == 0 then
    return "right"
  end
  if L1_2326:Direction().x == 0 and L1_2326:Direction().y == 1 then
    return "up"
  end
  if L1_2326:Direction().x == 0 and L1_2326:Direction().y == -1 then
    return "down"
  end
  return "nothing"
end
if Platform == Platform_Windows then
  function Joystick.on_update_fire(A0_2327)
    if IsKeyDown(VK_LEFT) then
      Event:Fire("joystick", "left")
    elseif IsKeyDown(VK_RIGHT) then
      Event:Fire("joystick", "right")
    elseif IsKeyDown(VK_UP) then
      Event:Fire("joystick", "up")
    elseif IsKeyDown(VK_DOWN) then
      Event:Fire("joystick", "down")
    else
      Event:Fire("joystick", "nothing")
    end
    if IsKeyDown(VK_F) then
      if not A0_2327.is_jump then
        A0_2327.is_jump = true
        Event:Fire("joystick", "jump")
      end
    else
      A0_2327.is_jump = false
    end
    if not IsKeyDown(VK_A) then
      return
    end
    Event:Fire("joystick", "attack", UniqueComponent("Model/interface.model").node.attack.tag)
  end
else
  function Joystick.on_update_fire(A0_2328)
    local L1_2329
    L1_2329 = A0_2328.render
    if not L1_2329 then
      return
    end
    if L1_2329:Direction().x == -1 and L1_2329:Direction().y == 0 then
      Event:Fire("joystick", "left")
    elseif L1_2329:Direction().x == 1 and L1_2329:Direction().y == 0 then
      Event:Fire("joystick", "right")
    elseif L1_2329:Direction().x == 0 and L1_2329:Direction().y == 1 then
      Event:Fire("joystick", "up")
    elseif L1_2329:Direction().x == 0 and L1_2329:Direction().y == -1 then
      Event:Fire("joystick", "down")
    else
      Event:Fire("joystick", "nothing")
    end
  end
end
function Joystick.on_stop_fire(A0_2330)
  A0_2330.render:Off("Update", A0_2330.on_update)
  A0_2330.on_update = nil
end
