# delivery_food

## 1. Tools

- Generating Models, Routers

  ```sh
  # Watch mode
  flutter pub run build_runner watch --delete-conflicting-outputs

  # Build mode
  flutter pub run build_runner build --delete-conflicting-outputs
  ```

- Generating I18n
  ```sh
  flutter pub run i18n_json
  ```

## 2. Build

### Android

- DEV

  ```sh
  # Build apk
  flutter build apk --flavor dev -t lib/main_dev.dart

  # Build appBundle
  flutter build appbundle  --flavor dev -t lib/main_dev.dart
  ```

- PROD

  ```sh
  # apk
  flutter build apk --flavor prod -t lib/main_prod.dart

  # appBundle
  flutter build appbundle --flavor prod -t lib/main_prod.dart
  ```

### Web

- DEV

  ```sh
  # with auto renderer
  flutter build web  --flavor dev -t lib/main_dev.dart

  # with canvaskit renderer
  flutter build web --web-renderer canvaskit  --flavor dev -t lib/main_dev.dart

  # with html renderer
  flutter build web --web-renderer html  --flavor dev -t lib/main_dev.dart
  ```

- PROD

  ```sh
  # with auto renderer
  flutter build web  --flavor prod -t lib/main_prod.dart

  # with canvaskit renderer
  flutter build web --web-renderer canvaskit  --flavor prod -t lib/main_prod.dart

  # with html renderer
  flutter build web --web-renderer html  --flavor prod -t lib/main_prod.dart
  ```

  ```
  flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*
  ```
