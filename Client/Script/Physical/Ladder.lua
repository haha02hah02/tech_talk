Class.Ladder.Component({})
function Ladder.Constructor(A0_4562, A1_4563, A2_4564, A3_4565, A4_4566, A5_4567)
  Component.Constructor(A0_4562)
  A0_4562.x1 = A1_4563
  A0_4562.x2 = A2_4564
  A0_4562.y1 = A3_4565
  A0_4562.y2 = A4_4566
  A0_4562.bottom = math.min(A3_4565, A4_4566)
  A0_4562.width = math.abs(A1_4563 - A2_4564)
  A0_4562.center = math.min(A1_4563, A2_4564) + A0_4562.width / 2
  A0_4562.type = WORLD_TYPE_LADDER
  A0_4562.care_type = WORLD_TYPE_LIFE
  A0_4562.rope = A5_4567
  A0_4562.on = {
    "Start",
    A0_4562,
    Ladder.on_start_set
  }
  A0_4562.on = {
    "Stop",
    A0_4562,
    Ladder.on_stop_set
  }
  A0_4562.on = {
    "Parent",
    A0_4562,
    Ladder.on_parent_set
  }
end
function Ladder.class_get(A0_4568, A1_4569)
  local L2_4570
  L2_4570 = "Ladder"
  return L2_4570
end
function Ladder.x1_get(A0_4571, A1_4572)
  return rawget(A0_4571, "x1")
end
function Ladder.x1_set(A0_4573, A1_4574, A2_4575)
  rawset(A0_4573, "x1", A2_4575)
end
function Ladder.x2_get(A0_4576, A1_4577)
  return rawget(A0_4576, "x2")
end
function Ladder.x2_set(A0_4578, A1_4579, A2_4580)
  rawset(A0_4578, "x2", A2_4580)
end
function Ladder.y1_get(A0_4581, A1_4582)
  return rawget(A0_4581, "y1")
end
function Ladder.y1_set(A0_4583, A1_4584, A2_4585)
  rawset(A0_4583, "y1", A2_4585)
end
function Ladder.y2_get(A0_4586, A1_4587)
  return rawget(A0_4586, "y2")
end
function Ladder.y2_set(A0_4588, A1_4589, A2_4590)
  rawset(A0_4588, "y2", A2_4590)
end
function Ladder.width_get(A0_4591, A1_4592)
  return rawget(A0_4591, "width")
end
function Ladder.width_set(A0_4593, A1_4594, A2_4595)
  rawset(A0_4593, "width", A2_4595)
end
function Ladder.center_get(A0_4596, A1_4597)
  return rawget(A0_4596, "center")
end
function Ladder.center_set(A0_4598, A1_4599, A2_4600)
  rawset(A0_4598, "center", A2_4600)
end
function Ladder.bottom_get(A0_4601, A1_4602)
  return rawget(A0_4601, "bottom")
end
function Ladder.bottom_set(A0_4603, A1_4604, A2_4605)
  rawset(A0_4603, "bottom", A2_4605)
end
function Ladder.layer_get(A0_4606, A1_4607)
  return rawget(A0_4606, "layer")
end
function Ladder.layer_set(A0_4608, A1_4609, A2_4610)
  rawset(A0_4608, "layer", A2_4610)
end
function Ladder.uf_get(A0_4611, A1_4612)
  return rawget(A0_4611, "uf")
end
function Ladder.uf_set(A0_4613, A1_4614, A2_4615)
  rawset(A0_4613, "uf", A2_4615)
end
function Ladder.rope_get(A0_4616, A1_4617)
  return rawget(A0_4616, "rope")
end
function Ladder.rope_set(A0_4618, A1_4619, A2_4620)
  rawset(A0_4618, "rope", A2_4620)
end
function Ladder.friction_get(A0_4621, A1_4622)
  local L2_4623
  L2_4623 = 0.0
  return L2_4623
end
function Ladder.type_get(A0_4624, A1_4625)
  return rawget(A0_4624, "type")
