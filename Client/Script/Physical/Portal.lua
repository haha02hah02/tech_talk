Class.Portal.Component({})
function Portal.Constructor(A0_4917, A1_4918, A2_4919, A3_4920, A4_4921)
  Component.Constructor(A0_4917)
  A0_4917.width = math.abs(A1_4918)
  A0_4917.height = math.abs(A2_4919)
  A0_4917.init_x = A3_4920 or 0
  A0_4917.init_y = A4_4921 or 0
  A0_4917.type = WORLD_TYPE_PORTAL
  A0_4917.care_type = WORLD_TYPE_LIFE
  A0_4917.on = {
    "Start",
    A0_4917,
    Portal.on_start_set
  }
  A0_4917.on = {
    "Stop",
    A0_4917,
    Portal.on_stop_set
  }
  A0_4917.on = {
    "Parent",
    A0_4917,
    Portal.on_parent_set
  }
end
function Portal.class_get(A0_4922)
  local L1_4923
  L1_4923 = "Portal"
  return L1_4923
end
function Portal.x_get(A0_4924, A1_4925)
  local L2_4926
  L2_4926 = A0_4924.body
  if not L2_4926 then
    return 0
  end
  return math.floor(L2_4926:GetPosition().x * Config.PTMRatio)
end
function Portal.x_set(A0_4927, A1_4928, A2_4929)
  local L3_4930, L4_4931, L5_4932
  L3_4930 = A0_4927.body
  if not L3_4930 then
    return
  end
  L4_4931 = Config
  L4_4931 = L4_4931.PTMRatio
  L4_4931 = A2_4929 / L4_4931
  L5_4932 = L3_4930.GetPosition
  L5_4932 = L5_4932(L3_4930)
  L5_4932 = L5_4932.y
  L3_4930:SetTransform(b2Vec2(L4_4931, L5_4932), L3_4930:GetAngle())
  L3_4930:SetAwake(true)
end
function Portal.y_get(A0_4933, A1_4934)
  local L2_4935
  L2_4935 = A0_4933.body
  if not L2_4935 then
    return 0
  end
  return math.floor(L2_4935:GetPosition().y * Config.PTMRatio)
end
function Portal.y_set(A0_4936, A1_4937, A2_4938)
  local L3_4939, L4_4940, L5_4941
  L3_4939 = A0_4936.body
  if not L3_4939 then
    return
  end
  L5_4941 = L3_4939
  L4_4940 = L3_4939.GetPosition
  L4_4940 = L4_4940(L5_4941)
  L4_4940 = L4_4940.x
  L5_4941 = Config
  L5_4941 = L5_4941.PTMRatio
  L5_4941 = A2_4938 / L5_4941
  L3_4939:SetTransform(b2Vec2(L4_4940, L5_4941), L3_4939:GetAngle())
  L3_4939:SetAwake(true)
end
function Portal.tn_get(A0_4942, A1_4943)
  return rawget(A0_4942, "tn")
end
function Portal.tn_set(A0_4944, A1_4945, A2_4946)
  rawset(A0_4944, "tn", A2_4946)
end
function Portal.pt_get(A0_4947, A1_4948)
  return rawget(A0_4947, "pt")
end
function Portal.pt_set(A0_4949, A1_4950, A2_4951)
  rawset(A0_4949, "pt", A2_4951)
end
function Portal.tm_get(A0_4952, A1_4953)
  return rawget(A0_4952, "tm")
end
function Portal.tm_set(A0_4954, A1_4955, A2_4956)
  rawset(A0_4954, "tm", A2_4956)
end
function Portal.bottom_get(A0_4957, A1_4958)
  local L3_4959
  L3_4959 = A0_4957.y
  L3_4959 = L3_4959 - A0_4957.height / 2
  return L3_4959
end
function Portal.position_get(A0_4960, A1_4961)
  local L2_4962
  L2_4962 = A0_4960.body
  if not L2_4962 then
    return
  end
  return math.ceil(L2_4962:GetPosition().x * Config.PTMRatio), (math.ceil(L2_4962:GetPosition().y * Config.PTMRatio))
