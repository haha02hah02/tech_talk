local L1_1011
function L0_1010(A0_1012, A1_1013)
  local L2_1014, L3_1015, L4_1016, L5_1017, L6_1018, L7_1019
  A1_1013 = A1_1013 or L2_1014
  if not A0_1012 then
    return A1_1013
  end
  for L5_1017, L6_1018 in L2_1014(L3_1015) do
    L7_1019 = type
    L7_1019 = L7_1019(L6_1018)
    if L7_1019 == "table" then
      L7_1019 = {}
      A1_1013[L5_1017] = L7_1019
      DumpTable(L6_1018, L7_1019)
    else
      A1_1013[L5_1017] = L6_1018
    end
  end
  return A1_1013
end
DumpTable = L0_1010
function L0_1010(A0_1020, A1_1021)
  A1_1021 = A1_1021 or {}
  for _FORV_5_, _FORV_6_ in pairs(A0_1020) do
    A1_1021[_FORV_6_] = true
  end
  return A1_1021
end
DumpTableValueForKey = L0_1010
function L0_1010(A0_1022)
  local L1_1023, L2_1024, L3_1025, L4_1026, L5_1027, L6_1028, L7_1029
  if A0_1022 == "" then
    return A0_1022
  end
  L1_1023 = string
  L1_1023 = L1_1023.len
  L2_1024 = A0_1022
  L1_1023 = L1_1023(L2_1024)
  L2_1024 = {}
  for L6_1028 = 1, L1_1023 do
    L7_1029 = string
    L7_1029 = L7_1029.sub
    L7_1029 = L7_1029(A0_1022, L6_1028, L6_1028)
    if L7_1029 == "\\" then
      table.insert(L2_1024, "\\\\")
    else
      table.insert(L2_1024, L7_1029)
    end
  end
  return L3_1025(L4_1026)
end
SafetyString = L0_1010
function L0_1010(A0_1030)
  if type(A0_1030) == "string" then
    return "'" .. SafetyString(A0_1030) .. "'"
  elseif type(A0_1030) == "table" then
    return TableToString(A0_1030)
  elseif type(A0_1030) == "nil" then
    return ""
  else
    return tostring(A0_1030)
  end
end
TypeToString = L0_1010
function L0_1010(A0_1031)
  if not A0_1031 then
    return 0
  end
  for _FORV_5_, _FORV_6_ in pairs(A0_1031) do
  end
  return 0 + 1
end
TableSize = L0_1010
function L0_1010(A0_1032, A1_1033)
  if type(A0_1032) == type(A1_1033) then
    return A0_1032 < A1_1033
  end
  return tostring(A0_1032) < tostring(A1_1033)
end
TableIndexSort = L0_1010
function L0_1010(A0_1034, A1_1035)
  local L2_1036, L3_1037, L4_1038, L5_1039, L6_1040, L7_1041, L8_1042, L9_1043
  L2_1036 = {}
  L3_1037 = 1
  L4_1038 = {}
  for L8_1042, L9_1043 in L5_1039(L6_1040) do
    if not A1_1035 or A1_1035(L8_1042, L9_1043) then
      table.insert(L4_1038, L8_1042)
    end
  end
  L5_1039(L6_1040, L7_1041)
  L5_1039(L6_1040, L7_1041)
  for L8_1042, L9_1043 in L5_1039(L6_1040) do
    if L3_1037 ~= 1 then
      table.insert(L2_1036, ", ")
    end
    if type(L9_1043) == "number" then
      table.insert(L2_1036, string.format("[%d]", L9_1043))
    elseif type(L9_1043) == "string" then
      table.insert(L2_1036, L9_1043)
    else
      table.insert(L2_1036, tostring(L9_1043))
    end
    table.insert(L2_1036, " = ")
    table.insert(L2_1036, TypeToString(A0_1034[L9_1043]))
    L3_1037 = L3_1037 + 1
  end
  L5_1039(L6_1040, L7_1041)
  return L5_1039(L6_1040)
end
TableToString = L0_1010
function L0_1010(A0_1044)
  local L1_1045, L2_1046, L3_1047, L4_1048, L5_1049
  L1_1045 = string
  L1_1045 = L1_1045.find
  L2_1046 = A0_1044
  L3_1047 = "(%d+).(%d+).(%d+).(%d+).(%d+).(%d+)"
  L5_1049 = L1_1045(L2_1046, L3_1047)
  if not L1_1045 then
    L1_1045, L2_1046, L3_1047, L4_1048, L5_1049 = string.find(A0_1044, "(%d+).(%d+).(%d+)")
  end
  return os.time({
    year = L3_1047,
    month = L4_1048,
    day = L5_1049,
    hour = L1_1045(L2_1046, L3_1047)
  })
