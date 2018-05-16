L0_809 = 6
Class.SceneCacheImpl.None({})
function SceneCacheImpl.Constructor(A0_810)
  local L1_811
  L1_811 = {}
  A0_810.tScenesCache = L1_811
  L1_811 = {}
  A0_810.tScenesTime = L1_811
end
function SceneCacheImpl.World(A0_812)
  if A0_812.oWorldScene then
    return A0_812.oWorldScene
  end
  A0_812.oWorldScene = MainScene()
  return (MainScene())
end
function SceneCacheImpl.CacheCount(A0_813, A1_814)
  for _FORV_6_, _FORV_7_ in pairs(A1_814) do
  end
  return 0 + 1
end
function SceneCacheImpl.HandleCacheOverFlow(A0_815)
  local L1_816, L2_817, L3_818, L4_819
  L2_817 = A0_815
  L1_816 = A0_815.CacheCount
  L3_818 = A0_815.tScenesCache
  L1_816 = L1_816(L2_817, L3_818)
  L2_817 = L0_809
  if L1_816 < L2_817 then
    return
  end
  L2_817, L3_818, L4_819 = nil, nil, nil
  for _FORV_8_, _FORV_9_ in pairs(A0_815.tScenesCache) do
    L2_817 = L2_817 or _FORV_8_
    L3_818 = A0_815.tScenesTime[_FORV_8_] or os.time()
    L4_819 = A0_815.tScenesTime[L2_817] or os.time()
    if L3_818 < L4_819 then
      L2_817 = _FORV_8_
    end
  end
  A0_815.tScenesCache[L2_817] = nil
  GarbageCollect()
  SpriteFrameCache:RemoveUnusedSpriteFrames()
  TextureCache:RemoveUnusedTextures()
end
function SceneCacheImpl.SceneByID(A0_820, A1_821)
  local L2_822
  if not A1_821 then
    return
  end
  L2_822 = A0_820.tScenesCache
  L2_822 = L2_822[A1_821]
  if not L2_822 then
    A0_820:HandleCacheOverFlow()
    L2_822 = Map(A1_821)
    A0_820.tScenesCache[A1_821] = L2_822
  end
  A0_820.tScenesTime[A1_821] = os.time()
  return L2_822
end
function SceneCacheImpl.SceneByActive(A0_823)
  for _FORV_4_, _FORV_5_ in pairs(A0_823.tScenesCache) do
    if _FORV_5_.start then
      return _FORV_5_
    end
  end
end
function SceneCacheImpl.Destructor(A0_824)
  local L1_825
end
Global.SceneCache = SceneCacheImpl()
