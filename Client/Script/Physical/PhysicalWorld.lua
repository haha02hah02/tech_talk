local L1_4713, L2_4714
L0_4712 = Class
L0_4712 = L0_4712.PhysicalWorld
L0_4712 = L0_4712.Component
L1_4713 = {}
L0_4712(L1_4713)
L0_4712 = PhysicalWorld
function L1_4713(A0_4715, A1_4716, A2_4717, A3_4718, A4_4719)
  local L5_4720, L6_4721
  L5_4720 = Component
  L5_4720 = L5_4720.Constructor
  L6_4721 = A0_4715
  L5_4720(L6_4721)
  L5_4720 = A3_4718 or 0
  L6_4721 = A4_4719 or -10
  A0_4715.width = math.abs(A1_4716)
  A0_4715.height = math.abs(A2_4717)
  A0_4715.world = b2World(b2Vec2(L5_4720, L6_4721))
  A0_4715.aabb = b2AABB()
  A0_4715.on = {
    "Start",
    A0_4715,
    PhysicalWorld.on_start_set
  }
  A0_4715.on = {
    "Stop",
    A0_4715,
    PhysicalWorld.on_stop_set
  }
  A0_4715.world:SetContinuousPhysics(true)
end
L0_4712.Constructor = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4722)
  local L1_4723
  L1_4723 = "PhysicalWorld"
  return L1_4723
end
L0_4712.class_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4724, A1_4725)
  return rawget(A0_4724, "width")
end
L0_4712.width_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4726, A1_4727, A2_4728)
  rawset(A0_4726, "width", A2_4728)
end
L0_4712.width_set = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4729, A1_4730)
  return rawget(A0_4729, "height")
end
L0_4712.height_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4731, A1_4732, A2_4733)
  rawset(A0_4731, "height", A2_4733)
end
L0_4712.height_set = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4734, A1_4735, A2_4736)
  return rawget(A0_4734, "swim")
end
L0_4712.swim_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4737, A1_4738, A2_4739)
  rawset(A0_4737, "swim", A2_4739)
end
L0_4712.swim_set = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4740, A1_4741)
  return rawget(A0_4740, "aabb")
end
L0_4712.aabb_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4742, A1_4743, A2_4744)
  rawset(A0_4742, "aabb", A2_4744)
end
L0_4712.aabb_set = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4745, A1_4746)
  return rawget(A0_4745, "contact_listener")
end
L0_4712.contact_listener_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4747, A1_4748, A2_4749)
  rawset(A0_4747, "contact_listener", A2_4749)
end
L0_4712.contact_listener_set = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4750, A1_4751)
  return rawget(A0_4750, "contact_filter")
end
L0_4712.contact_filter_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4752, A1_4753, A2_4754)
  rawset(A0_4752, "contact_filter", A2_4754)
end
L0_4712.contact_filter_set = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4755, A1_4756)
  return rawget(A0_4755, "object_query")
end
L0_4712.object_query_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4757, A1_4758, A2_4759)
  return rawset(A0_4757, "object_query", A2_4759)
end
L0_4712.object_query_set = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4760, A1_4761)
end
L0_4712.on_object_query_set = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4762, A1_4763)
  return rawget(A0_4762, "world")
end
L0_4712.world_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4764, A1_4765, A2_4766)
  rawset(A0_4764, "world", A2_4766)
end
L0_4712.world_set = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4767, A1_4768)
  return rawget(A0_4767, "update_time") or 0
end
L0_4712.update_time_get = L1_4713
L0_4712 = PhysicalWorld
function L1_4713(A0_4769, A1_4770, A2_4771)
  rawset(A0_4769, "update_time", A2_4771)
end
L0_4712.update_time_set = L1_4713
L0_4712 = {}
L0_4712[1] = "Update"
L1_4713 = 0.03333333333333333
L2_4714 = PhysicalWorld
function L2_4714.update_set(A0_4772, A1_4773, A2_4774)
  A0_4772.world:Step(A2_4774, 2, 2)
  L0_4712[2] = A2_4774
  A0_4772.fire = L0_4712
end
L2_4714 = PhysicalWorld
function L2_4714.on_start_set(A0_4775)
  A0_4775.contact_listener = Box2DContactListener(A0_4775, PhysicalWorld.begin_contact_set, PhysicalWorld.end_contact_set, PhysicalWorld.pre_solve_set, PhysicalWorld.post_solve_set)
  A0_4775.object_query = Box2DQuery(A0_4775, PhysicalWorld.on_object_query_set)
  A0_4775.world:SetContactListener(A0_4775.contact_listener)