end
StringToTime = L0_1010
function L0_1010(A0_1050)
  local L1_1051, L2_1052, L3_1053, L4_1054, L5_1055, L6_1056
  L1_1051 = string
  L1_1051 = L1_1051.format
  L2_1052 = "%d"
  L3_1053 = math
  L3_1053 = L3_1053.abs
  L4_1054 = A0_1050
  L5_1055 = L3_1053(L4_1054)
  L1_1051 = L1_1051(L2_1052, L3_1053, L4_1054, L5_1055, L6_1056, L3_1053(L4_1054))
  L2_1052 = string
  L2_1052 = L2_1052.len
  L3_1053 = L1_1051
  L2_1052 = L2_1052(L3_1053)
  if L2_1052 <= 3 then
    return L1_1051
  end
  L3_1053 = {}
  L4_1054 = L2_1052
  while true do
    if L4_1054 <= 3 then
      L5_1055 = table
      L5_1055 = L5_1055.insert
      L5_1055(L6_1056, string.sub(L1_1051, 1, L4_1054))
      break
    end
    L5_1055 = table
    L5_1055 = L5_1055.insert
    L5_1055(L6_1056, string.sub(L1_1051, L4_1054 - 2, L4_1054))
    L4_1054 = L4_1054 - 3
  end
  L5_1055 = {}
  for _FORV_9_ = #L3_1053, 1, -1 do
    table.insert(L5_1055, L3_1053[_FORV_9_])
  end
  if A0_1050 > 0 then
  else
  end
  return string.format("%s%s", L6_1056, table.concat(L5_1055, ","))
end
PriceFormat = L0_1010
function L0_1010(A0_1057)
  local L1_1058, L2_1059, L3_1060
  A0_1057 = A0_1057 or 0
  L1_1058 = math
  L1_1058 = L1_1058.floor
  L2_1059 = A0_1057 / 100
  L1_1058 = L1_1058(L2_1059)
  L1_1058 = L1_1058 % 10
  L2_1059 = math
  L2_1059 = L2_1059.floor
  L3_1060 = A0_1057 / 10
  L2_1059 = L2_1059(L3_1060)
  L2_1059 = L2_1059 % 10
  L3_1060 = A0_1057 % 10
  return string.format("%d . %d . %d", L1_1058, L2_1059, L3_1060)
end
VersionString = L0_1010
function L0_1010()
  local L0_1061, L1_1062
  L0_1061 = Config
  L0_1061 = L0_1061.MajorVersion
  L0_1061 = L0_1061 * 1000
  L1_1062 = Config
  L1_1062 = L1_1062.MinorVersion
  L0_1061 = L0_1061 + L1_1062
  return L0_1061
end
UpdateVersionNumber = L0_1010
function L0_1010()
  return FileUtils:WritablePath() .. "version.nts"
end
UpdateVersionFileName = L0_1010
function L0_1010()
  return FileUtils:WritablePath() .. "version.patch"
end
UpdateVersionZipName = L0_1010
function L0_1010(A0_1063)
  return Map(A0_1063)
end
SceneByID = L0_1010
function L0_1010(A0_1064)
  Avatar().name = A0_1064.serial
  Avatar().body = A0_1064.body
  Avatar().cap = A0_1064.cap
  Avatar().hair = A0_1064.hair
  Avatar().face = A0_1064.face
  Avatar().eardrop = A0_1064.eardrop
  Avatar().coat = A0_1064.coat
  Avatar().pants = A0_1064.pants
  Avatar().longcoat = A0_1064.longcoat
  Avatar().glove = A0_1064.glove
  Avatar().cape = A0_1064.cape
  Avatar().weapon = A0_1064.weapon
  Avatar().shield = A0_1064.shield
  Avatar().shoes = A0_1064.shoes
  Avatar().tag_name = A0_1064.name
  Avatar().name_tag = A0_1064.name_tag or 0
  return (Avatar())
