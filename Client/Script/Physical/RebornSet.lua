Class.RebornSet.Component({})
function RebornSet.Constructor(A0_5050, A1_5051, A2_5052, A3_5053)
  Component.Constructor(A0_5050)
  if A3_5053 then
    return
  end
  A0_5050.name = "reborn"
  A0_5050.on = {
    "Parent",
    A0_5050,
    RebornSet.on_parent_fire
  }
  A0_5050.parent = A1_5051
end
function RebornSet.class_get(A0_5054)
  local L1_5055
  L1_5055 = "RebornSet"
  return L1_5055
end
function RebornSet.tick_count_get(A0_5056)
  return rawget(A0_5056, "tick_count")
end
function RebornSet.tick_count_set(A0_5057, A1_5058, A2_5059)
  rawset(A0_5057, "tick_count", A2_5059)
end
function RebornSet.reset_position_get(A0_5060)
  return rawget(A0_5060, "reset_position")
end
function RebornSet.reset_position_set(A0_5061, A1_5062, A2_5063)
  rawset(A0_5061, "reset_position", A2_5063)
end
function RebornSet.reborn_time_get(A0_5064)
  return rawget(A0_5064, "reborn_time")
end
function RebornSet.reborn_time_set(A0_5065, A1_5066, A2_5067)
  rawset(A0_5065, "reborn_time", A2_5067)
end
function RebornSet.reborn_init(A0_5068)
  local L1_5069, L2_5070, L3_5071
  L1_5069 = A0_5068.parent
  L2_5070 = L1_5069.data
  L3_5071 = L1_5069.data
  L3_5071 = L3_5071.max_hp
  L2_5070.hp = L3_5071
  L2_5070 = L1_5069.data
  L3_5071 = L1_5069.data
  L3_5071 = L3_5071.max_mp
  L2_5070.mp = L3_5071
  L2_5070 = L1_5069.proxy
  L3_5071 = L1_5069.proxy
  L3_5071 = L3_5071.info
  L3_5071 = L3_5071.fly_speed
  if L3_5071 then
    L3_5071 = STATUS_FLY
  else
    L3_5071 = L3_5071 or STATUS_STAND
  end
  L2_5070.status = L3_5071
end
function RebornSet.set_reborn(A0_5072)
  local L1_5073, L2_5074
  L1_5073 = A0_5072.parent
  L2_5074 = L1_5073.proxy
  L2_5074 = L2_5074.info
  L2_5074 = L2_5074.fly_speed
  if L2_5074 then
    L2_5074 = STATUS_FLY
  else
    L2_5074 = L2_5074 or STATUS_STAND
  end
  L1_5073.status = L2_5074
end
function RebornSet.on_update_fire(A0_5075, A1_5076, A2_5077)
  local L3_5078, L4_5079, L5_5080, L6_5081
  L3_5078 = A0_5075.tick_count
  L3_5078 = L3_5078 + A2_5077
  A0_5075.tick_count = L3_5078
  L4_5079 = A0_5075.reborn_time
  L5_5080 = A0_5075.reset_position
  if not L5_5080 then
    L5_5080 = L4_5079 / 2
    if L3_5078 > L5_5080 then
      A0_5075.reset_position = true
      L5_5080 = {
        L6_5081,
        A1_5076.init_y
      }
      L6_5081 = A1_5076.init_x
      A1_5076.position = L5_5080
    end
  end
  if L3_5078 < L4_5079 then
    return
  end
  L5_5080 = {
    L6_5081,
    A0_5075,
    RebornSet.on_update_fire
  }
  L6_5081 = "Update"
  A1_5076.off = L5_5080
  L5_5080 = A0_5075.parent
  L6_5081 = Array
  L6_5081 = L6_5081()
  L6_5081:AddObject(Show())
  L6_5081:AddObject(OpacityTo(0.0, 0))
  L6_5081:AddObject(ActionInstant(Functor(A0_5075, RebornSet.reborn_init)))
  L6_5081:AddObject(OpacityTo(0.8, 255))
  L6_5081:AddObject(ActionInstant(Functor(A0_5075, RebornSet.set_reborn)))
  L5_5080.proxy.avatar.action = Sequence(L6_5081)
end
function RebornSet.set_update_set(A0_5082, A1_5083, A2_5084)
  local L3_5085, L4_5086
  L3_5085 = A0_5082.parent
  if not L3_5085 then
    return
  end
  L4_5086 = {
    "Update",
    A0_5082,
    RebornSet.on_update_fire
  }
  L3_5085.on = L4_5086
  A0_5082.reset_position = false
  A0_5082.tick_count = 0
  L4_5086 = L3_5085.proxy
  L4_5086 = L4_5086.info
  L4_5086 = L4_5086.rebirth
  L4_5086 = L4_5086 or 10
  A0_5082.reborn_time = L4_5086
end
function RebornSet.on_status_set(A0_5087, A1_5088)
  local L3_5089
  L3_5089 = A1_5088.status
  if L3_5089 ~= STATUS_DIE then
    return
  end
  if A1_5088.proxy.info.death_summon then
    return
  end
  A0_5087.set_update = true
end
function RebornSet.on_parent_fire(A0_5090)
  local L1_5091
  L1_5091 = A0_5090.parent
  if not L1_5091 then
    return
  end
  L1_5091.on = {
    "Status",
    A0_5090,
    RebornSet.on_status_set
  }
end
