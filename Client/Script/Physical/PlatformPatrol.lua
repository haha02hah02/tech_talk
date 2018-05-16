local L1_4841, L2_4842, L3_4843, L4_4844
L0_4840 = Class
L0_4840 = L0_4840.PlatformPatrol
L0_4840 = L0_4840.Component
L1_4841 = {}
L0_4840(L1_4841)
L0_4840 = Point
L1_4841 = 0
L2_4842 = 0
L0_4840 = L0_4840(L1_4841, L2_4842)
L1_4841 = Config
L1_4841 = L1_4841.ScreenWidth
L1_4841 = L1_4841 / 2
L2_4842 = Config
L2_4842 = L2_4842.ScreenHeight
L2_4842 = L2_4842 / 2
L3_4843 = Config
L3_4843 = L3_4843.ScreenWidth
L4_4844 = Config
L4_4844 = L4_4844.ScreenHeight
function PlatformPatrol.Constructor(A0_4845, A1_4846, A2_4847)
  Component.Constructor(A0_4845)
  if A2_4847.immoveable then
    return
  end
  A0_4845.name = "patrol"
  A0_4845.wait_time = 0
  A0_4845.direction = math.random(1, 2) == 1 and "left" or "right"
  A0_4845.on = {
    "Start",
    A0_4845,
    PlatformPatrol.on_start_fire
  }
  A0_4845.on = {
    "Stop",
    A0_4845,
    PlatformPatrol.on_stop_fire
  }
  A0_4845.parent = A1_4846
end
function PlatformPatrol.class_get(A0_4848, A1_4849)
  local L2_4850
  L2_4850 = "PlatformPatrol"
  return L2_4850
end
function PlatformPatrol.direction_get(A0_4851, A1_4852)
  return rawget(A0_4851, "direction")
end
function PlatformPatrol.direction_set(A0_4853, A1_4854, A2_4855)
  A2_4855 = A2_4855 == "right" and true or false
  if A0_4853.direction == A2_4855 then
    return
  end
  A0_4853.last_time = 0
  rawset(A0_4853, "direction", A2_4855)
end
function PlatformPatrol.last_x_get(A0_4856, A1_4857)
  return rawget(A0_4856, "last_x") or 0
end
function PlatformPatrol.last_x_set(A0_4858, A1_4859, A2_4860)
  rawset(A0_4858, "last_x", A2_4860)
end
function PlatformPatrol.last_y_get(A0_4861, A1_4862)
  return rawget(A0_4861, "last_y") or 0
end
function PlatformPatrol.last_y_set(A0_4863, A1_4864, A2_4865)
  rawset(A0_4863, "last_y", A2_4865)
end
function PlatformPatrol.last_time_get(A0_4866, A1_4867)
  return rawget(A0_4866, "last_time") or 0
end
function PlatformPatrol.last_time_set(A0_4868, A1_4869, A2_4870)
  rawset(A0_4868, "last_time", A2_4870)
end
function PlatformPatrol.walk_set(A0_4871, A1_4872, A2_4873)
  local L3_4874
  L3_4874 = Component
  L3_4874 = L3_4874.parent_get
  L3_4874 = L3_4874(A0_4871, "parent")
  if not L3_4874 then
    return
  end
  if A0_4871.last_time == 0 then
    A0_4871.last_x = L3_4874.x
    A0_4871.last_y = L3_4874.y
  end
  if A0_4871.last_time >= 1.0 then
    if A0_4871.last_x == L3_4874.x and A0_4871.last_y == L3_4874.y then
      A0_4871.direction = L3_4874.direction
    end
    A0_4871.last_time = 0
    A0_4871.last_x = L3_4874.x
    A0_4871.last_y = L3_4874.y
  end
  SessionObject[A0_4871.direction and "left_set" or "right_set"](L3_4874, "", true)
  if math.random(1, 10000) <= 20 then
    A0_4871.wait_time = 5.0
  end
end
function PlatformPatrol.wait_time(A0_4875, A1_4876)
  return rawget(A0_4875, "wait_time")
end
function PlatformPatrol.wait_time_set(A0_4877, A1_4878, A2_4879)
  rawset(A0_4877, "wait_time", A2_4879)
