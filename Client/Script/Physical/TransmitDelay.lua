Class.TransmitDelay.Component({})
function TransmitDelay.Constructor(A0_5659, A1_5660, A2_5661, A3_5662)
  Component.Constructor(A0_5659)
  A0_5659.delay = A1_5660
  A0_5659.tid = A2_5661
  A0_5659.tn = A3_5662
  A0_5659.time_tick = 0
  A0_5659.on = {
    "Start",
    A0_5659,
    TransmitDelay.on_start_fire
  }
  A0_5659.on = {
    "Stop",
    A0_5659,
    TransmitDelay.on_stop_fire
  }
end
function TransmitDelay.class_get(A0_5663)
  local L1_5664
  L1_5664 = "TransmitDelay"
  return L1_5664
end
function TransmitDelay.delay_get(A0_5665)
  return rawget(A0_5665, "delay")
end
function TransmitDelay.delay_set(A0_5666, A1_5667, A2_5668)
  rawset(A0_5666, "delay", A2_5668)
end
function TransmitDelay.time_tick_get(A0_5669)
  return rawget(A0_5669, "time_tick")
end
function TransmitDelay.time_tick_set(A0_5670, A1_5671, A2_5672)
  rawset(A0_5670, "time_tick", A2_5672)
end
function TransmitDelay.tid_get(A0_5673)
  return rawget(A0_5673, "tid")
end
function TransmitDelay.tid_set(A0_5674, A1_5675, A2_5676)
  rawset(A0_5674, "tid", A2_5676)
end
function TransmitDelay.tn_get(A0_5677)
  return rawget(A0_5677, "tn")
end
function TransmitDelay.tn_set(A0_5678, A1_5679, A2_5680)
  rawset(A0_5678, "tn", A2_5680)
end
function TransmitDelay.on_status_fire(A0_5681)
  local L1_5682
  L1_5682 = A0_5681.parent
  if not L1_5682 then
    return
  end
  if L1_5682.status == STATUS_DIE then
    A0_5681.parent = nil
  end
end
function TransmitDelay.on_update_fire(A0_5683, A1_5684, A2_5685)
  local L3_5686, L4_5687, L5_5688
  L3_5686 = A0_5683.time_tick
  L3_5686 = L3_5686 + A2_5685
  A0_5683.time_tick = L3_5686
  L3_5686 = A0_5683.time_tick
  L4_5687 = A0_5683.delay
  if L3_5686 < L4_5687 then
    return
  end
  L3_5686 = A0_5683.parent
  L4_5687 = {}
  L5_5688 = A0_5683.tid
  L4_5687.tm = L5_5688
  L5_5688 = A0_5683.tn
  L4_5687.tn = L5_5688
  L3_5686.transfer = L4_5687
  A0_5683.parent = nil
end
function TransmitDelay.on_start_fire(A0_5689)
  local L1_5690, L2_5691
  L1_5690 = A0_5689.parent
  if not L1_5690 then
    return
  end
  L2_5691 = {
    "Status",
    A0_5689,
    TransmitDelay.on_status_fire
  }
  L1_5690.on = L2_5691
  L2_5691 = {
    "Update",
    A0_5689,
    TransmitDelay.on_update_fire
  }
  L1_5690.on = L2_5691
end
function TransmitDelay.on_stop_fire(A0_5692)
  local L1_5693, L2_5694
  L1_5693 = A0_5692.parent
  if not L1_5693 then
    return
  end
  L2_5694 = {
    "Status",
    A0_5692,
    TransmitDelay.on_status_fire
  }
  L1_5693.off = L2_5694
  L2_5694 = {
    "Update",
    A0_5692,
    TransmitDelay.on_update_fire
  }
  L1_5693.off = L2_5694
end
