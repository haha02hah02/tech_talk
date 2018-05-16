Class.Avatar.Component({})
function Avatar.Constructor(A0_0)
  Component.Constructor(A0_0)
  if not NodeRGBA() then
    return
  end
  A0_0.render = NodeRGBA()
  NameTag().name = "name_tag"
  NameTag().x = 0
  NameTag().y = -46
  NameTag().visible = false
  NameTag().parent = A0_0
  Gameobject(true).name = "avatar"
  Gameobject(true).parent = A0_0
  rawset(A0_0, "weapon_visible", true)
  A0_0.on = {
    "Start",
    A0_0,
    Avatar.on_start_fire
  }
  A0_0.on = {
    "Stop",
    A0_0,
    Avatar.on_stop_fire
  }
  A0_0.on = {
    "Parent",
    A0_0,
    Avatar.on_parent_fire
  }
  Gameobject(true).render:SetCascadeColorEnabled(true)
  Gameobject(true).render:SetCascadeOpacityEnabled(true)
end
function Avatar.class_get(A0_1, A1_2)
  local L2_3
  L2_3 = "Avatar"
  return L2_3
end
function Avatar.crender_get(A0_4)
  local L1_5
end
function Avatar.copy_set(A0_6, A1_7, A2_8)
  local L3_9
  if not A2_8 then
    return
  end
  L3_9 = A2_8.body
  A0_6.body = L3_9
  L3_9 = A2_8.cap
  A0_6.cap = L3_9
  L3_9 = A2_8.hair
  A0_6.hair = L3_9
  L3_9 = A2_8.eardrop
  A0_6.eardrop = L3_9
  L3_9 = A2_8.face
  A0_6.face = L3_9
  L3_9 = A2_8.coat
  A0_6.coat = L3_9
  L3_9 = A2_8.pants
  A0_6.pants = L3_9
  L3_9 = A2_8.longcoat
  A0_6.longcoat = L3_9
  L3_9 = A2_8.glove
  A0_6.glove = L3_9
  L3_9 = A2_8.cape
  A0_6.cape = L3_9
  L3_9 = A2_8.weapon
  A0_6.weapon = L3_9
  L3_9 = A2_8.shield
  A0_6.shield = L3_9
  L3_9 = A2_8.shoes
  A0_6.shoes = L3_9
end
function Avatar.figure_get(A0_10, A1_11)
  local L2_12
  L2_12 = string
  L2_12 = L2_12.format
  L2_12 = L2_12("%s_1", A0_10.weapon_stand)
  AvatarFigure(L2_12).name = "figure"
  AvatarFigure(L2_12).copy = A0_10
  return (AvatarFigure(L2_12))
end
function Avatar.tag_name(A0_13, A1_14)
  return rawget(A0_13, "tag_name")
end
function Avatar.tag_name_set(A0_15, A1_16, A2_17)
  local L3_18
  L3_18 = A0_15.tag_name
  if A2_17 == L3_18 then
    return
  end
  L3_18 = A0_15.name_tag
  rawset(A0_15, "tag_name", A2_17)
  if not A2_17 then
    L3_18.visible = false
    return
  end
  L3_18.visible = true
  L3_18.text = A2_17
end
function Avatar.name_tag_set(A0_19, A1_20, A2_21)
  local L3_22
  L3_22 = A0_19.name_tag
  if L3_22.id == A2_21 then
    return
  end
  L3_22.parent = nil
  NameTag(A2_21).name = "name_tag"
  NameTag(A2_21).x = 0
  NameTag(A2_21).y = -46
  NameTag(A2_21).visible = true
  NameTag(A2_21).text = A0_19.tag_name
  NameTag(A2_21).parent = A0_19
  A0_19.fire = {
    "modify",
    "name_tag",
    A2_21
  }
