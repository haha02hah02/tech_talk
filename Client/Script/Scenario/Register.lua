Class.Register.Script({})
function Register.Constructor(A0_6770, A1_6771)
  Script.Constructor(A0_6770, A1_6771)
  A1_6771.view.cancel.on = {
    "Down",
    A0_6770,
    A0_6770.OnCancel
  }
  A1_6771.view.email.on = {
    "End",
    A0_6770,
    A0_6770.OnEmailEnd
  }
  A1_6771.view.password.on = {
    "End",
    A0_6770,
    A0_6770.OnPasswordEnd
  }
  A1_6771.view.rpassword.on = {
    "End",
    A0_6770,
    A0_6770.OnRPasswordEnd
  }
  A1_6771.view.invitation.on = {
    "End",
    A0_6770,
    A0_6770.OnInvitationEnd
  }
  A1_6771.view.ok.on = {
    "Down",
    A0_6770,
    A0_6770.OnOkDown
  }
end
function Register.IsAllDataConfirm(A0_6772)
  if A0_6772:Parent().view.email_status.disable then
    return
  end
  if A0_6772:Parent().view.password_status.disable then
    return
  end
  if A0_6772:Parent().view.rpassword_status.disable then
    return
  end
  if A0_6772:Parent().view.invitation_status.disable then
    return
  end
  if A0_6772:Parent().view.protocol.unchecked then
    return
  end
  return true
end
function Register.RefreshOkButton(A0_6773)
  A0_6773:Parent().view.ok.enable = A0_6773:IsAllDataConfirm()
end
function Register.OnEmailResponse(A0_6774, A1_6775, A2_6776)
  A0_6774:Parent().view.email.enable = true
  A0_6774:Parent().view.email_loading.visible = false
  A0_6774:Parent().view.email_status.visible = true
  A0_6774:Parent().view.email_status.enable = A1_6775 == 0
  A0_6774:RefreshOkButton()
end
function Register.OnEmailEnd(A0_6777, A1_6778)
  local L2_6779, L3_6780, L4_6781
  L2_6779 = A1_6778.text
  L3_6780 = A1_6778.parent
  L3_6780 = L3_6780.email_status
  L4_6781 = A1_6778.parent
  L4_6781 = L4_6781.email_loading
  L3_6780.visible = false
  L4_6781.visible = false
  if L2_6779 == "" or string.len(L2_6779) > 36 then
    L3_6780.visible = true
    L3_6780.enable = false
    return
  end
  L4_6781.visible = true
  A1_6778.disable = true
  L3_6780.visible = false
  AdventureSDK:EmailExists(L2_6779, A0_6777, A0_6777.OnEmailResponse)
end
function Register.OnPasswordEnd(A0_6782, A1_6783)
  local L2_6784
  L2_6784 = A1_6783.parent
  L2_6784.password_status.visible = true
  L2_6784.rpassword_status.visible = true
  if string.len(A1_6783.text) < 4 or A1_6783.text ~= L2_6784.rpassword.text then
    L2_6784.password_status.disable = true
    L2_6784.rpassword_status.disable = true
  else
    L2_6784.password_status.enable = true
    L2_6784.rpassword_status.enable = true
  end
  A0_6782:RefreshOkButton()
end
function Register.OnRPasswordEnd(A0_6785, A1_6786)
  local L2_6787
  L2_6787 = A1_6786.parent
  L2_6787.password_status.visible = true
  L2_6787.rpassword_status.visible = true
  if string.len(A1_6786.text) < 4 or A1_6786.text ~= L2_6787.password.text then
    L2_6787.password_status.disable = true
    L2_6787.rpassword_status.disable = true
  else
    L2_6787.password_status.enable = true
    L2_6787.rpassword_status.enable = true
  end
  A0_6785:RefreshOkButton()
end
function Register.OnInvitationResponse(A0_6788, A1_6789, A2_6790)
  A0_6788:Parent().view.invitation.enable = true
  A0_6788:Parent().view.invitation_loading.visible = false
  A0_6788:Parent().view.invitation_status.visible = true
  A0_6788:Parent().view.invitation_status.enable = A1_6789 == 0
  A0_6788:RefreshOkButton()
