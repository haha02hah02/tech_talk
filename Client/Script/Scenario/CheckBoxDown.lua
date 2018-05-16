Class.CheckBoxDown.None({})
function CheckBoxDown.Constructor(A0_6156, A1_6157)
  local L2_6158
  if not A1_6157 then
    return
  end
  L2_6158 = {
    "Checked",
    A0_6156,
    A0_6156.OnDown
  }
  A1_6157.on = L2_6158
  L2_6158 = {
    "Unchecked",
    A0_6156,
    A0_6156.OnDown
  }
  A1_6157.on = L2_6158
end
function CheckBoxDown.OnDown(A0_6159, A1_6160)
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
end
