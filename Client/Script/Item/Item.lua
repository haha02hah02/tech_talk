Class.Item.Component({})
function Item.Constructor(A0_3618, A1_3619)
  Component.Constructor(A0_3618)
  if not A1_3619 then
    return
  end
  A0_3618.sql_object = A1_3619
  if not LoadConf(string.format("Item/%d.item", A1_3619.item_id)) then
    return
  end
  A0_3618.info = LoadConf(string.format("Item/%d.item", A1_3619.item_id)).info
  A0_3618.view = ItemView(A0_3618.id, A0_3618.amount, A1_3619.stochastic)
end
function Item.class_get(A0_3620)
  local L1_3621
  L1_3621 = "Item"
  return L1_3621
end
function Item.view_get(A0_3622, A1_3623)
  return rawget(A0_3622, "view")
end
function Item.view_set(A0_3624, A1_3625, A2_3626)
  rawset(A0_3624, "view", A2_3626)
end
function Item.sql_object_get(A0_3627, A1_3628)
  return rawget(A0_3627, "sql_object")
end
function Item.sql_object_set(A0_3629, A1_3630, A2_3631)
  rawset(A0_3629, "sql_object", A2_3631)
end
function Item.serial_get(A0_3632)
  local L1_3633
  L1_3633 = A0_3632.sql_object
  return L1_3633 and L1_3633.serial or nil
end
function Item.info_get(A0_3634, A1_3635)
  return rawget(A0_3634, "info")
end
function Item.info_set(A0_3636, A1_3637, A2_3638)
  rawset(A0_3636, "info", A2_3638)
end
function Item.id_get(A0_3639)
  local L1_3640
  L1_3640 = A0_3639.sql_object
  return L1_3640 and L1_3640.item_id or nil
end
function Item.type_get(A0_3641)
  local L1_3642
  L1_3642 = A0_3641.info
  return L1_3642 and L1_3642.type or nil
end
function Item.stype_get(A0_3643)
  local L1_3644
  L1_3644 = A0_3643.info
  return L1_3644 and L1_3644.stype or nil
end
function Item.req_level_get(A0_3645)
  local L1_3646
  L1_3646 = A0_3645.info
  return L1_3646 and L1_3646.req_level or 0
end
function Item.req_sex_get(A0_3647)
  local L1_3648
  L1_3648 = A0_3647.info
  return L1_3648 and L1_3648.req_sex or nil
end
function Item.req_job_get(A0_3649)
  local L1_3650, L2_3651
  L1_3650 = A0_3649.info
  L2_3651 = L1_3650 and L1_3650.req_job
  return L2_3651
end
function Item.req_str_get(A0_3652)
  local L1_3653
  L1_3653 = A0_3652.info
  return L1_3653 and L1_3653.req_str or 0
end
function Item.req_dex_get(A0_3654)
  local L1_3655
  L1_3655 = A0_3654.info
  return L1_3655 and L1_3655.req_dex or 0
end
function Item.req_int_get(A0_3656)
  local L1_3657
  L1_3657 = A0_3656.info
  return L1_3657 and L1_3657.req_int or 0
end
function Item.req_luck_get(A0_3658)
  local L1_3659
  L1_3659 = A0_3658.info
  return L1_3659 and L1_3659.req_luck or 0
end
function Item.is_cash_get(A0_3660)
  local L1_3661
  L1_3661 = A0_3660.info
  return L1_3661 and L1_3661.is_cash or false
end
function Item.cant_sell_get(A0_3662)
  local L1_3663
  L1_3663 = A0_3662.info
  return L1_3663 and L1_3663.cant_sell or false
end
function Item.price_get(A0_3664)
  local L1_3665
  L1_3665 = A0_3664.info
  return L1_3665 and L1_3665.price or nil
end
function Item.amount_get(A0_3666)
  local L1_3667
  L1_3667 = A0_3666.sql_object
  if not L1_3667 then
    return 1
  end
  return L1_3667.amount or 1
end
function Item.amount_set(A0_3668, A1_3669, A2_3670)
  local L3_3671, L4_3672
  L3_3671 = A0_3668.sql_object
  if not L3_3671 then
    return
  end
  L4_3672 = A0_3668.stack
  if A2_3670 > L4_3672 then
    return
  end
  L3_3671.amount = A2_3670
  L4_3672 = A0_3668.view
  L4_3672.amount = A2_3670
end
function Item.stack_get(A0_3673)
  local L1_3674
  L1_3674 = A0_3673.info
  if not L1_3674 then
    return
  end
  return L1_3674.stack or 1
end
function Item.site_get(A0_3675, A1_3676)
  local L2_3677
  L2_3677 = A0_3675.sql_object
  return L2_3677 and L2_3677.site or nil
end
function Item.site_set(A0_3678, A1_3679, A2_3680)
  local L3_3681
  L3_3681 = A0_3678.sql_object
  if not L3_3681 then
    return
  end
  L3_3681.site = A2_3680
end
function Item.slot_get(A0_3682, A1_3683)
  local L2_3684
  L2_3684 = A0_3682.sql_object
  return L2_3684 and L2_3684.slot or nil
