Class.Users.Script({})
function Users.Constructor(A0_7187, A1_7188)
  local L2_7189, L3_7190, L4_7191, L5_7192, L6_7193
  L2_7189 = Script
  L2_7189 = L2_7189.Constructor
  L2_7189(L3_7190, L4_7191)
  L2_7189 = A1_7188.lloading
  L2_7189.visible = false
  L2_7189 = A1_7188.rloading
  L2_7189.visible = false
  L2_7189 = A1_7188.new
  L2_7189.disable = true
  L2_7189 = A1_7188.go
  L2_7189.disable = true
  L2_7189 = A1_7188.account
  L6_7193 = A0_7187.OnAccountEnd
  L2_7189.on = L3_7190
  L2_7189 = A1_7188.new
  L6_7193 = A0_7187.OnNewDown
  L2_7189.on = L3_7190
  L2_7189 = A1_7188.go
  L6_7193 = A0_7187.OnStartGame
  L2_7189.on = L3_7190
  L2_7189 = A1_7188.quit
  L6_7193 = A0_7187.OnQuitDown
  L2_7189.on = L3_7190
  L2_7189 = A1_7188.delete
  L6_7193 = A0_7187.OnDeleteDown
  L2_7189.on = L3_7190
  L2_7189 = {
    L3_7190,
    L4_7191,
    L5_7192
  }
  for L6_7193 = 1, L4_7191.MaxUserNew do
    A1_7188[string.format("avatar%d", L6_7193)].on = L2_7189
  end
end
function Users.OnAccountResponse(A0_7194, A1_7195, A2_7196)
  A0_7194:Parent().account.enable = true
  A0_7194:Parent().lloading.visible = false
  A0_7194:Parent().rloading.visible = false
  A0_7194:Parent().lstatus.visible = true
  A0_7194:Parent().rstatus.visible = true
  A0_7194:Parent().lstatus.enable = A1_7195 == 0
  A0_7194:Parent().rstatus.enable = A1_7195 == 0
  A0_7194:Parent().new.enable = A1_7195 == 0
end
function Users.NameRealSize(A0_7197, A1_7198)
  local L2_7199, L3_7200, L4_7201, L5_7202, L6_7203, L7_7204, L8_7205
  L2_7199 = string
  L2_7199 = L2_7199.len
  L3_7200 = A1_7198
  L2_7199 = L2_7199(L3_7200)
  L3_7200 = 0
  L4_7201 = utf8
  L4_7201 = L4_7201.len
  L4_7201 = L4_7201(L5_7202)
  for L8_7205 = 1, L2_7199 do
    if string.byte(string.sub(A1_7198, L8_7205, L8_7205)) <= 128 then
      L3_7200 = L3_7200 + 1
    end
  end
  return L5_7202
end
function Users.OnAccountEnd(A0_7206, A1_7207)
  local L2_7208, L3_7209
  L3_7209 = A0_7206
  L2_7208 = A0_7206.Parent
  L2_7208 = L2_7208(L3_7209)
  L3_7209 = L2_7208.account
  L3_7209 = L3_7209.text
  if L3_7209 == "" then
    A0_7206:OnAccountResponse(-1)
    return
  end
  if A0_7206:NameRealSize(L3_7209) < 4 or A0_7206:NameRealSize(L3_7209) > 12 then
    A0_7206:OnAccountResponse(-1)
    return
  end
  L2_7208.account.disable = true
  L2_7208.lloading.visible = true
  L2_7208.rloading.visible = true
  L2_7208.lstatus.visible = false
  L2_7208.rstatus.visible = false
  AdventureSDK:NameExists(L3_7209, A0_7206, A0_7206.OnAccountResponse)
end
function Users.AvatarSet(A0_7210, A1_7211, A2_7212)
  local L3_7213
  L3_7213 = A2_7212.body
  A1_7211.body = L3_7213
  A1_7211.name = "avatar"
  L3_7213 = A2_7212.body
  A1_7211.body = L3_7213
  L3_7213 = A2_7212.cap
  A1_7211.cap = L3_7213
  L3_7213 = A2_7212.hair
  A1_7211.hair = L3_7213
  L3_7213 = A2_7212.face
  A1_7211.face = L3_7213
  L3_7213 = A2_7212.coat
  A1_7211.coat = L3_7213
  L3_7213 = A2_7212.pants
  A1_7211.pants = L3_7213
  L3_7213 = A2_7212.longcoat
  A1_7211.longcoat = L3_7213
  L3_7213 = A2_7212.glove
  A1_7211.glove = L3_7213
  L3_7213 = A2_7212.eardrop
  A1_7211.eardrop = L3_7213
  L3_7213 = A2_7212.cape
  A1_7211.cape = L3_7213
  L3_7213 = A2_7212.shoes
  A1_7211.shoes = L3_7213
  L3_7213 = A2_7212.weapon
  A1_7211.weapon = L3_7213
  L3_7213 = A2_7212.shield
  A1_7211.shield = L3_7213
  L3_7213 = A2_7212.name
  A1_7211.tag_name = L3_7213
  L3_7213 = A2_7212.name_tag
  L3_7213 = L3_7213 or 0
  A1_7211.name_tag = L3_7213
  L3_7213 = STATUS_STAND
  A1_7211.status = L3_7213
  A1_7211.direction = "right"
