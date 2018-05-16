Class.CastAction.Component({})
function CastAction.Constructor(A0_7790, A1_7791, A2_7792)
  Component.Constructor(A0_7790)
  A0_7790.name = "cast_action"
  A0_7790.on = {
    "Parent",
    A0_7790,
    CastAction.on_set_parent_fire
  }
end
function CastAction.class_get(A0_7793)
  local L1_7794
  L1_7794 = "CastAction"
  return L1_7794
end
function CastAction.action_index_get(A0_7795)
  return rawget(A0_7795, "action_index") or 1
end
function CastAction.action_index_set(A0_7796, A1_7797, A2_7798)
  rawset(A0_7796, "action_index", A2_7798)
end
function CastAction.tarray_get(A0_7799)
  return rawget(A0_7799, "tarray")
end
function CastAction.tarray_set(A0_7800, A1_7801, A2_7802)
  rawset(A0_7800, "tarray", A2_7802)
end
function CastAction.taction_get(A0_7803)
  return rawget(A0_7803, "taction")
end
function CastAction.taction_set(A0_7804, A1_7805, A2_7806)
  rawset(A0_7804, "taction", A2_7806)
end
function CastAction.action_get(A0_7807)
  local L1_7808
  L1_7808 = A0_7807.taction
  if not L1_7808 then
    return
  end
  if type(L1_7808) ~= "table" then
    return L1_7808
  end
  if A0_7807.action_index > #L1_7808 then
  end
  A0_7807.action_index = (1 or A0_7807.action_index) + 1 > #L1_7808 and 1 or (1 or A0_7807.action_index) + 1
  return L1_7808[1 or A0_7807.action_index]
end
function CastAction.execute(A0_7809)
  local L1_7810
  L1_7810 = A0_7809.parent
  if L1_7810 then
    L1_7810.fire = "execute"
  end
end
function CastAction.finish(A0_7811)
  local L1_7812
  L1_7812 = A0_7811.parent
  if not L1_7812 then
    return
  end
  L1_7812.finish = true
end
function CastAction.make_action(A0_7813, A1_7814, A2_7815, A3_7816)
  local L4_7817, L5_7818, L6_7819, L7_7820, L8_7821, L9_7822, L10_7823, L11_7824
  L4_7817 = A1_7814.proxy
  L5_7818 = L4_7817.actions
  L5_7818 = L5_7818[A2_7815]
  if not L5_7818 then
    return
  end
  L6_7819 = Array
  L6_7819 = L6_7819()
  for L10_7823 = 0, L8_7821 - 1 do
    L11_7824 = A3_7816 - 1
    if L10_7823 == L11_7824 then
      L11_7824 = L6_7819.AddObject
      L11_7824(L6_7819, ActionInstant(Functor(A0_7813, CastAction.execute)))
    end
    L11_7824 = L5_7818.ObjectAtIndex
    L11_7824 = L11_7824(L5_7818, L10_7823)
    L11_7824:SetTag(0)
    L6_7819:AddObject(L11_7824)
  end
  L10_7823 = Functor
  L11_7824 = A0_7813
  L11_7824 = L10_7823(L11_7824, CastAction.finish)
  L11_7824 = L9_7822(L10_7823, L11_7824, L10_7823(L11_7824, CastAction.finish))
  L7_7820(L8_7821, L9_7822, L10_7823, L11_7824, L9_7822(L10_7823, L11_7824, L10_7823(L11_7824, CastAction.finish)))
  return L6_7819