end
AvatarByInfo = L0_1010
function L0_1010(A0_1065)
  local L1_1066, L2_1067, L3_1068, L4_1069, L5_1070, L6_1071, L7_1072, L8_1073, L9_1074, L10_1075, L11_1076, L12_1077, L13_1078, L14_1079, L15_1080, L16_1081, L17_1082, L18_1083
  L1_1066 = Account
  L2_1067 = L1_1066
  L1_1066 = L1_1066.One
  L3_1068 = string
  L3_1068 = L3_1068.format
  L4_1069 = "serial = %d"
  L5_1070 = A0_1065.belong
  L18_1083 = L3_1068(L4_1069, L5_1070)
  L1_1066 = L1_1066(L2_1067, L3_1068, L4_1069, L5_1070, L6_1071, L7_1072, L8_1073, L9_1074, L10_1075, L11_1076, L12_1077, L13_1078, L14_1079, L15_1080, L16_1081, L17_1082, L18_1083, L3_1068(L4_1069, L5_1070))
  L2_1067 = LoadConf
  L3_1068 = "Config/Jobs.conf"
  L2_1067 = L2_1067(L3_1068)
  L3_1068 = A0_1065.job
  L2_1067 = L2_1067[L3_1068]
  L2_1067 = L2_1067.attribute
  L3_1068 = Data
  L3_1068 = L3_1068()
  L4_1069 = L1_1066.sex
  L3_1068.sex = L4_1069
  L4_1069 = L2_1067.job
  L3_1068.job = L4_1069
  L4_1069 = L2_1067.major
  L3_1068.major_job = L4_1069
  L4_1069 = L2_1067.main_attr
  L3_1068.main_attr = L4_1069
  L4_1069 = L2_1067.str_inc
  L3_1068.str_inc = L4_1069
  L4_1069 = L2_1067.dex_inc
  L3_1068.dex_inc = L4_1069
  L4_1069 = L2_1067.int_inc
  L3_1068.int_inc = L4_1069
  L4_1069 = L2_1067.luck_inc
  L3_1068.luck_inc = L4_1069
  L4_1069 = L2_1067.str_race
  L3_1068.str_race = L4_1069
  L4_1069 = L2_1067.dex_race
  L3_1068.dex_race = L4_1069
  L4_1069 = L2_1067.int_race
  L3_1068.int_race = L4_1069
  L4_1069 = L2_1067.luck_race
  L3_1068.luck_race = L4_1069
  L4_1069 = L2_1067.precision
  L3_1068.precision = L4_1069
  L4_1069 = L2_1067.pdd
  L3_1068.pdd = L4_1069
  L4_1069 = L2_1067.mdd
  L3_1068.mdd = L4_1069
  L4_1069 = L2_1067.bat
  L3_1068.bat = L4_1069
  L4_1069 = L2_1067.hit
  L3_1068.hit = L4_1069
  L4_1069 = L2_1067.dodge
  L3_1068.dodge = L4_1069
  L4_1069 = L2_1067.critical
  L3_1068.critical = L4_1069
  L4_1069 = L2_1067.multiple
  L3_1068.multiple = L4_1069
  L4_1069 = L2_1067.speed
  L3_1068.speed = L4_1069
  L4_1069 = L2_1067.jump
  L3_1068.jump = L4_1069
  L4_1069 = A0_1065.hp
  L4_1069 = L4_1069 or L3_1068.max_hp
  L3_1068.hp = L4_1069
  L4_1069 = A0_1065.mp
  L4_1069 = L4_1069 or L3_1068.max_mp
  L3_1068.mp = L4_1069
  L4_1069 = A0_1065.exp
  L4_1069 = L4_1069 or 0
  L3_1068.exp = L4_1069
  L4_1069 = string
  L4_1069 = L4_1069.format
  L5_1070 = "belong = %d"
  L6_1071 = A0_1065.serial
  L4_1069 = L4_1069(L5_1070, L6_1071)
  L5_1070 = Levels
  L6_1071 = L5_1070
  L5_1070 = L5_1070.Sum
  L7_1072 = "level"
  L8_1073 = L4_1069
  L5_1070 = L5_1070(L6_1071, L7_1072, L8_1073)
  L3_1068.level = L5_1070
  L6_1071 = SessionObject
  L7_1072 = 22
  L8_1073 = 64
  L6_1071 = L6_1071(L7_1072, L8_1073)
  L7_1072 = A0_1065.serial
  L6_1071.name = L7_1072
  L6_1071.data = L3_1068
  L7_1072 = WORLD_TYPE_MOB
  L6_1071.hate_type = L7_1072
  L7_1072 = AvatarByInfo
  L8_1073 = A0_1065
  L7_1072 = L7_1072(L8_1073)
  L6_1071.proxy = L7_1072
  L7_1072 = OperateProxy
  L7_1072 = L7_1072()
  L7_1072.name = "operate"
  L7_1072.parent = L6_1071
  L8_1073 = DataSet
  L8_1073 = L8_1073()
  L8_1073.name = "data_set"
  L8_1073.parent = L6_1071
  L9_1074 = JumpMusic
  L9_1074 = L9_1074()
  L9_1074.parent = L6_1071
  L10_1075 = UnderAttack
  L10_1075 = L10_1075()
  L10_1075.parent = L6_1071
  L11_1076 = StandAttackAways
  L11_1076 = L11_1076()
  L11_1076.parent = L6_1071
  L12_1077 = LoadConf
  L13_1078 = "Config/Skill.conf"
  L12_1077 = L12_1077(L13_1078)
  if L12_1077 then
    L13_1078 = L2_1067.job
    L13_1078 = L12_1077[L13_1078]
  else
    L13_1078 = L13_1078 or nil
  end
  if not L13_1078 then
    return L6_1071
  end
  for L17_1082, L18_1083 in L14_1079(L15_1080) do
    L6_1071.skill = CastSkill(L6_1071, L17_1082, L18_1083)
  end
  return L6_1071
