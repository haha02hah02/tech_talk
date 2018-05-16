L0_551 = Class
L0_551 = L0_551.MobAvatar
L0_551 = L0_551.Component
L0_551({})
L0_551 = {}
L0_551[8500001] = 4096
L0_551[8800000] = 4096
L0_551[8800001] = 4096
L0_551[8800002] = 4096
L0_551[8800007] = 4096
L0_551[8200012] = 4096
L0_551[8220004] = 4096
L0_551[8220005] = 4096
L0_551[8220006] = 4096
L0_551[8810002] = 4096
L0_551[8810003] = 4096
L0_551[8810004] = 4096
L0_551[8810005] = 4096
L0_551[8810006] = 4096
L0_551[8810007] = 4096
L0_551[8810008] = 4096
L0_551[8810018] = 4096
function MobAvatar.Constructor(A0_552, A1_553)
  Component.Constructor(A0_552)
  if not NodeRGBA() then
    return
  end
  A0_552.render = NodeRGBA()
  A0_552.id = A1_553
  A0_552.height, A0_552.width = A0_552.info.height, A0_552.info.width
  Image().name = "avatar"
  Image().y = -A0_552.info.height / 2
  Image().parent = A0_552
  Image("UI/Base/hp_bg.ntp").name = "progress_bg"
  Image("UI/Base/hp_bg.ntp").y = A0_552.info.height / 2 + 10
  Image("UI/Base/hp_bg.ntp").visible = false
  Image("UI/Base/hp_bg.ntp").parent = A0_552
  Progress("UI/Base/hp_progress.ntp").name = "progress"
  Progress("UI/Base/hp_progress.ntp").y = A0_552.info.height / 2 + 10
  Progress("UI/Base/hp_progress.ntp").percent = 100
  Progress("UI/Base/hp_progress.ntp").visible = false
  Progress("UI/Base/hp_progress.ntp").parent = A0_552
  TNameTag(string.format("Lv.%d %s", LoadConf(string.format("Mob/%d.mob", A1_553)).info.level, LoadConf(string.format("Mob/%d.mob", A1_553)).info.name)).name = "name_tag"
  TNameTag(string.format("Lv.%d %s", LoadConf(string.format("Mob/%d.mob", A1_553)).info.level, LoadConf(string.format("Mob/%d.mob", A1_553)).info.name)).y = -10 - LoadConf(string.format("Mob/%d.mob", A1_553)).info.height / 2
  TNameTag(string.format("Lv.%d %s", LoadConf(string.format("Mob/%d.mob", A1_553)).info.level, LoadConf(string.format("Mob/%d.mob", A1_553)).info.name)).visible = false
  TNameTag(string.format("Lv.%d %s", LoadConf(string.format("Mob/%d.mob", A1_553)).info.level, LoadConf(string.format("Mob/%d.mob", A1_553)).info.name)).parent = A0_552
  A0_552.on = {
    "Start",
    A0_552,
    MobAvatar.on_start_fire
  }
  A0_552.on = {
    "Stop",
    A0_552,
    MobAvatar.on_stop_fire
  }
  A0_552.on = {
    "Parent",
    A0_552,
    MobAvatar.on_parent_fire
  }
  Image().render:SetCascadeColorEnabled(true)
  Image().render:SetCascadeOpacityEnabled(true)
end
function MobAvatar.class_get(A0_554, A1_555)
  local L2_556
  L2_556 = "MobAvatar"
  return L2_556
end
function MobAvatar.crender_get(A0_557)
  local L1_558
end
function MobAvatar.id_get(A0_559, A1_560)
  return rawget(A0_559, "id")
end
function MobAvatar.id_set(A0_561, A1_562, A2_563)
  if not A2_563 then
    return
  end
  rawset(A0_561, "id", A2_563)
  A0_561.over_size = (L0_551[A2_563] or 2048) > Configuration:MaxTextureSize()
  A0_561.load_actions = A2_563
end
function MobAvatar.info_get(A0_564, A1_565)
  return rawset(A0_564, "info")
end
function MobAvatar.info_set(A0_566, A1_567, A2_568)
  rawset(A0_566, "info", A2_568)
end
function MobAvatar.width_get(A0_569)
  return rawget(A0_569, "width")
end
function MobAvatar.width_set(A0_570, A1_571, A2_572)
  rawset(A0_570, "width", A2_572)
end
function MobAvatar.height_get(A0_573)
  return rawget(A0_573, "height")
end
function MobAvatar.height_set(A0_574, A1_575, A2_576)
  rawset(A0_574, "height", A2_576)
