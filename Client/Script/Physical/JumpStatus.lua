Class.JumpStatus.StatusHandle({})
function JumpStatus.Constructor(A0_4557)
  StatusHandle.Constructor(A0_4557)
end
function JumpStatus.Left(A0_4558)
  if not A0_4558:Object() then
    return
  end
  if not A0_4558:Object().parent.swim then
    return
  end
  StatusHandle.Left(A0_4558)
end
function JumpStatus.Right(A0_4559)
  if not A0_4559:Object() then
    return
  end
  if not A0_4559:Object().parent.swim then
    return
  end
  StatusHandle.Right(A0_4559)
end
function JumpStatus.Walk(A0_4560)
  if not A0_4560:Object() then
    return
  end
  if not A0_4560:Object().parent.swim then
    return
  end
  StatusHandle.Walk(A0_4560)
end
function JumpStatus.Jump(A0_4561)
  if not A0_4561:Object() then
    return
  end
  if not A0_4561:Object().parent.swim then
    return
  end
  StatusHandle.Jump(A0_4561)
end