end
SessionByInfo = L0_1010
function L0_1010(A0_1084, A1_1085, A2_1086, A3_1087)
  local L4_1088, L5_1089, L6_1090, L7_1091, L8_1092, L9_1093, L10_1094, L11_1095
  L4_1088 = LoadConf
  L5_1089 = string
  L5_1089 = L5_1089.format
  L6_1090 = "Npc/%d.npc"
  L11_1095 = L5_1089(L6_1090, L7_1091)
  L4_1088 = L4_1088(L5_1089, L6_1090, L7_1091, L8_1092, L9_1093, L10_1094, L11_1095, L5_1089(L6_1090, L7_1091))
  if not L4_1088 then
    return
  end
  L5_1089 = L4_1088.info
  L6_1090 = L4_1088.id
  if L6_1090 ~= A1_1085 then
    L6_1090 = Event
    L6_1090 = L6_1090.Fire
    L6_1090(L7_1091, L8_1092, L9_1093)
    return
  end
  L6_1090 = L4_1088.dialog
  if L6_1090 then
    if not L7_1091 then
      for L10_1094, L11_1095 in L7_1091(L8_1092) do
        L6_1090[L10_1094] = DialogTextFormat(L11_1095)
      end
      L6_1090.handle = true
    end
  end
  L10_1094 = A0_1084
  L7_1091.name = L8_1092
  L8_1092.speed = 6
  L8_1092.jump = 26
  L10_1094 = L7_1091.info
  L10_1094 = L10_1094.height
  L11_1095 = SessionObject
  L11_1095 = L11_1095(L9_1093, L10_1094, A2_1086, A3_1087 + L10_1094 / 2)
  L11_1095.name = string.format("npc_%d", A0_1084)
  L11_1095.type = WORLD_TYPE_NPC
  L11_1095.hate_type = 0
  L11_1095.data = L8_1092
  L11_1095.proxy = L7_1091
  DialogShow().name = "dialog"
  DialogShow().parent = L11_1095
  ScenarioShow().name = "scenario"
  ScenarioShow().parent = L11_1095
  return L11_1095
end
Npc = L0_1010
function L0_1010(A0_1096, A1_1097, A2_1098, A3_1099, A4_1100)
  local L5_1101, L6_1102, L7_1103, L8_1104, L9_1105, L10_1106, L11_1107, L12_1108
  L5_1101 = LoadConf
  L6_1102 = string
  L6_1102 = L6_1102.format
  L7_1103 = "Mob/%d.mob"
  L8_1104 = A1_1097
  L12_1108 = L6_1102(L7_1103, L8_1104)
  L5_1101 = L5_1101(L6_1102, L7_1103, L8_1104, L9_1105, L10_1106, L11_1107, L12_1108, L6_1102(L7_1103, L8_1104))
  if not L5_1101 then
    return
  end
  L6_1102 = L5_1101.info
  L7_1103 = L5_1101.id
  if L7_1103 ~= A1_1097 then
    L7_1103 = Event
    L8_1104 = L7_1103
    L7_1103 = L7_1103.Fire
    L9_1105 = "DataException"
    L10_1106 = "conf_data"
    L7_1103(L8_1104, L9_1105, L10_1106)
    return
  end
  L7_1103 = MobAvatar
  L8_1104 = A1_1097
  L7_1103 = L7_1103(L8_1104)
  L7_1103.name = A0_1096
  L8_1104 = Data
  L8_1104 = L8_1104()
  L9_1105 = L6_1102.speed
  if not L9_1105 then
    L9_1105 = L6_1102.fly_speed
    L9_1105 = L9_1105 or 0
  end
  L9_1105 = L9_1105 / 100
  L10_1106 = L6_1102.level
  L10_1106 = L10_1106 or 0
  L8_1104.level = L10_1106
  L10_1106 = math
  L10_1106 = L10_1106.floor
  L11_1107 = 6 * L9_1105
  L11_1107 = 6 + L11_1107
  L10_1106 = L10_1106(L11_1107)
  L8_1104.speed = L10_1106
  L8_1104.jump = 26
  L10_1106 = L6_1102.hp
  L8_1104.max_hp = L10_1106
  L10_1106 = L6_1102.mp
  L8_1104.max_mp = L10_1106
  L10_1106 = L6_1102.precision
  L11_1107 = Config
  L11_1107 = L11_1107.Thirty
  L10_1106 = L10_1106 + L11_1107
  L8_1104.precision = L10_1106
  L10_1106 = math
  L10_1106 = L10_1106.floor
  L11_1107 = L6_1102.pdd
  L12_1108 = L6_1102.pdd
  L12_1108 = L12_1108 * (L6_1102.level or 0)
  L12_1108 = L12_1108 * Config.MobDefensePercent
  L11_1107 = L11_1107 + L12_1108
  L10_1106 = L10_1106(L11_1107)
  L8_1104.pdd = L10_1106
  L10_1106 = math
  L10_1106 = L10_1106.floor
  L11_1107 = L6_1102.mdd
  L12_1108 = L6_1102.mdd
  L12_1108 = L12_1108 * (L6_1102.level or 0)
  L12_1108 = L12_1108 * Config.MobDefensePercent
  L11_1107 = L11_1107 + L12_1108
  L10_1106 = L10_1106(L11_1107)
  L8_1104.mdd = L10_1106
  L10_1106 = L6_1102.hit
  L8_1104.hit = L10_1106
  L10_1106 = L6_1102.dodge
  L8_1104.dodge = L10_1106
  L10_1106 = L6_1102.critical
  L8_1104.critical = L10_1106
  L10_1106 = L6_1102.exp
  L8_1104.exp = L10_1106
  L10_1106 = math
  L10_1106 = L10_1106.floor
  L11_1107 = L6_1102.damage
  L12_1108 = L6_1102.damage
  L12_1108 = L12_1108 * (L6_1102.level or 0)
  L12_1108 = L12_1108 * Config.MobAttackPercent
  L11_1107 = L11_1107 + L12_1108
  L10_1106 = L10_1106(L11_1107)
  L8_1104.attack = L10_1106
  L10_1106 = L8_1104.max_hp
  L8_1104.hp = L10_1106
  L10_1106 = L8_1104.max_mp
  L8_1104.mp = L10_1106
  L10_1106 = L7_1103.info
  L10_1106 = L10_1106.width
  L11_1107 = L7_1103.info
  L11_1107 = L11_1107.height
  L12_1108 = SessionObject
  L12_1108 = L12_1108(L10_1106, L11_1107, A2_1098, A3_1099 + L11_1107 / 2)
  L12_1108.name = A0_1096
  L12_1108.fixed = L6_1102.fixed and true or false
  L12_1108.type = L6_1102.zoo and WORLD_TYPE_ZOOMOB or WORLD_TYPE_MOB
  L12_1108.hate_type = L6_1102.zoo and 0 or WORLD_TYPE_LIFE
  L12_1108.nature_type = L6_1102.nature_type
  L12_1108.data = L8_1104
  L12_1108.proxy = L7_1103
  PlatformPatrol(L12_1108, L6_1102)
  RebornSet(L12_1108, L6_1102, A4_1100)
  UnderAttackSound(L12_1108, L6_1102)
  BodyAttack(L12_1108, L6_1102)
  DeathSummon(L12_1108, L6_1102)
  CheckSkill(L12_1108, L5_1101)
  ResultHandle(L12_1108, L6_1102)
  return L12_1108
