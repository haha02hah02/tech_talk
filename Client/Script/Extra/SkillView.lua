Class.SkillView.Component({})
function SkillView.Constructor(A0_3468, A1_3469, A2_3470)
  Component.Constructor(A0_3468)
  A0_3468.id = A1_3469
  A0_3468.info = A2_3470
  if not Node() then
    return
  end
  A0_3468.render = Node()
  Image(string.format("UI/Skill/%d.icon", A1_3469)).name = "icon"
  Image(string.format("UI/Skill/%d.icon", A1_3469)).x = 18
  Image(string.format("UI/Skill/%d.icon", A1_3469)).y = 20
  Image(string.format("UI/Skill/%d.icon", A1_3469)).parent = A0_3468
  Label(A2_3470.name, "\228\187\191\229\174\139", 12).name = "sname"
  Label(A2_3470.name, "\228\187\191\229\174\139", 12).x = 40
  Label(A2_3470.name, "\228\187\191\229\174\139", 12).y = 28
  Label(A2_3470.name, "\228\187\191\229\174\139", 12).color = 1010580735
  Label(A2_3470.name, "\228\187\191\229\174\139", 12).anchorpoint = {0, 0.5}
  Label(A2_3470.name, "\228\187\191\229\174\139", 12).parent = A0_3468
  Label("\229\141\135\231\186\167\232\166\129\230\177\130: \231\173\137\231\186\167Lv.10", "\228\187\191\229\174\139", 12).name = "state"
  Label("\229\141\135\231\186\167\232\166\129\230\177\130: \231\173\137\231\186\167Lv.10", "\228\187\191\229\174\139", 12).x = A0_3468.sname.width + 45
  Label("\229\141\135\231\186\167\232\166\129\230\177\130: \231\173\137\231\186\167Lv.10", "\228\187\191\229\174\139", 12).y = 28
  Label("\229\141\135\231\186\167\232\166\129\230\177\130: \231\173\137\231\186\167Lv.10", "\228\187\191\229\174\139", 12).color = 3355443455
  Label("\229\141\135\231\186\167\232\166\129\230\177\130: \231\173\137\231\186\167Lv.10", "\228\187\191\229\174\139", 12).anchorpoint = {0, 0.5}
  Label("\229\141\135\231\186\167\232\166\129\230\177\130: \231\173\137\231\186\167Lv.10", "\228\187\191\229\174\139", 12).parent = A0_3468
  Label(A2_3470.desc or "", "\228\187\191\229\174\139", 12).name = "desc"
  Label(A2_3470.desc or "", "\228\187\191\229\174\139", 12).x = 40
  Label(A2_3470.desc or "", "\228\187\191\229\174\139", 12).y = 11
  Label(A2_3470.desc or "", "\228\187\191\229\174\139", 12).color = 1010580735
  Label(A2_3470.desc or "", "\228\187\191\229\174\139", 12).anchorpoint = {0, 0.5}
  Label(A2_3470.desc or "", "\228\187\191\229\174\139", 12).parent = A0_3468
end
function SkillView.class_get(A0_3471)
  local L1_3472
  L1_3472 = "SkillView"
  return L1_3472
end
function SkillView.id_get(A0_3473)
  return rawget(A0_3473, "id")
end
function SkillView.id_set(A0_3474, A1_3475, A2_3476)
  rawset(A0_3474, "id", A2_3476)
end
function SkillView.info_get(A0_3477)
  return rawget(A0_3477, "info")
end
function SkillView.info_set(A0_3478, A1_3479, A2_3480)
  rawset(A0_3478, "info", A2_3480)
end
function SkillView.refresh_set(A0_3481, A1_3482, A2_3483)
  local L3_3484, L4_3485, L5_3486, L6_3487
  L3_3484 = A0_3481.info
  if not L3_3484 then
    return
  end
  L4_3485 = LoadConf
  L5_3486 = "Config/String.conf"
  L4_3485 = L4_3485(L5_3486)
  L5_3486 = A2_3483.data
  L5_3486 = L5_3486.level
  L6_3487 = math
  L6_3487 = L6_3487.max
  L6_3487 = L6_3487(L5_3486 - (L3_3484.req_level or 0), 0)
  L6_3487 = math.min(L6_3487, L3_3484.max_level or 0)
  if L6_3487 ~= 0 or not L3_3484.name then
  end
  A0_3481.sname.text = string.format("%s %d/%d", L3_3484.name, L6_3487, L3_3484.max_level)
  A0_3481.state.visible = L5_3486 ~= (L3_3484.req_level or 0) and L6_3487 == 0 or false
  if L6_3487 == 0 then
  elseif L5_3486 == (L3_3484.req_level or 0) then
    return
  end
  A0_3481.state.text = string.format(L4_3485.skill_level, L3_3484.req_level or 0)
end
