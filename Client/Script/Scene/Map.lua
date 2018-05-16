local L1_7296, L2_7297, L3_7298, L4_7299, L5_7300
L0_7295 = Class
L0_7295 = L0_7295.Map
L0_7295 = L0_7295.Scenario
L1_7296 = {}
L0_7295(L1_7296)
L0_7295 = Point
L1_7296 = 0
L2_7297 = 1
L0_7295 = L0_7295(L1_7296, L2_7297)
L1_7296 = Config
L1_7296 = L1_7296.ScreenWidth
L1_7296 = L1_7296 * 1.5
L2_7297 = Config
L2_7297 = L2_7297.ScreenHeight
L2_7297 = L2_7297 * 1.5
L3_7298 = 0
L4_7299 = 0
L5_7300 = {}
function Map.Constructor(A0_7301, A1_7302)
  Scenario.Constructor(A0_7301)
  if not LoadConf(string.format("Scene/%d.scene", A1_7302)) then
    return
  end
  A0_7301.id = A1_7302
  A0_7301.bgm = {
    LoadConf(string.format("Scene/%d.scene", A1_7302)).info.bgm,
    true
  }
  A0_7301.info, A0_7301.name = LoadConf(string.format("Scene/%d.scene", A1_7302)).info, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.name
  A0_7301.limit_status = LimitStatus(true, true, true, true, not LoadConf(string.format("Scene/%d.scene", A1_7302)).info.skill_limit)
  A0_7301.cant_update = true
  rawset(A0_7301, "drop_items", {})
  rawset(A0_7301, "mobs", {})
  rawset(A0_7301, "npcs", {})
  PhysicalWorld(LoadConf(string.format("Scene/%d.scene", A1_7302)).info.width, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.height, 0, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.swim and -60 or -100).name = "physical"
  PhysicalWorld(LoadConf(string.format("Scene/%d.scene", A1_7302)).info.width, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.height, 0, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.swim and -60 or -100).swim = LoadConf(string.format("Scene/%d.scene", A1_7302)).info.swim
  PhysicalWorld(LoadConf(string.format("Scene/%d.scene", A1_7302)).info.width, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.height, 0, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.swim and -60 or -100).parent = A0_7301
  Parallax().name = "back"
  Parallax().order = 0
  Parallax().parent = A0_7301
  Gameobject().name = "0"
  Gameobject().order = 1
  Gameobject().parent = A0_7301
  Gameobject().name = "1"
  Gameobject().order = 2
  Gameobject().parent = A0_7301
  Gameobject().name = "2"
  Gameobject().order = 3
  Gameobject().parent = A0_7301
  Gameobject().name = "3"
  Gameobject().order = 4
  Gameobject().parent = A0_7301
  Gameobject().name = "4"
  Gameobject().order = 5
  Gameobject().parent = A0_7301
  Gameobject().name = "5"
  Gameobject().order = 6
  Gameobject().parent = A0_7301
  Gameobject().name = "6"
  Gameobject().order = 7
  Gameobject().parent = A0_7301
  Gameobject().name = "7"
  Gameobject().order = 8
  Gameobject().parent = A0_7301
  Gameobject().name = "8"
  Gameobject().order = 9
  Gameobject().parent = A0_7301
  Parallax().name = "fback"
  Parallax().order = 10
  Parallax().parent = A0_7301
  A0_7301.move_x = 0
  A0_7301.move_y = 0
  if Config.ScreenWidth < LoadConf(string.format("Scene/%d.scene", A1_7302)).info.width then
    A0_7301.move_x = math.floor((LoadConf(string.format("Scene/%d.scene", A1_7302)).info.width - Config.ScreenWidth) / 2)
  end
  if Config.ScreenHeight < LoadConf(string.format("Scene/%d.scene", A1_7302)).info.height then
    A0_7301.move_y = math.floor((LoadConf(string.format("Scene/%d.scene", A1_7302)).info.height - Config.ScreenHeight) / 2)
  end
  A0_7301.backs = {
    LoadConf(string.format("Scene/%d.scene", A1_7302)).back
  }
  A0_7301.objects = {
    LoadConf(string.format("Scene/%d.scene", A1_7302)).object
  }
  A0_7301.tiles = {
    LoadConf(string.format("Scene/%d.scene", A1_7302)).tile
  }
  A0_7301.portals = {
    LoadConf(string.format("Scene/%d.scene", A1_7302)).portal
  }
  A0_7301.npcs = {
    LoadConf(string.format("Scene/%d.scene", A1_7302)).npc
  }
  A0_7301.mobs = {
    LoadConf(string.format("Scene/%d.scene", A1_7302)).mob
  }
  PhysicalWorld(LoadConf(string.format("Scene/%d.scene", A1_7302)).info.width, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.height, 0, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.swim and -60 or -100).footholds = {
    LoadConf(string.format("Scene/%d.scene", A1_7302)).foothold
  }
  PhysicalWorld(LoadConf(string.format("Scene/%d.scene", A1_7302)).info.width, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.height, 0, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.swim and -60 or -100).portals = {
    A0_7301.portals
  }
  PhysicalWorld(LoadConf(string.format("Scene/%d.scene", A1_7302)).info.width, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.height, 0, LoadConf(string.format("Scene/%d.scene", A1_7302)).info.swim and -60 or -100).ladders = {
    LoadConf(string.format("Scene/%d.scene", A1_7302)).ladder
  }
  A0_7301.on = {
    "Enter",
    A0_7301,
    Map.on_enter_fire
  }
  A0_7301.on = {
    "Exit",
    A0_7301,
    Map.on_exit_fire
  }
  A0_7301.on = {
    "Update",
    A0_7301,
    Map.on_update_fire
  }
end
function Map.class_get(A0_7303)
  local L1_7304
  L1_7304 = "Map"
  return L1_7304
end
function Map.rrender_get(A0_7305, A1_7306)
  local L2_7307
  L2_7307 = A0_7305.render
  if not L2_7307 then
    return
  end
  return TransitionSplitRows(1.2, L2_7307)
end
function Map.id_get(A0_7308, A1_7309)
  return rawget(A0_7308, "id")
end
function Map.id_set(A0_7310, A1_7311, A2_7312)
  rawset(A0_7310, "id", A2_7312)
end
function Map.info_get(A0_7313)
  return rawget(A0_7313, "info")
end
function Map.info_set(A0_7314, A1_7315, A2_7316)
  rawset(A0_7314, "info", A2_7316)
end
function Map.fps_get(A0_7317, A1_7318)
  return rawget(A0_7317, "fps") or 0.0
end
function Map.fps_set(A0_7319, A1_7320, A2_7321)
  rawset(A0_7319, "fps", A2_7321)
end
function Map.fps_time_get(A0_7322, A1_7323)
  return rawget(A0_7322, "fps_time") or 0.0
end
function Map.fps_time_set(A0_7324, A1_7325, A2_7326)
  return rawset(A0_7324, "fps_time", A2_7326)
end
function Map.item_index_get(A0_7327)
  local L1_7328
  L1_7328 = rawget
  L1_7328 = L1_7328(A0_7327, "drop_item_index")
  L1_7328 = L1_7328 or 0
  L1_7328 = L1_7328 + 1
  rawset(A0_7327, "drop_item_index", L1_7328)
  return L1_7328
end
function Map.limit_status_get(A0_7329)
  return rawget(A0_7329, "limit_status")
end
function Map.limit_status_set(A0_7330, A1_7331, A2_7332)
  rawset(A0_7330, "limit_status", A2_7332)
end
function Map.debug_view_get(A0_7333, A1_7334)
  return rawget(A0_7333, "debug_view")
end
function Map.debug_view_set(A0_7335, A1_7336, A2_7337)
  rawset(A0_7335, "debug_view", A2_7337)
