#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
flutter create --project-name age_calculator --platforms android .
flutter pub get
flutter build apk --release
echo 'APK: build/app/outputs/flutter-apk/app-release.apk'