end
function Portal.position_set(A0_4963, A1_4964, A2_4965, A3_4966)
  local L4_4967, L5_4968, L6_4969
  L4_4967 = A0_4963.body
  if not L4_4967 then
    return
  end
  L5_4968 = Config
  L5_4968 = L5_4968.PTMRatio
  L5_4968 = A2_4965 / L5_4968
  L6_4969 = Config
  L6_4969 = L6_4969.PTMRatio
  L6_4969 = A3_4966 / L6_4969
  L4_4967:SetTransform(b2Vec2(L5_4968, L6_4969), L4_4967:GetAngle())
  L4_4967:SetAwake(true)
end
function Portal.init_x_get(A0_4970, A1_4971)
  return rawget(A0_4970, "init_x") or 0
end
function Portal.init_x_set(A0_4972, A1_4973, A2_4974)
  rawset(A0_4972, "init_x", A2_4974)
end
function Portal.init_y_get(A0_4975, A1_4976)
  return rawget(A0_4975, "init_y") or 0
end
function Portal.init_y_set(A0_4977, A1_4978, A2_4979)
  rawset(A0_4977, "init_y", A2_4979)
end
function Portal.script_get(A0_4980, A1_4981)
  return rawget(A0_4980, "script")
end
function Portal.script_set(A0_4982, A1_4983, A2_4984)
  rawset(A0_4982, "script", A2_4984)
end
function Portal.script_arg_get(A0_4985, A1_4986)
  return rawget(A0_4985, "script_arg")
end
function Portal.script_arg_set(A0_4987, A1_4988, A2_4989)
  rawset(A0_4987, "script_arg", A2_4989)
end
function Portal.width_get(A0_4990, A1_4991)
  return rawget(A0_4990, "width", tValue)
end
function Portal.width_set(A0_4992, A1_4993, A2_4994)
  rawset(A0_4992, "width", A2_4994)
end
function Portal.height_get(A0_4995, A1_4996)
  return rawget(A0_4995, "height", tValue)
end
function Portal.height_set(A0_4997, A1_4998, A2_4999)
  rawset(A0_4997, "height", A2_4999)
end
function Portal.type_get(A0_5000, A1_5001)
  return rawget(A0_5000, "type")
end
function Portal.type_set(A0_5002, A1_5003, A2_5004)
  rawset(A0_5002, "type", A2_5004)
end
function Portal.care_type_get(A0_5005, A1_5006)
  return rawget(A0_5005, "care_type")
end
function Portal.care_type_set(A0_5007, A1_5008, A2_5009)
  rawset(A0_5007, "care_type", A2_5009)
end
function Portal.body_get(A0_5010, A1_5011)
  return rawget(A0_5010, "body")
end
function Portal.body_set(A0_5012, A1_5013, A2_5014)
  local L3_5015
  L3_5015 = A0_5012.body
  rawset(A0_5012, "body", A2_5014)
  if not L3_5015 then
    return
  end
  L3_5015:SetUserData(nil)
  L3_5015:GetWorld():DestroyBody(L3_5015)
end
function Portal.begin_contact(A0_5016, A1_5017)
  if A0_5016.pt == 3 then
    A0_5016.action = A1_5017
    return
  end
end
function Portal.direct_action_set(A0_5018, A1_5019, A2_5020)
  local L3_5021, L4_5022, L5_5023, L6_5024
  L3_5021 = A0_5018.name
  A2_5020.portal_limit = true
  if L3_5021 == "marketout00" then
    L4_5022 = A2_5020.revert_map
  else
    L4_5022 = L4_5022 or A0_5018.tm
  end
  if L3_5021 == "marketout00" then
    L5_5023 = "market00"
  else
    L5_5023 = L5_5023 or A0_5018.tn
  end
  L6_5024 = A0_5018.script
  if L6_5024 ~= nil then
    L6_5024 = Global
    L6_5024 = L6_5024[string.format("portal_%d", A0_5018.script)]
    if L6_5024 and L6_5024(A2_5020, A0_5018.script_arg) then
      UniqueComponent("Model/interface.model").node.Interface:SetNotice(62)
      return
    end
  end
  if L3_5021 == "market00" then
    L4_5022 = 910000000
    L6_5024 = A2_5020.parent
    L6_5024 = L6_5024.parent
    L6_5024 = L6_5024.id
    A2_5020.revert_map = L6_5024
  end
  if L4_5022 == 999999999 then
    return
  end
  L6_5024 = Sound
  L6_5024 = L6_5024.PlayEffect
  L6_5024(L6_5024, "Music/Game/Portal.mp3")
  L6_5024 = {}
  L6_5024.tm = L4_5022
  L6_5024.tn = L5_5023
  A2_5020.transfer = L6_5024
