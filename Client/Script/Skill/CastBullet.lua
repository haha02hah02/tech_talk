L0_7958 = Class
L0_7958 = L0_7958.CastBullet
L0_7958 = L0_7958.Component
L0_7958({})
L0_7958 = Point
L0_7958 = L0_7958()
function CastBullet.Constructor(A0_7959, A1_7960, A2_7961)
  Component.Constructor(A0_7959)
  A0_7959.name = "cast_bullet"
  A0_7959.on = {
    "Parent",
    A0_7959,
    CastBullet.on_set_parent_fire
  }
end
function CastBullet.class_get(A0_7962)
  local L1_7963
  L1_7963 = "CastBullet"
  return L1_7963
end
function CastBullet.make_bullet(A0_7964, A1_7965)
  local L2_7966, L3_7967, L4_7968, L5_7969, L6_7970, L7_7971, L8_7972, L9_7973, L10_7974, L11_7975
  if not A1_7965 then
    return
  end
  L2_7966 = LoadCsv
  L3_7967 = string
  L3_7967 = L3_7967.format
  L4_7968 = "Effect/%s.ani"
  L5_7969 = A1_7965
  L11_7975 = L3_7967(L4_7968, L5_7969)
  L2_7966 = L2_7966(L3_7967, L4_7968, L5_7969, L6_7970, L7_7971, L8_7972, L9_7973, L10_7974, L11_7975, L3_7967(L4_7968, L5_7969))
  if not L2_7966 then
    L3_7967 = Sprite
    L4_7968 = string
    L4_7968 = L4_7968.format
    L5_7969 = "Effect/%s.ntp"
    L11_7975 = L4_7968(L5_7969, L6_7970)
    L3_7967 = L3_7967(L4_7968, L5_7969, L6_7970, L7_7971, L8_7972, L9_7973, L10_7974, L11_7975, L4_7968(L5_7969, L6_7970))
    L4_7968 = L3_7967
    L5_7969 = L3_7967.ContentSize
    L5_7969 = L5_7969(L6_7970)
    L5_7969 = L5_7969.Width
    return L4_7968, L5_7969
  end
  L3_7967 = string
  L3_7967 = L3_7967.format
  L4_7968 = "Effect/%s.ntplv"
  L5_7969 = A1_7965
  L3_7967 = L3_7967(L4_7968, L5_7969)
  L4_7968 = string
  L4_7968 = L4_7968.format
  L5_7969 = "Effect/%s.ntp"
  L4_7968 = L4_7968(L5_7969, L6_7970)
  L5_7969 = SpriteFrameCache
  L5_7969 = L5_7969.AddSpriteFramesWithFile
  L5_7969(L6_7970, L7_7971, L8_7972)
  L5_7969 = Array
  L5_7969 = L5_7969()
  for L9_7973, L10_7974 in L6_7970(L7_7971) do
    L11_7975 = Animate
    L11_7975 = L11_7975(string.format("%d.ntp", L10_7974.no), L10_7974.origin.x, L10_7974.origin.y, L10_7974.delay / 1000.0, 0)
    if L11_7975 ~= nil then
      L5_7969:AddObject(L11_7975)
    end
  end
  L9_7973 = "0.ntp"
  L7_7971(L8_7972, L9_7973)
  L9_7973 = RepeatForever
  L10_7974 = Sequence
  L11_7975 = L5_7969
  L11_7975 = L10_7974(L11_7975)
  L11_7975 = L9_7973(L10_7974, L11_7975, L10_7974(L11_7975))
  L7_7971(L8_7972, L9_7973, L10_7974, L11_7975, L9_7973(L10_7974, L11_7975, L10_7974(L11_7975)))
  L9_7973 = L6_7970
  return L7_7971, L8_7972
end
function CastBullet.execute_target_get(A0_7976)
  local L1_7977
  L1_7977 = rawget
  L1_7977 = L1_7977(A0_7976, "values")
  if not L1_7977 then
    return
  end
  if not rawget(L1_7977, "texecute_target") then
    return
  end
  return rawget(L1_7977, "texecute_target").value
