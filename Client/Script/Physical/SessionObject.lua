local L1_5206, L2_5207, L3_5208, L4_5209, L5_5210
L0_5205 = Class
L0_5205 = L0_5205.SessionObject
L0_5205 = L0_5205.Component
L1_5206 = {}
L0_5205(L1_5206)
L0_5205 = Global
L0_5205.STATUS_FALL = 1
L0_5205 = Global
L0_5205.STATUS_JUMP = 2
L0_5205 = Global
L0_5205.STATUS_STAND = 3
L0_5205 = Global
L0_5205.STATUS_ALERT = 4
L0_5205 = Global
L0_5205.STATUS_WALK = 5
L0_5205 = Global
L0_5205.STATUS_FLY = 6
L0_5205 = Global
L0_5205.STATUS_LADDER = 7
L0_5205 = Global
L0_5205.STATUS_ROPE = 8
L0_5205 = Global
L0_5205.STATUS_HIT = 9
L0_5205 = Global
L0_5205.STATUS_DIE = 10
L0_5205 = {}
L0_5205[1] = "Status"
L1_5206 = {}
L2_5207 = {}
L3_5208 = {}
L3_5208[1] = "UnderAttack"
L4_5209 = SessionObject
function L5_5210(A0_5211, A1_5212, A2_5213, A3_5214, A4_5215)
  Component.Constructor(A0_5211)
  A0_5211.width = math.abs(A1_5212)
  A0_5211.height = math.abs(A2_5213)
  A0_5211.init_x = A3_5214 or 0
  A0_5211.init_y = A4_5215 or 0
  A0_5211.layer = 8
  A0_5211.fixed = false
  A0_5211.skills = {}
  A0_5211.type = WORLD_TYPE_LIFE
  A0_5211.care_type = WORLD_TYPE_FOOTHOLD | WORLD_TYPE_WALL | WORLD_TYPE_LADDER | WORLD_TYPE_PORTAL
  A0_5211.hate_type = WORLD_TYPE_MOB
  A0_5211.on = {
    "Start",
    A0_5211,
    SessionObject.on_start_set
  }
  A0_5211.on = {
    "Stop",
    A0_5211,
    SessionObject.on_stop_set
  }
  A0_5211.on = {
    "Parent",
    A0_5211,
    SessionObject.on_parent_set
  }
  A0_5211.on = {
    "BeforeParent",
    A0_5211,
    SessionObject.on_before_parent_set
  }
  A0_5211.status_handle = {
    STATUS_STAND,
    StatusHandle()
  }
  A0_5211.status_handle = {
    STATUS_WALK,
    StatusHandle()
  }
  A0_5211.status_handle = {
    STATUS_ALERT,
    StatusHandle()
  }
  A0_5211.status_handle = {
    STATUS_FLY,
    StatusHandle()
  }
  A0_5211.status_handle = {
    STATUS_LADDER,
    LadderStatus()
  }
  A0_5211.status_handle = {
    STATUS_ROPE,
    LadderStatus()
  }
  A0_5211.status_handle = {
    STATUS_JUMP,
    JumpStatus()
  }
  A0_5211.status_handle = {
    STATUS_FALL,
    FallStatus()
  }
  rawset(A0_5211, "attach_status", {})
end
L4_5209.Constructor = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5216, A1_5217)
  local L2_5218
  L2_5218 = "SessionObject"
  return L2_5218
end
L4_5209.class_get = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5219, A1_5220)
  local L2_5221
  L2_5221 = A0_5219.body
  if not L2_5221 then
    return 0
  end
  return math.floor(L2_5221:GetPosition().x * Config.PTMRatio)
end
L4_5209.x_get = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5222, A1_5223, A2_5224)
  local L3_5225, L4_5226, L5_5227
  L3_5225 = A0_5222.body
  if not L3_5225 then
    return
  end
  L4_5226 = Config
  L4_5226 = L4_5226.PTMRatio
  L4_5226 = A2_5224 / L4_5226
  L5_5227 = L3_5225.GetPosition
  L5_5227 = L5_5227(L3_5225)
  L5_5227 = L5_5227.y
  L3_5225:SetTransform(b2Vec2(L4_5226, L5_5227), L3_5225:GetAngle())
  L3_5225:SetAwake(true)
end
L4_5209.x_set = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5228, A1_5229)
  local L2_5230
  L2_5230 = A0_5228.body
  if not L2_5230 then
    return 0
  end
  return math.ceil(L2_5230:GetPosition().y * Config.PTMRatio)
end
L4_5209.y_get = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5231, A1_5232, A2_5233)
  local L3_5234, L4_5235, L5_5236
  L3_5234 = A0_5231.body
  if not L3_5234 then
    return
  end
  L5_5236 = L3_5234
  L4_5235 = L3_5234.GetPosition
  L4_5235 = L4_5235(L5_5236)
  L4_5235 = L4_5235.x
  L5_5236 = Config
  L5_5236 = L5_5236.PTMRatio
  L5_5236 = A2_5233 / L5_5236
  L3_5234:SetTransform(b2Vec2(L4_5235, L5_5236), L3_5234:GetAngle())
  L3_5234:SetAwake(true)
end
L4_5209.y_set = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5237)
  return rawget(A0_5237, "fixed")
end
L4_5209.fixed_get = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5238, A1_5239, A2_5240)
  rawset(A0_5238, "fixed", A2_5240)
end
L4_5209.fixed_set = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5241, A1_5242)
  local L2_5243
  L2_5243 = A0_5241.body
  if not L2_5243 then
    return 0
  end
  return L2_5243:GetPosition().y * Config.PTMRatio - A0_5241.height / 2
