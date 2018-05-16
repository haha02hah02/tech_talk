Class.OperateProxy.Component({})
function OperateProxy.Constructor(A0_4703)
  Component.Constructor(A0_4703)
  A0_4703.on = {
    "Start",
    A0_4703,
    OperateProxy.on_start_fire
  }
  A0_4703.on = {
    "Stop",
    A0_4703,
    OperateProxy.on_stop_fire
  }
end
function OperateProxy.class_get(A0_4704)
  local L1_4705
  L1_4705 = "OperateProxy"
  return L1_4705
end
function OperateProxy.on_joystick_fire(A0_4706, A1_4707, A2_4708)
  local L3_4709
  L3_4709 = A0_4706.parent
  if not L3_4709 then
    return
  end
  if A1_4707 == "left" then
    L3_4709.left = true
    return
  end
  if A1_4707 == "right" then
    L3_4709.right = true
    return
  end
  if A1_4707 == "up" then
    L3_4709.up = true
    return
  end
  if A1_4707 == "down" then
    L3_4709.down = true
    return
  end
  if A1_4707 == "jump" then
    L3_4709.jump = true
    return
  end
  if A1_4707 == "nothing" then
    L3_4709.nothing = true
    return
  end
  if A1_4707 == "attack" then
    L3_4709.attack = A2_4708
    return
  end
end
function OperateProxy.on_start_fire(A0_4710)
  Event:On("joystick", A0_4710, OperateProxy.on_joystick_fire, 0)
end
function OperateProxy.on_stop_fire(A0_4711)
  Event:Off("joystick", A0_4711, OperateProxy.on_joystick_fire)
end
