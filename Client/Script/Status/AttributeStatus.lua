Class.AttributeStatus.Component({})
function AttributeStatus.Constructor(A0_8518, A1_8519, A2_8520, A3_8521)
  local L4_8522, L5_8523, L6_8524, L7_8525, L8_8526, L9_8527, L10_8528
  L4_8522 = Component
  L4_8522 = L4_8522.Constructor
  L5_8523 = A0_8518
  L4_8522(L5_8523)
  A0_8518.name = "proxy"
  if not A1_8519 or not A3_8521 then
    return
  end
  L4_8522 = A1_8519.data
  L4_8522 = L4_8522.level
  L5_8523 = A3_8521.req_level
  L5_8523 = L5_8523 or 0
  if L4_8522 < L5_8523 then
    return
  end
  L4_8522 = A0_8518.attach_data
  L5_8523 = math
  L5_8523 = L5_8523.min
  L6_8524 = A1_8519.data
  L6_8524 = L6_8524.level
  L6_8524 = L6_8524 - L7_8525
  L5_8523 = L5_8523(L6_8524, L7_8525)
  L6_8524 = DataFormat
  L6_8524 = L6_8524()
  for L10_8528, _FORV_11_ in L7_8525(L8_8526) do
    if A3_8521[L10_8528] then
      L6_8524[L10_8528] = A3_8521[L10_8528] + (A3_8521[string.format("l%s", L10_8528)] or 0) * L5_8523
    end
  end
  A0_8518.attach_data = L6_8524
end
function AttributeStatus.class_get(A0_8529)
  local L1_8530
  L1_8530 = "AttributeStatus"
  return L1_8530
end
function AttributeStatus.attach_data_get(A0_8531)
  return rawget(A0_8531, "attach_data")
end
function AttributeStatus.attach_data_set(A0_8532, A1_8533, A2_8534)
  rawset(A0_8532, "attach_data", A2_8534)
end
function AttributeStatus.attach_set(A0_8535, A1_8536, A2_8537)
  local L3_8538
  L3_8538 = A2_8537.source
  if not L3_8538 then
    return
  end
  L3_8538.data.attach = A0_8535.attach_data
end
function AttributeStatus.unattach_set(A0_8539, A1_8540, A2_8541)
  local L3_8542
  L3_8542 = A2_8541.source
  if not L3_8542 then
    return
  end
  L3_8542.data.unattach = A0_8539.attach_data
end
