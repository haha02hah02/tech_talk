Class.ScenarioShow.Component({})
function ScenarioShow.Constructor(A0_5129)
  Component.Constructor(A0_5129)
end
function ScenarioShow.click_tick_get(A0_5130)
  return rawget(A0_5130, "click_tick") or 0
end
function ScenarioShow.click_tick_set(A0_5131, A1_5132, A2_5133)
  rawset(A0_5131, "click_tick", A2_5133)
end
function ScenarioShow.last_click_tick_get(A0_5134)
  return rawget(A0_5134, "last_click_tick") or 0
end
function ScenarioShow.last_click_tick_set(A0_5135, A1_5136, A2_5137)
  rawset(A0_5135, "last_click_tick", A2_5137)
end
function ScenarioShow.scenario_get(A0_5138)
  return rawget(A0_5138, "scenario")
end
function ScenarioShow.scenario_set(A0_5139, A1_5140, A2_5141)
  rawset(A0_5139, "scenario", A2_5141)
end
function ScenarioShow.scenario_index_get(A0_5142)
  return rawget(A0_5142, "scenario_index")
end
function ScenarioShow.scenario_index_set(A0_5143, A1_5144, A2_5145)
  rawset(A0_5143, "scenario_index", A2_5145)
end
function ScenarioShow.check_set(A0_5146, A1_5147, A2_5148)
  local L3_5149, L4_5150, L5_5151, L6_5152, L7_5153
  L3_5149 = Platform
  L4_5150 = Platform_Windows
  if L3_5149 == L4_5150 then
    L3_5149 = Log
    L4_5150 = A0_5146.parent
    L4_5150 = L4_5150.proxy
    L4_5150 = L4_5150.id
    L3_5149(L4_5150)
  end
  L3_5149 = A0_5146.click_tick
  A0_5146.last_click_tick = L3_5149
  L3_5149 = MillisecondOfDay
  L3_5149 = L3_5149()
  A0_5146.click_tick = L3_5149
  L3_5149 = A0_5146.click_tick
  L4_5150 = A0_5146.last_click_tick
  L3_5149 = L3_5149 - L4_5150
  if L3_5149 > 2000 then
    return
  end
  L3_5149 = A0_5146.parent
  L4_5150 = L3_5149.parent
  L4_5150 = L4_5150.parent
  L5_5151 = L3_5149.proxy
  L6_5152 = LoadConf
  L7_5153 = string
  L7_5153 = L7_5153.format
  L7_5153 = L7_5153("Npc/%d.npc", L5_5151.id)
  L6_5152 = L6_5152(L7_5153, L7_5153("Npc/%d.npc", L5_5151.id))
  L7_5153 = L6_5152.scenario
  if not L7_5153 then
    return
  end
  L4_5150.lock_focus_object = L3_5149.name
  UniqueComponent("Model/interface.model").node.npc_ui.visible = true
  L3_5149.dialog.enable = false
  A0_5146.scenario = {L7_5153}
  A0_5146.action_scenario = 1
  Sound:PlayEffect("Music/Game/NpcTalk.mp3")
end
function ScenarioShow.turn_for_session_set(A0_5154, A1_5155, A2_5156)
  local L3_5157, L4_5158, L6_5159, L7_5160, L8_5161, L9_5162, L10_5163
  L3_5157 = A0_5154.parent
  L4_5158 = L3_5157.parent
  L4_5158 = L4_5158.parent
  L6_5159 = L3_5157.proxy
  L7_5160 = L4_5158.focus_object
  L7_5160 = L4_5158[L7_5160]
  L8_5161 = L6_5159.position
  L9_5162 = L7_5160.position
  L10_5163 = L8_5161.x
  if L10_5163 == L9_5162.x then
    return
  end
  L10_5163 = L8_5161.x
  if L10_5163 > L9_5162.x then
    L10_5163 = "left"
  else
    L10_5163 = L10_5163 or "right"
  end
  L3_5157.direction = L10_5163
