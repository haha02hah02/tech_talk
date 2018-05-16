Class.Interface.Script({})
function Interface.Constructor(A0_6399, A1_6400)
  Script.Constructor(A0_6399, A1_6400)
  A1_6400.on = {
    "Start",
    A0_6399,
    A0_6399.OnStart
  }
  A1_6400.bgm.on = {
    "Checked",
    A0_6399,
    A0_6399.OnBGMChecked
  }
  A1_6400.bgm.on = {
    "Unchecked",
    A0_6399,
    A0_6399.OnBGMChecked
  }
  A1_6400.music.on = {
    "Checked",
    A0_6399,
    A0_6399.OnMusicChecked
  }
  A1_6400.music.on = {
    "Unchecked",
    A0_6399,
    A0_6399.OnMusicChecked
  }
  A1_6400.power.on = {
    "Up",
    A0_6399,
    A0_6399.OnPowerDown
  }
  A1_6400.jump.on = {
    "Down",
    A0_6399,
    A0_6399.OnJumpDown
  }
  A1_6400.attack.on = {
    "Down",
    A0_6399,
    A0_6399.OnAttackDown
  }
  A1_6400.setting.on = {
    "Down",
    A0_6399,
    A0_6399.OnSettingDown
  }
  A1_6400.setting_limit.on = {
    "Down",
    A0_6399,
    A0_6399.OnSettingLimitDown
  }
  A1_6400.gm_cmd.on = {
    "End",
    A0_6399,
    A0_6399.OnGameMasterCMD
  }
  A1_6400.cash_shop.on = {
    "Down",
    A0_6399,
    A0_6399.OnCashShopDown
  }
  A1_6400.search.on = {
    "Down",
    A0_6399,
    A0_6399.OnSearchDown
  }
  A1_6400.npc_ui.on = {
    "Down",
    A0_6399,
    A0_6399.OnNPCUIDown
  }
  A1_6400.consume_1.on = {
    "Down",
    A0_6399,
    A0_6399.OnConsumeDown
  }
  A1_6400.consume_2.on = {
    "Down",
    A0_6399,
    A0_6399.OnConsumeDown
  }
  A1_6400.consume_3.on = {
    "Down",
    A0_6399,
    A0_6399.OnConsumeDown
  }
  A1_6400.skill_1.on = {
    "Down",
    A0_6399,
    A0_6399.OnSkillDown
  }
  A1_6400.skill_2.on = {
    "Down",
    A0_6399,
    A0_6399.OnSkillDown
  }
  A1_6400.skill_3.on = {
    "Down",
    A0_6399,
    A0_6399.OnSkillDown
  }
  A1_6400.skill_4.on = {
    "Down",
    A0_6399,
    A0_6399.OnSkillDown
  }
  A1_6400.skill_5.on = {
    "Down",
    A0_6399,
    A0_6399.OnSkillDown
  }
  A1_6400.search.x = Config.ScreenWidth / 2
  A1_6400.search.y = Config.ScreenHeight / 2
  A1_6400.npc_ui.x = Config.ScreenWidth / 2
  A1_6400.npc_ui.y = Config.ScreenHeight / 2
  A1_6400.setting_limit.x = Config.ScreenWidth / 2
  A1_6400.setting_limit.y = Config.ScreenHeight / 2
  A1_6400.parent.on = {
    "Parent",
    A0_6399,
    Interface.on_parent_set
  }
  A1_6400.parent.on = {
    "BeforeParent",
    A0_6399,
    Interface.on_before_parent_set
  }
  Event:On("Update", A0_6399, A0_6399.OnInterfaceUpdate)
  if not Localhost:One("name = 'sound'") then
    return
  end
  A1_6400.bgm.unchecked = Localhost:One("name = 'sound'").bgm == nil and true or Localhost:One("name = 'sound'").bgm
  A1_6400.music.unchecked = Localhost:One("name = 'sound'").effect == nil and true or Localhost:One("name = 'sound'").effect
end
function Interface.SetNotice(A0_6401, A1_6402, ...)
  local L3_6404, L4_6405, L5_6406
  L2_6403 = LoadConf
  L3_6404 = "Config/Notice.conf"
  L2_6403 = L2_6403(L3_6404)
  if not L2_6403 then
    return
  end
  L3_6404 = L2_6403[A1_6402]
  if not L3_6404 then
    return
  end
  L4_6405 = string
  L4_6405 = L4_6405.format
  L5_6406 = L3_6404
  L4_6405 = L4_6405(L5_6406, ...)
  L5_6406 = Array
  L5_6406 = L5_6406()
  L5_6406:AddObject(Show())
  L5_6406:AddObject(OpacityTo(0, 255))
  L5_6406:AddObject(ActionME("Music/UI/Invite.mp3"))
  L5_6406:AddObject(DelayTime(2.0))
  L5_6406:AddObject(OpacityTo(2.0, 0))
  L5_6406:AddObject(Hide())
  A0_6401:Parent().notice.text = L4_6405
  A0_6401:Parent().notice.unactions = true
  A0_6401:Parent().notice.action = Sequence(L5_6406)
