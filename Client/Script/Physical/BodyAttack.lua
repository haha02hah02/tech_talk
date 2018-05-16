local L1_3838, L2_3839, L3_3840, L4_3841, L5_3842
L0_3837 = Class
L0_3837 = L0_3837.BodyAttack
L0_3837 = L0_3837.Component
L1_3838 = {}
L0_3837(L1_3838)
L0_3837 = Point
L1_3838 = 0
L2_3839 = 0
L0_3837 = L0_3837(L1_3838, L2_3839)
L1_3838 = Config
L1_3838 = L1_3838.ScreenWidth
L1_3838 = L1_3838 / 2
L2_3839 = Config
L2_3839 = L2_3839.ScreenHeight
L2_3839 = L2_3839 / 2
L3_3840 = Config
L3_3840 = L3_3840.ScreenWidth
L4_3841 = Config
L4_3841 = L4_3841.ScreenHeight
L5_3842 = DataFormat
L5_3842 = L5_3842()
L5_3842.damage_type = "physical"
L5_3842.critical_unable = true
L5_3842.no_level_dodge = true
function BodyAttack.Constructor(A0_3843, A1_3844, A2_3845)
  Component.Constructor(A0_3843)
  if A2_3845.no_body_attack then
    return
  end
  A0_3843.name = "body_attack"
  A0_3843.interval = A2_3845.attack_interval or 2.4
  A0_3843.on = {
    "Start",
    A0_3843,
    BodyAttack.on_start_fire
  }
  A0_3843.on = {
    "Stop",
    A0_3843,
    BodyAttack.on_stop_fire
  }
  A0_3843.parent = A1_3844
end
function BodyAttack.class_get(A0_3846)
  local L1_3847
  L1_3847 = "BodyAttack"
  return L1_3847
end
function BodyAttack.interval_get(A0_3848)
  return rawget(A0_3848, "interval")
end
function BodyAttack.interval_set(A0_3849, A1_3850, A2_3851)
  A0_3849.tick_count = A2_3851
  rawset(A0_3849, "interval", A2_3851)
end
function BodyAttack.tick_count_get(A0_3852)
  return rawget(A0_3852, "tick_count") or 0
end
function BodyAttack.tick_count_set(A0_3853, A1_3854, A2_3855)
  rawset(A0_3853, "tick_count", A2_3855)
end
function BodyAttack.on_update_fire(A0_3856, A1_3857)
  local L2_3858, L3_3859, L4_3860, L5_3861, L6_3862, L7_3863, L8_3864, L9_3865, L10_3866, L11_3867, L12_3868, L13_3869
  L2_3858 = A0_3856.tick_count
  L2_3858 = L2_3858 + A1_3857
  A0_3856.tick_count = L2_3858
  L3_3859 = A0_3856.interval
  if L2_3858 < L3_3859 then
    return
  end
  L3_3859 = A0_3856.parent
  if not L3_3859 then
    return
  end
  L4_3860 = L3_3859.parent
  L4_3860 = L4_3860.parent
  if not L4_3860 then
    return
  end
  L5_3861 = L3_3859.status
  L6_3862 = STATUS_DIE
  if L5_3861 == L6_3862 then
    return
  end
  L5_3861 = L3_3859.proxy
  L5_3861 = L5_3861.render
  L7_3863 = L5_3861
  L6_3862 = L5_3861.ConvertToWorldSpace
  L8_3864 = L0_3837
  L6_3862 = L6_3862(L7_3863, L8_3864)
  L7_3863 = L6_3862.x
  L8_3864 = L6_3862.y
  if L7_3863 < 0 then
    L9_3865 = L1_3838
    L9_3865 = -L9_3865
    if L7_3863 < L9_3865 then
      return
    end
  end
  if L7_3863 > 0 then
    L9_3865 = L3_3840
    L10_3866 = L1_3838
    L9_3865 = L9_3865 + L10_3866
    if L7_3863 > L9_3865 then
      return
    end
  end
  if L8_3864 < 0 then
    L9_3865 = L2_3839
    L9_3865 = -L9_3865
    if L8_3864 < L9_3865 then
      return
    end
  end
  if L8_3864 > 0 then
    L9_3865 = L4_3841
    L10_3866 = L2_3839
    L9_3865 = L9_3865 + L10_3866
    if L8_3864 > L9_3865 then
      return
    end
  end
  L9_3865 = SessionObject
  L9_3865 = L9_3865.check_limit_status
  L10_3866 = L3_3859
  L11_3867 = "Attack"
  L9_3865 = L9_3865(L10_3866, L11_3867)
  if L9_3865 then
    return
  end
  L9_3865 = L3_3859.proxy
  L9_3865 = L9_3865.width
  L10_3866 = L3_3859.proxy
  L10_3866 = L10_3866.height
  L11_3867 = L3_3859.x
  L12_3868 = L3_3859.y
  L13_3869 = {
    L11_3867 - L9_3865 / 2,
    L11_3867 + L9_3865 / 2,
    L12_3868 + L10_3866 / 2,
    L12_3868 - L10_3866 / 2,
    L3_3859.hate_type
  }
  L4_3860.search_args = L13_3869
  L13_3869 = L4_3860.search
  if not L13_3869 then
    return
  end
  A0_3856.tick_count = Config.ZeroNumber
  L13_3869.under_attack = CalcDamage(L3_3859, L13_3869, L5_3842)
end
function BodyAttack.scheduler_get(A0_3870)
  return rawget(A0_3870, "scheduler")
end
function BodyAttack.scheduler_set(A0_3871, A1_3872, A2_3873)
  rawset(A0_3871, "scheduler", A2_3873)
end
function BodyAttack.on_start_fire(A0_3874)
  A0_3874.scheduler = SchedulerFunctor(A0_3874, BodyAttack.on_update_fire)
  Scheduler:Schedule(A0_3874.scheduler, 0.3)
end
function BodyAttack.on_stop_fire(A0_3875)
  local L1_3876
  L1_3876 = A0_3875.scheduler
  A0_3875.scheduler = nil
  Scheduler:Unschedule(L1_3876)
end
