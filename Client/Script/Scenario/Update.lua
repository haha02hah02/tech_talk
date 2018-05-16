Class.Update.Script({})
function Update.Constructor(A0_7070, A1_7071)
  Script.Constructor(A0_7070, A1_7071)
  A1_7071.on = {
    "Visible",
    A0_7070,
    A0_7070.OnVisible
  }
end
function Update.OnVisible(A0_7072)
  local L1_7073, L2_7074, L3_7075, L4_7076, L5_7077, L6_7078, L7_7079, L8_7080, L9_7081, L10_7082
  L1_7073 = UpdateVersionFileName
  L1_7073 = L1_7073()
  L3_7075 = A0_7072
  L2_7074 = A0_7072.Parent
  L2_7074 = L2_7074(L3_7075)
  L3_7075 = L2_7074.parent
  L4_7076 = tVerLogInfo
  if not L4_7076 then
    L2_7074.parent = nil
    L4_7076 = L3_7075.notice
    L4_7076.visible = true
    return
  end
  L4_7076 = {
    L5_7077,
    L6_7078,
    L7_7079
  }
  L5_7077 = "Update"
  L3_7075.on = L4_7076
  L4_7076 = tVerLogInfo
  if L4_7076 then
    L4_7076 = tVerLogInfo
    L4_7076 = L4_7076.context
  else
    L4_7076 = L4_7076 or {}
  end
  L5_7077 = {}
  A0_7072.iCurrentVersion = L6_7078
  A0_7072.iUpdateVersion = L6_7078
  A0_7072.iTargetVersion = L6_7078
  A0_7072.iPercent = 0
  L6_7078(L7_7079, L8_7080)
  L9_7081 = "2. \232\175\183\228\191\157\232\175\129\231\189\145\231\187\156\233\128\154\231\149\133\230\136\150\229\156\168WIFI\231\142\175\229\162\131\228\184\139,\230\156\172\230\172\161\230\155\180\230\150\176\229\140\133\229\164\167\229\176\143:%0.2fM."
  L10_7082 = tVerLogInfo
  if L10_7082 then
    L10_7082 = tVerLogInfo
    L10_7082 = L10_7082.size
  else
    L10_7082 = L10_7082 or 0
  end
  L10_7082 = L10_7082 / 1024
  L10_7082 = L10_7082 / 1024
  L10_7082 = L8_7080(L9_7081, L10_7082)
  L6_7078(L7_7079, L8_7080, L9_7081, L10_7082, L8_7080(L9_7081, L10_7082))
  for L9_7081, L10_7082 in L6_7078(L7_7079) do
    table.insert(L5_7077, string.format("%d. %s", L9_7081 + 2, L10_7082))
  end
  L9_7081 = Platform_IOS
  if L8_7080 == L9_7081 then
  else
  end
  L9_7081 = "\228\187\191\229\174\139"
  L10_7082 = 16
  L7_7079.name = "content"
  L9_7081 = 460
  L10_7082 = 0
  L7_7079.dimensions = L8_7080
  L7_7079.color = 3705462015
  L9_7081 = 0
  L10_7082 = 1
  L7_7079.anchorpoint = L8_7080
  L7_7079.align = "left"
  L7_7079.text = L6_7078
  L7_7079.x = 0
  L9_7081 = L8_7080 - 1.5
  L7_7079.y = L9_7081
  L9_7081 = VScrollView
  L10_7082 = 460
  L9_7081 = L9_7081(L10_7082, 240, 460, L8_7080)
  L9_7081.name = "scrollview"
  L9_7081.x = 180
  L9_7081.y = 170
  L7_7079.parent = L9_7081
  L9_7081.parent = L2_7074
  L10_7082 = A0_7072.SetUpdateData
  L10_7082(A0_7072)