end
L4_5209.bottom_get = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5244, A1_5245)
  local L2_5246
  L2_5246 = A0_5244.body
  if not L2_5246 then
    return
  end
  return L2_5246:GetGravityScale()
end
L4_5209.gravity_get = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5247, A1_5248, A2_5249)
  local L3_5250
  L3_5250 = A0_5247.body
  if not L3_5250 then
    return
  end
  L3_5250:SetGravityScale(A2_5249)
end
L4_5209.gravity_set = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5251, A1_5252)
  local L2_5253
  L2_5253 = A0_5251.body
  if not L2_5253 then
    return
  end
  return {
    x = math.ceil(L2_5253:GetPosition().x * Config.PTMRatio),
    y = math.ceil(L2_5253:GetPosition().y * Config.PTMRatio)
  }
end
L4_5209.position_get = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5254, A1_5255, A2_5256, A3_5257)
  local L4_5258, L5_5259, L6_5260
  L4_5258 = A0_5254.body
  if not L4_5258 then
    return
  end
  L5_5259 = Config
  L5_5259 = L5_5259.PTMRatio
  L5_5259 = A2_5256 / L5_5259
  L6_5260 = Config
  L6_5260 = L6_5260.PTMRatio
  L6_5260 = A3_5257 / L6_5260
  L4_5258:SetTransform(b2Vec2(L5_5259, L6_5260), L4_5258:GetAngle())
  L4_5258:SetAwake(true)
end
L4_5209.position_set = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5261)
  return rawget(A0_5261, "skills")
end
L4_5209.skills_get = L5_5210
L4_5209 = SessionObject
function L5_5210(A0_5262, A1_5263, A2_5264)
  rawset(A0_5262, "skills", A2_5264)
end
L4_5209.skills_set = L5_5210
function L4_5209(A0_5265, A1_5266)
  return A0_5265.priority < A1_5266.priority
end
L5_5210 = SessionObject
function L5_5210.skill_set(A0_5267, A1_5268, A2_5269)
  local L3_5270
  L3_5270 = A0_5267.skills
  A2_5269.parent = A0_5267
  A2_5269.equip = A0_5267
  table.insert(L3_5270, A2_5269)
  table.sort(L3_5270, L4_5209)
end
L5_5210 = SessionObject
function L5_5210.skill_enable_set(A0_5271, A1_5272, A2_5273)
  for _FORV_6_, _FORV_7_ in ipairs(A0_5271.skills) do
    if _FORV_7_.id == A2_5273 then
      _FORV_7_.enable = true
      break
    end
  end
end
L5_5210 = SessionObject
function L5_5210.skill_disable_set(A0_5274, A1_5275, A2_5276)
  for _FORV_6_, _FORV_7_ in ipairs(A0_5274.skills) do
    if _FORV_7_.id == A2_5276 then
      _FORV_7_.enable = false
      break
    end
  end
end
L5_5210 = SessionObject
function L5_5210.revert_map_get(A0_5277, A1_5278)
  local L2_5279, L3_5280
  L2_5279 = Userinfo
  L3_5280 = L2_5279
  L2_5279 = L2_5279.One
  L2_5279 = L2_5279(L3_5280, string.format("serial = %d", A0_5277.name))
  if not L2_5279 then
    return
  end
  L3_5280 = L2_5279.rmap
  return L3_5280
end
L5_5210 = SessionObject
function L5_5210.revert_map_set(A0_5281, A1_5282, A2_5283)
  local L3_5284, L4_5285
  L3_5284 = Userinfo
  L4_5285 = L3_5284
  L3_5284 = L3_5284.One
  L3_5284 = L3_5284(L4_5285, string.format("serial = %d", A0_5281.name))
  if not L3_5284 then
    return
  end
  L3_5284.rmap = A2_5283
end
L5_5210 = SessionObject
function L5_5210.reset_point_get(A0_5286, A1_5287)
  return rawget(A0_5286, "reset_point")
end
L5_5210 = SessionObject
function L5_5210.reset_point_set(A0_5288, A1_5289, A2_5290)
  rawset(A0_5288, "reset_point", A2_5290)
end
L5_5210 = SessionObject
function L5_5210.transfer_get(A0_5291, A1_5292)
  return rawget(A0_5291, "transfer")
end
L5_5210 = SessionObject
function L5_5210.transfer_set(A0_5293, A1_5294, A2_5295)
  rawset(A0_5293, "transfer", A2_5295)
end
L5_5210 = SessionObject
function L5_5210.catchable_get(A0_5296, A1_5297)
  local L2_5298
  L2_5298 = A0_5296.status
  if L2_5298 == STATUS_DIE then
    return
  end
  L2_5298 = A0_5296.data
  L2_5298 = L2_5298.invincible
  L2_5298 = L2_5298 == 0
  return L2_5298
end
L5_5210 = SessionObject
function L5_5210.portal_limit_get(A0_5299, A1_5300)
  return rawget(A0_5299, "portal_limit")
end
L5_5210 = SessionObject
function L5_5210.portal_limit_set(A0_5301, A1_5302, A2_5303)
  rawset(A0_5301, "portal_limit", A2_5303)
end
L5_5210 = SessionObject
function L5_5210.alert_tick_get(A0_5304)
  return rawget(A0_5304, "alert_tick") or 0
end
L5_5210 = SessionObject
function L5_5210.alert_tick_set(A0_5305, A1_5306, A2_5307)
  rawset(A0_5305, "alert_tick", A2_5307)