end
function MobAvatar.show_info_set(A0_577, A1_578, A2_579)
  local L3_580
  L3_580 = A0_577.progress_bg
  L3_580.visible = A2_579
  L3_580 = A0_577.progress
  L3_580.visible = A2_579
  L3_580 = A0_577.name_tag
  L3_580.visible = A2_579
end
function MobAvatar.swim_get(A0_581, A1_582)
  return rawget(A0_581, "swim")
end
function MobAvatar.swim_set(A0_583, A1_584, A2_585)
  rawset(A0_583, "swim", A2_585)
end
function MobAvatar.layer_get(A0_586, A1_587)
  return rawget(A0_586, "layer")
end
function MobAvatar.layer_set(A0_588, A1_589, A2_590)
  if not A2_590 then
    return
  end
  if A0_588.layer == A2_590 then
    return
  end
  rawset(A0_588, "layer", A2_590)
  if not A0_588.parent then
    return
  end
  if not A0_588.parent[tostring(A2_590)] then
    return
  end
  A0_588.render:RemoveFromParentAndCleanup(false)
  A0_588.parent[tostring(A2_590)].render:AddChild(A0_588.render)
end
function MobAvatar.over_size_get(A0_591, A1_592)
  return rawget(A0_591, "over_size")
end
function MobAvatar.over_size_set(A0_593, A1_594, A2_595)
  rawset(A0_593, "over_size", A2_595)
end
function MobAvatar.death_delay_get(A0_596, A1_597)
  return rawget(A0_596, "death_delay")
end
function MobAvatar.death_delay_set(A0_598, A1_599, A2_600)
  rawset(A0_598, "death_delay", A2_600)
end
function MobAvatar.actions_get(A0_601)
  local L1_602
  L1_602 = A0_601.array
  return L1_602
end
function MobAvatar.array_get(A0_603, A1_604)
  return rawget(A0_603, "array")
end
function MobAvatar.array_set(A0_605, A1_606, A2_607, A3_608)
  local L4_609
  L4_609 = rawget
  L4_609 = L4_609(A0_605, "array")
  if not L4_609 then
    L4_609 = {}
    rawset(A0_605, "array", L4_609)
  end
  L4_609[A2_607] = A3_608
end
function MobAvatar.default_frame_get(A0_610, A1_611)
  return rawget(A0_610, "default_frame")
end
function MobAvatar.default_frame_set(A0_612, A1_613, A2_614)
  rawset(A0_612, "default_frame", A2_614)
