Class.Effect.Image({})
function Effect.Constructor(A0_3208, A1_3209, A2_3210, A3_3211)
  local L4_3212, L5_3213, L6_3214, L7_3215, L8_3216, L9_3217, L10_3218, L11_3219, L12_3220, L13_3221, L14_3222, L15_3223, L16_3224, L17_3225, L18_3226
  L4_3212 = Image
  L4_3212 = L4_3212.Constructor
  L5_3213 = A0_3208
  L4_3212(L5_3213)
  L4_3212 = A0_3208.render
  if not L4_3212 then
    return
  end
  L5_3213 = string
  L5_3213 = L5_3213.format
  L6_3214 = "Effect/%s.ani"
  L7_3215 = A1_3209
  L5_3213 = L5_3213(L6_3214, L7_3215)
  L6_3214 = LoadCsv
  L7_3215 = L5_3213
  L6_3214 = L6_3214(L7_3215)
  L7_3215 = string
  L7_3215 = L7_3215.format
  L8_3216 = "Effect/%s.ntplv"
  L9_3217 = A1_3209
  L7_3215 = L7_3215(L8_3216, L9_3217)
  L8_3216 = string
  L8_3216 = L8_3216.format
  L9_3217 = "Effect/%s.ntp"
  L8_3216 = L8_3216(L9_3217, L10_3218)
  if not L6_3214 then
    L9_3217 = Platform
    if L9_3217 == L10_3218 then
      L9_3217 = Log
      L9_3217(L10_3218)
    end
    return
  end
  L9_3217 = #L6_3214
  A0_3208.frame_count = L9_3217
  A0_3208.loop = A2_3210
  A0_3208.name = L5_3213
  A0_3208.direction = true
  L9_3217 = SpriteFrameCache
  L9_3217 = L9_3217.AddSpriteFramesWithFile
  L9_3217(L10_3218, L11_3219, L12_3220)
  if not A3_3211 then
    L9_3217 = Array
    L9_3217 = L9_3217()
    for L13_3221, L14_3222 in L10_3218(L11_3219) do
      L15_3223 = string
      L15_3223 = L15_3223.format
      L16_3224 = "%d.ntp"
      L17_3225 = L14_3222.no
      L15_3223 = L15_3223(L16_3224, L17_3225)
      L16_3224 = Animate
      L17_3225 = L15_3223
      L18_3226 = L14_3222.origin
      L18_3226 = L18_3226.x
      L16_3224 = L16_3224(L17_3225, L18_3226, L14_3222.origin.y, L14_3222.delay / 1000.0, 0)
      if L16_3224 ~= nil then
        L18_3226 = L9_3217
        L17_3225 = L9_3217.AddObject
        L17_3225(L18_3226, L16_3224)
      end
    end
    if not A2_3210 then
      L18_3226 = L11_3219(L12_3220, L13_3221)
      if L10_3218 then
        L11_3219(L12_3220, L13_3221)
      end
    end
    A0_3208.array = L9_3217
    return
  end
  L9_3217 = Array
  L9_3217 = L9_3217()
  for L15_3223, L16_3224 in L12_3220(L13_3221) do
    L17_3225 = string
    L17_3225 = L17_3225.format
    L18_3226 = "%d.ntp"
    L17_3225 = L17_3225(L18_3226, L16_3224.no)
    L18_3226 = Animate
    L18_3226 = L18_3226(L17_3225, L16_3224.origin.x, L16_3224.origin.y, L16_3224.delay / 1000.0, 0)
    if A3_3211 > L15_3223 then
      if L18_3226 ~= nil then
        L10_3218:AddObject(L18_3226)
      end
    elseif L18_3226 ~= nil then
      L11_3219:AddObject(L18_3226)
    end
  end
  L15_3223 = L10_3218
  L18_3226 = L14_3222(L15_3223)
  L12_3220(L13_3221, L14_3222, L15_3223, L16_3224, L17_3225, L18_3226, L14_3222(L15_3223))
  L15_3223 = Sequence
  L16_3224 = L11_3219
  L15_3223 = L15_3223(L16_3224)
  L16_3224 = 2147483647
  L18_3226 = L14_3222(L15_3223, L16_3224)
  L12_3220(L13_3221, L14_3222, L15_3223, L16_3224, L17_3225, L18_3226, L14_3222(L15_3223, L16_3224))
  A0_3208.array = L9_3217
end
function Effect.class_get(A0_3227, A1_3228)
  local L2_3229
  L2_3229 = "Effect"
  return L2_3229
end
function Effect.frame_count_get(A0_3230, A1_3231)
  return rawget(A0_3230, "frame_count")