end
function PlatformPatrol.min_x_get(A0_4880, A1_4881)
  return rawget(A0_4880, "min_x")
end
function PlatformPatrol.min_x_set(A0_4882, A1_4883, A2_4884)
  rawset(A0_4882, "min_x", A2_4884)
end
function PlatformPatrol.max_x_get(A0_4885, A1_4886)
  return rawget(A0_4885, "max_x")
end
function PlatformPatrol.max_x_set(A0_4887, A1_4888, A2_4889)
  rawset(A0_4887, "max_x", A2_4889)
end
function PlatformPatrol.route_set(A0_4890, A1_4891, A2_4892)
  local L3_4893, L4_4894, L5_4895, L6_4896, L7_4897
  L3_4893 = A0_4890.min_x
  if L3_4893 then
    L3_4893 = A0_4890.max_x
    if L3_4893 then
      return
    end
  end
  L3_4893 = A2_4892.parent
  L4_4894 = L3_4893.child
  L5_4895 = A2_4892.stand
  L6_4896 = L4_4894[L5_4895]
  while L6_4896 ~= nil do
    L7_4897 = L6_4896.prev
    if L7_4897 == 0 or L6_4896.wall then
      A0_4890.min_x = math.min(L6_4896.x1, L6_4896.x2)
      break
    end
    L6_4896 = L4_4894[L7_4897]
  end
  L6_4896 = L4_4894[L5_4895]
  while L6_4896 ~= nil do
    L7_4897 = L6_4896.next
    if L7_4897 == 0 or L6_4896.wall then
      A0_4890.max_x = math.max(L6_4896.x1, L6_4896.x2)
      break
    end
    L6_4896 = L4_4894[L7_4897]
  end
end
function PlatformPatrol.check_direction(A0_4898, A1_4899, A2_4900, A3_4901)
  local L4_4902, L5_4903
  if A1_4899 == "prev" then
    L4_4902 = A3_4901.x
    L5_4903 = A3_4901.width
    L5_4903 = L5_4903 / 2
    L4_4902 = L4_4902 - L5_4903
    L4_4902 = L4_4902 - 5
    L5_4903 = A2_4900.center
    if L4_4902 <= L5_4903 then
      L5_4903 = "left"
    else
      L5_4903 = L5_4903 or "right"
    end
    return L5_4903
  else
    L4_4902 = A3_4901.x
    L5_4903 = A3_4901.width
    L5_4903 = L5_4903 / 2
    L4_4902 = L4_4902 + L5_4903
    L4_4902 = L4_4902 + 5
    L5_4903 = A2_4900.center
    if L4_4902 >= L5_4903 then
      L5_4903 = "right"
    else
      L5_4903 = L5_4903 or "left"
    end
    return L5_4903
  end
end
function PlatformPatrol.check_hatred_set(A0_4904)
  local L1_4905, L2_4906, L3_4907, L4_4908
  L1_4905 = Component
  L1_4905 = L1_4905.parent_get
  L2_4906 = A0_4904
  L3_4907 = "parent"
  L1_4905 = L1_4905(L2_4906, L3_4907)
  L2_4906 = Component
  L2_4906 = L2_4906.parent_get
  L3_4907 = L1_4905
  L4_4908 = "parent"
  L2_4906 = L2_4906(L3_4907, L4_4908)
  if not L2_4906 then
    return
  end
  L3_4907 = Component
  L3_4907 = L3_4907.parent_get
  L4_4908 = L2_4906
  L3_4907 = L3_4907(L4_4908, "parent")
  if not L3_4907 then
    return
  end
  L4_4908 = L2_4906.child
  L4_4908 = L4_4908.all
  L4_4908 = L4_4908[L3_4907.focus_object]
  if not L4_4908 or not L4_4908.catchable or L4_4908.status == STATUS_DIE then
    return
  end
  if SessionObject.y_get(L4_4908) - L4_4908.height / 2 > SessionObject.y_get(L1_4905) + L1_4905.height / 2 then
    return
  end
  if SessionObject.y_get(L4_4908) + L4_4908.height / 2 < SessionObject.y_get(L1_4905) - L1_4905.height / 2 then
    return
  end
  if L4_4908.x - L4_4908.width / 2 < A0_4904.min_x then
    return
  end
  if L4_4908.x + L4_4908.width / 2 > A0_4904.max_x then
    return
  end
  A0_4904.direction = SessionObject.x_get(L1_4905) + (L1_4905.direction == "left" and L1_4905.width / 2 or -L1_4905.width / 2) - L4_4908.x > 0 and "right" or "left"