end
Mob = L0_1010
function L0_1010(A0_1109, A1_1110, A2_1111, A3_1112, A4_1113)
  local L5_1114, L6_1115, L7_1116, L8_1117
  L5_1114 = Data
  L5_1114 = L5_1114()
  L5_1114.item_id = A1_1110
  L5_1114.amount = A2_1111
  L6_1115 = ItemAvatar
  L7_1116 = A1_1110
  L6_1115 = L6_1115(L7_1116)
  L7_1116 = string
  L7_1116 = L7_1116.format
  L8_1117 = "item_%d"
  L7_1116 = L7_1116(L8_1117, A0_1109)
  L6_1115.name = L7_1116
  L7_1116 = L6_1115.width
  L8_1117 = L6_1115.height
  SessionObject(L7_1116, L8_1117, A3_1112, A4_1113 + L8_1117 / 2).name = string.format("item_%d", A0_1109)
  SessionObject(L7_1116, L8_1117, A3_1112, A4_1113 + L8_1117 / 2).type = WORLD_TYPE_ITEM
  SessionObject(L7_1116, L8_1117, A3_1112, A4_1113 + L8_1117 / 2).hate_type = 0
  SessionObject(L7_1116, L8_1117, A3_1112, A4_1113 + L8_1117 / 2).data = L5_1114
  SessionObject(L7_1116, L8_1117, A3_1112, A4_1113 + L8_1117 / 2).proxy = L6_1115
  return (SessionObject(L7_1116, L8_1117, A3_1112, A4_1113 + L8_1117 / 2))
end
DropItem = L0_1010
function L0_1010(A0_1118, A1_1119, A2_1120, A3_1121)
  local L4_1122, L5_1123
  L4_1122 = nil
  if A1_1119 == "o" then
    L5_1123 = LoadConf
    L5_1123 = L5_1123(string.format("Mob/%d.mob", A2_1120))
    L4_1122 = L5_1123
  elseif A1_1119 == "p" then
    L5_1123 = LoadConf
    L5_1123 = L5_1123(string.format("Npc/%d.npc", A2_1120))
    L4_1122 = L5_1123
  elseif A1_1119 == "t" then
    L5_1123 = LoadConf
    L5_1123 = L5_1123(string.format("Item/%d.item", A2_1120))
    L4_1122 = L5_1123
  elseif A1_1119 == "m" then
    L5_1123 = LoadConf
    L5_1123 = L5_1123(string.format("Scene/%d.scene", A2_1120))
    L4_1122 = L5_1123
  end
  if L4_1122 then
    L5_1123 = L4_1122.info
    L5_1123 = L5_1123.name
  else
    L5_1123 = L5_1123 or A3_1121
  end
  if L5_1123 == "b" or L5_1123 == "k" then
    return
  end
  table.insert(A0_1118, L5_1123)
end
DialogTextSet = L0_1010
function L0_1010(A0_1124)
  local L1_1125, L2_1126, L3_1127, L4_1128, L5_1129, L6_1130, L7_1131, L8_1132, L9_1133, L10_1134, L11_1135
  L1_1125 = VectorString
  L1_1125 = L1_1125()
  L2_1126 = SplitString
  L3_1127 = A0_1124
  L11_1135 = L5_1129(L6_1130)
  L2_1126(L3_1127, L4_1128, L5_1129, L6_1130, L7_1131, L8_1132, L9_1133, L10_1134, L11_1135, L5_1129(L6_1130))
  L3_1127 = L1_1125
  L2_1126 = L1_1125.Size
  L2_1126 = L2_1126(L3_1127)
  if L2_1126 == 1 then
    return A0_1124
  end
  L3_1127 = {}
  for L7_1131 = 0, L2_1126 - 1 do
    L9_1133 = L1_1125
    L8_1132 = L1_1125.At
    L10_1134 = L7_1131
    L8_1132 = L8_1132(L9_1133, L10_1134)
    L9_1133 = A0_1124.sub
    L10_1134 = L8_1132
    L11_1135 = 1
    L9_1133 = L9_1133(L10_1134, L11_1135, 1)
    L10_1134 = nil
    L11_1135 = tonumber
    L11_1135 = L11_1135(A0_1124.sub(L8_1132, 2))
    DialogTextSet(L3_1127, L9_1133, L11_1135, L8_1132)
  end
  return L4_1128(L5_1129)
