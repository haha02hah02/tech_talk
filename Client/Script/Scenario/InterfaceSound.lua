Class.InterfaceSound.Script({})
function InterfaceSound.Constructor(A0_6520, A1_6521)
  Script.Constructor(A0_6520, A1_6521)
  if not A1_6521 then
    return
  end
  A1_6521.on = {
    "Visible",
    A0_6520,
    A0_6520.OnVisible
  }
end
function InterfaceSound.OnVisible(A0_6522, A1_6523)
  local L2_6524
  L2_6524 = A1_6523.visible
  if L2_6524 then
    L2_6524 = "Music/UI/DlgNotice.mp3"
  else
    L2_6524 = L2_6524 or "Music/UI/DragStart.mp3"
  end
  Sound:PlayEffect(L2_6524)
end
