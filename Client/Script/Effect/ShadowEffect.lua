Class.ShadowEffect.Image({})
function ShadowEffect.Constructor(A0_3287, A1_3288)
  Image.Constructor(A0_3287)
  if not A0_3287.render then
    return
  end
  A0_3287.name = A1_3288
  A0_3287.back = true
  A0_3287.direction = true
end
function ShadowEffect.class_get(A0_3289, A1_3290)
  local L2_3291
  L2_3291 = "ShadowEffect"
  return L2_3291
end
function ShadowEffect.frame_count_get(A0_3292, A1_3293)
  return rawget(A0_3292, "frame_count")
end
function ShadowEffect.frame_count_set(A0_3294, A1_3295, A2_3296)
  rawset(A0_3294, "frame_count", A2_3296)
end
function ShadowEffect.loop_get(A0_3297, A1_3298)
  return rawget(A0_3297, "loop")
end
function ShadowEffect.loop_set(A0_3299, A1_3300, A2_3301)
  rawset(A0_3299, "loop", A2_3301)
end
function ShadowEffect.action_name_get(A0_3302)
  return rawget(A0_3302, "action_name")
end
function ShadowEffect.action_name_set(A0_3303, A1_3304, A2_3305)
  rawset(A0_3303, "action_name", A2_3305)
end
function ShadowEffect.direction_get(A0_3306)
  return rawget(A0_3306, "direction")
end
function ShadowEffect.direction_set(A0_3307, A1_3308, A2_3309)
  rawset(A0_3307, "direction", A2_3309)
end
function ShadowEffect.back_get(A0_3310)
  return rawget(A0_3310, "back")
end
function ShadowEffect.back_set(A0_3311, A1_3312, A2_3313)
  rawset(A0_3311, "back", A2_3313)
end
function ShadowEffect.array_get(A0_3314, A1_3315)
  return rawget(A0_3314, "array")
end
function ShadowEffect.array_set(A0_3316, A1_3317, A2_3318)
  rawset(A0_3316, "array", A2_3318)
end
function ShadowEffect.interval_set(A0_3319, A1_3320, A2_3321)
end
function ShadowEffect.direction_handle_set(A0_3322)
  local L1_3323, L2_3324, L3_3325, L4_3326, L5_3327, L6_3328
  L1_3323 = A0_3322.direction
  if not L1_3323 then
    return
  end
  L1_3323 = A0_3322.parent
  if not L1_3323 then
    return
  end
  L2_3324 = L1_3323.direction
  if L2_3324 == "left" then
    L2_3324 = 0
  else
    L2_3324 = L2_3324 or -180
  end
  A0_3322.rotation_y = L2_3324
  L2_3324 = string
  L2_3324 = L2_3324.format
  L3_3325 = "Effect/%s.ani"
  L4_3326 = A0_3322.name
  L2_3324 = L2_3324(L3_3325, L4_3326)
  L3_3325 = LoadCsv
  L4_3326 = L2_3324
  L3_3325 = L3_3325(L4_3326)
  if not L3_3325 then
    return
  end
  L4_3326 = A0_3322.parent
  L5_3327 = L4_3326.avatar
  L5_3327 = L5_3327.render
  L6_3328 = L5_3327
  L5_3327 = L5_3327.ChildByTag
  L5_3327 = L5_3327(L6_3328, 0)
  L6_3328 = L4_3326.action_tag
  L6_3328 = L6_3328[Lightuserdata(L5_3327)]
  if not L3_3325[L6_3328] then
    return
  end
  if not L3_3325[L6_3328].origin then
    return
  end
  A0_3322.x = (L4_3326.direction == "left" and L3_3325[L6_3328].origin.x or -L3_3325[L6_3328].origin.x) + ((string.find(L6_3328, "rope") or string.find(L6_3328, "ladder")) and 0 or L4_3326.direction == "left" and 23 or -30)
  A0_3322.y = L3_3325[L6_3328].origin.y + ((string.find(L6_3328, "rope") or string.find(L6_3328, "ladder")) and -50 or 0)
end
function ShadowEffect.status_handle_set(A0_3329)
  local L1_3330, L2_3331, L3_3332
  L1_3330 = A0_3329.back
  if not L1_3330 then
    return
  end
  L1_3330 = A0_3329.parent
  L2_3331 = L1_3330.status
  L3_3332 = A0_3329.order
  if L2_3331 ~= "ladder" and L2_3331 ~= "rope" then
    if L3_3332 < 0 then
      return
    end
    A0_3329.order = -1
    return
  end
  if L3_3332 < 0 then
    A0_3329.order = 1
  end
