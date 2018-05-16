Class.DeathSummon.Component({})
function DeathSummon.Constructor(A0_4297, A1_4298, A2_4299)
  Component.Constructor(A0_4297)
  if not A2_4299.death_summon then
    return
  end
  A0_4297.name = "death_summon"
  A0_4297.on = {
    "Start",
    A0_4297,
    DeathSummon.on_start_fire
  }
  A0_4297.on = {
    "Stop",
    A0_4297,
    DeathSummon.on_stop_fire
  }
  A0_4297.parent = A1_4298
end
function DeathSummon.start_time_get(A0_4300)
  return rawget(A0_4300, "start_time") or 0
end
function DeathSummon.start_time_set(A0_4301, A1_4302, A2_4303)
  rawset(A0_4301, "start_time", A2_4303)
end
function DeathSummon.summon_lifed_get(A0_4304)
  return rawget(A0_4304, "summon_lifed") or 0
end
function DeathSummon.summon_lifed_set(A0_4305, A1_4306, A2_4307)
  rawset(A0_4305, "summon_lifed", A2_4307)
end
function DeathSummon.on_summon_status_fire(A0_4308, A1_4309)
  local L2_4310, L3_4311, L4_4312
  L2_4310 = A1_4309.status
  L3_4311 = STATUS_DIE
  if L2_4310 ~= L3_4311 then
    return
  end
  L2_4310 = A0_4308.summon_lifed
  L2_4310 = L2_4310 - 1
  A0_4308.summon_lifed = L2_4310
  if L2_4310 > 0 then
    return
  end
  L3_4311 = A0_4308.parent
  L4_4312 = L3_4311.reborn
  if L4_4312 then
    L4_4312.set_update = true
  end
end
function DeathSummon.mob_summon_set(A0_4313, A1_4314, A2_4315, A3_4316, A4_4317)
  local L5_4318
  L5_4318 = A2_4315.parent
  L5_4318 = L5_4318.parent
  if not Mob(string.format("%s_%d", A2_4315.name, A4_4317), A3_4316, A2_4315.x, A2_4315.y - A2_4315.height / 2 + 1, true) then
    return
  end
  L5_4318.mob = Mob(string.format("%s_%d", A2_4315.name, A4_4317), A3_4316, A2_4315.x, A2_4315.y - A2_4315.height / 2 + 1, true)
  Mob(string.format("%s_%d", A2_4315.name, A4_4317), A3_4316, A2_4315.x, A2_4315.y - A2_4315.height / 2 + 1, true).proxy.show_info = true
  Mob(string.format("%s_%d", A2_4315.name, A4_4317), A3_4316, A2_4315.x, A2_4315.y - A2_4315.height / 2 + 1, true).on = {
    "Status",
    A0_4313,
    DeathSummon.on_summon_status_fire,
    1
  }
end
function DeathSummon.on_update_fire(A0_4319, A1_4320, A2_4321)
  local L3_4322, L4_4323, L5_4324, L6_4325, L7_4326, L8_4327, L9_4328, L10_4329, L11_4330
  L3_4322 = A1_4320.proxy
  L3_4322 = L3_4322.death_delay
  L3_4322 = L3_4322 - 0.1
  L4_4323 = A0_4319.start_time
  L4_4323 = L4_4323 + L3_4322
  A0_4319.start_time = L4_4323
  if L3_4322 > L4_4323 then
    return
  end
  L5_4324 = A1_4320.proxy
  L5_4324 = L5_4324.info
  L6_4325 = A1_4320.proxy
  L6_4325 = L6_4325.info
  L6_4325 = L6_4325.death_summon
  L10_4329 = DeathSummon
  L10_4329 = L10_4329.on_update_fire
  A1_4320.off = L7_4326
  A0_4319.summon_lifed = 1
  if L7_4326 == "number" then
    L10_4329 = A1_4320
    L11_4330 = L6_4325
    L7_4326(L8_4327, L9_4328, L10_4329, L11_4330, 1)
    return
  end
  A0_4319.summon_lifed = L7_4326
  for L10_4329, L11_4330 in L7_4326(L8_4327) do
    DeathSummon.mob_summon_set(A0_4319, "", A1_4320, L11_4330, L10_4329)
  end
end
function DeathSummon.on_status_fire(A0_4331, A1_4332)
  local L2_4333
  L2_4333 = A1_4332.status
  if L2_4333 ~= STATUS_DIE then
    return
  end
  A0_4331.start_time = 0
  L2_4333 = A1_4332.proxy
  L2_4333 = L2_4333.info
  L2_4333 = L2_4333.death_summon
  if not L2_4333 then
    return
  end
  L2_4333 = {
    "Update",
    A0_4331,
    DeathSummon.on_update_fire,
    -1
  }
  A1_4332.on = L2_4333
end
function DeathSummon.on_start_fire(A0_4334)
  local L1_4335
  L1_4335 = A0_4334.parent
  if not L1_4335 then
    return
  end
  L1_4335.on = {
    "Status",
    A0_4334,
    DeathSummon.on_status_fire
  }
end
function DeathSummon.on_stop_fire(A0_4336)
  local L1_4337
  L1_4337 = A0_4336.parent
  if not L1_4337 then
    return
  end
  L1_4337.off = {
    "Status",
    A0_4336,
    DeathSummon.on_status_fire
  }
end