end
L5_5210 = SessionObject
function L5_5210.alert_get(A0_5308)
  return rawget(A0_5308, "alert") or false
end
L5_5210 = SessionObject
function L5_5210.alert_set(A0_5309, A1_5310, A2_5311)
  rawset(A0_5309, "alert", A2_5311)
  A0_5309.alert_tick = A2_5311 and 3 or 0
  if A0_5309.proxy_status_limit then
    return
  end
  A0_5309.proxy_status = A0_5309.status
end
L5_5210 = SessionObject
function L5_5210.direction_get(A0_5312, A1_5313)
  return rawget(A0_5312, "direction") or "left"
end
L5_5210 = SessionObject
function L5_5210.direction_set(A0_5314, A1_5315, A2_5316)
  if not A2_5316 then
    return
  end
  if A0_5314.direction == A2_5316 then
    return
  end
  rawset(A0_5314, "direction", A2_5316)
  if not A0_5314.proxy then
    return
  end
  A0_5314.proxy.direction = A2_5316
end
L5_5210 = SessionObject
function L5_5210.last_status_get(A0_5317, A1_5318)
  return rawget(A0_5317, "last_status")
end
L5_5210 = SessionObject
function L5_5210.last_status_set(A0_5319, A1_5320, A2_5321)
  rawset(A0_5319, "last_status", A2_5321)
end
L5_5210 = SessionObject
function L5_5210.proxy_status_limit_get(A0_5322)
  return rawget(A0_5322, "proxy_status_limit")
end
L5_5210 = SessionObject
function L5_5210.proxy_status_limit_set(A0_5323, A1_5324, A2_5325)
  rawset(A0_5323, "proxy_status_limit", A2_5325)
  if A2_5325 then
    A0_5323.proxy.unstatus_action = true
    return
  end
  L2_5207[1] = A0_5323.status
  L2_5207[2] = A0_5323.alert
  L2_5207[3] = true
  A0_5323.proxy.status = L2_5207
end
L5_5210 = SessionObject
function L5_5210.proxy_status_set(A0_5326, A1_5327, A2_5328)
  local L3_5329
  L3_5329 = A0_5326.proxy
  if not L3_5329 then
    return
  end
  L2_5207[1] = A2_5328
  L2_5207[2] = A0_5326.alert
  L3_5329.status = L2_5207
end
L5_5210 = SessionObject
function L5_5210.proxy_update_set(A0_5330, A1_5331, A2_5332)
  local L3_5333
  L3_5333 = A0_5330.proxy
  if not L3_5333 then
    return
  end
  L1_5206[1] = math.ceil(A2_5332:GetPosition().x * Config.PTMRatio)
  L1_5206[2] = math.ceil(A2_5332:GetPosition().y * Config.PTMRatio)
  L3_5333.position = L1_5206
end
L5_5210 = SessionObject
function L5_5210.status_handle_get(A0_5334, A1_5335)
  return rawget(A0_5334, "status_handle")
end
L5_5210 = SessionObject
function L5_5210.status_handle_set(A0_5336, A1_5337, A2_5338, A3_5339)
  local L4_5340
  L4_5340 = A0_5336.status_handle
  if L4_5340 then
    L4_5340[A2_5338] = A3_5339
    return
  end
  L4_5340 = {}
  L4_5340[A2_5338] = A3_5339
  rawset(A0_5336, "status_handle", L4_5340)
end
L5_5210 = SessionObject
function L5_5210.handle_for_set(A0_5341, A1_5342, A2_5343)
  local L3_5344, L4_5345
  if not A2_5343 then
    return
  end
  L3_5344 = A0_5341.status_handle
  if not L3_5344 then
    return
  end
  L4_5345 = L3_5344[A2_5343]
  if L4_5345 then
    L4_5345:Start(A0_5341)
  end
end
L5_5210 = SessionObject
function L5_5210.handle_update_set(A0_5346, A1_5347, A2_5348)
  local L3_5349, L4_5350, L5_5351
  L3_5349 = A0_5346.status
  if not L3_5349 then
    return
  end
  L4_5350 = A0_5346.status_handle
  if not L4_5350 then
    return
  end
  L5_5351 = L4_5350[L3_5349]
  if L5_5351 then
    L5_5351:Update(A2_5348)
  end
end
L5_5210 = SessionObject
function L5_5210.unhandle_for_set(A0_5352, A1_5353, A2_5354)
  local L3_5355, L4_5356
  if not A2_5354 then
    return
  end
  L3_5355 = A0_5352.status_handle
  if not L3_5355 then
    return
  end
  L4_5356 = L3_5355[A2_5354]
  if L4_5356 then
    L4_5356:Stop(A0_5352)
  end
end
L5_5210 = SessionObject
function L5_5210.limit_status_get(A0_5357, A1_5358)
  return rawget(A0_5357, "limit_status")
end
L5_5210 = SessionObject
function L5_5210.limit_status_set(A0_5359, A1_5360, A2_5361)
  local L3_5362
  L3_5362 = A0_5359.limit_status
  if not L3_5362 then
    L3_5362 = {}
    rawset(A0_5359, "limit_status", L3_5362)
  end
  if not L3_5362[A2_5361] then
    L3_5362[A2_5361] = true
  end
end
L5_5210 = SessionObject
function L5_5210.unlimit_status_set(A0_5363, A1_5364, A2_5365)
  local L3_5366
  if not A2_5365 then
    return
  end
  L3_5366 = A0_5363.limit_status
  if not L3_5366 then
    return
  end
  L3_5366[A2_5365] = nil