end
function Map.debug_set(A0_7338, A1_7339, A2_7340)
  local L3_7341
  L3_7341 = A0_7338.debug_view
  if not A2_7340 and not L3_7341 then
    return
  end
  if not A2_7340 and L3_7341 then
    L3_7341:RemoveFromParent()
    return
  end
  if A2_7340 and L3_7341 then
    A0_7338["8"].render:AddChild(L3_7341)
    return
  end
  L3_7341 = Box2DView(A0_7338.physical.world, e_shapeBit | e_jointBit | e_pairBit, Config.PTMRatio)
  A0_7338.debug_view = L3_7341
  A0_7338["8"].render:AddChild(L3_7341)
end
function Map.center_x_get(A0_7342, A1_7343)
  return rawget(A0_7342, "center_x")
end
function Map.center_x_set(A0_7344, A1_7345, A2_7346)
  local L3_7347, L4_7348
  L3_7347 = Config
  L3_7347 = L3_7347.ScreenWidth
  L3_7347 = L3_7347 / 2
  L3_7347 = A2_7346 - L3_7347
  L4_7348 = 0
  if L3_7347 <= 0 then
    if -L3_7347 < A0_7344.move_x then
      L4_7348 = -L3_7347
    else
      L4_7348 = A0_7344.move_x
    end
  elseif L3_7347 < A0_7344.move_x then
    L4_7348 = -L3_7347
  else
    L4_7348 = -A0_7344.move_x
  end
  rawset(A0_7344, "center_x", L4_7348)
end
function Map.center_y_get(A0_7349, A1_7350)
  return rawget(A0_7349, "center_y")
end
function Map.center_y_set(A0_7351, A1_7352, A2_7353)
  local L3_7354, L4_7355
  L3_7354 = Config
  L3_7354 = L3_7354.ScreenHeight
  L3_7354 = L3_7354 / 2
  L3_7354 = A2_7353 - L3_7354
  L4_7355 = 0
  if L3_7354 <= 0 then
    if -L3_7354 < A0_7351.move_y then
      L4_7355 = -L3_7354
    else
      L4_7355 = A0_7351.move_y
    end
  elseif L3_7354 < A0_7351.move_y then
    L4_7355 = -L3_7354
  else
    L4_7355 = -A0_7351.move_y
  end
  rawset(A0_7351, "center_y", L4_7355)
end
function Map.center_set(A0_7356, A1_7357, A2_7358, A3_7359)
  A0_7356.center_x = A2_7358
  A0_7356.center_y = A3_7359
end
function Map.move_x_get(A0_7360, A1_7361)
  return rawget(A0_7360, "move_x")
end
function Map.move_x_set(A0_7362, A1_7363, A2_7364)
  rawset(A0_7362, "move_x", A2_7364)
end
function Map.move_y_get(A0_7365, A1_7366)
  return rawget(A0_7365, "move_y")
end
function Map.move_y_set(A0_7367, A1_7368, A2_7369)
  rawset(A0_7367, "move_y", A2_7369)
end
function Map.focus_set(A0_7370, A1_7371, A2_7372, A3_7373)
  A0_7370.center_x = A2_7372
  A0_7370.center_y = A3_7373
  L5_7300[1] = A0_7370.center_x
  L5_7300[2] = A0_7370.center_y
  A0_7370.position = L5_7300
end
function Map.focus_object_get(A0_7374, A1_7375)
  return rawget(A0_7374, "focus_object")
end
function Map.focus_object_set(A0_7376, A1_7377, A2_7378)
  rawset(A0_7376, "focus_object", A2_7378)
end
function Map.lock_focus_object_get(A0_7379)
  return rawget(A0_7379, "lock_focus_object")
end
function Map.lock_focus_object_nil_set(A0_7380)
  rawset(A0_7380, "lock_focus_object", nil)
end
function Map.lock_focus_object_set(A0_7381, A1_7382, A2_7383)
  local L3_7384, L4_7385, L5_7386, L6_7387, L7_7388, L8_7389
  L3_7384 = A0_7381.move_x
  if L3_7384 == 0 then
    L3_7384 = A0_7381.move_y
    if L3_7384 == 0 then
      return
    end
  end
  if A2_7383 == nil then
    L3_7384 = A0_7381.focus_object
    A2_7383 = L3_7384 or A2_7383
  end
  L3_7384 = A0_7381.child
  L3_7384 = L3_7384.all
  L3_7384 = L3_7384.physical
  L4_7385 = L3_7384[A2_7383]
  if not L4_7385 then
    return
  end
  L5_7386 = L4_7385.x
  A0_7381.center_x = L5_7386
  L5_7386 = L4_7385.y
  A0_7381.center_y = L5_7386
  L5_7386 = Point
  L6_7387 = A0_7381.center_x
  L7_7388 = A0_7381.center_y
  L5_7386 = L5_7386(L6_7387, L7_7388)
  L6_7387 = A0_7381.position
  L8_7389 = L5_7386
  L7_7388 = L5_7386.Distance
  L7_7388 = L7_7388(L8_7389, L6_7387)
  L7_7388 = L7_7388 / 1000
  L7_7388 = L7_7388 * 2
  L8_7389 = rawset
  L8_7389(A0_7381, "lock_focus_object", A2_7383)
  L8_7389 = A0_7381.focus_object
  if A2_7383 ~= L8_7389 then
    L8_7389 = MoveTo
    L8_7389 = L8_7389(L7_7388, L5_7386)
    A0_7381.action = L8_7389
    return
  end
  L8_7389 = Array
  L8_7389 = L8_7389()
  L8_7389:AddObject(MoveTo(L7_7388, L5_7386))
  L8_7389:AddObject(ActionInstant(Functor(A0_7381, Map.lock_focus_object_nil_set)))
  A0_7381.action = Sequence(L8_7389)
end
function Map.on_enter_fire(A0_7390, A1_7391)
  local L2_7392, L3_7393, L4_7394, L5_7395
  A0_7390.cant_update = false
  L2_7392 = UniqueComponent
  L3_7393 = "Model/interface.model"
  L2_7392 = L2_7392(L3_7393)
  if L2_7392 then
    L2_7392.parent = A0_7390
  end
  L3_7393 = A0_7390.child
  L3_7393 = L3_7393.all
  L3_7393 = L3_7393.physical
  L4_7394 = A0_7390.focus_object
  L3_7393 = L3_7393[L4_7394]
  if L3_7393 then
    L4_7394 = A0_7390.limit_status
    L3_7393.limit_status = L4_7394
  end
  L4_7394 = A0_7390.info
  L4_7394 = L4_7394.on_enter
  if not L4_7394 then
    return
  end
  L5_7395 = Global
  L5_7395 = L5_7395[string.format("map_%d", L4_7394)]
  if L5_7395 then
    L5_7395(A0_7390, A0_7390.info.on_enter_arg)
  end
end
function Map.on_exit_fire(A0_7396, A1_7397)
  local L2_7398, L3_7399, L4_7400
  L2_7398 = A0_7396.child
  L2_7398 = L2_7398.all
  L2_7398 = L2_7398.physical
  L3_7399 = A0_7396.focus_object
  L2_7398 = L2_7398[L3_7399]
  if L2_7398 then
    L3_7399 = A0_7396.limit_status
    L2_7398.unlimit_status = L3_7399
  end
  L3_7399 = A0_7396.info
  L3_7399 = L3_7399.on_exit
  if not L3_7399 then
    return
  end
  L4_7400 = Global
  L4_7400 = L4_7400[string.format("map_%d", L3_7399)]
  if L4_7400 then
    L4_7400(A0_7396, A0_7396.info.on_exit_arg)
  end
end
function Map.cant_update_get(A0_7401)
  return rawget(A0_7401, "cant_update")
end
function Map.cant_update_set(A0_7402, A1_7403, A2_7404)
  rawset(A0_7402, "cant_update", A2_7404)