end
function Update.WriteVersion(A0_7083)
  local L1_7084, L2_7085, L3_7086, L4_7087, L5_7088, L6_7089
  L1_7084 = PathForRenewal
  L1_7084 = L1_7084()
  L2_7085 = FileUtils
  L3_7086 = L2_7085
  L2_7085 = L2_7085.CreateFolder
  L4_7087 = string
  L4_7087 = L4_7087.sub
  L5_7088 = L1_7084
  L6_7089 = 1
  L6_7089 = L4_7087(L5_7088, L6_7089, string.len(L1_7084) - 1)
  L2_7085(L3_7086, L4_7087, L5_7088, L6_7089, L4_7087(L5_7088, L6_7089, string.len(L1_7084) - 1))
  L2_7085 = FileUtils
  L3_7086 = L2_7085
  L2_7085 = L2_7085.CreateFolder
  L4_7087 = string
  L4_7087 = L4_7087.format
  L5_7088 = "%sScript"
  L6_7089 = L1_7084
  L6_7089 = L4_7087(L5_7088, L6_7089)
  L2_7085(L3_7086, L4_7087, L5_7088, L6_7089, L4_7087(L5_7088, L6_7089))
  L2_7085 = FileUtils
  L3_7086 = L2_7085
  L2_7085 = L2_7085.CreateFolder
  L4_7087 = string
  L4_7087 = L4_7087.format
  L5_7088 = "%sScript/Common"
  L6_7089 = L1_7084
  L6_7089 = L4_7087(L5_7088, L6_7089)
  L2_7085(L3_7086, L4_7087, L5_7088, L6_7089, L4_7087(L5_7088, L6_7089))
  L2_7085 = string
  L2_7085 = L2_7085.format
  L3_7086 = "Config.Version = %d"
  L4_7087 = A0_7083.iUpdateVersion
  L2_7085 = L2_7085(L3_7086, L4_7087)
  L3_7086 = string
  L3_7086 = L3_7086.format
  L4_7087 = "Config.MajorVersion = %d"
  L5_7088 = math
  L5_7088 = L5_7088.floor
  L6_7089 = A0_7083.iUpdateVersion
  L6_7089 = L6_7089 / 1000
  L6_7089 = L5_7088(L6_7089)
  L3_7086 = L3_7086(L4_7087, L5_7088, L6_7089, L5_7088(L6_7089))
  L4_7087 = string
  L4_7087 = L4_7087.format
  L5_7088 = "Config.MinorVersion = %d"
  L6_7089 = A0_7083.iUpdateVersion
  L6_7089 = L6_7089 % 1000
  L4_7087 = L4_7087(L5_7088, L6_7089)
  L5_7088 = {}
  L6_7089 = table
  L6_7089 = L6_7089.insert
  L6_7089(L5_7088, L2_7085)
  L6_7089 = table
  L6_7089 = L6_7089.insert
  L6_7089(L5_7088, L3_7086)
  L6_7089 = table
  L6_7089 = L6_7089.insert
  L6_7089(L5_7088, L4_7087)
  L6_7089 = table
  L6_7089 = L6_7089.concat
  L6_7089 = L6_7089(L5_7088, "\n")
  fstream(string.format("%sScript/Common/Edition.nts", L1_7084), "wb+"):write(DataEncode(L6_7089, 0), string.len(L6_7089))
  fstream(string.format("%sScript/Common/Edition.nts", L1_7084), "wb+"):close()
end
function Update.SetUpdateData(A0_7090)
  local L1_7091, L2_7092, L3_7093, L4_7094
  L1_7091 = A0_7090.iUpdateVersion
  L2_7092 = A0_7090.iCurrentVersion
  if L1_7091 ~= L2_7092 then
    L2_7092 = A0_7090
    L1_7091 = A0_7090.WriteVersion
    L1_7091(L2_7092)
  end
  L1_7091 = A0_7090.iUpdateVersion
  L2_7092 = A0_7090.iTargetVersion
  if L1_7091 > L2_7092 then
    L1_7091 = World
    L2_7092 = L1_7091
    L1_7091 = L1_7091.Restart
    L1_7091(L2_7092)
    return
  end
  L2_7092 = A0_7090
  L1_7091 = A0_7090.Parent
  L1_7091 = L1_7091(L2_7092)
  L2_7092 = string
  L2_7092 = L2_7092.format
  L3_7093 = "https://raw.githubusercontent.com/Norzt/AdventureStory/master/%06d.patch"
  L4_7094 = A0_7090.iUpdateVersion
  L2_7092 = L2_7092(L3_7093, L4_7094)
  L3_7093 = HttpRequest
  L3_7093 = L3_7093()
  L4_7094 = UpdateVersionZipName
  L4_7094 = L4_7094()
  L1_7091.status.text = "\231\137\136\230\156\172\230\155\180\230\150\176\228\184\173,\232\175\183\231\168\141\229\144\142..."
  L3_7093:SetUrl(L2_7092)
  L3_7093:SetRequestType(HttpDown)
  L3_7093:SetDownloadPath(L4_7094)
  L3_7093:SetResponseCallback(A0_7090, A0_7090.DownloadPatchCallBack)
  L3_7093:SetResponseLoadCallback(A0_7090, A0_7090.DownloadPatchLoadCallBack)
  HttpClient:Send(L3_7093)
end
function Update.ActionUpdate(A0_7095)
  local L1_7096, L2_7097, L3_7098, L4_7099
  L2_7097 = A0_7095
  L1_7096 = A0_7095.Parent
  L1_7096 = L1_7096(L2_7097)
  L2_7097 = L1_7096.parent
  L3_7098 = UpdateVersionZipName
  L3_7098 = L3_7098()
  L4_7099 = PathForRenewal
  L4_7099 = L4_7099()
  if not ZipFile(L3_7098, L4_7099, "") or not ZipFile(L3_7098, L4_7099, ""):IsOpened() then
    L1_7096.status = "\230\155\180\230\150\176\229\164\177\232\180\165, \230\155\180\230\150\176\229\140\133\230\141\159\229\157\143..."
    FileUtils:RemoveFile(L3_7098)
    return
  end
  A0_7095.oZipFile = ZipFile(L3_7098, L4_7099, "")
  L1_7096.status = "\231\137\136\230\156\172\230\155\180\230\150\176\228\184\173,\232\175\183\231\168\141\229\144\142..."
  L2_7097.on = {
    "Update",
    A0_7095,
    A0_7095.OnUpdate
  }