end
function Register.OnInvitationEnd(A0_6791, A1_6792)
  local L2_6793, L3_6794, L4_6795, L5_6796
  L2_6793 = A1_6792.text
  L3_6794 = A1_6792.parent
  L4_6795 = L3_6794.invitation_status
  L5_6796 = L3_6794.invitation_loading
  L4_6795.visible = false
  L5_6796.visible = false
  if L2_6793 == "" then
    L4_6795.visible = true
    L4_6795.enable = false
    return
  end
  L5_6796.visible = true
  A1_6792.disable = true
  L4_6795.visible = false
  AdventureSDK:InvitationExists(L2_6793, A0_6791, A0_6791.OnInvitationResponse)
end
function Register.OnCreateAccount(A0_6797, A1_6798, A2_6799)
  A0_6797:Parent().view.ok.enable = true
  A0_6797:Parent().view.ok_loading.visible = false
  if A1_6798 ~= 0 then
    return
  end
  A0_6797:Parent().parent.login.view.account.text = A0_6797:Parent().view.email.text
  A0_6797:Hide()
end
function Register.OnOkDown(A0_6800, A1_6801)
  local L2_6802, L3_6803
  L3_6803 = A0_6800
  L2_6802 = A0_6800.IsAllDataConfirm
  L2_6802 = L2_6802(L3_6803)
  if not L2_6802 then
    return
  end
  L2_6802 = A1_6801.parent
  L3_6803 = JsonObject
  L3_6803 = L3_6803()
  L3_6803.name = L2_6802.email.text
  L3_6803.sex = L2_6802.radio.select
  L3_6803.password = SHA1String(L2_6802.password.text)
  L3_6803.invitation_code = L2_6802.invitation.text
  A1_6801.disable = true
  L2_6802.ok_loading.visible = true
  AdventureSDK:CreateAccount(L3_6803, A0_6800, A0_6800.OnCreateAccount)
end
function Register.ShowAction(A0_6804)
  local L1_6805, L2_6806, L3_6807, L4_6808, L5_6809, L6_6810, L7_6811, L8_6812, L9_6813
  L1_6805 = LoadCsv
  L2_6806 = "UI/Login/Register/Scroll/0.ani"
  L1_6805 = L1_6805(L2_6806)
  L2_6806 = Array
  L2_6806 = L2_6806()
  L9_6813 = L5_6809()
  L3_6807(L4_6808, L5_6809, L6_6810, L7_6811, L8_6812, L9_6813, L5_6809())
  L6_6810 = "Music/UI/RollDown.mp3"
  L9_6813 = L5_6809(L6_6810)
  L3_6807(L4_6808, L5_6809, L6_6810, L7_6811, L8_6812, L9_6813, L5_6809(L6_6810))
  for L6_6810, L7_6811 in L3_6807(L4_6808) do
    L8_6812 = string
    L8_6812 = L8_6812.format
    L9_6813 = "%s/%d.%d.ntp"
    L8_6812 = L8_6812(L9_6813, "UI/Login/Register/Scroll", 0, L7_6811.no)
    L9_6813 = Animate
    L9_6813 = L9_6813(L8_6812, L7_6811.origin.x, L7_6811.origin.y, L7_6811.delay / 1000)
    L2_6806:AddObject(L9_6813)
  end
  L6_6810 = Functor
  L7_6811 = A0_6804
  L8_6812 = A0_6804.ShowContext
  L9_6813 = L6_6810(L7_6811, L8_6812)
  L9_6813 = L5_6809(L6_6810, L7_6811, L8_6812, L9_6813, L6_6810(L7_6811, L8_6812))
  L3_6807(L4_6808, L5_6809, L6_6810, L7_6811, L8_6812, L9_6813, L5_6809(L6_6810, L7_6811, L8_6812, L9_6813, L6_6810(L7_6811, L8_6812)))
  return L3_6807(L4_6808)