end
DialogTextFormat = L0_1010
function L0_1010(A0_1136, A1_1137)
  local L2_1138, L3_1139, L4_1140, L5_1141, L6_1142, L7_1143
  L2_1138 = A1_1137.position
  L3_1139 = L2_1138.x
  L4_1140 = A1_1137.width
  L4_1140 = L4_1140 / 2
  L3_1139 = L3_1139 - L4_1140
  L4_1140 = L2_1138.x
  L5_1141 = A1_1137.width
  L5_1141 = L5_1141 / 2
  L4_1140 = L4_1140 + L5_1141
  L5_1141 = L2_1138.y
  L6_1142 = A1_1137.height
  L6_1142 = L6_1142 / 2
  L5_1141 = L5_1141 + L6_1142
  L6_1142 = L2_1138.y
  L7_1143 = A1_1137.height
  L7_1143 = L7_1143 / 2
  L6_1142 = L6_1142 - L7_1143
  L7_1143 = A0_1136.x2
  L7_1143 = L3_1139 < L7_1143 and L4_1140 > L7_1143 and L5_1141 > L7_1143 and L6_1142 < L7_1143
  return L7_1143
end
IsSessionCatched = L0_1010
function L0_1010(A0_1144, A1_1145, A2_1146)
  local L3_1147, L4_1148, L5_1149, L6_1150, L7_1151, L8_1152
  L3_1147 = A0_1144.data
  L3_1147 = L3_1147.level
  if not L3_1147 then
    L3_1147 = Config
    L3_1147 = L3_1147.ZeroNumber
  end
  L4_1148 = A1_1145.data
  L4_1148 = L4_1148.level
  if not L4_1148 then
    L4_1148 = Config
    L4_1148 = L4_1148.ZeroNumber
  end
  L5_1149 = A0_1144.data
  L5_1149 = L5_1149.hit
  if not L5_1149 then
    L5_1149 = Config
    L5_1149 = L5_1149.ZeroNumber
  end
  L6_1150 = A1_1145.data
  L6_1150 = L6_1150.dodge
  if not L6_1150 then
    L6_1150 = Config
    L6_1150 = L6_1150.ZeroNumber
  end
  L7_1151 = L3_1147 - L4_1148
  L8_1152 = L5_1149 - L6_1150
  if L7_1151 < Config.ZeroNumber and not A2_1146.no_level_dodge then
    L8_1152 = L8_1152 + L7_1151 * Config.LevelDivision
  end
  if L8_1152 < Config.ZeroNumber then
    L8_1152 = math.min(-L8_1152 * 9 * Config.HundredPercent, Config.TenThousand)
    if L8_1152 >= math.random(Config.OneNumber, Config.TenThousand) then
      return true
    end
  end
end
IsDodge = L0_1010
function L0_1010(A0_1153, A1_1154)
  local L2_1155, L3_1156, L4_1157
  L2_1155 = math
  L2_1155 = L2_1155.min
  L3_1156 = A0_1153.data
  L3_1156 = L3_1156.level
  L4_1157 = A1_1154.req_level
  if not L4_1157 then
    L4_1157 = Config
    L4_1157 = L4_1157.ZeroNumber
  end
  L3_1156 = L3_1156 - L4_1157
  L4_1157 = A1_1154.max_level
  if not L4_1157 then
    L4_1157 = Config
    L4_1157 = L4_1157.ZeroNumber
  end
  L2_1155 = L2_1155(L3_1156, L4_1157)
  L3_1156 = A1_1154.lpower
  L4_1157 = A1_1154.power
  if not L4_1157 then
    L4_1157 = Config
    L4_1157 = L4_1157.ZeroNumber
  end
  L4_1157 = L4_1157 + (L3_1156 and L3_1156 * L2_1155 or Config.ZeroNumber)
  L4_1157 = L4_1157 / Config.HundredPercent
  L4_1157 = (A1_1154.affectable and L4_1157 + A0_1153.data.power / Config.HundredPercent or L4_1157) + Config.OneNumber
  if A1_1154.share_power then
  else
  end
  return L4_1157 / (attack_count or Config.OneNumber) or L4_1157
end
SkillPower = L0_1010
function L0_1010(A0_1158, A1_1159)
  if A0_1158.type ~= WORLD_TYPE_LIFE then
    return
  end
  Event:Fire("Wasteop", A1_1159 or Config.OneNumber)
