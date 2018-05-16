Class.BottomWall.Foothold({})
function BottomWall.Constructor(A0_3877, A1_3878, A2_3879, A3_3880, A4_3881)
  Foothold.Constructor(A0_3877, A1_3878, A2_3879, A3_3880, A4_3881)
  A0_3877.type = WORLD_TYPE_WALL
end
function BottomWall.friction_get(A0_3882, A1_3883)
  local L2_3884
  L2_3884 = 0
  return L2_3884
end
function BottomWall.begin_contact(A0_3885, A1_3886)
  local L2_3887, L3_3888
  L2_3887 = A1_3886.parent
  L2_3887 = L2_3887.parent
  if not L2_3887 then
    return
  end
  L3_3888 = L2_3887.drop_point
  if not L3_3888 then
    return
  end
  A1_3886.reset_point = L3_3888
end
function BottomWall.class_get(A0_3889, A1_3890)
  local L2_3891
  L2_3891 = "BottomWall"
  return L2_3891
end