end
function Effect.frame_count_set(A0_3232, A1_3233, A2_3234)
  rawset(A0_3232, "frame_count", A2_3234)
end
function Effect.loop_get(A0_3235, A1_3236)
  return rawget(A0_3235, "loop")
end
function Effect.loop_set(A0_3237, A1_3238, A2_3239)
  rawset(A0_3237, "loop", A2_3239)
end
function Effect.direction_get(A0_3240)
  return rawget(A0_3240, "direction")
end
function Effect.direction_set(A0_3241, A1_3242, A2_3243)
  rawset(A0_3241, "direction", A2_3243)
end
function Effect.back_get(A0_3244)
  return rawget(A0_3244, "back")
end
function Effect.back_set(A0_3245, A1_3246, A2_3247)
  rawset(A0_3245, "back", A2_3247)
end
function Effect.array_get(A0_3248, A1_3249)
  return rawget(A0_3248, "array")
end
function Effect.array_set(A0_3250, A1_3251, A2_3252)
  rawset(A0_3250, "array", A2_3252)
end
function Effect.interval_set(A0_3253, A1_3254, A2_3255)
  local L3_3256, L4_3257, L5_3258, L6_3259, L7_3260, L8_3261
  if not A2_3255 then
    return
  end
  L3_3256 = A0_3253.frame_count
  L3_3256 = A2_3255 / L3_3256
  L4_3257 = A0_3253.array
  for L8_3261 = 0, L6_3259 - 1 do
    L4_3257:ObjectAtIndex(L8_3261):SetDuration(L3_3256)
  end
end
function Effect.direction_handle_set(A0_3262)
  local L1_3263, L2_3264
  L1_3263 = A0_3262.direction
  if not L1_3263 then
    return
  end
  L1_3263 = A0_3262.parent
  if not L1_3263 then
    return
  end
  L2_3264 = L1_3263.direction
  if L2_3264 == "left" then
    L2_3264 = 0
  else
    L2_3264 = L2_3264 or -180
  end
  A0_3262.rotation_y = L2_3264
end
function Effect.status_handle_set(A0_3265)
  local L1_3266, L2_3267, L3_3268
  L1_3266 = A0_3265.back
  if not L1_3266 then
    return
  end
  L1_3266 = A0_3265.parent
  L2_3267 = L1_3266.status
  L3_3268 = A0_3265.order
  if L2_3267 ~= "ladder" and L2_3267 ~= "rope" then
    if L3_3268 < 0 then
      return
    end
    A0_3265.order = -1
    return
  end
  if L3_3268 < 0 then
    A0_3265.order = 1
  end
end
function Effect.on_direction_fire(A0_3269)
  local L1_3270
  A0_3269.direction_handle = true
end
function Effect.on_status_fire(A0_3271)
  local L1_3272
  A0_3271.status_handle = true
end
function Effect.start_set(A0_3273, A1_3274, A2_3275)
  local L3_3276
  L3_3276 = Image
  L3_3276 = L3_3276.start_set
  L3_3276(A0_3273, A1_3274, A2_3275)
  L3_3276 = A0_3273.array
  if not L3_3276 then
    return
  end
  A0_3273.unactions = true
  L3_3276 = Sequence
  L3_3276 = L3_3276(A0_3273.array)
  if not L3_3276 then
    return
  end
  if A0_3273.loop then
    L3_3276 = RepeatForever(L3_3276)
  end
  if not L3_3276 then
    return
  end
  A0_3273.action = L3_3276
  A0_3273.status_handle = true
  A0_3273.direction_handle = true
  if not A0_3273.parent then
    return
  end
  A0_3273.parent.on = {
    "Direction",
    A0_3273,
    Effect.on_direction_fire
  }
  A0_3273.parent.on = {
    "Status",
    A0_3273,
    Effect.on_status_fire
  }
end
function Effect.stop_set(A0_3277, A1_3278, A2_3279)
  Image.stop_set(A0_3277, A1_3278, A2_3279)
  if not A0_3277.parent then
    return
  end
  A0_3277.parent.off = {
    "Direction",
    A0_3277,
    Effect.on_direction_fire
  }
  A0_3277.parent.off = {
    "Status",
    A0_3277,
    Effect.on_status_fire
  }
end
function Effect.reset_set(A0_3280, A1_3281, A2_3282)
  if not A0_3280.render then
    return
  end
end
function Effect.set_parent_nil(A0_3283)
  local L1_3284
  A0_3283.parent = nil
end
function Effect.Destructor(A0_3285)
  local L1_3286
end
