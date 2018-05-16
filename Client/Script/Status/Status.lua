L0_8615 = Class
L0_8615 = L0_8615.Status
L0_8615 = L0_8615.Component
L0_8615({})
L0_8615 = {}
function Status.Constructor(A0_8616, A1_8617, A2_8618, A3_8619, A4_8620)
  Component.Constructor(A0_8616)
  A0_8616.info = A3_8619
  A0_8616.limit_status = LimitStatus(not A3_8619.cant_operate, not A3_8619.cant_walk, not A3_8619.cant_jump, not A3_8619.cant_attack, not A3_8619.cant_skill)
  A0_8616.source = A1_8617
  A0_8616.target = A2_8618
  A0_8616.effect = A3_8619.effect and Effect(A3_8619.effect, true) or nil
  if not A3_8619.script then
    return
  end
  L0_8615[1] = A3_8619.script
  L0_8615[2] = A0_8616
  A0_8616.script = L0_8615
end
function Status.class_get(A0_8621)
  local L1_8622
  L1_8622 = "Status"
  return L1_8622
end
function Status.info_get(A0_8623)
  return rawget(A0_8623, "info")
end
function Status.info_set(A0_8624, A1_8625, A2_8626)
  rawset(A0_8624, "info", A2_8626)
end
function Status.id_get(A0_8627)
  return rawget(A0_8627, "id")
end
function Status.id_set(A0_8628, A1_8629, A2_8630)
  rawset(A0_8628, "id", A2_8630)
end
function Status.effect_get(A0_8631)
  return rawget(A0_8631, "effect")
end
function Status.effect_set(A0_8632, A1_8633, A2_8634)
  rawset(A0_8632, "effect", A2_8634)
end
function Status.limit_status_get(A0_8635)
  return rawget(A0_8635, "limit_status")
end
function Status.limit_status_set(A0_8636, A1_8637, A2_8638)
  rawset(A0_8636, "limit_status", A2_8638)
end
function Status.source_get(A0_8639, A1_8640)
  local L2_8641
  L2_8641 = rawget
  L2_8641 = L2_8641(A0_8639, "values")
  if not L2_8641 then
    return
  end
  if rawget(L2_8641, A1_8640) then
    return rawget(L2_8641, A1_8640)[A1_8640]
  end
end
function Status.source_set(A0_8642, A1_8643, A2_8644)
  local L3_8645, L4_8646
  L3_8645 = A0_8642[A1_8643]
  if L3_8645 == A2_8644 then
    return
  end
  L3_8645 = rawget
  L4_8646 = A0_8642
  L3_8645 = L3_8645(L4_8646, "values")
  if not L3_8645 then
    return
  end
  L4_8646 = rawget
  L4_8646 = L4_8646(L3_8645, A1_8643)
  if L4_8646 then
    L4_8646[A1_8643] = A2_8644
    return
  end
  L4_8646 = {}
  L4_8646[A1_8643] = A2_8644
  setmetatable(L4_8646, {__mode = "v"})
  rawset(L3_8645, A1_8643, L4_8646)
end
function Status.target_get(A0_8647, A1_8648)
  local L2_8649
  L2_8649 = rawget
  L2_8649 = L2_8649(A0_8647, "values")
  if not L2_8649 then
    return
  end
  if not rawget(L2_8649, A1_8648) then
    return
  end
  return rawget(L2_8649, A1_8648)[A1_8648]
end
function Status.target_set(A0_8650, A1_8651, A2_8652)
  local L3_8653, L4_8654
  L3_8653 = A0_8650[A1_8651]
  if L3_8653 == A2_8652 then
    return
  end
  L3_8653 = rawget
  L4_8654 = A0_8650
  L3_8653 = L3_8653(L4_8654, "values")
  if not L3_8653 then
    return
  end
  L4_8654 = rawget
  L4_8654 = L4_8654(L3_8653, A1_8651)
  if L4_8654 then
    L4_8654[A1_8651] = A2_8652
    return
  end
  L4_8654 = {}
  L4_8654[A1_8651] = A2_8652
  setmetatable(L4_8654, {__mode = "v"})
  rawset(L3_8653, A1_8651, L4_8654)
