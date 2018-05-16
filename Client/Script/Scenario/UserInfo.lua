L0_7117 = Class
L0_7117 = L0_7117.UserInfo
L0_7117 = L0_7117.Script
L0_7117({})
L0_7117 = {}
L0_7117[1] = "necklace"
L0_7117[2] = "accessory"
L0_7117[3] = "cap"
L0_7117[4] = "eardrop"
L0_7117[5] = "belt"
L0_7117[6] = "coat"
L0_7117[7] = "shoulder"
L0_7117[8] = "pants"
L0_7117[9] = "glove"
L0_7117[10] = "weapon"
L0_7117[11] = "assistant"
L0_7117[12] = "lring"
L0_7117[13] = "badge"
L0_7117[14] = "shoes"
L0_7117[15] = "cape"
L0_7117[16] = "rring"
for _FORV_5_, _FORV_6_ in ipairs(L0_7117) do
  ;({})[_FORV_6_] = _FORV_5_
end
function UserInfo.Constructor(A0_7118, A1_7119)
  local L2_7120, L3_7121, L4_7122, L5_7123, L6_7124
  L2_7120(L3_7121, L4_7122)
  if not A1_7119 then
    return
  end
  for L5_7123, L6_7124 in L2_7120(L3_7121) do
    A1_7119[string.format("b%s", L6_7124)].tag = L5_7123
    A1_7119[string.format("b%s", L6_7124)].on = {
      "Down",
      A0_7118,
      A0_7118.OnItemDown
    }
    A1_7119[string.format("b%s", L6_7124)].on = {
      "Up",
      A0_7118,
      A0_7118.OnItemUp
    }
  end
  L5_7123 = A0_7118.OnVisible
  A1_7119.on = L2_7120
  L5_7123 = A0_7118
  L6_7124 = A0_7118.OnUpdate
  L2_7120(L3_7121, L4_7122, L5_7123, L6_7124)
end
function UserInfo.FocusAction(A0_7125)
  local L1_7126, L2_7127, L3_7128, L4_7129, L5_7130, L6_7131, L7_7132
  L1_7126 = Array
  L1_7126 = L1_7126()
  for L5_7130 = 0, 7 do
    L6_7131 = string
    L6_7131 = L6_7131.format
    L7_7132 = "UI/Select/%d.ntp"
    L6_7131 = L6_7131(L7_7132, L5_7130)
    L7_7132 = Animate
    L7_7132 = L7_7132(L6_7131, 0, 0, 0.15)
    if L7_7132 ~= nil then
      L1_7126:AddObject(L7_7132)
    end
  end
  L7_7132 = L3_7128(L4_7129)
  return L2_7127(L3_7128, L4_7129, L5_7130, L6_7131, L7_7132, L3_7128(L4_7129))
end
function UserInfo.OnItemDown(A0_7133, A1_7134)
  if not A0_7133:Parent()[string.sub(A1_7134.name, 2)].view then
    return
  end
  Sound:PlayEffect("Music/UI/BtMouseOver.mp3")
  A0_7133.select_index = A1_7134.tag
  A0_7133.equip_show_count = 0
  if A0_7133:Parent().focus.tag == A1_7134.tag then
    return
  end
  A0_7133:Parent().focus.unactions = true
  A0_7133:Parent().focus.action = A0_7133:FocusAction()
  A0_7133:Parent().focus.visible = true
  A0_7133:Parent().focus.x = A0_7133:Parent()[string.sub(A1_7134.name, 2)].x
  A0_7133:Parent().focus.y = A0_7133:Parent()[string.sub(A1_7134.name, 2)].y