end
function Map.on_update_fire(A0_7405, A1_7406, A2_7407)
  local L3_7408, L4_7409
  L3_7408 = A0_7405.cant_update
  if L3_7408 then
    return
  end
  L3_7408 = Event
  L4_7409 = L3_7408
  L3_7408 = L3_7408.Fire
  L3_7408(L4_7409, "Update", A2_7407)
  L3_7408 = A0_7405.fps
  L3_7408 = L3_7408 + 1.0
  A0_7405.fps = L3_7408
  L3_7408 = os
  L3_7408 = L3_7408.time
  L3_7408 = L3_7408()
  L4_7409 = A0_7405.fps_time
  L4_7409 = L3_7408 - L4_7409
  if L4_7409 > 5.0 then
    L4_7409 = A0_7405.fps_time
    L4_7409 = L3_7408 - L4_7409
    L4_7409 = L4_7409 / A0_7405.fps
    if L4_7409 < 0.0111 then
      Director:End()
      return
    end
    A0_7405.fps = 0.0
    A0_7405.fps_time = L3_7408
  end
  L4_7409 = A0_7405.child
  L4_7409 = L4_7409.all
  L4_7409 = L4_7409.physical
  if not L4_7409 then
    return
  end
  PhysicalWorld.update_set(L4_7409, "", A2_7407)
  if A0_7405.lock_focus_object then
    return
  end
  if not A0_7405.focus_object then
    return
  end
  if not L4_7409.child.all[A0_7405.focus_object] then
    return
  end
  Map.focus_set(A0_7405, "", L4_7409.child.all[A0_7405.focus_object].x, L4_7409.child.all[A0_7405.focus_object].y)
end
function Map.single_back_set(A0_7410, A1_7411, A2_7412, A3_7413, A4_7414, A5_7415, A6_7416)
  local L7_7417
  L7_7417 = Sprite
  L7_7417 = L7_7417()
  L7_7417:InitWithTexture(A5_7415)
  L7_7417:SetAnchorPoint(L0_7295)
  if A4_7414.f and A4_7414.f == 1 then
    L7_7417:SetRotationY(-180)
  end
  L7_7417:SetPosition(A4_7414.x + -A4_7414.origin.x, A4_7414.y + A4_7414.origin.y)
  if not A6_7416 then
    A2_7412:AddChild(L7_7417)
  end
  return L7_7417
end
function Map.htile_back_set(A0_7418, A1_7419, A2_7420, A3_7421, A4_7422, A5_7423, A6_7424)
  local L7_7425, L8_7426, L9_7427, L10_7428, L11_7429, L12_7430, L13_7431, L14_7432, L15_7433, L16_7434, L17_7435, L18_7436, L19_7437, L20_7438, L21_7439, L22_7440, L23_7441, L24_7442, L25_7443, L26_7444, L27_7445, L28_7446
  L7_7425 = A4_7422.x
  L8_7426 = A4_7422.origin
  L8_7426 = L8_7426.x
  L7_7425 = L7_7425 + L8_7426
  L8_7426 = A4_7422.y
  L9_7427 = A4_7422.origin
  L9_7427 = L9_7427.y
  L8_7426 = L8_7426 + L9_7427
  L10_7428 = A5_7423
  L9_7427 = A5_7423.ContentSize
  L9_7427 = L9_7427(L10_7428)
  L9_7427 = L9_7427.Width
  L10_7428 = A4_7422.cx
  if L10_7428 ~= 0 then
    L10_7428 = A4_7422.cx
  else
    L10_7428 = L10_7428 or L9_7427
  end
  L11_7429 = L7_7425
  while true do
    L12_7430 = A0_7418.move_x
    L12_7430 = -L12_7430
    L13_7431 = L10_7428 * 2
    L12_7430 = L12_7430 - L13_7431
    if L11_7429 > L12_7430 then
      L11_7429 = L11_7429 - L10_7428
    end
  end
  L12_7430 = 0
  L13_7431 = L11_7429
  while true do
    L14_7432 = A0_7418.move_x
    L14_7432 = L14_7432 + L15_7433
    L14_7432 = L14_7432 + L15_7433
    if L13_7431 < L14_7432 then
      L12_7430 = L12_7430 + 1
      L13_7431 = L13_7431 + L10_7428
    end
  end
  L14_7432 = A4_7422.no
  if L14_7432 == nil then
    L14_7432 = SpriteBatchNode
    L14_7432 = L14_7432(L15_7433, L16_7434)
    L13_7431 = L11_7429
    for L18_7436 = 1, L12_7430 do
      L21_7439 = L19_7437
      L20_7438 = L19_7437.SetAnchorPoint
      L22_7440 = L0_7295
      L20_7438(L21_7439, L22_7440)
      L21_7439 = L19_7437
      L20_7438 = L19_7437.InitWithTexture
      L22_7440 = A5_7423
      L20_7438(L21_7439, L22_7440)
      L21_7439 = L19_7437
      L20_7438 = L19_7437.SetPosition
      L22_7440 = L13_7431
      L20_7438(L21_7439, L22_7440, L23_7441)
      L21_7439 = L14_7432
      L20_7438 = L14_7432.AddChild
      L22_7440 = L19_7437
      L20_7438(L21_7439, L22_7440)
      L13_7431 = L13_7431 + L10_7428
      L20_7438 = A4_7422.f
      if L20_7438 == 1 then
        L21_7439 = L19_7437
        L20_7438 = L19_7437.SetRotationY
        L22_7440 = -180
        L20_7438(L21_7439, L22_7440)
      end
    end
    if not A6_7424 then
      L15_7433(L16_7434, L17_7435)
    end
    return L14_7432
  end
  L14_7432 = Node
  L14_7432 = L14_7432()
  if not L16_7434 then
    L17_7435(L18_7436)
  end
  if not L16_7434 then
    return
  end
  L13_7431 = L11_7429
  for L20_7438 = 1, L12_7430 do
    L21_7439 = nil
    L22_7440 = Array
    L22_7440 = L22_7440()
    for L26_7444, L27_7445 in L23_7441(L24_7442) do
      L28_7446 = string
      L28_7446 = L28_7446.format
      L28_7446 = L28_7446("%s/%s.%s.ntp", A4_7422.name, A4_7422.title, L27_7445.no)
      L21_7439 = L28_7446
      L28_7446 = Animate
      L28_7446 = L28_7446(L21_7439, L27_7445.origin.x, L27_7445.origin.y, L27_7445.delay / 1000.0)
      if L28_7446 ~= nil then
        L22_7440:AddObject(L28_7446)
      end
    end
    L28_7446 = L24_7442(L25_7443)
    L26_7444 = L24_7442
    L27_7445 = A5_7423
    L25_7443(L26_7444, L27_7445)
    L26_7444 = L24_7442
    L27_7445 = 100
    L25_7443(L26_7444, L27_7445)
    L26_7444 = L24_7442
    L27_7445 = L0_7295
    L25_7443(L26_7444, L27_7445)
    L26_7444 = L24_7442
    L27_7445 = L13_7431
    L28_7446 = A4_7422.origin
    L28_7446 = L28_7446.y
    L28_7446 = L8_7426 - L28_7446
    L25_7443(L26_7444, L27_7445, L28_7446)
    L26_7444 = L24_7442
    L27_7445 = L23_7441
    L25_7443(L26_7444, L27_7445)
    L26_7444 = L14_7432
    L27_7445 = L24_7442
    L25_7443(L26_7444, L27_7445)
    L13_7431 = L13_7431 + L10_7428
  end
  if L17_7435 == 1 then
    L17_7435(L18_7436, L19_7437)
  end
  if not A6_7424 then
    L17_7435(L18_7436, L19_7437)
  end
  return L14_7432
