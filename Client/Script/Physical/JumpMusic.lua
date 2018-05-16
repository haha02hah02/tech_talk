Class.JumpMusic.Component({})
function JumpMusic.Constructor(A0_4547)
  Component.Constructor(A0_4547)
  A0_4547.on = {
    "Start",
    A0_4547,
    JumpMusic.on_start_fire
  }
  A0_4547.on = {
    "Stop",
    A0_4547,
    JumpMusic.on_stop_fire
  }
  A0_4547.name = "jump_music"
end
function JumpMusic.class_get(A0_4548)
  local L1_4549
  L1_4549 = "JumpMusic"
  return L1_4549
end
function JumpMusic.on_jump_fire(A0_4550, A1_4551)
  local L2_4552
  L2_4552 = A0_4550.parent
  if not L2_4552 then
    return
  end
  if L2_4552.status ~= STATUS_JUMP then
    return
  end
  Sound:PlayEffect("Music/Game/Jump.mp3")
end
function JumpMusic.on_start_fire(A0_4553)
  local L1_4554
  L1_4554 = A0_4553.parent
  if not L1_4554 then
    return
  end
  L1_4554.on = {
    "Status",
    A0_4553,
    JumpMusic.on_jump_fire
  }
end
function JumpMusic.on_stop_fire(A0_4555)
  local L1_4556
  L1_4556 = A0_4555.parent
  if not L1_4556 then
    return
  end
  L1_4556.off = {
    "Status",
    A0_4555,
    JumpMusic.on_jump_fire
  }
end