end
function UserInfo.OnItemUp(A0_7135, A1_7136)
  local L2_7137, L3_7138, L4_7139, L5_7140, L6_7141, L7_7142
  L2_7137 = string
  L2_7137 = L2_7137.sub
  L3_7138 = A1_7136.name
  L4_7139 = 2
  L2_7137 = L2_7137(L3_7138, L4_7139)
  L4_7139 = A0_7135
  L3_7138 = A0_7135.Parent
  L3_7138 = L3_7138(L4_7139)
  L4_7139 = L3_7138[L2_7137]
  L5_7140 = L3_7138.focus
  L6_7141 = L5_7140.tag
  L7_7142 = A1_7136.tag
  L5_7140.tag = L7_7142
  A0_7135.equip_show_count = nil
  L7_7142 = L4_7139.view
  if not L7_7142 then
    return
  end
  L7_7142 = A1_7136.tag
  if L6_7141 ~= L7_7142 then
    return
  end
  L7_7142 = L4_7139.cash
  L7_7142 = L7_7142 or L4_7139.item
  if not L7_7142 then
    return
  end
  if not UniqueComponent("Model/interface.model").ui.ibackpack.Backpack:Insert(L7_7142) then
    return
  end
  L7_7142.unequip = A0_7135.session
  L5_7140.visible = false
  L5_7140.tag = 0
  A0_7135.session.data.inc_hp = 0
  A0_7135.session.data.inc_mp = 0
  if L4_7139.cash or L4_7139.item then
    ;(L4_7139.cash or L4_7139.item).view.parent = L4_7139
  end
  A0_7135:RefreshAvatar(L7_7142.type)
  if L7_7142.stype == "longcoat" then
    A0_7135:RefreshAvatar("pants")
  end
end
function UserInfo.RefreshAvatar(A0_7143, A1_7144)
  if not A0_7143.session then
    return
  end
  if A1_7144 == "necklace" then
    return
  end
  if A1_7144 == "belt" then
    return
  end
  if A1_7144 == "shoulder" then
    return
  end
  if A1_7144 == "badge" then
    return
  end
  if A1_7144 == "lring" then
    return
  end
  if A1_7144 == "rring" then
    return
  end
  if A1_7144 == "coat" then
    A0_7143.session.proxy[not (A0_7143:Parent().coat.cash or A0_7143:Parent().coat.item) and "coat" or (A0_7143:Parent().coat.cash or A0_7143:Parent().coat.item).stype ~= "longcoat" and "coat" or "longcoat"] = (A0_7143:Parent().coat.cash or A0_7143:Parent().coat.item) and (A0_7143:Parent().coat.cash or A0_7143:Parent().coat.item).id or 1040036
  elseif A1_7144 == "pants" then
    if (A0_7143:Parent().coat.cash or A0_7143:Parent().coat.item) and (A0_7143:Parent().coat.cash or A0_7143:Parent().coat.item).stype == "longcoat" then
      return
    end
    A0_7143.session.proxy.pants = (A0_7143:Parent().pants.cash or A0_7143:Parent().pants.item) and (A0_7143:Parent().pants.cash or A0_7143:Parent().pants.item).id or 1060026
  elseif A1_7144 == "assistant" then
    if not (A0_7143:Parent()[A1_7144].cash or A0_7143:Parent()[A1_7144].item) or (A0_7143:Parent()[A1_7144].cash or A0_7143:Parent()[A1_7144].item).stype ~= "shield" then
      A0_7143.session.proxy.shield = nil
    end
    if (A0_7143:Parent()[A1_7144].cash or A0_7143:Parent()[A1_7144].item) and (A0_7143:Parent()[A1_7144].cash or A0_7143:Parent()[A1_7144].item).stype == "shield" then
      A0_7143.session.proxy.shield = (A0_7143:Parent()[A1_7144].cash or A0_7143:Parent()[A1_7144].item).id
    end
  else
    A0_7143.session.proxy[A1_7144] = (A0_7143:Parent()[A1_7144].cash or A0_7143:Parent()[A1_7144].item) and (A0_7143:Parent()[A1_7144].cash or A0_7143:Parent()[A1_7144].item).id or nil
  end
  A0_7143:Parent().avatar.copy = A0_7143.session.proxy
  UniqueComponent("Model/interface.model").node.figure.copy = A0_7143.session.proxy