end
function CastBullet.execute_target_set(A0_7978, A1_7979, A2_7980)
  local L3_7981, L4_7982
  L3_7981 = rawget
  L4_7982 = A0_7978
  L3_7981 = L3_7981(L4_7982, "values")
  if not L3_7981 then
    return
  end
  L4_7982 = rawget
  L4_7982 = L4_7982(L3_7981, "texecute_target")
  if not L4_7982 then
    L4_7982 = {}
    setmetatable(L4_7982, {__mode = "v"})
    rawset(L3_7981, "texecute_target", L4_7982)
  end
  L4_7982.value = A2_7980
end
function CastBullet.on_bullet_execute_fire(A0_7983)
  local L1_7984, L2_7985, L3_7986, L4_7987
  L1_7984 = A0_7983.execute_target
  if not L1_7984 then
    L2_7985 = CheckWasteop
    L3_7986 = A0_7983.parent
    L3_7986 = L3_7986.parent
    L2_7985(L3_7986)
    return
  end
  L2_7985 = L1_7984.status
  L3_7986 = STATUS_DIE
  if L2_7985 == L3_7986 then
    return
  end
  L2_7985 = A0_7983.parent
  L3_7986 = L2_7985.info
  L4_7987 = L2_7985.parent
  AttackSet(L4_7987, L1_7984, L3_7986)
  if L2_7985.hit_sound then
    L2_7985.hit_sound.attach = true
  end
  if L2_7985.hit_effect then
    L2_7985.hit_effect.attach = L1_7984
  end
end
function CastBullet.bullet_set(A0_7988, A1_7989, A2_7990, A3_7991, A4_7992, A5_7993, A6_7994, A7_7995, A8_7996)
  local L9_7997, L10_7998, L11_7999, L12_8000, L13_8001, L14_8002, L15_8003, L16_8004
  L9_7997 = A7_7995.direction
  if L9_7997 == "left" then
    if A8_7996 then
      L9_7997 = A8_7996.width
      L10_7998 = Config
      L10_7998 = L10_7998.TwoNumber
      L9_7997 = L9_7997 / L10_7998
    elseif not L9_7997 then
      L9_7997 = Config
      L9_7997 = L9_7997.ZeroNumber
    end
  elseif not L9_7997 then
    if A8_7996 then
      L9_7997 = A8_7996.width
      L10_7998 = Config
      L10_7998 = L10_7998.TwoNumber
      L9_7997 = L9_7997 / L10_7998
    elseif not L9_7997 then
      L9_7997 = Config
      L9_7997 = L9_7997.ZeroNumber
    end
    L9_7997 = -L9_7997
  end
  L10_7998 = CastBullet
  L10_7998 = L10_7998.make_bullet
  L11_7999 = A0_7988
  L12_8000 = A5_7993.bullet_alterable
  if L12_8000 then
    L12_8000 = A7_7995.data
    L12_8000 = L12_8000.bullet
  else
    L12_8000 = L12_8000 or A5_7993.bullet
  end
  L11_7999 = L10_7998(L11_7999, L12_8000)
  L12_8000 = A7_7995.direction
  if L12_8000 == "left" then
    L12_8000 = -L11_7999
  else
    L12_8000 = L12_8000 or L11_7999
  end
  L13_8001 = A7_7995.direction
  if L13_8001 == "left" then
    L13_8001 = L11_7999 + 80
    L14_8002 = A1_7989 - 1
    L13_8001 = L13_8001 * L14_8002
  elseif not L13_8001 then
    L13_8001 = L11_7999 + 80
    L13_8001 = -L13_8001
    L14_8002 = A1_7989 - 1
    L13_8001 = L13_8001 * L14_8002
  end
  L14_8002 = A5_7993.bullet_offset
  if L14_8002 then
    L15_8003 = L14_8002.y
  elseif not L15_8003 then
    L15_8003 = Config
    L15_8003 = L15_8003.ZeroNumber
  end
  L16_8004 = L10_7998.SetPosition
  L16_8004(L10_7998, A2_7990 + L12_8000, A3_7991)
  L16_8004 = -A4_7992
  L16_8004 = L16_8004 + L9_7997
  L16_8004 = L16_8004 - L12_8000
  L0_7958.x = L16_8004
  if A8_7996 then
    L16_8004 = A8_7996.y
    L16_8004 = L16_8004 - L15_8003
    L16_8004 = L16_8004 - A7_7995.y
  else
    L16_8004 = L16_8004 or 0
  end
  L0_7958.y = L16_8004
  L16_8004 = Array
  L16_8004 = L16_8004()
  L16_8004:AddObject(Hide())
  L16_8004:AddObject(DelayTime(math.abs(L13_8001) / 1400))
  L16_8004:AddObject(Show())
  L16_8004:AddObject(MoveBy(math.abs(A4_7992) / 1400, L0_7958))
  if A1_7989 == 1 then
    L16_8004:AddObject(ActionInstant(Functor(A0_7988, CastBullet.on_bullet_execute_fire)))
  end
  L16_8004:AddObject(RemoveSelf(true))
  L10_7998:SetRotationY(A7_7995.direction == "left" and 0 or -180)
  L10_7998:RunAction(Sequence(L16_8004))
  ;(A8_7996 and A8_7996.proxy.render or A6_7994["8"].render):AddChild(L10_7998)
