# 📱 Benfy Test App - Flutter Project

This is a Flutter application built using Kotlin and the Flutter Gradle plugin. It includes NDK support and is configured for Android development.

---

## 🚀 How to Run the Project

### ✅ Prerequisites

Make sure you have the following installed:

- Flutter 3.32.0
- Dart 3.8.0
- Java 11
- Android Studio with NDK version 27.0.12077973
- A connected emulator or physical Android device

---

### 🔧 Setup Steps

1. **Clone the Repository**

```bash
git clone https://github.com/AGASWIN18/benfy-test
cd benfy-test
```

2. **Install Dependencies**

```bash
flutter pub get
```

3. **Run the App**

```bash
flutter run
```

This will launch the app on your connected device or emulator.

---

## 🛠️ Build APK

### Debug APK

```bash
flutter build apk --debug
```

### Release APK

```bash
flutter build apk --release
```

Output path:  
`build/app/outputs/flutter-apk/app-release.apk`

> ⚠️ Note: Release build currently uses debug signing for demonstration purposes.

---

## ℹ️ Additional Info

- Application ID: `com.test.benfy`
- Compile SDK: Based on `flutter.compileSdkVersion`
- NDK Version: `27.0.12077973`
- JVM Target: Java 11

---

Made for interview demonstration purposes.