end
function UserInfo.SetSession(A0_7145, A1_7146)
  local L2_7147, L3_7148, L4_7149, L5_7150, L6_7151, L7_7152, L8_7153, L9_7154, L10_7155, L11_7156, L12_7157, L13_7158, L14_7159, L15_7160, L16_7161, L17_7162, L18_7163, L19_7164
  L2_7147 = A0_7145.session
  if L2_7147 == A1_7146 then
    return
  end
  A0_7145.session = A1_7146
  L3_7148 = A0_7145
  L2_7147 = A0_7145.Parent
  L2_7147 = L2_7147(L3_7148)
  L3_7148 = A1_7146.name
  L4_7149 = UniqueComponent
  L5_7150 = "Model/interface.model"
  L4_7149 = L4_7149(L5_7150)
  L5_7150 = L4_7149.ui
  L5_7150 = L5_7150.istatusicon
  L5_7150 = L5_7150.Statusicon
  L7_7152 = L5_7150
  L6_7151 = L5_7150.Clean
  L6_7151(L7_7152)
  L6_7151 = L4_7149.node
  L6_7151 = L6_7151.Interface
  L7_7152 = L6_7151
  L6_7151 = L6_7151.SetJobSkill
  L8_7153 = A1_7146.data
  L8_7153 = L8_7153.job
  L6_7151(L7_7152, L8_7153)
  L6_7151 = Setting
  L7_7152 = L6_7151
  L6_7151 = L6_7151.One
  L8_7153 = string
  L8_7153 = L8_7153.format
  L9_7154 = "belong = %d and name = 'mexp'"
  L10_7155 = A1_7146.name
  L10_7155 = L8_7153(L9_7154, L10_7155)
  L6_7151 = L6_7151(L7_7152, L8_7153, L9_7154, L10_7155, L11_7156, L12_7157, L13_7158, L14_7159, L15_7160, L16_7161, L17_7162, L18_7163, L19_7164, L8_7153(L9_7154, L10_7155))
  L7_7152 = Config
  if L6_7151 then
    L8_7153 = tonumber
    L9_7154 = L6_7151.data
    L8_7153 = L8_7153(L9_7154)
    L9_7154 = os
    L9_7154 = L9_7154.time
    L9_7154 = L9_7154()
    if L8_7153 > L9_7154 then
      L8_7153 = Config
      L8_7153 = L8_7153.OneNumber
    end
  elseif not L8_7153 then
    L8_7153 = Config
    L8_7153 = L8_7153.ZeroNumber
  end
  L7_7152.ExpMultiple = L8_7153
  L7_7152 = Config
  L7_7152 = L7_7152.ExpMultiple
  if L7_7152 > 0 then
    L8_7153 = L5_7150
    L7_7152 = L5_7150.SetIcon
    L9_7154 = 4100002
    L7_7152(L8_7153, L9_7154)
  end
  L7_7152 = Setting
  L8_7153 = L7_7152
  L7_7152 = L7_7152.One
  L9_7154 = string
  L9_7154 = L9_7154.format
  L10_7155 = "belong = %d and name = 'mdrop'"
  L10_7155 = L9_7154(L10_7155, L11_7156)
  L7_7152 = L7_7152(L8_7153, L9_7154, L10_7155, L11_7156, L12_7157, L13_7158, L14_7159, L15_7160, L16_7161, L17_7162, L18_7163, L19_7164, L9_7154(L10_7155, L11_7156))
  L8_7153 = Config
  if L7_7152 then
    L9_7154 = tonumber
    L10_7155 = L7_7152.data
    L9_7154 = L9_7154(L10_7155)
    L10_7155 = os
    L10_7155 = L10_7155.time
    L10_7155 = L10_7155()
    if L9_7154 > L10_7155 then
      L9_7154 = Config
      L9_7154 = L9_7154.OneNumber
    end
  elseif not L9_7154 then
    L9_7154 = Config
    L9_7154 = L9_7154.ZeroNumber
  end
  L8_7153.DropMultiple = L9_7154
  L8_7153 = Config
  L8_7153 = L8_7153.DropMultiple
  if L8_7153 > 0 then
    L9_7154 = L5_7150
    L8_7153 = L5_7150.SetIcon
    L10_7155 = 4110002
    L8_7153(L9_7154, L10_7155)
  end
  L8_7153 = Setting
  L9_7154 = L8_7153
  L8_7153 = L8_7153.One
  L10_7155 = string
  L10_7155 = L10_7155.format
  L10_7155 = L10_7155(L11_7156, L12_7157)
  L8_7153 = L8_7153(L9_7154, L10_7155, L11_7156, L12_7157, L13_7158, L14_7159, L15_7160, L16_7161, L17_7162, L18_7163, L19_7164, L10_7155(L11_7156, L12_7157))
  if L8_7153 then
    L9_7154 = tonumber
    L10_7155 = L8_7153.data
    L9_7154 = L9_7154(L10_7155)
    L10_7155 = os
    L10_7155 = L10_7155.time
    L10_7155 = L10_7155()
    if L9_7154 > L10_7155 then
      L10_7155 = L5_7150
      L9_7154 = L5_7150.SetIcon
      L9_7154(L10_7155, L11_7156)
    end
  end
  L9_7154 = Setting
  L10_7155 = L9_7154
  L9_7154 = L9_7154.One
  L9_7154 = L9_7154(L10_7155, L11_7156, L12_7157, L13_7158, L14_7159, L15_7160, L16_7161, L17_7162, L18_7163, L19_7164, L11_7156(L12_7157, L13_7158))
  L10_7155 = Config
  if L9_7154 then
  else
  end
  L10_7155.ExtraExpMultiple = L11_7156
  L10_7155 = Config
  L10_7155 = L10_7155.ExtraExpMultiple
  if L10_7155 > 0 then
    L10_7155 = L5_7150.SetIcon
    L10_7155(L11_7156, L12_7157)
  end
  L10_7155 = Setting
  L10_7155 = L10_7155.One
  L10_7155 = L10_7155(L11_7156, L12_7157, L13_7158, L14_7159, L15_7160, L16_7161, L17_7162, L18_7163, L19_7164, L12_7157(L13_7158, L14_7159))
  if L10_7155 then
  else
  end
  L11_7156.ExtraDropMultiple = L12_7157
  if L11_7156 > 0 then
    L11_7156(L12_7157, L13_7158)
  end
  for L14_7159, L15_7160 in L11_7156(L12_7157) do
    for _FORV_20_, _FORV_21_ in L17_7162(L18_7163) do
      _FORV_21_.parent = nil
    end
  end
  for L17_7162, L18_7163 in L14_7159(L15_7160) do
    L19_7164.parent, L19_7164.name = L2_7147[L19_7164.type], "item"
    L19_7164.view.name = "view"
    L19_7164.view.x = 20
    L19_7164.view.y = 20
    L19_7164.view.parent = L2_7147[L19_7164.type]
    if L19_7164.parent then
      L19_7164.equip = A1_7146
    end
    if not L19_7164.parent then
      L13_7158.Backpack:Insert(L19_7164)
    end
  end
  for L17_7162, L18_7163 in L14_7159(L15_7160) do
    L19_7164.parent, L19_7164.name = L2_7147[L19_7164.type], "cash"
    L19_7164.view.name = "view"
    L19_7164.view.x = 20
    L19_7164.view.y = 20
    if L2_7147[L19_7164.type].view then
      L2_7147[L19_7164.type].view.parent = nil
    end
    L19_7164.view.parent = L2_7147[L19_7164.type]
    L19_7164.equip = A1_7146
  end