end
L2_4714 = PhysicalWorld
function L2_4714.on_stop_set(A0_4776)
  A0_4776.contact_listener = nil
  A0_4776.object_query = nil
  A0_4776.world:SetContactListener(nil)
end
L2_4714 = PhysicalWorld
function L2_4714.portals_set(A0_4777, A1_4778, A2_4779)
  for _FORV_6_, _FORV_7_ in pairs(A2_4779) do
    Portal(60, 60, _FORV_7_.x, _FORV_7_.y).name = _FORV_6_
    Portal(60, 60, _FORV_7_.x, _FORV_7_.y).tn = _FORV_7_.tn
    Portal(60, 60, _FORV_7_.x, _FORV_7_.y).pt = _FORV_7_.pt
    Portal(60, 60, _FORV_7_.x, _FORV_7_.y).tm = _FORV_7_.tm
    Portal(60, 60, _FORV_7_.x, _FORV_7_.y).script = _FORV_7_.script
    Portal(60, 60, _FORV_7_.x, _FORV_7_.y).script_arg = _FORV_7_.script_arg
    Portal(60, 60, _FORV_7_.x, _FORV_7_.y).parent = A0_4777
  end
end
L2_4714 = PhysicalWorld
function L2_4714.ladders_set(A0_4780, A1_4781, A2_4782)
  for _FORV_6_, _FORV_7_ in pairs(A2_4782) do
    Ladder(_FORV_7_.x, _FORV_7_.x, _FORV_7_.y1, _FORV_7_.y2, _FORV_7_.l ~= 1).name = _FORV_6_ | 4096
    Ladder(_FORV_7_.x, _FORV_7_.x, _FORV_7_.y1, _FORV_7_.y2, _FORV_7_.l ~= 1).layer = _FORV_7_.page
    Ladder(_FORV_7_.x, _FORV_7_.x, _FORV_7_.y1, _FORV_7_.y2, _FORV_7_.l ~= 1).uf = _FORV_7_.uf
    Ladder(_FORV_7_.x, _FORV_7_.x, _FORV_7_.y1, _FORV_7_.y2, _FORV_7_.l ~= 1).parent = A0_4780
  end
end
L2_4714 = PhysicalWorld
function L2_4714.foothold_set(A0_4783, A1_4784, A2_4785, A3_4786)
  Foothold(A3_4786.x1, A3_4786.x2, A3_4786.y1, A3_4786.y2).name = A2_4785
  Foothold(A3_4786.x1, A3_4786.x2, A3_4786.y1, A3_4786.y2).layer = A3_4786.layer
  Foothold(A3_4786.x1, A3_4786.x2, A3_4786.y1, A3_4786.y2).prev = A3_4786.prev
  Foothold(A3_4786.x1, A3_4786.x2, A3_4786.y1, A3_4786.y2).next = A3_4786.next
  Foothold(A3_4786.x1, A3_4786.x2, A3_4786.y1, A3_4786.y2).parent = A0_4783
end
L2_4714 = PhysicalWorld
function L2_4714.footholds_set(A0_4787, A1_4788, A2_4789)
  local L3_4790, L4_4791, L5_4792, L6_4793, L7_4794, L8_4795, L9_4796, L10_4797
  for L6_4793, L7_4794 in L3_4790(L4_4791) do
    L8_4795 = L7_4794.ignore
    if not L8_4795 then
      L8_4795 = {L9_4796, L10_4797}
      L9_4796 = L6_4793
      L10_4797 = L7_4794
      A0_4787.foothold = L8_4795
    end
  end
  L6_4793 = A0_4787.height
  L7_4794 = -L5_4792
  L7_4794 = L7_4794 - 1
  L7_4794 = L7_4794 / 2
  L7_4794 = L7_4794 + L3_4790
  L8_4795 = L5_4792 + 1
  L8_4795 = L8_4795 / 2
  L8_4795 = L8_4795 + L3_4790
  L9_4796 = L6_4793 + 1
  L9_4796 = L9_4796 / 2
  L9_4796 = L9_4796 + L4_4791
  L9_4796 = L9_4796 + 200
  L10_4797 = L6_4793 + 1
  L10_4797 = L10_4797 / 2
  L10_4797 = L10_4797 + L4_4791
  L10_4797 = L10_4797 + 200
  Wall(L7_4794, L8_4795, L9_4796, L10_4797).name = #A2_4789 + 1
  Wall(L7_4794, L8_4795, L9_4796, L10_4797).parent = A0_4787
  L7_4794 = (-L5_4792 - 1) / 2 + L3_4790
  L8_4795 = (L5_4792 + 1) / 2 + L3_4790
  L9_4796 = (-L6_4793 - 1) / 2 + L4_4791
  L10_4797 = (-L6_4793 - 1) / 2 + L4_4791
  BottomWall(L7_4794, L8_4795, L9_4796, L10_4797).name = #A2_4789 + 2
  BottomWall(L7_4794, L8_4795, L9_4796, L10_4797).parent = A0_4787
  L7_4794 = (-L5_4792 - 1) / 2 + L3_4790
  L8_4795 = (-L5_4792 - 1) / 2 + L3_4790
  L9_4796 = (L6_4793 + 1) / 2 + L4_4791 + 200
  L10_4797 = (-L6_4793 - 1) / 2 + L4_4791
  EdgeWall(L7_4794, L8_4795, L9_4796, L10_4797).name = #A2_4789 + 3
  EdgeWall(L7_4794, L8_4795, L9_4796, L10_4797).parent = A0_4787
  L7_4794 = (L5_4792 + 1) / 2 + L3_4790
  L8_4795 = (L5_4792 + 1) / 2 + L3_4790
  L9_4796 = (L6_4793 + 1) / 2 + L4_4791 + 200
  L10_4797 = (-L6_4793 - 1) / 2 + L4_4791
  EdgeWall(L7_4794, L8_4795, L9_4796, L10_4797).name = #A2_4789 + 4
  EdgeWall(L7_4794, L8_4795, L9_4796, L10_4797).parent = A0_4787