end
function Interface.SetJobSkillByConf(A0_6407, A1_6408)
  A0_6407:Parent().skill_1.id = nil
  A0_6407:Parent().skill_2.id = nil
  A0_6407:Parent().skill_3.id = nil
  A0_6407:Parent().skill_4.id = nil
  A0_6407:Parent().skill_5.id = nil
  for _FORV_6_, _FORV_7_ in pairs(A1_6408) do
    A0_6407:Parent()[_FORV_7_].tag = _FORV_6_
    A0_6407:Parent()[_FORV_7_].id = _FORV_6_
  end
end
function Interface.SetJobSkill(A0_6409, A1_6410)
  local L2_6411, L3_6412
  A0_6409.job_id = A1_6410
  L2_6411 = LoadConf
  L3_6412 = "Config/SkillSet.conf"
  L2_6411 = L2_6411(L3_6412)
  L3_6412 = L2_6411[A1_6410]
  if not L3_6412 then
    return
  end
  A0_6409:SetJobSkillByConf(L3_6412)
end
function Interface.OnStart(A0_6413, A1_6414)
  A1_6414.gm_cmd.visible = Account:One() and Account:One().gm or false
end
function Interface.OnBGMChecked(A0_6415, A1_6416)
  local L2_6417
  L2_6417 = Localhost
  L2_6417 = L2_6417.One
  L2_6417 = L2_6417(L2_6417, "name = 'sound'")
  L2_6417 = L2_6417 or Localhost()
  L2_6417.name = "sound"
  L2_6417.bgm = A1_6416.checked
  Localhost:Save(true)
  Sound:SetBackgroundEnable(A1_6416.checked)
end
function Interface.OnMusicChecked(A0_6418, A1_6419)
  local L2_6420
  L2_6420 = Localhost
  L2_6420 = L2_6420.One
  L2_6420 = L2_6420(L2_6420, "name = 'sound'")
  L2_6420 = L2_6420 or Localhost()
  L2_6420.name = "sound"
  L2_6420.effect = A1_6419.checked
  Localhost:Save(true)
  Sound:SetEffectEnable(A1_6419.checked)
end
function Interface.OnJumpDown(A0_6421)
  Event:Fire("joystick", "jump")
end
function Interface.OnAttackDown(A0_6422, A1_6423)
  Event:Fire("joystick", "attack", A1_6423.tag)
end
function Interface.OnInterfaceUpdate(A0_6424, A1_6425)
  A0_6424:Parent().skill_1.update = A1_6425
  A0_6424:Parent().skill_2.update = A1_6425
  A0_6424:Parent().skill_3.update = A1_6425
  A0_6424:Parent().skill_4.update = A1_6425
  A0_6424:Parent().skill_5.update = A1_6425
  if not A0_6424:Parent().attack.selected then
    return
  end
  Event:Fire("joystick", "attack", A0_6424:Parent().attack.tag)
end
function Interface.OnPowerDown(A0_6426)
  local L1_6427
  L1_6427 = SceneCache
  L1_6427 = L1_6427.World
  L1_6427 = L1_6427(L1_6427)
  L1_6427.y = -600
  L1_6427.users.Users:Refresh()
  World:Launch(L1_6427)
end
function Interface.OnSettingDown(A0_6428)
  if not A0_6428:Parent() then
    return
  end
  A0_6428:Parent().gift.visible = true
  A0_6428:Parent().bgm.visible = true
  A0_6428:Parent().bgm.visible = true
  A0_6428:Parent().music.visible = true
  A0_6428:Parent().power.visible = true
  A0_6428:Parent().setting_limit.visible = true
  A0_6428:Parent().consume_1.visible = false
  A0_6428:Parent().consume_2.visible = false
  A0_6428:Parent().consume_3.visible = false
  Sound:PlayEffect("Music/UI/DlgNotice.mp3")
end
function Interface.OnSettingLimitDown(A0_6429)
  if not A0_6429:Parent() then
    return
  end
  A0_6429:Parent().gift.visible = false
  A0_6429:Parent().bgm.visible = false
  A0_6429:Parent().bgm.visible = false
  A0_6429:Parent().music.visible = false
  A0_6429:Parent().power.visible = false
  A0_6429:Parent().setting_limit.visible = false
  A0_6429:Parent().consume_1.visible = true
  A0_6429:Parent().consume_2.visible = true
  A0_6429:Parent().consume_3.visible = true
