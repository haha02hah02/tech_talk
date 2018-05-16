Class.ResultHandle.Component({})
function ResultHandle.Constructor(A0_5092, A1_5093, A2_5094)
  Component.Constructor(A0_5092)
  A0_5092.name = "result_handle"
  A0_5092.on = {
    "Parent",
    A0_5092,
    ResultHandle.on_parent_fire
  }
  A0_5092.parent = A1_5093
end
function ResultHandle.class_get(A0_5095)
  local L1_5096
  L1_5096 = "ResultHandle"
  return L1_5096
end
function ResultHandle.death_time_get(A0_5097)
  return rawget(A0_5097, "death_time") or 0
end
function ResultHandle.death_time_set(A0_5098, A1_5099, A2_5100)
  rawset(A0_5098, "death_time", A2_5100)
end
function ResultHandle.on_status_set(A0_5101)
  local L1_5102, L2_5103, L3_5104, L4_5105, L5_5106, L6_5107, L7_5108, L8_5109, L9_5110, L10_5111, L11_5112, L12_5113, L13_5114, L14_5115, L15_5116, L16_5117, L17_5118, L18_5119, L19_5120
  L1_5102 = A0_5101.parent
  if not L1_5102 then
    return
  end
  L2_5103 = L1_5102.status
  L3_5104 = STATUS_DIE
  if L2_5103 ~= L3_5104 then
    return
  end
  A0_5101.death_time = 0
  L2_5103 = LoadConf
  L3_5104 = string
  L3_5104 = L3_5104.format
  L4_5105 = "Mob/%d.mob"
  L5_5106 = L1_5102.proxy
  L5_5106 = L5_5106.id
  L19_5120 = L3_5104(L4_5105, L5_5106)
  L2_5103 = L2_5103(L3_5104, L4_5105, L5_5106, L6_5107, L7_5108, L8_5109, L9_5110, L10_5111, L11_5112, L12_5113, L13_5114, L14_5115, L15_5116, L16_5117, L17_5118, L18_5119, L19_5120, L3_5104(L4_5105, L5_5106))
  if not L2_5103 then
    return
  end
  L3_5104 = L2_5103.info
  L4_5105 = L2_5103.drop
  L5_5106 = UniqueComponent
  L6_5107 = "Model/interface.model"
  L5_5106 = L5_5106(L6_5107)
  L6_5107 = L5_5106.parent
  if not L6_5107 then
    return
  end
  L7_5108 = L6_5107.physical
  L8_5109 = L6_5107.focus_object
  L7_5108 = L7_5108[L8_5109]
  if not L7_5108 then
    return
  end
  L8_5109 = L1_5102.x
  L9_5110 = L1_5102.y
  L10_5111 = L3_5104.exp
  L10_5111 = L10_5111 or 0
  L11_5112 = Config
  L11_5112 = L11_5112.SystemExpMultiple
  L12_5113 = Config
  L12_5113 = L12_5113.ExpMultiple
  L11_5112 = L11_5112 + L12_5113
  L12_5113 = Config
  L12_5113 = L12_5113.ExtraExpMultiple
  L11_5112 = L11_5112 + L12_5113
  L12_5113 = L7_5108.data
  L13_5114 = math
  L13_5114 = L13_5114.floor
  L13_5114 = L13_5114(L14_5115)
  L12_5113.inc_exp = L13_5114
  if L4_5105 then
    L12_5113 = #L4_5105
  elseif L12_5113 == 0 then
    return
  end
  L12_5113 = {}
  L13_5114 = Config
  L13_5114 = L13_5114.SystemDropMultiple
  L13_5114 = L13_5114 + L14_5115
  L13_5114 = L13_5114 + L14_5115
  for L17_5118, L18_5119 in L14_5115(L15_5116) do
    L19_5120 = math
    L19_5120 = L19_5120.random
    L19_5120 = L19_5120(1, 10000)
    if L19_5120 <= L18_5119.p + L18_5119.p * L13_5114 then
      table.insert(L12_5113, L18_5119.item_id)
    end
  end
  if L14_5115 == 0 then
    return
  end
  if L14_5115 ~= 0 then
  else
  end
  L15_5116(L16_5117, L17_5118)
  for L18_5119, L19_5120 in L15_5116(L16_5117) do
    DropItem(L6_5107.item_index, L19_5120, 1, L8_5109, L9_5110).data.map = L6_5107.id
    DropItem(L6_5107.item_index, L19_5120, 1, L8_5109, L9_5110).data.mob = L2_5103.id
    DropItem(L6_5107.item_index, L19_5120, 1, L8_5109, L9_5110).parent = L6_5107.physical
    L6_5107.drop_item, DropItem(L6_5107.item_index, L19_5120, 1, L8_5109, L9_5110).impulse = DropItem(L6_5107.item_index, L19_5120, 1, L8_5109, L9_5110), {L14_5115, 26}
    ItemHandle().parent, ItemHandle().name = DropItem(L6_5107.item_index, L19_5120, 1, L8_5109, L9_5110), "item_handle"
  end
end
function ResultHandle.on_update_fire(A0_5121, A1_5122, A2_5123)
  local L3_5124, L4_5125
  L3_5124 = A1_5122.status
  L4_5125 = STATUS_DIE
  if L3_5124 ~= L4_5125 then
    return
  end
  L3_5124 = A0_5121.death_time
  L3_5124 = L3_5124 + A2_5123
  A0_5121.death_time = L3_5124
  L4_5125 = A1_5122.proxy
  L4_5125 = L4_5125.death_delay
  if L3_5124 < L4_5125 then
    return
  end
  L4_5125 = {
    "Update",
    A0_5121,
    ResultHandle.on_update_fire
  }
  A1_5122.off = L4_5125
  L4_5125 = A1_5122.parent
  L4_5125 = L4_5125.parent
  if not A1_5122.reborn then
  else
  end
  L4_5125.mob_remove = A1_5122 or nil
end
function ResultHandle.on_parent_fire(A0_5126)
  local L1_5127, L2_5128
  L1_5127 = A0_5126.parent
  if not L1_5127 then
    return
  end
  L2_5128 = {
    "Status",
    A0_5126,
    ResultHandle.on_status_set
  }
  L1_5127.on = L2_5128
  L2_5128 = L1_5127.child
  L2_5128 = L2_5128.all
  L2_5128 = L2_5128.reborn
  if L2_5128 then
    return
  end
  L2_5128 = {
    "Update",
    A0_5126,
    ResultHandle.on_update_fire
  }
  L1_5127.on = L2_5128
end
