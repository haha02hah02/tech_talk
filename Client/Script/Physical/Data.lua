L0_3927 = Class
L0_3927 = L0_3927.Data
L0_3927 = L0_3927.EventSet
L0_3927({})
L0_3927 = LoadConf
L0_3927 = L0_3927("Config/Levels.conf")
function Data.Constructor(A0_3928)
  local L1_3929
  L1_3929 = DataFormat
  L1_3929 = L1_3929()
  rawset(A0_3928, "values", L1_3929)
  EventSet.Constructor(A0_3928)
  A0_3928.additive = DataFormat()
  A0_3928.attach_property = {}
end
function Data.class_get(A0_3930)
  local L1_3931
  L1_3931 = "Data"
  return L1_3931
end
function Data.base_str_get(A0_3932, A1_3933)
  local L2_3934, L3_3935, L4_3936, L5_3937
  L2_3934 = A0_3932.values
  L2_3934 = L2_3934.level
  if not L2_3934 then
    L2_3934 = Config
    L2_3934 = L2_3934.ZeroNumber
  end
  L3_3935 = A0_3932.values
  L3_3935 = L3_3935.str_inc
  if not L3_3935 then
    L3_3935 = Config
    L3_3935 = L3_3935.ZeroNumber
  end
  L4_3936 = A0_3932.values
  L4_3936 = L4_3936.str_race
  if not L4_3936 then
    L4_3936 = Config
    L4_3936 = L4_3936.ZeroNumber
  end
  L5_3937 = L2_3934 * L3_3935
  L5_3937 = L5_3937 + L4_3936
  return L5_3937
end
function Data.plus_str_get(A0_3938, A1_3939)
  local L2_3940
  L2_3940 = A0_3938.additive
  L2_3940 = L2_3940.str
  L2_3940 = L2_3940 or 0
  return L2_3940
end
function Data.str_get(A0_3941, A1_3942)
  return A0_3941.base_str + A0_3941.plus_str
end
function Data.base_dex_get(A0_3943, A1_3944)
  local L2_3945, L3_3946, L4_3947, L5_3948
  L2_3945 = A0_3943.values
  L2_3945 = L2_3945.level
  if not L2_3945 then
    L2_3945 = Config
    L2_3945 = L2_3945.ZeroNumber
  end
  L3_3946 = A0_3943.values
  L3_3946 = L3_3946.dex_inc
  if not L3_3946 then
    L3_3946 = Config
    L3_3946 = L3_3946.ZeroNumber
  end
  L4_3947 = A0_3943.values
  L4_3947 = L4_3947.dex_race
  if not L4_3947 then
    L4_3947 = Config
    L4_3947 = L4_3947.ZeroNumber
  end
  L5_3948 = L2_3945 * L3_3946
  L5_3948 = L5_3948 + L4_3947
  return L5_3948
end
function Data.plus_dex_get(A0_3949, A1_3950)
  local L2_3951
  L2_3951 = A0_3949.additive
  L2_3951 = L2_3951.dex
  if not L2_3951 then
    L2_3951 = Config
    L2_3951 = L2_3951.ZeroNumber
  end
  return L2_3951
end
function Data.dex_get(A0_3952, A1_3953)
  return A0_3952.base_dex + A0_3952.plus_dex
end
function Data.base_int_get(A0_3954, A1_3955)
  local L2_3956, L3_3957, L4_3958, L5_3959
  L2_3956 = A0_3954.values
  L2_3956 = L2_3956.level
  if not L2_3956 then
    L2_3956 = Config
    L2_3956 = L2_3956.ZeroNumber
  end
  L3_3957 = A0_3954.values
  L3_3957 = L3_3957.int_inc
  if not L3_3957 then
    L3_3957 = Config
    L3_3957 = L3_3957.ZeroNumber
  end
  L4_3958 = A0_3954.values
  L4_3958 = L4_3958.int_race
  if not L4_3958 then
    L4_3958 = Config
    L4_3958 = L4_3958.ZeroNumber
  end
  L5_3959 = L2_3956 * L3_3957
  L5_3959 = L5_3959 + L4_3958
  return L5_3959
end
function Data.plus_int_get(A0_3960, A1_3961)
  local L2_3962
  L2_3962 = A0_3960.additive
  L2_3962 = L2_3962.int
  if not L2_3962 then
    L2_3962 = Config
    L2_3962 = L2_3962.ZeroNumber
  end
  return L2_3962
end
function Data.int_get(A0_3963, A1_3964)
  return A0_3963.base_int + A0_3963.plus_int
