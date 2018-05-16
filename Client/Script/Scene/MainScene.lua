Class.MainScene.Scenario({})
function MainScene.Constructor(A0_7283)
  Scenario.Constructor(A0_7283)
  A0_7283.name = "world"
  A0_7283.bgm = {
    "Music/BgmUI/Title.mp3",
    true
  }
  A0_7283.first = true
  Image("UI/Login/Back/back.ntp").name = "back"
  Image("UI/Login/Back/back.ntp").x = Config.ScreenWidth / 2
  Image("UI/Login/Back/back.ntp").y = Config.ScreenHeight / 2
  Image("UI/Login/Back/back.ntp").order = -1
  Image("UI/Login/Back/back.ntp").parent = A0_7283
  Label("\231\179\187\231\187\159\230\143\144\231\164\186~", "\228\187\191\229\174\139", 20).name = "system_notice"
  Label("\231\179\187\231\187\159\230\143\144\231\164\186~", "\228\187\191\229\174\139", 20).x = 400
  Label("\231\179\187\231\187\159\230\143\144\231\164\186~", "\228\187\191\229\174\139", 20).y = 480
  Label("\231\179\187\231\187\159\230\143\144\231\164\186~", "\228\187\191\229\174\139", 20).color = 3690987520
  Label("\231\179\187\231\187\159\230\143\144\231\164\186~", "\228\187\191\229\174\139", 20).dimensions = {700, 0}
  Label("\231\179\187\231\187\159\230\143\144\231\164\186~", "\228\187\191\229\174\139", 20).visible = false
  Label("\231\179\187\231\187\159\230\143\144\231\164\186~", "\228\187\191\229\174\139", 20).parent = A0_7283
  A0_7283.component = "Model/lifegame.model"
  A0_7283.component = "Model/version.model"
  A0_7283.component = "Model/notice.model"
  A0_7283.component = "Model/login.model"
  A0_7283.component = "Model/users.model"
end
function MainScene.class_get(A0_7284, A1_7285)
  local L2_7286
  L2_7286 = "MainScene"
  return L2_7286
end
function MainScene.first_get(A0_7287, A1_7288)
  return rawget(A0_7287, "first")
end
function MainScene.first_set(A0_7289, A1_7290, A2_7291)
  rawset(A0_7289, "first", A2_7291)
end
function MainScene.rrender_get(A0_7292, A1_7293)
  local L2_7294
  L2_7294 = A0_7292.render
  if not L2_7294 then
    return
  end
  if not A0_7292.first then
    return TransitionFade(2, L2_7294)
  end
  A0_7292.first = false
  return L2_7294
end
