L0_834 = Class
L0_834 = L0_834.AdventureSDK
L0_834 = L0_834.EventSet
L0_834({})
L0_834 = nil
function AdventureSDK.Constructor(A0_835)
  EventSet.Constructor(A0_835)
  A0_835.tRequestList = {}
  A0_835.sWebSite = "https://design.itavern.org"
end
function AdventureSDK.Encode(A0_836, A1_837)
  if not A1_837 then
    return
  end
  if A1_837 == "" then
    return ""
  end
  return DataEncodeBase64(A1_837)
end
function AdventureSDK.Decode(A0_838, A1_839)
  if not A1_839 then
    return
  end
  if A1_839 == "" then
    return ""
  end
  return DataDecodeBase64(A1_839)
end
function AdventureSDK.DataCheck(A0_840, A1_841)
  if not A1_841 then
    return
  end
  if type(A1_841) == "string" then
    return A1_841
  end
  return A0_840:Encode(A1_841:String())
end
function AdventureSDK.RequestType(A0_842, A1_843)
  local L2_844
  if A1_843 == "get" then
    L2_844 = HttpGet
    return L2_844
  end
  if A1_843 == "post" then
    L2_844 = HttpPost
    return L2_844
  end
  if A1_843 == "put" then
    L2_844 = HttpPut
    return L2_844
  end
  if A1_843 == "delete" then
    L2_844 = HttpDelete
    return L2_844
  end
end
function AdventureSDK.HandleCallBack(A0_845, A1_846, ...)
  if not A1_846 then
    return
  end
  if type(A1_846.object) == "nil" then
    return
  end
  if type(A1_846.object) == "function" then
    A1_846.object(...)
    return
  end
  A1_846["function"](A1_846.object, ...)
end
function AdventureSDK.SetDataRequest(A0_847, A1_848)
  local L2_849, L3_850
  if not A1_848 then
    return
  end
  L3_850 = A0_847
  L2_849 = A0_847.RequestType
  L2_849 = L2_849(L3_850, A1_848.type)
  if not L2_849 then
    L3_850 = A0_847.HandleCallBack
    return L3_850(A0_847, A1_848, -1, nil)
  end
  L3_850 = A1_848.count
  if L3_850 > 0 then
    L3_850 = A0_847.HandleCallBack
    return L3_850(A0_847, A1_848, -1, nil)
  end
  L3_850 = HttpRequest
  L3_850 = L3_850()
  L3_850:SetUrl(A1_848.site)
  L3_850:SetRequestType(L2_849)
  L3_850:SetUserData(A1_848)
  A1_848.count = A1_848.count + 1
  L3_850:SetResponseCallback(A0_847, A0_847.ResponseHandle)
  if L2_849 ~= HttpGet and A1_848.data then
    L3_850:SetRequestData(A1_848.data)
  end
  HttpClient:Send(L3_850)
end
function AdventureSDK.SetData(A0_851, A1_852, A2_853, A3_854, A4_855, A5_856)
  local L6_857
  L6_857 = {}
  L6_857.name = string.sub(A1_852, string.len(A0_851.sWebSite) + 1)
  L6_857.type = A2_853
  L6_857.site = A1_852
  L6_857.data = A0_851:DataCheck(A3_854)
  L6_857.count = 0
  L6_857.object = A4_855
  L6_857["function"] = A5_856
  return A0_851:SetDataRequest(L6_857)