end
function UserInfo.Equip(A0_7165, A1_7166)
  local L2_7167, L3_7168, L4_7169, L5_7170, L6_7171, L7_7172, L8_7173, L9_7174, L10_7175, L11_7176, L12_7177, L13_7178, L14_7179, L15_7180, L16_7181, L17_7182
  L3_7168 = A0_7165
  L2_7167 = A0_7165.Parent
  L2_7167 = L2_7167(L3_7168)
  L3_7168 = L2_7167.parent
  L3_7168 = L3_7168.parent
  L4_7169 = L3_7168.parent
  L5_7170 = A0_7165.session
  if not L4_7169 or not L5_7170 then
    return
  end
  L6_7171 = L5_7170.data
  L7_7172 = UniqueComponent
  L8_7173 = "Model/interface.model"
  L7_7172 = L7_7172(L8_7173)
  L8_7173 = L7_7172.ui
  L8_7173 = L8_7173.ibackpack
  L9_7174 = L7_7172.node
  L9_7174 = L9_7174.Interface
  L10_7175 = A1_7166.req_job
  if L10_7175 then
    L10_7175 = A1_7166.req_job
    L11_7176 = L6_7171.major_job
    if L10_7175 ~= L11_7176 then
      L10_7175 = A1_7166.req_job
      L11_7176 = L6_7171.job
    end
  L10_7175 = L10_7175 ~= L11_7176 or true
  if L10_7175 == true then
    L12_7177 = L9_7174
    L11_7176 = L9_7174.SetNotice
    L13_7178 = 5
    L11_7176(L12_7177, L13_7178)
    return
  end
  L11_7176 = A1_7166.req_sex
  if L11_7176 then
    L11_7176 = A1_7166.req_sex
    L12_7177 = L6_7171.sex
    if L11_7176 ~= L12_7177 then
      L12_7177 = L9_7174
      L11_7176 = L9_7174.SetNotice
      L13_7178 = 6
      L11_7176(L12_7177, L13_7178)
      return
    end
  end
  L11_7176 = A1_7166.req_level
  L12_7177 = L6_7171.level
  if L11_7176 > L12_7177 then
    L12_7177 = L9_7174
    L11_7176 = L9_7174.SetNotice
    L13_7178 = 7
    L14_7179 = A1_7166.req_level
    L11_7176(L12_7177, L13_7178, L14_7179)
    return
  end
  L11_7176 = A1_7166.req_str
  L12_7177 = L6_7171.str
  if L11_7176 > L12_7177 then
    L12_7177 = L9_7174
    L11_7176 = L9_7174.SetNotice
    L13_7178 = 8
    L14_7179 = A1_7166.req_str
    L11_7176(L12_7177, L13_7178, L14_7179)
    return
  end
  L11_7176 = A1_7166.req_dex
  L12_7177 = L6_7171.dex
  if L11_7176 > L12_7177 then
    L12_7177 = L9_7174
    L11_7176 = L9_7174.SetNotice
    L13_7178 = 9
    L14_7179 = A1_7166.req_dex
    L11_7176(L12_7177, L13_7178, L14_7179)
    return
  end
  L11_7176 = A1_7166.req_int
  L12_7177 = L6_7171.int
  if L11_7176 > L12_7177 then
    L12_7177 = L9_7174
    L11_7176 = L9_7174.SetNotice
    L13_7178 = 10
    L14_7179 = A1_7166.req_int
    L11_7176(L12_7177, L13_7178, L14_7179)
    return
  end
  L11_7176 = A1_7166.req_luck
  L12_7177 = L6_7171.luck
  if L11_7176 > L12_7177 then
    L12_7177 = L9_7174
    L11_7176 = L9_7174.SetNotice
    L13_7178 = 11
    L14_7179 = A1_7166.req_luck
    L11_7176(L12_7177, L13_7178, L14_7179)
    return
  end
  L11_7176 = A1_7166.is_cash
  if L11_7176 then
    L11_7176 = "cash"
  else
    L11_7176 = L11_7176 or "item"
  end
  L12_7177 = A1_7166.type
  L13_7178 = A1_7166.stype
  L14_7179 = L2_7167[L12_7177]
  L15_7180 = L14_7179[L11_7176]
  L16_7181, L17_7182 = nil, nil
  if L12_7177 == "coat" and L13_7178 == "longcoat" then
    L16_7181 = L2_7167.pants
    L17_7182 = L16_7181[L11_7176]
  elseif L12_7177 == "pants" then
    if L2_7167.coat[L11_7176] and L2_7167.coat[L11_7176].stype == "longcoat" or false then
      L17_7182, L16_7181 = L2_7167.coat[L11_7176], L2_7167.coat
    end
  elseif L12_7177 == "assistant" and A1_7166.is_cash then
    if not L2_7167.assistant.item or L2_7167.assistant.item.stype ~= L13_7178 then
      return
    end
  elseif L12_7177 == "assistant" then
    if L2_7167.weapon.item and L2_7167.weapon.item.stype == "dualwield" then
      return
    end
  elseif L12_7177 == "weapon" and L13_7178 == "dualwield" then
    L16_7181 = L2_7167.assistant
    L17_7182 = L16_7181.item
  end
  if (L17_7182 and (L15_7180 and 1 or 0) + 1 or L15_7180 and 1 or 0) > L8_7173.Backpack:FreeGrid() then
    return
  end
  if L15_7180 then
    L8_7173.Backpack:Insert(L15_7180)
    L15_7180.unequip = L5_7170
  end
  if L17_7182 then
    L8_7173.Backpack:Insert(L17_7182)
    L17_7182.unequip = L5_7170
  end
  A1_7166.site = A1_7166.is_cash and "cequips" or "equips"
  A1_7166.name = A1_7166.is_cash and "cash" or "item"
  A1_7166.slot = nil
  A1_7166.parent = L14_7179
  A1_7166.view.x = 20
  A1_7166.view.y = 20
  if L14_7179.view then
    L14_7179.view.parent = nil
  end
  A1_7166.view.parent = nil
  ;(L14_7179.cash or L14_7179.item).view.parent = L14_7179
  A1_7166.equip = L5_7170
  L6_7171.inc_hp = 0
  L6_7171.inc_mp = 0
  A0_7165:RefreshAvatar(L12_7177)
  L8_7173.fire = "Changed"
  L8_7173.Backpack:CleanSelectStatus()