end
function Interface.OnCashShopDown(A0_6430, A1_6431)
  local L2_6432, L3_6433, L4_6434, L5_6435
  L2_6432 = UniqueComponent
  L3_6433 = "Model/interface.model"
  L2_6432 = L2_6432(L3_6433)
  L3_6433 = L2_6432.parent
  if L3_6433 then
    L4_6434 = L3_6433.info
    L4_6434 = L4_6434.force_map
  elseif L4_6434 then
    return
  end
  L4_6434 = L3_6433.physical
  L5_6435 = L3_6433.focus_object
  L4_6434 = L4_6434[L5_6435]
  if not L4_6434 then
    return
  end
  L5_6435 = UniqueComponent
  L5_6435 = L5_6435("Model/cashshop.model")
  L5_6435.tag = L3_6433.id
  World:Launch(L5_6435)
end
function Interface.CreateDropSQLObject(A0_6436, A1_6437, A2_6438, A3_6439, A4_6440)
  Items().belong = A0_6436
  Items().item_id = A1_6437
  Items().level = 0
  Items().slevel = 0
  Items().amount = A2_6438
  Items().provenance = "drop"
  Items().comment = A4_6440
  Items().tradable = A3_6439
  return (Items())
end
function Interface.OnSearchDown(A0_6441, A1_6442)
  local L2_6443, L3_6444, L4_6445, L5_6446, L6_6447, L7_6448, L8_6449, L9_6450, L10_6451, L11_6452, L12_6453, L13_6454, L14_6455, L15_6456, L16_6457, L17_6458, L18_6459
  L2_6443 = UniqueComponent
  L3_6444 = "Model/interface.model"
  L2_6443 = L2_6443(L3_6444)
  L3_6444 = L2_6443.parent
  if not L3_6444 then
    return
  end
  L4_6445 = L3_6444.physical
  L5_6446 = L3_6444.focus_object
  L4_6445 = L4_6445[L5_6446]
  L5_6446 = A1_6442.touch_point
  L6_6447 = L3_6444.position
  L7_6448 = L5_6446.x
  L8_6449 = L6_6447.x
  L7_6448 = L7_6448 - L8_6449
  L8_6449 = L5_6446.y
  L9_6450 = L6_6447.y
  L8_6449 = L8_6449 - L9_6450
  L9_6450 = L7_6448 - 5
  L10_6451 = L7_6448 + 5
  L11_6452 = L8_6449 + 5
  L12_6453 = L8_6449 - 5
  L13_6454 = {
    L14_6455,
    L15_6456,
    L16_6457,
    L17_6458,
    L18_6459
  }
  L14_6455 = L9_6450
  L15_6456 = L10_6451
  L16_6457 = L11_6452
  L17_6458 = L12_6453
  L18_6459 = WORLD_TYPE_ITEM
  L18_6459 = L18_6459 | WORLD_TYPE_NPC
  L3_6444.search_args = L13_6454
  L13_6454 = L3_6444.search
  L15_6456 = A0_6441
  L14_6455 = A0_6441.Parent
  L14_6455 = L14_6455(L15_6456)
  L14_6455 = L14_6455.joystick
  if not L13_6454 then
    L15_6456 = L14_6455.opera_code
    if L15_6456 == "nothing" then
      L15_6456 = Event
      L16_6457 = L15_6456
      L15_6456 = L15_6456.Fire
      L17_6458 = "Wasteop"
      L18_6459 = Config
      L18_6459 = L18_6459.OnePointFive
      L15_6456(L16_6457, L17_6458, L18_6459)
    end
    return
  end
  L15_6456 = L13_6454.type
  L16_6457 = WORLD_TYPE_NPC
  if L15_6456 == L16_6457 then
    L15_6456 = L13_6454.scenario
    if not L15_6456 then
      return
    end
    L15_6456 = L13_6454.scenario
    L15_6456.check = true
    L15_6456 = L13_6454.name
    A0_6441.search_target = L15_6456
    return
  end
  L15_6456 = L2_6443.ui
  L15_6456 = L15_6456.ibackpack
  L15_6456 = L15_6456.Backpack
  L16_6457 = L13_6454.data
  L18_6459 = L15_6456
  L17_6458 = L15_6456.CheckIncItemByID
  L17_6458 = L17_6458(L18_6459, L16_6457.item_id, L16_6457.amount, true)
  if not L17_6458 then
    L18_6459 = A0_6441
    L17_6458 = A0_6441.SetNotice
    L17_6458(L18_6459, 37)
    return
  end
  L17_6458 = Sprite
  L18_6459 = string
  L18_6459 = L18_6459.format
  L18_6459 = L18_6459("Item/%d.icon", L16_6457.item_id)
  L17_6458 = L17_6458(L18_6459, L18_6459("Item/%d.icon", L16_6457.item_id))
  L18_6459 = Array
  L18_6459 = L18_6459()
  L17_6458:SetPosition(L13_6454.position.x - L4_6445.position.x, L13_6454.position.y - L4_6445.position.y)
  L18_6459:AddObject(ActionME("Music/Game/PickUpItem.mp3"))
  L18_6459:AddObject(MoveTo(0.3, Point(0, 0)))
  L18_6459:AddObject(Hide())
  L18_6459:AddObject(RemoveSelf(true))
  L17_6458:RunAction(Sequence(L18_6459))
  L3_6444.drop_item_remove = L13_6454
  L4_6445.proxy.render:AddChild(L17_6458)
  if L15_6456:IncItemByID(L16_6457.item_id, L16_6457.amount, true, Interface.CreateDropSQLObject) and L15_6456:IncItemByID(L16_6457.item_id, L16_6457.amount, true, Interface.CreateDropSQLObject).class == "Equip" then
    L15_6456:IncItemByID(L16_6457.item_id, L16_6457.amount, true, Interface.CreateDropSQLObject).stochastic = true
  end