end
function Map.vtile_back_set(A0_7447, A1_7448, A2_7449, A3_7450, A4_7451, A5_7452, A6_7453)
  local L7_7454, L8_7455, L9_7456, L10_7457, L11_7458, L12_7459, L13_7460, L14_7461, L15_7462, L16_7463, L17_7464, L18_7465, L19_7466, L20_7467, L21_7468, L22_7469, L23_7470, L24_7471, L25_7472, L26_7473, L27_7474, L28_7475
  L7_7454 = A4_7451.x
  L8_7455 = A4_7451.origin
  L8_7455 = L8_7455.x
  L7_7454 = L7_7454 + L8_7455
  L8_7455 = A4_7451.y
  L9_7456 = A4_7451.origin
  L9_7456 = L9_7456.y
  L8_7455 = L8_7455 + L9_7456
  L10_7457 = A5_7452
  L9_7456 = A5_7452.ContentSize
  L9_7456 = L9_7456(L10_7457)
  L9_7456 = L9_7456.Height
  L10_7457 = A4_7451.cy
  if L10_7457 ~= 0 then
    L10_7457 = A4_7451.cy
  else
    L10_7457 = L10_7457 or L9_7456
  end
  L11_7458 = L8_7455
  while true do
    L12_7459 = A0_7447.move_y
    L13_7460 = Config
    L13_7460 = L13_7460.ScreenHeight
    L12_7459 = L12_7459 + L13_7460
    if L11_7458 < L12_7459 then
      L11_7458 = L11_7458 + L10_7457
    end
  end
  L12_7459 = 0
  L13_7460 = L11_7458
  while true do
    L14_7461 = A0_7447.move_y
    L14_7461 = -L14_7461
    L14_7461 = L14_7461 - L15_7462
    if L13_7460 > L14_7461 then
      L12_7459 = L12_7459 + 1
      L13_7460 = L13_7460 - L10_7457
    end
  end
  L14_7461 = A4_7451.no
  if L14_7461 == nil then
    L14_7461 = SpriteBatchNode
    L14_7461 = L14_7461(L15_7462, L16_7463)
    L13_7460 = L11_7458
    for L18_7465 = 1, L12_7459 do
      L20_7467 = A4_7451.f
      if L20_7467 == 1 then
        L21_7468 = L19_7466
        L20_7467 = L19_7466.SetRotationY
        L22_7469 = -180
        L20_7467(L21_7468, L22_7469)
      end
      L21_7468 = L19_7466
      L20_7467 = L19_7466.SetAnchorPoint
      L22_7469 = L0_7295
      L20_7467(L21_7468, L22_7469)
      L21_7468 = L19_7466
      L20_7467 = L19_7466.InitWithTexture
      L22_7469 = A5_7452
      L20_7467(L21_7468, L22_7469)
      L21_7468 = L19_7466
      L20_7467 = L19_7466.SetPosition
      L22_7469 = L7_7454
      L20_7467(L21_7468, L22_7469, L23_7470)
      L21_7468 = L14_7461
      L20_7467 = L14_7461.AddChild
      L22_7469 = L19_7466
      L20_7467(L21_7468, L22_7469)
      L13_7460 = L13_7460 - L10_7457
    end
    if not A6_7453 then
      L15_7462(L16_7463, L17_7464)
    end
    return L14_7461
  end
  L14_7461 = Node
  L14_7461 = L14_7461()
  L13_7460 = L11_7458
  for L20_7467 = 1, L12_7459 do
    L21_7468 = nil
    L22_7469 = Array
    L22_7469 = L22_7469()
    for L26_7473, L27_7474 in L23_7470(L24_7471) do
      L28_7475 = string
      L28_7475 = L28_7475.format
      L28_7475 = L28_7475("%s/%s.%s.ntp", A4_7451.name, A4_7451.title, L27_7474.no)
      L21_7468 = L28_7475
      L28_7475 = Animate
      L28_7475 = L28_7475(L21_7468, L27_7474.origin.x, L27_7474.origin.y, L27_7474.delay / 1000.0)
      if L28_7475 ~= nil then
        L22_7469:AddObject(L28_7475)
      end
    end
    L28_7475 = L24_7471(L25_7472)
    L26_7473 = L24_7471
    L27_7474 = A5_7452
    L25_7472(L26_7473, L27_7474)
    L26_7473 = L24_7471
    L27_7474 = 100
    L25_7472(L26_7473, L27_7474)
    L26_7473 = L24_7471
    L27_7474 = L0_7295
    L25_7472(L26_7473, L27_7474)
    L26_7473 = L24_7471
    L27_7474 = L7_7454
    L28_7475 = L13_7460
    L25_7472(L26_7473, L27_7474, L28_7475)
    L26_7473 = L24_7471
    L27_7474 = L23_7470
    L25_7472(L26_7473, L27_7474)
    L26_7473 = L14_7461
    L27_7474 = L24_7471
    L25_7472(L26_7473, L27_7474)
    L13_7460 = L13_7460 - L10_7457
  end
  if not A6_7453 then
    L17_7464(L18_7465, L19_7466)
  end
  return L14_7461
end
function Map.hvtile_back_set(A0_7476, A1_7477, A2_7478, A3_7479, A4_7480, A5_7481, A6_7482)
  local L7_7483, L8_7484, L9_7485, L10_7486, L11_7487, L12_7488, L13_7489, L14_7490, L15_7491, L16_7492, L17_7493, L18_7494, L19_7495, L20_7496, L21_7497, L22_7498, L23_7499, L24_7500, L25_7501, L26_7502, L27_7503, L28_7504, L29_7505
  L7_7483 = A4_7480.x
  L8_7484 = A4_7480.origin
  L8_7484 = L8_7484.x
  L7_7483 = L7_7483 + L8_7484
  L8_7484 = A4_7480.y
  L9_7485 = A4_7480.origin
  L9_7485 = L9_7485.y
  L8_7484 = L8_7484 + L9_7485
  L10_7486 = A5_7481
  L9_7485 = A5_7481.ContentSize
  L9_7485 = L9_7485(L10_7486)
  L10_7486 = L9_7485.Width
  L11_7487 = L9_7485.Height
  L12_7488 = A4_7480.cx
  if L12_7488 ~= 0 then
    L12_7488 = A4_7480.cx
  else
    L12_7488 = L12_7488 or L10_7486
  end
  L13_7489 = A4_7480.cy
  if L13_7489 ~= 0 then
    L13_7489 = A4_7480.cy
  else
    L13_7489 = L13_7489 or L11_7487
  end
  L14_7490, L15_7491, L16_7492, L17_7493 = nil, nil, nil, nil
  L18_7494 = A4_7480.rx
  if L18_7494 == 0 then
    L18_7494 = A4_7480.ry
    if L18_7494 == 0 then
      L18_7494 = Config
      L18_7494 = L18_7494.ScreenWidth
      L18_7494 = -L18_7494
      L18_7494 = L18_7494 / 2
      L19_7495 = A0_7476.move_x
      L19_7495 = L19_7495 * L20_7496
      L14_7490 = L18_7494 + L19_7495
      L16_7492 = 0
      L18_7494 = L14_7490
      while true do
        L19_7495 = Config
        L19_7495 = L19_7495.ScreenWidth
        L19_7495 = L19_7495 - L20_7496
        L19_7495 = L19_7495 + L10_7486
        if L18_7494 < L19_7495 then
          L16_7492 = L16_7492 + 1
          L18_7494 = L18_7494 + L10_7486
        end
      end
      L19_7495 = Config
      L15_7491 = L19_7495.ScreenHeight
      L17_7493 = 0
      L19_7495 = L15_7491
      while true do
        if L19_7495 > L20_7496 then
          L17_7493 = L17_7493 + 1
          L19_7495 = L19_7495 - L11_7487
          else
            L14_7490 = L7_7483
            while true do
              L18_7494 = A0_7476.move_x
              L18_7494 = -L18_7494
              L19_7495 = L12_7488 * 2
              L18_7494 = L18_7494 - L19_7495
              if L14_7490 > L18_7494 then
                L14_7490 = L14_7490 - L12_7488
              end
            end
            L16_7492 = 0
            L18_7494 = L14_7490
            while true do
              L19_7495 = A0_7476.move_x
              L19_7495 = L19_7495 + L20_7496
              if L18_7494 < L19_7495 then
                L16_7492 = L16_7492 + 1
                L18_7494 = L18_7494 + L12_7488
              end
            end
            L15_7491 = L8_7484
            while true do
              L19_7495 = A0_7476.move_y
              L19_7495 = L19_7495 + L20_7496
              if L15_7491 < L19_7495 then
                L15_7491 = L15_7491 + L13_7489
              end
            end
            L17_7493 = 0
            L19_7495 = L15_7491
            while true do
              if L19_7495 > L20_7496 then
                L17_7493 = L17_7493 + 1
                L19_7495 = L19_7495 - L13_7489
              end
            end
          end
        end
      end
    end
  L18_7494 = L15_7491
  L19_7495 = SpriteBatchNode
  L19_7495 = L19_7495(L20_7496, L21_7497)
  for L23_7499 = 1, L17_7493 do
    L24_7500 = L14_7490
    for L28_7504 = 1, L16_7492 do
      L29_7505 = Sprite
      L29_7505 = L29_7505()
      L29_7505:SetAnchorPoint(L0_7295)
      L29_7505:InitWithTexture(A5_7481)
      L29_7505:SetPosition(L24_7500, L18_7494)
      L19_7495:AddChild(L29_7505)
      L24_7500 = L24_7500 + L12_7488
    end
    L18_7494 = L18_7494 - L13_7489
  end
  L20_7496(L21_7497)
  if not A6_7482 then
    L20_7496(L21_7497, L22_7498)
  end
  return L19_7495
