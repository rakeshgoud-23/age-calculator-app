@echo off
cd /d "%~dp0"
where flutter >nul 2>&1
if errorlevel 1 (
  echo Flutter not found. Install Flutter and add it to PATH.
  pause
  exit /b 1
)
call flutter create --project-name age_calculator --platforms android .
if errorlevel 1 goto failed
call flutter pub get
if errorlevel 1 goto failed
call flutter build apk --release
if errorlevel 1 goto failed
echo APK: build\app\outputs\flutter-apk\app-release.apk
pause
exit /b 0
:failed
echo Build failed. Check the messages above.
pause
exit /b 1