end
function Interface.OnNPCUIDown(A0_6460, A1_6461)
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not A0_6460.search_target then
    return
  end
  UniqueComponent("Model/interface.model").parent.physical[A0_6460.search_target].scenario.choose = A1_6461.touch_point.x > 400 and "O" or "X"
end
function Interface.OnConsumeDown(A0_6462, A1_6463)
  local L2_6464
  L2_6464 = A1_6463.item
  if not L2_6464 then
    return
  end
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:UseItemByID(L2_6464.id)
end
function Interface.OnSkillDown(A0_6465, A1_6466)
  if not A1_6466.id then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].cast_skill = A1_6466.id
end
function Interface.OnInvitationResponse(A0_6467, A1_6468, A2_6469)
  A0_6467.bInvitationUpdate = false
  if A1_6468 ~= 0 then
    return
  end
  SetClipboard(A2_6469.invitation)
  A0_6467:Parent().gm_cmd.text = A2_6469.invitation
end
function Interface.OnCDKeyResponse(A0_6470, A1_6471, A2_6472)
  A0_6470.bInvitationUpdate = false
  if A1_6471 ~= 0 then
    return
  end
  SetClipboard(A2_6472.cdkey)
  A0_6470:Parent().gm_cmd.text = A2_6472.cdkey
end
function Interface.CreateSQLObject(A0_6473, A1_6474, A2_6475, A3_6476)
  Items().belong = A0_6473
  Items().item_id = A1_6474
  Items().level = 0
  Items().slevel = 0
  Items().amount = A2_6475
  Items().provenance = "command"
  Items().tradable = A3_6476
  return (Items())