end
function Data.base_luck_get(A0_3965, A1_3966)
  local L2_3967, L3_3968, L4_3969, L5_3970
  L2_3967 = A0_3965.values
  L2_3967 = L2_3967.level
  if not L2_3967 then
    L2_3967 = Config
    L2_3967 = L2_3967.ZeroNumber
  end
  L3_3968 = A0_3965.values
  L3_3968 = L3_3968.luck_inc
  if not L3_3968 then
    L3_3968 = Config
    L3_3968 = L3_3968.ZeroNumber
  end
  L4_3969 = A0_3965.values
  L4_3969 = L4_3969.luck_race
  if not L4_3969 then
    L4_3969 = Config
    L4_3969 = L4_3969.ZeroNumber
  end
  L5_3970 = L2_3967 * L3_3968
  L5_3970 = L5_3970 + L4_3969
  return L5_3970
end
function Data.plus_luck_get(A0_3971, A1_3972)
  local L2_3973
  L2_3973 = A0_3971.additive
  L2_3973 = L2_3973.luck
  if not L2_3973 then
    L2_3973 = Config
    L2_3973 = L2_3973.ZeroNumber
  end
  return L2_3973
end
function Data.luck_get(A0_3974, A1_3975)
  return A0_3974.base_luck + A0_3974.plus_luck
end
function Data.base_speed_get(A0_3976, A1_3977)
  local L2_3978
  L2_3978 = A0_3976.values
  L2_3978 = L2_3978.speed
  if not L2_3978 then
    L2_3978 = Config
    L2_3978 = L2_3978.ZeroNumber
  end
  return L2_3978
end
function Data.plus_speed_get(A0_3979, A1_3980)
  return math.floor(A0_3979.base_speed * A0_3979.additive.speed / Config.HundredPercent)
end
function Data.speed_get(A0_3981, A1_3982)
  return math.max(Config.MinSpeed, A0_3981.base_speed + A0_3981.plus_speed)
end
function Data.base_jump_get(A0_3983, A1_3984)
  local L2_3985
  L2_3985 = A0_3983.values
  L2_3985 = L2_3985.jump
  if not L2_3985 then
    L2_3985 = Config
    L2_3985 = L2_3985.ZeroNumber
  end
  return L2_3985
end
function Data.plus_jump_get(A0_3986, A1_3987)
  return math.floor(A0_3986.base_jump * A0_3986.additive.jump / Config.HundredPercent)
end
function Data.jump_get(A0_3988, A1_3989)
  return math.max(Config.MinJump, A0_3988.base_jump + A0_3988.plus_jump)
end
function Data.base_power_get(A0_3990, A1_3991)
  local L2_3992
  L2_3992 = A0_3990.values
  L2_3992 = L2_3992.power
  if not L2_3992 then
    L2_3992 = Config
    L2_3992 = L2_3992.ZeroNumber
  end
  return L2_3992
end
function Data.plus_power_get(A0_3993, A1_3994)
  local L2_3995
  L2_3995 = A0_3993.additive
  L2_3995 = L2_3995.power
  if not L2_3995 then
    L2_3995 = Config
    L2_3995 = L2_3995.ZeroNumber
  end
  return L2_3995
end
function Data.power_get(A0_3996, A1_3997)
  return math.floor(A0_3996.base_power + A0_3996.plus_power)
end
function Data.base_attack_count_get(A0_3998, A1_3999)
  local L2_4000
  L2_4000 = A0_3998.values
  L2_4000 = L2_4000.attack_count
  if not L2_4000 then
    L2_4000 = Config
    L2_4000 = L2_4000.ZeroNumber
  end
  return L2_4000
end
function Data.plus_attack_count_get(A0_4001, A1_4002)
  local L2_4003
  L2_4003 = A0_4001.additive
  L2_4003 = L2_4003.attack_count
  if not L2_4003 then
    L2_4003 = Config
    L2_4003 = L2_4003.ZeroNumber
  end
  return L2_4003
end
function Data.attack_count_get(A0_4004, A1_4005)
  return math.floor(A0_4004.base_attack_count + A0_4004.plus_attack_count)
end
function Data.base_attack_multiple_get(A0_4006, A1_4007)
  local L2_4008
  L2_4008 = A0_4006.values
  L2_4008 = L2_4008.attack_multiple
  if not L2_4008 then
    L2_4008 = Config
    L2_4008 = L2_4008.ZeroNumber
  end
  return L2_4008
end
function Data.plus_attack_multiple_get(A0_4009, A1_4010)
  local L2_4011
  L2_4011 = A0_4009.additive
  L2_4011 = L2_4011.attack_multiple
  if not L2_4011 then
    L2_4011 = Config
    L2_4011 = L2_4011.ZeroNumber
  end
  return L2_4011
end
function Data.attack_multiple_get(A0_4012, A1_4013)
  return A0_4012.base_attack_multiple + A0_4012.plus_attack_multiple
end
function Data.base_precision_get(A0_4014, A1_4015)
  local L2_4016
  L2_4016 = A0_4014.values
  L2_4016 = L2_4016.precision
  if not L2_4016 then
    L2_4016 = Config
    L2_4016 = L2_4016.ZeroNumber
  end
  return L2_4016
