Class.CastSound.Component({})
function CastSound.Constructor(A0_8348, A1_8349)
  Component.Constructor(A0_8348)
  A0_8348.name = "cast_sound"
  A0_8348.on = {
    "Parent",
    A0_8348,
    CastSound.on_set_parent_fire
  }
end
function CastSound.class_get(A0_8350)
  local L1_8351
  L1_8351 = "CastSound"
  return L1_8351
end
function CastSound.attach_set(A0_8352)
  local L1_8353, L2_8354, L4_8355
  L1_8353 = A0_8352.parent
  if not L1_8353 then
    return
  end
  L2_8354 = L1_8353.info
  L2_8354 = L2_8354.use_bgm
  if L2_8354 then
    L4_8355 = Sound
    L4_8355 = L4_8355.PlayEffect
    L4_8355(L4_8355, string.format("Music/%s", L2_8354))
  end
end
function CastSound.on_skill_cast_fire(A0_8356)
  local L1_8357
  A0_8356.attach = true
end
function CastSound.on_set_parent_fire(A0_8358)
  local L1_8359
  L1_8359 = A0_8358.parent
  if not L1_8359 then
    return
  end
  L1_8359.on = {
    "cast",
    A0_8358,
    CastSound.on_skill_cast_fire
  }
end