end
function UserInfo.OnVisible(A0_7183, A1_7184)
  if not A1_7184.visible then
    return
  end
  A1_7184.focus.visible = false
  A1_7184.focus.tag = 0
  if not A0_7183:Parent().parent.parent.parent or not A0_7183.session then
    return
  end
  if not A0_7183.session.data then
    return
  end
  if A0_7183.session.data.main_attr == 1 then
    A1_7184.str_bg.texture = "UI/UserInfo/info_back_small_light.ntp"
    A1_7184.dex_bg.texture = "UI/UserInfo/info_back_small.ntp"
    A1_7184.int_bg.texture = "UI/UserInfo/info_back_small.ntp"
    A1_7184.luck_bg.texture = "UI/UserInfo/info_back_small.ntp"
  elseif A0_7183.session.data.main_attr == 2 then
    A1_7184.str_bg.texture = "UI/UserInfo/info_back_small.ntp"
    A1_7184.dex_bg.texture = "UI/UserInfo/info_back_small_light.ntp"
    A1_7184.int_bg.texture = "UI/UserInfo/info_back_small.ntp"
    A1_7184.luck_bg.texture = "UI/UserInfo/info_back_small.ntp"
  elseif A0_7183.session.data.main_attr == 3 then
    A1_7184.str_bg.texture = "UI/UserInfo/info_back_small.ntp"
    A1_7184.dex_bg.texture = "UI/UserInfo/info_back_small_light.ntp"
    A1_7184.int_bg.texture = "UI/UserInfo/info_back_small.ntp"
    A1_7184.luck_bg.texture = "UI/UserInfo/info_back_small.ntp"
  elseif A0_7183.session.data.main_attr == 4 then
    A1_7184.str_bg.texture = "UI/UserInfo/info_back_small.ntp"
    A1_7184.dex_bg.texture = "UI/UserInfo/info_back_small_light.ntp"
    A1_7184.int_bg.texture = "UI/UserInfo/info_back_small.ntp"
    A1_7184.luck_bg.texture = "UI/UserInfo/info_back_small.ntp"
  end
  A1_7184.avatar.copy = A0_7183.session.proxy
  A1_7184.avatar.status = STATUS_FALL
  A1_7184.avatar.status = STATUS_STAND
  A1_7184.str_number.text = string.format("%d", math.floor(A0_7183.session.data.str))
  A1_7184.dex_number.text = string.format("%d", math.floor(A0_7183.session.data.dex))
  A1_7184.int_number.text = string.format("%d", math.floor(A0_7183.session.data.int))
  A1_7184.luck_number.text = string.format("%d", math.floor(A0_7183.session.data.luck))
  A1_7184.attack_number.text = string.format("%d ~ %d", math.floor(A0_7183.session.data.min_attack), math.floor(A0_7183.session.data.attack))
  A1_7184.critical_number.text = string.format("%d%%", math.floor(A0_7183.session.data.critical))
  A1_7184.multiple_number.text = string.format("%0.1f", A0_7183.session.data.multiple)
  A1_7184.pdd_number.text = string.format("%d", math.floor(A0_7183.session.data.pdd))
  A1_7184.mdd_number.text = string.format("%d", math.floor(A0_7183.session.data.mdd))
  A1_7184.hit_number.text = string.format("%d", math.floor(A0_7183.session.data.hit))
  A1_7184.dodge_number.text = string.format("%d", math.floor(A0_7183.session.data.dodge))
  A1_7184.speed_number.text = string.format("%d%%", math.floor(A0_7183.session.data.speed / A0_7183.session.data.base_speed * 100))
  A1_7184.jump_number.text = string.format("%d%%", math.floor(A0_7183.session.data.jump / A0_7183.session.data.base_jump * 100))
  A1_7184.user_name.text = Userinfo:One(string.format("serial = %d", A0_7183.session.name)) and Userinfo:One(string.format("serial = %d", A0_7183.session.name)).name or ""
  A1_7184.sex.checked = Account:One(string.format("serial = %d", Userinfo:One(string.format("serial = %d", A0_7183.session.name)) and Userinfo:One(string.format("serial = %d", A0_7183.session.name)).belong or 0)) and Account:One(string.format("serial = %d", Userinfo:One(string.format("serial = %d", A0_7183.session.name)) and Userinfo:One(string.format("serial = %d", A0_7183.session.name)).belong or 0)).sex == 1 or false