end
function Interface.OnGameMasterCMD(A0_6477, A1_6478)
  local L2_6479, L3_6480, L4_6481, L5_6482, L6_6483, L7_6484, L8_6485, L9_6486, L10_6487, L11_6488
  L2_6479 = VectorString
  L2_6479 = L2_6479()
  L3_6480 = A1_6478.text
  A1_6478.text = ""
  L4_6481 = SplitString
  L5_6482 = L3_6480
  L6_6483 = L2_6479
  L7_6484 = string
  L7_6484 = L7_6484.byte
  L8_6485 = " "
  L11_6488 = L7_6484(L8_6485)
  L4_6481(L5_6482, L6_6483, L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L7_6484(L8_6485))
  L5_6482 = L2_6479
  L4_6481 = L2_6479.Size
  L4_6481 = L4_6481(L5_6482)
  if L4_6481 < 2 then
    return
  end
  L4_6481 = string
  L4_6481 = L4_6481.lower
  L6_6483 = L2_6479
  L5_6482 = L2_6479.At
  L7_6484 = 0
  L11_6488 = L5_6482(L6_6483, L7_6484)
  L4_6481 = L4_6481(L5_6482, L6_6483, L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L5_6482(L6_6483, L7_6484))
  if L4_6481 == "fps" then
    L5_6482 = tonumber
    L7_6484 = L2_6479
    L6_6483 = L2_6479.At
    L8_6485 = 1
    L11_6488 = L6_6483(L7_6484, L8_6485)
    L5_6482 = L5_6482(L6_6483, L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L6_6483(L7_6484, L8_6485))
    L6_6483 = Director
    L7_6484 = L6_6483
    L6_6483 = L6_6483.SetDisplayStats
    L8_6485 = L5_6482 == 1
    L6_6483(L7_6484, L8_6485)
    return
  end
  if L4_6481 == "gc" then
    L5_6482 = GarbageCollect
    L5_6482()
    L5_6482 = SpriteFrameCache
    L6_6483 = L5_6482
    L5_6482 = L5_6482.RemoveUnusedSpriteFrames
    L5_6482(L6_6483)
    L5_6482 = TextureCache
    L6_6483 = L5_6482
    L5_6482 = L5_6482.RemoveUnusedTextures
    L5_6482(L6_6483)
    return
  end
  if L4_6481 == "debugview" then
    L5_6482 = tonumber
    L7_6484 = L2_6479
    L6_6483 = L2_6479.At
    L8_6485 = 1
    L11_6488 = L6_6483(L7_6484, L8_6485)
    L5_6482 = L5_6482(L6_6483, L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L6_6483(L7_6484, L8_6485))
    L6_6483 = UniqueComponent
    L7_6484 = "Model/interface.model"
    L6_6483 = L6_6483(L7_6484)
    L7_6484 = L6_6483.parent
    if not L7_6484 then
      return
    end
    L8_6485 = L5_6482 == 1
    L7_6484.debug = L8_6485
    return
  end
  if L4_6481 == "invitation" then
    L5_6482 = A0_6477.bInvitationUpdate
    if L5_6482 then
      return
    end
    A0_6477.bInvitationUpdate = true
    L5_6482 = AdventureSDK
    L6_6483 = L5_6482
    L5_6482 = L5_6482.NewInvitation
    L7_6484 = A0_6477
    L8_6485 = A0_6477.OnInvitationResponse
    L5_6482(L6_6483, L7_6484, L8_6485)
    return
  end
  if L4_6481 == "invincible" then
    L5_6482 = UniqueComponent
    L6_6483 = "Model/interface.model"
    L5_6482 = L5_6482(L6_6483)
    L6_6483 = L5_6482.parent
    if not L6_6483 then
      return
    end
    L7_6484 = L6_6483.physical
    L8_6485 = L6_6483.focus_object
    L7_6484 = L7_6484[L8_6485]
    if not L7_6484 then
      return
    end
    L8_6485 = L7_6484.data
    L9_6486 = L7_6484.data
    L9_6486 = L9_6486.invincible
    L10_6487 = tonumber
    L11_6488 = L2_6479.At
    L11_6488 = L11_6488(L2_6479, 1)
    L10_6487 = L10_6487(L11_6488, L11_6488(L2_6479, 1))
    L10_6487 = L10_6487 or 0
    L9_6486 = L9_6486 + L10_6487
    L8_6485.invincible = L9_6486
    return
  end
  if L4_6481 == "gift" then
    L5_6482 = A0_6477.bInvitationUpdate
    if L5_6482 then
      return
    end
    A0_6477.bInvitationUpdate = true
    L5_6482 = JsonObject
    L5_6482 = L5_6482()
    L5_6482.type = "integral"
    L5_6482.id = 0
    L6_6483 = tonumber
    L8_6485 = L2_6479
    L7_6484 = L2_6479.At
    L9_6486 = 1
    L11_6488 = L7_6484(L8_6485, L9_6486)
    L6_6483 = L6_6483(L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L7_6484(L8_6485, L9_6486))
    L5_6482.quantity = L6_6483
    L6_6483 = AdventureSDK
    L7_6484 = L6_6483
    L6_6483 = L6_6483.NewCDKey
    L8_6485 = L5_6482
    L9_6486 = A0_6477
    L10_6487 = A0_6477.OnCDKeyResponse
    L6_6483(L7_6484, L8_6485, L9_6486, L10_6487)
    return
  end
  if L4_6481 == "cgift" then
    L5_6482 = A0_6477.bInvitationUpdate
    if L5_6482 then
      return
    end
    A0_6477.bInvitationUpdate = true
    L5_6482 = JsonObject
    L5_6482 = L5_6482()
    L5_6482.type = "integral"
    L5_6482.id = 0
    L6_6483 = tonumber
    L8_6485 = L2_6479
    L7_6484 = L2_6479.At
    L9_6486 = 1
    L11_6488 = L7_6484(L8_6485, L9_6486)
    L6_6483 = L6_6483(L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L7_6484(L8_6485, L9_6486))
    L6_6483 = L6_6483 * 120
    L5_6482.quantity = L6_6483
    L6_6483 = AdventureSDK
    L7_6484 = L6_6483
    L6_6483 = L6_6483.NewCDKey
    L8_6485 = L5_6482
    L9_6486 = A0_6477
    L10_6487 = A0_6477.OnCDKeyResponse
    L6_6483(L7_6484, L8_6485, L9_6486, L10_6487)
    return
  end
  if L4_6481 == "igift" then
    L5_6482 = A0_6477.bInvitationUpdate
    if L5_6482 then
      return
    end
    L5_6482 = tonumber
    L7_6484 = L2_6479
    L6_6483 = L2_6479.At
    L8_6485 = 1
    L11_6488 = L6_6483(L7_6484, L8_6485)
    L5_6482 = L5_6482(L6_6483, L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L6_6483(L7_6484, L8_6485))
    L6_6483 = LoadConf
    L7_6484 = string
    L7_6484 = L7_6484.format
    L8_6485 = "Item/%d.item"
    L9_6486 = L5_6482
    L11_6488 = L7_6484(L8_6485, L9_6486)
    L6_6483 = L6_6483(L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L7_6484(L8_6485, L9_6486))
    if not L6_6483 then
      return
    end
    A0_6477.bInvitationUpdate = true
    L6_6483 = JsonObject
    L6_6483 = L6_6483()
    L6_6483.type = "item"
    L6_6483.id = L5_6482
    L8_6485 = L2_6479
    L7_6484 = L2_6479.Size
    L7_6484 = L7_6484(L8_6485)
    if L7_6484 > 2 then
      L7_6484 = tonumber
      L9_6486 = L2_6479
      L8_6485 = L2_6479.At
      L10_6487 = 2
      L11_6488 = L8_6485(L9_6486, L10_6487)
      L7_6484 = L7_6484(L8_6485, L9_6486, L10_6487, L11_6488, L8_6485(L9_6486, L10_6487))
    else
      L7_6484 = L7_6484 or 1
    end
    L6_6483.quantity = L7_6484
    L7_6484 = AdventureSDK
    L8_6485 = L7_6484
    L7_6484 = L7_6484.NewCDKey
    L9_6486 = L6_6483
    L10_6487 = A0_6477
    L11_6488 = A0_6477.OnCDKeyResponse
    L7_6484(L8_6485, L9_6486, L10_6487, L11_6488)
    return
  end
  if L4_6481 == "item" then
    L5_6482 = tonumber
    L7_6484 = L2_6479
    L6_6483 = L2_6479.At
    L8_6485 = 1
    L11_6488 = L6_6483(L7_6484, L8_6485)
    L5_6482 = L5_6482(L6_6483, L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L6_6483(L7_6484, L8_6485))
    L6_6483 = tonumber
    L8_6485 = L2_6479
    L7_6484 = L2_6479.At
    L9_6486 = 2
    L11_6488 = L7_6484(L8_6485, L9_6486)
    L6_6483 = L6_6483(L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L7_6484(L8_6485, L9_6486))
    if not L6_6483 or not L6_6483 then
      L6_6483 = 1
    end
    if L6_6483 == 0 then
      L7_6484 = 1
      L6_6483 = L7_6484 or L6_6483
    end
    L7_6484 = UniqueComponent
    L8_6485 = "Model/interface.model"
    L7_6484 = L7_6484(L8_6485)
    L8_6485 = L7_6484.ui
    L8_6485 = L8_6485.ibackpack
    L8_6485 = L8_6485.Backpack
    L10_6487 = L8_6485
    L9_6486 = L8_6485.IncItemByID
    L11_6488 = L5_6482
    L9_6486(L10_6487, L11_6488, L6_6483, true, A0_6477.CreateSQLObject)
    return
  end
  if L4_6481 == "integral" then
    L5_6482 = UniqueComponent
    L6_6483 = "Model/interface.model"
    L5_6482 = L5_6482(L6_6483)
    L6_6483 = L5_6482.parent
    if not L6_6483 then
      return
    end
    L7_6484 = L6_6483.physical
    L8_6485 = L6_6483.focus_object
    L7_6484 = L7_6484[L8_6485]
    if not L7_6484 then
      return
    end
    L8_6485 = Userinfo
    L9_6486 = L8_6485
    L8_6485 = L8_6485.One
    L10_6487 = string
    L10_6487 = L10_6487.format
    L11_6488 = "serial = %d"
    L11_6488 = L10_6487(L11_6488, L7_6484.name)
    L8_6485 = L8_6485(L9_6486, L10_6487, L11_6488, L10_6487(L11_6488, L7_6484.name))
    L9_6486 = tonumber
    L11_6488 = L2_6479
    L10_6487 = L2_6479.At
    L11_6488 = L10_6487(L11_6488, 1)
    L9_6486 = L9_6486(L10_6487, L11_6488, L10_6487(L11_6488, 1))
    L10_6487 = Integral
    L10_6487 = L10_6487()
    L11_6488 = L8_6485.belong
    L10_6487.belong = L11_6488
    L10_6487.quantity = L9_6486
    L10_6487.limit = 0
    L10_6487.provenance = "command"
    return
  end
  if L4_6481 == "exp" then
    L5_6482 = UniqueComponent
    L6_6483 = "Model/interface.model"
    L5_6482 = L5_6482(L6_6483)
    L6_6483 = L5_6482.parent
    if not L6_6483 then
      return
    end
    L7_6484 = L6_6483.physical
    L8_6485 = L6_6483.focus_object
    L7_6484 = L7_6484[L8_6485]
    if not L7_6484 then
      return
    end
    L8_6485 = L7_6484.data
    L9_6486 = tonumber
    L11_6488 = L2_6479
    L10_6487 = L2_6479.At
    L11_6488 = L10_6487(L11_6488, 1)
    L9_6486 = L9_6486(L10_6487, L11_6488, L10_6487(L11_6488, 1))
    L8_6485.inc_exp = L9_6486
    return
  end
  if L4_6481 == "gold" then
    L5_6482 = UniqueComponent
    L6_6483 = "Model/interface.model"
    L5_6482 = L5_6482(L6_6483)
    L6_6483 = L5_6482.parent
    if not L6_6483 then
      return
    end
    L7_6484 = L6_6483.physical
    L8_6485 = L6_6483.focus_object
    L7_6484 = L7_6484[L8_6485]
    if not L7_6484 then
      return
    end
    L8_6485 = Possession
    L8_6485 = L8_6485()
    L9_6486 = L7_6484.name
    L8_6485.belong = L9_6486
    L9_6486 = tonumber
    L11_6488 = L2_6479
    L10_6487 = L2_6479.At
    L11_6488 = L10_6487(L11_6488, 1)
    L9_6486 = L9_6486(L10_6487, L11_6488, L10_6487(L11_6488, 1))
    L8_6485.quantity = L9_6486
    L8_6485.limit = 0
    L8_6485.provenance = "command"
    return
  end
  if L4_6481 == "hair" then
    L5_6482 = UniqueComponent
    L6_6483 = "Model/interface.model"
    L5_6482 = L5_6482(L6_6483)
    L6_6483 = L5_6482.parent
    if not L6_6483 then
      return
    end
    L7_6484 = L6_6483.physical
    L8_6485 = L6_6483.focus_object
    L7_6484 = L7_6484[L8_6485]
    if not L7_6484 then
      return
    end
    L8_6485 = L7_6484.proxy
    L9_6486 = tonumber
    L11_6488 = L2_6479
    L10_6487 = L2_6479.At
    L11_6488 = L10_6487(L11_6488, 1)
    L9_6486 = L9_6486(L10_6487, L11_6488, L10_6487(L11_6488, 1))
    L8_6485.hair = L9_6486
    return
  end
  if L4_6481 == "sql" then
    L5_6482 = UniqueComponent
    L6_6483 = "Model/interface.model"
    L5_6482 = L5_6482(L6_6483)
    L6_6483 = L5_6482.parent
    if not L6_6483 then
      return
    end
    L7_6484 = L6_6483.physical
    L8_6485 = L6_6483.focus_object
    L7_6484 = L7_6484[L8_6485]
    if not L7_6484 then
      return
    end
    L9_6486 = L2_6479
    L8_6485 = L2_6479.At
    L10_6487 = 1
    L8_6485 = L8_6485(L9_6486, L10_6487)
    L9_6486 = string
    L9_6486 = L9_6486.sub
    L10_6487 = L3_6480
    L11_6488 = string
    L11_6488 = L11_6488.len
    L11_6488 = L11_6488(L8_6485)
    L11_6488 = 5 + L11_6488
    L9_6486 = L9_6486(L10_6487, L11_6488)
    L10_6487 = Global
    L10_6487 = L10_6487[L8_6485]
    if not L10_6487 then
      return
    end
    L11_6488 = L10_6487.Find
    L11_6488 = L11_6488(L10_6487, L9_6486)
    for _FORV_15_, _FORV_16_ in ipairs(L11_6488) do
      Log(_FORV_16_:MakeString())
    end
    return
  end
  if L4_6481 == "map" then
    L5_6482 = UniqueComponent
    L6_6483 = "Model/interface.model"
    L5_6482 = L5_6482(L6_6483)
    L6_6483 = L5_6482.parent
    if not L6_6483 then
      return
    end
    L7_6484 = L6_6483.physical
    L8_6485 = L6_6483.focus_object
    L7_6484 = L7_6484[L8_6485]
    if not L7_6484 then
      return
    end
    L8_6485 = LoadConf
    L9_6486 = string
    L9_6486 = L9_6486.format
    L10_6487 = "Scene/%s.scene"
    L11_6488 = L2_6479.At
    L11_6488 = L11_6488(L2_6479, 1)
    L11_6488 = L9_6486(L10_6487, L11_6488, L11_6488(L2_6479, 1))
    L8_6485 = L8_6485(L9_6486, L10_6487, L11_6488, L9_6486(L10_6487, L11_6488, L11_6488(L2_6479, 1)))
    if not L8_6485 then
      return
    end
    L9_6486 = {}
    L10_6487 = tonumber
    L11_6488 = L2_6479.At
    L11_6488 = L11_6488(L2_6479, 1)
    L10_6487 = L10_6487(L11_6488, L11_6488(L2_6479, 1))
    L9_6486.tm = L10_6487
    L7_6484.transfer = L9_6486
    return
  end
  if L4_6481 == "print" then
    L5_6482 = UniqueComponent
    L6_6483 = "Model/interface.model"
    L5_6482 = L5_6482(L6_6483)
    L6_6483 = L5_6482.parent
    if not L6_6483 then
      return
    end
    L7_6484 = L6_6483.physical
    L8_6485 = L6_6483.focus_object
    L7_6484 = L7_6484[L8_6485]
    L8_6485 = Log
    L9_6486 = string
    L9_6486 = L9_6486.format
    L10_6487 = "%x"
    L11_6488 = L7_6484.status
    L11_6488 = L9_6486(L10_6487, L11_6488)
    L8_6485(L9_6486, L10_6487, L11_6488, L9_6486(L10_6487, L11_6488))
    L8_6485 = Log
    L9_6486 = "Map:"
    L10_6487 = L6_6483.id
    L8_6485(L9_6486, L10_6487)
    L8_6485 = Log
    L9_6486 = "x:"
    L10_6487 = L7_6484.x
    L11_6488 = ", y:"
    L8_6485(L9_6486, L10_6487, L11_6488, L7_6484.y)
    return
  end
  if L4_6481 == "memory" then
    L5_6482 = Log
    L6_6483 = MemoryCount
    L11_6488 = L6_6483()
    L5_6482(L6_6483, L7_6484, L8_6485, L9_6486, L10_6487, L11_6488, L6_6483())
    return
  end
