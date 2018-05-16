Class.Login.Script({})
function Login.Constructor(A0_6632, A1_6633)
  Script.Constructor(A0_6632, A1_6633)
  A1_6633.view.alter.disable = true
  A1_6633.view.lost.disable = true
  A1_6633.view.link.disable = true
  A1_6633.view.modify.disable = true
  A1_6633.view.account.on = {
    "Begin",
    A0_6632,
    A0_6632.OnAccountBegin
  }
  A1_6633.view.account.on = {
    "End",
    A0_6632,
    A0_6632.OnAccountEnd
  }
  A1_6633.view.account.on = {
    "Changed",
    A0_6632,
    A0_6632.OnAccountEnd
  }
  A1_6633.view.password.on = {
    "Begin",
    A0_6632,
    A0_6632.OnPasswordBegin
  }
  A1_6633.view.password.on = {
    "End",
    A0_6632,
    A0_6632.OnPasswordEnd
  }
  A1_6633.view.password.on = {
    "Changed",
    A0_6632,
    A0_6632.OnPasswordEnd
  }
  A1_6633.view.alter.on = {
    "Down",
    A0_6632,
    A0_6632.OnChangePassword
  }
  A1_6633.view.modify.on = {
    "Down",
    A0_6632,
    A0_6632.OnModifyPassword
  }
  A1_6633.view.modify_quit.on = {
    "Down",
    A0_6632,
    A0_6632.OnChangePasswordCancel
  }
  A1_6633.view.quit.on = {
    "Down",
    A0_6632,
    A0_6632.OnQuitGame
  }
  A1_6633.view.npassword.on = {
    "End",
    A0_6632,
    A0_6632.OnNewPasswordEnd
  }
  A1_6633.view.rpassword.on = {
    "End",
    A0_6632,
    A0_6632.OnRepeatPasswordEnd
  }
  A1_6633.view.register.on = {
    "Down",
    A0_6632,
    A0_6632.OnRegisterUser
  }
  A1_6633.view.link.on = {
    "Down",
    A0_6632,
    A0_6632.OnLinkDown
  }
  A1_6633.on = {
    "Visible",
    A0_6632,
    A0_6632.OnVisible
  }
  if not Localhost:One("name = 'sname'") then
    return
  end
  A1_6633.view.account.text = Localhost:One("name = 'sname'").user_name
  A1_6633.view.user_name.visible = false
end
function Login.SetServerNotice(A0_6634, A1_6635)
  local L2_6636, L3_6637, L4_6638
  L2_6636 = ErrorCode
  L2_6636 = L2_6636[A1_6635]
  if not L2_6636 then
    return
  end
  L4_6638 = A0_6634
  L3_6637 = A0_6634.Parent
  L3_6637 = L3_6637(L4_6638)
  L3_6637 = L3_6637.parent
  L3_6637 = L3_6637.system_notice
  if not L3_6637 then
    return
  end
  L4_6638 = Array
  L4_6638 = L4_6638()
  L4_6638:AddObject(Show())
  L4_6638:AddObject(OpacityTo(0, 255))
  L4_6638:AddObject(ActionME("Music/UI/Invite.mp3"))
  L4_6638:AddObject(DelayTime(2.0))
  L4_6638:AddObject(OpacityTo(2.0, 0))
  L4_6638:AddObject(Hide())
  L3_6637.text = L2_6636
  L3_6637.unactions = true
  L3_6637.action = Sequence(L4_6638)
end
function Login.OnAccountBegin(A0_6639)
  A0_6639:Parent().view.user_name.visible = false
end
function Login.OnAccountEnd(A0_6640)
  A0_6640:Parent().view.user_name.visible = A0_6640:Parent().view.account.text == ""
  A0_6640:RefreshButtonByAccount()
end
function Login.OnPasswordBegin(A0_6641)
  A0_6641:Parent().view.user_passwd.visible = false
end
function Login.OnPasswordEnd(A0_6642)
  A0_6642:Parent().view.user_passwd.visible = A0_6642:Parent().view.password.text == ""
  A0_6642:RefreshButtonByAccount()
end
function Login.RefreshButtonByAccount(A0_6643)
  A0_6643:Parent().view.alter.enable = A0_6643:Parent().view.account.text ~= "" and A0_6643:Parent().view.password.text ~= ""
  A0_6643:Parent().view.link.enable = A0_6643:Parent().view.account.text ~= "" and A0_6643:Parent().view.password.text ~= ""
end
function Login.OnChangePassword(A0_6644)
  A0_6644:Parent().view.link.visible = false
  A0_6644:Parent().view.save_name.visible = false
  A0_6644:Parent().view.saven_name_bt.visible = false
  A0_6644:Parent().view.alter.visible = false
  A0_6644:Parent().view.lost.visible = false
  A0_6644:Parent().view.register.visible = false
  A0_6644:Parent().view.sync.visible = false
  A0_6644:Parent().view.quit.visible = false
  A0_6644:Parent().view.modify.visible = true
  A0_6644:Parent().view.modify_quit.visible = true
  A0_6644:Parent().view.npassword.visible = true
  A0_6644:Parent().view.rpassword.visible = true
  A0_6644:Parent().view.npassword.text = ""
  A0_6644:Parent().view.rpassword.text = ""
  A0_6644:Parent().view.modify.enable = false