end
function Users.HandelAvatar(A0_7214, A1_7215, A2_7216)
  local L3_7217
  L3_7217 = A1_7215.avatar
  if not L3_7217 and not A2_7216 then
    return
  end
  if L3_7217 and not A2_7216 then
    A1_7215.tag = -1
    A1_7215.disable = true
    L3_7217.parent = nil
    return
  end
  L3_7217 = L3_7217 or Avatar()
  A0_7214:AvatarSet(L3_7217, A2_7216)
  L3_7217.parent = A1_7215
  A1_7215.enable = true
  A1_7215.tag = A2_7216.serial
end
function Users.Refresh(A0_7218)
  local L1_7219, L2_7220, L3_7221, L4_7222, L5_7223, L6_7224, L7_7225
  L2_7220 = A0_7218
  L1_7219 = A0_7218.Parent
  L1_7219 = L1_7219(L2_7220)
  L2_7220 = L1_7219.account
  L2_7220.text = ""
  L2_7220 = L1_7219.lstatus
  L2_7220.visible = false
  L2_7220 = L1_7219.rstatus
  L2_7220.visible = false
  L2_7220 = L1_7219.delete
  L2_7220.visible = false
  L2_7220 = Userinfo
  L3_7221 = L2_7220
  L2_7220 = L2_7220.Sum
  L2_7220 = L2_7220(L3_7221)
  L3_7221 = Userinfo
  L3_7221 = L3_7221.Find
  L7_7225 = nil
  L3_7221 = L3_7221(L4_7222, L5_7223, L6_7224, L7_7225, Config.MaxUserNew)
  L5_7223 = L2_7220 < L5_7223
  L4_7222.enable = L5_7223
  L4_7222.enable = false
  L4_7222.enable = false
  for L7_7225 = 1, L5_7223.MaxUserNew do
    A0_7218:HandelAvatar(L1_7219[string.format("avatar%d", L7_7225)], L3_7221[L7_7225])
  end
end
function Users.OnQuitDown(A0_7226)
  local L1_7227, L2_7228
  L1_7227 = A0_7226.bSwitching
  if L1_7227 then
    return
  end
  L2_7228 = A0_7226
  L1_7227 = A0_7226.Parent
  L1_7227 = L1_7227(L2_7228)
  L2_7228 = Array
  L2_7228 = L2_7228()
  L2_7228:AddObject(ActionME("Music/UI/ScrollUp.mp3"))
  L2_7228:AddObject(MoveBy(0.15, Point(0, 600)))
  L1_7227.parent.action = Sequence(L2_7228)
end
function Users.OnDeleteDown(A0_7229, A1_7230)
  local L2_7231, L3_7232
  L2_7231 = Userinfo
  L3_7232 = L2_7231
  L2_7231 = L2_7231.One
  L2_7231 = L2_7231(L3_7232, string.format("serial = %d and disable != 1", A1_7230.tag))
  if not L2_7231 then
    return
  end
  L3_7232 = Account
  L3_7232 = L3_7232.One
  L3_7232 = L3_7232(L3_7232, string.format("serial = %d", L2_7231.belong))
  if not L3_7232 then
    return
  end
  if not L3_7232.delable or L3_7232.delable < 1 then
    return
  end
  L3_7232.delable = L3_7232.delable - 1
  L2_7231.disable = 1
  A0_7229:Refresh()
  SQLManager:SyncToService()
end
function Users.OnSelectDown(A0_7233, A1_7234)
  local L2_7235, L3_7236, L4_7237, L5_7238, L6_7239
  L2_7235 = A0_7233.bSwitching
  if L2_7235 then
    return
  end
  L2_7235 = A0_7233.Parent
  L2_7235 = L2_7235(L3_7236)
  for L6_7239 = 1, L4_7237.MaxUserNew do
    if L2_7235[string.format("avatar%d", L6_7239)].avatar then
      L2_7235[string.format("avatar%d", L6_7239)].avatar.status = STATUS_STAND
    end
  end
  if L3_7236 then
  L5_7238 = L5_7238 > 0 or false
  L4_7237.visible = L5_7238
  if L4_7237 < 0 then
    return
  end
  L4_7237.x = L5_7238
  L4_7237.y = L5_7238
  L4_7237.tag = L5_7238
  L4_7237.status = L5_7238
  L4_7237.tag = L5_7238
  L4_7237.enable = true
