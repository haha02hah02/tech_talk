Class.NpcAvatar.Component({})
function NpcAvatar.Constructor(A0_703, A1_704)
  Component.Constructor(A0_703)
  if not Sprite() then
    return
  end
  A0_703.render = Sprite()
  A0_703.id = A1_704
  TNameTag(LoadConf(string.format("Npc/%d.npc", A1_704)).info.name).name = "name_tag"
  TNameTag(LoadConf(string.format("Npc/%d.npc", A1_704)).info.name).color = 4294901760
  TNameTag(LoadConf(string.format("Npc/%d.npc", A1_704)).info.name).x = LoadConf(string.format("Npc/%d.npc", A1_704)).info.width / 2
  TNameTag(LoadConf(string.format("Npc/%d.npc", A1_704)).info.name).y = -10
  TNameTag(LoadConf(string.format("Npc/%d.npc", A1_704)).info.name).parent = A0_703
  A0_703.on = {
    "Start",
    A0_703,
    NpcAvatar.on_start_fire
  }
  A0_703.on = {
    "Stop",
    A0_703,
    NpcAvatar.on_stop_fire
  }
  A0_703.on = {
    "Parent",
    A0_703,
    NpcAvatar.on_parent_fire
  }
  Sprite():SetCascadeColorEnabled(true)
  Sprite():SetCascadeOpacityEnabled(true)
end
function NpcAvatar.class_get(A0_705, A1_706)
  local L2_707
  L2_707 = "NpcAvatar"
  return L2_707
end
function NpcAvatar.crender_get(A0_708)
  local L1_709
end
function NpcAvatar.id_get(A0_710, A1_711)
  return rawget(A0_710, "id")
end
function NpcAvatar.id_set(A0_712, A1_713, A2_714)
  if not A2_714 then
    return
  end
  rawset(A0_712, "id", A2_714)
  A0_712.load_actions = A2_714
end
function NpcAvatar.info_get(A0_715, A1_716)
  return rawset(A0_715, "info")
end
function NpcAvatar.info_set(A0_717, A1_718, A2_719)
  rawset(A0_717, "info", A2_719)
end
function NpcAvatar.swim_get(A0_720, A1_721)
  return rawget(A0_720, "swim")
end
function NpcAvatar.swim_set(A0_722, A1_723, A2_724)
  rawset(A0_722, "swim", A2_724)
end
function NpcAvatar.layer_get(A0_725, A1_726)
  return rawget(A0_725, "layer")
end
function NpcAvatar.layer_set(A0_727, A1_728, A2_729)
  if not A2_729 then
    return
  end
  if A0_727.layer == A2_729 then
    return
  end
  rawset(A0_727, "layer", A2_729)
  if not A0_727.parent then
    return
  end
  if not A0_727.parent[tostring(A2_729)] then
    return
  end
  A0_727.render:RemoveFromParentAndCleanup(false)
  A0_727.parent[tostring(A2_729)].render:AddChild(A0_727.render)
end
function NpcAvatar.direction_get(A0_730, A1_731)
  return rawget(A0_730, "direction") or "left"
end
function NpcAvatar.direction_set(A0_732, A1_733, A2_734)
  if not A2_734 then
    return
  end
  if not A0_732.render then
    return
  end
  if A2_734 == "left" then
    A0_732.rotation_y = 0
    A0_732.name_tag.rotation_y = 0
  elseif A2_734 == "right" then
    A0_732.rotation_y = -180
    A0_732.name_tag.rotation_y = -180
  else
    return
  end
  rawset(A0_732, "direction", A2_734)
end
function NpcAvatar.array_get(A0_735, A1_736)
  return rawget(A0_735, "array")
end
function NpcAvatar.array_set(A0_737, A1_738, A2_739, A3_740)
  local L4_741
  L4_741 = rawget
  L4_741 = L4_741(A0_737, "array")
  if not L4_741 then
    L4_741 = {}
    rawset(A0_737, "array", L4_741)
  end
  L4_741[A2_739] = A3_740