end
function Avatar.title_set(A0_23, A1_24, A2_25, A3_26)
  local L4_27
  L4_27 = A0_23.title_tag
  if not A2_25 then
    if L4_27 then
      L4_27.parent = nil
    end
    return
  end
  if L4_27 then
  elseif L4_27.id ~= (A3_26 or 114) then
    if L4_27 then
      L4_27.parent = nil
    end
    L4_27 = NameTag(A3_26 or 114)
    L4_27.name = "title_tag"
    L4_27.x = 0
    L4_27.y = -70
    L4_27.parent = A0_23
  end
  L4_27.text = A2_25
end
function Avatar.swim_get(A0_28, A1_29)
  return rawget(A0_28, "swim")
end
function Avatar.swim_set(A0_30, A1_31, A2_32)
  rawset(A0_30, "swim", A2_32)
end
function Avatar.layer_get(A0_33, A1_34)
  return rawget(A0_33, "layer")
end
function Avatar.layer_set(A0_35, A1_36, A2_37)
  if not A2_37 then
    return
  end
  if A0_35.layer == A2_37 then
    return
  end
  rawset(A0_35, "layer", A2_37)
  if not A0_35.parent then
    return
  end
  if not A0_35.parent[tostring(A2_37)] then
    return
  end
  A0_35.render:RemoveFromParentAndCleanup(false)
  A0_35.parent[tostring(A2_37)].render:AddChild(A0_35.render)
end
function Avatar.direction_get(A0_38, A1_39)
  return rawget(A0_38, "direction") or "left"
end
function Avatar.direction_set(A0_40, A1_41, A2_42)
  local L4_43
  if not A2_42 then
    return
  end
  L4_43 = A0_40.render
  if not L4_43 then
    return
  end
  if A2_42 == "left" then
    A0_40.child.all.avatar.x = 0
    A0_40.child.all.avatar.rotation_y = 0
  elseif A2_42 == "right" then
    A0_40.child.all.avatar.x = -5
    A0_40.child.all.avatar.rotation_y = -180
  else
    return
  end
  rawset(A0_40, "direction", A2_42)
  A0_40.fire = "Direction"
end
function Avatar.frames_get(A0_44, A1_45)
  return rawget(A0_44, "frames")
end
function Avatar.frames_set(A0_46, A1_47, A2_48)
  local L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55
  L3_49 = A0_46.frames
  if L3_49 ~= nil then
    for L7_53, L8_54 in L4_50(L5_51) do
      L8_54.body = A2_48
    end
    return
  end
  A0_46.action_tag = L4_50
  L3_49 = L5_51
  L9_55 = L6_52(L7_53, L8_54)
  for L9_55, _FORV_10_ in L6_52(L7_53) do
    AvatarFrame(L9_55).tag = PLAYER_NODE_FRAME_TAG
    AvatarFrame(L9_55).order = PLAYER_FRAME_ORDER
    L3_49[L9_55], AvatarFrame(L9_55).body = AvatarFrame(L9_55), A2_48
    L4_50[Lightuserdata(AvatarFrame(L9_55).render)] = L9_55
  end
  L9_55 = L3_49
  L6_52(L7_53, L8_54, L9_55)
end
function Avatar.frames_set_set(A0_56, A1_57, A2_58, A3_59, A4_60)
  local L5_61, L6_62
  L5_61 = A0_56.frames
  if not L5_61 then
    return
  end
  if A4_60 then
    L6_62 = {A3_59, A4_60}
  else
    L6_62 = L6_62 or A3_59
  end
  for _FORV_10_, _FORV_11_ in pairs(L5_61) do
    _FORV_11_[A2_58] = L6_62
  end
end
function Avatar.action_tag_get(A0_63)
  return rawget(A0_63, "action_tag")
end
function Avatar.action_tag_set(A0_64, A1_65, A2_66)
  rawset(A0_64, "action_tag", A2_66)
end
function Avatar.actions_get(A0_67, A1_68)
  return rawget(A0_67, "actions")