end
L5_5210 = SessionObject
function L5_5210.check_limit_status(A0_5367, A1_5368, ...)
  local L3_5370, L4_5371, L5_5372, L6_5373, L7_5374, L8_5375
  L2_5369 = A0_5367.limit_status
  if not L2_5369 then
    return
  end
  for L6_5373, L7_5374 in L3_5370(L4_5371) do
    L8_5375 = L6_5373[A1_5368]
    if L8_5375(L6_5373, A0_5367, ...) then
      return true
    end
  end
end
L5_5210 = SessionObject
function L5_5210.status_get(A0_5376, A1_5377)
  return rawget(A0_5376, "status")
end
L5_5210 = SessionObject
function L5_5210.status_set(A0_5378, A1_5379, A2_5380)
  local L3_5381, L4_5382
  if not A2_5380 then
    return
  end
  L3_5381 = A0_5378.status
  L4_5382 = A0_5378.last_status
  if L3_5381 == A2_5380 then
    return
  end
  rawset(A0_5378, "status", A2_5380)
  A0_5378.last_status = L3_5381
  L0_5205[2] = A2_5380
  A0_5378.fire = L0_5205
  A0_5378.unhandle_for = L3_5381
  A0_5378.handle_for = A2_5380
  if A0_5378.proxy_status_limit then
    return
  end
  A0_5378.proxy_status = A2_5380
end
L5_5210 = SessionObject
function L5_5210.attach_status_get(A0_5383)
  return rawget(A0_5383, "attach_status")
end
L5_5210 = SessionObject
function L5_5210.attach_status_set(A0_5384, A1_5385, A2_5386, A3_5387)
  local L4_5388, L5_5389, L6_5390, L7_5391
  if not A3_5387 then
    return
  end
  L4_5388 = LoadConf
  L5_5389 = "Config/Status.conf"
  L4_5388 = L4_5388(L5_5389)
  if not L4_5388 then
    return
  end
  L5_5389 = L4_5388[A3_5387]
  if not L5_5389 then
    return
  end
  L6_5390 = A0_5384.attach_status
  L7_5391 = nil
  for _FORV_12_, _FORV_13_ in pairs(L6_5390) do
    if _FORV_12_ == A3_5387 and true or L5_5389.mutex and L5_5389.mutex == _FORV_13_.info.mutex then
      L7_5391 = _FORV_13_
      break
    end
  end
  if L7_5391 then
    L7_5391.unattach = true
  end
  L6_5390[A3_5387] = Status(A0_5384, A2_5386, L5_5389, L7_5391)
  if not Status(A0_5384, A2_5386, L5_5389, L7_5391) then
    return
  end
  Status(A0_5384, A2_5386, L5_5389, L7_5391).id = A3_5387
  Status(A0_5384, A2_5386, L5_5389, L7_5391).attach = true
end
L5_5210 = SessionObject
function L5_5210.unattach_status_set(A0_5392, A1_5393, A2_5394)
  local L3_5395, L4_5396
  L3_5395 = A0_5392.attach_status
  L4_5396 = L3_5395[A2_5394]
  if not L4_5396 then
    return
  end
  L3_5395[A2_5394] = nil
  L4_5396.unattach = true
end
L5_5210 = SessionObject
function L5_5210.on_avatar_modify_fire(A0_5397, A1_5398, A2_5399, A3_5400)
  A0_5397.fire = {
    "AvatarModify",
    A2_5399,
    A3_5400
  }
end
L5_5210 = SessionObject
function L5_5210.proxy_get(A0_5401, A1_5402)
  return rawget(A0_5401, "proxy")
end
L5_5210 = SessionObject
function L5_5210.proxy_set(A0_5403, A1_5404, A2_5405)
  local L3_5406
  L3_5406 = A0_5403.proxy
  if L3_5406 then
    L3_5406.off = {
      "modify",
      A0_5403,
      SessionObject.on_avatar_modify_fire
    }
  end
  rawset(A0_5403, "proxy", A2_5405)
  if not A2_5405 then
    return
  end
  A2_5405.on = {
    "modify",
    A0_5403,
    SessionObject.on_avatar_modify_fire
  }
  if A0_5403.parent then
    A2_5405.swim = A0_5403.parent.swim
  end
end
L5_5210 = SessionObject
function L5_5210.stand_get(A0_5407, A1_5408)
  return rawget(A0_5407, "stand")
end
L5_5210 = SessionObject
function L5_5210.stand_set(A0_5409, A1_5410, A2_5411)
  A0_5409.stand_slope = A2_5411
  rawset(A0_5409, "stand", A2_5411)
end
L5_5210 = SessionObject
function L5_5210.stand_slope_get(A0_5412, A1_5413)
  return rawget(A0_5412, "stand_slope")
end
L5_5210 = SessionObject
function L5_5210.stand_slope_set(A0_5414, A1_5415, A2_5416)
  rawset(A0_5414, "stand_slope", A2_5416)
end
L5_5210 = SessionObject
function L5_5210.slope_angle(A0_5417, A1_5418)
  local L2_5419, L3_5420, L4_5421, L5_5422
  L2_5419 = A1_5418.x1
  L2_5419 = L2_5419 + 20
  L3_5420 = A1_5418.x1
  L2_5419 = L2_5419 - L3_5420
  L3_5420 = A1_5418.y1
  L3_5420 = L3_5420 + 20
  L4_5421 = A1_5418.y1
  L3_5420 = L3_5420 - L4_5421
  L4_5421 = A1_5418.x2
  L5_5422 = A1_5418.x1
  L4_5421 = L4_5421 - L5_5422
  L5_5422 = A1_5418.y2
  L5_5422 = L5_5422 + 20
  L5_5422 = L5_5422 - A1_5418.y2
  if math.sqrt(L2_5419 * L2_5419 + L3_5420 * L3_5420) * math.sqrt(L4_5421 * L4_5421 + L5_5422 * L5_5422) == 0 then
    return 0
  end
  return math.acos((L2_5419 * L4_5421 + L3_5420 * L5_5422) / (math.sqrt(L2_5419 * L2_5419 + L3_5420 * L3_5420) * math.sqrt(L4_5421 * L4_5421 + L5_5422 * L5_5422)))
