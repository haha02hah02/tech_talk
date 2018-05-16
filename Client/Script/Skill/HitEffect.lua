Class.HitEffect.Component({})
function HitEffect.Constructor(A0_8438, A1_8439, A2_8440)
  Component.Constructor(A0_8438)
  A0_8438.name = "hit_effect"
  A0_8438.effect_list = {}
end
function HitEffect.class_get(A0_8441)
  local L1_8442
  L1_8442 = "HitEffect"
  return L1_8442
end
function HitEffect.effect_list_get(A0_8443)
  return rawget(A0_8443, "effect_list")
end
function HitEffect.effect_list_set(A0_8444, A1_8445, A2_8446)
  rawset(A0_8444, "effect_list", A2_8446)
end
function HitEffect.effect_index_get(A0_8447)
  return rawget(A0_8447, "effect_index") or 1
end
function HitEffect.effect_index_set(A0_8448, A1_8449, A2_8450)
  rawset(A0_8448, "effect_index", A2_8450)
end
function HitEffect.effect_get(A0_8451, A1_8452, A2_8453, A3_8454)
  local L4_8455, L5_8456, L6_8457, L7_8458, L8_8459, L9_8460, L10_8461
  L4_8455 = A0_8451.parent
  if not L4_8455 then
    return
  end
  L5_8456 = L4_8455.info
  if not L5_8456 then
    return
  end
  L6_8457 = L5_8456.hit_effect
  if not L6_8457 then
    return
  end
  L7_8458 = A2_8453.direction
  if L7_8458 == "left" then
    L7_8458 = 0
  else
    L7_8458 = L7_8458 or -180
  end
  L8_8459 = A0_8451.effect_list
  L9_8460 = L6_8457
  if L10_8461 == "table" then
    if A3_8454 then
    else
    end
    if L10_8461 > #L6_8457 then
    end
    A0_8451.effect_index = L10_8461
    L8_8459, L8_8459[L10_8461], L9_8460 = L8_8459[L10_8461] or {}, L8_8459[L10_8461] or {}, L6_8457[L10_8461]
  end
  if not L9_8460 or L9_8460 == "" then
    return
  end
  for _FORV_13_, _FORV_14_ in L10_8461(L8_8459) do
    if not _FORV_14_.parent then
      _FORV_14_.rotation_y = L7_8458
      return _FORV_14_
    end
  end
  L10_8461.name = L9_8460
  L10_8461.rotation_y = L7_8458
  table.insert(L8_8459, L10_8461)
  return L10_8461
end
function HitEffect.attach_set(A0_8462, A1_8463, A2_8464, A3_8465)
  if not HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465) then
    return
  end
  if A0_8462.parent.info.map_hit_effect then
    if A0_8462.parent.parent.parent.parent["8"].child.all[HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).name] then
      A0_8462.parent.parent.parent.parent["8"].child.all[HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).name].parent = nil
    end
    HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).x = A2_8464.position.x
    HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).y = A2_8464.position.y + A2_8464.height / 2 * (A0_8462.parent.info.hit_effect_pos or 0)
    HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).direction = false
    HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).parent, HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).rotation_y = A0_8462.parent.parent.parent.parent["8"], A0_8462.parent.parent.direction == "left" and 0 or -180
    return
  end
  if A2_8464.proxy.child.all[HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).name] then
    A2_8464.proxy.child.all[HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).name].parent = nil
  end
  HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).x = 0
  HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).y = A2_8464.height / 2 * (A0_8462.parent.info.hit_effect_pos or 0)
  HitEffect.effect_get(A0_8462, "effect", A2_8464, A3_8465).parent = A2_8464.proxy
end
