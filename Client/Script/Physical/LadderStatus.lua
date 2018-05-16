Class.LadderStatus.StatusHandle({})
function LadderStatus.Constructor(A0_4659)
  StatusHandle.Constructor(A0_4659)
end
function LadderStatus.Start(A0_4660, A1_4661)
  local L2_4662, L3_4663, L4_4664, L5_4665, L6_4666, L7_4667
  L2_4662 = StatusHandle
  L2_4662 = L2_4662.Start
  L3_4663 = A0_4660
  L4_4664 = A1_4661
  L2_4662(L3_4663, L4_4664)
  L2_4662 = nil
  L3_4663 = A1_4661.body
  L4_4664 = L3_4663
  L3_4663 = L3_4663.GetContactList
  L3_4663 = L3_4663(L4_4664)
  while L3_4663 do
    L4_4664 = L3_4663.other
    L6_4666 = L4_4664
    L5_4665 = L4_4664.GetUserData
    L5_4665 = L5_4665(L6_4666)
    L7_4667 = L4_4664
    L6_4666 = L4_4664.GetFixtureList
    L6_4666 = L6_4666(L7_4667)
    L7_4667 = L6_4666
    L6_4666 = L6_4666.GetFilterData
    L6_4666 = L6_4666(L7_4667)
    L6_4666 = L6_4666.categoryBits
    L7_4667 = WORLD_TYPE_LADDER
    if L6_4666 == L7_4667 then
      L2_4662 = L5_4665
      break
    end
    L3_4663 = L3_4663.next
  end
  L4_4664 = math
  L4_4664 = L4_4664.max
  L5_4665 = L2_4662.y1
  L6_4666 = L2_4662.y2
  L4_4664 = L4_4664(L5_4665, L6_4666)
  L5_4665 = math
  L5_4665 = L5_4665.min
  L6_4666 = L2_4662.y1
  L7_4667 = L2_4662.y2
  L5_4665 = L5_4665(L6_4666, L7_4667)
  L6_4666 = A1_4661.height
  L6_4666 = L6_4666 / 2
  L7_4667 = A1_4661.gravity
  A0_4660.gravity = L7_4667
  L7_4667 = L4_4664 + L6_4666
  L7_4667 = L7_4667 + 5
  A0_4660.max_y = L7_4667
  L7_4667 = L5_4665 - L6_4666
  L7_4667 = L7_4667 + 10
  A0_4660.min_y = L7_4667
  L7_4667 = L2_4662.uf
  L7_4667 = L7_4667 == 0
  A0_4660.uf = L7_4667
  A1_4661.gravity = 0
  A1_4661.stand = nil
  L7_4667 = A1_4661.proxy
  L7_4667.direction = "left"
  L7_4667 = L2_4662.uf
  if L7_4667 == 0 then
    L7_4667 = L4_4664 - 5
    A0_4660.max_y = L7_4667
  end
  L7_4667 = A1_4661.y
  if L4_4664 < L7_4667 then
    L7_4667 = A1_4661.y
    L7_4667 = L7_4667 - 10
  elseif not L7_4667 then
    L7_4667 = A1_4661.y
    L7_4667 = L7_4667 + 10
  end
  A1_4661.impulse = {0, 0}
  A1_4661.position = {
    L2_4662.x1,
    L7_4667
  }
end
function LadderStatus.Stop(A0_4668, A1_4669)
  A1_4669.gravity = A0_4668.gravity
  StatusHandle.Stop(A0_4668, A1_4669)
  if not A1_4669.proxy then
    return
  end
  A1_4669.proxy.direction = A1_4669.direction
  A1_4669.proxy.resume_actions = true
end
function LadderStatus.Left(A0_4670)
  A0_4670.direction = "left"
  if not A0_4670:Object() then
    return
  end
  A0_4670:Object().impulse = {0, 0}
  if not A0_4670:Object().proxy then
    return
  end
  A0_4670:Object().proxy.pause_actions = true
end
function LadderStatus.Right(A0_4671)
  A0_4671.direction = "right"
  if not A0_4671:Object() then
    return
  end
  A0_4671:Object().impulse = {0, 0}
  if not A0_4671:Object().proxy then
    return
  end
  A0_4671:Object().proxy.pause_actions = true
end
function LadderStatus.Up(A0_4672)
  A0_4672.direction = nil
  if A0_4672.up_limit then
    return
  end
  if not A0_4672:Object() then
    return
  end
  A0_4672:Object().impulse = {0, 4}
  if not A0_4672:Object().proxy then
    return
  end
  A0_4672:Object().proxy.resume_actions = true
end
function LadderStatus.Down(A0_4673)
  A0_4673.direction = nil
  if not A0_4673:Object() then
    return
  end
  A0_4673:Object().impulse = {0, -4}
  if not A0_4673:Object().proxy then
    return
  end
  A0_4673:Object().proxy.resume_actions = true
end
function LadderStatus.Nothing(A0_4674)
  A0_4674.direction = nil
  if not A0_4674:Object() then
    return
  end
  A0_4674:Object().impulse = {0, 0}
  if not A0_4674:Object().proxy then
    return
  end
  A0_4674:Object().proxy.pause_actions = true
end
function LadderStatus.Jump(A0_4675)
  local L1_4676, L2_4677, L3_4678
  L1_4676 = A0_4675.direction
  if not L1_4676 then
    return
  end
  L2_4677 = A0_4675
  L1_4676 = A0_4675.Object
  L1_4676 = L1_4676(L2_4677)
  if not L1_4676 then
    return
  end
  L2_4677 = L1_4676.data
  L2_4677 = L2_4677.speed
  L2_4677 = L2_4677 or 6
  L3_4678 = A0_4675.direction
  if L3_4678 == "left" then
    L3_4678 = -L2_4677
    L2_4677 = L3_4678 or L2_4677
  end
  L3_4678 = 15
  L1_4676.impulse = {L2_4677, L3_4678}
  L1_4676.status = STATUS_JUMP
  L1_4676.direction = A0_4675.direction
end
function LadderStatus.Attack(A0_4679)
  local L1_4680
end
function LadderStatus.CastSkill(A0_4681)
  local L1_4682
end
function LadderStatus.Update(A0_4683, A1_4684)
  if not A0_4683:Object() then
    return
  end
  A0_4683.up_limit = false
  if A0_4683:Object().foothold_count ~= 0 then
    A0_4683:Object().status = STATUS_STAND
    return
  end
  if A0_4683:Object().y > A0_4683.min_y and A0_4683:Object().y < A0_4683.max_y then
    return
  end
  if A0_4683:Object().y > A0_4683.max_y and A0_4683.uf then
    A0_4683.up_limit = true
    A0_4683:Object().impulse = {0, 0}
    if A0_4683:Object().proxy then
      A0_4683:Object().proxy.pause_actions = true
    end
    return
  end
  if A0_4683:Object().y < A0_4683.min_y or A0_4683:Object().y > A0_4683.max_y then
    A0_4683:Object().status = STATUS_FALL
    return
  end
end