end
function UserInfo.OnUpdate(A0_7185, A1_7186)
  if not A0_7185.equip_show_count then
    return
  end
  A0_7185.equip_show_count = A0_7185.equip_show_count + A1_7186
  if A0_7185.equip_show_count < 1.0 then
    return
  end
  A0_7185.equip_show_count = nil
  A0_7185:Parent().focus.tag = 0
  if not (A0_7185:Parent()[L0_7117[A0_7185.select_index]].item or A0_7185:Parent()[L0_7117[A0_7185.select_index]].cash) then
    return
  end
  UniqueComponent("Model/interface.model").ui.iitemdetail.ItemDetail:SetItem((A0_7185:Parent()[L0_7117[A0_7185.select_index]].item or A0_7185:Parent()[L0_7117[A0_7185.select_index]].cash).id, (A0_7185:Parent()[L0_7117[A0_7185.select_index]].item or A0_7185:Parent()[L0_7117[A0_7185.select_index]].cash).level, (A0_7185:Parent()[L0_7117[A0_7185.select_index]].item or A0_7185:Parent()[L0_7117[A0_7185.select_index]].cash).slevel, (A0_7185:Parent()[L0_7117[A0_7185.select_index]].item or A0_7185:Parent()[L0_7117[A0_7185.select_index]].cash).enchant, (A0_7185:Parent()[L0_7117[A0_7185.select_index]].item or A0_7185:Parent()[L0_7117[A0_7185.select_index]].cash).stochastic)
  UniqueComponent("Model/interface.model").ui.iitemdetail.visible = true
end