end
function Item.slot_set(A0_3685, A1_3686, A2_3687)
  local L3_3688
  L3_3688 = A0_3685.sql_object
  if not L3_3688 then
    return
  end
  L3_3688.slot = A2_3687
end
function Item.level_get(A0_3689)
  local L1_3690, L2_3691
  L1_3690 = A0_3689.sql_object
  if not L1_3690 then
    L2_3691 = 0
    return L2_3691
  end
  L2_3691 = L1_3690.level
  return L2_3691
end
function Item.level_set(A0_3692, A1_3693, A2_3694)
  local L3_3695
  if not A2_3694 then
    return
  end
  L3_3695 = Config
  L3_3695 = L3_3695.MaxIntensifyLevel
  if A2_3694 > L3_3695 then
    return
  end
  L3_3695 = A0_3692.sql_object
  if not L3_3695 then
    return
  end
  L3_3695.level = A2_3694
end
function Item.slevel_get(A0_3696)
  local L1_3697, L2_3698
  L1_3697 = A0_3696.sql_object
  if not L1_3697 then
    L2_3698 = 0
    return L2_3698
  end
  L2_3698 = L1_3697.slevel
  return L2_3698
end
function Item.slevel_set(A0_3699, A1_3700, A2_3701)
  local L3_3702
  if not A2_3701 then
    return
  end
  L3_3702 = Config
  L3_3702 = L3_3702.MaxIntensifyLevel
  if A2_3701 > L3_3702 then
    return
  end
  L3_3702 = A0_3699.sql_object
  if not L3_3702 then
    return
  end
  L3_3702.slevel = A2_3701
end
function Item.enchant_get(A0_3703)
  local L1_3704, L2_3705
  L1_3704 = A0_3703.sql_object
  if not L1_3704 then
    return
  end
  L2_3705 = L1_3704.enchant
  return L2_3705
end
function Item.stochastic_get(A0_3706)
  local L1_3707, L2_3708
  L1_3707 = A0_3706.sql_object
  if not L1_3707 then
    return
  end
  L2_3708 = L1_3707.stochastic
  return L2_3708
end
function Item.stackable_get(A0_3709)
  local L1_3710
  L1_3710 = A0_3709.stack
  if not L1_3710 then
    return 0
  end
  return L1_3710 - A0_3709.amount
end
function Item.ctime_get(A0_3711)
  local L1_3712
  L1_3712 = A0_3711.sql_object
  return L1_3712 and L1_3712.ctime or nil
end
function Item.duration_get(A0_3713)
  local L1_3714, L2_3715
  L1_3714 = A0_3713.info
  if not L1_3714 then
    return
  end
  L2_3715 = L1_3714.duration
  return L2_3715
end
function Item.tradable_get(A0_3716)
  local L1_3717, L2_3718, L3_3719
  L1_3717 = A0_3716.info
  if L1_3717 then
    L2_3718 = L1_3717.duration
    if L2_3718 then
      return
    end
  end
  L2_3718 = A0_3716.sql_object
  if not L2_3718 then
    return
  end
  L3_3719 = L2_3718.tradable
  return L3_3719
end
function Item.tradable_set(A0_3720, A1_3721, A2_3722)
  local L3_3723, L4_3724
  L3_3723 = A0_3720.sql_object
  if not L3_3723 then
    return
  end
  if A2_3722 then
    L4_3724 = true
  else
    L4_3724 = L4_3724 or false
  end
  L3_3723.tradable = L4_3724
end
function Item.dropable_get(A0_3725)
  local L1_3726, L2_3727
  L1_3726 = A0_3725.info
  if not L1_3726 then
    return
  end
  L2_3727 = L1_3726.is_cash
  if L2_3727 then
    return
  end
  L2_3727 = L1_3726.cant_discard
  if L2_3727 then
    return
  end
  L2_3727 = true
  return L2_3727
end
function Item.dec_set(A0_3728, A1_3729, A2_3730)
  A0_3728.amount = (A0_3728.amount or 1) - 1
  UniqueComponent("Model/interface.model").ui.ibackpack.fire = "Changed"
  if A0_3728.amount > 0 then
    return
  end
  A0_3728.parent = nil
  A0_3728.view.parent = nil
  UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:CleanSelectStatus()
  if not A0_3728.sql_object then
    return
  end
  A0_3728.sql_object.site = "expend"
  A0_3728.sql_object.slot = nil
end
function Item.drop_set(A0_3731, A1_3732, A2_3733)
  local L3_3734
  L3_3734 = A0_3731.sql_object
  if not L3_3734 then
    return
  end
  L3_3734.site = "recycle"
  L3_3734.slot = nil
end
function Item.sell_set(A0_3735, A1_3736, A2_3737)
  local L3_3738, L4_3739
  L3_3738 = A0_3735.sql_object
  if not L3_3738 then
    return
  end
  L4_3739 = A0_3735.is_cash
  if L4_3739 then
    L4_3739 = "csell"
  else
    L4_3739 = L4_3739 or "sell"
  end
  L3_3738.site = L4_3739
  L3_3738.slot = nil
end
function Item.use_set(A0_3740, A1_3741, A2_3742)
end