end
function Map.htile_move_back_set(A0_7506, A1_7507, A2_7508, A3_7509, A4_7510, A5_7511, A6_7512)
  local L7_7513, L8_7514, L9_7515, L10_7516, L11_7517, L12_7518, L13_7519
  L7_7513 = Map
  L7_7513 = L7_7513.htile_back_set
  L8_7514 = A0_7506
  L9_7515 = A1_7507
  L10_7516 = A2_7508
  L11_7517 = A3_7509
  L12_7518 = A4_7510
  L13_7519 = A5_7511
  L7_7513 = L7_7513(L8_7514, L9_7515, L10_7516, L11_7517, L12_7518, L13_7519, true)
  L9_7515 = A5_7511
  L8_7514 = A5_7511.ContentSize
  L8_7514 = L8_7514(L9_7515)
  L8_7514 = L8_7514.Width
  L9_7515 = A4_7510.cx
  if L9_7515 ~= 0 then
    L9_7515 = A4_7510.cx
  else
    L9_7515 = L9_7515 or L8_7514
  end
  L10_7516 = nil
  L11_7517 = A4_7510.rx
  if L11_7517 < 0 then
    L10_7516 = -L9_7515
  else
    L10_7516 = L9_7515
  end
  L11_7517 = MoveBy
  L12_7518 = math
  L12_7518 = L12_7518.abs
  L13_7519 = A4_7510.rx
  L13_7519 = L13_7519 * 5
  L12_7518 = L12_7518(L13_7519)
  L12_7518 = L9_7515 / L12_7518
  L13_7519 = Point
  L13_7519 = L13_7519(L10_7516, 0)
  L11_7517 = L11_7517(L12_7518, L13_7519, L13_7519(L10_7516, 0))
  L12_7518 = MoveTo
  L13_7519 = 0
  L12_7518 = L12_7518(L13_7519, Point(0, 0))
  L13_7519 = RepeatForever
  L13_7519 = L13_7519(Sequence(L11_7517, L12_7518))
  A2_7508:AddChild(L7_7513)
  L7_7513:RunAction(L13_7519)
end
function Map.vtile_move_back_set(A0_7520, A1_7521, A2_7522, A3_7523, A4_7524, A5_7525, A6_7526)
  local L7_7527, L8_7528, L9_7529, L10_7530, L11_7531, L12_7532, L13_7533
  L7_7527 = Map
  L7_7527 = L7_7527.vtile_back_set
  L8_7528 = A0_7520
  L9_7529 = A1_7521
  L10_7530 = A2_7522
  L11_7531 = A3_7523
  L12_7532 = A4_7524
  L13_7533 = A5_7525
  L7_7527 = L7_7527(L8_7528, L9_7529, L10_7530, L11_7531, L12_7532, L13_7533, true)
  L9_7529 = A5_7525
  L8_7528 = A5_7525.ContentSize
  L8_7528 = L8_7528(L9_7529)
  L8_7528 = L8_7528.Height
  L9_7529 = A4_7524.cy
  if L9_7529 ~= 0 then
    L9_7529 = A4_7524.cy
  else
    L9_7529 = L9_7529 or L8_7528
  end
  L10_7530 = nil
  L11_7531 = A4_7524.ry
  if L11_7531 < 0 then
    L10_7530 = -L9_7529
  else
    L10_7530 = L9_7529
  end
  L11_7531 = MoveBy
  L12_7532 = math
  L12_7532 = L12_7532.abs
  L13_7533 = A4_7524.ry
  L13_7533 = L13_7533 * 5
  L12_7532 = L12_7532(L13_7533)
  L12_7532 = L9_7529 / L12_7532
  L13_7533 = Point
  L13_7533 = L13_7533(0, L10_7530)
  L11_7531 = L11_7531(L12_7532, L13_7533, L13_7533(0, L10_7530))
  L12_7532 = MoveTo
  L13_7533 = 0
  L12_7532 = L12_7532(L13_7533, Point(0, 0))
  L13_7533 = RepeatForever
  L13_7533 = L13_7533(Sequence(L11_7531, L12_7532))
  A2_7522:AddChild(L7_7527)
  L7_7527:RunAction(L13_7533)
end
function Map.hvtile_hmove_back_set(A0_7534, A1_7535, A2_7536, A3_7537, A4_7538, A5_7539, A6_7540)
  local L7_7541, L8_7542, L9_7543, L10_7544, L11_7545, L12_7546
  L7_7541 = Map
  L7_7541 = L7_7541.hvtile_back_set
  L8_7542 = A0_7534
  L9_7543 = A1_7535
  L10_7544 = A2_7536
  L11_7545 = A3_7537
  L12_7546 = A4_7538
  L7_7541 = L7_7541(L8_7542, L9_7543, L10_7544, L11_7545, L12_7546, A5_7539, true)
  L9_7543 = A5_7539
  L8_7542 = A5_7539.ContentSize
  L8_7542 = L8_7542(L9_7543)
  L8_7542 = L8_7542.Width
  L9_7543 = nil
  L10_7544 = A4_7538.rx
  if L10_7544 < 0 then
    L9_7543 = -L8_7542
  else
    L9_7543 = L8_7542
  end
  L10_7544 = MoveBy
  L11_7545 = math
  L11_7545 = L11_7545.abs
  L12_7546 = A4_7538.rx
  L12_7546 = L12_7546 * 5
  L11_7545 = L11_7545(L12_7546)
  L11_7545 = L8_7542 / L11_7545
  L12_7546 = Point
  L12_7546 = L12_7546(L9_7543, 0)
  L10_7544 = L10_7544(L11_7545, L12_7546, L12_7546(L9_7543, 0))
  L11_7545 = MoveTo
  L12_7546 = 0
  L11_7545 = L11_7545(L12_7546, Point(0, 0))
  L12_7546 = RepeatForever
  L12_7546 = L12_7546(Sequence(L10_7544, L11_7545))
  A2_7536:AddChild(L7_7541)
  L7_7541:RunAction(L12_7546)