end
CheckWasteop = L0_1010
function L0_1010(A0_1160, A1_1161)
  local L2_1162, L3_1163, L4_1164, L5_1165, L6_1166, L7_1167, L8_1168, L9_1169, L10_1170, L11_1171, L12_1172, L13_1173, L14_1174, L15_1175
  L2_1162 = math
  L2_1162 = L2_1162.min
  L3_1163 = A0_1160.data
  L3_1163 = L3_1163.level
  L4_1164 = A1_1161.req_level
  if not L4_1164 then
    L4_1164 = Config
    L4_1164 = L4_1164.ZeroNumber
  end
  L3_1163 = L3_1163 - L4_1164
  L4_1164 = A1_1161.max_level
  if not L4_1164 then
    L4_1164 = Config
    L4_1164 = L4_1164.ZeroNumber
  end
  L2_1162 = L2_1162(L3_1163, L4_1164)
  L3_1163 = A1_1161.loffset
  L4_1164 = A1_1161.offset
  if L4_1164 then
    L5_1165 = L4_1164.x
  elseif not L5_1165 then
    L5_1165 = Config
    L5_1165 = L5_1165.ZeroNumber
  end
  if L3_1163 then
    L6_1166 = L3_1163.x
    L6_1166 = L6_1166 * L2_1162
  elseif not L6_1166 then
    L6_1166 = Config
    L6_1166 = L6_1166.ZeroNumber
  end
  L5_1165 = L5_1165 + L6_1166
  if L4_1164 then
    L6_1166 = L4_1164.y
  elseif not L6_1166 then
    L6_1166 = Config
    L6_1166 = L6_1166.ZeroNumber
  end
  if L3_1163 then
    L7_1167 = L3_1163.y
    L7_1167 = L7_1167 * L2_1162
  elseif not L7_1167 then
    L7_1167 = Config
    L7_1167 = L7_1167.ZeroNumber
  end
  L6_1166 = L6_1166 + L7_1167
  L7_1167 = A0_1160.direction
  if L7_1167 ~= "left" or not L5_1165 then
    L5_1165 = -L5_1165
  end
  L7_1167 = A1_1161.lwidth
  L8_1168 = A1_1161.lheight
  L9_1169 = A1_1161.width
  L10_1170 = Config
  L10_1170 = L10_1170.TwoNumber
  L9_1169 = L9_1169 / L10_1170
  if L7_1167 then
    L10_1170 = L7_1167 * L2_1162
  elseif not L10_1170 then
    L10_1170 = Config
    L10_1170 = L10_1170.ZeroNumber
  end
  L9_1169 = L9_1169 + L10_1170
  L10_1170 = A1_1161.height
  L11_1171 = Config
  L11_1171 = L11_1171.TwoNumber
  L10_1170 = L10_1170 / L11_1171
  if L8_1168 then
    L11_1171 = L8_1168 * L2_1162
  elseif not L11_1171 then
    L11_1171 = Config
    L11_1171 = L11_1171.ZeroNumber
  end
  L10_1170 = L10_1170 + L11_1171
  L11_1171 = A0_1160.position
  L12_1172 = L11_1171.x
  L12_1172 = L12_1172 - L9_1169
  L12_1172 = L12_1172 + L5_1165
  L13_1173 = L11_1171.x
  L13_1173 = L13_1173 + L9_1169
  L13_1173 = L13_1173 + L5_1165
  L14_1174 = L11_1171.y
  L14_1174 = L14_1174 + L10_1170
  L14_1174 = L14_1174 + L6_1166
  L15_1175 = L11_1171.y
  L15_1175 = L15_1175 - L10_1170
  L15_1175 = L15_1175 + L6_1166
  return {
    L12_1172,
    L13_1173,
    L14_1174,
    L15_1175,
    A0_1160.hate_type,
    A1_1161.multiple and (A1_1161.max_count or Config.SixNumber) or nil,
    A0_1160.direction
  }
end
SkillSearchArg = L0_1010
function L0_1010(A0_1176, A1_1177)
  return (A1_1177.affectable and (A1_1177.lattack_count and math.floor((A1_1177.attack_count or 1) + A1_1177.lattack_count * math.min(A0_1176.data.level - (A1_1177.req_level or Config.ZeroNumber), A1_1177.max_level or Config.ZeroNumber)) or A1_1177.attack_count or 1) + A0_1176.data.attack_count or A1_1177.lattack_count and math.floor((A1_1177.attack_count or 1) + A1_1177.lattack_count * math.min(A0_1176.data.level - (A1_1177.req_level or Config.ZeroNumber), A1_1177.max_level or Config.ZeroNumber)) or A1_1177.attack_count or 1) + math.floor((A1_1177.affectable and (A1_1177.lattack_count and math.floor((A1_1177.attack_count or 1) + A1_1177.lattack_count * math.min(A0_1176.data.level - (A1_1177.req_level or Config.ZeroNumber), A1_1177.max_level or Config.ZeroNumber)) or A1_1177.attack_count or 1) + A0_1176.data.attack_count or A1_1177.lattack_count and math.floor((A1_1177.attack_count or 1) + A1_1177.lattack_count * math.min(A0_1176.data.level - (A1_1177.req_level or Config.ZeroNumber), A1_1177.max_level or Config.ZeroNumber)) or A1_1177.attack_count or 1) * A0_1176.data.attack_multiple)
