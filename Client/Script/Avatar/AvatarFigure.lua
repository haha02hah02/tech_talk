Class.AvatarFigure.AvatarFrame({})
function AvatarFigure.Constructor(A0_212, A1_213)
  AvatarFrame.Constructor(A0_212, A1_213)
  A0_212.rotation_y = -180
  Image("UI/NameTag/NameTag.ntp").name = "name_tag"
  Image("UI/NameTag/NameTag.ntp").x = 0
  Image("UI/NameTag/NameTag.ntp").y = -26
  Image("UI/NameTag/NameTag.ntp").order = 100000
  Image("UI/NameTag/NameTag.ntp").rotation_y = -180
  Image("UI/NameTag/NameTag.ntp").parent = A0_212
  Label("123456", "\228\187\191\229\174\139", 13).name = "tag_name"
  Label("123456", "\228\187\191\229\174\139", 13).x = 0
  Label("123456", "\228\187\191\229\174\139", 13).y = -26
  Label("123456", "\228\187\191\229\174\139", 13).order = 100000
  Label("123456", "\228\187\191\229\174\139", 13).rotation_y = -180
  Label("123456", "\228\187\191\229\174\139", 13).parent = A0_212
end
function AvatarFigure.copy_set(A0_214, A1_215, A2_216)
  local L3_217, L4_218
  if not A2_216 then
    return
  end
  L3_217 = string
  L3_217 = L3_217.format
  L4_218 = "%s_1"
  L3_217 = L3_217(L4_218, A2_216.weapon_stand)
  L4_218 = A0_214.frame_name
  if L4_218 ~= L3_217 then
    A0_214.body = nil
  end
  A0_214.frame_name = L3_217
  L4_218 = A2_216.body
  A0_214.body = L4_218
  L4_218 = A2_216.cap
  A0_214.cap = L4_218
  L4_218 = A2_216.hair_type
  if L4_218 ~= "nohair" then
    L4_218 = A2_216.hair
  else
    L4_218 = L4_218 or nil
  end
  if L4_218 then
  else
  end
  A0_214.hair = {
    L4_218,
    A2_216.hair_type == "caphair"
  } or nil
  A0_214.eardrop = A2_216.eardrop
  A0_214.face = A2_216.face
  A0_214.coat = A2_216.coat
  A0_214.pants = A2_216.pants
  A0_214.longcoat = A2_216.longcoat
  A0_214.glove = A2_216.glove
  A0_214.cape = A2_216.cape
  A0_214.weapon = A2_216.weapon
  A0_214.shield = A2_216.shield
  A0_214.shoes = A2_216.shoes
end
