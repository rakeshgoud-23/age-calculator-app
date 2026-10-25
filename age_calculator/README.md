# Age Calculator (Flutter)

This ZIP includes all handwritten Flutter source files, a widget test, and a one-click Windows build script.

**Important:** The generated Android Gradle project is NOT bundled because the Flutter SDK is not available in the creation environment. Flutter creates those version-compatible files when you run the included setup script. This ZIP does not contain a prebuilt APK.

## Windows (VS Code / Android Studio)
1. Install Flutter SDK and Android SDK, and check `flutter doctor`.
2. Extract this ZIP.
3. Double-click `setup_and_build.bat` (or open the folder in VS Code and run the commands below).
4. Find your APK at `build/app/outputs/flutter-apk/app-release.apk`.

## Terminal commands
```sh
flutter create --project-name age_calculator --platforms android .
flutter pub get
flutter build apk --release
```

The app works offline and does not require third-party packages.
