Class.HitSound.Component({})
function HitSound.Constructor(A0_8466, A1_8467)
  Component.Constructor(A0_8466)
  A0_8466.name = "hit_sound"
end
function HitSound.class_get(A0_8468)
  local L1_8469
  L1_8469 = "HitSound"
  return L1_8469
end
function HitSound.attach_set(A0_8470)
  local L1_8471, L2_8472, L4_8473
  L1_8471 = A0_8470.parent
  if not L1_8471 then
    return
  end
  L2_8472 = L1_8471.info
  L2_8472 = L2_8472.hit_bgm
  if L2_8472 then
    L4_8473 = Sound
    L4_8473 = L4_8473.PlayEffect
    L4_8473(L4_8473, string.format("Music/%s", L2_8472))
  end
end