end
function Data.plus_precision_get(A0_4017, A1_4018)
  local L2_4019
  L2_4019 = A0_4017.additive
  L2_4019 = L2_4019.precision
  if not L2_4019 then
    L2_4019 = Config
    L2_4019 = L2_4019.ZeroNumber
  end
  return L2_4019
end
function Data.precision_get(A0_4020, A1_4021)
  return math.min(A0_4020.base_precision + A0_4020.plus_precision, Config.NinetyNine)
end
function Data.main_attr_get(A0_4022, A1_4023)
  return A0_4022.values.main_attr
end
function Data.base_attack_get(A0_4024, A1_4025)
  local L2_4026
  L2_4026 = A0_4024.values
  L2_4026 = L2_4026.attack
  if not L2_4026 then
    L2_4026 = Config
    L2_4026 = L2_4026.ZeroNumber
  end
  return L2_4026
end
function Data.plus_attack_get(A0_4027, A1_4028)
  local L2_4029
  L2_4029 = A0_4027.additive
  L2_4029 = L2_4029.attack
  if not L2_4029 then
    L2_4029 = Config
    L2_4029 = L2_4029.ZeroNumber
  end
  return L2_4029
end
function Data.attack_get(A0_4030, A1_4031)
  local L2_4032, L3_4033, L4_4034, L5_4035
  L2_4032 = A0_4030.main_attr
  L3_4033 = Config
  L3_4033 = L3_4033.ZeroNumber
  L4_4034 = Config
  L4_4034 = L4_4034.OneNumber
  if L2_4032 == L4_4034 then
    L3_4033 = A0_4030.str
  else
    L4_4034 = Config
    L4_4034 = L4_4034.TwoNumber
    if L2_4032 == L4_4034 then
      L3_4033 = A0_4030.dex
    else
      L4_4034 = Config
      L4_4034 = L4_4034.ThreeNumber
      if L2_4032 == L4_4034 then
        L3_4033 = A0_4030.int
      else
        L4_4034 = Config
        L4_4034 = L4_4034.FourNumber
        if L2_4032 == L4_4034 then
          L3_4033 = A0_4030.luck
        else
          L4_4034 = A0_4030.values
          L4_4034 = L4_4034.attack
          if not L4_4034 then
            L4_4034 = Config
            L4_4034 = L4_4034.ZeroNumber
          end
          return L4_4034
        end
      end
    end
  end
  L4_4034 = Config
  L4_4034 = L4_4034.OneNumber
  if L3_4033 < L4_4034 then
    L4_4034 = Config
    L4_4034 = L4_4034.OneNumber
    L3_4033 = L4_4034 or L3_4033
  end
  L4_4034 = A0_4030.plus_attack
  L5_4035 = Config
  L5_4035 = L5_4035.ZeroNumber
  if L4_4034 == L5_4035 then
    L5_4035 = Config
    L5_4035 = L5_4035.TenNumber
  else
    L5_4035 = L5_4035 or L4_4034
  end
  L5_4035 = L5_4035 * math.max(A0_4030.precision / Config.HundredPercent, Config.PointZeroOne)
  L5_4035 = L5_4035 / Config.SevenNumber
  return math.max(math.floor(L3_4033 * Config.AttackRate * L5_4035), Config.OneNumber)
end
function Data.min_attack_get(A0_4036, A1_4037)
  return math.floor(A0_4036.attack * math.max(A0_4036.precision / Config.HundredPercent, Config.PointZeroOne)) ~= Config.ZeroNumber and math.floor(A0_4036.attack * math.max(A0_4036.precision / Config.HundredPercent, Config.PointZeroOne)) or Config.OneNumber
end
function Data.base_pdd_get(A0_4038, A1_4039)
  local L2_4040
  L2_4040 = A0_4038.values
  L2_4040 = L2_4040.pdd
  if not L2_4040 then
    L2_4040 = Config
    L2_4040 = L2_4040.ZeroNumber
  end
  return L2_4040
end
function Data.plus_pdd_get(A0_4041, A1_4042)
  local L2_4043
  L2_4043 = A0_4041.additive
  L2_4043 = L2_4043.pdd
  if not L2_4043 then
    L2_4043 = Config
    L2_4043 = L2_4043.ZeroNumber
  end
  return L2_4043
end
function Data.pdd_get(A0_4044, A1_4045)
  local L2_4046
  L2_4046 = A0_4044.base_pdd
  L2_4046 = L2_4046 + A0_4044.plus_pdd
  L2_4046 = L2_4046 + A0_4044.dex / Config.FiveNumber
  return math.floor(L2_4046 + L2_4046 * (A0_4044.pddp / Config.HundredPercent))
