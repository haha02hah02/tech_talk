Class.InterfaceEmpty.Script({})
function InterfaceEmpty.Constructor(A0_6507, A1_6508)
  Script.Constructor(A0_6507, A1_6508)
  if not A1_6508 then
    return
  end
  A1_6508.empty_limit.on = {
    "Down",
    A0_6507,
    A0_6507.OnEmptyLimitDown
  }
end
function InterfaceEmpty.OnEmptyLimitDown(A0_6509, A1_6510)
  A0_6509:Parent().visible = false
end