end
function Portal.network_object_get(A0_5025)
  return rawget(A0_5025, "network_object")
end
function Portal.network_object_set(A0_5026, A1_5027, A2_5028)
  rawset(A0_5026, "network_object", A2_5028)
end
function Portal.verify_response_fire(A0_5029, A1_5030, A2_5031)
  A0_5029.network_object = nil
  UniqueComponent("Model/interface.model").ui.iloading.visible = false
  if A1_5030 == 0 then
    A0_5029.direct_action = A0_5029.network_object
    return
  end
  UniqueComponent("Model/interface.model").node.Interface:SetNotice(A1_5030 == -1 and 28 or 27)
end
function Portal.action_set(A0_5032, A1_5033, A2_5034)
  if not A0_5032.script then
    A0_5032.direct_action = A2_5034
    return
  end
  if UniqueComponent("Model/interface.model").ui.iloading.visible then
    return
  end
  UniqueComponent("Model/interface.model").ui.iloading.visible = true
  A0_5032.network_object = A2_5034
  AdventureSDK:Verify(A0_5032, Portal.verify_response_fire)
end
function Portal.on_parent_set(A0_5035, A1_5036)
  local L2_5037, L3_5038, L4_5039, L5_5040, L6_5041, L7_5042, L8_5043
  A0_5035.body = nil
  L2_5037 = A0_5035.parent
  if not L2_5037 then
    return
  end
  L3_5038 = L2_5037.world
  if not L3_5038 then
    return
  end
  L4_5039 = Config
  L4_5039 = L4_5039.PTMRatio
  L5_5040 = b2BodyDef
  L5_5040 = L5_5040()
  L6_5041 = b2_staticBody
  L5_5040.type = L6_5041
  L6_5041 = L5_5040.position
  L7_5042 = A0_5035.init_x
  L7_5042 = L7_5042 / L4_5039
  L6_5041.x = L7_5042
  L6_5041 = L5_5040.position
  L7_5042 = A0_5035.init_y
  L8_5043 = A0_5035.height
  L8_5043 = L8_5043 / 2
  L7_5042 = L7_5042 + L8_5043
  L7_5042 = L7_5042 / L4_5039
  L6_5041.y = L7_5042
  L5_5040.fixedRotation = true
  L6_5041 = Instance
  L8_5043 = L3_5038
  L7_5042 = L3_5038.CreateBody
  L8_5043 = L7_5042(L8_5043, L5_5040)
  L6_5041 = L6_5041(L7_5042, L8_5043, L7_5042(L8_5043, L5_5040))
  L7_5042 = b2PolygonShape
  L7_5042 = L7_5042()
  L8_5043 = L7_5042.SetAsBox
  L8_5043(L7_5042, A0_5035.width / 2 / L4_5039, A0_5035.height / 2 / L4_5039)
  L8_5043 = b2FixtureDef
  L8_5043 = L8_5043()
  L8_5043.shape = L7_5042
  L8_5043.isSensor = true
  L8_5043.friction = 1.0
  L8_5043.filter.categoryBits = A0_5035.type
  L8_5043.filter.maskBits = A0_5035.care_type
  A0_5035.body = L6_5041
  L6_5041:CreateFixture(L8_5043)
end
function Portal.on_start_set(A0_5044, A1_5045)
  local L2_5046
  L2_5046 = A0_5044.body
  if not L2_5046 then
    return
  end
  L2_5046:SetUserData(A0_5044)
end
function Portal.on_stop_set(A0_5047, A1_5048)
  local L2_5049
  L2_5049 = A0_5047.body
  if not L2_5049 then
    return
  end
  L2_5049:SetUserData(nil)
end
