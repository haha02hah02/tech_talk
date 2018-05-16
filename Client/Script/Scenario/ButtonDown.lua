Class.ButtonDown.None({})
function ButtonDown.Constructor(A0_5991, A1_5992)
  if not A1_5992 then
    return
  end
  A1_5992.on = {
    "Down",
    A0_5991,
    A0_5991.OnDown
  }
end
function ButtonDown.OnDown(A0_5993, A1_5994)
  Sound:PlayEffect("Music/UI/BtMouseClick.mp3")
end