end
function Avatar.actions_set(A0_69, A1_70, A2_71)
  local L3_72, L4_73, L5_74, L6_75, L7_76, L8_77, L9_78, L10_79, L11_80, L12_81, L13_82, L14_83, L15_84, L16_85, L17_86, L18_87, L19_88, L20_89, L21_90
  L3_72 = A0_69.actions
  if L3_72 ~= nil then
    return
  end
  L4_73 = LoadConf
  L5_74 = "Config/Action.conf"
  L4_73 = L4_73(L5_74)
  if not L4_73 then
    return
  end
  L5_74 = L4_73.data
  L6_75 = L4_73.frame
  L7_76 = {}
  L3_72 = L7_76
  L7_76 = A0_69.frames
  L11_80 = L3_72
  L8_77(L9_78, L10_79, L11_80)
  for L11_80, L12_81 in L8_77(L9_78) do
    L13_82 = Array
    L13_82 = L13_82()
    for L17_86 = L12_81.start, L12_81.final do
      L18_87 = L5_74[L17_86]
      L19_88 = L18_87.name
      L20_89 = L18_87.delay
      L20_89 = L20_89 or 0
      if L19_88 == "hide" then
        L21_90 = Hide
        L21_90 = L21_90()
      elseif not L21_90 then
        if L19_88 == "show" then
          L21_90 = Show
          L21_90 = L21_90()
        elseif not L21_90 then
          L21_90 = NodeAnimate
          L21_90 = L21_90(L7_76[L19_88] and L7_76[L19_88].render or nil, L20_89 / 1000)
        end
      end
      if L21_90 ~= nil then
        L13_82:AddObject(L21_90)
        if L18_87.x and L18_87.y then
          L21_90:SetPosition(L18_87.x, L18_87.y)
        end
      end
    end
    L3_72[L11_80] = L13_82
  end
end
function Avatar.status_get(A0_91, A1_92)
  return rawget(A0_91, "status")
end
function Avatar.weapon_stand_get(A0_93, A1_94)
  local L2_95
  L2_95 = A0_93.weapon
  if not L2_95 then
    L2_95 = "stand1"
    return L2_95
  end
  L2_95 = LoadConf
  L2_95 = L2_95(string.format("Item/%d.item", A0_93.weapon))
  L2_95 = L2_95.info
  L2_95 = L2_95.stand
  return L2_95 or "stand1"
end
function Avatar.weapon_walk_get(A0_96, A1_97)
  local L2_98
  L2_98 = A0_96.weapon
  if not L2_98 then
    L2_98 = "walk1"
    return L2_98
  end
  L2_98 = LoadConf
  L2_98 = L2_98(string.format("Item/%d.item", A0_96.weapon))
  L2_98 = L2_98.info
  L2_98 = L2_98.walk
  return L2_98 or "walk1"
end
function Avatar.status_action_get(A0_99, A1_100)
  return rawget(A0_99, "status_action")
end
function Avatar.status_action_set(A0_101, A1_102, A2_103)
  rawset(A0_101, "status_action", A2_103)
end
function Avatar.status_name(A0_104, A1_105, A2_106)
  local L3_107
  L3_107 = STATUS_LADDER
  if A1_105 == L3_107 then
    L3_107 = "ladder"
    return L3_107
  end
  L3_107 = STATUS_ROPE
  if A1_105 == L3_107 then
    L3_107 = "rope"
    return L3_107
  end
  L3_107 = STATUS_WALK
  if A1_105 == L3_107 then
    L3_107 = "walk"
    return L3_107
  end
  L3_107 = STATUS_STAND
  if A1_105 == L3_107 then
    if A2_106 then
      L3_107 = "alert"
    else
      L3_107 = L3_107 or "stand"
    end
    return L3_107
  end
  L3_107 = STATUS_DIE
  if A1_105 == L3_107 then
    L3_107 = "prone"
    return L3_107
  end
  L3_107 = STATUS_JUMP
  if A1_105 == L3_107 then
    L3_107 = A0_104.swim
    if L3_107 then
      L3_107 = "fly"
    else
      L3_107 = L3_107 or "jump"
    end
    return L3_107
  end
  L3_107 = STATUS_FALL
  if A1_105 == L3_107 then
    L3_107 = A0_104.swim
    if L3_107 then
      L3_107 = "fly"
    else
      L3_107 = L3_107 or "jump"
    end
    return L3_107
  end