end
function Data.base_pddp_get(A0_4047, A1_4048)
  local L2_4049
  L2_4049 = A0_4047.values
  L2_4049 = L2_4049.pddp
  if not L2_4049 then
    L2_4049 = Config
    L2_4049 = L2_4049.ZeroNumber
  end
  return L2_4049
end
function Data.plus_pddp_get(A0_4050, A1_4051)
  local L2_4052
  L2_4052 = A0_4050.additive
  L2_4052 = L2_4052.pddp
  if not L2_4052 then
    L2_4052 = Config
    L2_4052 = L2_4052.ZeroNumber
  end
  return L2_4052
end
function Data.pddp_get(A0_4053, A1_4054)
  return math.floor(A0_4053.base_pddp + A0_4053.plus_pddp)
end
function Data.base_pdb_get(A0_4055, A1_4056)
  local L2_4057
  L2_4057 = A0_4055.values
  L2_4057 = L2_4057.pdb
  if not L2_4057 then
    L2_4057 = Config
    L2_4057 = L2_4057.ZeroNumber
  end
  return L2_4057
end
function Data.plus_pdb_get(A0_4058, A1_4059)
  local L2_4060
  L2_4060 = A0_4058.additive
  L2_4060 = L2_4060.pdb
  if not L2_4060 then
    L2_4060 = Config
    L2_4060 = L2_4060.ZeroNumber
  end
  return L2_4060
end
function Data.pdb_get(A0_4061, A1_4062)
  return math.floor(A0_4061.base_pdb + A0_4061.plus_pdb)
end
function Data.base_spdb_get(A0_4063, A1_4064)
  local L2_4065
  L2_4065 = A0_4063.values
  L2_4065 = L2_4065.spdb
  if not L2_4065 then
    L2_4065 = Config
    L2_4065 = L2_4065.ZeroNumber
  end
  return L2_4065
end
function Data.plus_spdb_get(A0_4066, A1_4067)
  local L2_4068
  L2_4068 = A0_4066.additive
  L2_4068 = L2_4068.spdb
  if not L2_4068 then
    L2_4068 = Config
    L2_4068 = L2_4068.ZeroNumber
  end
  return L2_4068
end
function Data.spdb_get(A0_4069, A1_4070)
  return math.floor(A0_4069.base_spdb + A0_4069.plus_spdb)
end
function Data.base_mdd_get(A0_4071, A1_4072)
  local L2_4073
  L2_4073 = A0_4071.values
  L2_4073 = L2_4073.mdd
  if not L2_4073 then
    L2_4073 = Config
    L2_4073 = L2_4073.ZeroNumber
  end
  return L2_4073
end
function Data.plus_mdd_get(A0_4074, A1_4075)
  local L2_4076
  L2_4076 = A0_4074.additive
  L2_4076 = L2_4076.mdd
  if not L2_4076 then
    L2_4076 = Config
    L2_4076 = L2_4076.ZeroNumber
  end
  return L2_4076
end
function Data.mdd_get(A0_4077, A1_4078)
  local L2_4079
  L2_4079 = A0_4077.base_mdd
  L2_4079 = L2_4079 + A0_4077.plus_mdd
  L2_4079 = L2_4079 + A0_4077.int / Config.FiveNumber
  return math.floor(L2_4079 + L2_4079 * (A0_4077.mddp / Config.HundredPercent))
end
function Data.base_mddp_get(A0_4080, A1_4081)
  local L2_4082
  L2_4082 = A0_4080.values
  L2_4082 = L2_4082.mddp
  if not L2_4082 then
    L2_4082 = Config
    L2_4082 = L2_4082.ZeroNumber
  end
  return L2_4082
end
function Data.plus_mddp_get(A0_4083, A1_4084)
  local L2_4085
  L2_4085 = A0_4083.additive
  L2_4085 = L2_4085.mddp
  if not L2_4085 then
    L2_4085 = Config
    L2_4085 = L2_4085.ZeroNumber
  end
  return L2_4085
end
function Data.mddp_get(A0_4086, A1_4087)
  return math.floor(A0_4086.base_mddp + A0_4086.plus_mddp)
end
function Data.base_mdb_get(A0_4088, A1_4089)
  local L2_4090
  L2_4090 = A0_4088.values
  L2_4090 = L2_4090.mdb
  if not L2_4090 then
    L2_4090 = Config
    L2_4090 = L2_4090.ZeroNumber
  end
  return L2_4090
end
function Data.plus_mdb_get(A0_4091, A1_4092)
  local L2_4093
  L2_4093 = A0_4091.additive
  L2_4093 = L2_4093.mdb
  if not L2_4093 then
    L2_4093 = Config
    L2_4093 = L2_4093.ZeroNumber
  end
  return L2_4093
end
function Data.mdb_get(A0_4094, A1_4095)
  return math.floor(A0_4094.base_mdb + A0_4094.plus_mdb)