end
function Map.hvtile_vmove_back_set(A0_7547, A1_7548, A2_7549, A3_7550, A4_7551, A5_7552, A6_7553)
  local L7_7554, L8_7555, L9_7556, L10_7557, L11_7558, L12_7559, L13_7560
  L7_7554 = Map
  L7_7554 = L7_7554.hvtile_back_set
  L8_7555 = A0_7547
  L9_7556 = A1_7548
  L10_7557 = A2_7549
  L11_7558 = A3_7550
  L12_7559 = A4_7551
  L13_7560 = A5_7552
  L7_7554 = L7_7554(L8_7555, L9_7556, L10_7557, L11_7558, L12_7559, L13_7560, true)
  L9_7556 = A5_7552
  L8_7555 = A5_7552.ContentSize
  L8_7555 = L8_7555(L9_7556)
  L8_7555 = L8_7555.Width
  L10_7557 = A5_7552
  L9_7556 = A5_7552.ContentSize
  L9_7556 = L9_7556(L10_7557)
  L9_7556 = L9_7556.Height
  L10_7557 = nil
  L11_7558 = A4_7551.ry
  if L11_7558 < 0 then
    L10_7557 = -L9_7556
  else
    L10_7557 = L9_7556
  end
  L11_7558 = MoveBy
  L12_7559 = math
  L12_7559 = L12_7559.abs
  L13_7560 = A4_7551.ry
  L13_7560 = L13_7560 * 5
  L12_7559 = L12_7559(L13_7560)
  L12_7559 = L9_7556 / L12_7559
  L13_7560 = Point
  L13_7560 = L13_7560(0, L10_7557)
  L11_7558 = L11_7558(L12_7559, L13_7560, L13_7560(0, L10_7557))
  L12_7559 = MoveTo
  L13_7560 = 0
  L12_7559 = L12_7559(L13_7560, Point(0, 0))
  L13_7560 = RepeatForever
  L13_7560 = L13_7560(Sequence(L11_7558, L12_7559))
  A2_7549:AddChild(L7_7554)
  L7_7554:RunAction(L13_7560)
end
function Map.back_set(A0_7561, A1_7562, A2_7563, A3_7564)
  local L4_7565, L5_7566, L6_7567
  L4_7565 = nil
  L5_7566 = A3_7564.no
  if L5_7566 ~= nil then
    L5_7566 = string
    L5_7566 = L5_7566.format
    L6_7567 = "%s/%s.%s.ntp"
    L5_7566 = L5_7566(L6_7567, A3_7564.name, A3_7564.title, A3_7564.no)
    L4_7565 = L5_7566
  else
    L5_7566 = string
    L5_7566 = L5_7566.format
    L6_7567 = "%s/%s.ntp"
    L5_7566 = L5_7566(L6_7567, A3_7564.name, A3_7564.title)
    L4_7565 = L5_7566
  end
  L5_7566 = Texture2D
  L6_7567 = L4_7565
  L5_7566 = L5_7566(L6_7567)
  if L5_7566 == nil then
    return
  end
  L6_7567 = Node
  L6_7567 = L6_7567()
  if A3_7564.type == 0 then
    A0_7561.single_back = {
      L6_7567,
      L4_7565,
      A3_7564,
      L5_7566
    }
  elseif A3_7564.type == 1 then
    A0_7561.htile_back = {
      L6_7567,
      L4_7565,
      A3_7564,
      L5_7566
    }
  elseif A3_7564.type == 2 then
    A0_7561.vtile_back = {
      L6_7567,
      L4_7565,
      A3_7564,
      L5_7566
    }
  elseif A3_7564.type == 3 then
    A0_7561.hvtile_back = {
      L6_7567,
      L4_7565,
      A3_7564,
      L5_7566
    }
  elseif A3_7564.type == 4 then
    A0_7561.htile_move_back = {
      L6_7567,
      L4_7565,
      A3_7564,
      L5_7566
    }
  elseif A3_7564.type == 5 then
    A0_7561.vtile_move_back = {
      L6_7567,
      L4_7565,
      A3_7564,
      L5_7566
    }
  elseif A3_7564.type == 6 then
    A0_7561.hvtile_hmove_back = {
      L6_7567,
      L4_7565,
      A3_7564,
      L5_7566
    }
  elseif A3_7564.type == 7 then
    A0_7561.hvtile_vmove_back = {
      L6_7567,
      L4_7565,
      A3_7564,
      L5_7566
    }
  end
  A2_7563:AddChild(L6_7567, 0, Point(-A3_7564.rx / 100, A3_7564.ry / 100), Point(0, 0))
end
function Map.backs_set(A0_7568, A1_7569, A2_7570)
  local L3_7571, L4_7572, L5_7573, L6_7574, L7_7575, L8_7576
  if not A2_7570 then
    return
  end
  for L6_7574, L7_7575 in L3_7571(L4_7572) do
    L8_7576 = nil
    if L7_7575.front == 1 then
      L8_7576 = A0_7568.fback.render
    else
      L8_7576 = A0_7568.back.render
    end
    A0_7568.back = {L8_7576, L7_7575}
  end
end
function Map.object_action_set(A0_7577, A1_7578, A2_7579, A3_7580)
  local L4_7581, L5_7582, L6_7583, L7_7584, L8_7585, L9_7586, L10_7587, L11_7588, L12_7589, L13_7590
  L4_7581 = Array
  L4_7581 = L4_7581()
  L5_7582 = string
  L5_7582 = L5_7582.format
  L6_7583 = "%s/%s.ani"
  L5_7582 = L5_7582(L6_7583, L7_7584, L8_7585)
  L6_7583 = LoadCsv
  L6_7583 = L6_7583(L7_7584)
  if not L6_7583 then
    L7_7584(L8_7585)
    return
  end
  for L10_7587, L11_7588 in L7_7584(L8_7585) do
    L12_7589 = string
    L12_7589 = L12_7589.format
    L13_7590 = "%s/%s.%d.ntp"
    L12_7589 = L12_7589(L13_7590, A3_7580.name, A3_7580.title, L11_7588.no)
    L13_7590 = Animate
    L13_7590 = L13_7590(L12_7589, L11_7588.origin.x, L11_7588.origin.y, L11_7588.delay / 1000.0)
    if L13_7590 ~= nil then
      L4_7581:AddObject(L13_7590)
    end
  end
  L10_7587 = Sequence
  L11_7588 = L4_7581
  L13_7590 = L10_7587(L11_7588)
  L13_7590 = L9_7586(L10_7587, L11_7588, L12_7589, L13_7590, L10_7587(L11_7588))
  L7_7584(L8_7585, L9_7586, L10_7587, L11_7588, L12_7589, L13_7590, L9_7586(L10_7587, L11_7588, L12_7589, L13_7590, L10_7587(L11_7588)))
end
function Map.objects_set(A0_7591, A1_7592, A2_7593)
  local L3_7594, L4_7595, L5_7596, L6_7597, L7_7598, L8_7599, L9_7600, L10_7601, L11_7602, L12_7603
  if not A2_7593 then
    return
  end
  for L6_7597, L7_7598 in L3_7594(L4_7595) do
    L8_7599 = string
    L8_7599 = L8_7599.format
    L9_7600 = "%s/%s.%d.ntp"
    L10_7601 = L7_7598.name
    L11_7602 = L7_7598.title
    L12_7603 = L7_7598.no
    L8_7599 = L8_7599(L9_7600, L10_7601, L11_7602, L12_7603)
    L9_7600 = Sprite
    L10_7601 = L8_7599
    L9_7600 = L9_7600(L10_7601)
    if L9_7600 ~= nil then
      L10_7601 = tostring
      L11_7602 = L7_7598.layer
      L10_7601 = L10_7601(L11_7602)
      L10_7601 = A0_7591[L10_7601]
      L10_7601 = L10_7601.render
      L12_7603 = L9_7600
      L11_7602 = L9_7600.SetAnchorPoint
      L11_7602(L12_7603, L0_7295)
      L11_7602 = L7_7598.amount
      if L11_7602 then
        L11_7602 = L7_7598.amount
        if L11_7602 ~= 0 then
          L11_7602 = {L12_7603, L7_7598}
          L12_7603 = L9_7600
          A0_7591.object_action = L11_7602
          L12_7603 = L9_7600.SetPosition
          L12_7603(L9_7600, L7_7598.x, L7_7598.y)
        end
      else
        L11_7602 = L7_7598.f
        if L11_7602 == 1 then
          L11_7602 = L7_7598.x
          L12_7603 = L7_7598.origin
          L12_7603 = L12_7603.x
          L11_7602 = L11_7602 - L12_7603
        elseif not L11_7602 then
          L11_7602 = L7_7598.x
          L12_7603 = L7_7598.origin
          L12_7603 = L12_7603.x
          L11_7602 = L11_7602 + L12_7603
        end
        L12_7603 = L7_7598.y
        L12_7603 = L12_7603 + L7_7598.origin.y
        L9_7600:SetPosition(L11_7602, L12_7603)
      end
      L11_7602 = L7_7598.f
      if L11_7602 == 1 then
        L12_7603 = L9_7600
        L11_7602 = L9_7600.SetRotationY
        L11_7602(L12_7603, -180)
      end
      L12_7603 = L10_7601
      L11_7602 = L10_7601.AddChild
      L11_7602(L12_7603, L9_7600, L7_7598.z)
    end
  end
