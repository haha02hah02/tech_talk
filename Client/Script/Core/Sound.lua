Class.Sound.CSimpleAudioEngine({})
function Sound.Constructor(A0_2507)
  A0_2507.this = SimpleAudioEngine
  A0_2507.bBackgroundEnable = true
  A0_2507.bEffectEnable = true
end
function Sound.SetBackgroundEnable(A0_2508, A1_2509)
  if A0_2508.bBackgroundEnable == A1_2509 then
    return
  end
  A0_2508.bBackgroundEnable = A1_2509
  if not A1_2509 then
    A0_2508.this:PlayBackgroundMusic("null")
    A0_2508.this:StopBackgroundMusic()
    return
  end
  A0_2508.this:PlayBackgroundMusic(A0_2508.sSoundPath, A0_2508.bSoundIsLoop)
end
function Sound.SetEffectEnable(A0_2510, A1_2511)
  if A0_2510.bEffectEnable == A1_2511 then
    return
  end
  A0_2510.bEffectEnable = A1_2511
end
function Sound.PlayBackgroundMusic(A0_2512, A1_2513, A2_2514)
  A0_2512.sSoundPath = A1_2513
  A0_2512.bSoundIsLoop = A2_2514
  if not A0_2512.bBackgroundEnable then
    return
  end
  if A0_2512.sSoundPath == A1_2513 and A0_2512.this:IsBackgroundMusicPlaying() then
    return
  end
  A0_2512.this:PlayBackgroundMusic(A1_2513, A2_2514)
end
function Sound.PlayEffect(A0_2515, ...)
  local L2_2517, L3_2518
  L1_2516 = A0_2515.bEffectEnable
  if not L1_2516 then
    return
  end
  L1_2516 = A0_2515.this
  L2_2517 = L1_2516
  L1_2516 = L1_2516.PlayEffect
  L3_2518 = ...
  L1_2516(L2_2517, L3_2518)
end
Global.ActionME = nil
Global.ActionBGM = nil
Global.Sound = Sound()
Class.ActionME.ActionInstant({})
function ActionME.Constructor(A0_2519, A1_2520, A2_2521)
  A0_2519.sName = A1_2520
  A0_2519.bLoop = A2_2521
  A0_2519.this = ActionInstant(Functor(A0_2519, A0_2519.Play))
end
function ActionME.Play(A0_2522)
  Sound:PlayEffect(A0_2522.sName, A0_2522.bLoop)
end
Class.ActionBGM.ActionInstant({})
function ActionBGM.Constructor(A0_2523, A1_2524, A2_2525)
  A0_2523.sName = A1_2524
  A0_2523.bLoop = A2_2525
  A0_2523.this = ActionInstant(Functor(A0_2523, A0_2523.Play))
end
function ActionBGM.PlayBackgroundMusic(A0_2526)
  Sound:PlayBackgroundMusic(A0_2526.sName, A0_2526.bLoop)
end