end
function Data.base_smdb_get(A0_4096, A1_4097)
  local L2_4098
  L2_4098 = A0_4096.values
  L2_4098 = L2_4098.smdb
  if not L2_4098 then
    L2_4098 = Config
    L2_4098 = L2_4098.ZeroNumber
  end
  return L2_4098
end
function Data.plus_smdb_get(A0_4099, A1_4100)
  local L2_4101
  L2_4101 = A0_4099.additive
  L2_4101 = L2_4101.smdb
  if not L2_4101 then
    L2_4101 = Config
    L2_4101 = L2_4101.ZeroNumber
  end
  return L2_4101
end
function Data.smdb_get(A0_4102, A1_4103)
  return math.floor(A0_4102.base_smdb + A0_4102.plus_smdb)
end
function Data.base_hit_get(A0_4104, A1_4105)
  local L2_4106
  L2_4106 = A0_4104.values
  L2_4106 = L2_4106.hit
  if not L2_4106 then
    L2_4106 = Config
    L2_4106 = L2_4106.ZeroNumber
  end
  return L2_4106
end
function Data.plus_hit_get(A0_4107, A1_4108)
  local L2_4109
  L2_4109 = A0_4107.additive
  L2_4109 = L2_4109.hit
  if not L2_4109 then
    L2_4109 = Config
    L2_4109 = L2_4109.ZeroNumber
  end
  return L2_4109
end
function Data.hit_get(A0_4110, A1_4111)
  return A0_4110.base_hit + A0_4110.plus_hit
end
function Data.base_dodge_get(A0_4112, A1_4113)
  local L2_4114
  L2_4114 = A0_4112.values
  L2_4114 = L2_4114.dodge
  if not L2_4114 then
    L2_4114 = Config
    L2_4114 = L2_4114.ZeroNumber
  end
  return L2_4114
end
function Data.plus_dodge_get(A0_4115, A1_4116)
  local L2_4117
  L2_4117 = A0_4115.additive
  L2_4117 = L2_4117.dodge
  if not L2_4117 then
    L2_4117 = Config
    L2_4117 = L2_4117.ZeroNumber
  end
  return L2_4117
end
function Data.dodge_get(A0_4118, A1_4119)
  return A0_4118.base_dodge + A0_4118.plus_dodge
end
function Data.base_critical_get(A0_4120, A1_4121)
  local L2_4122
  L2_4122 = A0_4120.values
  L2_4122 = L2_4122.critical
  if not L2_4122 then
    L2_4122 = Config
    L2_4122 = L2_4122.ZeroNumber
  end
  return L2_4122
end
function Data.plus_critical_get(A0_4123, A1_4124)
  local L2_4125
  L2_4125 = A0_4123.additive
  L2_4125 = L2_4125.critical
  if not L2_4125 then
    L2_4125 = Config
    L2_4125 = L2_4125.ZeroNumber
  end
  return L2_4125
end
function Data.critical_get(A0_4126, A1_4127)
  local L2_4128, L3_4129, L4_4130
  L2_4128 = A0_4126.base_critical
  L3_4129 = A0_4126.plus_critical
  L2_4128 = L2_4128 + L3_4129
  L3_4129 = A0_4126.luck
  L4_4130 = Config
  L4_4130 = L4_4130.Thirty
  L3_4129 = L3_4129 / L4_4130
  L2_4128 = L2_4128 + L3_4129
  return L2_4128
end
function Data.base_multiple_get(A0_4131, A1_4132)
  local L2_4133
  L2_4133 = A0_4131.values
  L2_4133 = L2_4133.multiple
  if not L2_4133 then
    L2_4133 = Config
    L2_4133 = L2_4133.ZeroNumber
  end
  return L2_4133
end
function Data.plus_multiple_get(A0_4134, A1_4135)
  local L2_4136
  L2_4136 = A0_4134.additive
  L2_4136 = L2_4136.multiple
  if not L2_4136 then
    L2_4136 = Config
    L2_4136 = L2_4136.ZeroNumber
  end
  return L2_4136
end
function Data.multiple_get(A0_4137, A1_4138)
  return A0_4137.base_multiple + A0_4137.plus_multiple
end
function Data.attack_intervel_get(A0_4139, A1_4140)
  local L2_4141, L3_4142, L4_4143, L5_4144, L6_4145
  L2_4141 = A0_4139.ias
  L3_4142 = Config
  L3_4142 = L3_4142.HundredPercent
  L2_4141 = L2_4141 + L3_4142
  L3_4142 = A0_4139.bat
  L4_4143 = A0_4139.dex
  L4_4143 = L4_4143 + L2_4141
  L5_4144 = Config
  L5_4144 = L5_4144.DexAttackSpeed
  L6_4145 = Config
  L6_4145 = L6_4145.HundredPercent
  L5_4144 = L5_4144 / L6_4145
  L4_4143 = L4_4143 * L5_4144
  L5_4144 = Config
  L5_4144 = L5_4144.OneNumber
  L6_4145 = Config
  L6_4145 = L6_4145.OneNumber
  L6_4145 = L6_4145 + L4_4143
  L6_4145 = L6_4145 / L3_4142
  L5_4144 = L5_4144 / L6_4145
  return L5_4144