end
AttackCount = L0_1010
function L0_1010(A0_1178, A1_1179, A2_1180)
  local L3_1181
  L3_1181 = AttackCount
  L3_1181 = L3_1181(A0_1178, A2_1180)
  for _FORV_7_ = 1, L3_1181 do
    A1_1179.under_attack, CalcDamage(A0_1178, A1_1179, A2_1180, L3_1181).index = CalcDamage(A0_1178, A1_1179, A2_1180, L3_1181), _FORV_7_
  end
end
AttackSet = L0_1010
function L0_1010(A0_1182, A1_1183, A2_1184, A3_1185)
  local L4_1186, L5_1187, L6_1188, L7_1189, L8_1190, L9_1191, L10_1192
  L4_1186 = Damage
  L4_1186 = L4_1186()
  L4_1186.producer = A0_1182
  L5_1187 = A1_1183.data
  L5_1187 = L5_1187.hp
  L4_1186.target_hp = L5_1187
  L5_1187 = LoadConf
  L6_1188 = "Config/Nature.conf"
  L5_1187 = L5_1187(L6_1188)
  L6_1188 = A2_1184.damage_type
  if not L6_1188 then
    L6_1188 = Damage
    return L6_1188()
  end
  L6_1188 = IsDodge
  L7_1189 = A0_1182
  L8_1190 = A1_1183
  L9_1191 = A2_1184
  L6_1188 = L6_1188(L7_1189, L8_1190, L9_1191)
  if L6_1188 then
    L6_1188 = Damage
    return L6_1188()
  end
  L6_1188 = SkillPower
  L7_1189 = A0_1182
  L8_1190 = A2_1184
  L6_1188 = L6_1188(L7_1189, L8_1190)
  L7_1189 = A2_1184.damage_type
  L4_1186.type = L7_1189
  L7_1189 = L4_1186.etype
  L8_1190 = math
  L8_1190 = L8_1190.random
  L9_1191 = A0_1182.data
  L9_1191 = L9_1191.min_attack
  L10_1192 = A0_1182.data
  L10_1192 = L10_1192.attack
  L8_1190 = L8_1190(L9_1191, L10_1192)
  L9_1191 = A2_1184.nature_type
  if L9_1191 then
    L9_1191 = A1_1183.nature_type
  else
    if not L9_1191 then
      L9_1191 = Config
      L9_1191 = L9_1191.OneNumber
  end
  elseif not L9_1191 then
    L9_1191 = A2_1184.nature_type
    L9_1191 = L5_1187[L9_1191]
    L10_1192 = A1_1183.nature_type
    L9_1191 = L9_1191[L10_1192]
  end
  L10_1192 = DAMAGE_TYPE_PHYSICAL
  L10_1192 = L7_1189 & L10_1192
  if L10_1192 ~= Config.ZeroNumber then
    L10_1192 = A1_1183.data
    L10_1192 = L10_1192.pdd
  elseif not L10_1192 then
    L10_1192 = A1_1183.data
    L10_1192 = L10_1192.mdd
  end
  L10_1192 = L7_1189 & DAMAGE_TYPE_PHYSICAL ~= Config.ZeroNumber and math.floor(L10_1192 - L10_1192 * (((A2_1184.pdb or Config.ZeroNumber) + A0_1182.data.pdb) / Config.HundredPercent)) or math.floor(L10_1192 - L10_1192 * (((A2_1184.mdb or Config.ZeroNumber) + A0_1182.data.mdb) / Config.HundredPercent))
  if L7_1189 & DAMAGE_TYPE_HOLY ~= Config.ZeroNumber then
    L10_1192 = Config.ZeroNumber or L10_1192
  end
  L10_1192 = L7_1189 & DAMAGE_TYPE_PHYSICAL ~= Config.ZeroNumber and math.floor(L10_1192 - A0_1182.data.pdd * (((A2_1184.spdb or Config.ZeroNumber) + A0_1182.data.spdb) / Config.HundredPercent)) or math.floor(L10_1192 - A0_1182.data.mdd * (((A2_1184.smdb or Config.ZeroNumber) + A0_1182.data.smdb) / Config.HundredPercent))
  L10_1192 = L10_1192 / Config.TenNumber
  if not (L10_1192 < Config.ZeroNumber) or not (Config.OneNumber + -L10_1192 * Config.DefensePercent / (Config.OneNumber + Config.DefensePercent * -L10_1192) * Config.TwoNumber) then
  end
  L8_1190 = math.floor(L8_1190 * L6_1188 * L9_1191 * (Config.OneNumber - L10_1192 * Config.DefensePercent / (Config.OneNumber + Config.DefensePercent * L10_1192)))
  L8_1190 = (not A2_1184.critical_unable and math.random(Config.OneNumber, Config.TenThousand) <= A0_1182.data.critical * Config.HundredPercent or false) and math.floor(L8_1190 * A0_1182.data.multiple) or L8_1190
  L4_1186.critical, L4_1186.source = not A2_1184.critical_unable and math.random(Config.OneNumber, Config.TenThousand) <= A0_1182.data.critical * Config.HundredPercent or false, L8_1190
  L4_1186.result = math.max(Config.OneNumber, L8_1190)
  return L4_1186
end
CalcDamage = L0_1010
