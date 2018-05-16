local L1_4339, L2_4340, L3_4341, L4_4342
L0_4338 = Class
L0_4338 = L0_4338.DialogShow
L0_4338 = L0_4338.Component
L1_4339 = {}
L0_4338(L1_4339)
L0_4338 = Point
L1_4339 = 0
L2_4340 = 0
L0_4338 = L0_4338(L1_4339, L2_4340)
L1_4339 = Config
L1_4339 = L1_4339.ScreenWidth
L1_4339 = L1_4339 / 2
L2_4340 = Config
L2_4340 = L2_4340.ScreenHeight
L2_4340 = L2_4340 / 2
L3_4341 = Config
L3_4341 = L3_4341.ScreenWidth
L4_4342 = Config
L4_4342 = L4_4342.ScreenHeight
function DialogShow.Constructor(A0_4343)
  Component.Constructor(A0_4343)
  Dialog().name = "dialog"
  A0_4343.dialog, Dialog().color = Dialog(), 1493501184
  A0_4343.wait_time = math.random(1, 5)
  A0_4343.enable = true
  A0_4343.on = {
    "Start",
    A0_4343,
    DialogShow.on_start_fire
  }
  A0_4343.on = {
    "Stop",
    A0_4343,
    DialogShow.on_stop_fire
  }
end
function DialogShow.wait_time_get(A0_4344)
  return rawget(A0_4344, "wait_time")
end
function DialogShow.wait_time_set(A0_4345, A1_4346, A2_4347)
  rawset(A0_4345, "wait_time", A2_4347)
end
function DialogShow.dialog_get(A0_4348)
  return rawget(A0_4348, "dialog")
end
function DialogShow.dialog_set(A0_4349, A1_4350, A2_4351)
  rawset(A0_4349, "dialog", A2_4351)
end
function DialogShow.dialog_action_get(A0_4352)
  local L1_4353
  L1_4353 = Array
  L1_4353 = L1_4353()
  L1_4353:AddObject(Show())
  L1_4353:AddObject(DelayTime(6.0))
  L1_4353:AddObject(Hide())
  return Sequence(L1_4353)
end
function DialogShow.enable_get(A0_4354)
  return rawget(A0_4354, "enable")
end
function DialogShow.enable_set(A0_4355, A1_4356, A2_4357)
  rawset(A0_4355, "enable", A2_4357)
end
function DialogShow.show_set(A0_4358, A1_4359, A2_4360)
  local L3_4361, L4_4362, L5_4363, L6_4364
  L3_4361 = A0_4358.dialog
  L4_4362 = A0_4358.parent
  L5_4363 = L4_4362.parent
  L5_4363 = L5_4363.parent
  L6_4364 = L4_4362.proxy
  if A2_4360 and A2_4360 ~= "" then
    L3_4361.text = A2_4360
  end
  L3_4361.visible = A2_4360 and A2_4360 ~= "" or false
  L3_4361.name = string.format("%d_dialog", L6_4364.id)
  L3_4361.x = L6_4364.x
  L3_4361.y = L6_4364.y + LoadConf(string.format("Npc/%d.npc", L6_4364.id)).info.height / 2 + L3_4361.height / 2 + 10
  L3_4361.parent = L5_4363["8"]
  L3_4361.unactions = true
end
function DialogShow.hide_set(A0_4365, A1_4366, A2_4367)
  A0_4365.dialog.visible = false
end
function DialogShow.on_update_fire(A0_4368, A1_4369, A2_4370)
  local L3_4371, L4_4372, L5_4373, L6_4374
  L3_4371 = A0_4368.enable
  if not L3_4371 then
    return
  end
  L3_4371 = A0_4368.parent
  L4_4372 = L3_4371.parent
  L4_4372 = L4_4372.parent
  L5_4373 = L3_4371.proxy
  L6_4374 = LoadConf
  L6_4374 = L6_4374(string.format("Npc/%d.npc", L5_4373.id))
  if L3_4371.status ~= STATUS_STAND or not L6_4374.dialog then
    return
  end
  if L5_4373.render:ConvertToWorldSpace(L0_4338).x < 0 and L5_4373.render:ConvertToWorldSpace(L0_4338).x < -L1_4339 then
    return
  end
  if L5_4373.render:ConvertToWorldSpace(L0_4338).x > 0 and L5_4373.render:ConvertToWorldSpace(L0_4338).x > L3_4341 + L1_4339 then
    return
  end
  if L5_4373.render:ConvertToWorldSpace(L0_4338).y < 0 and L5_4373.render:ConvertToWorldSpace(L0_4338).y < -L2_4340 then
    return
  end
  if L5_4373.render:ConvertToWorldSpace(L0_4338).y > 0 and L5_4373.render:ConvertToWorldSpace(L0_4338).y > L4_4342 + L2_4340 then
    return
  end
  A0_4368.wait_time = A0_4368.wait_time - A2_4370
  if A0_4368.wait_time - A2_4370 > 0.0 then
    return
  end
  A0_4368.wait_time = 12.0 + (A0_4368.wait_time - A2_4370)
  A0_4368.dialog.text = L6_4374.dialog[math.random(1, #L6_4374.dialog)]
  A0_4368.dialog.name = string.format("%d_dialog", L5_4373.id)
  A0_4368.dialog.x = L5_4373.x
  A0_4368.dialog.y = L5_4373.y + L6_4374.info.height / 2 + A0_4368.dialog.height / 2 + 10
  A0_4368.dialog.parent = L4_4372["8"]
  A0_4368.dialog.unactions = true
  A0_4368.dialog.action = A0_4368.dialog_action
end
function DialogShow.on_start_fire(A0_4375)
  local L1_4376
  L1_4376 = A0_4375.parent
  if not L1_4376 then
    return
  end
  L1_4376.on = {
    "Update",
    A0_4375,
    DialogShow.on_update_fire
  }
end
function DialogShow.on_stop_fire(A0_4377)
  local L1_4378
  L1_4378 = A0_4377.parent
  if not L1_4378 then
    return
  end
  L1_4378.off = {
    "Update",
    A0_4377,
    DialogShow.on_update_fire
  }
end