end
function Data.base_bat_get(A0_4146, A1_4147)
  local L2_4148
  L2_4148 = A0_4146.values
  L2_4148 = L2_4148.bat
  if not L2_4148 then
    L2_4148 = Config
    L2_4148 = L2_4148.ZeroNumber
  end
  return L2_4148
end
function Data.plus_bat_get(A0_4149, A1_4150)
  local L2_4151
  L2_4151 = A0_4149.additive
  L2_4151 = L2_4151.bat
  if not L2_4151 then
    L2_4151 = Config
    L2_4151 = L2_4151.ZeroNumber
  end
  return L2_4151
end
function Data.bat_get(A0_4152, A1_4153)
  return A0_4152.base_bat + A0_4152.plus_bat
end
function Data.base_ias_get(A0_4154, A1_4155)
  local L2_4156
  L2_4156 = A0_4154.values
  L2_4156 = L2_4156.ias
  if not L2_4156 then
    L2_4156 = Config
    L2_4156 = L2_4156.ZeroNumber
  end
  return L2_4156
end
function Data.plus_ias_get(A0_4157, A1_4158)
  local L2_4159
  L2_4159 = A0_4157.additive
  L2_4159 = L2_4159.ias
  if not L2_4159 then
    L2_4159 = Config
    L2_4159 = L2_4159.ZeroNumber
  end
  return L2_4159
end
function Data.ias_get(A0_4160, A1_4161)
  return A0_4160.base_ias + A0_4160.plus_ias
end
function Data.hp_get(A0_4162, A1_4163)
  return math.floor(A0_4162.values.hp or Config.ZeroNumber)
end
function Data.inc_hp_set(A0_4164, A1_4165, A2_4166)
  local L3_4167, L5_4168, L6_4169
  if not A2_4166 then
    return
  end
  L3_4167 = A0_4164.values
  L3_4167 = L3_4167.hp
  if not L3_4167 then
    L3_4167 = Config
    L3_4167 = L3_4167.ZeroNumber
  end
  L5_4168 = L3_4167
  L6_4169 = A0_4164.max_hp
  L3_4167 = L3_4167 + A2_4166
  if L6_4169 < L3_4167 then
    L3_4167 = L6_4169 or L3_4167
  end
  if L3_4167 < Config.ZeroNumber then
    L3_4167 = Config.ZeroNumber or L3_4167
  end
  A0_4164.hp = L3_4167
  if L5_4168 == L3_4167 then
    return
  end
  A0_4164.fire = "hp"
  A0_4164.fire = "modify"
end
function Data.plus_max_hp_get(A0_4170, A1_4171)
  local L2_4172, L3_4173
  L2_4172 = A0_4170.additive
  L2_4172 = L2_4172.max_hp
  L3_4173 = A0_4170.additive
  L3_4173 = L3_4173.hp
  L2_4172 = L2_4172 + L3_4173
  return L2_4172
end
function Data.max_hp_get(A0_4174, A1_4175)
  local L2_4176, L3_4177
  L2_4176 = A0_4174.values
  L2_4176 = L2_4176.max_hp
  if not L2_4176 then
    L2_4176 = Config
    L2_4176 = L2_4176.ZeroNumber
  end
  L3_4177 = Config
  L3_4177 = L3_4177.StrForHP
  L3_4177 = L3_4177 * A0_4174.str
  L2_4176 = L2_4176 + L3_4177
  L3_4177 = A0_4174.plus_max_hp
  L2_4176 = L2_4176 + L3_4177
  return L2_4176
end
function Data.mp_get(A0_4178, A1_4179)
  return math.floor(A0_4178.values.mp or Config.ZeroNumber)
end
function Data.inc_mp_set(A0_4180, A1_4181, A2_4182)
  local L3_4183, L5_4184, L6_4185
  if not A2_4182 then
    return
  end
  L3_4183 = A0_4180.values
  L3_4183 = L3_4183.mp
  if not L3_4183 then
    L3_4183 = Config
    L3_4183 = L3_4183.ZeroNumber
  end
  L5_4184 = L3_4183
  L6_4185 = A0_4180.max_mp
  L3_4183 = L3_4183 + A2_4182
  if L6_4185 < L3_4183 then
    L3_4183 = L6_4185 or L3_4183
  end
  if L3_4183 < Config.ZeroNumber then
    L3_4183 = Config.ZeroNumber or L3_4183
  end
  A0_4180.mp = L3_4183
  if L5_4184 == L3_4183 then
    return
  end
  A0_4180.fire = "modify"