end
function PlatformPatrol.on_update_fire(A0_4909, A1_4910, A2_4911)
  local L3_4912
  L3_4912 = Component
  L3_4912 = L3_4912.parent_get
  L3_4912 = L3_4912(A0_4909, "parent")
  if not L3_4912 then
    return
  end
  if not L3_4912.proxy.child.all.name_tag.visible and A0_4909.wait_time ~= 0 then
    A0_4909.wait_time = math.max(0, A0_4909.wait_time - A2_4911)
    return
  end
  A0_4909.last_time = A0_4909.last_time + A2_4911
  if not Component.parent_get(L3_4912, "parent") then
    return
  end
  if not L3_4912.stand then
    return
  end
  if 0 > L3_4912.proxy.render:ConvertToWorldSpace(L0_4840).x and L3_4912.proxy.render:ConvertToWorldSpace(L0_4840).x < -L1_4841 then
    return
  end
  if 0 < L3_4912.proxy.render:ConvertToWorldSpace(L0_4840).x and L3_4912.proxy.render:ConvertToWorldSpace(L0_4840).x > L3_4843 + L1_4841 then
    return
  end
  if 0 > L3_4912.proxy.render:ConvertToWorldSpace(L0_4840).y and L3_4912.proxy.render:ConvertToWorldSpace(L0_4840).y < -L2_4842 then
    return
  end
  if 0 < L3_4912.proxy.render:ConvertToWorldSpace(L0_4840).y and L3_4912.proxy.render:ConvertToWorldSpace(L0_4840).y > L4_4844 + L2_4842 then
    return
  end
  PlatformPatrol.walk_set(A0_4909)
  PlatformPatrol.route_set(A0_4909, "route", L3_4912)
  if L3_4912.proxy.child.all.name_tag.visible then
    PlatformPatrol.check_hatred_set(A0_4909)
  end
  if A0_4909.min_x >= SessionObject.x_get(L3_4912) + (L3_4912.direction == "left" and -L3_4912.width / 2.2 or L3_4912.width / 2.2) then
    if math.abs(SessionObject.x_get(L3_4912) + (L3_4912.direction == "left" and -L3_4912.width / 2.2 or L3_4912.width / 2.2) - A0_4909.min_x) > L3_4912.width / 2 then
      A0_4909.min_x = nil
      A0_4909.max_x = nil
    end
    PlatformPatrol.direction_set(A0_4909, "direction", "left")
    return
  end
  if A0_4909.max_x <= SessionObject.x_get(L3_4912) + (L3_4912.direction == "left" and -L3_4912.width / 2.2 or L3_4912.width / 2.2) then
    if math.abs(SessionObject.x_get(L3_4912) + (L3_4912.direction == "left" and -L3_4912.width / 2.2 or L3_4912.width / 2.2) - A0_4909.min_x) > L3_4912.width / 2 then
      A0_4909.min_x = nil
      A0_4909.max_x = nil
    end
    PlatformPatrol.direction_set(A0_4909, "direction", "right")
    return
  end
end
function PlatformPatrol.on_start_fire(A0_4913)
  local L1_4914
  L1_4914 = A0_4913.parent
  if not L1_4914 then
    return
  end
  L1_4914.on = {
    "Update",
    A0_4913,
    PlatformPatrol.on_update_fire
  }
end
function PlatformPatrol.on_stop_fire(A0_4915)
  local L1_4916
  L1_4916 = A0_4915.parent
  if not L1_4916 then
    return
  end
  L1_4916.off = {
    "Update",
    A0_4915,
    PlatformPatrol.on_update_fire
  }
end