end
function Map.tiles_set(A0_7604, A1_7605, A2_7606)
  local L3_7607, L4_7608, L5_7609, L6_7610, L7_7611, L8_7612, L9_7613, L10_7614, L11_7615, L12_7616, L13_7617, L14_7618, L15_7619, L16_7620, L17_7621, L18_7622, L19_7623, L20_7624, L21_7625
  if not A2_7606 then
    return
  end
  L3_7607 = A0_7604.render
  if not L3_7607 then
    return
  end
  L4_7608 = {}
  L5_7609 = nil
  L6_7610 = {}
  for L10_7614, L11_7615 in L7_7611(L8_7612) do
    L12_7616 = L11_7615.layer
    L13_7617 = L6_7610[L12_7616]
    if not L13_7617 then
      L6_7610[L12_7616] = 0
    end
    L14_7618 = L13_7617 or 0
    L13_7617 = L14_7618 + 1
    L6_7610[L12_7616] = L13_7617
  end
  for L10_7614, L11_7615 in L7_7611(L8_7612) do
    L12_7616 = L11_7615.name
    L13_7617 = L11_7615.layer
    L14_7618 = string
    L14_7618 = L14_7618.format
    L15_7619 = "%s/tile.ntp"
    L16_7620 = L12_7616
    L14_7618 = L14_7618(L15_7619, L16_7620)
    L15_7619 = string
    L15_7619 = L15_7619.format
    L16_7620 = "%s/tile.ntplv"
    L17_7621 = L12_7616
    L15_7619 = L15_7619(L16_7620, L17_7621)
    L16_7620 = string
    L16_7620 = L16_7620.format
    L17_7621 = "%s.%d.ntp"
    L18_7622 = L11_7615.title
    L19_7623 = L11_7615.no
    L16_7620 = L16_7620(L17_7621, L18_7622, L19_7623)
    L17_7621 = tostring
    L18_7622 = L13_7617
    L17_7621 = L17_7621(L18_7622)
    L17_7621 = A0_7604[L17_7621]
    L17_7621 = L17_7621.render
    if L5_7609 ~= L14_7618 then
      L5_7609 = L14_7618
      L18_7622 = SpriteFrameCache
      L19_7623 = L18_7622
      L18_7622 = L18_7622.AddSpriteFramesWithFile
      L20_7624 = L15_7619
      L21_7625 = L14_7618
      L18_7622(L19_7623, L20_7624, L21_7625)
    end
    L18_7622 = L4_7608[L14_7618]
    if L18_7622 == nil then
      L19_7623 = {}
      L18_7622 = L19_7623
      L4_7608[L14_7618] = L18_7622
    end
    L19_7623 = L18_7622[L13_7617]
    if L19_7623 == nil then
      L20_7624 = SpriteBatchNode
      L21_7625 = L14_7618
      L20_7624 = L20_7624(L21_7625, L6_7610[L13_7617])
      L19_7623 = L20_7624
      L18_7622[L13_7617] = L19_7623
      L21_7625 = L17_7621
      L20_7624 = L17_7621.AddChild
      L20_7624(L21_7625, L19_7623, 1000000)
    end
    L20_7624 = Sprite
    L20_7624 = L20_7624()
    L21_7625 = L20_7624.InitWithSpriteFrameName
    L21_7625(L20_7624, L16_7620)
    L21_7625 = L20_7624.SetAnchorPoint
    L21_7625(L20_7624, L0_7295)
    L21_7625 = L20_7624.SetPosition
    L21_7625(L20_7624, L11_7615.x + L11_7615.origin.x, L11_7615.y + L11_7615.origin.y)
    L21_7625 = L11_7615.zm
    L21_7625 = L21_7625 or 0
    L21_7625 = L21_7625 << 16
    L21_7625 = L21_7625 | L11_7615.z
    L19_7623:AddChild(L20_7624, L21_7625)
  end
end
function Map.drop_points_get(A0_7626, A1_7627)
  local L2_7628
  L2_7628 = rawget
  L2_7628 = L2_7628(A0_7626, "drop_points")
  if L2_7628 then
    return L2_7628
  end
  L2_7628 = {}
  rawset(A0_7626, "drop_points", L2_7628)
  return L2_7628