end
function CastAction.make_set(A0_7825, A1_7826, A2_7827)
  local L3_7828, L4_7829, L5_7830, L6_7831, L7_7832, L8_7833, L9_7834, L10_7835, L11_7836, L12_7837, L13_7838, L14_7839
  L3_7828 = A0_7825.parent
  if not L3_7828 then
    return
  end
  L4_7829 = L3_7828.info
  L5_7830 = L4_7829.action
  if not L5_7830 then
    return
  end
  L5_7830 = type
  L6_7831 = L4_7829.action
  L5_7830 = L5_7830(L6_7831)
  if L5_7830 ~= "table" then
    L6_7831 = CastAction
    L6_7831 = L6_7831.make_action
    L7_7832 = A0_7825
    L6_7831 = L6_7831(L7_7832, L8_7833, L9_7834, L10_7835)
    if L6_7831 then
      A0_7825.tarray = L6_7831
      L7_7832 = Sequence
      L7_7832 = L7_7832(L8_7833)
      A0_7825.taction = L7_7832
    end
    return
  end
  L6_7831 = {}
  L7_7832 = {}
  for L11_7836, L12_7837 in L8_7833(L9_7834) do
    L13_7838 = type
    L14_7839 = L4_7829.action_frame
    L13_7838 = L13_7838(L14_7839)
    if L13_7838 == "table" then
      L13_7838 = L4_7829.action_frame
      L13_7838 = L13_7838[L11_7836]
    else
      L13_7838 = L13_7838 or L4_7829.action_frame
    end
    L14_7839 = CastAction
    L14_7839 = L14_7839.make_action
    L14_7839 = L14_7839(A0_7825, A2_7827, L12_7837, L13_7838)
    if L14_7839 then
      table.insert(L7_7832, L14_7839)
      table.insert(L6_7831, Sequence(L14_7839))
    end
  end
  A0_7825.tarray = L8_7833
  A0_7825.taction = L8_7833
end
function CastAction.attach_set(A0_7840, A1_7841, A2_7842)
  local L3_7843
  L3_7843 = A2_7842.proxy
  L3_7843.action = A0_7840.action
end
function CastAction.on_skill_cast_fire(A0_7844)
  local L1_7845, L2_7846
  L1_7845 = A0_7844.parent
  if not L1_7845 then
    return
  end
  L2_7846 = L1_7845.parent
  if not L2_7846 then
    return
  end
  A0_7844.attach = L2_7846
end
function CastAction.on_skill_interrupt_fire(A0_7847)
  local L1_7848
  L1_7848 = A0_7847.parent
  if not L1_7848 then
    return
  end
  if not L1_7848.parent then
    return
  end
end
function CastAction.action_dexterity_set(A0_7849, A1_7850, A2_7851, A3_7852)
  local L4_7853, L5_7854, L6_7855, L7_7856, L8_7857
  L4_7853 = 0
  for L8_7857 = 0, L6_7855 - 1 do
    if A2_7851:ObjectAtIndex(L8_7857):Tag() == 0 then
      L4_7853 = L4_7853 + 1
    end
  end
  for L8_7857 = 0, L6_7855 - 1 do
    if A2_7851:ObjectAtIndex(L8_7857):Tag() == 0 then
      A2_7851:ObjectAtIndex(L8_7857):SetDuration(A3_7852 / L4_7853)
    end
  end
end
function CastAction.on_dexterity_fire(A0_7858)
  local L1_7859, L2_7860, L3_7861, L4_7862, L5_7863, L6_7864, L7_7865, L8_7866, L9_7867
  L1_7859 = A0_7858.parent
  if not L1_7859 then
    return
  end
  L2_7860 = L1_7859.parent
  if not L2_7860 then
    return
  end
  L3_7861 = A0_7858.tarray
  if not L3_7861 then
    return
  end
  L4_7862 = A0_7858.taction
  if L5_7863 ~= "table" then
    A0_7858.action_dexterity = L5_7863
    A0_7858.taction = L5_7863
    return
  end
  for L8_7866, L9_7867 in L5_7863(L6_7864) do
    A0_7858.action_dexterity = {
      L9_7867,
      L2_7860.data.attack_intervel
    }
    L4_7862[L8_7866] = Sequence(L9_7867)
  end
end
function CastAction.on_set_parent_fire(A0_7868)
  local L1_7869, L2_7870
  L1_7869 = A0_7868.parent
  if not L1_7869 then
    return
  end
  L2_7870 = L1_7869.parent
  A0_7868.make = L2_7870
  L2_7870 = {
    "cast",
    A0_7868,
    CastAction.on_skill_cast_fire
  }
  L1_7869.on = L2_7870
  L2_7870 = {
    "interrupt",
    A0_7868,
    CastAction.on_skill_interrupt_fire
  }
  L1_7869.on = L2_7870
  L2_7870 = L1_7869.info
  L2_7870 = L2_7870.dexterity_action
  if not L2_7870 then
    return
  end
  L2_7870 = L1_7869.parent
  if not L2_7870 then
    return
  end
  CastAction.on_dexterity_fire(A0_7868)
  L2_7870.data.on = {
    "level",
    A0_7868,
    CastAction.on_dexterity_fire
  }
  L2_7870.data.on = {
    "attrite",
    A0_7868,
    CastAction.on_dexterity_fire
  }
end