end
function Login.OnChangePasswordCancel(A0_6645)
  A0_6645:Parent().view.link.visible = true
  A0_6645:Parent().view.save_name.visible = true
  A0_6645:Parent().view.saven_name_bt.visible = true
  A0_6645:Parent().view.alter.visible = true
  A0_6645:Parent().view.lost.visible = true
  A0_6645:Parent().view.register.visible = true
  A0_6645:Parent().view.sync.visible = true
  A0_6645:Parent().view.quit.visible = true
  A0_6645:Parent().view.modify.visible = false
  A0_6645:Parent().view.modify_quit.visible = false
  A0_6645:Parent().view.npassword.visible = false
  A0_6645:Parent().view.rpassword.visible = false
end
function Login.OnNewPasswordEnd(A0_6646)
  A0_6646:RefreshButtonByAlter()
end
function Login.OnRepeatPasswordEnd(A0_6647)
  A0_6647:RefreshButtonByAlter()
end
function Login.RefreshButtonByAlter(A0_6648)
  A0_6648:Parent().view.modify.enable = string.len(A0_6648:Parent().view.npassword.text) > 3 and A0_6648:Parent().view.npassword.text ~= "" and A0_6648:Parent().view.rpassword.text ~= "" and A0_6648:Parent().view.npassword.text == A0_6648:Parent().view.rpassword.text
end
function Login.OnModifyPasswordResponse(A0_6649, A1_6650, A2_6651)
  A0_6649:Parent().view.modify.enable = true
  if A1_6650 ~= 0 then
    A0_6649:SetServerNotice(A1_6650)
  end
  if A1_6650 == 0 then
    A0_6649:Parent().view.password.text = ""
    A0_6649:OnChangePasswordCancel()
    return
  end
end
function Login.OnModifyPassword(A0_6652, A1_6653)
  local L2_6654, L3_6655
  A1_6653.disable = true
  L2_6654 = A1_6653.parent
  L3_6655 = JsonObject
  L3_6655 = L3_6655()
  L3_6655.name = L2_6654.account.text
  L3_6655.password = SHA1String(L2_6654.password.text)
  L3_6655.npassword = SHA1String(L2_6654.npassword.text)
  AdventureSDK:PasswordSet(L3_6655, A0_6652, A0_6652.OnModifyPasswordResponse)
end
function Login.OnRegisterUser(A0_6656)
  if not A0_6656:Parent().parent.sign_up then
    A0_6656:Parent().parent.component = "Model/register.model"
  end
  A0_6656:Parent().parent.sign_up.Register:Show()
end
function Login.OnDataResponse(A0_6657, A1_6658, A2_6659)
  local L3_6660, L4_6661, L5_6662
  L4_6661 = A0_6657
  L3_6660 = A0_6657.Parent
  L3_6660 = L3_6660(L4_6661)
  L3_6660 = L3_6660.view
  L4_6661 = L3_6660.link
  L4_6661.enable = true
  L4_6661 = L3_6660.password
  L4_6661.text = ""
  if A1_6658 ~= 0 then
    L5_6662 = A0_6657
    L4_6661 = A0_6657.SetServerNotice
    L4_6661(L5_6662, A1_6658)
  end
  L4_6661 = SQLManager
  L5_6662 = L4_6661
  L4_6661 = L4_6661.CleanAll
  L4_6661(L5_6662)
  if not A2_6659 then
    return
  end
  L5_6662 = A2_6659
  L4_6661 = A2_6659.First
  L4_6661 = L4_6661(L5_6662)
  while L4_6661 ~= nil do
    L5_6662 = load
    L5_6662 = L5_6662("return " .. L4_6661)
    L5_6662()
    L5_6662 = A2_6659.Next
    L5_6662 = L5_6662(A2_6659)
    L4_6661 = L5_6662
  end
  L5_6662 = Array
  L5_6662 = L5_6662()
  L5_6662:AddObject(ActionME("Music/UI/ScrollUp.mp3"))
  L5_6662:AddObject(MoveBy(0.15, Point(0, -600)))
  A0_6657:Parent().parent.action = Sequence(L5_6662)
  A0_6657:Parent().parent.users.Users:Refresh()
end
function Login.OnLinkResponse(A0_6663, A1_6664, A2_6665)
  if A1_6664 ~= 0 then
    A0_6663:SetServerNotice(A1_6664)
  end
  if A1_6664 == 0 then
    AdventureSDK:Data(A0_6663, A0_6663.OnDataResponse)
    return
  end
  A0_6663:Parent().view.link.enable = true
  A0_6663:Parent().view.password.text = ""
end
function Login.OnLinkDown(A0_6666, A1_6667)
  local L2_6668, L3_6669, L4_6670
  A1_6667.disable = true
  L2_6668 = A1_6667.parent
  L3_6669 = JsonObject
  L3_6669 = L3_6669()
  L4_6670 = string
  L4_6670 = L4_6670.lower
  L4_6670 = L4_6670(L2_6668.account.text)
  L3_6669.name = L4_6670
  L4_6670 = SHA1String
  L4_6670 = L4_6670(L2_6668.password.text)
  L3_6669.password = L4_6670
  L4_6670 = Localhost
  L4_6670 = L4_6670.One
  L4_6670 = L4_6670(L4_6670, "name = 'sname'")
  L4_6670 = L4_6670 or Localhost()
  L4_6670.name = "sname"
  L4_6670.user_name = string.lower(L2_6668.account.text)
  Localhost:Save(true)
  AdventureSDK:Authorize(L3_6669, A0_6666, A0_6666.OnLinkResponse)
end
function Login.OnQuitGame(A0_6671)
  World:Quit()
end
function Login.OnVisible(A0_6672)
  HttpClient:SetTimeoutForConnect(60)
  HttpClient:SetTimeoutForRead(30)
end
function Login.Destructor(A0_6673)
  local L1_6674
end
