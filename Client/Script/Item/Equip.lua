L0_3528 = Class
L0_3528 = L0_3528.Equip
L0_3528 = L0_3528.Item
L0_3528({})
L0_3528 = DataFormat
L0_3528 = L0_3528()
L0_3528[1] = -1
L0_3528[2] = 0
L0_3528[3] = 1
L0_3528[4] = 1
L0_3528[5] = 2
function Equip.Constructor(A0_3529, A1_3530)
  Item.Constructor(A0_3529, A1_3530)
  A0_3529.attach_stochastic = A0_3529.stochastic_attr
end
function Equip.class_get(A0_3531)
  local L1_3532
  L1_3532 = "Equip"
  return L1_3532
end
function Equip.name_tag_get(A0_3533)
  local L1_3534
  L1_3534 = A0_3533.info
  return L1_3534 and L1_3534.name_tag or nil
end
function Equip.title_get(A0_3535)
  local L1_3536
  L1_3536 = A0_3535.info
  return L1_3536 and L1_3536.title or nil
end
function Equip.title_tag_get(A0_3537)
  local L1_3538
  L1_3538 = A0_3537.info
  return L1_3538 and L1_3538.title_tag or nil
end
function Equip.enchant_get(A0_3539)
  local L1_3540, L2_3541
  L1_3540 = A0_3539.sql_object
  if not L1_3540 then
    return
  end
  L2_3541 = L1_3540.enchant
  return L2_3541
end
function Equip.enchant_set(A0_3542, A1_3543, A2_3544)
  local L3_3545
  L3_3545 = A0_3542.sql_object
  if not L3_3545 then
    return
  end
  L3_3545.enchant = A2_3544
end
function Equip.stochastic_attr_get(A0_3546)
  local L1_3547, L2_3548, L3_3549, L4_3550, L5_3551, L6_3552, L7_3553, L8_3554, L9_3555, L10_3556, L11_3557, L12_3558, L13_3559, L14_3560, L15_3561
  L1_3547 = A0_3546.info
  if not L1_3547 then
    return
  end
  L2_3548 = A0_3546.sql_object
  if not L2_3548 then
    return
  end
  L3_3549 = L2_3548.stochastic
  if not L3_3549 then
    return
  end
  L4_3550 = LoadConf
  L5_3551 = "Config/Stochastic.conf"
  L4_3550 = L4_3550(L5_3551)
  L5_3551 = DataFormat
  L5_3551 = L5_3551()
  L6_3552 = A0_3546.slevel
  L7_3553 = A0_3546.req_level
  if L7_3553 ~= L8_3554 then
    L7_3553 = A0_3546.req_level
  elseif not L7_3553 then
    L7_3553 = Config
    L7_3553 = L7_3553.TenNumber
  end
  for L11_3557, L12_3558 in L8_3554(L9_3555) do
    L13_3559 = L4_3550[L11_3557]
    L13_3559 = L13_3559[L12_3558]
    L14_3560 = Config
    L14_3560 = L14_3560.ZeroNumber
    L14_3560 = L13_3559 < L14_3560 and L13_3559 or L14_3560 + L15_3561
    L15_3561 = L11_3557 == "critical" and L14_3560 or L15_3561(L14_3560)
    L5_3551[L11_3557] = (L1_3547[L11_3557] or Config.ZeroNumber) + L15_3561 < Config.ZeroNumber and -(L1_3547[L11_3557] or Config.ZeroNumber) or L15_3561
  end
  return L5_3551
end
function Equip.attach_stochastic_get(A0_3562)
  return rawget(A0_3562, "attach_stochastic")
end
function Equip.attach_stochastic_set(A0_3563, A1_3564, A2_3565)
  rawset(A0_3563, "attach_stochastic", A2_3565)