end
function Avatar.action_set(A0_108, A1_109, A2_110)
  local L3_111
  L3_111 = A0_108.avatar
  L3_111.unaction, A0_108.status_action = A0_108.status_action, A2_110
  L3_111.action = A2_110
end
function Avatar.status_set(A0_112, A1_113, A2_114, A3_115, A4_116)
  local L5_117
  if not A2_114 then
    return
  end
  L5_117 = Avatar
  L5_117 = L5_117.status_name
  L5_117 = L5_117(A0_112, A2_114, A3_115)
  A2_114 = L5_117
  if not A2_114 then
    return
  end
  if A2_114 == "stand" then
    A2_114 = A0_112.weapon_stand
  end
  if A2_114 == "walk" then
    A2_114 = A0_112.weapon_walk
  end
  if not A4_116 then
    L5_117 = A0_112.status
    if L5_117 == A2_114 then
      return
    end
  end
  L5_117 = A0_112.actions
  L5_117 = L5_117[A2_114]
  if not L5_117 then
    return
  end
  rawset(A0_112, "status", A2_114)
  A0_112.fire = "Status"
  A0_112.action = RepeatForever(Sequence(L5_117))
end
function Avatar.unstatus_action_set(A0_118, A1_119, A2_120)
  A0_118.avatar.unaction = A0_118.status_action
end
function Avatar.body_get(A0_121, A1_122)
  return rawget(A0_121, "body")
end
function Avatar.body_set(A0_123, A1_124, A2_125)
  if A0_123.body == A2_125 then
    return
  end
  rawset(A0_123, "body", A2_125)
  A0_123.frames = A2_125
  A0_123.actions = A2_125
  A0_123.fire = {
    "modify",
    "body",
    A2_125
  }
end
function Avatar.face_get(A0_126, A1_127)
  return rawget(A0_126, "face")
end
function Avatar.face_set(A0_128, A1_129, A2_130)
  if A0_128.face == A2_130 then
    return
  end
  rawset(A0_128, "face", A2_130)
  A0_128.frames_set = {"face", A2_130}
  A0_128.fire = {
    "modify",
    "face",
    A2_130
  }
end
function Avatar.cap_get(A0_131, A1_132)
  return rawget(A0_131, "cap")
end
function Avatar.cap_set(A0_133, A1_134, A2_135)
  if A0_133.cap == A2_135 then
    return
  end
  rawset(A0_133, "cap", A2_135)
  A0_133.frames_set = {"cap", A2_135}
  A0_133.hair_type, A0_133.fire = A2_135 and LoadConf(string.format("Item/%d.item", A2_135)).info.stype or nil, {
    "modify",
    "cap",
    A2_135
  }
end
function Avatar.hair_type_get(A0_136, A1_137)
  return rawget(A0_136, "hair_type")
end
function Avatar.hair_type_set(A0_138, A1_139, A2_140)
  if A0_138.hair_type == A2_140 then
    return
  end
  rawset(A0_138, "hair_type", A2_140)
  if not A2_140 then
    A0_138.frames_set = {
      "hair",
      A0_138.hair
    }
  end
  if A2_140 == "nohair" then
    A0_138.frames_set = {"hair", nil}
    return
  end
  if A2_140 == "caphair" then
    A0_138.frames_set = A0_138.hair and {
      "hair",
      A0_138.hair,
      true
    } or {"hair"}
  end
end
function Avatar.hair_get(A0_141, A1_142)
  return rawget(A0_141, "hair")