end
function Ladder.type_set(A0_4626, A1_4627, A2_4628)
  rawset(A0_4626, "type", A2_4628)
end
function Ladder.care_type_get(A0_4629, A1_4630)
  return rawget(A0_4629, "care_type")
end
function Ladder.care_type_set(A0_4631, A1_4632, A2_4633)
  rawset(A0_4631, "care_type", A2_4633)
end
function Ladder.body_get(A0_4634, A1_4635)
  return rawget(A0_4634, "body")
end
function Ladder.body_set(A0_4636, A1_4637, A2_4638)
  local L3_4639
  L3_4639 = A0_4636.body
  rawset(A0_4636, "body", A2_4638)
  if not L3_4639 then
    return
  end
  L3_4639:SetUserData(nil)
  L3_4639:GetWorld():DestroyBody(L3_4639)
end
function Ladder.action_set(A0_4640, A1_4641, A2_4642, A3_4643)
  if A3_4643 == "up" and math.max(A0_4640.y1, A0_4640.y2) < A2_4642.y - A2_4642.height / 2 then
    return
  end
  if A3_4643 == "down" and math.max(A0_4640.y1, A0_4640.y2) > A2_4642.y + A2_4642.height / 2 then
    return
  end
  if A3_4643 == "down" and A0_4640.uf == 0 then
    return
  end
  A2_4642.status = A0_4640.rope and STATUS_ROPE or STATUS_LADDER
  A2_4642.layer = A0_4640.layer + 1
  while A2_4642.body:GetContactList() do
    if A2_4642.body:GetContactList().other:GetFixtureList():GetFilterData().categoryBits == WORLD_TYPE_FOOTHOLD then
      A2_4642.body:GetContactList().other:GetUserData().end_contact = A2_4642
      A2_4642.body:GetContactList().contact:SetEnabled(false)
    end
  end
end
function Ladder.on_parent_set(A0_4644, A1_4645)
  local L2_4646, L3_4647, L4_4648, L5_4649, L6_4650, L7_4651, L8_4652
  A0_4644.body = nil
  L2_4646 = A0_4644.parent
  if not L2_4646 then
    return
  end
  L3_4647 = L2_4646.world
  if not L3_4647 then
    return
  end
  L4_4648 = Config
  L4_4648 = L4_4648.PTMRatio
  L5_4649 = b2BodyDef
  L5_4649 = L5_4649()
  L6_4650 = b2_staticBody
  L5_4649.type = L6_4650
  L6_4650 = Instance
  L8_4652 = L3_4647
  L7_4651 = L3_4647.CreateBody
  L8_4652 = L7_4651(L8_4652, L5_4649)
  L6_4650 = L6_4650(L7_4651, L8_4652, L7_4651(L8_4652, L5_4649))
  L7_4651 = b2EdgeShape
  L7_4651 = L7_4651()
  L8_4652 = L7_4651.Set
  L8_4652(L7_4651, b2Vec2(A0_4644.x1 / L4_4648, A0_4644.y1 / L4_4648), b2Vec2(A0_4644.x2 / L4_4648, A0_4644.y2 / L4_4648))
  L8_4652 = b2FixtureDef
  L8_4652 = L8_4652()
  L8_4652.shape = L7_4651
  L8_4652.isSensor = true
  L8_4652.friction = A0_4644.friction
  L8_4652.filter.categoryBits = A0_4644.type
  L8_4652.filter.maskBits = A0_4644.care_type
  A0_4644.body = L6_4650
  L6_4650:CreateFixture(L8_4652)
end
function Ladder.on_start_set(A0_4653, A1_4654)
  local L2_4655
  L2_4655 = A0_4653.body
  if not L2_4655 then
    return
  end
  L2_4655:SetUserData(A0_4653)
end
function Ladder.on_stop_set(A0_4656, A1_4657)
  local L2_4658
  L2_4658 = A0_4656.body
  if not L2_4658 then
    return
  end
  L2_4658:SetUserData(nil)
end
