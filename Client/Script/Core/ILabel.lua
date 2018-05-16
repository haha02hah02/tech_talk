Class.ILabel.Component({})
function ILabel.Constructor(A0_2089, ...)
  Component.Constructor(A0_2089)
  A0_2089.render = LabelAtlas(...)
end
function ILabel.class_get(A0_2090, A1_2091)
  local L2_2092
  L2_2092 = "ILabel"
  return L2_2092
end
function ILabel.text_get(A0_2093, A1_2094)
  local L2_2095
  L2_2095 = A0_2093.render
  if not L2_2095 then
    return
  end
  return L2_2095:String()
end
function ILabel.text_set(A0_2096, A1_2097, A2_2098)
  local L3_2099
  L3_2099 = A0_2096.render
  if not L3_2099 then
    return
  end
  if type(A2_2098) ~= "string" then
    return
  end
  L3_2099:SetString(A2_2098)
end