end
function MobAvatar.load_actions_set(A0_615, A1_616, A2_617)
  local L3_618, L4_619, L5_620, L6_621, L7_622, L8_623, L9_624, L10_625, L11_626, L12_627, L13_628, L14_629, L15_630, L16_631, L17_632, L18_633, L19_634, L20_635, L21_636, L22_637
  if not A2_617 then
    return
  end
  L3_618 = LoadConf
  L4_619 = string
  L4_619 = L4_619.format
  L5_620 = "Mob/%d.mob"
  L6_621 = A2_617
  L22_637 = L4_619(L5_620, L6_621)
  L3_618 = L3_618(L4_619, L5_620, L6_621, L7_622, L8_623, L9_624, L10_625, L11_626, L12_627, L13_628, L14_629, L15_630, L16_631, L17_632, L18_633, L19_634, L20_635, L21_636, L22_637, L4_619(L5_620, L6_621))
  if not L3_618 then
    return
  end
  L4_619 = L3_618.info
  L5_620 = L3_618.id
  if L5_620 ~= A2_617 then
    L5_620 = Event
    L6_621 = L5_620
    L5_620 = L5_620.Fire
    L7_622 = "DataException"
    L8_623 = "conf_data"
    L5_620(L6_621, L7_622, L8_623)
    return
  end
  L5_620 = L4_619.model
  if L5_620 ~= A2_617 then
    L5_620 = LoadConf
    L6_621 = string
    L6_621 = L6_621.format
    L7_622 = "Mob/%d.mob"
    L8_623 = L4_619.model
    L22_637 = L6_621(L7_622, L8_623)
    L5_620 = L5_620(L6_621, L7_622, L8_623, L9_624, L10_625, L11_626, L12_627, L13_628, L14_629, L15_630, L16_631, L17_632, L18_633, L19_634, L20_635, L21_636, L22_637, L6_621(L7_622, L8_623))
    L3_618 = L5_620
    L4_619 = L3_618.info
  end
  L5_620 = L3_618.data
  L6_621 = L3_618.frame
  L7_622 = A0_615.over_size
  A0_615.info = L4_619
  L8_623 = L4_619.fly_speed
  if L8_623 then
    L8_623 = "fly"
  else
    L8_623 = L8_623 or "stand"
  end
  if not L7_622 then
    L12_627 = L4_619.model
    L12_627 = L11_626
    L13_628 = L9_624
    L14_629 = L10_625
    L11_626(L12_627, L13_628, L14_629)
    L12_627 = L11_626.start
    L12_627 = L5_620[L12_627]
    L13_628 = Sprite
    L13_628 = L13_628()
    A0_615.default_frame = L13_628
    L15_630 = L13_628
    L14_629 = L13_628.InitWithSpriteFrameName
    L14_629(L15_630, L16_631)
  else
    L12_627 = "Mob/%s/%s"
    L13_628 = string
    L13_628 = L13_628.format
    L14_629 = "%d"
    L15_630 = L4_619.model
    L13_628 = L13_628(L14_629, L15_630)
    L14_629 = L10_625.file_name
    L12_627 = Sprite
    L13_628 = L11_626
    L12_627 = L12_627(L13_628)
    oStand = L12_627
    L12_627 = oStand
    A0_615.default_frame = L12_627
  end
  for L12_627, L13_628 in L9_624(L10_625) do
    L14_629 = Array
    L14_629 = L14_629()
    L15_630 = 0
    for L19_634 = L13_628.start, L13_628.final do
      L20_635 = L5_620[L19_634]
      if L7_622 then
        L21_636 = string
        L21_636 = L21_636.format
        L22_637 = "Mob/%s/%s"
        L21_636 = L21_636(L22_637, string.format("%d", L4_619.model), L20_635.file_name)
      else
        L21_636 = L21_636 or L20_635.file_name
      end
      if L7_622 then
        L22_637 = Animate
        L22_637 = L22_637(L21_636, L20_635.origin.x, L20_635.origin.y, L20_635.delay / 1000.0)
      elseif not L22_637 then
        L22_637 = Animate
        L22_637 = L22_637(L21_636, L20_635.origin.x, L20_635.origin.y, L20_635.delay / 1000.0, 0)
      end
      L15_630 = L15_630 + L20_635.delay / 1000.0
      if L22_637 then
        L14_629:AddObject(L22_637)
      end
    end
    if L12_627 == "die1" or L12_627 == "die" then
      A0_615.death_delay = L15_630
      if not L16_631 then
        L22_637 = L18_633()
        L16_631(L17_632, L18_633, L19_634, L20_635, L21_636, L22_637, L18_633())
      end
    end
    A0_615.array = L16_631
  end
end
function MobAvatar.direction_get(A0_638, A1_639)
  return rawget(A0_638, "direction") or "left"
end
function MobAvatar.direction_set(A0_640, A1_641, A2_642)
  if not A2_642 then
    return
  end
  if not A0_640.render then
    return
  end
  if A2_642 == "left" then
    A0_640.avatar.rotation_y = 0
  elseif A2_642 == "right" then
    A0_640.avatar.rotation_y = -180
  else
    return
  end
  rawset(A0_640, "direction", A2_642)
end
function MobAvatar.status_action_get(A0_643, A1_644)
  return rawget(A0_643, "status_action")
end
function MobAvatar.status_action_set(A0_645, A1_646, A2_647)
  rawset(A0_645, "status_action", A2_647)
end
function MobAvatar.status_get(A0_648, A1_649)
  return rawget(A0_648, "status")
end
function MobAvatar.status_name(A0_650, A1_651)
  local L2_652
  L2_652 = STATUS_JUMP
  if A1_651 == L2_652 then
    L2_652 = "jump"
    return L2_652
  end
  L2_652 = STATUS_FALL
  if A1_651 == L2_652 then
    L2_652 = "jump"
    return L2_652
  end
  L2_652 = STATUS_LADDER
  if A1_651 == L2_652 then
    L2_652 = "ladder"
    return L2_652
  end
  L2_652 = STATUS_ROPE
  if A1_651 == L2_652 then
    L2_652 = "rope"
    return L2_652
  end
  L2_652 = STATUS_WALK
  if A1_651 == L2_652 then
    L2_652 = A0_650.info
    L2_652 = L2_652.fly_speed
    if L2_652 then
      L2_652 = "fly"
    else
      L2_652 = L2_652 or "move"
    end
    return L2_652
  end
  L2_652 = STATUS_FLY
  if A1_651 == L2_652 then
    L2_652 = "fly"
    return L2_652
  end
  L2_652 = STATUS_STAND
  if A1_651 == L2_652 then
    L2_652 = A0_650.info
    L2_652 = L2_652.fly_speed
    if L2_652 then
      L2_652 = "fly"
    else
      L2_652 = L2_652 or "stand"
    end
    return L2_652
  end
  L2_652 = STATUS_HIT
  if A1_651 == L2_652 then
    L2_652 = "hit1"
    return L2_652
  end
  L2_652 = STATUS_DIE
  if A1_651 == L2_652 then
    L2_652 = "die1"
    return L2_652
  end
