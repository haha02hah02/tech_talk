Class.StatusHandle.None({})
function StatusHandle.Constructor(A0_5626)
  A0_5626.tObject = {}
  setmetatable(A0_5626.tObject, {__mode = "v"})
end
function StatusHandle.Start(A0_5627, A1_5628)
  A0_5627.tObject.object = A1_5628
end
function StatusHandle.Stop(A0_5629, A1_5630)
  A0_5629.tObject.object = nil
  A0_5629.down_set = false
end
function StatusHandle.Object(A0_5631)
  return A0_5631.tObject.object
end
function StatusHandle.Nothing(A0_5632)
  local L1_5633
  A0_5632.down_set = false
end
function StatusHandle.Up(A0_5634)
  local L1_5635, L2_5636, L3_5637
  A0_5634.down_set = false
  L2_5636 = A0_5634
  L1_5635 = A0_5634.Object
  L1_5635 = L1_5635(L2_5636)
  if not L1_5635 then
    return
  end
  L2_5636, L3_5637 = nil, nil
  while L1_5635.body:GetContactList() do
    if L1_5635.body:GetContactList().other:GetFixtureList():GetFilterData().categoryBits == WORLD_TYPE_LADDER then
      L1_5635.body:GetContactList().other:GetUserData().action = {L1_5635, "up"}
      return
    end
    if L1_5635.body:GetContactList().other:GetFixtureList():GetFilterData().categoryBits == WORLD_TYPE_PORTAL then
      L3_5637 = L1_5635.body:GetContactList().other:GetUserData()
    end
  end
  if not L3_5637 or L3_5637.pt == 3 then
    return
  end
  if not L1_5635.portal_limit then
    L3_5637.action = L1_5635
    return
  end
end
function StatusHandle.Down(A0_5638)
  local L1_5639
  A0_5638.down_set = true
  L1_5639 = A0_5638.Object
  L1_5639 = L1_5639(A0_5638)
  if not L1_5639 then
    return
  end
  while L1_5639.body:GetContactList() do
    if L1_5639.body:GetContactList().other:GetFixtureList():GetFilterData().categoryBits == WORLD_TYPE_LADDER then
      L1_5639.body:GetContactList().other:GetUserData().action = {L1_5639, "down"}
      return
    end
  end
end
function StatusHandle.Left(A0_5640)
  local L1_5641
  A0_5640.down_set = false
  L1_5641 = A0_5640.Object
  L1_5641 = L1_5641(A0_5640)
  if not L1_5641 then
    return
  end
  SessionObject.direction_set(L1_5641, "", "left")
  A0_5640:Walk()
end
function StatusHandle.Right(A0_5642)
  local L1_5643, L2_5644
  A0_5642.down_set = false
  L2_5644 = A0_5642
  L1_5643 = A0_5642.Object
  L1_5643 = L1_5643(L2_5644)
  if not L1_5643 then
    return
  end
  L2_5644 = A0_5642.Object
  L2_5644 = L2_5644(A0_5642)
  if not L2_5644 then
    return
  end
  SessionObject.direction_set(L2_5644, "", "right")
  A0_5642:Walk()
end
function StatusHandle.Walk(A0_5645)
  local L1_5646
  L1_5646 = A0_5645.Object
  L1_5646 = L1_5646(A0_5645)
  if not L1_5646 then
    return
  end
  SessionObject.action_walk_set(L1_5646, true)
end
function StatusHandle.Jump(A0_5647, A1_5648)
  if not A0_5647:Object() then
    return
  end
  if not A0_5647.down_set then
    A0_5647:Object().action_jump = true
    return
  end
  while A0_5647:Object().body:GetContactList() do
    if A0_5647:Object().body:GetContactList().other:GetFixtureList():GetFilterData().categoryBits == WORLD_TYPE_FOOTHOLD then
      A0_5647:Object().body:GetContactList().other:GetUserData().end_contact = A0_5647:Object()
      A0_5647:Object().body:GetContactList().contact:SetEnabled(false)
    end
  end
  A0_5647:Object().y = A0_5647:Object().y - 5
  A0_5647:Object().stand = nil
end
function StatusHandle.Attack(A0_5649, A1_5650)
  A0_5649:CastSkill(A1_5650)
end
function StatusHandle.CastSkill(A0_5651, A1_5652, A2_5653)
  local L3_5654, L4_5655, L5_5656
  L4_5655 = A0_5651
  L3_5654 = A0_5651.Object
  L3_5654 = L3_5654(L4_5655)
  if not L3_5654 then
    return
  end
  L4_5655 = L3_5654.skills
  L5_5656 = nil
  for _FORV_9_, _FORV_10_ in ipairs(L4_5655) do
    if _FORV_10_.id == A1_5652 then
      L5_5656 = _FORV_10_
      break
    end
  end
  if L5_5656 then
    L5_5656.cast = L3_5654
    L3_5654.alert = true
  end
end
function StatusHandle.Update(A0_5657, A1_5658)
end