end
L5_5210 = SessionObject
function L5_5210.slope_impulse_y(A0_5423, A1_5424, A2_5425)
  local L3_5426, L4_5427, L5_5428
  L3_5426 = A0_5423.stand_slope
  if not L3_5426 then
    return A2_5425
  end
  L4_5427 = A0_5423.parent
  L4_5427 = L4_5427[L3_5426]
  if not L4_5427 then
    return A2_5425
  end
  L5_5428 = L4_5427.slope
  if not L5_5428 then
    return A2_5425
  end
  L5_5428 = L4_5427.x1
  if A1_5424 < 0 and (L4_5427.y1 > L4_5427.y2 and "left" or "right") == "left" then
    return math.abs(180 * (math.atan(L4_5427.y1 - L4_5427.y1, L4_5427.x2 - L4_5427.x1) - math.atan(L4_5427.y2 - L4_5427.y1, L4_5427.x2 - L5_5428)) / math.pi) / 33 * 3.6
  end
  if A1_5424 < 0 and (L4_5427.y1 > L4_5427.y2 and "left" or "right") == "right" then
    return A2_5425
  end
  if A1_5424 > 0 and (L4_5427.y1 > L4_5427.y2 and "left" or "right") == "left" then
    return A2_5425
  end
  if A1_5424 > 0 and (L4_5427.y1 > L4_5427.y2 and "left" or "right") == "right" then
    return math.abs(180 * (math.atan(L4_5427.y1 - L4_5427.y1, L4_5427.x2 - L4_5427.x1) - math.atan(L4_5427.y2 - L4_5427.y1, L4_5427.x2 - L5_5428)) / math.pi) / 33 * 3.6
  end
end
L5_5210 = b2Vec2
L5_5210 = L5_5210()
function SessionObject.impulse_x_set(A0_5429, A1_5430, A2_5431)
  local L3_5432
  L3_5432 = A0_5429.body
  if not L3_5432 then
    return
  end
  L5_5210.x = A2_5431
  L5_5210.y = SessionObject.slope_impulse_y(A0_5429, A2_5431, L3_5432:GetLinearVelocity().y)
  L3_5432:SetLinearVelocity(L5_5210)
end
function SessionObject.impulse_y_set(A0_5433, A1_5434, A2_5435)
  local L3_5436
  L3_5436 = A0_5433.body
  if not L3_5436 then
    return
  end
  L5_5210.x = L3_5436:GetLinearVelocity().x
  L5_5210.y = A2_5435
  L3_5436:SetLinearVelocity(L5_5210)
end
function SessionObject.impulse_set(A0_5437, A1_5438, A2_5439, A3_5440)
  local L4_5441
  L4_5441 = A0_5437.body
  if not L4_5441 then
    return
  end
  L5_5210.x = A2_5439
  L5_5210.y = A3_5440
  L4_5441:SetLinearVelocity(L5_5210)
end
function SessionObject.action_walk_set(A0_5442, A1_5443, A2_5444)
  local L3_5445, L4_5446, L5_5447
  L3_5445 = A0_5442.data
  if not L3_5445 then
    return
  end
  L4_5446 = L3_5445.speed
  L5_5447 = A0_5442.direction
  if L5_5447 == "left" then
    L5_5447 = -L4_5446
  else
    L5_5447 = L5_5447 or L4_5446
  end
  A0_5442.impulse_x = L5_5447
end
function SessionObject.action_jump_set(A0_5448, A1_5449, A2_5450)
  local L3_5451, L4_5452
  L3_5451 = A0_5448.data
  if not L3_5451 then
    return
  end
  L4_5452 = STATUS_JUMP
  A0_5448.status = L4_5452
  L4_5452 = L3_5451.jump
  A0_5448.impulse_y = L4_5452
end
function SessionObject.data_get(A0_5453, A1_5454)
  return rawget(A0_5453, "data")
end
function SessionObject.data_set(A0_5455, A1_5456, A2_5457)
  rawset(A0_5455, "data", A2_5457)
end
function SessionObject.init_x_get(A0_5458, A1_5459)
  return rawget(A0_5458, "init_x") or 0
end
function SessionObject.init_x_set(A0_5460, A1_5461, A2_5462)
  rawset(A0_5460, "init_x", A2_5462)
end
function SessionObject.init_y_get(A0_5463, A1_5464)
  return rawget(A0_5463, "init_y") or 0
end
function SessionObject.init_y_set(A0_5465, A1_5466, A2_5467)
  rawset(A0_5465, "init_y", A2_5467)
end
function SessionObject.width_get(A0_5468, A1_5469)
  return rawget(A0_5468, "width", tValue)
end
function SessionObject.width_set(A0_5470, A1_5471, A2_5472)
  rawset(A0_5470, "width", A2_5472)
end
function SessionObject.height_get(A0_5473, A1_5474)
  return rawget(A0_5473, "height", tValue)
