Class.InterfaceStop.Script({})
function InterfaceStop.Constructor(A0_6525, A1_6526)
  Script.Constructor(A0_6525, A1_6526)
  if not A1_6526 then
    return
  end
  A1_6526.on = {
    "Stop",
    A0_6525,
    A0_6525.OnStop
  }
end
function InterfaceStop.OnStop(A0_6527, A1_6528)
  A0_6527:Parent().visible = false
end
