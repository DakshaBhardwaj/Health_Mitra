# Health Mitra

A personalized healthcare application designed and created to make it easier for elderly users to keep track of their health records and manage their medication schedules.

## 🏥 About

Health Mitra is a university project that focuses on providing a user-friendly healthcare management solution, particularly tailored for elderly users. The application includes a comprehensive health record tracking system and an intelligent medication reminder system to help users maintain their health effectively.

## 🚀 Features

- **Health Record Management**: Easy-to-use interface for tracking and managing health records
- **Medication Reminder System**: Intelligent reminder system to ensure timely medication intake
- **Elderly-Friendly Design**: User interface specifically designed for elderly users
- **Cross-Platform Support**: Available on multiple platforms for accessibility
- **Firebase Integration**: Cloud-based data storage and synchronization

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart (45.6%)
- **Native Code**: C++ (27.2%), CMake (21.9%), Swift (2.2%), C (1.6%)
- **Web Support**: HTML (1.4%)
- **Backend**: Firebase
- **Database**: Firebase Firestore

## 📁 Project Structure

```
Health_Mitra/
├── lib/                    # Dart source code
├── android/                # Android platform code
├── ios/                    # iOS platform code
├── linux/                  # Linux platform code
├── macos/                  # macOS platform code
├── web/                    # Web platform code
├── windows/                # Windows platform code
├── test/                   # Test files
├── .vscode/                # VS Code configuration
├── firebase.json           # Firebase configuration
├── pubspec.yaml            # Flutter dependencies
├── pubspec.lock            # Dependency lock file
├── analysis_options.yaml   # Dart analysis configuration
└── README.md               # This file
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Firebase CLI
- Platform-specific development tools:
  - Android Studio (for Android)
  - Xcode (for iOS/macOS)
  - Visual Studio (for Windows)
  - Chrome (for web)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/DakshaBhardwaj/Health_Mitra.git
   cd Health_Mitra
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   ```bash
   # Install Firebase CLI if not already installed
   npm install -g firebase-tools
   
   # Login to Firebase
   firebase login
   
   # Initialize Firebase (if not already done)
   firebase init
   ```

4. **Run the application**
   ```bash
   # For Android
   flutter run -d android
   
   # For iOS
   flutter run -d ios
   
   # For Web
   flutter run -d web
   
   # For Windows
   flutter run -d windows
   
   # For macOS
   flutter run -d macos
   
   # For Linux
   flutter run -d linux
   ```

## 🎯 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🔧 Development

### Running Tests
```bash
flutter test
```

### Building for Production
```bash
# Android APK
flutter build apk

# Android App Bundle
flutter build appbundle

# iOS
flutter build ios

# Web
flutter build web

# Windows
flutter build windows

# macOS
flutter build macos

# Linux
flutter build linux
```

### Firebase Deployment
```bash
# Deploy to Firebase Hosting (for web)
firebase deploy
```

## 📊 Project Statistics

- **Total Languages**: 7
- **Primary Language**: Dart (45.6%)
- **Native Code**: C++ (27.2%)
- **Build System**: CMake (21.9%)
- **Platform Support**: 6 platforms
- **Commits**: 9
- **Watchers**: 1

## 🏗️ Architecture

The application follows a clean architecture pattern with:
- **Presentation Layer**: Flutter UI components
- **Business Logic Layer**: Dart services and providers
- **Data Layer**: Firebase integration for cloud storage
- **Platform Layer**: Native platform-specific implementations

## 🔐 Security Features

- Secure Firebase authentication
- Encrypted data transmission
- Privacy-focused design for health data
- Secure local storage for sensitive information

## 📱 Key Screens

- **Dashboard**: Overview of health status and upcoming reminders
- **Health Records**: Detailed health record management
- **Medication Tracker**: Medication schedule and reminder management
- **Profile**: User profile and settings
- **Notifications**: Medication and health reminders

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 👨‍💻 Author
- GitHub: [@DakshaBhardwaj](https://github.com/DakshaBhardwaj)
- GitHub: [@SaranshGupta](https://github.com/SaranshG2501)

**Note**: This is a Flutter project with Firebase integration. Make sure you have Flutter and Firebase CLI installed and properly configured before running the application.