end
function SessionObject.height_set(A0_5475, A1_5476, A2_5477)
  rawset(A0_5475, "height", A2_5477)
end
function SessionObject.type_get(A0_5478, A1_5479)
  return rawget(A0_5478, "type")
end
function SessionObject.type_set(A0_5480, A1_5481, A2_5482)
  rawset(A0_5480, "type", A2_5482)
end
function SessionObject.care_type_get(A0_5483, A1_5484)
  return rawget(A0_5483, "care_type")
end
function SessionObject.care_type_set(A0_5485, A1_5486, A2_5487)
  rawset(A0_5485, "care_type", A2_5487)
end
function SessionObject.hate_type_get(A0_5488, A1_5489)
  return rawget(A0_5488, "hate_type")
end
function SessionObject.hate_type_set(A0_5490, A1_5491, A2_5492)
  rawset(A0_5490, "hate_type", A2_5492)
end
function SessionObject.nature_type_get(A0_5493, A1_5494)
  return rawget(A0_5493, "nature_type")
end
function SessionObject.nature_type_set(A0_5495, A1_5496, A2_5497)
  rawset(A0_5495, "nature_type", A2_5497)
end
function SessionObject.body_get(A0_5498, A1_5499)
  return rawget(A0_5498, "body")
end
function SessionObject.body_set(A0_5500, A1_5501, A2_5502)
  local L3_5503
  L3_5503 = A0_5500.body
  rawset(A0_5500, "body", A2_5502)
  if not L3_5503 then
    return
  end
  A0_5500.stand = nil
  L3_5503:SetUserData(nil)
  L3_5503:GetWorld():DestroyBody(L3_5503)
end
function SessionObject.layer_get(A0_5504, A1_5505)
  return rawget(A0_5504, "layer")
end
function SessionObject.layer_set(A0_5506, A1_5507, A2_5508)
  if not A2_5508 then
    return
  end
  if A0_5506.layer == A2_5508 then
    return
  end
  rawset(A0_5506, "layer", A2_5508)
  if A0_5506.proxy then
    A0_5506.proxy.layer = A2_5508
  end
end
function SessionObject.left_set(A0_5509, A1_5510, A2_5511)
  if SessionObject.check_limit_status(A0_5509, "Left", A2_5511) then
    return
  end
  A0_5509.portal_limit = false
  if not A0_5509.status then
    return
  end
  if not A0_5509.status_handle then
    return
  end
  if A0_5509.status_handle[A0_5509.status] then
    A0_5509.status_handle[A0_5509.status]:Left(A2_5511)
  end
end
function SessionObject.right_set(A0_5512, A1_5513, A2_5514)
  if SessionObject.check_limit_status(A0_5512, "Right", A2_5514) then
    return
  end
  A0_5512.portal_limit = false
  if not A0_5512.status then
    return
  end
  if not A0_5512.status_handle then
    return
  end
  if A0_5512.status_handle[A0_5512.status] then
    A0_5512.status_handle[A0_5512.status]:Right(A2_5514)
  end
end
function SessionObject.up_set(A0_5515, A1_5516, A2_5517)
  if SessionObject.check_limit_status(A0_5515, "Up", A2_5517) then
    return
  end
  if not A0_5515.status then
    return
  end
  if not A0_5515.status_handle then
    return
  end
  if A0_5515.status_handle[A0_5515.status] then
    A0_5515.status_handle[A0_5515.status]:Up(A2_5517)
  end
end
function SessionObject.down_set(A0_5518, A1_5519, A2_5520)
  if SessionObject.check_limit_status(A0_5518, "Down", A2_5520) then
    return
  end
  A0_5518.portal_limit = false
  if not A0_5518.status then
    return
  end
  if not A0_5518.status_handle then
    return
  end
  if A0_5518.status_handle[A0_5518.status] then
    A0_5518.status_handle[A0_5518.status]:Down(A2_5520)
  end
end
function SessionObject.nothing_set(A0_5521, A1_5522, A2_5523)
  local L3_5524, L4_5525, L5_5526
  A0_5521.portal_limit = false
  L3_5524 = A0_5521.status
  if not L3_5524 then
    return
  end
  L4_5525 = A0_5521.status_handle
  if not L4_5525 then
    return
  end
  L5_5526 = L4_5525[L3_5524]
  if L5_5526 then
    L5_5526:Nothing(A2_5523)
  end
end
function SessionObject.walk_set(A0_5527, A1_5528, A2_5529)
  if SessionObject.check_limit_status(A0_5527, "Walk", A2_5529) then
    return
  end
  if not A0_5527.status then
    return
  end
  if not A0_5527.status_handle then
    return
  end
  if A0_5527.status_handle[A0_5527.status] then
    A0_5527.status_handle[A0_5527.status]:Walk(A2_5529)
  end
end
function SessionObject.jump_set(A0_5530, A1_5531, A2_5532)
  if SessionObject.check_limit_status(A0_5530, "Jump", A2_5532) then
    return
  end
  if not A0_5530.status then
    return
  end
  if not A0_5530.status_handle then
    return
  end
  if A0_5530.status_handle[A0_5530.status] then
    A0_5530.status_handle[A0_5530.status]:Jump(A2_5532)
  end
end
function SessionObject.attack_get(A0_5533)
  local L1_5534
  L1_5534 = A0_5533.skills
  for _FORV_5_, _FORV_6_ in ipairs(L1_5534) do
    if _FORV_6_.type == "attack" then
      return _FORV_6_
    end
  end