end
function Data.plus_max_mp_get(A0_4186, A1_4187)
  local L2_4188, L3_4189
  L2_4188 = A0_4186.additive
  L2_4188 = L2_4188.max_mp
  L3_4189 = A0_4186.additive
  L3_4189 = L3_4189.mp
  L2_4188 = L2_4188 + L3_4189
  return L2_4188
end
function Data.max_mp_get(A0_4190, A1_4191)
  local L2_4192, L3_4193
  L2_4192 = A0_4190.values
  L2_4192 = L2_4192.max_mp
  if not L2_4192 then
    L2_4192 = Config
    L2_4192 = L2_4192.ZeroNumber
  end
  L3_4193 = Config
  L3_4193 = L3_4193.IntForMP
  L3_4193 = L3_4193 * A0_4190.int
  L2_4192 = L2_4192 + L3_4193
  L3_4193 = A0_4190.plus_max_mp
  L2_4192 = L2_4192 + L3_4193
  return L2_4192
end
function Data.inc_exp_set(A0_4194, A1_4195, A2_4196)
  local L3_4197, L4_4198, L5_4199, L6_4200
  if A2_4196 then
    L3_4197 = Config
    L3_4197 = L3_4197.ZeroNumber
  elseif A2_4196 == L3_4197 then
    return
  end
  L3_4197 = A0_4194.level
  L4_4198 = Config
  L4_4198 = L4_4198.MaxLevel
  if L3_4197 >= L4_4198 then
    return
  end
  L3_4197 = A0_4194.values
  L3_4197 = L3_4197.exp
  if not L3_4197 then
    L3_4197 = Config
    L3_4197 = L3_4197.ZeroNumber
  end
  L3_4197 = L3_4197 + A2_4196
  L4_4198 = A0_4194.level
  L4_4198 = L0_3927[L4_4198]
  if L3_4197 >= L4_4198 then
    L3_4197 = L3_4197 - L4_4198
    L5_4199 = A0_4194.level
    L6_4200 = Config
    L6_4200 = L6_4200.OneNumber
    L5_4199 = L5_4199 + L6_4200
    A0_4194.level = L5_4199
    A0_4194.fire = "level"
    L5_4199 = A0_4194.level
    L4_4198 = L0_3927[L5_4199]
    if not (L3_4197 < L4_4198) or not L3_4197 then
      L5_4199 = Config
      L5_4199 = L5_4199.OneNumber
      L3_4197 = L4_4198 - L5_4199
    end
  end
  L5_4199 = Config
  L5_4199 = L5_4199.ZeroNumber
  L5_4199 = L3_4197 > L5_4199 and L3_4197 or L5_4199.ZeroNumber
  A0_4194.exp = L5_4199
  A0_4194.fire = "modify"
end
function Data.bullet_get(A0_4201)
  for _FORV_4_, _FORV_5_ in pairs(A0_4201.attach_property) do
    if _FORV_4_.bullet then
      return _FORV_4_.bullet
    end
  end
end
function Data.distance_get(A0_4202)
  return A0_4202.additive.distance
end
function Data.attach_set(A0_4203, A1_4204, A2_4205)
  local L3_4206
  if not A2_4205 then
    return
  end
  L3_4206 = A0_4203.attach_property
  L3_4206[A2_4205] = true
  L3_4206 = A0_4203.additive
  for _FORV_7_, _FORV_8_ in pairs(effective_attribute) do
    if A2_4205[_FORV_7_] then
      L3_4206[_FORV_7_] = L3_4206[_FORV_7_] + A2_4205[_FORV_7_]
    end
  end
  rawset(A0_4203, "speed", Data.speed_get(A0_4203))
  A0_4203.fire = "modify"
  A0_4203.fire = "attrite"
end
function Data.unattach_set(A0_4207, A1_4208, A2_4209)
  local L3_4210, L4_4211
  if not A2_4209 then
    return
  end
  L3_4210 = A0_4207.attach_property
  L4_4211 = L3_4210[A2_4209]
  if not L4_4211 then
    return
  end
  L4_4211 = A0_4207.additive
  L3_4210[A2_4209] = nil
  for _FORV_8_, _FORV_9_ in pairs(effective_attribute) do
    if A2_4209[_FORV_8_] then
      L4_4211[_FORV_8_] = L4_4211[_FORV_8_] - A2_4209[_FORV_8_]
    end
  end
  rawset(A0_4207, "speed", Data.speed_get(A0_4207))
  A0_4207.fire = "modify"
  A0_4207.fire = "attrite"
