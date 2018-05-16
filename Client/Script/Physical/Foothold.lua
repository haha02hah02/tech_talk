Class.Foothold.Component({})
function Foothold.Constructor(A0_4397, A1_4398, A2_4399, A3_4400, A4_4401)
  local L5_4402
  L5_4402 = Component
  L5_4402 = L5_4402.Constructor
  L5_4402(A0_4397)
  A0_4397.x1 = A1_4398
  A0_4397.x2 = A2_4399
  A0_4397.y1 = A3_4400
  A0_4397.y2 = A4_4401
  L5_4402 = math
  L5_4402 = L5_4402.min
  L5_4402 = L5_4402(A3_4400, A4_4401)
  A0_4397.bottom = L5_4402
  L5_4402 = math
  L5_4402 = L5_4402.abs
  L5_4402 = L5_4402(A1_4398 - A2_4399)
  A0_4397.width = L5_4402
  L5_4402 = math
  L5_4402 = L5_4402.abs
  L5_4402 = L5_4402(A3_4400 - A4_4401)
  A0_4397.height = L5_4402
  L5_4402 = math
  L5_4402 = L5_4402.min
  L5_4402 = L5_4402(A1_4398, A2_4399)
  L5_4402 = L5_4402 + A0_4397.width / 2
  A0_4397.center = L5_4402
  L5_4402 = math
  L5_4402 = L5_4402.min
  L5_4402 = L5_4402(A1_4398, A2_4399)
  A0_4397.min_x = L5_4402
  L5_4402 = A1_4398 ~= A2_4399 and A3_4400 ~= A4_4401 or false
  A0_4397.slope = L5_4402
  L5_4402 = A1_4398 == A2_4399
  A0_4397.wall = L5_4402
  L5_4402 = WORLD_TYPE_FOOTHOLD
  A0_4397.type = L5_4402
  L5_4402 = WORLD_TYPE_LIFE
  L5_4402 = L5_4402 | WORLD_TYPE_MOB
  L5_4402 = L5_4402 | WORLD_TYPE_NPC
  L5_4402 = L5_4402 | WORLD_TYPE_SUMMON
  L5_4402 = L5_4402 | WORLD_TYPE_ITEM
  L5_4402 = L5_4402 | WORLD_TYPE_ZOOMOB
  A0_4397.care_type = L5_4402
  L5_4402 = {
    "Start",
    A0_4397,
    Foothold.on_start_set
  }
  A0_4397.on = L5_4402
  L5_4402 = {
    "Stop",
    A0_4397,
    Foothold.on_stop_set
  }
  A0_4397.on = L5_4402
  L5_4402 = {
    "Parent",
    A0_4397,
    Foothold.on_parent_set
  }
  A0_4397.on = L5_4402
  L5_4402 = {}
  A0_4397.contact_object = L5_4402
  setmetatable(L5_4402, {__mode = "k"})
end
function Foothold.class_get(A0_4403, A1_4404)
  local L2_4405
  L2_4405 = "Foothold"
  return L2_4405
end
function Foothold.x1_get(A0_4406, A1_4407)
  return rawget(A0_4406, "x1")
end
function Foothold.x1_set(A0_4408, A1_4409, A2_4410)
  rawset(A0_4408, "x1", A2_4410)
end
function Foothold.x2_get(A0_4411, A1_4412)
  return rawget(A0_4411, "x2")
end
function Foothold.x2_set(A0_4413, A1_4414, A2_4415)
  rawset(A0_4413, "x2", A2_4415)
end
function Foothold.y1_get(A0_4416, A1_4417)
  return rawget(A0_4416, "y1")
end
function Foothold.y1_set(A0_4418, A1_4419, A2_4420)
  rawset(A0_4418, "y1", A2_4420)
end
function Foothold.y2_get(A0_4421, A1_4422)
  return rawget(A0_4421, "y2")
end
function Foothold.y2_set(A0_4423, A1_4424, A2_4425)
  rawset(A0_4423, "y2", A2_4425)
end
function Foothold.wall_get(A0_4426, A1_4427)
  return rawget(A0_4426, "wall")