end
function MobAvatar.action_set(A0_653, A1_654, A2_655)
  local L4_656
  L4_656 = A0_653.status_action
  A0_653.status_action = A2_655
  A0_653.avatar.unaction = L4_656
  A0_653.avatar.action = A2_655
end
function MobAvatar.status_set(A0_657, A1_658, A2_659)
  local L3_660, L4_661, L5_662, L6_663, L7_664, L8_665
  L3_660 = A0_657.status
  L4_661 = MobAvatar
  L4_661 = L4_661.status_name
  L5_662 = A0_657
  L6_663 = A2_659
  L4_661 = L4_661(L5_662, L6_663)
  A2_659 = L4_661
  if not A2_659 or L3_660 == A2_659 then
    return
  end
  L4_661 = rawset
  L5_662 = A0_657
  L6_663 = "status"
  L7_664 = A2_659
  L4_661(L5_662, L6_663, L7_664)
  if A2_659 ~= "hit1" and A2_659 ~= "die1" and A2_659 ~= "die" then
    L4_661 = true
  else
    L4_661 = L4_661 or false
  end
  L5_662 = A0_657.array
  L5_662 = L5_662[A2_659]
  L6_663 = Array
  L6_663 = L6_663()
  L7_664 = A0_657.info
  if not L5_662 then
    return
  end
  L8_665 = L6_663.InitWithArray
  L8_665(L6_663, L5_662)
  if A2_659 == "die" or A2_659 == "die1" then
    L8_665 = L7_664.death_show
    if not L8_665 then
      L8_665 = ActionInstant
      L8_665 = L8_665(Functor(A0_657, MobAvatar.OnSetDefault))
      L6_663:AddObject(L8_665)
    end
  end
  L8_665 = L7_664.immoveable
  if L8_665 and A2_659 ~= "die1" and A2_659 ~= "die" and A2_659 ~= "stand" then
    L8_665 = ActionInstant
    L8_665 = L8_665(Functor(A0_657, MobAvatar.OnSetNormalState))
    L6_663:AddObject(L8_665)
  end
  if L4_661 then
    L8_665 = RepeatForever
    L8_665 = L8_665(Sequence(L6_663))
  elseif not L8_665 then
    L8_665 = Sequence
    L8_665 = L8_665(L6_663)
  end
  A0_657.action = L8_665
end
function MobAvatar.OnSetDefault(A0_666)
  local L1_667, L2_668, L3_669, L4_670
  L1_667 = A0_666.child
  L1_667 = L1_667.all
  L1_667 = L1_667.avatar
  L1_667 = L1_667.render
  if not L1_667 then
    return
  end
  L2_668 = A0_666.default_frame
  L4_670 = L1_667
  L3_669 = L1_667.InitWithTexture
  L3_669(L4_670, L2_668:Texture(), L2_668:TextureRect())
end
function MobAvatar.OnSetNormalState(A0_671)
  local L2_672
  L2_672 = A0_671.info
  A0_671.status = L2_672.fly_speed and STATUS_FLY or STATUS_STAND
end
function MobAvatar.on_start_fire(A0_673)
  local L1_674
end
function MobAvatar.on_stop_fire(A0_675)
  local L1_676
end
function MobAvatar.remove_self(A0_677)
  A0_677.render:RemoveFromParent()
end
function MobAvatar.remove_self_set(A0_678)
  local L1_679
  L1_679 = Array
  L1_679 = L1_679()
  L1_679:AddObject(DelayTime(A0_678.death_delay))
  L1_679:AddObject(ActionInstant(Functor(A0_678, MobAvatar.remove_self)))
  A0_678.render:RunAction(Sequence(L1_679))
end
function MobAvatar.on_parent_fire(A0_680)
  local L1_681
  L1_681 = A0_680.parent
  if not L1_681 then
    A0_680.remove_self = true
    return
  end
  if not (L1_681.class == "Map" and L1_681[tostring(A0_680.layer)] or L1_681) then
    return
  end
  A0_680.render:RemoveFromParentAndCleanup(false)
  ;(L1_681.class == "Map" and L1_681[tostring(A0_680.layer)] or L1_681).render:AddChild(A0_680.render, 100000000)
end
