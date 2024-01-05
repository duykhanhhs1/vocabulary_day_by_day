## Run builder

- Automatic Json Serializing in Flutter Using Json Annotation
- Auto gen the assets file
- Update DI file

```bash
# With Fvm
fvm flutter packages pub run build_runner build --delete-conflicting-outputs

# Without Fvm
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Generate assets

```bash
# Generate the locale
get generate locales

# Install Flutter Gen
dart pub global activate flutter_gen

# Gen the assets include images, icons, animations files
fluttergen -c pubspec.yaml
```

## Build Android release

```bash
# QA apk
fvm flutter build apk --release --flavor qa -t lib/main_qa.dart

# Staging apk
fvm flutter build apk --release --flavor staging -t lib/main_staging.dart

# Prod apk
fvm flutter build apk --release --flavor prod -t lib/main_prod.dart

# Prod Bundle
fvm flutter build appbundle --flavor prod -t lib/main_prod.dart
```

## Flutter pigeon

- Pigeon is a code generator tool to make communication between Flutter and the host platform
  type-safe, easier, and faster.

```bash
fvm flutter pub run pigeon \
--input lib/pigeon/[your_service_host.api].dart \
--dart_out lib/pigeon/[your_service_output].dart \
--swift_out ios/Runner/pigeon/[your_service.swift]

# Example:
fvm flutter pub run pigeon \
--input lib/pigeon/firebase_host.api.dart \
--dart_out lib/pigeon/firebase_output.dart \
--swift_out ios/Runner/pigeon/firebase.swift
```

## Code style

```bash
  # Fixed the code styles by linter (~3m)
  dart fix --apply

  ## Group imports
  flutter pub run import_sorter:main -e
```