end
function Interface.RefreshStatus(A0_6489, A1_6490)
  local L2_6491, L3_6492, L4_6493, L5_6494, L6_6495
  L3_6492 = A0_6489
  L2_6491 = A0_6489.Parent
  L2_6491 = L2_6491(L3_6492)
  L3_6492 = A1_6490.data
  L4_6493 = LoadConf
  L5_6494 = "Config/Levels.conf"
  L4_6493 = L4_6493(L5_6494)
  L5_6494 = string
  L5_6494 = L5_6494.format
  L6_6495 = "belong = %d"
  L5_6494 = L5_6494(L6_6495, A1_6490.name)
  L6_6495 = Levels
  L6_6495 = L6_6495.Sum
  L6_6495 = L6_6495(L6_6495, "level", L5_6494)
  L2_6491.level.text = tostring(L6_6495)
  L2_6491.hp_number.text = string.format("<%d;%d>", math.floor(L3_6492.hp), math.floor(L3_6492.max_hp))
  L2_6491.hp_progress.percent_action = L3_6492.hp / L3_6492.max_hp * 100
  L2_6491.mp_number.text = string.format("<%d;%d>", math.floor(L3_6492.mp), math.floor(L3_6492.max_mp))
  L2_6491.mp_progress.percent_action = L3_6492.mp / L3_6492.max_mp * 100
  L2_6491.exp_number.text = string.format("<%d;%d>", math.floor(L3_6492.exp), L4_6493[L6_6495])
  L2_6491.exp_progress.percent_action = L3_6492.exp / L4_6493[L6_6495] * 100