end
function AdventureSDK.ResponseHandle(A0_858, A1_859, A2_860)
  local L3_861, L4_862, L5_863, L6_864, L7_865, L8_866
  L4_862 = A2_860
  L3_861 = A2_860.HttpRequest
  L3_861 = L3_861(L4_862)
  L5_863 = L3_861
  L4_862 = L3_861.UserData
  L4_862 = L4_862(L5_863)
  L6_864 = L3_861
  L5_863 = L3_861.SetUserData
  L7_865 = nil
  L5_863(L6_864, L7_865)
  L6_864 = A2_860
  L5_863 = A2_860.IsSucceed
  L5_863 = L5_863(L6_864)
  if L5_863 == false then
    L6_864 = A0_858
    L5_863 = A0_858.Fire
    L7_865 = "Response"
    L8_866 = -1
    L5_863(L6_864, L7_865, L8_866)
    L6_864 = A0_858
    L5_863 = A0_858.Report
    L8_866 = A2_860
    L7_865 = A2_860.ErrorBuffer
    L7_865 = L7_865(L8_866)
    function L8_866()
      local L0_867, L1_868
    end
    L5_863(L6_864, L7_865, L8_866)
    L6_864 = A0_858
    L5_863 = A0_858.SetDataRequest
    L7_865 = L4_862
    L5_863(L6_864, L7_865)
    return
  end
  L6_864 = A2_860
  L5_863 = A2_860.ResponseData
  L5_863 = L5_863(L6_864)
  L6_864 = SwitchJsonData
  L7_865 = Json
  L8_866 = A0_858.Decode
  L8_866 = L8_866(A0_858, L5_863)
  L8_866 = L7_865(L8_866, L8_866(A0_858, L5_863))
  L6_864 = L6_864(L7_865, L8_866, L7_865(L8_866, L8_866(A0_858, L5_863)))
  L8_866 = L6_864
  L7_865 = L6_864.Int
  L7_865 = L7_865(L8_866, "code", -1)
  L8_866 = L6_864.data
  A0_858:Fire("Response", L7_865, L8_866)
  if not L8_866 then
    A0_858:HandleCallBack(L4_862, L7_865, nil)
    return
  end
  if L4_862.name == "/account/authorize" then
    L0_834 = L8_866.token
  end
  A0_858:HandleCallBack(L4_862, L7_865, L8_866)
end
function AdventureSDK.Verify(A0_869, A1_870, A2_871)
  local L3_872, L4_873
  L3_872 = string
  L3_872 = L3_872.format
  L4_873 = "%s/system/verify"
  L3_872 = L3_872(L4_873, A0_869.sWebSite)
  L4_873 = JsonObject
  L4_873 = L4_873()
  L4_873.version = Config.Version
  L4_873.time = os.time()
  A0_869:SetData(L3_872, "post", L4_873, A1_870, A2_871)
end
function AdventureSDK.VersionCheck(A0_874, A1_875, A2_876, A3_877)
  local L4_878, L5_879
  L4_878 = string
  L4_878 = L4_878.format
  L5_879 = "%s/system/version"
  L4_878 = L4_878(L5_879, A0_874.sWebSite)
  L5_879 = JsonObject
  L5_879 = L5_879()
  L5_879.version = A1_875
  A0_874:SetData(L4_878, "post", L5_879, A2_876, A3_877)
end
function AdventureSDK.EmailExists(A0_880, A1_881, A2_882, A3_883)
  local L4_884, L5_885
  L4_884 = string
  L4_884 = L4_884.format
  L5_885 = "%s/account/name"
  L4_884 = L4_884(L5_885, A0_880.sWebSite)
  L5_885 = JsonObject
  L5_885 = L5_885()
  L5_885.name = A1_881
  A0_880:SetData(L4_884, "post", L5_885, A2_882, A3_883)
end
function AdventureSDK.NameExists(A0_886, A1_887, A2_888, A3_889)
  local L4_890, L5_891
  L4_890 = string
  L4_890 = L4_890.format
  L5_891 = "%s/userinfo/name"
  L4_890 = L4_890(L5_891, A0_886.sWebSite)
  L5_891 = JsonObject
  L5_891 = L5_891()
  L5_891.name = A1_887
  A0_886:SetData(L4_890, "post", L5_891, A2_888, A3_889)
end
function AdventureSDK.InvitationExists(A0_892, A1_893, A2_894, A3_895)
  local L4_896
  L4_896 = string
  L4_896 = L4_896.format
  L4_896 = L4_896("%s/invitation/verify/%s", A0_892.sWebSite, A1_893)
  A0_892:SetData(L4_896, "post", nil, A2_894, A3_895)
end
function AdventureSDK.NewInvitation(A0_897, A1_898, A2_899)
  local L3_900, L4_901
  L3_900 = string
  L3_900 = L3_900.format
  L4_901 = "%s/invitation/signup"
  L3_900 = L3_900(L4_901, A0_897.sWebSite)
  L4_901 = JsonObject
  L4_901 = L4_901()
  L4_901.token = L0_834
  A0_897:SetData(L3_900, "post", L4_901, A1_898, A2_899)
end
function AdventureSDK.NewCDKey(A0_902, A1_903, A2_904, A3_905)
  local L4_906
  L4_906 = string
  L4_906 = L4_906.format
  L4_906 = L4_906("%s/cdkey/signup", A0_902.sWebSite)
  A1_903.token = L0_834
  A0_902:SetData(L4_906, "post", A1_903, A2_904, A3_905)