end
function Equip.stochastic_get(A0_3566)
  local L1_3567, L2_3568
  L1_3567 = A0_3566.sql_object
  if not L1_3567 then
    return
  end
  L2_3568 = L1_3567.stochastic
  return L2_3568
end
function Equip.stochastic_set(A0_3569, A1_3570, A2_3571)
  local L3_3572, L4_3573, L5_3574, L6_3575, L7_3576, L8_3577
  L3_3572 = A0_3569.info
  if not L3_3572 then
    return
  end
  L4_3573 = L3_3572.is_cash
  if L4_3573 then
    return
  end
  L4_3573 = A0_3569.sql_object
  if not L4_3573 then
    return
  end
  L5_3574 = A0_3569.attach_stochastic
  L6_3575 = LoadConf
  L7_3576 = "Config/Stochastic.conf"
  L6_3575 = L6_3575(L7_3576)
  L7_3576 = {}
  L8_3577 = isinteger
  L8_3577 = L8_3577(A2_3571)
  if L8_3577 then
    L8_3577 = math
    L8_3577 = L8_3577.min
    L8_3577 = L8_3577(Config.TenNumber, math.max(Config.ZeroNumber, A2_3571))
  elseif not L8_3577 then
    L8_3577 = Config
    L8_3577 = L8_3577.ZeroNumber
  end
  for _FORV_12_, _FORV_13_ in pairs(L3_3572.values) do
    if L6_3575[_FORV_12_] then
      L7_3576[_FORV_12_] = math.random(L8_3577, Config.TenNumber)
    end
  end
  L4_3573.stochastic = L7_3576
  A0_3569.view.stochastic = L7_3576
  A0_3569.attach_stochastic = A0_3569.stochastic_attr
  if not A0_3569.equiped then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.unattach = L5_3574
  UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.attach = A0_3569.stochastic_attr
end
function Equip.resetting_set(A0_3578, A1_3579, A2_3580)
  local L3_3581, L4_3582, L5_3583, L6_3584, L7_3585
  L3_3581 = A0_3578.info
  if not L3_3581 then
    return
  end
  L4_3582 = L3_3581.is_cash
  if L4_3582 then
    return
  end
  L4_3582 = A0_3578.sql_object
  if not L4_3582 then
    return
  end
  L5_3583 = A0_3578.attach_stochastic
  L6_3584 = {}
  L7_3585 = L4_3582.stochastic
  L7_3585 = L7_3585 or {}
  for _FORV_12_, _FORV_13_ in pairs(L3_3581.values) do
    if LoadConf("Config/Stochastic.conf")[_FORV_12_] and not L7_3585[_FORV_12_] then
      L7_3585[_FORV_12_] = Config.NormalStochast
    end
  end
  for _FORV_12_, _FORV_13_ in pairs(L7_3585) do
    L6_3584[_FORV_12_] = _FORV_13_ > Config.NineNumber and _FORV_13_ or math.max(Config.ZeroNumber, math.min(Config.TenNumber, _FORV_13_ + L0_3528[math.random(Config.OneNumber, Config.FiveNumber)]))
  end
  L4_3582.stochastic = L6_3584
  A0_3578.view.stochastic = L6_3584
  A0_3578.attach_stochastic = A0_3578.stochastic_attr
  if not A0_3578.equiped then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.unattach = L5_3583
  UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.attach = A0_3578.stochastic_attr
end
function Equip.refresh_attr_set(A0_3586)
  local L4_3587
  L4_3587 = A0_3586.info
  if not L4_3587 then
    return
  end
  if not A0_3586.sql_object then
    return
  end
  A0_3586.attach_stochastic = A0_3586.stochastic_attr
  if not A0_3586.equiped then
    return
  end
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.unattach = A0_3586.attach_stochastic
  UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].data.attach = A0_3586.stochastic_attr
end
function Equip.effect_get(A0_3588)
  local L1_3589
  L1_3589 = A0_3588.info
  return L1_3589 and L1_3589.effect or nil
