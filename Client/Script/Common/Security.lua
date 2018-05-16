if Platform ~= Platform_Android and Platform ~= Platform_IOS then
  return
end
if AppName() ~= Config.AppName then
  Director:End()
end
if AppPackageName() ~= Config.PackageName then
  Director:End()
end
if Platform ~= Platform_Android then
  return
end
if AppSignature() ~= Config.Signature then
  Director:End()
end
return