end
function AdventureSDK.CDKeyChange(A0_907, A1_908, A2_909, A3_910)
  local L4_911, L5_912
  L4_911 = string
  L4_911 = L4_911.format
  L5_912 = "%s/cdkey/change"
  L4_911 = L4_911(L5_912, A0_907.sWebSite)
  L5_912 = JsonObject
  L5_912 = L5_912()
  L5_912.token = L0_834
  L5_912.cdkey = A1_908
  A0_907:SetData(L4_911, "post", L5_912, A2_909, A3_910)
end
function AdventureSDK.MagicBox(A0_913, A1_914, A2_915, A3_916)
  local L4_917, L5_918
  L4_917 = string
  L4_917 = L4_917.format
  L5_918 = "%s/userinfo/magicbox"
  L4_917 = L4_917(L5_918, A0_913.sWebSite)
  L5_918 = JsonObject
  L5_918 = L5_918()
  L5_918.token = L0_834
  L5_918.serial = A1_914
  A0_913:SetData(L4_917, "post", L5_918, A2_915, A3_916)
end
function AdventureSDK.Resetting(A0_919, A1_920, A2_921, A3_922)
  local L4_923, L5_924
  L4_923 = string
  L4_923 = L4_923.format
  L5_924 = "%s/userinfo/resetting"
  L4_923 = L4_923(L5_924, A0_919.sWebSite)
  L5_924 = JsonObject
  L5_924 = L5_924()
  L5_924.token = L0_834
  L5_924.serial = A1_920
  A0_919:SetData(L4_923, "post", L5_924, A2_921, A3_922)
end
function AdventureSDK.CreateAccount(A0_925, A1_926, A2_927, A3_928)
  local L4_929
  L4_929 = string
  L4_929 = L4_929.format
  L4_929 = L4_929("%s/account/signup", A0_925.sWebSite)
  A0_925:SetData(L4_929, "post", A1_926, A2_927, A3_928)
end
function AdventureSDK.PasswordSet(A0_930, A1_931, A2_932, A3_933)
  local L4_934
  L4_934 = string
  L4_934 = L4_934.format
  L4_934 = L4_934("%s/account/passwordset", A0_930.sWebSite)
  A0_930:SetData(L4_934, "post", A1_931, A2_932, A3_933)
end
function AdventureSDK.Authorize(A0_935, A1_936, A2_937, A3_938)
  local L4_939
  L4_939 = string
  L4_939 = L4_939.format
  L4_939 = L4_939("%s/account/authorize", A0_935.sWebSite)
  if A1_936 then
    A1_936.time = os.time()
    A1_936.version = Config.Version
  end
  A0_935:SetData(L4_939, "post", A1_936, A2_937, A3_938)
end
function AdventureSDK.Data(A0_940, A1_941, A2_942)
  local L3_943, L4_944
  L3_943 = L0_834
  if not L3_943 then
    L3_943 = type
    L4_944 = A1_941
    L3_943 = L3_943(L4_944)
    if L3_943 == "nil" then
      return
    end
    if L3_943 == "function" then
      L4_944 = A1_941
      L4_944(-1, nil)
      return
    end
    L4_944 = A2_942
    L4_944(A1_941, -1, nil)
    return
  end
  L3_943 = string
  L3_943 = L3_943.format
  L4_944 = "%s/account/data"
  L3_943 = L3_943(L4_944, A0_940.sWebSite)
  L4_944 = JsonObject
  L4_944 = L4_944()
  L4_944.token = L0_834
  A0_940:SetData(L3_943, "post", L4_944, A1_941, A2_942)
end
function AdventureSDK.Switch(A0_945, A1_946, A2_947, A3_948)
  local L4_949, L5_950
  L4_949 = L0_834
  if not L4_949 then
    L4_949 = type
    L5_950 = A2_947
    L4_949 = L4_949(L5_950)
    if L4_949 == "nil" then
      return
    end
    if L4_949 == "function" then
      L5_950 = A2_947
      L5_950(-1, nil)
      return
    end
    L5_950 = A3_948
    L5_950(A2_947, -1, nil)
    return
  end
  L4_949 = string
  L4_949 = L4_949.format
  L5_950 = "%s/account/switch"
  L4_949 = L4_949(L5_950, A0_945.sWebSite)
  L5_950 = JsonObject
  L5_950 = L5_950()
  L5_950.token = L0_834
  L5_950.user = A1_946
  A0_945:SetData(L4_949, "post", L5_950, A2_947, A3_948)