end
function NpcAvatar.load_actions_set(A0_742, A1_743, A2_744)
  local L3_745, L4_746, L5_747, L6_748, L7_749, L8_750, L9_751, L10_752, L11_753, L12_754, L13_755, L14_756, L15_757, L16_758, L17_759, L18_760, L19_761, L20_762, L21_763
  if not A2_744 then
    return
  end
  L3_745 = LoadConf
  L4_746 = string
  L4_746 = L4_746.format
  L5_747 = "Npc/%d.npc"
  L6_748 = A2_744
  L21_763 = L4_746(L5_747, L6_748)
  L3_745 = L3_745(L4_746, L5_747, L6_748, L7_749, L8_750, L9_751, L10_752, L11_753, L12_754, L13_755, L14_756, L15_757, L16_758, L17_759, L18_760, L19_761, L20_762, L21_763, L4_746(L5_747, L6_748))
  if not L3_745 then
    return
  end
  L4_746 = L3_745.info
  L5_747 = L3_745.id
  if L5_747 ~= A2_744 then
    L5_747 = Event
    L6_748 = L5_747
    L5_747 = L5_747.Fire
    L7_749 = "DataException"
    L8_750 = "conf_data"
    L5_747(L6_748, L7_749, L8_750)
    return
  end
  L5_747 = L3_745.data
  L6_748 = L3_745.frame
  A0_742.info = L4_746
  L7_749 = string
  L7_749 = L7_749.format
  L8_750 = "Npc/%d.ntplv"
  L7_749 = L7_749(L8_750, L9_751)
  L8_750 = string
  L8_750 = L8_750.format
  L8_750 = L8_750(L9_751, L10_752)
  L12_754 = L8_750
  L9_751(L10_752, L11_753, L12_754)
  for L12_754, L13_755 in L9_751(L10_752) do
    L14_756 = Array
    L14_756 = L14_756()
    for L18_760 = L13_755.start, L13_755.final do
      L19_761 = L5_747[L18_760]
      L20_762 = L19_761.file_name
      L21_763 = Animate
      L21_763 = L21_763(L20_762, L19_761.origin.x, L19_761.origin.y - L4_746.height / 2, L19_761.delay / 1000.0, 0)
      if L21_763 then
        L14_756:AddObject(L21_763)
      end
    end
    A0_742.array = L15_757
  end
end
function NpcAvatar.status_action_get(A0_764, A1_765)
  return rawget(A0_764, "status_action")
end
function NpcAvatar.status_action_set(A0_766, A1_767, A2_768)
  rawset(A0_766, "status_action", A2_768)
end
function NpcAvatar.status_get(A0_769, A1_770)
  return rawget(A0_769, "status")
end
function NpcAvatar.status_name(A0_771, A1_772)
  local L2_773
  L2_773 = STATE_JUMP
  if A1_772 == L2_773 then
    L2_773 = "jump"
    return L2_773
  end
  L2_773 = STATE_FALL
  if A1_772 == L2_773 then
    L2_773 = "jump"
    return L2_773
  end
  L2_773 = STATE_LADDER
  if A1_772 == L2_773 then
    L2_773 = "ladder"
    return L2_773
  end
  L2_773 = STATE_ROPE
  if A1_772 == L2_773 then
    L2_773 = "rope"
    return L2_773
  end
  L2_773 = STATE_WALK
  if A1_772 == L2_773 then
    L2_773 = "move"
    return L2_773
  end
  L2_773 = STATE_FLY
  if A1_772 == L2_773 then
    L2_773 = "fly"
    return L2_773
  end
  L2_773 = STATE_STAND
  if A1_772 == L2_773 then
    L2_773 = "stand"
    return L2_773
  end
  L2_773 = STATE_ALERT
  if A1_772 == L2_773 then
    L2_773 = "alert"
    return L2_773
  end
  L2_773 = STATE_HIT
  if A1_772 == L2_773 then
    L2_773 = "hit1"
    return L2_773
  end
  L2_773 = STATE_DIE
  if A1_772 == L2_773 then
    L2_773 = "die1"
    return L2_773
  end
end
function NpcAvatar.action_set(A0_774, A1_775, A2_776)
  A0_774.unaction, A0_774.status_action = A0_774.status_action, A2_776
  Component.action_set(A0_774, "action", A2_776)
end
function NpcAvatar.status_set(A0_777, A1_778, A2_779)
  local L3_780, L4_781
  L3_780 = A0_777.status
  L4_781 = NpcAvatar
  L4_781 = L4_781.status_name
  L4_781 = L4_781(A0_777, A2_779)
  A2_779 = L4_781
  if not A2_779 or L3_780 == A2_779 then
    return
  end
  L4_781 = rawset
  L4_781(A0_777, "status", A2_779)
  L4_781 = A0_777.array
  L4_781 = L4_781[A2_779]
  if not L4_781 then
    return
  end
  A0_777.action = RepeatForever(Sequence(L4_781))
end
function NpcAvatar.on_start_fire(A0_782)
  local L1_783
end
function NpcAvatar.on_stop_fire(A0_784)
  local L1_785
end
function NpcAvatar.on_parent_fire(A0_786)
  local L1_787
  L1_787 = A0_786.parent
  if not L1_787 then
    A0_786.render:RemoveFromParent()
    return
  end
  if not (L1_787.class == "Map" and L1_787[tostring(A0_786.layer)] or L1_787) then
    return
  end
  A0_786.render:RemoveFromParentAndCleanup(false)
  ;(L1_787.class == "Map" and L1_787[tostring(A0_786.layer)] or L1_787).render:AddChild(A0_786.render, 100000000)
end
