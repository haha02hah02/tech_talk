Class.Damage.Component({})
Global.DAMAGE_TYPE_PHYSICAL = 268435456
Global.DAMAGE_TYPE_MAGIC = 536870912
Global.DAMAGE_TYPE_HOLY = 1073741824
Global.DAMAGE_TYPE_NONLETHAL = 2147483648
function Damage.Constructor(A0_2713)
  Component.Constructor(A0_2713)
  A0_2713.source = 0
  A0_2713.render, A0_2713.result = Node(), 0
end
function Damage.class_get(A0_2714, A1_2715)
  local L2_2716
  L2_2716 = "Damage"
  return L2_2716
end
function Damage.type_get(A0_2717)
  return rawget(A0_2717, "type")
end
function Damage.type_set(A0_2718, A1_2719, A2_2720)
  rawset(A0_2718, "type", A2_2720)
end
function Damage.etype_get(A0_2721)
  local L1_2722, L2_2723, L3_2724
  L1_2722 = A0_2721.type
  if L1_2722 == "magic" then
    L2_2723 = DAMAGE_TYPE_MAGIC
    return L2_2723
  end
  if L1_2722 == "physical" then
    L2_2723 = DAMAGE_TYPE_PHYSICAL
    return L2_2723
  end
  if L1_2722 == "holy_magic" then
    L2_2723 = DAMAGE_TYPE_MAGIC
    L3_2724 = DAMAGE_TYPE_HOLY
    L2_2723 = L2_2723 | L3_2724
    return L2_2723
  end
  if L1_2722 == "holy_physical" then
    L2_2723 = DAMAGE_TYPE_PHYSICAL
    L3_2724 = DAMAGE_TYPE_HOLY
    L2_2723 = L2_2723 | L3_2724
    return L2_2723
  end
  if L1_2722 == "magic_nonlethal" then
    L2_2723 = DAMAGE_TYPE_MAGIC
    L3_2724 = DAMAGE_TYPE_NONLETHAL
    L2_2723 = L2_2723 | L3_2724
    return L2_2723
  end
  if L1_2722 == "physical_nonlethal" then
    L2_2723 = DAMAGE_TYPE_PHYSICAL
    L3_2724 = DAMAGE_TYPE_NONLETHAL
    L2_2723 = L2_2723 | L3_2724
    return L2_2723
  end
  if L1_2722 == "holy_magic_nonlethal" then
    L2_2723 = DAMAGE_TYPE_MAGIC
    L3_2724 = DAMAGE_TYPE_HOLY
    L2_2723 = L2_2723 | L3_2724
    L3_2724 = DAMAGE_TYPE_NONLETHAL
    L2_2723 = L2_2723 | L3_2724
    return L2_2723
  end
  if L1_2722 == "holy_physical_nonlethal" then
    L2_2723 = DAMAGE_TYPE_PHYSICAL
    L3_2724 = DAMAGE_TYPE_HOLY
    L2_2723 = L2_2723 | L3_2724
    L3_2724 = DAMAGE_TYPE_NONLETHAL
    L2_2723 = L2_2723 | L3_2724
    return L2_2723
  end
end
function Damage.nature_type_get(A0_2725)
  return rawget(A0_2725, "nature_type")
end
function Damage.nature_type_set(A0_2726, A1_2727, A2_2728)
  rawset(A0_2726, "nature_type", A2_2728)
end
function Damage.critical_get(A0_2729)
  return rawget(A0_2729, "critical")
end
function Damage.critical_set(A0_2730, A1_2731, A2_2732)
  rawset(A0_2730, "critical", A2_2732)
end
function Damage.index_get(A0_2733)
  return rawget(A0_2733, "index") or 1
end
function Damage.index_set(A0_2734, A1_2735, A2_2736)
  rawset(A0_2734, "index", A2_2736)
end
function Damage.producer_get(A0_2737, A1_2738)
  local L2_2739
  L2_2739 = rawget
  L2_2739 = L2_2739(A0_2737, "values")
  if not L2_2739 then
    return
  end
  if rawget(L2_2739, A1_2738) then
    return rawget(L2_2739, A1_2738)[A1_2738]
  end
end
function Damage.producer_set(A0_2740, A1_2741, A2_2742)
  local L3_2743, L4_2744
  L3_2743 = A0_2740[A1_2741]
  if L3_2743 == A2_2742 then
    return
  end
  L3_2743 = rawget
  L4_2744 = A0_2740
  L3_2743 = L3_2743(L4_2744, "values")
  if not L3_2743 then
    return
  end
  L4_2744 = rawget
  L4_2744 = L4_2744(L3_2743, A1_2741)
  if L4_2744 then
    L4_2744[A1_2741] = A2_2742
    return
  end
  L4_2744 = {}
  L4_2744[A1_2741] = A2_2742
  setmetatable(L4_2744, {__mode = "v"})
  rawset(L3_2743, A1_2741, L4_2744)
end
function Damage.source_get(A0_2745)
  return rawget(A0_2745, "source")
end
function Damage.source_set(A0_2746, A1_2747, A2_2748)
  rawset(A0_2746, "source", A2_2748)
end
function Damage.result_get(A0_2749)
  return rawget(A0_2749, "result")
end
function Damage.result_set(A0_2750, A1_2751, A2_2752)
  rawset(A0_2750, "result", A2_2752)
end
function Damage.target_hp_get(A0_2753)
  return rawget(A0_2753, "target_hp")
end
function Damage.target_hp_set(A0_2754, A1_2755, A2_2756)
  rawset(A0_2754, "target_hp", A2_2756)
end