end
function ShadowEffect.on_direction_fire(A0_3333)
  local L1_3334
  A0_3333.direction_handle = true
end
function ShadowEffect.on_status_fire(A0_3335)
  local L1_3336
  A0_3335.status_handle = true
end
function ShadowEffect.on_update_fire(A0_3337, A1_3338, A2_3339)
  local L3_3340, L4_3341, L5_3342, L6_3343, L7_3344, L8_3345, L9_3346
  L3_3340 = A0_3337.parent
  L4_3341 = L3_3340.avatar
  L4_3341 = L4_3341.render
  L5_3342 = L4_3341
  L4_3341 = L4_3341.ChildByTag
  L6_3343 = 0
  L4_3341 = L4_3341(L5_3342, L6_3343)
  L5_3342 = L3_3340.action_tag
  L6_3343 = Lightuserdata
  L7_3344 = L4_3341
  L6_3343 = L6_3343(L7_3344)
  L5_3342 = L5_3342[L6_3343]
  L6_3343 = A0_3337.action_name
  if L5_3342 == L6_3343 then
    return
  end
  A0_3337.action_name = L5_3342
  L6_3343 = string
  L6_3343 = L6_3343.format
  L7_3344 = "Effect/%s.ani"
  L8_3345 = A0_3337.name
  L6_3343 = L6_3343(L7_3344, L8_3345)
  L7_3344 = LoadCsv
  L8_3345 = L6_3343
  L7_3344 = L7_3344(L8_3345)
  L8_3345 = string
  L8_3345 = L8_3345.format
  L9_3346 = "Effect/%s.ntplv"
  L8_3345 = L8_3345(L9_3346, A0_3337.name)
  L9_3346 = string
  L9_3346 = L9_3346.format
  L9_3346 = L9_3346("Effect/%s.ntp", A0_3337.name)
  if not L7_3344 then
    return
  end
  if not L7_3344[L5_3342] then
    return
  end
  if not L7_3344[L5_3342].origin then
    return
  end
  A0_3337.x = (L3_3340.direction == "left" and L7_3344[L5_3342].origin.x or -L7_3344[L5_3342].origin.x) + ((string.find(L5_3342, "rope") or string.find(L5_3342, "ladder")) and 0 or L3_3340.direction == "left" and 23 or -30)
  A0_3337.y = L7_3344[L5_3342].origin.y + ((string.find(L5_3342, "rope") or string.find(L5_3342, "ladder")) and -50 or 0)
  SpriteFrameCache:AddSpriteFramesWithFile(L8_3345, L9_3346)
  A0_3337.render:InitWithSpriteFrameName(string.format("%s.ntp", L5_3342))
end
function ShadowEffect.start_set(A0_3347, A1_3348, A2_3349)
  Image.start_set(A0_3347, A1_3348, A2_3349)
  A0_3347.status_handle = true
  A0_3347.direction_handle = true
  if not A0_3347.parent then
    return
  end
  A0_3347.parent.on = {
    "Direction",
    A0_3347,
    ShadowEffect.on_direction_fire
  }
  A0_3347.parent.on = {
    "Status",
    A0_3347,
    ShadowEffect.on_status_fire
  }
  A0_3347.parent.parent.on = {
    "Update",
    A0_3347,
    ShadowEffect.on_update_fire
  }
end
function ShadowEffect.stop_set(A0_3350, A1_3351, A2_3352)
  Image.stop_set(A0_3350, A1_3351, A2_3352)
  if not A0_3350.parent then
    return
  end
  A0_3350.parent.off = {
    "Direction",
    A0_3350,
    ShadowEffect.on_direction_fire
  }
  A0_3350.parent.off = {
    "Status",
    A0_3350,
    ShadowEffect.on_status_fire
  }
  A0_3350.parent.parent.off = {
    "Update",
    A0_3350,
    ShadowEffect.on_update_fire
  }
end
function ShadowEffect.reset_set(A0_3353, A1_3354, A2_3355)
  if not A0_3353.render then
    return
  end
end
function ShadowEffect.set_parent_nil(A0_3356)
  local L1_3357
  A0_3356.parent = nil
end
function ShadowEffect.Destructor(A0_3358)
  local L1_3359
end
