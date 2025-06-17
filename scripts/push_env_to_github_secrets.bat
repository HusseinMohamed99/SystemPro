@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

:: إعدادات الريبو
set REPO=HusseinMohamed99/SportyMate

if not exist .env (
  echo ❌ .env file not found
  exit /b 1
)

for /f "usebackq tokens=1,* delims==" %%A in (.env) do (
  set KEY=%%A
  set VALUE=%%B
  if not "!KEY!"=="" (
    if not "!VALUE!"=="" (
      echo 🔐 Uploading secret: !KEY!
      gh secret set !KEY! -b"!VALUE!" -R %REPO%
    )
  )
)

echo ✅ All secrets have been successfully uploaded to GitHub 🔐