end
function Foothold.wall_set(A0_4428, A1_4429, A2_4430)
  rawset(A0_4428, "wall", A2_4430)
end
function Foothold.slope_get(A0_4431, A1_4432)
  return rawget(A0_4431, "slope")
end
function Foothold.slope_set(A0_4433, A1_4434, A2_4435)
  rawset(A0_4433, "slope", A2_4435)
end
function Foothold.width_get(A0_4436, A1_4437)
  return rawget(A0_4436, "width")
end
function Foothold.width_set(A0_4438, A1_4439, A2_4440)
  rawset(A0_4438, "width", A2_4440)
end
function Foothold.height_get(A0_4441, A1_4442)
  return rawget(A0_4441, "height")
end
function Foothold.height_set(A0_4443, A1_4444, A2_4445)
  rawset(A0_4443, "height", A2_4445)
end
function Foothold.center_get(A0_4446, A1_4447)
  return rawget(A0_4446, "center")
end
function Foothold.center_set(A0_4448, A1_4449, A2_4450)
  rawset(A0_4448, "center", A2_4450)
end
function Foothold.bottom_get(A0_4451, A1_4452)
  return rawget(A0_4451, "bottom")
end
function Foothold.bottom_set(A0_4453, A1_4454, A2_4455)
  rawset(A0_4453, "bottom", A2_4455)
end
function Foothold.min_x_get(A0_4456, A1_4457)
  return rawget(A0_4456, "min_x")
end
function Foothold.min_x_set(A0_4458, A1_4459, A2_4460)
  rawset(A0_4458, "min_x", A2_4460)
end
function Foothold.layer_get(A0_4461, A1_4462)
  return rawget(A0_4461, "layer")
end
function Foothold.layer_set(A0_4463, A1_4464, A2_4465)
  rawset(A0_4463, "layer", A2_4465)
end
function Foothold.prev_get(A0_4466, A1_4467)
  return rawget(A0_4466, "prev")
end
function Foothold.prev_set(A0_4468, A1_4469, A2_4470)
  rawset(A0_4468, "prev", A2_4470)
end
function Foothold.next_get(A0_4471, A1_4472)
  return rawget(A0_4471, "next")
end
function Foothold.next_set(A0_4473, A1_4474, A2_4475)
  rawset(A0_4473, "next", A2_4475)
end
function Foothold.contact_object_get(A0_4476, A1_4477)
  return rawget(A0_4476, "contact_object")
end
function Foothold.contact_object_set(A0_4478, A1_4479, A2_4480)
  return rawset(A0_4478, "contact_object", A2_4480)
end
function Foothold.friction_get(A0_4481, A1_4482)
  local L2_4483
  L2_4483 = A0_4481.wall
  if not L2_4483 then
    L2_4483 = 1.0
  else
    L2_4483 = L2_4483 or 0.0
  end
  return L2_4483
end
function Foothold.type_get(A0_4484, A1_4485)
  return rawget(A0_4484, "type")
end
function Foothold.type_set(A0_4486, A1_4487, A2_4488)
  rawset(A0_4486, "type", A2_4488)
end
function Foothold.care_type_get(A0_4489, A1_4490)
  return rawget(A0_4489, "care_type")
end
function Foothold.care_type_set(A0_4491, A1_4492, A2_4493)
  rawset(A0_4491, "care_type", A2_4493)
end
function Foothold.body_get(A0_4494, A1_4495)
  return rawget(A0_4494, "body")
end
function Foothold.body_set(A0_4496, A1_4497, A2_4498)
  local L3_4499
  L3_4499 = A0_4496.body
  rawset(A0_4496, "body", A2_4498)
  if not L3_4499 then
    return
  end
  L3_4499:SetUserData(nil)
  L3_4499:GetWorld():DestroyBody(L3_4499)