end
function Map.drop_point_get(A0_7629, A1_7630)
  local L2_7631
  L2_7631 = A0_7629.drop_points
  if #L2_7631 == 0 then
    return {x = 0, y = 0}
  end
  return L2_7631[math.random(1, #L2_7631)]
end
function Map.drop_point_set(A0_7632, A1_7633, A2_7634)
  local L3_7635
  if not A2_7634 then
    return
  end
  L3_7635 = A0_7632.drop_points
  table.insert(L3_7635, A2_7634)
end
function Map.portals_get(A0_7636, A1_7637)
  return rawget(A0_7636, "portals")
end
function Map.portals_effect_set(A0_7638, A1_7639, A2_7640)
  local L3_7641, L4_7642
  if not A2_7640 then
    return
  end
  L3_7641 = A2_7640.tm
  if L3_7641 == 999999999 then
    return
  end
  L3_7641 = A2_7640.pt
  if L3_7641 ~= 2 then
    return
  end
  L3_7641 = string
  L3_7641 = L3_7641.format
  L4_7642 = "Scene/%d.scene"
  L3_7641 = L3_7641(L4_7642, A2_7640.tm)
  L4_7642 = FileUtils
  L4_7642 = L4_7642.FullPathForFilename
  L4_7642 = L4_7642(L4_7642, L3_7641)
  if not FileUtils:IsFileExist(L4_7642) then
    return
  end
  Effect("Common/Portal", true).position = {
    A2_7640.x,
    A2_7640.y
  }
  Effect("Common/Portal", true).start = true
  A0_7638["7"].render:AddChild(Effect("Common/Portal", true).render)
end
function Map.portals_set(A0_7643, A1_7644, A2_7645)
  local L3_7646, L4_7647
  if not A2_7645 then
    return
  end
  L3_7646 = A0_7643.render
  if not L3_7646 then
    return
  end
  L4_7647 = {}
  rawset(A0_7643, "portals", L4_7647)
  for _FORV_8_, _FORV_9_ in pairs(A2_7645) do
    if _FORV_9_.pn == "sp" then
      A0_7643.drop_point = _FORV_9_
    elseif _FORV_9_.pn ~= "tp" then
      L4_7647[_FORV_9_.pn] = _FORV_9_
    end
  end
  for _FORV_8_, _FORV_9_ in pairs(L4_7647) do
    A0_7643.portals_effect = _FORV_9_
  end
end
function Map.npcs_get(A0_7648)
  return rawget(A0_7648, "npcs")
end
function Map.npcs_set(A0_7649, A1_7650, A2_7651)
  local L3_7652, L4_7653, L5_7654, L6_7655, L7_7656, L8_7657, L9_7658
  L3_7652 = {}
  for L7_7656, L8_7657 in L4_7653(L5_7654) do
    L9_7658 = Npc
    L9_7658 = L9_7658(L7_7656, L8_7657.npc_id, L8_7657.x, L8_7657.y)
    if L9_7658 then
      L9_7658.parent = A0_7649.physical
      table.insert(L3_7652, L9_7658)
    end
  end
  L7_7656 = L3_7652
  L4_7653(L5_7654, L6_7655, L7_7656)
end
function Map.mob_set(A0_7659, A1_7660, A2_7661)
  local L3_7662
  if not A2_7661 then
    return
  end
  L3_7662 = A0_7659.mobs
  if not L3_7662 then
    L3_7662 = {}
    rawset(A0_7659, "mobs", L3_7662)
  end
  A2_7661.parent = A0_7659.physical
  if A2_7661.type == WORLD_TYPE_MOB then
    table.insert(L3_7662, A2_7661)
  end
end
function Map.mob_remove_set(A0_7663, A1_7664, A2_7665)
  local L3_7666, L4_7667, L5_7668, L6_7669, L7_7670
  if not A2_7665 then
    return
  end
  L3_7666 = A0_7663.mobs
  if not L3_7666 then
    return
  end
  for L7_7670, _FORV_8_ in L4_7667(L5_7668) do
    if _FORV_8_ == A2_7665 then
      table.remove(L3_7666, L7_7670)
      A2_7665.parent = nil
      return
    end
  end
end
function Map.mobs_get(A0_7671)
  return rawget(A0_7671, "mobs")
end
function Map.mobs_set(A0_7672, A1_7673, A2_7674)
  local L3_7675, L4_7676, L5_7677, L6_7678
  for L6_7678, _FORV_7_ in L3_7675(L4_7676) do
    A0_7672.mob = Mob(string.format("mob_%d", L6_7678), _FORV_7_.mob_id, _FORV_7_.x, _FORV_7_.y)
  end
end
function Map.mobs_clean_set(A0_7679, A1_7680, A2_7681)
  local L3_7682
  L3_7682 = A0_7679.mobs
  if not L3_7682 then
    return
  end
  for _FORV_7_, _FORV_8_ in ipairs(L3_7682) do
    _FORV_8_.parent = nil
  end
  rawset(A0_7679, "mobs", {})
end
function Map.drop_items_get(A0_7683, A1_7684)
  return rawget(A0_7683, "drop_items")
end
function Map.drop_item_set(A0_7685, A1_7686, A2_7687)
  local L3_7688
  L3_7688 = A0_7685.drop_items
  if not L3_7688 then
    L3_7688 = {}
    rawset(A0_7685, "drop_items", L3_7688)
  end
  if A2_7687 then
    table.insert(L3_7688, A2_7687)
  end
end
function Map.drop_item_remove_set(A0_7689, A1_7690, A2_7691)
  local L3_7692, L4_7693, L5_7694, L6_7695, L7_7696
  if not A2_7691 then
    return
  end
  L3_7692 = A0_7689.drop_items
  if not L3_7692 then
    return
  end
  for L7_7696, _FORV_8_ in L4_7693(L5_7694) do
    if _FORV_8_ == A2_7691 then
      _FORV_8_.parent = nil
      table.remove(L3_7692, L7_7696)
      return
    end
  end
end
function Map.drop_items_clean_set(A0_7697, A1_7698, A2_7699)
  local L3_7700
  L3_7700 = A0_7697.drop_items
  if not L3_7700 then
    return
  end
  for _FORV_7_, _FORV_8_ in ipairs(L3_7700) do
    _FORV_8_.parent = nil
  end
  rawset(A0_7697, "drop_items", L3_7700)
end
function Map.search_args_get(A0_7701)
  return rawget(A0_7701, "search_args")
end
function Map.search_args_set(A0_7702, A1_7703, A2_7704, A3_7705, A4_7706, A5_7707, A6_7708, A7_7709, A8_7710)
  local L9_7711
  L9_7711 = {}
  L9_7711.x1 = A2_7704
  L9_7711.x2 = A3_7705
  L9_7711.y1 = A4_7706
  L9_7711.y2 = A5_7707
  L9_7711.type = A6_7708
  L9_7711.amount = A7_7709
  L9_7711.direction = A8_7710
  rawset(A0_7702, "search_args", L9_7711)
end
function Map.serach_npc_get(A0_7712)
  local L1_7713, L2_7714, L3_7715, L4_7716, L5_7717, L6_7718, L7_7719
  L1_7713 = A0_7712.search_args
  if not L1_7713 then
    return
  end
  L2_7714 = A0_7712.npcs
  if not L2_7714 then
    return
  end
  for L6_7718, L7_7719 in L3_7715(L4_7716) do
    if IsSessionCatched(L1_7713, L7_7719) then
      return L7_7719
    end
  end
end
function Map.search_one_get(A0_7720)
  local L1_7721, L2_7722, L3_7723, L4_7724, L5_7725, L6_7726, L7_7727, L8_7728, L9_7729
  L1_7721 = A0_7720.search_args
  if not L1_7721 then
    return
  end
  L2_7722 = L1_7721.type
  if not L2_7722 then
    return
  end
  L2_7722 = L1_7721.type
  if L2_7722 == 0 then
    return
  end
  L2_7722 = L1_7721.type
  L3_7723 = L1_7721.amount
  L3_7723 = L3_7723 or 1
  if L3_7723 ~= 1 then
    return
  end
  if L4_7724 ~= 0 then
    for L7_7727, L8_7728 in L4_7724(L5_7725) do
      if L9_7729 then
        return L8_7728
      end
    end
  end
  if L4_7724 ~= 0 then
    for L7_7727, L8_7728 in L4_7724(L5_7725) do
      if L9_7729 ~= STATUS_DIE then
        if L9_7729 then
          return L8_7728
        end
      end
    end
  end
  if L5_7725 ~= 0 then
    if L5_7725 then
    else
    end
    if L6_7726 then
      L7_7727(L8_7728, L9_7729)
    end
  end
  if L5_7725 ~= 0 then
    for L8_7728, L9_7729 in L5_7725(L6_7726) do
      if L9_7729.catchable and IsSessionCatched(L1_7721, L9_7729) then
        table.insert(L4_7724, L9_7729)
      end
    end
  end
  if L5_7725 == 0 then
    return
  end
  if L6_7726 then
  else
  end
  if L6_7726 == "left" then
    for _FORV_10_, _FORV_11_ in L7_7727(L8_7728) do
    end
    return L5_7725
  end
  for _FORV_10_, _FORV_11_ in L7_7727(L8_7728) do
  end
  return L5_7725
end
function Map.search_get(A0_7730)
  local L1_7731, L2_7732, L3_7733, L4_7734, L5_7735, L6_7736, L7_7737, L8_7738, L9_7739
  L1_7731 = A0_7730.search_args
  if not L1_7731 then
    return
  end
  L2_7732 = L1_7731.type
  if not L2_7732 then
    return
  end
  L2_7732 = L1_7731.type
  if L2_7732 == 0 then
    return
  end
  L2_7732 = L1_7731.type
  L3_7733 = L1_7731.amount
  L3_7733 = L3_7733 or 1
  if L3_7733 == 1 then
    L4_7734 = A0_7730.search_one
    return L4_7734
  end
  L4_7734 = {}
  if L5_7735 ~= 0 then
    if L5_7735 then
      if L6_7736 then
        L8_7738 = L5_7735
        if L6_7736 then
          L8_7738 = L5_7735
          L6_7736(L7_7737, L8_7738)
        end
      end
    end
  end
  if L5_7735 ~= 0 then
    for L8_7738, L9_7739 in L5_7735(L6_7736) do
      if L3_7733 <= #L4_7734 then
        return L4_7734
      end
      if L9_7739.catchable and IsSessionCatched(L1_7731, L9_7739) then
        table.insert(L4_7734, L9_7739)
      end
    end
  end
  if L5_7735 ~= 0 then
    for L8_7738, L9_7739 in L5_7735(L6_7736) do
      if L3_7733 <= #L4_7734 then
        return L4_7734
      end
      if L9_7739.catchable and IsSessionCatched(L1_7731, L9_7739) then
        table.insert(L4_7734, L9_7739)
      end
    end
  end
  if L5_7735 ~= 0 then
    for L8_7738, L9_7739 in L5_7735(L6_7736) do
      if L3_7733 <= #L4_7734 then
        return L4_7734
      end
      if IsSessionCatched(L1_7731, L9_7739) then
        table.insert(L4_7734, L9_7739)
      end
    end
  end
  return L4_7734
end
