local L1_2380
L0_2379 = {}
function L1_2380(A0_2381)
  if not A0_2381 then
    return
  end
  UnloadConf(A0_2381)
  return (LoadConf(A0_2381))
end
LoadComponent = L1_2380
function L1_2380(A0_2382)
  if not A0_2382 then
    return
  end
  if L0_2379[A0_2382] then
    return L0_2379[A0_2382]
  end
  L0_2379[A0_2382] = LoadConf(A0_2382)
  UnloadConf(A0_2382)
  return (LoadConf(A0_2382))
end
UniqueComponent = L1_2380