end
function SessionObject.attack_set(A0_5535, A1_5536, A2_5537)
  if SessionObject.check_limit_status(A0_5535, "Attack", A2_5537) then
    return
  end
  if not A0_5535.status then
    return
  end
  if not A0_5535.status_handle then
    return
  end
  if A0_5535.status_handle[A0_5535.status] then
    A0_5535.status_handle[A0_5535.status]:Attack(A2_5537)
  end
end
function SessionObject.under_attack_set(A0_5538, A1_5539, A2_5540)
  local L3_5541, L4_5542, L5_5543, L6_5544, L7_5545, L8_5546, L9_5547
  L3_5208[1] = "UnderAttackBefore"
  L3_5208[2] = A2_5540
  L3_5541 = L3_5208
  A0_5538.fire = L3_5541
  L3_5541 = DamageView
  L4_5542 = A2_5540
  L5_5543 = A0_5538.type
  L6_5544 = WORLD_TYPE_LIFE
  L5_5543 = L5_5543 == L6_5544
  L3_5541 = L3_5541(L4_5542, L5_5543)
  L5_5543 = L3_5541
  L4_5542 = L3_5541.SetPosition
  L6_5544 = A0_5538.x
  L7_5545 = A0_5538.y
  L8_5546 = A0_5538.height
  L8_5546 = L8_5546 / 2
  L7_5545 = L7_5545 + L8_5546
  L7_5545 = L7_5545 + 10
  L4_5542(L5_5543, L6_5544, L7_5545)
  L4_5542 = A0_5538.layer
  L4_5542 = L4_5542 + 1
  if L4_5542 > 8 then
    L5_5543 = 8
    L4_5542 = L5_5543 or L4_5542
  end
  L5_5543 = A0_5538.parent
  if L5_5543 then
    L6_5544 = L5_5543.parent
  else
    L6_5544 = L6_5544 or nil
  end
  L7_5545 = tostring
  L8_5546 = L4_5542
  L7_5545 = L7_5545(L8_5546)
  L7_5545 = L6_5544[L7_5545]
  L7_5545 = L7_5545.render
  L8_5546 = L7_5545
  L7_5545 = L7_5545.AddChild
  L9_5547 = L3_5541
  L7_5545(L8_5546, L9_5547)
  L7_5545 = A0_5538.status
  L8_5546 = STATUS_DIE
  if L7_5545 ~= L8_5546 then
    L7_5545 = A2_5540.result
  elseif L7_5545 < 1 then
    return
  end
  L3_5208[1] = "UnderAttack"
  L7_5545 = L3_5208
  A0_5538.fire = L7_5545
  A0_5538.alert = true
  L7_5545 = A0_5538.data
  L8_5546 = A2_5540.result
  L9_5547 = A2_5540.etype
  L9_5547 = L9_5547 & DAMAGE_TYPE_NONLETHAL
  if L9_5547 ~= 0 or not L8_5546 then
    L9_5547 = L7_5545.hp
    if not (L8_5546 < L9_5547) or not L8_5546 then
      L9_5547 = L7_5545.hp
      L8_5546 = L9_5547 - 1
    end
  end
  L9_5547 = -L8_5546
  L7_5545.inc_hp = L9_5547
  L9_5547 = L7_5545.hp
  if L9_5547 > 0 then
    return
  end
  L9_5547 = STATUS_DIE
  A0_5538.status = L9_5547
  L9_5547 = A0_5538.skills
  if not L9_5547 or #L9_5547 == 0 then
    return
  end
  for _FORV_13_, _FORV_14_ in ipairs(L9_5547) do
    if _FORV_14_.status == "casting" then
      _FORV_14_.interrupt = true
    end
  end
end
function SessionObject.cast_skill_set(A0_5548, A1_5549, A2_5550)
  if SessionObject.check_limit_status(A0_5548, "CastSkill", A2_5550) then
    return
  end
  if not A0_5548.status then
    return
  end
  if not A0_5548.status_handle then
    return
  end
  if A0_5548.status_handle[A0_5548.status] then
    A0_5548.status_handle[A0_5548.status]:CastSkill(A2_5550)
  end
end
function SessionObject.foothold_count_get(A0_5551, A1_5552)
  return rawget(A0_5551, "foothold_count") or 0
end
function SessionObject.foothold_count_set(A0_5553, A1_5554, A2_5555)
  rawset(A0_5553, "foothold_count", A2_5555)
end
function SessionObject.begin_contact(A0_5556, A1_5557)
end
function SessionObject.end_contact(A0_5558, A1_5559)
  if A0_5558.stand_slope ~= A1_5559.name then
    return
  end
  A0_5558.stand_slope = nil
end
function SessionObject.status_calc(A0_5560, A1_5561)
  local L2_5562, L3_5563, L4_5564, L5_5565, L6_5566, L7_5567, L8_5568
  L2_5562 = A0_5560.status
  L3_5563 = STATUS_LADDER
  if L2_5562 == L3_5563 then
    return
  end
  L3_5563 = STATUS_ROPE
  if L2_5562 == L3_5563 then
    return
  end
  L3_5563 = STATUS_DIE
  if L2_5562 == L3_5563 then
    return
  end
  L3_5563 = A0_5560.fixed
  if L3_5563 then
    L3_5563 = SessionObject
    L3_5563 = L3_5563.status_set
    L4_5564 = A0_5560
    L5_5565 = ""
    L6_5566 = STATUS_STAND
    L3_5563(L4_5564, L5_5565, L6_5566)
    return
  end
  L4_5564 = A1_5561
  L3_5563 = A1_5561.GetLinearVelocity
  L3_5563 = L3_5563(L4_5564)
  L4_5564 = L3_5563.x
  L5_5565 = L3_5563.y
  L6_5566 = b2_linearSlop
  L6_5566 = L6_5566 * 4
  L7_5567 = SessionObject
  L7_5567 = L7_5567.status_set
  L8_5568 = nil
  if L2_5562 == STATUS_JUMP then
    if L5_5565 > 0 then
      return
    end
    L8_5568 = STATUS_FALL
  elseif L2_5562 == STATUS_FALL then
    if A0_5560.foothold_count < 1 then
      return
    end
    L8_5568 = (L4_5564 > L6_5566 or L4_5564 < -L6_5566) and STATUS_WALK or STATUS_STAND
  else
    L8_5568 = A0_5560.foothold_count < 1 and STATUS_FALL or (L4_5564 > L6_5566 or L4_5564 < -L6_5566) and STATUS_WALK or STATUS_STAND
  end
  if L2_5562 ~= L8_5568 then
    L7_5567(A0_5560, "", L8_5568)
  end