end
function AdventureSDK.NewUser(A0_951, A1_952, A2_953, A3_954)
  local L4_955
  L4_955 = L0_834
  if not L4_955 then
    L4_955 = type
    L4_955 = L4_955(A2_953)
    if L4_955 == "nil" then
      return
    end
    if L4_955 == "function" then
      A2_953(-1, nil)
      return
    end
    A3_954(A2_953, -1, nil)
    return
  end
  L4_955 = string
  L4_955 = L4_955.format
  L4_955 = L4_955("%s/userinfo/new", A0_951.sWebSite)
  if A1_952 then
    A1_952.token = L0_834
  end
  A0_951:SetData(L4_955, "post", A1_952, A2_953, A3_954)
end
function AdventureSDK.TokenCheck(A0_956, A1_957, A2_958, A3_959)
  local L4_960
  L4_960 = L0_834
  if not L4_960 then
    L4_960 = type
    L4_960 = L4_960(A2_958)
    if L4_960 == "nil" then
      return
    end
    if L4_960 == "function" then
      A2_958(-1, nil)
      return
    end
    A3_959(A2_958, -1, nil)
    return
  end
  L4_960 = string
  L4_960 = L4_960.format
  L4_960 = L4_960("%s/account/token", A0_956.sWebSite)
  if A1_957 then
    A1_957.token = L0_834
    A1_957.time = os.time()
    A1_957.version = Config.Version
  end
  A0_956:SetData(L4_960, "post", A1_957, A2_958, A3_959)
end
function AdventureSDK.ExchangeSet(A0_961, A1_962, A2_963, A3_964)
  local L4_965
  L4_965 = L0_834
  if not L4_965 then
    L4_965 = type
    L4_965 = L4_965(A2_963)
    if L4_965 == "nil" then
      return
    end
    if L4_965 == "function" then
      A2_963(-1, nil)
      return
    end
    A3_964(A2_963, -1, nil)
    return
  end
  L4_965 = string
  L4_965 = L4_965.format
  L4_965 = L4_965("%s/exchange/set", A0_961.sWebSite)
  if A1_962 then
    A1_962.token = L0_834
  end
  A0_961:SetData(L4_965, "post", A1_962, A2_963, A3_964)
end
function AdventureSDK.ExchangeMove(A0_966, A1_967, A2_968, A3_969)
  local L4_970
  L4_970 = L0_834
  if not L4_970 then
    L4_970 = type
    L4_970 = L4_970(A2_968)
    if L4_970 == "nil" then
      return
    end
    if L4_970 == "function" then
      A2_968(-1, nil)
      return
    end
    A3_969(A2_968, -1, nil)
    return
  end
  L4_970 = string
  L4_970 = L4_970.format
  L4_970 = L4_970("%s/exchange/move", A0_966.sWebSite)
  if A1_967 then
    A1_967.token = L0_834
  end
  A0_966:SetData(L4_970, "post", A1_967, A2_968, A3_969)
end
function AdventureSDK.ExchangeGet(A0_971, A1_972, A2_973, A3_974)
  local L4_975, L5_976, L6_977
  L4_975 = L0_834
  if not L4_975 then
    L4_975 = type
    L5_976 = A2_973
    L4_975 = L4_975(L5_976)
    if L4_975 == "nil" then
      return
    end
    if L4_975 == "function" then
      L5_976 = A2_973
      L6_977 = -1
      L5_976(L6_977, nil)
      return
    end
    L5_976 = A3_974
    L6_977 = A2_973
    L5_976(L6_977, -1, nil)
    return
  end
  if A1_972 then
    L4_975 = A1_972.page
  else
    L4_975 = L4_975 or 0
  end
  if A1_972 then
    L5_976 = A1_972.amount
  else
    L5_976 = L5_976 or 20
  end
  L6_977 = string
  L6_977 = L6_977.format
  L6_977 = L6_977("%s/exchange/get/%d/%d", A0_971.sWebSite, L4_975, L5_976)
  if A1_972 then
    A1_972.token = L0_834
  end
  A0_971:SetData(L6_977, "post", A1_972, A2_973, A3_974)