end
function Interface.on_before_parent_set(A0_6496, A1_6497)
  local L2_6498, L3_6499
  L2_6498 = A1_6497
  if not L2_6498 then
    return
  end
  L3_6499 = L2_6498.focus_object
  L3_6499 = L2_6498[L3_6499]
  if not L3_6499 then
    return
  end
end
function Interface.on_parent_set(A0_6500, A1_6501)
  local L2_6502, L3_6503, L4_6504, L5_6505, L6_6506
  L2_6502 = A1_6501.parent
  if not L2_6502 then
    return
  end
  L4_6504 = A0_6500
  L3_6503 = A0_6500.Parent
  L3_6503 = L3_6503(L4_6504)
  L4_6504 = L3_6503.map_name
  L5_6505 = L2_6502.name
  L4_6504.text = L5_6505
  L4_6504 = L2_6502.focus_object
  L4_6504 = L2_6502[L4_6504]
  L5_6505 = L3_6503.figure
  L5_6505.copy = L4_6504
  L5_6505 = L3_6503.figure
  L5_6505 = L5_6505.tag_name
  L6_6506 = L4_6504.name_tag
  L6_6506 = L6_6506.text
  L5_6505.text = L6_6506
  L6_6506 = L2_6502.physical
  L6_6506 = L6_6506[L4_6504.name]
  A0_6500:RefreshStatus(L6_6506)
end