end
function Users.OnNewDown(A0_7240, A1_7241)
  local L2_7242, L3_7243
  L2_7242 = A0_7240.bSwitching
  if L2_7242 then
    return
  end
  L2_7242 = Userinfo
  L3_7243 = L2_7242
  L2_7242 = L2_7242.Sum
  L2_7242 = L2_7242(L3_7243)
  L3_7243 = Config
  L3_7243 = L3_7243.MaxUserNew
  if L2_7242 >= L3_7243 then
    return
  end
  L3_7243 = A0_7240
  L2_7242 = A0_7240.Parent
  L2_7242 = L2_7242(L3_7243)
  L3_7243 = Array
  L3_7243 = L3_7243()
  L3_7243:AddObject(ActionME("Music/UI/ScrollUp.mp3"))
  L3_7243:AddObject(MoveBy(0.15, Point(0, -600)))
  L2_7242.parent.action = Sequence(L3_7243)
  if L2_7242.parent.jobs then
    return
  end
  L2_7242.parent.component = "Model/jobs.model"
end
function Users.StartGameBySerial(A0_7244, A1_7245)
  local L2_7246, L3_7247, L4_7248, L5_7249, L6_7250
  L2_7246 = Userinfo
  L3_7247 = L2_7246
  L2_7246 = L2_7246.One
  L4_7248 = string
  L4_7248 = L4_7248.format
  L5_7249 = "serial = %d"
  L6_7250 = A1_7245
  L6_7250 = L4_7248(L5_7249, L6_7250)
  L2_7246 = L2_7246(L3_7247, L4_7248, L5_7249, L6_7250, L4_7248(L5_7249, L6_7250))
  if not L2_7246 then
    return
  end
  L3_7247 = SceneByID
  L4_7248 = L2_7246.map
  L3_7247 = L3_7247(L4_7248)
  if not L3_7247 then
    return
  end
  L4_7248 = UniqueComponent
  L5_7249 = "Model/interface.model"
  L4_7248 = L4_7248(L5_7249)
  L4_7248 = L4_7248.ui
  L5_7249 = L3_7247.drop_point
  L6_7250 = SessionByInfo
  L6_7250 = L6_7250(L2_7246)
  L6_7250.parent = L3_7247.physical
  L6_7250.init_x = L5_7249.x
  L6_7250.init_y = L5_7249.y
  L6_7250.status = STATUS_FALL
  L3_7247.focus_object = L6_7250.name
  L4_7248.ibackpack.Backpack:SetSession(L6_7250)
  L4_7248.iuserinfo.UserInfo:SetSession(L6_7250)
  World:Launch(L3_7247)
end
function Users.OnSwitchResponse(A0_7251, A1_7252, A2_7253)
  local L3_7254, L4_7255, L5_7256, L6_7257
  A0_7251.bSwitching = false
  L4_7255 = A0_7251
  L3_7254 = A0_7251.Parent
  L3_7254 = L3_7254(L4_7255)
  L4_7255 = L3_7254.go
  L4_7255 = L4_7255.tag
  if A1_7252 == 400300 then
    L6_7257 = A0_7251
    L5_7256 = A0_7251.StartGameBySerial
    L5_7256(L6_7257, L4_7255)
  end
  if A1_7252 ~= 0 then
    return
  end
  if not A2_7253 then
    return
  end
  L5_7256 = {}
  L6_7257 = table
  L6_7257 = L6_7257.insert
  L6_7257(L5_7256, "Account")
  L6_7257 = table
  L6_7257 = L6_7257.insert
  L6_7257(L5_7256, "Integral")
  L6_7257 = table
  L6_7257 = L6_7257.insert
  L6_7257(L5_7256, "Userinfo")
  L6_7257 = SQLManager
  L6_7257 = L6_7257.CleanAll
  L6_7257(L6_7257, L5_7256)
  L6_7257 = A2_7253.First
  L6_7257 = L6_7257(A2_7253)
  while L6_7257 ~= nil do
    load("return " .. L6_7257)()
    L6_7257 = A2_7253:Next()
  end
  A0_7251:StartGameBySerial(L4_7255)
end
function Users.OnStartGame(A0_7258, A1_7259)
  local L2_7260, L3_7261
  L2_7260 = A1_7259.tag
  L3_7261 = Userinfo
  L3_7261 = L3_7261.One
  L3_7261 = L3_7261(L3_7261, string.format("serial = %d", L2_7260))
  if not L3_7261 then
    return
  end
  A1_7259.disable = true
  if A0_7258.bSwitching then
    return
  end
  A0_7258.bSwitching = true
  AdventureSDK:Switch(L2_7260, A0_7258, A0_7258.OnSwitchResponse)
end
function Users.Destructor(A0_7262)
  local L1_7263
end