end
function AdventureSDK.ExchangeMy(A0_978, A1_979, A2_980)
  local L3_981, L4_982
  L3_981 = L0_834
  if not L3_981 then
    L3_981 = type
    L4_982 = A1_979
    L3_981 = L3_981(L4_982)
    if L3_981 == "nil" then
      return
    end
    if L3_981 == "function" then
      L4_982 = A1_979
      L4_982(-1, nil)
      return
    end
    L4_982 = A2_980
    L4_982(A1_979, -1, nil)
    return
  end
  L3_981 = JsonObject
  L3_981 = L3_981()
  L4_982 = L0_834
  L3_981.token = L4_982
  L4_982 = string
  L4_982 = L4_982.format
  L4_982 = L4_982("%s/exchange/my", A0_978.sWebSite)
  A0_978:SetData(L4_982, "post", L3_981, A1_979, A2_980)
end
function AdventureSDK.ExchangePurchase(A0_983, A1_984, A2_985, A3_986)
  local L4_987
  L4_987 = L0_834
  if not L4_987 then
    L4_987 = type
    L4_987 = L4_987(A2_985)
    if L4_987 == "nil" then
      return
    end
    if L4_987 == "function" then
      A2_985(-1, nil)
      return
    end
    A3_986(A2_985, -1, nil)
    return
  end
  L4_987 = string
  L4_987 = L4_987.format
  L4_987 = L4_987("%s/exchange/purchase", A0_983.sWebSite)
  if A1_984 then
    A1_984.token = L0_834
  end
  A0_983:SetData(L4_987, "post", A1_984, A2_985, A3_986)
end
function AdventureSDK.Snapshoot(A0_988, A1_989, A2_990, A3_991)
  local L4_992, L5_993
  L4_992 = L0_834
  if not L4_992 then
    L4_992 = type
    L5_993 = A2_990
    L4_992 = L4_992(L5_993)
    if L4_992 == "nil" then
      return
    end
    if L4_992 == "function" then
      L5_993 = A2_990
      L5_993(-1, nil)
      return
    end
    L5_993 = A3_991
    L5_993(A2_990, -1, nil)
    return
  end
  L4_992 = JsonObject
  L4_992 = L4_992()
  L5_993 = L0_834
  L4_992.token = L5_993
  L5_993 = os
  L5_993 = L5_993.time
  L5_993 = L5_993()
  L4_992.time = L5_993
  L5_993 = Config
  L5_993 = L5_993.Version
  L4_992.version = L5_993
  L4_992.data = A1_989
  L5_993 = string
  L5_993 = L5_993.format
  L5_993 = L5_993("%s/system/snapshoot", A0_988.sWebSite)
  A0_988:SetData(L5_993, "post", L4_992, A2_990, A3_991)
end
function AdventureSDK.LevelRanking(A0_994, A1_995, A2_996, A3_997, A4_998, A5_999)
  local L6_1000, L7_1001
  L6_1000 = L0_834
  if not L6_1000 then
    L6_1000 = type
    L7_1001 = A4_998
    L6_1000 = L6_1000(L7_1001)
    if L6_1000 == "nil" then
      return
    end
    if L6_1000 == "function" then
      L7_1001 = A4_998
      L7_1001(-1, nil)
      return
    end
    L7_1001 = A5_999
    L7_1001(A4_998, -1, nil)
    return
  end
  L6_1000 = JsonObject
  L6_1000 = L6_1000()
  L7_1001 = L0_834
  L6_1000.token = L7_1001
  L7_1001 = string
  L7_1001 = L7_1001.format
  L7_1001 = L7_1001("%s/system/lranking/%d/%d/%d", A0_994.sWebSite, A1_995, A2_996, A3_997)
  A0_994:SetData(L7_1001, "post", L6_1000, A4_998, A5_999)
end
function AdventureSDK.Report(A0_1002, A1_1003, A2_1004, A3_1005)
  local L4_1006, L5_1007
  if not A1_1003 or A1_1003 == "" then
    return
  end
  L4_1006 = JsonObject
  L4_1006 = L4_1006()
  L4_1006.error = A1_1003
  L5_1007 = string
  L5_1007 = L5_1007.format
  L5_1007 = L5_1007("%s/system/report", A0_1002.sWebSite)
  A0_1002:SetData(L5_1007, "post", L4_1006, A2_1004, A3_1005)
end
function AdventureSDK.Destructor(A0_1008)
  local L1_1009
end
Global.AdventureSDK = AdventureSDK()
