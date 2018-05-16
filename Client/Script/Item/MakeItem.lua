local L1_3744
function L0_3743(A0_3745)
  local L1_3746
  if not A0_3745 then
    return
  end
  L1_3746 = LoadConf
  L1_3746 = L1_3746(string.format("Item/%d.item", A0_3745.item_id))
  if not L1_3746 then
    return
  end
  if L1_3746.info.type == "consume" then
    return Consume(A0_3745)
  end
  if L1_3746.info.type == "cap" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "coat" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "pants" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "longcoat" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "shoes" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "glove" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "cape" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "assistant" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "weapon" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "eardrop" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "badge" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "lring" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "rring" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "necklace" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "belt" then
    return Equip(A0_3745)
  end
  if L1_3746.info.type == "shoulder" then
    return Equip(A0_3745)
  end
  return Item(A0_3745)
end
MakeItem = L0_3743