end
function CastBullet.on_skill_execute_fire(A0_8005)
  local L1_8006, L2_8007, L3_8008, L4_8009, L5_8010, L6_8011, L7_8012, L8_8013, L9_8014, L10_8015, L11_8016, L12_8017, L13_8018, L14_8019, L15_8020, L16_8021, L17_8022, L18_8023, L19_8024, L20_8025, L21_8026, L22_8027, L23_8028, L24_8029, L25_8030, L26_8031
  L1_8006 = A0_8005.parent
  if not L1_8006 then
    return
  end
  L2_8007 = L1_8006.info
  L3_8008 = L1_8006.parent
  if not L3_8008 then
    return
  end
  L4_8009 = L3_8008.parent
  L4_8009 = L4_8009.parent
  if not L4_8009 then
    return
  end
  L5_8010 = math
  L5_8010 = L5_8010.min
  L6_8011 = L3_8008.data
  L6_8011 = L6_8011.level
  L7_8012 = L2_8007.req_level
  if not L7_8012 then
    L7_8012 = Config
    L7_8012 = L7_8012.ZeroNumber
  end
  L6_8011 = L6_8011 - L7_8012
  L7_8012 = L2_8007.max_level
  if not L7_8012 then
    L7_8012 = Config
    L7_8012 = L7_8012.ZeroNumber
  end
  L5_8010 = L5_8010(L6_8011, L7_8012)
  L6_8011 = L2_8007.bullet_offset
  if L6_8011 then
    L7_8012 = L6_8011.x
  elseif not L7_8012 then
    L7_8012 = Config
    L7_8012 = L7_8012.ZeroNumber
  end
  if L6_8011 then
    L8_8013 = L6_8011.y
  elseif not L8_8013 then
    L8_8013 = Config
    L8_8013 = L8_8013.ZeroNumber
  end
  L9_8014 = L3_8008.direction
  if L9_8014 ~= "left" or not L7_8012 then
    L7_8012 = -L7_8012
  end
  L9_8014 = L2_8007.distance
  if not L9_8014 then
    L9_8014 = Config
    L9_8014 = L9_8014.ThreedHundred
  end
  L10_8015 = L2_8007.ldistance
  if not L10_8015 then
    L10_8015 = Config
    L10_8015 = L10_8015.ZeroNumber
  end
  L11_8016 = L10_8015 * L5_8010
  L9_8014 = L9_8014 + L11_8016
  L11_8016 = L3_8008.direction
  if L11_8016 ~= "left" or not L9_8014 then
    L9_8014 = -L9_8014
  end
  L11_8016 = L3_8008.height
  L12_8017 = Config
  L12_8017 = L12_8017.TwoNumber
  L11_8016 = L11_8016 / L12_8017
  L12_8017 = L3_8008.position
  L13_8018 = L3_8008.direction
  if L13_8018 == "left" then
    L13_8018 = L12_8017.x
    L13_8018 = L13_8018 - L9_8014
    L13_8018 = L13_8018 + L7_8012
  elseif not L13_8018 then
    L13_8018 = L12_8017.x
    L13_8018 = L13_8018 + L7_8012
  end
  L14_8019 = L3_8008.direction
  if L14_8019 == "right" then
    L14_8019 = L12_8017.x
    L14_8019 = L14_8019 - L9_8014
    L14_8019 = L14_8019 + L7_8012
  elseif not L14_8019 then
    L14_8019 = L12_8017.x
    L14_8019 = L14_8019 + L7_8012
  end
  L15_8020 = L12_8017.y
  L15_8020 = L15_8020 + L11_8016
  L15_8020 = L15_8020 + L8_8013
  L16_8021 = L12_8017.y
  L16_8021 = L16_8021 - L11_8016
  L16_8021 = L16_8021 + L8_8013
  L17_8022 = CastBullet
  L17_8022 = L17_8022.make_bullet
  L18_8023 = A0_8005
  L19_8024 = L2_8007.bullet_alterable
  if L19_8024 then
    L19_8024 = L3_8008.data
    L19_8024 = L19_8024.bullet
  else
    L19_8024 = L19_8024 or L2_8007.bullet
  end
  L18_8023 = L17_8022(L18_8023, L19_8024)
  if not L17_8022 then
    return
  end
  L19_8024 = AttackCount
  L20_8025 = L3_8008
  L21_8026 = L2_8007
  L19_8024 = L19_8024(L20_8025, L21_8026)
  L20_8025 = {
    L21_8026,
    L22_8027,
    L23_8028,
    L24_8029,
    L25_8030,
    L26_8031,
    L3_8008.direction
  }
  L21_8026 = L13_8018
  L22_8027 = L14_8019
  L26_8031 = nil
  L4_8009.search_args = L20_8025
  L20_8025 = L4_8009.search
  A0_8005.execute_target = L20_8025
  L21_8026 = L2_8007.type
  if L21_8026 == "attack" then
    L21_8026 = "Attack"
  else
    L21_8026 = L21_8026 or "CastSkill"
  end
  L3_8008.fire = L21_8026
  if L20_8025 or not L9_8014 then
    L21_8026 = L12_8017.x
    L22_8027 = L20_8025.x
    L9_8014 = L21_8026 - L22_8027
  end
  if not L20_8025 then
    L21_8026 = L12_8017.x
    L21_8026 = L21_8026 + L7_8012
  else
    L21_8026 = L21_8026 or L9_8014 + L7_8012
  end
  if not L20_8025 then
    L22_8027 = L12_8017.y
    L22_8027 = L22_8027 + L8_8013
  elseif not L22_8027 then
    L22_8027 = L12_8017.y
    L22_8027 = L22_8027 - L23_8028
    L22_8027 = L22_8027 + L8_8013
  end
  for L26_8031 = 1, L19_8024 do
    CastBullet.bullet_set(A0_8005, L26_8031, L21_8026, L22_8027, L9_8014, L2_8007, L4_8009, L3_8008, L20_8025)
  end
end
function CastBullet.on_set_parent_fire(A0_8032)
  local L1_8033
  L1_8033 = A0_8032.parent
  if not L1_8033 then
    return
  end
  L1_8033.on = {
    "execute",
    A0_8032,
    CastBullet.on_skill_execute_fire
  }
end