end
function SessionObject.on_world_update_fire(A0_5569, A1_5570, A2_5571)
  local L3_5572, L4_5573, L5_5574
  L3_5572 = A0_5569.status
  L4_5573 = A0_5569.body
  L5_5574 = A0_5569.proxy
  SessionObject.handle_update_set(A0_5569, A2_5571)
  Component.fire_set(A0_5569, "fire", "Update", A2_5571)
  if not L4_5573 then
    return
  end
  SessionObject.proxy_update_set(A0_5569, "proxy_update", L4_5573)
  SessionObject.status_calc(A0_5569, L4_5573)
  if rawget(A0_5569, "reset_point") then
    A0_5569.reset_point = nil
    A0_5569.position = {
      rawget(A0_5569, "reset_point").x,
      rawget(A0_5569, "reset_point").y
    }
    return
  end
end
function SessionObject.on_before_parent_set(A0_5575, A1_5576)
  local L2_5577, L3_5578, L4_5579
  L2_5577 = A0_5575.parent
  if not L2_5577 then
    return
  end
  L3_5578 = A0_5575.proxy
  if L3_5578 then
    L3_5578.parent = nil
  end
  L4_5579 = A0_5575.body
  A0_5575.body = nil
  L2_5577.off = {
    "Update",
    A0_5575,
    SessionObject.on_world_update_fire
  }
end
function SessionObject.on_parent_set(A0_5580, A1_5581)
  local L2_5582, L3_5583, L4_5584, L5_5585, L6_5586, L7_5587, L8_5588, L9_5589
  A0_5580.body = nil
  A0_5580.stand = nil
  L2_5582 = A0_5580.parent
  if not L2_5582 then
    return
  end
  L3_5583 = L2_5582.world
  if not L3_5583 then
    return
  end
  L4_5584 = Config
  L4_5584 = L4_5584.PTMRatio
  L5_5585 = {
    L6_5586,
    L7_5587,
    L8_5588,
    L9_5589
  }
  L6_5586 = "Update"
  L7_5587 = A0_5580
  L8_5588 = SessionObject
  L8_5588 = L8_5588.on_world_update_fire
  L9_5589 = 0
  L2_5582.on = L5_5585
  L5_5585 = A0_5580.proxy
  if L5_5585 then
    L6_5586 = L2_5582.parent
    L5_5585.parent = L6_5586
    L6_5586 = L2_5582.swim
    L5_5585.swim = L6_5586
  end
  L6_5586 = b2BodyDef
  L6_5586 = L6_5586()
  L7_5587 = A0_5580.fixed
  if L7_5587 then
    L7_5587 = b2_staticBody
  else
    L7_5587 = L7_5587 or b2_dynamicBody
  end
  L6_5586.type = L7_5587
  L7_5587 = L6_5586.position
  L8_5588 = A0_5580.init_x
  L8_5588 = L8_5588 / L4_5584
  L7_5587.x = L8_5588
  L7_5587 = L6_5586.position
  L8_5588 = A0_5580.init_y
  L8_5588 = L8_5588 / L4_5584
  L7_5587.y = L8_5588
  L6_5586.fixedRotation = true
  L6_5586.bullet = true
  L7_5587 = Instance
  L9_5589 = L3_5583
  L8_5588 = L3_5583.CreateBody
  L9_5589 = L8_5588(L9_5589, L6_5586)
  L7_5587 = L7_5587(L8_5588, L9_5589, L8_5588(L9_5589, L6_5586))
  L8_5588 = b2PolygonShape
  L8_5588 = L8_5588()
  L9_5589 = L8_5588.SetAsBox
  L9_5589(L8_5588, A0_5580.width / 2 / L4_5584, A0_5580.height / 2 / L4_5584)
  L9_5589 = b2FixtureDef
  L9_5589 = L9_5589()
  L9_5589.shape = L8_5588
  L9_5589.friction = 1.0
  L9_5589.restitution = 0.0
  L9_5589.density = 1
  L9_5589.filter.categoryBits = A0_5580.type
  L9_5589.filter.maskBits = A0_5580.care_type
  A0_5580.body = L7_5587
  L7_5587:CreateFixture(L9_5589)
end
function SessionObject.on_start_set(A0_5590, A1_5591)
  local L2_5592
  L2_5592 = A0_5590.body
  if L2_5592 then
    L2_5592:SetUserData(A0_5590)
  end
end
function SessionObject.on_stop_set(A0_5593, A1_5594)
  local L2_5595
  A0_5593.stand = nil
  L2_5595 = A0_5593.body
  if L2_5595 then
    L2_5595:SetUserData(nil)
  end
end