end
function Status.script_set(A0_8655, A1_8656, A2_8657, A3_8658)
  local L4_8659
  if not A2_8657 then
    return
  end
  L4_8659 = Global
  L4_8659 = L4_8659[string.format("status_%d", A2_8657)]
  if not L4_8659 then
    return
  end
  if L4_8659(A0_8655.source, A0_8655.target, A0_8655.info, A3_8658) then
    L4_8659(A0_8655.source, A0_8655.target, A0_8655.info, A3_8658).parent = A0_8655
  end
end
function Status.duration_get(A0_8660)
  return rawget(A0_8660, "duration")
end
function Status.duration_set(A0_8661, A1_8662, A2_8663)
  rawset(A0_8661, "duration", A2_8663)
end
function Status.on_update_fire(A0_8664, A1_8665, A2_8666)
  local L3_8667, L4_8668, L5_8669, L6_8670
  L3_8667 = A0_8664.duration
  L3_8667 = L3_8667 + A2_8666
  A0_8664.duration = L3_8667
  L4_8668 = A0_8664.source
  L5_8669 = A0_8664.info
  L6_8670 = L5_8669.duration
  L6_8670 = L6_8670 + math.min(L4_8668.data.level - (L5_8669.req_level or 0), L5_8669.max_level or 0) * (L5_8669.lduration or 0)
  if L3_8667 < L6_8670 then
    return
  end
  L4_8668.unattach_status = A0_8664.id
end
function Status.attach_effect_set(A0_8671, A1_8672, A2_8673)
  local L3_8674, L4_8675, L5_8676, L6_8677
  L3_8674 = A0_8671.effect
  if not A2_8673 or not L3_8674 then
    return
  end
  L4_8675 = A0_8671.info
  L5_8676 = L4_8675.effect_pos
  if L5_8676 then
    L5_8676 = A2_8673.height
    L5_8676 = L5_8676 / 2
    L6_8677 = L4_8675.effect_pos
    L5_8676 = L5_8676 * L6_8677
  else
    L5_8676 = L5_8676 or 0
  end
  L3_8674.y = L5_8676
  L6_8677 = A2_8673.proxy
  L3_8674.parent = L6_8677
end
function Status.attach_set(A0_8678)
  local L1_8679, L2_8680
  L1_8679 = A0_8678.source
  if not L1_8679 then
    return
  end
  L2_8680 = A0_8678.limit_status
  L1_8679.limit_status = L2_8680
  L2_8680 = A0_8678.proxy
  if L2_8680 then
    L2_8680.attach = A0_8678
  end
  A0_8678.attach_effect = L1_8679
  if not A0_8678.info.duration then
    return
  end
  A0_8678.duration = 0
  L1_8679.on = {
    "Update",
    A0_8678,
    Status.on_update_fire
  }
  UniqueComponent("Model/interface.model").ui.istatusicon.Statusicon:SetIcon(A0_8678.id)
end
function Status.unattach_set(A0_8681)
  local L1_8682, L2_8683, L3_8684
  L1_8682 = A0_8681.source
  if not L1_8682 then
    return
  end
  L2_8683 = A0_8681.limit_status
  L1_8682.unlimit_status = L2_8683
  L2_8683 = A0_8681.proxy
  if L2_8683 then
    L2_8683.unattach = A0_8681
  end
  L3_8684 = A0_8681.effect
  if L3_8684 then
    L3_8684.parent = nil
  end
  if not A0_8681.info.duration then
    return
  end
  A0_8681.duration = 0
  L1_8682.off = {
    "Update",
    A0_8681,
    Status.on_update_fire
  }
  UniqueComponent("Model/interface.model").ui.istatusicon.Statusicon:UnsetIcon(A0_8681.id)
end
