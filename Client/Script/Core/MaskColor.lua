Class.MaskColor.Component({})
function MaskColor.Constructor(A0_2383, A1_2384, A2_2385, A3_2386)
  local L4_2387, L5_2388, L6_2389, L7_2390, L8_2391
  L4_2387 = Component
  L4_2387 = L4_2387.Constructor
  L5_2388 = A0_2383
  L4_2387(L5_2388)
  L4_2387 = A1_2384 & 255
  L5_2388 = A1_2384 & 4278190080
  L5_2388 = L5_2388 >> 24
  L6_2389 = A1_2384 & 16711680
  L6_2389 = L6_2389 >> 16
  L7_2390 = A1_2384 & 65280
  L7_2390 = L7_2390 >> 8
  L8_2391 = Color4B
  L8_2391 = L8_2391(L5_2388, L6_2389, L7_2390, L4_2387)
  A2_2385 = A2_2385 or EGLView:DesignResolutionSize().Width
  A3_2386 = A3_2386 or EGLView:DesignResolutionSize().Height
  A0_2383.render = LayerColor(L8_2391, A2_2385, A3_2386)
end
function MaskColor.class_get(A0_2392, A1_2393)
  local L2_2394
  L2_2394 = "MaskColor"
  return L2_2394
end
