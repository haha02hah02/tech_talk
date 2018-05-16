Class.Jobs.Script({})
function Jobs.Constructor(A0_6587, A1_6588)
  Script.Constructor(A0_6587, A1_6588)
  A1_6588.scrollview.j100.button.on = {
    "Down",
    A0_6587,
    A0_6587.OnNewJobDown
  }
  A1_6588.scrollview.j200.button.on = {
    "Down",
    A0_6587,
    A0_6587.OnNewJobDown
  }
  A1_6588.scrollview.j210.button.on = {
    "Down",
    A0_6587,
    A0_6587.OnNewJobDown
  }
  A1_6588.scrollview.j300.button.on = {
    "Down",
    A0_6587,
    A0_6587.OnNewJobDown
  }
  A1_6588.scrollview.j400.button.on = {
    "Down",
    A0_6587,
    A0_6587.OnNewJobDown
  }
  A1_6588.scrollview.j510.button.on = {
    "Down",
    A0_6587,
    A0_6587.OnNewJobDown
  }
  A1_6588.scrollview.j520.button.on = {
    "Down",
    A0_6587,
    A0_6587.OnNewJobDown
  }
  A1_6588.scrollview.j530.button.on = {
    "Down",
    A0_6587,
    A0_6587.OnNewJobDown
  }
end
function Jobs.OnNewJobResponse(A0_6589, A1_6590, A2_6591)
  local L3_6592, L4_6593, L5_6594, L6_6595, L7_6596
  L4_6593 = A0_6589
  L3_6592 = A0_6589.Parent
  L3_6592 = L3_6592(L4_6593)
  L3_6592 = L3_6592.scrollview
  L4_6593 = L3_6592.j100
  L4_6593 = L4_6593.button
  L4_6593.enable = true
  L4_6593 = L3_6592.j200
  L4_6593 = L4_6593.button
  L4_6593.enable = true
  L4_6593 = L3_6592.j210
  L4_6593 = L4_6593.button
  L4_6593.enable = true
  L4_6593 = L3_6592.j300
  L4_6593 = L4_6593.button
  L4_6593.enable = true
  L4_6593 = L3_6592.j400
  L4_6593 = L4_6593.button
  L4_6593.enable = true
  L4_6593 = L3_6592.j510
  L4_6593 = L4_6593.button
  L4_6593.enable = true
  L4_6593 = L3_6592.j520
  L4_6593 = L4_6593.button
  L4_6593.enable = true
  L4_6593 = L3_6592.j530
  L4_6593 = L4_6593.button
  L4_6593.enable = true
  L4_6593 = Array
  L4_6593 = L4_6593()
  L6_6595 = L4_6593
  L5_6594 = L4_6593.AddObject
  L7_6596 = ActionME
  L7_6596 = L7_6596("Music/UI/ScrollUp.mp3")
  L5_6594(L6_6595, L7_6596, L7_6596("Music/UI/ScrollUp.mp3"))
  L6_6595 = L4_6593
  L5_6594 = L4_6593.AddObject
  L7_6596 = MoveBy
  L7_6596 = L7_6596(0.15, Point(0, 600))
  L5_6594(L6_6595, L7_6596, L7_6596(0.15, Point(0, 600)))
  L5_6594 = Sequence
  L6_6595 = L4_6593
  L5_6594 = L5_6594(L6_6595)
  L7_6596 = A0_6589
  L6_6595 = A0_6589.Parent
  L6_6595 = L6_6595(L7_6596)
  L6_6595 = L6_6595.parent
  L6_6595.action = L5_6594
  if not A2_6591 then
    return
  end
  L7_6596 = A2_6591.First
  L7_6596 = L7_6596(A2_6591)
  while L7_6596 ~= nil do
    load("return " .. L7_6596)()
    L7_6596 = A2_6591:Next()
  end
  L6_6595.users.Users:Refresh()
end
function Jobs.OnNewJobDown(A0_6597, A1_6598)
  local L2_6599, L3_6600, L4_6601, L5_6602
  L2_6599 = LoadConf
  L3_6600 = string
  L3_6600 = L3_6600.format
  L4_6601 = "Config/Jobs.conf"
  L5_6602 = L3_6600(L4_6601)
  L2_6599 = L2_6599(L3_6600, L4_6601, L5_6602, L3_6600(L4_6601))
  L3_6600 = A1_6598.tag
  L2_6599 = L2_6599[L3_6600]
  L3_6600 = Account
  L4_6601 = L3_6600
  L3_6600 = L3_6600.One
  L3_6600 = L3_6600(L4_6601)
  if not L3_6600 then
    return
  end
  if not L2_6599 then
    return
  end
  L4_6601 = L3_6600.sex
  if L4_6601 == 0 then
    L4_6601 = "female"
  else
    L4_6601 = L4_6601 or "male"
  end
  L4_6601 = L2_6599[L4_6601]
  A1_6598.disable = true
  L5_6602 = JsonObject
  L5_6602 = L5_6602()
  L5_6602.name = A0_6597:Parent().parent.users.account.text
  L5_6602.job = A1_6598.tag
  L5_6602.body = L4_6601.body
  L5_6602.hair = L4_6601.hair
  L5_6602.face = L4_6601.face
  L5_6602.coat = L4_6601.coat
  L5_6602.longcoat = L4_6601.longcoat
  L5_6602.pants = L4_6601.pants
  L5_6602.shoes = L4_6601.shoes
  L5_6602.weapon = L4_6601.weapon
  L5_6602.assistant = L4_6601.assistant
  L5_6602.map = L4_6601.map
  AdventureSDK:NewUser(L5_6602, A0_6597, A0_6597.OnNewJobResponse)
end
function Jobs.Destructor(A0_6603)
  local L1_6604
end