end
function Foothold.begin_contact_set(A0_4500, A1_4501, A2_4502)
  local L3_4503
  L3_4503 = A0_4500.wall
  if not L3_4503 then
    L3_4503 = A0_4500.bottom
  elseif L3_4503 > A2_4502.bottom then
    return
  end
  L3_4503 = A0_4500.name
  A2_4502.stand = L3_4503
  L3_4503 = A0_4500.contact_object
  if not L3_4503 or L3_4503[A2_4502] then
    return
  end
  SessionObject.layer_set(A2_4502, "", A0_4500.layer - 1)
  L3_4503[A2_4502] = true
  SessionObject.foothold_count_set(A2_4502, "", A2_4502.foothold_count + 1)
end
function Foothold.begin_contact(A0_4504, A1_4505)
end
function Foothold.end_contact_set(A0_4506, A1_4507, A2_4508)
  local L3_4509, L4_4510
  L3_4509 = A0_4506.wall
  if L3_4509 then
    return
  end
  L3_4509 = A0_4506.contact_object
  if not L3_4509 then
    return
  end
  L4_4510 = L3_4509[A2_4508]
  if not L4_4510 then
    return
  end
  L3_4509[A2_4508] = nil
  L4_4510 = A2_4508.foothold_count
  SessionObject.foothold_count_set(A2_4508, "", L4_4510 - 1)
end
function Foothold.end_contact(A0_4511, A1_4512)
  local L2_4513, L3_4514
  L2_4513 = A0_4511.wall
  if L2_4513 then
    return
  end
  L2_4513 = A0_4511.contact_object
  if not L2_4513 then
    return
  end
  L3_4514 = L2_4513[A1_4512]
  if not L3_4514 then
    return
  end
  L2_4513[A1_4512] = nil
  L3_4514 = A1_4512.foothold_count
  SessionObject.foothold_count_set(A1_4512, "", L3_4514 - 1)
end
function Foothold.on_parent_set(A0_4515, A1_4516)
  local L2_4517, L3_4518, L4_4519, L5_4520, L6_4521, L7_4522, L8_4523
  A0_4515.body = nil
  L2_4517 = A0_4515.parent
  if not L2_4517 then
    return
  end
  L3_4518 = L2_4517.world
  if not L3_4518 then
    return
  end
  L4_4519 = Config
  L4_4519 = L4_4519.PTMRatio
  L5_4520 = b2BodyDef
  L5_4520 = L5_4520()
  L6_4521 = b2_staticBody
  L5_4520.type = L6_4521
  L6_4521 = Instance
  L8_4523 = L3_4518
  L7_4522 = L3_4518.CreateBody
  L8_4523 = L7_4522(L8_4523, L5_4520)
  L6_4521 = L6_4521(L7_4522, L8_4523, L7_4522(L8_4523, L5_4520))
  L7_4522 = b2EdgeShape
  L7_4522 = L7_4522()
  L8_4523 = L7_4522.Set
  L8_4523(L7_4522, b2Vec2(A0_4515.x1 / L4_4519, A0_4515.y1 / L4_4519), b2Vec2(A0_4515.x2 / L4_4519, A0_4515.y2 / L4_4519))
  L8_4523 = b2FixtureDef
  L8_4523 = L8_4523()
  L8_4523.shape = L7_4522
  L8_4523.friction = A0_4515.friction
  L8_4523.filter.categoryBits = A0_4515.type
  L8_4523.filter.maskBits = A0_4515.care_type
  A0_4515.body = L6_4521
  L6_4521:CreateFixture(L8_4523)
end
function Foothold.on_start_set(A0_4524, A1_4525)
  local L2_4526
  L2_4526 = A0_4524.body
  if not L2_4526 then
    return
  end
  L2_4526:SetUserData(A0_4524)
end
function Foothold.on_stop_set(A0_4527, A1_4528)
  local L2_4529, L3_4530
  L2_4529 = A0_4527.body
  if L2_4529 then
    L3_4530 = L2_4529.SetUserData
    L3_4530(L2_4529, nil)
  end
  L3_4530 = A0_4527.contact_object
  for _FORV_7_, _FORV_8_ in pairs(L3_4530) do
    _FORV_7_.foothold_count = _FORV_7_.foothold_count - 1
    L3_4530[_FORV_7_] = nil
  end
end
