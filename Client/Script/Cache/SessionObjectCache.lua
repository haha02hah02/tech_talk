Class.SessionObjectCacheImpl.None({})
function SessionObjectCacheImpl.Constructor(A0_826)
  local L1_827
  L1_827 = {}
  A0_826.tAvatarCache = L1_827
  L1_827 = {}
  A0_826.tSessionObject = L1_827
end
function SessionObjectCacheImpl.SessionObjectByInfo(A0_828, A1_829)
  local L2_830, L3_831, L4_832
  if not A1_829 then
    return
  end
  L2_830 = A1_829.serial
  L3_831 = A0_828.tAvatarCache
  L3_831 = L3_831[L2_830]
  L4_832 = A0_828.tSessionObject
  L4_832 = L4_832[L2_830]
  if L3_831 and L4_832 then
    L4_832.proxy = L3_831
    return L4_832
  end
  Avatar().name = L2_830
  Avatar().body = A1_829.body
  Avatar().cap = A1_829.cap
  Avatar().hair = A1_829.hair
  Avatar().face = A1_829.face
  Avatar().eardrop = A1_829.eardrop
  Avatar().coat = A1_829.coat
  Avatar().pants = A1_829.pants
  Avatar().longcoat = A1_829.longcoat
  Avatar().cape = A1_829.cape
  Avatar().weapon = A1_829.weapon
  Avatar().shield = A1_829.shield
  Avatar().shoes = A1_829.shoes
  Avatar().tag_name = A1_829.name
  A0_828.tAvatarCache[L2_830] = Avatar()
  Data().speed = 6
  Data().jump = 26
  SessionObject(22, 64).proxy, SessionObject(22, 64).data, SessionObject(22, 64).name = Avatar(), Data(), L2_830
  A0_828.tSessionObject[L2_830] = SessionObject(22, 64)
  OperateProxy().parent, OperateProxy().name = SessionObject(22, 64), "operate"
  DataSet().parent, DataSet().name = SessionObject(22, 64), "data_set"
  JumpMusic().parent = SessionObject(22, 64)
  return (SessionObject(22, 64))
end
function SessionObjectCacheImpl.Clean(A0_833)
  for _FORV_4_, _FORV_5_ in pairs(A0_833.tAvatarCache) do
    _FORV_5_.parent = nil
    _FORV_5_.render:RemoveFromParentAndCleanup(false)
  end
  for _FORV_4_, _FORV_5_ in pairs(A0_833.tSessionObject) do
    _FORV_5_.parent = nil
  end
end
Global.SessionObjectCache = SessionObjectCacheImpl()