end
function Update.Successul(A0_7100)
  A0_7100:Parent().parent.off = {
    "Update",
    A0_7100,
    A0_7100.OnUpdate
  }
  A0_7100.oZipFile:Free()
  A0_7100.oZipFile = nil
  FileUtils:RemoveFile(UpdateVersionZipName())
  A0_7100.iPercent = A0_7100.iPercent + 1 / (A0_7100.iTargetVersion - A0_7100.iCurrentVersion + 1) * 100
  A0_7100.iUpdateVersion = A0_7100.iUpdateVersion + 1
  A0_7100:SetUpdateData()
end
function Update.Failed(A0_7101)
  A0_7101:Parent().status = "\230\155\180\230\150\176\229\164\177\232\180\165, \230\155\180\230\150\176\229\140\133\230\141\159\229\157\143..."
  A0_7101:Parent().parent.off = {
    "Update",
    A0_7101,
    A0_7101.OnUpdate
  }
  A0_7101.oZipFile = nil
  FileUtils:RemoveFile(UpdateVersionZipName())
end
function Update.OnUpdate(A0_7102)
  local L1_7103, L2_7104, L3_7105
  L1_7103 = A0_7102.oZipFile
  if not L1_7103 then
    return
  end
  L1_7103 = A0_7102.oZipFile
  L2_7104 = L1_7103
  L1_7103 = L1_7103.IsDone
  L1_7103 = L1_7103(L2_7104)
  if L1_7103 then
    L2_7104 = A0_7102
    L1_7103 = A0_7102.Successul
    L1_7103(L2_7104)
    return
  end
  L1_7103 = A0_7102.oZipFile
  L2_7104 = L1_7103
  L1_7103 = L1_7103.Step
  L1_7103 = L1_7103(L2_7104)
  if L1_7103 == false then
    L2_7104 = A0_7102
    L1_7103 = A0_7102.Failed
    L1_7103(L2_7104)
    return
  end
  L2_7104 = A0_7102
  L1_7103 = A0_7102.Parent
  L1_7103 = L1_7103(L2_7104)
  L2_7104 = A0_7102.iTargetVersion
  L3_7105 = A0_7102.iCurrentVersion
  L2_7104 = L2_7104 - L3_7105
  L2_7104 = L2_7104 + 1
  L3_7105 = A0_7102.iPercent
  L3_7105 = L3_7105 + (A0_7102.oZipFile:DecompressCount() / A0_7102.oZipFile:TotalEntry() * 100 / 2 + 50) / L2_7104
  L1_7103.progress.percent = L3_7105
  L1_7103.avatar.x = 135 + L3_7105 * 540 / 100
  L1_7103.percent.text = string.format("%d:", math.floor(L3_7105))
end
function Update.DownloadPatchCallBack(A0_7106, A1_7107, A2_7108)
  if A2_7108:IsSucceed() then
    A0_7106:ActionUpdate()
    return
  end
  A0_7106:Parent().status.text = string.format("\232\181\132\230\186\144\228\184\139\232\189\189\229\164\177\232\180\165,\233\148\153\232\175\175\228\187\163\231\160\129:%d", A2_7108:ResponseCode())
  FileUtils:RemoveFile(UpdateVersionZipName())
end
function Update.DownloadPatchLoadCallBack(A0_7109, A1_7110, A2_7111)
  local L3_7112, L4_7113, L5_7114, L6_7115, L7_7116
  L4_7113 = A2_7111
  L3_7112 = A2_7111.ResponseDataSize
  L3_7112 = L3_7112(L4_7113)
  L5_7114 = A2_7111
  L4_7113 = A2_7111.ResponseDataCapacity
  L4_7113 = L4_7113(L5_7114)
  L6_7115 = A0_7109
  L5_7114 = A0_7109.Parent
  L5_7114 = L5_7114(L6_7115)
  L6_7115 = A0_7109.iTargetVersion
  L7_7116 = A0_7109.iCurrentVersion
  L6_7115 = L6_7115 - L7_7116
  L6_7115 = L6_7115 + 1
  L7_7116 = A0_7109.iPercent
  L7_7116 = L7_7116 + L3_7112 / L4_7113 * 100 / 2 / L6_7115
  L5_7114.progress.percent = L7_7116
  L5_7114.avatar.x = 135 + L7_7116 * 540 / 100
  L5_7114.percent.text = string.format("%d:", math.floor(L7_7116))
end