end
function Data.refresh_set(A0_4212, A1_4213, A2_4214)
  local L3_4215
  L3_4215 = A0_4212.additive
  for _FORV_7_, _FORV_8_ in pairs(effective_attribute) do
    L3_4215[_FORV_7_] = Config.ZeroNumber
  end
  for _FORV_7_, _FORV_8_ in pairs(A0_4212.attach_property) do
    for _FORV_12_, _FORV_13_ in pairs(effective_attribute) do
      if _FORV_7_[_FORV_12_] then
        L3_4215[_FORV_12_] = L3_4215[_FORV_12_] + _FORV_7_[_FORV_12_]
      end
    end
  end
  A0_4212.fire = "modify"
  A0_4212.fire = "attrite"
end
function Data.additive_get(A0_4216, A1_4217)
  return rawget(A0_4216, "additive")
end
function Data.additive_set(A0_4218, A1_4219, A2_4220)
  for _FORV_6_, _FORV_7_ in pairs(effective_attribute) do
    A2_4220[_FORV_6_] = Config.ZeroNumber
  end
  rawset(A0_4218, "additive", A2_4220)
end
function Data.attach_property_get(A0_4221, A1_4222)
  return rawget(A0_4221, "attach_property")
end
function Data.attach_property_set(A0_4223, A1_4224, A2_4225)
  rawset(A0_4223, "attach_property", A2_4225)
end
function Data.on_set(A0_4226, A1_4227, ...)
  local L4_4229
  L3_4228 = EventSet
  L3_4228 = L3_4228.On
  L4_4229 = A0_4226
  L3_4228(L4_4229, ...)
end
function Data.off_set(A0_4230, A1_4231, ...)
  local L4_4233
  L3_4232 = EventSet
  L3_4232 = L3_4232.Off
  L4_4233 = A0_4230
  L3_4232(L4_4233, ...)
end
function Data.fire_set(A0_4234, A1_4235, ...)
  local L4_4237
  L3_4236 = EventSet
  L3_4236 = L3_4236.Fire
  L4_4237 = A0_4234
  L3_4236(L4_4237, ...)
end
function Data.tEventListener_get(A0_4238)
  return rawget(A0_4238, "tEventListener")
end
function Data.tEventListener_set(A0_4239, A1_4240, A2_4241)
  return rawset(A0_4239, "tEventListener", A2_4241)
end
function Data.MemberGet(A0_4242, A1_4243)
  local L2_4244, L3_4245
  if not A0_4242 then
    return
  end
  L2_4244 = rawget
  L3_4245 = A0_4242
  L2_4244 = L2_4244(L3_4245, A1_4243)
  if L2_4244 then
    return L2_4244
  end
  L3_4245 = rawget
  L3_4245 = L3_4245(A0_4242, "__parent")
  if not L3_4245 then
    return
  end
  return Data.MemberGet(L3_4245, A1_4243)
end
function Data.MemberIndex(A0_4246, A1_4247)
  local L2_4248, L3_4249, L4_4250
  L2_4248 = string
  L2_4248 = L2_4248.format
  L3_4249 = "%s_get"
  L4_4250 = A1_4247
  L2_4248 = L2_4248(L3_4249, L4_4250)
  L3_4249 = getmetatable
  L4_4250 = A0_4246
  L3_4249 = L3_4249(L4_4250)
  L4_4250 = Data
  L4_4250 = L4_4250.MemberGet
  L4_4250 = L4_4250(L3_4249, L2_4248)
  if L4_4250 then
    return L4_4250(A0_4246, A1_4247)
  end
  if not rawget(A0_4246, "values") then
    return
  end
  return rawget(A0_4246, "values")[A1_4247] or Config.ZeroNumber
end
function Data.MemberNewIndex(A0_4251, A1_4252, A2_4253)
  local L3_4254, L4_4255, L5_4256
  L3_4254 = string
  L3_4254 = L3_4254.format
  L4_4255 = "%s_set"
  L5_4256 = A1_4252
  L3_4254 = L3_4254(L4_4255, L5_4256)
  L4_4255 = getmetatable
  L5_4256 = A0_4251
  L4_4255 = L4_4255(L5_4256)
  L5_4256 = Data
  L5_4256 = L5_4256.MemberGet
  L5_4256 = L5_4256(L4_4255, L3_4254)
  if not L5_4256 then
    if not rawget(A0_4251, "values") then
      return
    end
    rawget(A0_4251, "values")[A1_4252] = A2_4253
    if A1_4252 ~= "speed" then
      return
    end
    rawset(A0_4251, "speed", Data.speed_get(A0_4251))
    return
  end
  if type(A2_4253) ~= "table" then
    L5_4256(A0_4251, A1_4252, A2_4253)
    return
  end
  if not rawget(A2_4253, 1) then
    L5_4256(A0_4251, A1_4252, A2_4253)
    return
  end
  L5_4256(A0_4251, A1_4252, table.unpack(A2_4253))
end