end
L2_4714 = PhysicalWorld
function L2_4714.begin_contact_set(A0_4798, A1_4799)
  local L2_4800, L3_4801, L4_4802, L5_4803, L6_4804, L7_4805
  L3_4801 = A1_4799
  L2_4800 = A1_4799.GetFixtureA
  L2_4800 = L2_4800(L3_4801)
  L4_4802 = A1_4799
  L3_4801 = A1_4799.GetFixtureB
  L3_4801 = L3_4801(L4_4802)
  L5_4803 = L2_4800
  L4_4802 = L2_4800.GetBody
  L4_4802 = L4_4802(L5_4803)
  L5_4803 = L4_4802
  L4_4802 = L4_4802.GetUserData
  L4_4802 = L4_4802(L5_4803)
  L6_4804 = L3_4801
  L5_4803 = L3_4801.GetBody
  L5_4803 = L5_4803(L6_4804)
  L6_4804 = L5_4803
  L5_4803 = L5_4803.GetUserData
  L5_4803 = L5_4803(L6_4804)
  if not L4_4802 or not L5_4803 then
    return
  end
  L6_4804 = getmetatable
  L7_4805 = L4_4802
  L6_4804 = L6_4804(L7_4805)
  L6_4804 = L6_4804.begin_contact
  L7_4805 = getmetatable
  L7_4805 = L7_4805(L5_4803)
  L7_4805 = L7_4805.begin_contact
  if L6_4804 then
    L6_4804(L4_4802, L5_4803)
  end
  if L7_4805 then
    L7_4805(L5_4803, L4_4802)
  end
end
L2_4714 = PhysicalWorld
function L2_4714.end_contact_set(A0_4806, A1_4807)
  local L2_4808, L3_4809, L4_4810, L5_4811, L6_4812, L7_4813
  L3_4809 = A1_4807
  L2_4808 = A1_4807.GetFixtureA
  L2_4808 = L2_4808(L3_4809)
  L4_4810 = A1_4807
  L3_4809 = A1_4807.GetFixtureB
  L3_4809 = L3_4809(L4_4810)
  L5_4811 = L2_4808
  L4_4810 = L2_4808.GetBody
  L4_4810 = L4_4810(L5_4811)
  L5_4811 = L4_4810
  L4_4810 = L4_4810.GetUserData
  L4_4810 = L4_4810(L5_4811)
  L6_4812 = L3_4809
  L5_4811 = L3_4809.GetBody
  L5_4811 = L5_4811(L6_4812)
  L6_4812 = L5_4811
  L5_4811 = L5_4811.GetUserData
  L5_4811 = L5_4811(L6_4812)
  if not L4_4810 or not L5_4811 then
    return
  end
  L6_4812 = getmetatable
  L7_4813 = L4_4810
  L6_4812 = L6_4812(L7_4813)
  L6_4812 = L6_4812.end_contact
  L7_4813 = getmetatable
  L7_4813 = L7_4813(L5_4811)
  L7_4813 = L7_4813.end_contact
  if L6_4812 then
    L6_4812(L4_4810, L5_4811)
  end
  if L7_4813 then
    L7_4813(L5_4811, L4_4810)
  end
