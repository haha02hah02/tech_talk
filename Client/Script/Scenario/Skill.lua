Class.Skill.Script({})
function Skill.Constructor(A0_6966, A1_6967)
  Script.Constructor(A0_6966, A1_6967)
  if not A1_6967 then
    return
  end
  A1_6967.on = {
    "Visible",
    A0_6966,
    A0_6966.OnVisible
  }
end
function Skill.SetJob(A0_6968, A1_6969, A2_6970)
  local L3_6971, L4_6972, L5_6973, L6_6974, L7_6975, L8_6976, L9_6977, L10_6978, L11_6979
  L4_6972 = A0_6968
  L3_6971 = A0_6968.Parent
  L3_6971 = L3_6971(L4_6972)
  L4_6972 = L3_6971.scrollview
  if L5_6973 == A1_6969 then
    for L8_6976, L9_6977 in L5_6973(L6_6974) do
      L9_6977.refresh = A2_6970
    end
    return
  end
  A0_6968.job_id = A1_6969
  for L8_6976, L9_6977 in L5_6973(L6_6974) do
    L9_6977.parent = nil
  end
  if L5_6973 then
  else
  end
  if not L6_6974 then
    return
  end
  for L10_6978, L11_6979 in L7_6975(L8_6976) do
    if L11_6979.type ~= "attack" then
      SkillView(L10_6978, L11_6979).name = L10_6978
      SkillView(L10_6978, L11_6979).order = L10_6978
      SkillView(L10_6978, L11_6979).parent = L4_6972
      SkillView(L10_6978, L11_6979).refresh = A2_6970
    end
  end
  L4_6972.refresh = true
end
function Skill.OnVisible(A0_6980, A1_6981)
  local L2_6982, L3_6983, L4_6984, L5_6985
  L2_6982 = A1_6981.visible
  if not L2_6982 then
    return
  end
  L2_6982 = LoadConf
  L3_6983 = "Config/Jobs.conf"
  L2_6982 = L2_6982(L3_6983)
  L3_6983 = UniqueComponent
  L4_6984 = "Model/interface.model"
  L3_6983 = L3_6983(L4_6984)
  L4_6984 = L3_6983.parent
  if not L4_6984 then
    return
  end
  L5_6985 = L4_6984.physical
  L5_6985 = L5_6985[L4_6984.focus_object]
  if not L5_6985 then
    return
  end
  A0_6980:SetJob(L5_6985.data.job, L5_6985)
  A1_6981.job.text = L2_6982[L5_6985.data.job].attribute.name
end