end
function ScenarioShow.action_scenario_set(A0_5164, A1_5165, A2_5166)
  local L4_5167, L6_5168, L7_5169
  L4_5167 = A0_5164.scenario
  A0_5164.scenario_index = A2_5166
  L6_5168 = L4_5167[A2_5166]
  if not L6_5168 then
    A0_5164.stop_scenario = true
    return
  end
  L7_5169 = A0_5164.parent
  L7_5169.dialog.show = L6_5168.context or ""
  if not L6_5168.action then
    return
  end
  if L6_5168.action == "O" or L6_5168.action == "X" then
    return
  end
  A0_5164[L6_5168.action] = L6_5168.action_arg
end
function ScenarioShow.stop_scenario_set(A0_5170, A1_5171, A2_5172)
  local L3_5173
  L3_5173 = A0_5170.parent
  L3_5173.direction = "left"
  UniqueComponent("Model/interface.model").parent.lock_focus_object = nil
  UniqueComponent("Model/interface.model").node.npc_ui.visible = false
  L3_5173.dialog.show = ""
  L3_5173.dialog.enable = true
end
function ScenarioShow.choose_set(A0_5174, A1_5175, A2_5176)
  local L4_5177, L5_5178, L6_5179
  L4_5177 = A0_5174.scenario
  L5_5178 = A0_5174.scenario_index
  L6_5179 = L4_5177[L5_5178]
  A0_5174.action_scenario = L6_5179.action ~= A2_5176 and L5_5178 + 1 or L6_5179.action_arg
end
function ScenarioShow.transmit_set(A0_5180, A1_5181, A2_5182)
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].transfer = {tm = A2_5182}
  A0_5180.stop_scenario = true
end
function ScenarioShow.shop_set(A0_5183, A1_5184, A2_5185)
  if not A2_5185 or not A2_5185.type or not A2_5185.id then
    A0_5183.stop_scenario = true
    return
  end
  UniqueComponent("Model/interface.model").ui.ishop.Shop:SetNpc(A0_5183.parent.proxy.id)
  UniqueComponent("Model/interface.model").ui.ishop.Shop:SetShop(A2_5185.type, A2_5185.id)
  UniqueComponent("Model/interface.model").ui.ishop.visible = true
  A0_5183.stop_scenario = true
end
function ScenarioShow.storage_set(A0_5186, A1_5187, A2_5188)
  UniqueComponent("Model/interface.model").ui.istorage.Storage:SetNpc(A0_5186.parent.proxy.id)
  UniqueComponent("Model/interface.model").ui.istorage.visible = true
  A0_5186.stop_scenario = true
end
function ScenarioShow.consignor_set(A0_5189, A1_5190, A2_5191)
  UniqueComponent("Model/interface.model").ui.iconsignor.Consignor:SetNpc(A0_5189.parent.proxy.id)
  UniqueComponent("Model/interface.model").ui.iconsignor.visible = true
  A0_5189.stop_scenario = true
end
function ScenarioShow.transmit_boat_set(A0_5192, A1_5193, A2_5194)
  local L3_5195, L4_5196, L5_5197, L6_5198
  if not A2_5194 then
    A0_5192.stop_scenario = true
    return
  end
  L3_5195 = A2_5194.delay
  if not L3_5195 then
    A0_5192.stop_scenario = true
    return
  end
  L3_5195 = A2_5194.id
  if not L3_5195 then
    A0_5192.stop_scenario = true
    return
  end
  L3_5195 = A2_5194.tid
  if not L3_5195 then
    A0_5192.stop_scenario = true
    return
  end
  L3_5195 = A0_5192.parent
  L4_5196 = L3_5195.parent
  L4_5196 = L4_5196.parent
  L5_5197 = L3_5195.proxy
  L6_5198 = L4_5196.physical
  L6_5198 = L6_5198[L4_5196.focus_object]
  L6_5198.transfer = {
    tm = A2_5194.id
  }
  TransmitDelay(A2_5194.delay, A2_5194.tid, A2_5194.tn).name = "transmit"
  TransmitDelay(A2_5194.delay, A2_5194.tid, A2_5194.tn).parent = L6_5198
  A0_5192.stop_scenario = true
end
function ScenarioShow.link_set(A0_5199, A1_5200, A2_5201)
  if not A2_5201 then
    return
  end
  A0_5199.action_scenario = A2_5201
end
function ScenarioShow.the_end_set(A0_5202, A1_5203, A2_5204)
  A0_5202.stop_scenario = true
end