end
function Register.HideAction(A0_6814)
  local L1_6815, L2_6816, L3_6817, L4_6818, L5_6819, L6_6820, L7_6821, L8_6822, L9_6823
  L1_6815 = LoadCsv
  L2_6816 = "UI/Login/Register/Scroll/1.ani"
  L1_6815 = L1_6815(L2_6816)
  L2_6816 = Array
  L2_6816 = L2_6816()
  L6_6820 = "Music/UI/RollUp.mp3"
  L9_6823 = L5_6819(L6_6820)
  L3_6817(L4_6818, L5_6819, L6_6820, L7_6821, L8_6822, L9_6823, L5_6819(L6_6820))
  for L6_6820, L7_6821 in L3_6817(L4_6818) do
    L8_6822 = string
    L8_6822 = L8_6822.format
    L9_6823 = "%s/%d.%d.ntp"
    L8_6822 = L8_6822(L9_6823, "UI/Login/Register/Scroll", 1, L7_6821.no)
    L9_6823 = Animate
    L9_6823 = L9_6823(L8_6822, L7_6821.origin.x, L7_6821.origin.y, L7_6821.delay / 1000)
    L2_6816:AddObject(L9_6823)
  end
  L9_6823 = L5_6819()
  L3_6817(L4_6818, L5_6819, L6_6820, L7_6821, L8_6822, L9_6823, L5_6819())
  L6_6820 = Functor
  L7_6821 = A0_6814
  L8_6822 = A0_6814.HideContext
  L9_6823 = L6_6820(L7_6821, L8_6822)
  L9_6823 = L5_6819(L6_6820, L7_6821, L8_6822, L9_6823, L6_6820(L7_6821, L8_6822))
  L3_6817(L4_6818, L5_6819, L6_6820, L7_6821, L8_6822, L9_6823, L5_6819(L6_6820, L7_6821, L8_6822, L9_6823, L6_6820(L7_6821, L8_6822)))
  return L3_6817(L4_6818)
end
function Register.Reset(A0_6824)
  A0_6824:Parent().visible = false
  A0_6824:Parent().view.visible = false
  A0_6824:Parent().back1.visible = false
  A0_6824:Parent().view.email.text = ""
  A0_6824:Parent().view.password.text = ""
  A0_6824:Parent().view.rpassword.text = ""
  A0_6824:Parent().view.invitation.text = ""
  A0_6824:Parent().view.ok.enable = false
  A0_6824:Parent().view.protocol.checked = true
  A0_6824:Parent().view.radio.select = 1
  A0_6824:Parent().view.email_status.visible = false
  A0_6824:Parent().view.email_status.enable = false
  A0_6824:Parent().view.email_loading.visible = false
  A0_6824:Parent().view.password_status.visible = false
  A0_6824:Parent().view.password_status.enable = false
  A0_6824:Parent().view.rpassword_status.visible = false
  A0_6824:Parent().view.rpassword_status.enable = false
  A0_6824:Parent().view.invitation_status.visible = false
  A0_6824:Parent().view.invitation_status.enable = false
  A0_6824:Parent().view.invitation_loading.visible = false
  A0_6824:Parent().view.ok_loading.visible = false
end
function Register.ShowContext(A0_6825)
  A0_6825:Reset()
  A0_6825:Parent().visible = true
  A0_6825:Parent().view.visible = true
  A0_6825:Parent().back1.visible = true
end
function Register.Show(A0_6826)
  A0_6826:Parent().visible = true
  A0_6826:Parent().view.visible = false
  A0_6826:Parent().back1.visible = false
  A0_6826:Parent().back.action = A0_6826:ShowAction()
end
function Register.HideContext(A0_6827)
  A0_6827:Reset()
  A0_6827:Parent().visible = false
  A0_6827:Parent().view.visible = false
  A0_6827:Parent().back1.visible = false
end
function Register.Hide(A0_6828)
  A0_6828:Parent().back.action = A0_6828:HideAction()
end
function Register.OnCancel(A0_6829)
  A0_6829:Hide()
end
function Register.Destructor(A0_6830)
  local L1_6831
end