end
function Avatar.hair_set(A0_143, A1_144, A2_145)
  if A0_143.hair == A2_145 then
    return
  end
  rawset(A0_143, "hair", A2_145)
  if A0_143.hair_type == "nohair" or not A2_145 then
    A2_145 = nil
  end
  if A2_145 then
  else
  end
  A0_143.frames_set = {
    "hair",
    A2_145,
    A0_143.hair_type == "caphair"
  } or {"hair"}
  A0_143.fire = {
    "modify",
    "hair",
    A2_145
  }
end
function Avatar.eardrop_get(A0_146, A1_147)
  return rawget(A0_146, "eardrop")
end
function Avatar.eardrop_set(A0_148, A1_149, A2_150)
  if A0_148.eardrop == A2_150 then
    return
  end
  rawset(A0_148, "eardrop", A2_150)
  A0_148.frames_set = {"eardrop", A2_150}
  A0_148.fire = {
    "modify",
    "eardrop",
    A2_150
  }
end
function Avatar.coat_get(A0_151, A1_152)
  return rawget(A0_151, "coat")
end
function Avatar.coat_set(A0_153, A1_154, A2_155)
  if A0_153.coat == A2_155 then
    return
  end
  A2_155 = A2_155 or A0_153.longcoat or 1040036 or A2_155
  rawset(A0_153, "coat", A2_155)
  if A2_155 then
    A0_153.longcoat = nil
  end
  A0_153.frames_set = {"coat", A2_155}
  A0_153.fire = {
    "modify",
    "coat",
    A2_155
  }
end
function Avatar.pants_get(A0_156, A1_157)
  return rawget(A0_156, "pants")
end
function Avatar.pants_set(A0_158, A1_159, A2_160)
  if A0_158.pants == A2_160 then
    return
  end
  A2_160 = A2_160 or A0_158.longcoat or 1060026 or A2_160
  rawset(A0_158, "pants", A2_160)
  if A2_160 then
    A0_158.longcoat = nil
  end
  A0_158.frames_set = {"pants", A2_160}
  A0_158.fire = {
    "modify",
    "pants",
    A2_160
  }
end
function Avatar.longcoat_get(A0_161, A1_162)
  return rawget(A0_161, "longcoat")
end
function Avatar.longcoat_set(A0_163, A1_164, A2_165)
  if A0_163.longcoat == A2_165 then
    return
  end
  rawset(A0_163, "longcoat", A2_165)
  if A2_165 then
    A0_163.coat = nil
    A0_163.pants = nil
  end
  if not A2_165 and not A0_163.coat then
    A0_163.coat = 1040036
  end
  if not A2_165 and not A0_163.pants then
    A0_163.pants = 1060026
  end
  A0_163.longcoat = A2_165
  A0_163.frames_set = {"longcoat", A2_165}
  A0_163.fire = {
    "modify",
    "longcoat",
    A2_165
  }
end
function Avatar.cape_get(A0_166, A1_167)
  return rawget(A0_166, "cape")
end
function Avatar.cape_set(A0_168, A1_169, A2_170)
  if A0_168.cape == A2_170 then
    return
  end
  rawset(A0_168, "cape", A2_170)
  A0_168.frames_set = {"cape", A2_170}
  A0_168.fire = {
    "modify",
    "cape",
    A2_170
  }
end
function Avatar.weapon_get(A0_171, A1_172)
  return rawget(A0_171, "weapon")
end
function Avatar.weapon_dualwield_get(A0_173, A1_174)
  local L2_175
  L2_175 = A0_173.weapon
  if not L2_175 then
    return
  end
  L2_175 = LoadConf
  L2_175 = L2_175(string.format("Item/%d.item", A0_173.weapon))
  if not L2_175 then
    return
  end
  return L2_175.info.stype == "dualwield"
