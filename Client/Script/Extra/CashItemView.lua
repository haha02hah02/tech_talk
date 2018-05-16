Class.CashItemView.Component({})
function CashItemView.Constructor(A0_3364, A1_3365)
  Component.Constructor(A0_3364)
  if not Node() then
    return
  end
  A0_3364.render = Node()
  if not LoadConf(string.format("Item/%d.item", A1_3365)) or not LoadConf(string.format("Item/%d.item", A1_3365)).info.is_cash then
    return
  end
  A0_3364.info = LoadConf(string.format("Item/%d.item", A1_3365)).info
  A0_3364.id = A1_3365
  Image(string.format("Item/%d.icon", A1_3365)).name = "icon"
  Image(string.format("Item/%d.icon", A1_3365)).x = 96
  Image(string.format("Item/%d.icon", A1_3365)).y = 35
  Image(string.format("Item/%d.icon", A1_3365)).parent = A0_3364
  Label(A0_3364.info.name, "Arial", 11).name = "item_name"
  Label(A0_3364.info.name, "Arial", 11).x = 11
  Label(A0_3364.info.name, "Arial", 11).y = 43
  Label(A0_3364.info.name, "Arial", 11).color = 3138002687
  Label(A0_3364.info.name, "Arial", 11).anchorpoint = {0, 0.5}
  Label(A0_3364.info.name, "Arial", 11).parent = A0_3364
  Label(string.format("%d \231\167\175\229\136\134", A0_3364.price), "Arial", 11).name = "point"
  Label(string.format("%d \231\167\175\229\136\134", A0_3364.price), "Arial", 11).x = 11
  Label(string.format("%d \231\167\175\229\136\134", A0_3364.price), "Arial", 11).y = 23
  Label(string.format("%d \231\167\175\229\136\134", A0_3364.price), "Arial", 11).color = 1515870975
  Label(string.format("%d \231\167\175\229\136\134", A0_3364.price), "Arial", 11).anchorpoint = {0, 0.5}
  Label(string.format("%d \231\167\175\229\136\134", A0_3364.price), "Arial", 11).parent = A0_3364
end
function CashItemView.class_get(A0_3366)
  local L1_3367
  L1_3367 = "CashItemView"
  return L1_3367
end
function CashItemView.info_get(A0_3368)
  return rawget(A0_3368, "info", tValue)
end
function CashItemView.info_set(A0_3369, A1_3370, A2_3371)
  rawset(A0_3369, "info", A2_3371)
end
function CashItemView.id_get(A0_3372)
  return rawget(A0_3372, "id")
end
function CashItemView.id_set(A0_3373, A1_3374, A2_3375)
  rawset(A0_3373, "id", A2_3375)
end
function CashItemView.type_get(A0_3376)
  local L1_3377
  L1_3377 = A0_3376.info
  return L1_3377 and L1_3377.type or nil
end
function CashItemView.stype_get(A0_3378)
  local L1_3379
  L1_3379 = A0_3378.info
  return L1_3379 and L1_3379.stype or nil
end
function CashItemView.req_job_get(A0_3380)
  local L1_3381
  L1_3381 = A0_3380.info
  return L1_3381 and L1_3381.req_job or nil
end
function CashItemView.req_sex_get(A0_3382)
  local L1_3383
  L1_3383 = A0_3382.info
  return L1_3383 and L1_3383.req_sex or nil
end
function CashItemView.price_get(A0_3384)
  local L1_3385
  L1_3385 = A0_3384.info
  return L1_3385 and L1_3385.price or nil
end
