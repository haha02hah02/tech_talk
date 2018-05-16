Class.JsonArray.Json({})
function JsonArray.Constructor(A0_3770, A1_3771)
  local L2_3772
  if A1_3771 ~= nil then
    L2_3772 = rawset
    L2_3772(A0_3770, "this", A1_3771)
    return
  end
  L2_3772 = Json
  L2_3772 = L2_3772()
  if not L2_3772 then
    return
  end
  L2_3772.Type = Json_Array
  rawset(A0_3770, "this", L2_3772)
end
function JsonArray.Append(A0_3773, A1_3774)
  local L2_3775
  L2_3775 = MakeJsonData
  L2_3775(tostring(A0_3773:Size() + 1), A1_3774, rawget(A0_3773, "this"))
end
function JsonArray.First(A0_3776)
  local L1_3777, L2_3778
  L1_3777 = rawget
  L2_3778 = A0_3776
  L1_3777 = L1_3777(L2_3778, "this")
  if not L1_3777 then
    return
  end
  L2_3778 = Instance
  L2_3778 = L2_3778(L1_3777.Child)
  rawset(A0_3776, "nchild", L2_3778)
  if not L2_3778 then
    return
  end
  return SwitchJsonData(L2_3778)
end
function JsonArray.Next(A0_3779)
  local L1_3780, L2_3781
  L1_3780 = rawget
  L2_3781 = A0_3779
  L1_3780 = L1_3780(L2_3781, "nchild")
  if not L1_3780 then
    return
  end
  L2_3781 = Instance
  L2_3781 = L2_3781(L1_3780.Next)
  rawset(A0_3779, "nchild", L2_3781)
  if not L2_3781 then
    return
  end
  return SwitchJsonData(L2_3781)
end
function JsonArray.String(A0_3782)
  local L1_3783
  L1_3783 = rawget
  L1_3783 = L1_3783(A0_3782, "this")
  if not L1_3783 then
    return
  end
  return MakeJsonString(L1_3783, true)
end