end
function Avatar.weapon_set(A0_176, A1_177, A2_178)
  local L3_179
  L3_179 = A0_176.weapon
  if L3_179 == A2_178 then
    return
  end
  L3_179 = rawset
  L3_179(A0_176, "weapon", A2_178)
  L3_179 = A0_176.weapon_dualwield
  if L3_179 then
    A0_176.shield = nil
  end
  L3_179 = {
    "modify",
    "weapon",
    A2_178
  }
  A0_176.fire = L3_179
  L3_179 = A0_176.weapon_visible
  if L3_179 then
    L3_179 = {"weapon", A2_178}
    A0_176.frames_set = L3_179
  end
  L3_179 = A0_176.status
  if not L3_179 then
    return
  end
  if string.find(L3_179, "stand") then
    A0_176.status = STATUS_STAND
    return
  end
  if string.find(L3_179, "walk") then
    A0_176.status = STATUS_WALK
    return
  end
end
function Avatar.weapon_visible_get(A0_180)
  return rawget(A0_180, "weapon_visible")
end
function Avatar.weapon_visible_set(A0_181, A1_182, A2_183)
  if A0_181.weapon_visible == A2_183 then
    return
  end
  rawset(A0_181, "weapon_visible", A2_183)
  A0_181.frames_set = {
    "weapon",
    A2_183 and A0_181.weapon or nil
  }
end
function Avatar.glove_get(A0_184, A1_185)
  return rawget(A0_184, "glove")
end
function Avatar.glove_set(A0_186, A1_187, A2_188)
  if A0_186.glove == A2_188 then
    return
  end
  rawset(A0_186, "glove", A2_188)
  A0_186.frames_set = {"glove", A2_188}
  A0_186.fire = {
    "modify",
    "glove",
    A2_188
  }
end
function Avatar.shoes_get(A0_189, A1_190)
  return rawget(A0_189, "shoes")
end
function Avatar.shoes_set(A0_191, A1_192, A2_193)
  if A0_191.shoes == A2_193 then
    return
  end
  rawset(A0_191, "shoes", A2_193)
  A0_191.frames_set = {"shoes", A2_193}
  A0_191.fire = {
    "modify",
    "shoes",
    A2_193
  }
end
function Avatar.shield_get(A0_194, A1_195)
  return rawget(A0_194, "shield")
end
function Avatar.shield_set(A0_196, A1_197, A2_198)
  if A0_196.shield == A2_198 then
    return
  end
  rawset(A0_196, "shield", A2_198)
  A0_196.frames_set = {"shield", A2_198}
  A0_196.fire = {
    "modify",
    "shield",
    A2_198
  }
end
function Avatar.on_start_fire(A0_199)
  local L1_200
  L1_200 = A0_199.parent
  if not L1_200 then
    return
  end
  if A0_199.render:Parent() then
    return
  end
  if not (L1_200.class == "Map" and L1_200[tostring(A0_199.layer)] or L1_200) then
    return
  end
  ;(L1_200.class == "Map" and L1_200[tostring(A0_199.layer)] or L1_200).render:AddChild(A0_199.render, 1000000000)
end
function Avatar.on_stop_fire(A0_201)
  if not A0_201.parent then
    return
  end
  A0_201.render:RemoveFromParentAndCleanup(false)
end
function Avatar.on_parent_fire(A0_202)
  local L1_203
  L1_203 = A0_202.parent
  if not L1_203 then
    A0_202.render:RemoveFromParent()
    return
  end
  if not (L1_203.class == "Map" and L1_203[tostring(A0_202.layer)] or L1_203) then
    return
  end
  A0_202.render:RemoveFromParentAndCleanup(false)
  ;(L1_203.class == "Map" and L1_203[tostring(A0_202.layer)] or L1_203).render:AddChild(A0_202.render, 1000000000)
end
function Avatar.pause_actions_set(A0_204, A1_205, A2_206)
  local L3_207
  L3_207 = A0_204.avatar
  if not L3_207 then
    return
  end
  L3_207.pause_actions = A2_206
end
function Avatar.resume_actions_set(A0_208, A1_209, A2_210)
  local L3_211
  L3_211 = A0_208.avatar
  if not L3_211 then
    return
  end
  L3_211.resume_actions = A2_210
end