end
L2_4714 = PhysicalWorld
function L2_4714.is_same_platform(A0_4814, A1_4815, A2_4816)
  local L3_4817, L4_4818, L5_4819, L6_4820, L7_4821, L8_4822, L9_4823, L10_4824, L11_4825
  if not A1_4815 or not A2_4816 then
    return
  end
  L3_4817 = A2_4816.stand
  L4_4818 = A1_4815.name
  if not L3_4817 then
    return
  end
  if L4_4818 == L3_4817 then
    L5_4819 = true
    return L5_4819
  end
  L5_4819 = A1_4815.parent
  L5_4819 = L5_4819.child
  L5_4819 = L5_4819.all
  L6_4820 = L5_4819[L3_4817]
  if not L6_4820 then
    return
  end
  L7_4821 = A1_4815.center
  L8_4822 = 0
  L9_4823 = L6_4820.center
  L9_4823 = L7_4821 - L9_4823
  if L9_4823 < 0 then
    L9_4823 = "prev"
  else
    L9_4823 = L9_4823 or "next"
  end
  L10_4824 = L6_4820.center
  if L7_4821 < L10_4824 then
    repeat
      L10_4824 = L6_4820.name
      if L10_4824 == L4_4818 then
        L10_4824 = true
        return L10_4824
      end
      L10_4824 = L6_4820.prev
      if L10_4824 == L4_4818 then
        L11_4825 = true
        return L11_4825
      end
      L6_4820 = L5_4819[L10_4824]
      L8_4822 = L8_4822 + 1
      if not (L8_4822 > 4) and L6_4820 ~= nil then
        L11_4825 = L6_4820.center
      end
    until L7_4821 > L11_4825
    return
  end
  repeat
    L10_4824 = L6_4820.name
    if L10_4824 == L4_4818 then
      L10_4824 = true
      return L10_4824
    end
    L10_4824 = L6_4820.next
    if L10_4824 == L4_4818 then
      L11_4825 = true
      return L11_4825
    end
    L6_4820 = L5_4819[L10_4824]
    L8_4822 = L8_4822 + 1
    if not (L8_4822 > 4) and L6_4820 ~= nil then
      L11_4825 = L6_4820.center
    end
  until L7_4821 < L11_4825
end
L2_4714 = PhysicalWorld
L2_4714 = L2_4714.is_same_platform
function PhysicalWorld.pre_solve_set(A0_4826, A1_4827, A2_4828)
  local L3_4829, L4_4830, L5_4831, L6_4832, L7_4833, L8_4834
  L4_4830 = A1_4827
  L3_4829 = A1_4827.GetFixtureA
  L3_4829 = L3_4829(L4_4830)
  L5_4831 = A1_4827
  L4_4830 = A1_4827.GetFixtureB
  L4_4830 = L4_4830(L5_4831)
  L6_4832 = L3_4829
  L5_4831 = L3_4829.GetFilterData
  L5_4831 = L5_4831(L6_4832)
  L5_4831 = L5_4831.categoryBits
  L7_4833 = L4_4830
  L6_4832 = L4_4830.GetFilterData
  L6_4832 = L6_4832(L7_4833)
  L6_4832 = L6_4832.categoryBits
  L7_4833, L8_4834 = nil, nil
  if L5_4831 & WORLD_TYPE_FOOTHOLD ~= 0 then
    L7_4833 = L3_4829:GetBody():GetUserData()
    L8_4834 = L4_4830:GetBody():GetUserData()
  elseif L6_4832 & WORLD_TYPE_FOOTHOLD ~= 0 then
    L7_4833 = L4_4830:GetBody():GetUserData()
    L8_4834 = L3_4829:GetBody():GetUserData()
  else
    return
  end
  if L2_4714(A0_4826, L7_4833, L8_4834) then
    Foothold.begin_contact_set(L7_4833, "", L8_4834)
    return
  end
  if L8_4834.status == STATUS_STAND or L8_4834.status == STATUS_WALK or L8_4834.status == STATUS_JUMP or L7_4833.wall then
    A1_4827:SetEnabled(false)
    return
  end
  if L7_4833.y1 + L7_4833.height * (L7_4833.y1 < L7_4833.y2 and (SessionObject.x_get(L8_4834) - L7_4833.min_x) / L7_4833.width or -((SessionObject.x_get(L8_4834) - L7_4833.min_x) / L7_4833.width)) > SessionObject.bottom_get(L8_4834) then
    A1_4827:SetEnabled(false)
    return
  end
  Foothold.begin_contact_set(L7_4833, "", L8_4834)
end
function PhysicalWorld.post_solve_set(A0_4835, A1_4836, A2_4837)
end
function PhysicalWorld.Destructor(A0_4838)
  local L1_4839
end
