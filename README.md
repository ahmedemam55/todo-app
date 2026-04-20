# ✅ To Do List App

A professional Flutter task management application with Firebase integration, real-time updates, local notifications, and full Dark/Light theme support with Arabic/English localization.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 📋 **Task Management** | Add, complete, and delete tasks with swipe gestures |
| 📅 **Date & Time Picker** | Schedule tasks with specific date and time |
| 🔔 **Local Notifications** | Get notified when a task is due |
| 🔥 **Firebase Firestore** | Real-time data sync across sessions |
| 🌙 **Dark / Light Theme** | Switch between themes seamlessly |
| 🌍 **Arabic / English** | Full localization support with RTL |
| 📊 **Date Timeline** | Browse tasks by date using an interactive timeline |
| ✅ **Task Status** | Mark tasks as done with visual feedback |

---

## 📸 Screenshots
Below are the app's screenshots that highlight its functionality:

| Screen 1 | Screen 2 | Screen 3 | Screen 4 | Screen 5 | Screen 6 |
| :---: | :---: | :---: | :---: | :---: | :---: |
|<img width="200" src="https://github.com/user-attachments/assets/a2e93091-180e-4d69-9e22-bb77f695b280"/>|<img width="200" src="https://github.com/user-attachments/assets/e10b47af-f1dc-4134-acd0-40caa3631396"/>|<img width="200" src="https://github.com/user-attachments/assets/1861e3ef-3499-4865-a155-5a01fee149a3"/>|<img width="200" src="https://github.com/user-attachments/assets/0d525120-142b-40e4-811a-19b3a1c0852e"/>|<img width="200" src="https://github.com/user-attachments/assets/8398434f-8832-4061-bb2a-ddeda74788b9"/>|<img width="200" src="https://github.com/user-attachments/assets/f2e197f6-1dbb-4585-b900-d053bdf49736"/>|

| Screen 7 | Screen 8 | Screen 9 | Screen 10 | Screen 11 | Screen 12 |
| :---: | :---: | :---: | :---: | :---: | :---: |
|<img width="200" src="https://github.com/user-attachments/assets/5dfd886d-927e-4685-b393-e95fc6c350b1"/>|<img width="200" src="https://github.com/user-attachments/assets/f2a32e33-4503-4adf-9ce4-6c4a271d9ac4"/>|<img width="200" src="https://github.com/user-attachments/assets/bf22cf00-27ea-4ce5-bdb9-05048aadf49b"/>|<img width="200" src="https://github.com/user-attachments/assets/e66f0516-bc5e-4853-bafd-b9b91ef8212f"/>|<img width="200" src="https://github.com/user-attachments/assets/8c3594c8-2b65-4818-bbed-e9d221661b35"/>|<img width="200" src="https://github.com/user-attachments/assets/8522701d-750d-4c54-b1e0-fdd6e75d502d"/>|

---

## 🛠️ Tech Stack

### State Management
- **Provider** — manages theme and language across the app

### Backend
- **Firebase Firestore** — real-time NoSQL database for storing tasks

### Navigation
- **Named Routes** with a centralized `RouteGenerator`

### Localization
- **Flutter Localization (ARB files)** — Arabic and English support

### UI Packages
| Package | Usage |
|---------|-------|
| `easy_date_timeline` | Interactive horizontal date picker |
| `flutter_slidable` | Swipe to delete task |
| `animated_custom_dropdown` | Language and theme selector |
| `flutter_easyloading` | Loading indicator |
| `bot_toast` | Custom toast notifications |
| `lottie` | Animated success/error icons |

### Notifications
- **flutter_local_notifications** — scheduled task reminders
- **timezone** — accurate time zone handling

---

## 🎨 Theme

| | Light | Dark |
|-|-------|------|
| Primary Color | `#5D9CEC` (Blue) | `#5D9CEC` (Blue) |
| Background | `#DFECDB` | `#060E1E` |
| Card Color | `#FFFFFF` | `#141922` |
| Font | Poppins | Poppins |

---

## 📁 Project Structure

```
lib/
├── main.dart
├── firebase_options.dart
├── core/
│   ├── app_theme/
│   │   └── application_theme_manager.dart   # Light & Dark themes
│   ├── firebase_utils/
│   │   └── firebase_utils.dart              # Firestore CRUD operations
│   ├── routes/
│   │   ├── page_route_names.dart            # Route constants
│   │   └── route_generator.dart             # Route handler
│   ├── services/
│   │   ├── notification_service.dart        # Local notifications
│   │   ├── snack_bar_services.dart          # Custom toast messages
│   │   └── loading_services.dart            # EasyLoading config
│   ├── settings_provider/
│   │   └── setting_provider.dart            # Language & theme provider
│   └── utils.dart                           # Helper functions
├── features/
│   ├── splash/
│   │   └── splash_view.dart                 # Splash screen
│   ├── layout_view.dart                     # Bottom Navigation Shell
│   ├── tasks/
│   │   ├── tasks_view.dart                  # Tasks list with date timeline
│   │   └── widgets/
│   │       ├── task_item_widget.dart         # Task card with slidable
│   │       └── add_task_bottom_sheet.dart   # Add task form
│   └── settings/
│       └── settings_view.dart               # Language & theme settings
├── model/
│   └── task_model.dart                      # Task data model
└── l10n/
    ├── app_en.arb                           # English strings
    ├── app_ar.arb                           # Arabic strings
    ├── app_localizations.dart               # Generated localizations
    ├── app_localizations_en.dart
    └── app_localizations_ar.dart
```

---

## 🔥 Firebase

The app uses **Cloud Firestore** with the following structure:

```
tasksCollection/
└── {taskId}/
    ├── id: String
    ├── title: String
    ├── detail: String
    ├── selectedDate: int (millisecondsSinceEpoch)
    └── isDone: bool
```

---

## 🔔 Notifications

Tasks with a future date/time automatically schedule a local notification. The notification fires at the exact time the task is due.

---

## 🚀 Getting Started

```bash
# Install dependencies
flutter pub get

# Generate localization files
flutter gen-l10n

# Run the app
flutter run

# Build APK
flutter build apk --release
```

---

## 📋 Requirements

- Flutter SDK >= 3.0.0
- Dart >= 3.0.0
- Android minSdk = 21
- Internet permission in `AndroidManifest.xml`

---

## 👨‍💻 Developer

**Ahmed Emam**
[GitHub](https://github.com/ahmedemam55)
