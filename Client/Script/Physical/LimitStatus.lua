Class.LimitStatus.None({})
function LimitStatus.Constructor(A0_4685, A1_4686, A2_4687, A3_4688, A4_4689, A5_4690)
  A0_4685.operate = A1_4686
  A0_4685.walk = A2_4687
  A0_4685.jump = A3_4688
  A0_4685.attack = A4_4689
  A0_4685.skill = A5_4690
end
function LimitStatus.Up(A0_4691)
  return not A0_4691.operate
end
function LimitStatus.Down(A0_4692)
  return not A0_4692.operate
end
function LimitStatus.Left(A0_4693)
  return not A0_4693.operate
end
function LimitStatus.Right(A0_4694)
  return not A0_4694.operate
end
function LimitStatus.Walk(A0_4695)
  return not A0_4695.walk
end
function LimitStatus.Jump(A0_4696, A1_4697)
  return not A0_4696.jump
end
function LimitStatus.Attack(A0_4698, A1_4699)
  return not A0_4698.attack
end
function LimitStatus.CastSkill(A0_4700, A1_4701, A2_4702)
  return not A0_4700.skill
end
