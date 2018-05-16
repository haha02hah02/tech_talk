Class.CheckBox.Component({})
function CheckBox.Constructor(A0_1222, A1_1223, A2_1224, A3_1225)
  local L4_1226, L5_1227, L6_1228, L7_1229
  L4_1226 = Component
  L4_1226 = L4_1226.Constructor
  L5_1227 = A0_1222
  L4_1226(L5_1227)
  L4_1226 = Menu
  L4_1226 = L4_1226()
  if not L4_1226 then
    return
  end
  L6_1228 = L4_1226
  L5_1227 = L4_1226.SetPosition
  L7_1229 = 0
  L5_1227(L6_1228, L7_1229, 0)
  A0_1222.render = L4_1226
  if A3_1225 then
    L5_1227 = MenuItemImage
    L6_1228 = A1_1223
    L7_1229 = A2_1224
    L5_1227 = L5_1227(L6_1228, L7_1229, A3_1225)
  elseif not L5_1227 then
    L5_1227 = MenuItemImage
    L6_1228 = A1_1223
    L7_1229 = A2_1224
    L5_1227 = L5_1227(L6_1228, L7_1229)
  end
  if A3_1225 then
    L6_1228 = MenuItemImage
    L7_1229 = A2_1224
    L6_1228 = L6_1228(L7_1229, A1_1223, A3_1225)
  elseif not L6_1228 then
    L6_1228 = MenuItemImage
    L7_1229 = A2_1224
    L6_1228 = L6_1228(L7_1229, A1_1223)
  end
  L7_1229 = MenuItemToggle
  L7_1229 = L7_1229(L5_1227)
  L7_1229:AddSubItem(L6_1228)
  L7_1229:SetSelectedIndex(0)
  rawset(A0_1222, "oNormalState", L5_1227)
  rawset(A0_1222, "oSelectState", L6_1228)
  A0_1222.normal_state = L5_1227
  A0_1222.select_state = L6_1228
  if not L7_1229 then
    return
  end
  L7_1229:SetTag(1)
  L4_1226:AddChild(L7_1229)
  A0_1222.on = {
    "Start",
    A0_1222,
    CheckBox.on_start_set
  }
  A0_1222.on = {
    "Stop",
    A0_1222,
    CheckBox.on_stop_set
  }
end
function CheckBox.normal_state_get(A0_1230, A1_1231)
  return rawget(A0_1230, "normal_state")
end
function CheckBox.normal_state_set(A0_1232, A1_1233, A2_1234)
  rawset(A0_1232, "normal_state", A2_1234)
end
function CheckBox.select_state_get(A0_1235, A1_1236)
  return rawget(A0_1235, "select_state")
end
function CheckBox.select_state_set(A0_1237, A1_1238, A2_1239)
  rawset(A0_1237, "select_state", A2_1239)
end
function CheckBox.on_checked_get(A0_1240, A1_1241)
  return rawget(A0_1240, "on_checked")
end
function CheckBox.on_checked_set(A0_1242, A1_1243, A2_1244)
  rawset(A0_1242, "on_checked", A2_1244)
end
function CheckBox.on_unchecked_get(A0_1245, A1_1246)
  return rawget(A0_1245, "on_checked")
end
function CheckBox.on_unchecked_set(A0_1247, A1_1248, A2_1249)
  rawset(A0_1247, "on_unchecked", A2_1249)
end
function CheckBox.on_start_set(A0_1250)
  local L1_1251, L2_1252, L3_1253, L4_1254
  L1_1251 = A0_1250.normal_state
  L2_1252 = A0_1250.select_state
  if not L1_1251 then
    return
  end
  if not L2_1252 then
    return
  end
  L3_1253 = Functor
  L4_1254 = A0_1250
  L3_1253 = L3_1253(L4_1254, CheckBox.on_checked_fire)
  L4_1254 = Functor
  L4_1254 = L4_1254(A0_1250, CheckBox.on_unchecked_fire)
  A0_1250.on_checked = L3_1253
  A0_1250.on_unchecked = L4_1254
  L1_1251:On("Down", L3_1253)
  L2_1252:On("Down", L4_1254)
