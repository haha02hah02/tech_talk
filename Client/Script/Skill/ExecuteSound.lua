Class.ExecuteSound.Component({})
function ExecuteSound.Constructor(A0_8425, A1_8426)
  Component.Constructor(A0_8425)
  A0_8425.name = "execute_sound"
  A0_8425.on = {
    "Parent",
    A0_8425,
    ExecuteSound.on_set_parent_fire
  }
end
function ExecuteSound.class_get(A0_8427)
  local L1_8428
  L1_8428 = "ExecuteSound"
  return L1_8428
end
function ExecuteSound.attach_set(A0_8429)
  local L1_8430, L2_8431, L4_8432
  L1_8430 = A0_8429.parent
  if not L1_8430 then
    return
  end
  L2_8431 = L1_8430.info
  L2_8431 = L2_8431.execute_bgm
  if L2_8431 then
    L4_8432 = Sound
    L4_8432 = L4_8432.PlayEffect
    L4_8432(L4_8432, string.format("Music/%s", L2_8431))
  end
end
function ExecuteSound.on_execute_cast_fire(A0_8433)
  local L1_8434
  A0_8433.attach = true
end
function ExecuteSound.on_set_parent_fire(A0_8435)
  local L1_8436, L2_8437
  L1_8436 = A0_8435.parent
  if not L1_8436 then
    return
  end
  L2_8437 = L1_8436.parent
  A0_8435.make = L2_8437
  L2_8437 = {
    "execute",
    A0_8435,
    ExecuteSound.on_execute_cast_fire
  }
  L1_8436.on = L2_8437
end
