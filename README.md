## Wallpaper

Using the `async_wallpaper` package in Flutter allows you to set wallpapers asynchronously. This package provides an easy way to interact with wallpapers on both Android and iOS. Below is a step-by-step guide on how to use this package in your Flutter project.

### Step 1: Add the dependency

First, add the `async_wallpaper` dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  async_wallpaper: ^1.0.6 # Check for the latest version on pub.dev
```

Then, run `flutter pub get` to install the new dependency.

### Step 2: Import the package

In your Dart file, import the `async_wallpaper` package:

```dart
import 'package:async_wallpaper/async_wallpaper.dart';
```

### Step 3: Set up the function to change the wallpaper

Create a function that sets the wallpaper using the `async_wallpaper` package. Here’s an example function that sets a wallpaper from a URL:

```dart
Future<void> setWallpaper(String url) async {
  try {
    // Set wallpaper
    String result = await AsyncWallpaper.setWallpaper(
      url: url, 
      wallpaperLocation: AsyncWallpaper.HOME_SCREEN, // You can also use AsyncWallpaper.LOCK_SCREEN or AsyncWallpaper.BOTH_SCREENS
      goToHome: true // If true, it will take the user to the home screen after setting the wallpaper
    );

    print(result); // This will print 'Wallpaper set' on success
  } catch (e) {
    print(e);
  }
}
```

### Step 4: Call the function

You can call this function from a button or any other event within your Flutter app. Here’s an example using a button:

```dart
import 'package:flutter/material.dart';
import 'package:async_wallpaper/async_wallpaper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WallpaperScreen(),
    );
  }
}

class WallpaperScreen extends StatelessWidget {
  final String wallpaperUrl = 'https://example.com/wallpaper.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Wallpaper Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => setWallpaper(wallpaperUrl),
          child: Text('Set Wallpaper'),
        ),
      ),
    );
  }

  Future<void> setWallpaper(String url) async {
    try {
      String result = await AsyncWallpaper.setWallpaper(
        url: url,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
      );
      print(result);
    } catch (e) {
      print(e);
    }
  }
}
```

### Additional Options

The `AsyncWallpaper.setWallpaper` function can take several parameters:

- `url`: The URL of the image you want to set as wallpaper.
- `wallpaperLocation`: The location where you want to set the wallpaper (e.g., home screen, lock screen, or both).
- `goToHome`: Whether to navigate to the home screen after setting the wallpaper.
- `crop`: Whether to crop the image before setting it (only available on Android).

Make sure to check the package documentation for any updates or additional features: [async_wallpaper on pub.dev](https://pub.dev/packages/async_wallpaper).

By following these steps, you should be able to set a wallpaper in your Flutter app using the `async_wallpaper` package.
