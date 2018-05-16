Class.Death.Script({})
function Death.Constructor(A0_6256, A1_6257)
  Script.Constructor(A0_6256, A1_6257)
  if not A1_6257 then
    return
  end
  A1_6257.empty_limit.on = {
    "Down",
    A0_6256,
    A0_6256.OnEmptyLimitDown
  }
end
function Death.OnEmptyLimitDown(A0_6258)
  if not UniqueComponent("Model/interface.model").parent then
    return
  end
  if not UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object] then
    return
  end
  UniqueComponent("Model/interface.model").parent.physical[UniqueComponent("Model/interface.model").parent.focus_object].transfer = {
    tm = UniqueComponent("Model/interface.model").parent.info.major_city or UniqueComponent("Model/interface.model").parent.id
  }
end
