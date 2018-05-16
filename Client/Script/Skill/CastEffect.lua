Class.CastEffect.Component({})
function CastEffect.Constructor(A0_8053, A1_8054, A2_8055)
  Component.Constructor(A0_8053)
  A0_8053.name = "cast_effect"
  if not A2_8055.use_effect or A2_8055.use_effect == "" then
    return
  end
  A0_8053.effect = Effect(A2_8055.use_effect)
  A0_8053.effect0 = A2_8055.use_effect0 and Effect(A2_8055.use_effect0) or nil
  A0_8053.effect1 = A2_8055.use_effect1 and Effect(A2_8055.use_effect1) or nil
  A0_8053.effect2 = A2_8055.use_effect2 and Effect(A2_8055.use_effect2) or nil
  A0_8053.effect3 = A2_8055.use_effect3 and Effect(A2_8055.use_effect3) or nil
  if A0_8053.effect0 then
    A0_8053.effect0.back = true
  end
  if A0_8053.effect1 then
    A0_8053.effect0.back = true
  end
  if A0_8053.effect2 then
    A0_8053.effect0.back = true
  end
  if A0_8053.effect3 then
    A0_8053.effect0.back = true
  end
  A0_8053.on = {
    "Parent",
    A0_8053,
    CastEffect.on_set_parent_fire
  }
end
function CastEffect.class_get(A0_8056)
  local L1_8057
  L1_8057 = "CastEffect"
  return L1_8057
end
function CastEffect.effect_get(A0_8058)
  return rawget(A0_8058, "effect")
end
function CastEffect.effect_set(A0_8059, A1_8060, A2_8061)
  rawset(A0_8059, "effect", A2_8061)
end
function CastEffect.effect0_get(A0_8062)
  return rawget(A0_8062, "effect0")
end
function CastEffect.effect0_set(A0_8063, A1_8064, A2_8065)
  rawset(A0_8063, "effect0", A2_8065)
end
function CastEffect.effect1_get(A0_8066)
  return rawget(A0_8066, "effect1")
end
function CastEffect.effect1_set(A0_8067, A1_8068, A2_8069)
  rawset(A0_8067, "effect1", A2_8069)
end
function CastEffect.effect2_get(A0_8070)
  return rawget(A0_8070, "effect2")
end
function CastEffect.effect2_set(A0_8071, A1_8072, A2_8073)
  rawset(A0_8071, "effect2", A2_8073)
end
function CastEffect.effect3_get(A0_8074)
  return rawget(A0_8074, "effect3")
end
function CastEffect.effect3_set(A0_8075, A1_8076, A2_8077)
  rawset(A0_8075, "effect3", A2_8077)
end
function CastEffect.interval_set(A0_8078, A1_8079, A2_8080)
  local L3_8081
  L3_8081 = A0_8078.effect
  if L3_8081 then
    L3_8081 = A0_8078.effect
    L3_8081.interval = A2_8080
  end
  L3_8081 = A0_8078.effect0
  if L3_8081 then
    L3_8081 = A0_8078.effect0
    L3_8081.interval = A2_8080
  end
  L3_8081 = A0_8078.effect1
  if L3_8081 then
    L3_8081 = A0_8078.effect1
    L3_8081.interval = A2_8080
  end
  L3_8081 = A0_8078.effect2
  if L3_8081 then
    L3_8081 = A0_8078.effect2
    L3_8081.interval = A2_8080
  end
  L3_8081 = A0_8078.effect3
  if L3_8081 then
    L3_8081 = A0_8078.effect3
    L3_8081.interval = A2_8080
  end