end
function CheckBox.on_stop_set(A0_1255)
  local L1_1256, L2_1257, L3_1258, L4_1259
  L1_1256 = A0_1255.normal_state
  L2_1257 = A0_1255.select_state
  if not L1_1256 then
    return
  end
  if not L2_1257 then
    return
  end
  L3_1258 = A0_1255.on_checked
  L4_1259 = A0_1255.on_unchecked
  A0_1255.on_checked = nil
  A0_1255.on_unchecked = nil
  L1_1256:Off("Down", L3_1258)
  L2_1257:Off("Down", L4_1259)
end
function CheckBox.on_checked_fire(A0_1260)
  if A0_1260.checked then
    return
  end
  A0_1260.fire = "Checked"
end
function CheckBox.on_unchecked_fire(A0_1261)
  if A0_1261.unchecked then
    return
  end
  A0_1261.fire = "Unchecked"
end
function CheckBox.class_get(A0_1262, A1_1263)
  local L2_1264
  L2_1264 = "CheckBox"
  return L2_1264
end
function CheckBox.enable_get(A0_1265, A1_1266, A2_1267)
  local L3_1268
  L3_1268 = A0_1265.render
  if not L3_1268 then
    return
  end
  L3_1268 = L3_1268:ChildByTag(1)
  if not L3_1268 then
    return
  end
  return L3_1268:IsEnabled()
end
function CheckBox.enable_set(A0_1269, A1_1270, A2_1271)
  local L3_1272
  L3_1272 = A0_1269.render
  if not L3_1272 then
    return
  end
  L3_1272 = L3_1272:ChildByTag(1)
  if not L3_1272 then
    return
  end
  L3_1272:SetEnabled(A2_1271)
end
function CheckBox.disable_get(A0_1273, A1_1274, A2_1275)
  local L3_1276
  L3_1276 = A0_1273.render
  if not L3_1276 then
    return
  end
  L3_1276 = L3_1276:ChildByTag(1)
  if not L3_1276 then
    return
  end
  return not L3_1276:IsEnabled()
end
function CheckBox.disable_set(A0_1277, A1_1278, A2_1279)
  local L3_1280
  L3_1280 = A0_1277.render
  if not L3_1280 then
    return
  end
  L3_1280 = L3_1280:ChildByTag(1)
  if not L3_1280 then
    return
  end
  L3_1280:SetEnabled(not A2_1279)
end
function CheckBox.priority_set(A0_1281, A1_1282, A2_1283)
  local L3_1284
  L3_1284 = A0_1281.render
  if not L3_1284 then
    return
  end
  L3_1284:SetTouchPriority(A2_1283)
end
function CheckBox.checked_get(A0_1285, A1_1286)
  local L2_1287
  L2_1287 = A0_1285.render
  if not L2_1287 then
    return
  end
  L2_1287 = L2_1287:ChildByTag(1)
  if not L2_1287 then
    return
  end
  return L2_1287:SelectedIndex() == 1
end
function CheckBox.checked_set(A0_1288, A1_1289, A2_1290)
  local L3_1291
  L3_1291 = A0_1288.render
  if not L3_1291 then
    return
  end
  L3_1291 = L3_1291:ChildByTag(1)
  if not L3_1291 then
    return
  end
  L3_1291:SetSelectedIndex(A2_1290 and 1 or 0)
end
function CheckBox.unchecked_get(A0_1292, A1_1293)
  local L2_1294
  L2_1294 = A0_1292.render
  if not L2_1294 then
    return
  end
  L2_1294 = L2_1294:ChildByTag(1)
  if not L2_1294 then
    return
  end
  return L2_1294:SelectedIndex() == 0
end
function CheckBox.unchecked_set(A0_1295, A1_1296, A2_1297)
  local L3_1298
  L3_1298 = A0_1295.render
  if not L3_1298 then
    return
  end
  L3_1298 = L3_1298:ChildByTag(1)
  if not L3_1298 then
    return
  end
  L3_1298:SetSelectedIndex(A2_1297 and 0 or 1)
end
