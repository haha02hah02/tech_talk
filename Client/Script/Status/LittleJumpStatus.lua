L0_8573 = Class
L0_8573 = L0_8573.LittleJumpStatus
L0_8573 = L0_8573.Component
L0_8573({})
L0_8573 = {6, 15}
function LittleJumpStatus.Constructor(A0_8574, A1_8575, A2_8576, A3_8577)
  Component.Constructor(A0_8574)
  A0_8574.name = "proxy"
end
function LittleJumpStatus.class_get(A0_8578)
  local L1_8579
  L1_8579 = "LittleJumpStatus"
  return L1_8579
end
function LittleJumpStatus.on_update_fire(A0_8580, A1_8581)
  local L2_8582, L3_8583
  L2_8582 = A1_8581.status
  L3_8583 = STATUS_STAND
  if L2_8582 ~= L3_8583 then
    return
  end
  L2_8582 = A0_8580.parent
  if not L2_8582 then
    return
  end
  L3_8583 = L2_8582.id
  A1_8581.unattach_status = L3_8583
end
function LittleJumpStatus.attach_set(A0_8584, A1_8585, A2_8586)
  local L3_8587, L4_8588
  L3_8587 = A2_8586.source
  if not L3_8587 then
    return
  end
  L4_8588 = A2_8586.target
  L4_8588 = L4_8588.direction
  if L4_8588 == "left" then
    L4_8588 = -6
  else
    L4_8588 = L4_8588 or 6
  end
  L0_8573[1] = L4_8588
  L4_8588 = L0_8573
  L3_8587.impulse = L4_8588
  L4_8588 = {
    "Update",
    A0_8584,
    LittleJumpStatus.on_update_fire
  }
  L3_8587.on = L4_8588
end
function LittleJumpStatus.unattach_set(A0_8589, A1_8590, A2_8591)
  local L3_8592
  L3_8592 = A2_8591.source
  if not L3_8592 then
    return
  end
  L3_8592.off = {
    "Update",
    A0_8589,
    LittleJumpStatus.on_update_fire
  }
end
