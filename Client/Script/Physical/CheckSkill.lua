local L1_3893, L2_3894, L3_3895, L4_3896
L0_3892 = Class
L0_3892 = L0_3892.CheckSkill
L0_3892 = L0_3892.Component
L1_3893 = {}
L0_3892(L1_3893)
L0_3892 = Point
L1_3893 = 0
L2_3894 = 0
L0_3892 = L0_3892(L1_3893, L2_3894)
L1_3893 = Config
L1_3893 = L1_3893.ScreenWidth
L1_3893 = L1_3893 / 2
L2_3894 = Config
L2_3894 = L2_3894.ScreenHeight
L2_3894 = L2_3894 / 2
L3_3895 = Config
L3_3895 = L3_3895.ScreenWidth
L4_3896 = Config
L4_3896 = L4_3896.ScreenHeight
function CheckSkill.Constructor(A0_3897, A1_3898, A2_3899)
  local L3_3900, L4_3901, L5_3902, L6_3903, L7_3904
  L3_3900(L4_3901)
  if not L3_3900 then
    return
  end
  A0_3897.name = "check_skill"
  L6_3903 = CheckSkill
  L6_3903 = L6_3903.on_start_fire
  A0_3897.on = L3_3900
  L6_3903 = CheckSkill
  L6_3903 = L6_3903.on_stop_fire
  A0_3897.on = L3_3900
  A0_3897.parent = A1_3898
  for L6_3903, L7_3904 in L3_3900(L4_3901) do
    L7_3904.value.priority = L7_3904.priority or 0
    L7_3904.value.critical_unable = true
    for _FORV_12_, _FORV_13_ in pairs(L7_3904) do
      if _FORV_12_ ~= "value" then
        L7_3904.value[_FORV_12_] = _FORV_13_
      end
    end
  end
  for L6_3903, L7_3904 in L3_3900(L4_3901) do
    A1_3898.skill = CastSkill(A1_3898, L6_3903, L7_3904.value)
  end
end
function CheckSkill.class_get(A0_3905, A1_3906)
  local L2_3907
  L2_3907 = "CheckSkill"
  return L2_3907
end
function CheckSkill.on_update_fire(A0_3908, A1_3909, A2_3910)
  local L3_3911, L4_3912, L5_3913, L6_3914, L7_3915, L8_3916, L9_3917, L10_3918
  L3_3911 = A0_3908.parent
  if not L3_3911 then
    return
  end
  L4_3912 = L3_3911.proxy
  L4_3912 = L4_3912.child
  L4_3912 = L4_3912.all
  L4_3912 = L4_3912.name_tag
  L4_3912 = L4_3912.visible
  if not L4_3912 then
    return
  end
  L5_3913 = L3_3911.proxy
  L5_3913 = L5_3913.render
  L7_3915 = L5_3913
  L6_3914 = L5_3913.ConvertToWorldSpace
  L8_3916 = L0_3892
  L6_3914 = L6_3914(L7_3915, L8_3916)
  L7_3915 = L6_3914.x
  L8_3916 = L6_3914.y
  if L7_3915 < 0 then
    L9_3917 = L1_3893
    L9_3917 = -L9_3917
    if L7_3915 < L9_3917 then
      return
    end
  end
  if L7_3915 > 0 then
    L9_3917 = L3_3895
    L10_3918 = L1_3893
    L9_3917 = L9_3917 + L10_3918
    if L7_3915 > L9_3917 then
      return
    end
  end
  if L8_3916 < 0 then
    L9_3917 = L2_3894
    L9_3917 = -L9_3917
    if L8_3916 < L9_3917 then
      return
    end
  end
  if L8_3916 > 0 then
    L9_3917 = L4_3896
    L10_3918 = L2_3894
    L9_3917 = L9_3917 + L10_3918
    if L8_3916 > L9_3917 then
      return
    end
  end
  L9_3917 = L3_3911.skills
  L10_3918 = nil
  for _FORV_14_, _FORV_15_ in ipairs(L9_3917) do
    if _FORV_15_.check then
      L10_3918 = _FORV_15_
      break
    end
  end
  if L10_3918 then
    L10_3918.cast = L3_3911
  end
end
function CheckSkill.scheduler_get(A0_3919)
  return rawget(A0_3919, "scheduler")
end
function CheckSkill.scheduler_set(A0_3920, A1_3921, A2_3922)
  rawset(A0_3920, "scheduler", A2_3922)
end
function CheckSkill.on_start_fire(A0_3923)
  if not A0_3923.parent then
    return
  end
  A0_3923.scheduler = SchedulerFunctor(A0_3923, CheckSkill.on_update_fire)
  Scheduler:Schedule(A0_3923.scheduler, 0.5)
end
function CheckSkill.on_stop_fire(A0_3924)
  local L1_3925, L2_3926
  L1_3925 = A0_3924.parent
  if not L1_3925 then
    return
  end
  L2_3926 = A0_3924.scheduler
  A0_3924.scheduler = nil
  Scheduler:Unschedule(L2_3926)
end