end
function CastEffect.attach_set(A0_8082, A1_8083, A2_8084)
  local L3_8085, L4_8086
  L3_8085 = A0_8082.effect
  if L3_8085 then
    L3_8085 = A0_8082.effect
    L3_8085.parent = nil
    L3_8085 = A0_8082.effect
    L4_8086 = A2_8084.proxy
    L3_8085.parent = L4_8086
  end
  L3_8085 = A0_8082.effect0
  if L3_8085 then
    L3_8085 = A0_8082.effect0
    L3_8085.parent = nil
    L3_8085 = A0_8082.effect0
    L4_8086 = A2_8084.proxy
    L3_8085.parent = L4_8086
  end
  L3_8085 = A0_8082.effect1
  if L3_8085 then
    L3_8085 = A0_8082.effect1
    L3_8085.parent = nil
    L3_8085 = A0_8082.effect1
    L4_8086 = A2_8084.proxy
    L3_8085.parent = L4_8086
  end
  L3_8085 = A0_8082.effect2
  if L3_8085 then
    L3_8085 = A0_8082.effect2
    L3_8085.parent = nil
    L3_8085 = A0_8082.effect2
    L4_8086 = A2_8084.proxy
    L3_8085.parent = L4_8086
  end
  L3_8085 = A0_8082.effect3
  if L3_8085 then
    L3_8085 = A0_8082.effect3
    L3_8085.parent = nil
    L3_8085 = A0_8082.effect3
    L4_8086 = A2_8084.proxy
    L3_8085.parent = L4_8086
  end
end
function CastEffect.on_skill_cast_fire(A0_8087)
  local L1_8088, L2_8089
  L1_8088 = A0_8087.parent
  if not L1_8088 then
    return
  end
  L2_8089 = L1_8088.parent
  if not L2_8089 then
    return
  end
  A0_8087.attach = L2_8089
end
function CastEffect.on_skill_finish_fire(A0_8090)
  local L1_8091
  L1_8091 = A0_8090.effect
  if L1_8091 then
    L1_8091 = A0_8090.effect
    L1_8091.parent = nil
  end
  L1_8091 = A0_8090.effect0
  if L1_8091 then
    L1_8091 = A0_8090.effect0
    L1_8091.parent = nil
  end
  L1_8091 = A0_8090.effect1
  if L1_8091 then
    L1_8091 = A0_8090.effect1
    L1_8091.parent = nil
  end
  L1_8091 = A0_8090.effect2
  if L1_8091 then
    L1_8091 = A0_8090.effect2
    L1_8091.parent = nil
  end
  L1_8091 = A0_8090.effect3
  if L1_8091 then
    L1_8091 = A0_8090.effect3
    L1_8091.parent = nil
  end
end
function CastEffect.on_dexterity_fire(A0_8092)
  local L1_8093, L2_8094, L3_8095, L4_8096
  L1_8093 = A0_8092.parent
  if not L1_8093 then
    return
  end
  L2_8094 = L1_8093.parent
  if not L2_8094 then
    return
  end
  L3_8095 = L2_8094.data
  L3_8095 = L3_8095.attack_intervel
  L4_8096 = A0_8092.effect
  if L4_8096 then
    L4_8096 = A0_8092.effect
    L4_8096.interval = L3_8095
  end
  L4_8096 = A0_8092.effect0
  if L4_8096 then
    L4_8096 = A0_8092.effect0
    L4_8096.interval = L3_8095
  end
  L4_8096 = A0_8092.effect1
  if L4_8096 then
    L4_8096 = A0_8092.effect1
    L4_8096.interval = L3_8095
  end
  L4_8096 = A0_8092.effect2
  if L4_8096 then
    L4_8096 = A0_8092.effect2
    L4_8096.interval = L3_8095
  end
  L4_8096 = A0_8092.effect3
  if L4_8096 then
    L4_8096 = A0_8092.effect3
    L4_8096.interval = L3_8095
  end
end
function CastEffect.on_set_parent_fire(A0_8097)
  local L1_8098, L2_8099
  L1_8098 = A0_8097.parent
  if not L1_8098 then
    return
  end
  L2_8099 = {
    "cast",
    A0_8097,
    CastEffect.on_skill_cast_fire
  }
  L1_8098.on = L2_8099
  L2_8099 = {
    "interrupt",
    A0_8097,
    CastEffect.on_skill_finish_fire
  }
  L1_8098.on = L2_8099
  L2_8099 = {
    "finish",
    A0_8097,
    CastEffect.on_skill_finish_fire
  }
  L1_8098.on = L2_8099
  L2_8099 = L1_8098.info
  L2_8099 = L2_8099.dexterity_action
  if not L2_8099 then
    return
  end
  L2_8099 = L1_8098.parent
  if not L2_8099 then
    return
  end
  CastEffect.on_dexterity_fire(A0_8097)
  L2_8099.data.on = {
    "level",
    A0_8097,
    CastEffect.on_dexterity_fire
  }
  L2_8099.data.on = {
    "attrite",
    A0_8097,
    CastEffect.on_dexterity_fire
  }
end
