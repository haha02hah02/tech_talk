Class.FallStatus.StatusHandle({})
function FallStatus.Constructor(A0_4390)
  StatusHandle.Constructor(A0_4390)
end
function FallStatus.Start(A0_4391, A1_4392)
  StatusHandle.Start(A0_4391, A1_4392)
  if not A1_4392.body then
    return
  end
  A0_4391.move_once = A1_4392.body:GetLinearVelocity().x
end
function FallStatus.Left(A0_4393)
  if not A0_4393:Object() then
    return
  end
  if A0_4393:Object().parent.swim then
    StatusHandle.Left(A0_4393)
    return
  end
  if A0_4393.move_once < -1 then
    return
  end
  A0_4393.move_once = -2
  A0_4393:Object().impulse_x = -1
end
function FallStatus.Right(A0_4394)
  if not A0_4394:Object() then
    return
  end
  if A0_4394:Object().parent.swim then
    StatusHandle.Right(A0_4394)
    return
  end
  if A0_4394.move_once > 1 then
    return
  end
  A0_4394.move_once = 2
  A0_4394:Object().impulse_x = 1
end
function FallStatus.Walk(A0_4395)
  if not A0_4395:Object() then
    return
  end
  if not A0_4395:Object().parent.swim then
    return
  end
  StatusHandle.Walk(A0_4395)
end
function FallStatus.Jump(A0_4396)
  if not A0_4396:Object() then
    return
  end
  if not A0_4396:Object().parent.swim then
    return
  end
  StatusHandle.Jump(A0_4396)
end
