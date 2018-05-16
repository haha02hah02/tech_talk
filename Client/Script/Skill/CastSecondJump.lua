Class.CastSecondJump.Component({})
function CastSecondJump.Constructor(A0_8243, A1_8244, A2_8245)
  Component.Constructor(A0_8243)
  A0_8243.name = "cast_second_jump"
  A0_8243.limit_status = LimitStatus(true)
  A0_8243.on = {
    "Parent",
    A0_8243,
    CastSecondJump.on_set_parent_fire
  }
end
function CastSecondJump.class_get(A0_8246)
  local L1_8247
  L1_8247 = "CastSecondJump"
  return L1_8247
end
function CastSecondJump.limit_status(A0_8248)
  return rawget(A0_8248, "limit_status")
end
function CastSecondJump.limit_status_set(A0_8249, A1_8250, A2_8251)
  rawset(A0_8249, "limit_status", A2_8251)
end
function CastSecondJump.on_update_fire(A0_8252, A1_8253)
  local L2_8254, L3_8255
  L2_8254 = A1_8253.status
  L3_8255 = STATUS_STAND
  if L2_8254 ~= L3_8255 then
    L3_8255 = STATUS_WALK
    if L2_8254 ~= L3_8255 then
      L3_8255 = STATUS_LADDER
      if L2_8254 ~= L3_8255 then
        L3_8255 = STATUS_ROPE
        if L2_8254 ~= L3_8255 then
          return
        end
      end
    end
  end
  L3_8255 = A0_8252.limit_status
  A1_8253.unlimit_status = L3_8255
  L3_8255 = {
    "Update",
    A0_8252,
    CastSecondJump.on_update_fire
  }
  A1_8253.off = L3_8255
end
function CastSecondJump.on_skill_execute_fire(A0_8256)
  local L1_8257, L2_8258, L3_8259, L4_8260, L5_8261, L6_8262, L7_8263
  L1_8257 = A0_8256.parent
  if not L1_8257 then
    return
  end
  L2_8258 = L1_8257.info
  L3_8259 = L2_8258.speed
  if L3_8259 then
    L3_8259 = L2_8258.jump
  elseif not L3_8259 then
    return
  end
  L3_8259 = L1_8257.parent
  if not L3_8259 then
    return
  end
  L4_8260 = L3_8259.parent
  L4_8260 = L4_8260.parent
  if not L4_8260 then
    return
  end
  L5_8261 = math
  L5_8261 = L5_8261.min
  L6_8262 = L3_8259.data
  L6_8262 = L6_8262.level
  L7_8263 = L2_8258.req_level
  if not L7_8263 then
    L7_8263 = Config
    L7_8263 = L7_8263.ZeroNumber
  end
  L6_8262 = L6_8262 - L7_8263
  L7_8263 = L2_8258.max_level
  if not L7_8263 then
    L7_8263 = Config
    L7_8263 = L7_8263.ZeroNumber
  end
  L5_8261 = L5_8261(L6_8262, L7_8263)
  L6_8262 = L2_8258.speed
  L7_8263 = L2_8258.lspeed
  L7_8263 = L7_8263 or 0
  L7_8263 = L7_8263 * L5_8261
  L6_8262 = L6_8262 + L7_8263
  L7_8263 = L2_8258.jump
  L7_8263 = L7_8263 + (L2_8258.ljump or 0) * L5_8261
  if L3_8259.direction == "left" then
    L6_8262 = -L6_8262 or L6_8262
  end
  L3_8259.limit_status = A0_8256.limit_status
  SessionObject.impulse_set(L3_8259, "impulse", L6_8262, L7_8263)
  L3_8259.on = {
    "Update",
    A0_8256,
    CastSecondJump.on_update_fire
  }
  L3_8259.fire = L2_8258.type == "attack" and "AttackAfter" or "CastSkillAfter"
end
function CastSecondJump.on_set_parent_fire(A0_8264)
  local L1_8265
  L1_8265 = A0_8264.parent
  if not L1_8265 then
    return
  end
  L1_8265.on = {
    "execute",
    A0_8264,
    CastSecondJump.on_skill_execute_fire
  }
end