end
function Equip.effect_object_get(A0_3590)
  return rawget(A0_3590, "effect_object")
end
function Equip.effect_object_set(A0_3591)
  local L1_3592, L2_3593
  L1_3592 = A0_3591.effect
  if L1_3592 then
    L1_3592 = A0_3591.effect_object
  elseif L1_3592 then
    return
  end
  L1_3592 = string
  L1_3592 = L1_3592.format
  L2_3593 = "Item/%d"
  L1_3592 = L1_3592(L2_3593, A0_3591.effect)
  L2_3593 = Effect
  L2_3593 = L2_3593(L1_3592, true, A0_3591.effect_repeat_index)
  L2_3593.direction = A0_3591.info.effect_direction
  L2_3593.order = A0_3591.info.effect_back and -1 or 0
  L2_3593.back = A0_3591.info.effect_back
  rawset(A0_3591, "effect_object", L2_3593)
end
function Equip.effect_repeat_index_get(A0_3594)
  local L1_3595
  L1_3595 = A0_3594.info
  return L1_3595 and L1_3595.effect_repeat_index or nil
end
function Equip.use_set(A0_3596, A1_3597)
  UniqueComponent("Model/interface.model").ui.iuserinfo.UserInfo:Equip(A0_3596)
  if A0_3596.parent == A0_3596.parent then
    return
  end
  A0_3596.parent.parent.focus.tag = 0
  A0_3596.parent.parent.focus.visible = false
end
function Equip.equiped_get(A0_3598)
  return rawget(A0_3598, "equiped")
end
function Equip.equiped_set(A0_3599, A1_3600, A2_3601)
  rawset(A0_3599, "equiped", A2_3601)
end
function Equip.equip_set(A0_3602, A1_3603, A2_3604)
  local L3_3605, L4_3606, L5_3607, L6_3608, L7_3609
  A0_3602.equiped = true
  A0_3602.effect_object = true
  A2_3604.fire = "Equiped"
  L3_3605 = A2_3604.data
  L4_3606 = A0_3602.is_cash
  if not L4_3606 then
    L4_3606 = A0_3602.info
    L3_3605.attach = L4_3606
  end
  L4_3606 = A0_3602.name_tag
  if L4_3606 then
    L5_3607 = A2_3604.proxy
    L5_3607.name_tag = L4_3606
  end
  L5_3607 = A0_3602.title
  if L5_3607 then
    L6_3608 = A2_3604.proxy
    L7_3609 = {
      L5_3607,
      A0_3602.title_tag
    }
    L6_3608.title = L7_3609
  end
  L6_3608 = A0_3602.effect_object
  if L6_3608 then
    L7_3609 = A2_3604.proxy
    L6_3608.parent = L7_3609
  end
  L7_3609 = A0_3602.attach_stochastic
  if L7_3609 then
    L3_3605.attach = L7_3609
  end
end
function Equip.unequip_set(A0_3610, A1_3611, A2_3612)
  local L3_3613, L4_3614, L5_3615, L6_3616, L7_3617
  A0_3610.equiped = false
  A2_3612.fire = "Unequiped"
  L3_3613 = A2_3612.data
  L4_3614 = A0_3610.is_cash
  if not L4_3614 then
    L4_3614 = A0_3610.info
    L3_3613.unattach = L4_3614
  end
  L4_3614 = A0_3610.name_tag
  if L4_3614 then
    L5_3615 = A2_3612.proxy
    L5_3615.name_tag = 0
  end
  L5_3615 = A0_3610.title
  if L5_3615 then
    L6_3616 = A2_3612.proxy
    L6_3616.title = nil
  end
  L6_3616 = A0_3610.effect_object
  if L6_3616 then
    L6_3616.parent = nil
  end
  L7_3617 = A0_3610.attach_stochastic
  if L7_3617 then
    L3_3613.unattach = L7_3617
  end
end
